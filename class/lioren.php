<?php
require_once __DIR__ . '/classconexion.php';
require_once __DIR__ . '/../vendor/autoload.php';

use GuzzleHttp\Client;
use BigFish\PDF417\PDF417;
use BigFish\PDF417\Renderers\ImageRenderer;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Database\Capsule\Manager as Capsule;

class Lioren
{
   private const TIPO_BOLETA         = 'BOLETA';
   private const TIPO_FACTURA        = 'FACTURA';
   private const TIPO_FACTURA2       = 'FACTURA_A4';
   private const BASE_URL            = 'https://www.lioren.cl/api';

   /*############################# FACTURAS Y BOLETAS #############################*/

   /**
    * @throws GuzzleException
    */
   public function enviarVenta($codigoVenta)
   {
      $venta = $this->getVenta($codigoVenta);

      if (!$venta->sucursal->lioren_token || $venta->sucursal->lioren_token === '' || $venta->bpsii == 2)
      return false;

      switch ($venta->tipodocumento) {
         case self::TIPO_FACTURA:
            $this->enviarFactura($venta);
            break;
         case self::TIPO_FACTURA2:
            $this->enviarFactura($venta);
            break;
         case self::TIPO_BOLETA:
            $this->enviarBoleta($venta);
            break;
         default:
         throw new RuntimeException('El documento no esta soportado');
      }
      return $this->getVenta($codigoVenta);
   }

   /**
   * @throws GuzzleException
   */
   private function enviarFactura($venta): void
   {
         $cliente   = $venta->cliente;
         $detalles  = $venta->detalles->map(function ($value) {
         $exento    = $value->iva_lioren == '0.00';
         $precio    = (float)$value->precioventa;
         if (!$exento) $precio /= 1.19;
         return [
            'codigo'   => str_pad($value->codproducto, 3, '0', STR_PAD_LEFT),
            'nombre'   => $value->producto,
            'cantidad' => (int)$value->cantventa,
            'precio'   => $precio,
            'exento'   => $exento,
         ];
      });
      $data         = [
         'emisor'   => [
            'tipodoc' => '33',
            'fecha'   => date('Y-m-d', strtotime($venta->fechaventa)),
         ],
         'receptor' => [
            'rut'       => str_replace(['.', '-'], ['', ''], $cliente->dnicliente),
            'rs'        => $cliente->razoncliente,
            'giro'      => $cliente->girocliente,
            'comuna'    => (int)$cliente->codcomuna,
            'ciudad'    => (int)$cliente->codciudad,
            'direccion' => $cliente->direccliente,
         ],
         'detalles' => $detalles,
         'expects'  => 'xml',
      ];
      $responseBody = $this->enviar($data, $venta->sucursal->lioren_token, true);
      $folio        = $responseBody['folio'];
      $xml          = $responseBody['xml'];
      $trackid      = $responseBody['id'];
      $name         = "FACTURA_{$folio}.xml";
      file_put_contents(__DIR__ . "/../sii/$name", base64_decode($xml));
      $this->updateVenta([
         'codfactura'      => "{$folio}",
         'codautorizacion' => $trackid,
      ], $venta->codventa);
   }

   /**
    * @throws GuzzleException
    */
   private function enviarBoleta($venta): void
   {
      $detalles = $venta->detalles->map(function ($item) {
         return [
            // 'codigo'   => $item->codproducto,
            'nombre'   => $item->producto,
            'cantidad' => $item->cantventa,
            'precio'   => (float)$item->precioventa,
            'exento'   => $item->iva_lioren == '0.00',
         ];
      });
      $data     = [
         'emisor'   => [
            'tipodoc'  => '39',
            'servicio' => 3,
         ],
         'receptor' => [],
         'detalles' => $detalles,
         'expects'  => 'xml',
      ];

      $responseBody = $this->enviar($data, $venta->sucursal->lioren_token, false);
      $folio        = $responseBody['folio'];
      $xml          = $responseBody['xml'];
      $name         = "BOLETA_{$folio}.xml";
      file_put_contents(__DIR__ . "/../sii/$name", base64_decode($xml));
      $this->updateVenta(['codfactura' => $folio], $venta->codventa);
   }

