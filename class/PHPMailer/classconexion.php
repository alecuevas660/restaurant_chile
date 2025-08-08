<?php
require_once 'timezones_class.php';
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/funciones_basicas.php';

$dotenv = Dotenv\Dotenv::createUnsafeImmutable(__DIR__.'/../');
$dotenv->safeLoad();

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule();
$capsule->addConnection([
   'driver'    => 'mysql',
   'host'      => $_ENV['DB_HOST'],
   'database'  => $_ENV['DB_DATABASE'],
   'username'  => $_ENV['DB_USERNAME'],
   'password'  => $_ENV['DB_PASSWORD'],
   'charset'   => 'utf8',
   'collation' => 'utf8_unicode_ci',
   'prefix'    => '',
]);
$capsule->setAsGlobal();

class Db
{
   protected $p;
   public $dbh;

   // NOTA: Editar las configuraciones en .env
   public $carpeta;

   public function __construct()
   {
      $this->carpeta = $_ENV['CARPETA'] ?? '';

      if (!isset($this->dbh)) {
         $dbHost     = $_ENV['DB_HOST'] ?? 'localhost';
         $dbUsername = $_ENV['DB_USERNAME'] ?? 'jvdelicias_restaurantcl';
         $dbPassword = $_ENV['DB_PASSWORD'] ?? '95*QiE-fmN)w';
         $dbName     = $_ENV['DB_DATABASE'] ?? 'jvdelicias_restaurantcl';

         // Connect to the database
         $arrOptions = array(
            PDO::ATTR_EMULATE_PREPARES => FALSE, 
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, 
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'",
            PDO::ATTR_PERSISTENT         => true,
         );
         try {
            date_default_timezone_set('America/Santiago');
            setlocale(LC_ALL, 'es_VE.UTF-8', 'es_VE', 'esp');
            $conn = new PDO(
               "mysql:host=$dbHost;dbname=$dbName",
               $dbUsername,
               $dbPassword,
               $arrOptions
            );
            $this->dbh = $conn;
         } catch (PDOException $e) {
            die('Failed to connect with MySQL: ' . $e->getMessage());
         }
      }
   }

   public function SetNames()
   {
      return $this->dbh->query("SET NAMES 'utf8'");
   }
   ###### FIN DE CLASE #####
}
?>