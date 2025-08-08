<?php

namespace Core\sentry;

use function Sentry\captureLastError;
use function Sentry\init;

final class Sentry
{

  private static $instance;

  public function __construct()
  {
    if (isset($_ENV['SENTRY_DSN'])) {
      init(['dsn' => $_ENV['SENTRY_DSN']]);
    }
  }

  public static function init(): Sentry
  {
    if ( ! isset(self::$instance)) self::$instance = new self();
    return self::$instance;
  }


}
