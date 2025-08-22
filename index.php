<?php
// --- Bootstrap de sesión seguro (Railway/Proxy) ---
if (($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '') === 'https') {
    $_SERVER['HTTPS'] = 'on';
    ini_set('session.cookie_secure', '1');
}
ini_set('session.save_path', '/tmp');
ini_set('session.cookie_samesite', 'Lax'); // usa 'None' solo si realmente cruzas dominios/iframe
session_name('DEMOSESS');
if (session_status() !== PHP_SESSION_ACTIVE) session_start();

require_once("class/class.php");

$tra = new Login();

// Modo NO-AJAX (si quisieras post clásico desde el form):
// if (isset($_POST["proceso"]) && $_POST["proceso"] === "login") { $tra->Logueo(); exit; }
// if (isset($_POST["proceso"]) && $_POST["proceso"] === "recuperar") { $tra->RecuperarPassword(); exit; }
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Ing. Ruben Chirinos">
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
<title></title>

<!-- CSS principal -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- jQuery (UNA sola vez y antes de tus scripts que dependen) -->
<script src="assets/script/jquery.min.js"></script>
<script src="assets/script/titulos.js"></script>
<script src="assets/script/validation.min.js"></script>

<!-- Handler de login AJAX (evita doble jQuery y GET por fallback) -->
<script>
// Espera DOM listo
document.addEventListener('DOMContentLoaded', function () {
  // Toggle entre login/recover (si tu script ya lo hace, esto no molesta)
  const toRecover = document.getElementById('to-recover');
  const toLogin   = document.getElementById('to-login');
  const loginFormWrap   = document.getElementById('loginform');
  const recoverFormWrap = document.getElementById('recoverform');
  if (toRecover) toRecover.addEventListener('click', function(e){ e.preventDefault(); loginFormWrap.style.display='none'; recoverFormWrap.style.display='block'; });
  if (toLogin)   toLogin.addEventListener('click', function(e){ e.preventDefault(); recoverFormWrap.style.display='none'; loginFormWrap.style.display='block'; });

  // Utilidad simple para mensajes
  function showMsg(targetSel, text, type) {
    var box = document.querySelector(targetSel);
    if (!box) return;
    box.innerHTML = '<div class="alert alert-'+(type||'warning')+'" role="alert" style="margin-top:10px;">'+ text +'</div>';
  }

  // LOGIN por AJAX
  const $ = window.jQuery;
  if ($) {
    $('#formlogin').on('submit', function (e) {
      e.preventDefault();
      const $btn = $('#btn-login').prop('disabled', true);
      $('#login').empty();

      $.ajax({
        url: '', // mismo archivo
        type: 'POST',
        data: $('#formlogin').serialize(),
        xhrFields: { withCredentials: true }, // necesario si cambias de dominio/origen
        success: function (r) {
          var t = String(r || '').trim();
          if (t === 'panel' || t === '/panel' || t === 'panel.php') {
            window.location.href = '/panel';
            return;
          }
          // Manejo de códigos del backend (1..5)
          switch (t) {
            case '1': showMsg('#login', 'Complete usuario y contraseña.', 'warning'); break;
            case '2': showMsg('#login', 'Usuario no existe.', 'danger'); break;
            case '3': showMsg('#login', 'Sucursal inactiva para este usuario.', 'danger'); break;
            case '4': showMsg('#login', 'Usuario inactivo.', 'danger'); break;
            case '5': showMsg('#login', 'Contraseña incorrecta.', 'danger'); break;
            default:  showMsg('#login', t ? t : 'No se pudo iniciar sesión. Intente nuevamente.', 'danger');
          }
        },
        error: function () {
          showMsg('#login', 'Error de red. Verifique su conexión.', 'danger');
        },
        complete: function () { $btn.prop('disabled', false); }
      });
    });

    // RECUPERAR por AJAX
    $('#formrecover').on('submit', function (e) {
      e.preventDefault();
      const $btn = $('#btn-recuperar').prop('disabled', true);
      $('#recover').empty();

      $.ajax({
        url: '',
        type: 'POST',
        data: $('#formrecover').serialize(),
        xhrFields: { withCredentials: true },
        success: function (r) {
          var t = String(r || '').trim();
          // adapta a tu respuesta real del backend:
          if (t === 'ok') {
            showMsg('#recover', 'Te enviamos un correo con instrucciones.', 'success');
          } else {
            showMsg('#recover', t ? t : 'No se pudo procesar la solicitud.', 'danger');
          }
        },
        error: function () {
          showMsg('#recover', 'Error de red. Inténtalo más tarde.', 'danger');
        },
        complete: function () { $btn.prop('disabled', false); }
      });
    });
  }
});
</script>

