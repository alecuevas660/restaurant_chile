<?php
require_once 'timezones_class.php';
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/funciones_basicas.php';

use Illuminate\Database\Capsule\Manager as Capsule;

// Cargar variables de entorno ANTES de cualquier conexión
$dotenv = Dotenv\Dotenv::createUnsafeImmutable(__DIR__ . '/../');
$dotenv->safeLoad();

// Detectar si estamos en Railway (usamos host privado si es así)
$isRailway = getenv('RAILWAY_PRIVATE_DOMAIN') !== false;

// Definir host y puerto según el entorno
$dbHost = $isRailway
    ? getenv('RAILWAY_PRIVATE_DOMAIN') // Privado dentro de Railway
    : ($_ENV['DB_HOST'] ?? 'mainline.proxy.rlwy.net'); // Público fuera

$dbPort = $isRailway
    ? ($_ENV['DB_PORT'] ?? 3306) // Puerto privado por defecto
    : ($_ENV['DB_PORT'] ?? 59786); // Puerto público por defecto

$dbName     = $_ENV['DB_DATABASE'] ?? 'railway';
$dbUsername = $_ENV['DB_USERNAME'] ?? 'root';
$dbPassword = $_ENV['DB_PASSWORD'] ?? '';

/**
 * Configuración de Eloquent
 */
$capsule = new Capsule();
$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => $dbHost,
    'port'      => $dbPort,
    'database'  => $dbName,
    'username'  => $dbUsername,
    'password'  => $dbPassword,
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
]);
$capsule->setAsGlobal();

class Db
{
    public $dbh;
    public $carpeta;

    public function __construct()
    {
        global $dbHost, $dbPort, $dbUsername, $dbPassword, $dbName;

        $this->carpeta = $_ENV['CARPETA'] ?? '';

        if (!isset($this->dbh)) {
            $arrOptions = [
                PDO::ATTR_EMULATE_PREPARES       => false,
                PDO::ATTR_ERRMODE                => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_INIT_COMMAND     => "SET NAMES 'utf8'",
                PDO::ATTR_PERSISTENT             => true,
            ];

            try {
                date_default_timezone_set('America/Santiago');
                setlocale(LC_ALL, 'es_VE.UTF-8', 'es_VE', 'esp');

                // DSN con host y puerto correctos
                $dsn = "mysql:host=$dbHost;port=$dbPort;dbname=$dbName;charset=utf8mb4";
                $this->dbh = new PDO($dsn, $dbUsername, $dbPassword, $arrOptions);
            } catch (PDOException $e) {
                die('Failed to connect with MySQL: ' . $e->getMessage());
            }
        }
    }

    public function SetNames()
    {
        return $this->dbh->query("SET NAMES 'utf8'");
    }
}
