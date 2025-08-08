<?php
require_once('class/class.php');
$accesos = ['administradorG', 'administradorS', 'secretaria'];
validarAccesos($accesos) or die();

$tra = new Login();

if(isset($_POST["proceso"]) and $_POST["proceso"]=="save")
{
    $reg = $tra->RegistrarDocumentos();
    exit;
}
elseif(isset($_POST["proceso"]) and $_POST["proceso"]=="update")
{
    $reg = $tra->ActualizarDocumentos();
    exit;
}          
?>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Ing. Ruben Chirinos">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title></title>

    <!-- Menu CSS -->
    <link href="assets/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="assets/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- Datatables CSS -->
    <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/datatables.css">
    <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/custom_dt_html5.css">
    <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/dt-global_style.css">
    <!-- Sweet-Alert -->
    <link rel="stylesheet" href="assets/css/sweetalert.css">
    <!-- animation CSS -->
    <link href="assets/css/animate.css" rel="stylesheet">
    <!-- needed css -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="assets/css/default.css" id="theme" rel="stylesheet">
    <!-- color alert -->
    <link rel="stylesheet" type="text/css" href="assets/css/alert.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body onLoad="muestraReloj(); getTime();" class="fix-header">
    
   <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>

    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-boxed-layout="full" data-header-position="fixed" data-sidebar-position="fixed" class="mini-sidebar"> 
 

<!--############################## MODAL PARA GESTION DE DOCUMENTOS ######################################-->
<!-- sample modal content -->
<div id="myModalDocumento" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h4 class="modal-title text-white" id="myModalLabel"><i class="fa fa-save"></i> Gestión de Documentos</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="assets/images/close.png"/></button>
            </div>
            
        <form class="form form-material" method="post" action="#" name="savedocumento" id="savedocumento">
                
        <div class="modal-body">

        <div id="save">
        <!-- error will be shown here ! -->
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group has-feedback">
                    <label class="control-label">Nombre de Documento: <span class="symbol required"></span></label>
                    <input type="hidden" name="proceso" id="proceso" value="save"/>
                    <input type="hidden" name="coddocumento" id="coddocumento">
                    <input type="text" class="form-control" name="documento" id="documento" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Nombre de Documento" autocomplete="off" required="" aria-required="true"/> 
                    <i class="fa fa-pencil form-control-feedback"></i> 
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group has-feedback">
                    <label class="control-label">Descripción de Documento: <span class="symbol required"></span></label>
                    <input type="text" class="form-control" name="descripcion" id="descripcion" onKeyUp="this.value=this.value.toUpperCase();" placeholder="Ingrese Descripción de Documento" autocomplete="off" required="" aria-required="true"/> 
                    <i class="fa fa-pencil form-control-feedback"></i> 
                </div>
            </div>
        </div>

        </div>

        <div class="modal-footer">
            <button type="submit" name="btn-submit" id="btn-submit" class="btn btn-warning"><span class="fa fa-save"></span> Guardar</button>
            <button class="btn btn-dark" type="button" onclick="
            document.getElementById('coddocumento').value = '',
            document.getElementById('documento').value = '',
            document.getElementById('descripcion').value = ''
            " data-dismiss="modal" aria-hidden="true"><span class="fa fa-trash-o"></span> Cancelar</button>
        </div>
        </form>

    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal --> 
<!--############################## MODAL PARA GESTION DE DOCUMENTOS ######################################-->

    
        <!-- INICIO DE MENU -->
        <?php include('menu.php'); ?>
        <!-- FIN DE MENU -->
   

        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb border-bottom">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-xs-12 align-self-center">
                    <h5 class="font-medium text-uppercase mb-0"><i class="fa fa-tasks"></i> Documentos</h5>
                    </div>
                    <div class="col-lg-9 col-md-8 col-xs-12 align-self-center">
                        <nav aria-label="breadcrumb" class="mt-2 float-md-right float-left">
                            <ol class="breadcrumb mb-0 justify-content-end p-0">
                                <li class="breadcrumb-item">Administración</li>
                                <li class="breadcrumb-item active" aria-current="page">Documentos</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="page-content container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->

<!-- Row -->
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header bg-warning">
                <h4 class="card-title text-white"><i class="fa fa-tasks"></i> Control de Documentos</h4>
            </div>

            <div class="form-body">

            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                      <div class="btn-group m-b-20">
                        <button type="button" class="btn btn-success btn-light" data-placement="left" title="Nuevo Documento" data-original-title="" data-href="#" data-toggle="modal" data-target="#myModalDocumento" data-backdrop="static" data-keyboard="false"><i class="fa fa-plus"></i> Nuevo</button>

                        <a class="btn waves-effect waves-light btn-light" href="reportepdf?tipo=<?php echo encrypt("DOCUMENTOS") ?>" target="_blank" rel="noopener noreferrer"  data-toggle="tooltip" data-placement="bottom" title="Exportar Pdf"><span class="fa fa-file-pdf-o text-dark"></span> Pdf</a>

                        <a class="btn waves-effect waves-light btn-light" href="reporteexcel?documento=<?php echo encrypt("EXCEL") ?>&tipo=<?php echo encrypt("DOCUMENTOS") ?>" data-toggle="tooltip" data-placement="bottom" title="Exportar Excel"><span class="fa fa-file-excel-o text-dark"></span> Excel</a>

                        <a class="btn waves-effect waves-light btn-light" href="reporteexcel?documento=<?php echo encrypt("WORD") ?>&tipo=<?php echo encrypt("DOCUMENTOS") ?>" data-toggle="tooltip" data-placement="bottom" title="Exportar Word"><span class="fa fa-file-word-o text-dark"></span> Word</a>
                    </div>
                </div>
            </div>

            <div id="documentos"></div>

            </div>
        </div>
     </div>
  </div>
</div>
<!-- End Row -->
 
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                <i class="fa fa-copyright"></i> <span class="current-year"></span>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
   

    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/script/jquery.min.js"></script> 
    <script src="assets/js/bootstrap.js"></script>
    <!-- apps -->
    <script src="assets/js/app.min.js"></script>
    <script src="assets/js/app.init.horizontal-fullwidth.js"></script>
    <script src="assets/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/js/perfect-scrollbar.js"></script>
    <script src="assets/js/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!-- Sweet-Alert -->
    <script src="assets/js/sweetalert-dev.js"></script>
    <!--Menu sidebar -->
    <script src="assets/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/js/custom.js"></script>

    <!-- script jquery -->
    <script type="text/javascript" src="assets/script/titulos.js"></script>
    <script type="text/javascript" src="assets/script/script2.js"></script>
    <script type="text/javascript" src="assets/script/validation.min.js"></script>
    <script type="text/javascript" src="assets/script/script.js"></script>
    <link rel="stylesheet" href="assets/calendario/jquery-ui.css" />
    <script src="assets/calendario/jquery-ui.js"></script>
    <!-- script jquery -->

    <!-- jQuery -->
    <script src="assets/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>
    <script src="assets/plugins/noty/themes/relax.js"></script>
    <script type="text/jscript">
    $('#documentos').append('<center><i class="fa fa-spin fa-spinner"></i> Por favor espere, cargando registros ......</center>').fadeIn("slow");
    setTimeout(function() {
    $('#documentos').load("consultas?CargaDocumentos=si");
     }, 200);
    </script>
    <!-- jQuery -->
    
</body>
</html>