   private function updateVenta(array $values, $codventa): void
   {
      Capsule::table('ventas')
         ->where('codventa', $codventa)
         ->update($values);
   }
   private function getVenta($codigoVenta)
   {
      $venta = Capsule::table('ventas')->where('codventa', $codigoVenta)->first();
      if ( ! $venta) throw new RuntimeException('No se pudo encontrar la venta');
      $venta->sucursal = Capsule::table('sucursales')
         ->where('codsucursal', $venta->codsucursal)->first();

      $venta->cliente = null;
      if ($venta->codcliente != '0') {
         $venta->cliente = Capsule::table('clientes', 'c')
            ->leftJoin('comunas as co', 'co.id_comuna', '=', 'c.id_comuna')
            ->leftJoin('ciudades as ci', 'ci.id_ciudad', '=', 'c.id_ciudad')
            ->where('codcliente', $venta->codcliente)
            ->first();
      }

      $venta->detalles = Capsule::table('detalleventas', 'dv')
         //->leftJoin('productos as p', 'p.idproducto', '=', 'dv.idproducto')
         ->where('dv.codventa', $codigoVenta)
         ->get(['dv.ivaproducto as iva_lioren', 'dv.codproducto', 'dv.producto', 'dv.cantventa', 'dv.precioventa', 'dv.valortotal']);
      return $venta;
   }

   /**
    * @throws Exception
    */
   public static function getTimbre($venta): ?string
   {
      if($venta['tipodocumento'] == "FACTURA_A4" && empty($venta['facturaventa'])){//SI ES FACTURA A4
         $xmlFileName = 'FACTURA_'.$venta['codfactura'];
      } elseif($venta['tipodocumento'] == "FACTURA" && empty($venta['facturaventa']) || $venta['tipodocumento'] == "BOLETA" && empty($venta['facturaventa'])){//SI ES FACTURA Y BOLETA 80MM 
         $xmlFileName = $venta['tipodocumento'].'_'.$venta['codfactura'];
      } elseif($venta['tipodocumento'] == "FACTURA" && !empty($venta['facturaventa']) || $venta['tipodocumento'] == "FACTURA_A4" && !empty($venta['facturaventa'])){//SI ES NOTA DE CREDITO EN FACTURA 
         $xmlFileName = 'FACTURA_'.$venta['facturaventa'].'_NC_'.$venta['codfactura'];
      } elseif($venta['tipodocumento'] == "BOLETA" && !empty($venta['facturaventa'])){//SI ES NOTA DE CREDITO EN BOLETA 
         $xmlFileName = 'BOLETA_'.$venta['facturaventa'].'_NC_'.$venta['codfactura'];
      } else {//SI ES BOLETA
         $xmlFileName = $venta['tipodocumento'].'_'.$venta['codfactura'];
      }
      $xmlPath     = __DIR__ . "/../sii/$xmlFileName.xml";
      if (file_exists($xmlPath)) {
         $xml  = file_get_contents($xmlPath);
         $oXml = new SimpleXMLElement($xml);
         $ted  = $oXml->Documento->TED->asXML();

         $pdf417 = new PDF417();
         $pdf417->setColumns(10);
         $data = $pdf417->encode($ted);

         $imgPath  = __DIR__ . "/../sii/$xmlFileName.png";
         $renderer = new ImageRenderer();
         $renderer->render($data)->save($imgPath);
         return $imgPath;
      }
      return null;
   }
   /*############################# FACTURAS Y BOLETAS #############################*/