</head>
<body>
<div class="main-wrapper">
  <div class="preloader" style="display:none;">
    <div class="cssload-speeding-wheel"></div>
  </div>

  <div class="auth-wrapper d-flex no-block justify-content-center align-items-center"
       style="background:url(assets/images/bg-home.png); no-repeat center; position:absolute; height:100%; width:100%; background-size:100% 100%;">
    <div class="auth-box">

      <div id="loginform">
        <div class="logo">
          <span class="db">
            <?php
              if (file_exists("fotos/logo_login.png")) {
                echo "<img src='fotos/logo_login.png' width='80%;' height='100px;' style='border-radius:5px;' alt='Logo Principal'>";
              } else {
                echo "<img src='' width='86%;' height='64px;' alt='Logo Principal'>";
              }
            ?>
          </span>
          <h5 class="font-medium"></h5>
        </div>
        <hr>

        <div class="row">
          <div class="col-12">
            <!-- IMPORTANTE: method="post" -->
            <form class="form form-material new-lg-form" name="formlogin" id="formlogin" action="" method="post">
              <div id="login"></div>

              <div class="row">
                <div class="col-md-12 m-t-20">
                  <div class="form-group has-feedback">
                    <label class="control-label text-white">Ingrese su Usuario: <span class="symbol required"></span></label>
                    <input type="hidden" name="proceso" value="login"/>
                    <input type="text" class="form-control text-white" placeholder="Ingrese su Usuario"
                           name="usuario" id="usuario"
                           onKeyUp="this.value=this.value.toUpperCase();"
                           autocomplete="off" required aria-required="true">
                    <i class="fa fa-user form-control-feedback text-white"></i>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-lg-12">
                  <div class="form-group has-feedback">
                    <div class="campo">
                      <label class="control-label text-white">Ingrese su Password: <a class="symbol required"></a></label>
                      <input class="form-control text-white" type="password" placeholder="Ingrese su Password"
                             name="password" id="txtPassword"
                             onKeyUp="this.value=this.value.toUpperCase();"
                             autocomplete="off" required aria-required="true">
                      <span id="show_password" class="mdi mdi-eye icon text-white" onclick="MostrarPassword()"></span>
                    </div>
                    <i class="fa fa-key form-control-feedback text-white"></i>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="col-md-12">
                  <a href="#" id="to-recover" class="text-white pull-right"><i class="fa fa-lock"></i> Olvidaste tu Contraseña?</a>
                </div>
              </div>

              <div class="form-group text-center m-t-20">
                <div class="col-xs-12">
                  <span id="submit_login">
                    <button type="submit" name="btn-login" id="btn-login"
                            class="btn btn-outline-warning btn-lg btn-block waves-effect waves-light"
                            data-toggle="tooltip" data-placement="top"
                            title="" data-original-title="Haga clic aquí para iniciar sesión">
                      <span class="fa fa-sign-in"></span> Acceder
                    </button>
                  </span>
                </div>
              </div>
            </form>
          </div>
        </div>

      </div><!-- /#loginform -->

      <div id="recoverform" style="display:none;">
        <div class="logo">
          <span class="db">
            <?php
              if (file_exists("fotos/logo_login.png")) {
                echo "<img src='fotos/logo_login.png' width='80%;' height='100px;' style='border-radius:5px;' alt='Logo Principal'>";
              } else {
                echo "<img src='' width='86%;' height='64px;' alt='Logo Principal'>";
              }
            ?>
          </span>
          <h5 class="font-medium mb-3"></h5>
          <p align="center" class="text-white">Ingrese su correo electrónico para que su Nueva Clave de Acceso le sea enviada al mismo!</p>
        </div>
        <hr>

        <form class="form form-material new-lg-form" name="formrecover" id="formrecover" action="" method="post">
          <div id="recover"></div>

          <div class="row">
            <div class="col-md-12 m-t-20">
              <div class="form-group has-feedback">
                <label class="control-label text-white">Correo Electrónico: <span class="symbol required"></span></label>
                <input type="hidden" name="proceso" value="recuperar"/>
                <input type="text" class="form-control text-white" name="email" id="email"
                       onKeyUp="this.value=this.value.toUpperCase();"
                       placeholder="Ingrese su Correo Electronico" autocomplete="off" required aria-required="true"/>
                <i class="fa fa-envelope-o form-control-feedback text-white"></i>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="col-md-12">
              <a href="#" id="to-login" class="text-white pull-right"><i class="fa fa-arrow-circle-left"></i> Acceder al Sistema</a>
            </div>
          </div>

          <div class="form-group text-center m-t-20">
            <div class="col-xs-12">
              <span id="submit_password">
                <button type="submit" name="btn-recuperar" id="btn-recuperar"
                        class="btn btn-outline-warning btn-lg btn-block waves-effect waves-light">
                  <span class="fa fa-check-square-o"></span> Recuperar Password
                </button>
              </span>
            </div>
          </div>
        </form>
      </div><!-- /#recoverform -->

    </div>
  </div>
</div>

<!-- Scripts (sin recargar jQuery de nuevo) -->
<script type="text/javascript" src="assets/script/password.js"></script>
<script src="assets/js/perfect-scrollbar.js"></script>
<script src="assets/js/sparkline.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/sidebar-nav.js"></script>
<script src="assets/js/jquery_002.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>
<script src="assets/plugins/noty/themes/relax.js"></script>

</body>
</html>
