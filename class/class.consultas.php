<?php
isset($_SESSION) or session_start();
require_once("classconexion.php");

class conectorDB extends Db
{
	public function __construct()
    {
        parent::__construct();
    } 	
	
	public function EjecutarSentencia($consulta, $valores = array()){  //funcion principal, ejecuta todas las consultas
		$resultado = false;
		
		if($statement = $this->dbh->prepare($consulta)){  //prepara la consulta
			if(preg_match_all("/(:\w+)/", $consulta, $campo, PREG_PATTERN_ORDER)){ //tomo los nombres de los campos iniciados con :xxxxx
				$campo = array_pop($campo); //inserto en un arreglo
				foreach($campo as $parametro){
					$statement->bindValue($parametro, $valores[substr($parametro,1)]);
				}
			}
			try {
				if (!$statement->execute()) { //si no se ejecuta la consulta...
					print_r($statement->errorInfo()); //imprimir errores
					return false;
				}
				$resultado = $statement->fetchAll(PDO::FETCH_ASSOC); //si es una consulta que devuelve valores los guarda en un arreglo.
				$statement->closeCursor();
			}
			catch(PDOException $e){
				echo "Error de ejecución: \n";
				print_r($e->getMessage());
			}	
		}
		return $resultado;
		$this->dbh = null; //cerramos la conexión
	} /// Termina funcion consultarBD
}/// Termina clase conectorDB

class Json
{
	private $json;