   /*############################# NOTA DE CREDITO #############################*/
   /**
    * @throws GuzzleException
    * @throws JsonException
    * @throws ErrorException
    */
   public function enviarNotaCredito($codigoNotaCredito)
   {
      $notaCredito = $this->getNotaCredito($codigoNotaCredito);
      $data        = [];
      
      if (!$notaCredito->sucursal->lioren_token || $notaCredito->sucursal->lioren_token === '' || $notaCredito->bpsii == 2)
      return false;

      switch ($notaCredito->tipodocumento) {
         case self::TIPO_FACTURA:
            $data = $this->mapNotaCreditoFactura($notaCredito);
            break;
         case self::TIPO_FACTURA2:
            $data = $this->mapNotaCreditoFactura($notaCredito);
            break;
         case self::TIPO_BOLETA:
            $data = $this->mapNotaCreditoBoleta($notaCredito);
            break;
         default:
         throw new RuntimeException('Este comprobante no esta soportado');
      }

      $responseBody = $this->enviar($data, $notaCredito->sucursal->lioren_token, $notaCredito->tipodocumento == 'FACTURA' || $notaCredito->tipodocumento == "FACTURA_A4" ? true : false);
      $folio        = $responseBody['folio'];
      $xml          = $responseBody['xml'];
      $trackId      = $responseBody['id'];
      $NameTipoDocumento = ($notaCredito->tipodocumento == "FACTURA" || $notaCredito->tipodocumento == "FACTURA_A4" ? "FACTURA" : "BOLETA");
      $name         = $NameTipoDocumento."_{$notaCredito->facturaventa}_NC_{$folio}.xml";
      file_put_contents(__DIR__ . "/../sii/$name", base64_decode($xml));

      Capsule::table('notascredito')
         ->where('idnota', $notaCredito->idnota)
         ->update([
            'codfactura'    => $folio,
            'observaciones' => "LIOREN ID: {$trackId}\n" . $notaCredito->observaciones,
         ]);

      return $notaCredito;
   }

   private function getNotaCredito($codNota)
   {
      $notaCredito = Capsule::table('notascredito')->where('codnota', $codNota)->first();
      if ( ! $notaCredito) throw  new RuntimeException('No se encontró la nota de crédito');
      $notaCredito->sucursal = Capsule::table('sucursales', 'sc')
         ->leftJoin('comunas as comu', 'comu.id_comuna', '=', 'sc.id_comuna')
         ->leftJoin('ciudades as ciud', 'ciud.id_ciudad', '=', 'sc.id_ciudad')
         ->where('sc.codsucursal', $notaCredito->codsucursal)
         ->first();
            
      $notaCredito->cliente  = null;
      if ($notaCredito->codcliente !== '0') {
         $notaCredito->cliente = 
            Capsule::table('clientes', 'c')
            ->leftJoin('comunas as co', 'co.id_comuna', '=', 'c.id_comuna')
            ->leftJoin('ciudades as ci', 'ci.id_ciudad', '=', 'c.id_ciudad')
            ->where('codcliente', $notaCredito->codcliente)
            ->first();
      }
      $notaCredito->referencia = Capsule::table('ventas')->where([
         'codfactura'    => $notaCredito->facturaventa,
         'tipodocumento' => $notaCredito->tipodocumento,
      ])->first();

      $notaCredito->detalles = Capsule::table('detallenotas')->where('codnota', $codNota)->get();
      /*$notaCredito->detalles = Capsule::table('detallenotas', 'dn')
         ->leftJoin('productos as p', 'p.idproducto', '=', 'dn.idproducto')
         ->where('dn.codnota', $codNota)
         ->get(['p.ivaproducto as iva_lioren', 'dn.codproducto', 'dn.producto', 'dn.cantventa', 'dn.precioventa', 'dn.valortotal']);*/
      return $notaCredito;
   }


