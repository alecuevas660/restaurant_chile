<?php
require_once('class/class.php');
$accesos = ['administradorG', 'administradorS', 'secretaria', 'cajero', 'mesero', 'cocinero', 'bar', 'reposteria', 'repartidor'];
validarAccesos($accesos) or die();

$tra  = new Login();
$tipo = decrypt($_GET['tipo']);
switch($tipo)
{
case 'STATUSUSUARIOS':
$tra->StatusUsuarios();
break;

case 'USUARIOS':
$tra->EliminarUsuarios();
break;

case 'PROVINCIAS':
$tra->EliminarProvincias();
break;

case 'DEPARTAMENTOS':
$tra->EliminarDepartamentos();
break;

case 'DOCUMENTOS':
$tra->EliminarDocumentos();
break;

case 'TIPOMONEDA':
$tra->EliminarTipoMoneda();
break;

case 'TIPOCAMBIO':
$tra->EliminarTipoCambio();
break;

case 'MEDIOSPAGOS':
$tra->EliminarMediosPagos();
break;

case 'IMPUESTOS':
$tra->EliminarImpuestos();
break;

case 'STATUSSUCURSALES':
$tra->StatusSucursales();
break;

case 'SUCURSALES':
$tra->EliminarSucursales();
break;

case 'SALAS':
$tra->EliminarSalas();
break;

case 'ESTADOMESA':
$tra->EstadoMesas();
break;

case 'MESAS':
$tra->EliminarMesas();
break;

case 'CATEGORIAS':
$tra->EliminarCategorias();
break;

case 'MEDIDAS':
$tra->EliminarMedidas();
break;

case 'SALSAS':
$tra->EliminarSalsas();
break;

case 'CLIENTES':
$tra->EliminarClientes();
break;

case 'PROVEEDORES':
$tra->EliminarProveedores();
break;

case 'INGREDIENTES':
$tra->EliminarIngredientes();
break;

case 'PRODUCTOS':
$tra->EliminarProductos();
break;

case 'ELIMINADETALLEPRODUCTO':
$tra->EliminarDetalleProducto();
break;

case 'COMBOS':
$tra->EliminarCombos();
break;

case 'ELIMINADETALLECOMBO':
$tra->EliminarDetalleCombo();
break;

case 'COMPRAS':
$tra->EliminarCompras();
break;

case 'PAGARFACTURA':
$tra->PagarCompras();
break;

case 'DETALLESCOMPRAS':
$tra->EliminarDetallesCompras();
break;

case 'TRASPASOS':
$tra->EliminarTraspasos();
break;

case 'DETALLESTRASPASOS':
$tra->EliminarDetallesTraspasos();
break;

case 'COTIZACIONES':
$tra->EliminarCotizaciones();
break;

case 'DETALLESCOTIZACIONES':
$tra->EliminarDetallesCotizaciones();
break;

case 'CAJAS':
$tra->EliminarCajas();
break;

case 'MOVIMIENTOS':
$tra->EliminarMovimiento();
break;

case 'CERRARMESAGENERAL':
$tra->CerrarMesaGeneral();
break;

case 'CERRARMESA':
$tra->CerrarMesa();
break;

case 'ELIMINADETALLEPEDIDO':
$tra->EliminarDetallesPedido();
break;

case 'CANCELARPEDIDO':
$tra->CancelarPedido();
break;

case 'PREPARARPEDIDOCOCINERO':
$tra->PrepararPedidoCocina();
break;

case 'ENTREGARPEDIDOCOCINERO':
$tra->EntregarPedidoCocina();
break;

case 'PREPARARPEDIDOBAR':
$tra->PrepararPedidoBar();
break;

case 'ENTREGARPEDIDOBAR':
$tra->EntregarPedidoBar();
break;

case 'PREPARARPEDIDOREPOSTERIA':
$tra->PrepararPedidoReposteria();
break;

case 'ENTREGARPEDIDOREPOSTERIA':
$tra->EntregarPedidoReposteria();
break;

case 'ELIMINANOTIFICACION':
$tra->EliminarNotificaciones();
break;

case 'PEDIDODELIVERY':
$tra->EntregarPedidoDelivery();
break;

case 'VENTAS':
$tra->EliminarVentas();
break;

case 'DETALLESVENTAS':
$tra->EliminarDetallesVentas();
break;

case 'PEDIDOS':
$tra->EliminarVentas();
break;

case 'DETALLESPEDIDOS':
$tra->EliminarDetallesVentas();
break;

case 'ENTREGARPEDIDO':
$tra->EntregarPedido();
break;

case 'COBRARDELIVERY':
$tra->CobrarDelivery();
break;

}
?>