	################################ BUSQUEDA DE CIUDADES ################################
	public function BuscaCiudad($filtro){
		$consulta = "SELECT CONCAT(ciudad) as label, id_ciudad FROM ciudades WHERE CONCAT(ciudad) LIKE '%".$filtro."%' ORDER BY id_ciudad ASC LIMIT 0,10";
		$conexion = new conectorDB();
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE CIUDADES ################################

	################################ BUSQUEDA DE COMUNAS ################################
	public function BuscaComuna($filtro){
		$consulta = "SELECT CONCAT(comuna) as label, id_comuna, numero FROM comunas WHERE CONCAT(comuna) LIKE '%".$filtro."%' ORDER BY id_comuna ASC LIMIT 0,10";
		$conexion = new conectorDB();
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE COMUNAS ################################

	################################ BUSQUEDA DE CATEGORIAS ################################
	public function BuscaCategoria($filtro){
    $consulta = "SELECT CONCAT(nomcategoria) as label, codcategoria FROM categorias WHERE CONCAT(nomcategoria) LIKE '%".$filtro."%' ORDER BY codcategoria ASC LIMIT 0,10";
			$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE CATEGORIAS ################################
	
	################################ BUSQUEDA DE MEDIDAS ################################
	public function BuscaMedidas($filtro){
        $consulta = "SELECT CONCAT(nommedida) as label, codmedida FROM medidas WHERE CONCAT(nommedida) LIKE '%".$filtro."%' ORDER BY codmedida ASC LIMIT 0,10";
			$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE MEDIDAS ################################


	################################ BUSQUEDA DE INGREDIENTES X SUCURSAL ################################
	public function BuscaIngredientesxSucursal($filtro,$filtro2){

		$consulta = "SELECT
		CONCAT(ingredientes.nomingrediente) as label, 
        ingredientes.idingrediente, 
        ingredientes.codingrediente, 
        ingredientes.nomingrediente, 
        ingredientes.codmedida, 
        ROUND(ingredientes.preciocompra, 0) preciocompra, 
        ROUND(ingredientes.precioventa, 0) precioventa, 
        ROUND(ingredientes.cantingrediente, 2) cantingrediente, 
        ingredientes.ivaingrediente, 
        ROUND(ingredientes.descingrediente, 0) descingrediente, 
        ingredientes.lote, 
        ingredientes.fechaexpiracion, 
        medidas.nommedida 
        FROM ingredientes 
        LEFT JOIN medidas ON ingredientes.codmedida = medidas.codmedida
        WHERE CONCAT(ingredientes.codingrediente, '',ingredientes.nomingrediente, '',medidas.nommedida) LIKE '%".$filtro."%'
        AND ingredientes.codsucursal = '".strip_tags($filtro2)."'
        ORDER BY ingredientes.nomingrediente 
        ASC LIMIT 0,1000";
		$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE INGREDIENTES X SUCURSAL ################################

	################################ BUSQUEDA DE INGREDIENTES ################################
	public function BuscaIngredientes($filtro){

        $consulta = "SELECT 
        CONCAT(ingredientes.nomingrediente) as label, 
        ingredientes.idingrediente, 
        ingredientes.codingrediente, 
        ingredientes.nomingrediente, 
        ingredientes.codmedida, 
        ROUND(ingredientes.preciocompra, 0) preciocompra, 
        ROUND(ingredientes.precioventa, 0) precioventa, 
        ROUND(ingredientes.cantingrediente, 2) cantingrediente, 
        ingredientes.ivaingrediente, 
        ROUND(ingredientes.descingrediente, 0) descingrediente, 
        ingredientes.lote, 
        ingredientes.fechaexpiracion, 
        medidas.nommedida 
        FROM ingredientes 
        LEFT JOIN medidas ON ingredientes.codmedida = medidas.codmedida 
        WHERE CONCAT(ingredientes.codingrediente, '',ingredientes.nomingrediente, '',medidas.nommedida) LIKE '%".$filtro."%' 
        AND ingredientes.codsucursal= '".strip_tags($_SESSION["codsucursal"])."' 
        ORDER BY ingredientes.nomingrediente 
        ASC LIMIT 0,1000";
        $conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE INGREDIENTES ################################



	################################ BUSQUEDA DE PRODUCTOS X SUCURSAL ################################
	public function BuscaProductosxSucursal($filtro,$filtro2){

		$consulta = "SELECT
		CONCAT(productos.producto) as label, 
        productos.idproducto, 
        productos.codproducto, 
        productos.producto, 
        productos.codcategoria, 
        ROUND(productos.preciocompra, 0) preciocompra, 
        ROUND(productos.precioventa, 0) precioventa, 
        ROUND(productos.existencia, 2) existencia, 
        productos.ivaproducto, 
        ROUND(productos.descproducto, 0) descproducto, 
        productos.preparado, 
        productos.lote, 
        productos.fechaelaboracion, 
        productos.fechaexpiracion, 
        categorias.nomcategoria 
        FROM productos 
        LEFT JOIN categorias ON productos.codcategoria=categorias.codcategoria
        WHERE CONCAT(productos.codproducto, '',productos.producto, '',productos.codigobarra, '',categorias.nomcategoria) LIKE '%".$filtro."%'
        AND productos.codsucursal = '".strip_tags($filtro2)."'
        ORDER BY productos.producto 
        ASC LIMIT 0,1000";
		$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE PRODUCTOS X SUCURSAL ################################

	################################ BUSQUEDA DE PRODUCTOS ################################
	public function BuscaProductos($filtro){

        $consulta = "SELECT 
        CONCAT(productos.producto) as label, 
        productos.idproducto, 
        productos.codproducto, 
        productos.producto, 
        productos.codcategoria, 
        ROUND(productos.preciocompra, 0) preciocompra, 
        ROUND(productos.precioventa, 0) precioventa, 
        ROUND(productos.existencia, 2) existencia, 
        productos.ivaproducto, 
        ROUND(productos.descproducto, 0) descproducto, 
        productos.preparado, 
        productos.lote, 
        productos.fechaelaboracion, 
        productos.fechaexpiracion, 
        categorias.nomcategoria 
        FROM productos 
        LEFT JOIN categorias ON productos.codcategoria=categorias.codcategoria
        WHERE CONCAT(productos.codproducto, '',productos.producto, '',productos.codigobarra, '',categorias.nomcategoria) LIKE '%".$filtro."%' 
        AND productos.codsucursal= '".strip_tags($_SESSION["codsucursal"])."' 
        ORDER BY productos.producto 
        ASC LIMIT 0,1000";
        $conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE PRODUCTOS ################################



	################################ BUSQUEDA DE COMBOS X SUCURSAL ################################
	public function BuscaCombosxSucursal($filtro,$filtro2){

		$consulta = "SELECT
		CONCAT(combos.nomcombo) as label, 
        combos.idcombo, 
        combos.codcombo, 
        combos.nomcombo, 
        ROUND(combos.preciocompra, 0) preciocompra, 
        ROUND(combos.precioventa, 0) precioventa, 
        ROUND(combos.existencia, 2) existencia, 
        combos.ivacombo, 
        ROUND(combos.desccombo, 0) desccombo, 
        combos.preparado 
        FROM combos 
        WHERE CONCAT(combos.codcombo, '',combos.nomcombo) LIKE '%".$filtro."%'
        AND combos.codsucursal = '".strip_tags($filtro2)."'
        ORDER BY combos.nomcombo 
        ASC LIMIT 0,1000";
		$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE COMBOS X SUCURSAL ################################

	################################ BUSQUEDA DE COMBOS ################################
	public function BuscaCombos($filtro){

        $consulta = "SELECT 
        CONCAT(combos.nomcombo) as label, 
        combos.idcombo, 
        combos.codcombo, 
        combos.nomcombo, 
        ROUND(combos.preciocompra, 0) preciocompra, 
        ROUND(combos.precioventa, 0) precioventa, 
        ROUND(combos.existencia, 2) existencia, 
        combos.ivacombo, 
        ROUND(combos.desccombo, 0) desccombo, 
        combos.preparado 
        FROM combos 
        WHERE CONCAT(combos.codcombo, '',combos.nomcombo) LIKE '%".$filtro."%' 
        AND codsucursal= '".strip_tags($_SESSION["codsucursal"])."' 
        ORDER BY combos.nomcombo 
        ASC LIMIT 0,1000";
        $conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE COMBOS ################################



	################################ BUSQUEDA DE CLIENTES X SUCURSAL ################################
	public function BuscaClientesxSucursal($filtro,$filtro2){

		$consulta = "SELECT
		CONCAT(if(clientes.documcliente='0','DOC.',documentos.documento), ': ',clientes.dnicliente, ': ',if(clientes.nomcliente='',clientes.razoncliente,clientes.nomcliente), ' | ',if(clientes.direccliente='','***',clientes.direccliente)) as label,  
		clientes.codcliente, 
		clientes.dnicliente,
		clientes.tipocliente,
		clientes.nomcliente,
		clientes.razoncliente,
		clientes.direccliente, 
		ROUND(clientes.limitecredito, 0) limitecredito
	    FROM
        clientes 
        LEFT JOIN documentos ON clientes.documcliente = documentos.coddocumento
        WHERE CONCAT(clientes.dnicliente, '',if(clientes.nomcliente='',clientes.razoncliente,clientes.nomcliente), '',clientes.girocliente) LIKE '%".$filtro."%'
        AND clientes.codsucursal = '".strip_tags($filtro2)."'
        ORDER BY clientes.codcliente ASC LIMIT 0,1000";
		$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE CLIENTES X SUCURSAL ################################

	################################ BUSQUEDA DE CLIENTES ################################
	public function BuscaClientes($filtro){

		$consulta = "SELECT
		CONCAT(if(clientes.documcliente='0','DOC.',documentos.documento), ': ',clientes.dnicliente, ': ',if(clientes.nomcliente='',clientes.razoncliente,clientes.nomcliente), ' | ',if(clientes.direccliente='','***',clientes.direccliente)) as label,  
		clientes.codcliente, 
		clientes.dnicliente,
		clientes.tipocliente,
		clientes.nomcliente,
		clientes.razoncliente,
		clientes.id_ciudad,
		clientes.id_comuna,
		clientes.limitecredito,
		ciudades.codciudad,
	    ciudades.ciudad,
	    comunas.codcomuna,
	    comunas.comuna,
	    if(clientes.id_ciudad='0','',ciudades.ciudad) as ciudad, 
	    if(clientes.id_comuna='0','',comunas.comuna) as comuna, 
		if(clientes.direccliente='','',clientes.direccliente) as direccliente,
		IFNULL(clientes.limitecredito-pag.montocredito,clientes.limitecredito) AS creditodisponible
	    FROM
        clientes 
        LEFT JOIN documentos ON clientes.documcliente = documentos.coddocumento
        LEFT JOIN ciudades ON clientes.id_ciudad = ciudades.id_ciudad 
		LEFT JOIN comunas ON clientes.id_comuna = comunas.id_comuna
        LEFT JOIN
	        (SELECT
	        codcliente, montocredito       
	        FROM creditosxclientes WHERE codsucursal = '".strip_tags($_SESSION['codsucursal'])."') pag ON pag.codcliente = clientes.codcliente 
        WHERE CONCAT(clientes.dnicliente, '',if(clientes.nomcliente='',clientes.razoncliente,clientes.nomcliente), '',clientes.girocliente) LIKE '%".$filtro."%'
        AND clientes.codsucursal = '".strip_tags($_SESSION['codsucursal'])."'
        GROUP BY 
        clientes.codcliente, 
        clientes.documcliente, 
        clientes.dnicliente,
        clientes.tipocliente,
        clientes.nomcliente,
        clientes.razoncliente,
		clientes.id_ciudad,
		clientes.id_comuna,
		clientes.limitecredito,
		ciudades.codciudad,
	    ciudades.ciudad,
	    comunas.codcomuna,
	    comunas.comuna,
        clientes.limitecredito,
        documentos.documento
        ORDER BY clientes.codcliente ASC LIMIT 0,1000";
		$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE CLIENTES ################################

	

	################################ BUSQUEDA DE FACTURAS X SUCURSAL ################################
	public function BuscaFacturas($filtro,$filtro2){

		$consulta = "SELECT
		CONCAT(ventas.tipodocumento, ' Nº ',ventas.codfactura, ': ',if(ventas.codcliente='0','CONSUMIDOR FINAL',if(clientes.nomcliente='',clientes.razoncliente,clientes.nomcliente))) as label, 
		ventas.idventa, 
		ventas.codventa, 
		ventas.codfactura 
		FROM ventas LEFT JOIN clientes ON ventas.codcliente = clientes.codcliente 
		WHERE CONCAT(ventas.tipodocumento, ventas.codventa, ventas.codfactura, if(ventas.codcliente='0','CONSUMIDOR FINAL',if(clientes.nomcliente='',clientes.razoncliente,clientes.nomcliente))) LIKE '%".$filtro."%'
        AND ventas.codsucursal = '".strip_tags($filtro2)."' 
		AND ventas.statusventa != 'ANULADA'
        ORDER BY ventas.codventa 
        ASC LIMIT 0,1000";
		$conexion = new conectorDB;
		$this->json = $conexion->EjecutarSentencia($consulta);
		return $this->json;
	}
	################################ BUSQUEDA DE FACTURAS X SUCURSAL ################################

}/// TERMINA CLASE  ///
?>