   private function mapNotaCreditoFactura($notaCredito)
   {
         $cliente  = $notaCredito->cliente;
         $detalles = $notaCredito->detalles->map(function ($value) {
         $exento   = $value->ivaproducto == '0.00';
         $precio   = (float)$value->precioventa;
         if (!$exento) $precio /= 1.19;
         return [
            'codigo'   => str_pad($value->codproducto, 3, '0', STR_PAD_LEFT),
            'nombre'   => $value->producto,
            'cantidad' => (int)$value->cantventa,
            'precio'   => round($precio),
            'exento'   => $exento,
         ];
      })->toArray();
      $doc      = $notaCredito->referencia;
      $data     = [
         'emisor'      => [
            'tipodoc' => '61',
            'fecha'   => fecha($notaCredito->fechanota, 'Y-m-d'),
         ],
         'receptor'    => [
            'rut'       => str_replace(['.', '-'], ['', ''], $cliente->dnicliente),
            'rs'        => $cliente->razoncliente,
            'giro'      => $cliente->girocliente,
            'comuna'    => (int)$cliente->codcomuna,
            'ciudad'    => (int)$cliente->codciudad,
            'direccion' => $cliente->direccliente,
         ],
         'referencias' => [
            [
               'fecha'   => fecha($doc->fechaventa, 'Y-m-d'),
               'tipodoc' => '33',
               'folio'   => $doc->codfactura,
               'razon'   => 1,
               'glosa'   => $notaCredito->observaciones,
            ],
         ],
         'detalles'    => $detalles,
         'expects'     => 'xml',
      ];
      return $data;
   }


   private function mapNotaCreditoBoleta($notaCredito)
   {
         $cliente  = $notaCredito->cliente;
         $detalles = $notaCredito->detalles->map(function ($value) {
         $exento   = $value->ivaproducto == '0.00';
         $precio   = (float)$value->precioventa;
         if (!$exento) $precio /= 1.19;
         return [
            'codigo'   => str_pad($value->codproducto, 3, '0', STR_PAD_LEFT),
            'nombre'   => $value->producto,
            'cantidad' => (int)$value->cantventa,
            'precio'   => round($precio),
            'exento'   => $exento,
         ];
      })->toArray();
      $doc      = $notaCredito->referencia;
      $data     = [
         'emisor'      => [
            'tipodoc' => '61',
            'fecha'   => fecha($notaCredito->fechanota, 'Y-m-d'),
            'servicio' => 3,
         ],
         'receptor'     => [
            'rut'       => '66666666-6',
            'rs'        => 'publico general',
            'giro'      => 'publico general',
            'comuna'    => (int)$notaCredito->sucursal->codcomuna,
            'ciudad'    => (int)$notaCredito->sucursal->codciudad,
            'direccion' => $notaCredito->sucursal->direcsucursal,
         ],
         'referencias' => [
            [
               'fecha'   => fecha($doc->fechaventa, 'Y-m-d'),
               'tipodoc' => '39',
               'folio'   => $doc->codfactura,
               'razon'   => 1,
               'glosa'   => $notaCredito->observaciones,
            ],
         ],
         'detalles' => $detalles,
         'expects'  => 'xml',
      ];
      return $data;
   }
   /*############################# NOTA DE CREDITO #############################*/

   /**
    * @throws GuzzleException
    * @throws JsonException
    * @throws ErrorException
    */
   public function enviar($data, $accessToken, $factura)
   {
      $postData = [
         'headers' => [
            'Accept'        => 'application/json',
            'Authorization' => 'Bearer ' . $accessToken,
            'Content-Type'  => 'application/json',
         ],
         'body'    => json_encode($data, JSON_THROW_ON_ERROR),
      ];
      
      if (isDebug()) {
         error_log('Lioren: ' . json_encode($data, JSON_THROW_ON_ERROR));
         return [
            'folio' => time(),
            'xml'   => base64_encode('<xml></xml>'),
            'id'    => time() . 'ID',
         ];
      }

      $client       = new Client();
      $response     = $client->post(
         self::BASE_URL . ($factura ? '/dtes' : '/boletas'), $postData);
      $responseBody = json_decode((string)$response->getBody(), true, 512, JSON_THROW_ON_ERROR);
      if (isset($responseBody['errors'])) {
         throw new ErrorException(
            json_encode($responseBody['errors'], JSON_THROW_ON_ERROR)
         );
      }
      return $responseBody;
   }
}