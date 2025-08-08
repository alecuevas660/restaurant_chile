<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../class/classconexion.php';

use Pusher\Pusher as PusherLib;

class Pusher
{

  const EVENT_PRINT = 'print';

  private $pusher;
  private $channel;

  private $activo;
  private $sucursal;

  /**
   * @throws \Pusher\PusherException
   */
  public function __construct($codsucursal)
  {
    $sucursal       = $this->getSucursal($codsucursal);
    $this->sucursal = $sucursal;
    $this->activo   = $sucursal->impresion_directa == 1;
    // header('content-type: application/json');
    // echo json_encode($sucursal);
    // die;
    if ($this->activo) {
      $this->channel = $sucursal->pusher_channel;
      $this->pusher  = new PusherLib(
        $sucursal->pusher_key,
        $sucursal->pusher_secret,
        $sucursal->pusher_app_id,
        [
          'cluster' => $sucursal->pusher_cluster,
          'useTLS'  => true,
        ]
      );
    }
  }

  /**
   * @param array $data
   * @param Pusher::EVENT_PRINT $event
   *
   * @return bool
   */
  public function push(array $data, $event): bool
  {
    if ( ! $this->activo) return false;
    $this->pusher->trigger($this->channel, "$event-{$this->sucursal->cuitsucursal}", $data);
    return true;
  }

  private function getSucursal($codsucursal)
  {
    $dbh = (new Db)->dbh;
    return $dbh
      ->query("SELECT * FROM sucursales WHERE codsucursal=$codsucursal")
      ->fetchObject();
  }
}
