<?php
require_once 'timezones_class.php';
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/funciones_basicas.php';

use Illuminate\Database\Capsule\Manager as Capsule;

$dotenv = Dotenv\Dotenv::createUnsafeImmutable(__DIR__ . '/../');
$dotenv->safeLoad();

// Leer siempre con getenv()
$dbHost = getenv('DB_HOST') ?: null;
$dbPort = getenv('DB_PORT') ?: null;
$dbName = getenv('DB_DATABASE') ?: 'railway';
$dbUser = getenv('DB_USERNAME') ?: 'root';
$dbPass = getenv('DB_PASSWORD') ?: '';

// Si no hay DB_HOST y estamos dentro de Railway, usar el host privado por defecto
if (!$dbHost && getenv('RAILWAY_PRIVATE_DOMAIN')) {
    $dbHost = 'mysql.railway.internal';
    $dbPort = $dbPort ?: 3306;
}

// Fallback para desarrollo/local
$dbHost = $dbHost ?: 'mainline.proxy.rlwy.net';
$dbPort = $dbPort ?: 59786;

$capsule = new Capsule();
$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => $dbHost,
    'port'      => $dbPort,
    'database'  => $dbName,
    'username'  => $dbUser,
    'password'  => $dbPass,
    'charset'   => 'utf8mb4',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
]);
$capsule->setAsGlobal();
$capsule->bootEloquent();

class Db
{
    public $dbh;
    public $carpeta;

    public function __construct()
    {
        global $dbHost, $dbPort, $dbUser, $dbPass, $dbName;
        $this->carpeta = getenv('CARPETA') ?: '';

        if (!isset($this->dbh)) {
            $arrOptions = [
                PDO::ATTR_EMULATE_PREPARES   => false,
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'",
                PDO::ATTR_PERSISTENT         => true,
            ];

            try {
                date_default_timezone_set('America/Santiago');
                setlocale(LC_ALL, 'es_VE.UTF-8', 'es_VE', 'esp');

                $dsn = "mysql:host={$dbHost};port={$dbPort};dbname={$dbName};charset=utf8mb4";
                $this->dbh = new PDO($dsn, $dbUser, $dbPass, $arrOptions);
            } catch (PDOException $e) {
                error_log("DB connection error: host={$dbHost} port={$dbPort} msg={$e->getMessage()}");
                die('Failed to connect with MySQL. Check logs.');
            }
        }
    }

    public function SetNames()
    {
        return $this->dbh->query("SET NAMES 'utf8'");
    }
}
