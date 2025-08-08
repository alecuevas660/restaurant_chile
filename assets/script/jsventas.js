function Separador(val) {
    return String(val).split("").reverse().join("")
    .replace(/(.{3}\B)/g, "$1.")
    .split("").reverse().join("");
}

function Separador2(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function DoAction(idproducto, codproducto, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado) {
    addItem(idproducto, codproducto, 1, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado, '+=');
}

// ####################### FUNCION PARA ASIGNAR DESCUENTO A DETALLES #######################
function DoActionDescuento(idproducto, codproducto, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado) 
{
    addItem(idproducto, codproducto, 0.00, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado, '+=');
}

function AsignaDescuento(codigo,tipo,cantidad,precio2,descproducto,observacion,salsa)
{
  $("#agregadescuento #d_codigo").val(codigo);
  $("#agregadescuento #agrega_detalle_descuento").load("detalles_mesas?BuscaDetallesProductoxDescuento=si&d_codigo="+codigo+"&d_tipo="+tipo+"&d_cantidad="+cantidad+"&d_precio="+precio2+"&d_descproducto="+descproducto+"&d_observacion="+observacion+"&d_salsa="+salsa);
}
// ####################### FUNCION PARA ASIGNAR DESCUENTO A DETALLES #######################

// ####################### FUNCION PARA ASIGNAR OBSERVACION A DETALLES #######################
function DoActionObservacion(idproducto, codproducto, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado) {
    
    addItem(idproducto, codproducto, 0.00, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado, '+=');
}

function AsignaObservacion(codigo,tipo,cantidad,precio2,descproducto,observacion,salsa){

  $("#agregaobservaciones #d_codigo").val(codigo);
  $("#agregaobservaciones #agrega_detalle_observacion").load("detalles_mesas?BuscaDetallesProductoxObservacion=si&d_codigo="+codigo+"&d_tipo="+tipo+"&d_cantidad="+cantidad+"&d_precio="+precio2+"&d_descproducto="+descproducto+"&d_observacion="+observacion+"&d_salsa="+salsa);
}
// ####################### FUNCION PARA ASIGNAR OBSERVACION A DETALLES #######################

// ####################### FUNCION PARA ASIGNAR SALSAS A DETALLES #######################
function DoActionSalsa(idproducto, codproducto, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado) 
{
    addItem(idproducto, codproducto, 0.00, producto, codcategoria, categorias, preciocompra, precioventa, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado, '+=');
}

function AsignaSalsa(codigo,tipo,cantidad,precio2,descproducto,observacion,salsa)
{
  $("#agregasalsas #d_codigo").val(codigo);
  $("#agregasalsas #agrega_detalle_salsa").load("detalles_mesas?BuscaDetallesProductoxSalsa=si&d_codigo="+codigo+"&d_tipo="+tipo+"&d_cantidad="+cantidad+"&d_precio="+precio2+"&d_descproducto="+descproducto+"&d_observacion="+observacion+"&d_salsa="+salsa);
}
// ####################### FUNCION PARA ASIGNAR SALSAS A DETALLES #######################

function pulsar(e, valor) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 13) comprueba(valor)
}


$(document).ready(function() {

    $("#busquedaproducto").keypress(function(e) {
        if (e.charCode == 13 || e.keyCode == 13) { //ENTER

            var code = $('input#codproducto').val();
            var prod = $('input#producto').val();
            var cantp = $('input#cantidad').val();
            var exist = $('input#existencia').val();
            var prec = $('input#preciocompra').val();
            var prec2 = $('input#precioventa').val();
            var descuen = $('input#descproducto').val();
            var ivgprod = $('input#ivaproducto').val();
            var er_num = /^([0-9])*[.]?[0-9]*$/;
            cantp = parseInt(cantp);
            exist = parseInt(exist);
            cantp = cantp;

            if (code == "") {
                $("#busquedaproducto").focus();
                $("#busquedaproducto").css('border-color', '#f0ad4e');
                swal("Oops", "POR FAVOR REALICE LA BÚSQUEDA DEL PRODUCTO CORRECTAMENTE!", "error");
                return false;

            } else if ($('#cantidad').val() == "" || $('#cantidad').val() == "0") {
                $("#cantidad").focus();
                $("#cantidad").css('border-color', '#f0ad4e');
                swal("Oops", "POR FAVOR INGRESE UNA CANTIDAD VÁLIDA EN VENTAS!", "error");
                return false;

            } else if (isNaN($('#cantidad').val())) {
                $("#cantidad").focus();
                $("#cantidad").css('border-color', '#f0ad4e');
                swal("Oops", "POR FAVOR INGRESE SOLO DIGITOS EN CANTIDAD DE VENTAS!", "error");
                return false;
                
           } else if(cantp > exist){
                $("#cantidad").focus();
                $('#cantidad').css('border-color','#f0ad4e');
                $("#existencia").focus();
                $('#existencia').css('border-color','#f0ad4e');
                swal("Oops", "LA CANTIDAD DE PRODUCTOS SOLICITADA NO EXISTE EN ALMACEN, VERIFIQUE NUEVAMENTE POR FAVOR!", "error");
                return false;

            } else {

                var Carrito = new Object();
                Carrito.Id = $('input#idproducto').val();
                Carrito.Codigo = $('input#codproducto').val();
                Carrito.Producto = $('input#producto').val();
                Carrito.Codcategoria = $('input#codcategoria').val();
                Carrito.Categorias = $('input#categorias').val();
                Carrito.Precio      = $('input#preciocompra').val();
                Carrito.Precio2      = $('input#precioventa').val();
                Carrito.Descproducto      = $('input#descproducto').val();
                Carrito.Ivaproducto = ($('input#ivaproducto').val() == "SI" ? $('input#iva').val() : "(E)");
                Carrito.Existencia = $('input#existencia').val();
                Carrito.Precioconiva = $('input#precioconiva').val();
                Carrito.Tipo = $('input#tipo').val();
                Carrito.Observacion = $('input#observacion').val();
                Carrito.Salsa = $('input#salsa').val();
                Carrito.Preparado = $('input#preparado').val();
                Carrito.Cantidad = $('input#cantidad').val();
                Carrito.opCantidad = '+=';
                var DatosJson = JSON.stringify(Carrito);
                $.post('carritoventa.php', {
                        MiCarrito: DatosJson
                    },
                function(data, textStatus) {
                    $("#carrito tbody").html("");
                    var contador = 0;
                    var OperacionItems = 0;
                    var TotalDescuento = 0;
                    var SubtotalFact = 0;
                    var BaseImpIva = 0;
                    var BaseImpIva2 = 0;
                    var TotalIvaGeneral = 0;
                    var TotalCompra = 0;

                    $.each(data, function(i, item) {
                        var cantsincero = item.cantidad;
                        cantsincero = parseFloat(cantsincero);
                        if (cantsincero != 0) {
                            contador = contador + 1;

                //CALCULO DEL TOTAL DE ITEMS
                var Items= parseFloat(cantsincero);
                OperacionItems = parseFloat(OperacionItems) + parseFloat(Items);

                //CALCULO DEL TOTAL DE COMPRAS
                var OperacionCompra= parseFloat(item.precio) * parseFloat(item.cantidad);
                TotalCompra = parseFloat(TotalCompra) + parseFloat(OperacionCompra);

                //CALCULO DEL VALOR TOTAL
                var ValorTotal= parseFloat(item.precio2) * parseFloat(item.cantidad);

                //CALCULO DEL TOTAL DEL DESCUENTO %
                var DetalleDescuento = ValorTotal * item.descproducto / 100;
                TotalDescuento = parseFloat(TotalDescuento) + parseFloat(DetalleDescuento);

                //OBTENEMOS DESCUENTO INDIVIDUAL POR PRODUCTOS
                var descsiniva = item.precio2 * item.descproducto / 100;
                var descconiva = item.precioconiva * item.descproducto / 100;

                 //CALCULO DE BASE IMPONIBLE IVA SIN PORCENTAJE
                var Operac= parseFloat(item.precio2) - parseFloat(descsiniva);
                var Operacion= parseFloat(Operac) * parseFloat(item.cantidad);
                Subtotal = Operacion.toFixed(2);

                //CALCULO DE BASE IMPONIBLE IVA CON PORCENTAJE
                var Operac3 = parseFloat(item.precioconiva) - parseFloat(descconiva);
                var Operacion3 = parseFloat(Operac3) * parseFloat(item.cantidad);
                var Subbaseimponiva = Operacion3.toFixed(2);

                //CALCULO GENERAL DE IVA CON BASE IVA * IVA %
                var ivg = $('input#iva').val();
                ivg2  = ivg;

                //CALCULO VALOR DISCRIMINADO
                var ValorImpuesto = (ivg2 <= 9) ? "1.0"+parseInt(ivg2) : "1."+parseInt(ivg2);
                var Discriminado = parseFloat(Operac3) / ValorImpuesto;
                var SubtotalDiscriminado = parseFloat(Operac3) - parseFloat(Discriminado);
                var BaseDiscriminado = parseFloat(SubtotalDiscriminado) * parseFloat(item.cantidad);
                TotalIvaGeneral = parseFloat(TotalIvaGeneral) + parseFloat(BaseDiscriminado);

                //BASE IMPONIBLE IVA CON PORCENTAJE
                BaseImpIva = parseFloat(BaseImpIva) + parseFloat(Subbaseimponiva);
                BaseImpIva1 = parseFloat(BaseImpIva) - parseFloat(TotalIvaGeneral);
                
                //BASE IMPONIBLE IVA SIN PORCENTAJE
                BaseImpIva2 = (item.ivaproducto != "(E)") ? BaseImpIva2 : parseFloat(BaseImpIva2) + parseFloat(Subtotal);
                
                //CALCULAMOS DESCUENTO POR PRODUCTO
                var desc = $('input#descuento').val();
                desc2  = desc/100;
                
                //CALCULO DEL TOTAL DE FACTURA
                SubTotalTxt = parseFloat(BaseImpIva1) + parseFloat(BaseImpIva2);
                Total = parseFloat(BaseImpIva1) + parseFloat(BaseImpIva2) + parseFloat(TotalIvaGeneral);
                TotalDescuentoGeneral   = parseFloat(Total.toFixed(2)) * parseFloat(desc2.toFixed(2));
                TotalFactura   = parseFloat(Total.toFixed(2)) - parseFloat(TotalDescuentoGeneral.toFixed(2));

                var nuevaFila =
                "<tr class='warning-element' style='border-left: 2px solid #ffb22b !important; background: #fefde3;'>" +
                    "<td width='18%' class='m-t-0'>" +
                    '<button class="btn btn-sm" style="cursor:pointer;border-radius:5px 0px 0px 5px;background-color:#cd874a;" onclick="addItem(' +
                    "'" + item.id + "'," +
                    "'" + item.txtCodigo + "'," +
                    "'-1'," +
                    "'" + item.producto + "'," +
                    "'" + item.codcategoria + "'," +
                    "'" + item.categorias + "'," +
                    "'" + item.precio + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + item.ivaproducto + "', " +
                    "'" + item.existencia + "', " +
                    "'" + item.precioconiva + "', " +
                    "'" + item.tipo + "', " +
                    "'" + item.observacion + "', " +
                    "'" + item.salsa + "', " +
                    "'" + item.preparado + "', " +
                    "'-'" +
                    ')"' +
                    " type='button'><span class='fa fa-minus'></span></button>" +
                    "<input type='text' id='" + item.cantidad + "' class='bold' style='width:40px;height:25px;border:#f9d655;' value='" + item.cantidad + "'>" +
                    '<button class="btn btn-sm" style="cursor:pointer;border-radius:0px 5px 5px 0px;background-color:#cd874a;" onclick="addItem(' +
                    "'" + item.id + "'," +
                    "'" + item.txtCodigo + "'," +
                    "'+1'," +
                    "'" + item.producto + "'," +
                    "'" + item.codcategoria + "'," +
                    "'" + item.categorias + "'," +
                    "'" + item.precio + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + item.ivaproducto + "', " +
                    "'" + item.existencia + "', " +
                    "'" + item.precioconiva + "', " +
                    "'" + item.tipo + "', " +
                    "'" + item.observacion + "', " +
                    "'" + item.salsa + "', " +
                    "'" + item.preparado + "', " +
                    "'+'" +
                    ')"' +
                    " type='button'><span class='fa fa-plus'></span></button></div></div></td>" +
                    "<td width='46%' class='text-left m-t-0'><abbr title='" + (item.codcategoria == '' || item.codcategoria == '0' ? '******' : item.categorias) + "'><h6 class='alert-link'>" + item.producto + "</h6></abbr>" + (item.observacion == "" || item.observacion == ", " ? "" : "<span class='badge badge-pill badge-warning alert-link'>" + item.observacion + "</span>") + "" + (item.salsa == "" || item.salsa == ", " ? "" : "</span><span class='badge badge-pill badge-info alert-link'>" + item.salsa + "</span>" ) + "</td>" +
                    "<td width='12%' class='m-t-0'><h6 class='alert-link'>" + Separador(Math.round(item.precio2)) + "</h6></td>" +
                    "<td width='14%' class='m-t-0'><h6 class='alert-link'>" + Separador(Math.round(Operacion.toFixed(2))) + "</h6></td>" +
                    "<td width='10%' class='m-t-0'>" +
                    
                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="AsignaDescuento(' +
                    "'" + item.txtCodigo + "'," +
                    "'" + item.tipo + "'," +
                    "'" + item.cantidad + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + (item.observacion == "" || item.observacion == ", " ? "" : item.observacion.replace(/\s/g,"_")) + "', " +
                    "'" + (item.salsa == "" || item.salsa == ", " ? "" : item.salsa.replace(/\s/g,"_")) + "'" +
                    ')"' +
                    ' data-original-title="" data-href="#" data-toggle="modal" data-target="#myModalDescuento" data-backdrop="static" data-keyboard="false" class="mdi mdi-pencil font-24"></span>' +

                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="AsignaObservacion(' +
                    "'" + item.txtCodigo + "'," +
                    "'" + item.tipo + "'," +
                    "'" + item.cantidad + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + (item.observacion == "" || item.observacion == ", " ? "" : item.observacion.replace(/\s/g,"_")) + "', " +
                    "'" + (item.salsa == "" || item.salsa == ", " ? "" : item.salsa.replace(/\s/g,"_")) + "'" +
                    ')"' +
                    ' data-original-title="" data-href="#" data-toggle="modal" data-target="#myModalObservacion" data-backdrop="static" data-keyboard="false" class="mdi mdi-comment-text-outline font-24"></span>' +

                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="AsignaSalsa(' +
                    "'" + item.txtCodigo + "'," +
                    "'" + item.tipo + "'," +
                    "'" + item.cantidad + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + (item.observacion == "" || item.observacion == ", " ? "" : item.observacion.replace(/\s/g,"_")) + "', " +
                    "'" + (item.salsa == "" || item.salsa == ", " ? "" : item.salsa.replace(/\s/g,"_")) + "'" +
                    ')"' +
                    ' data-original-title="" data-href="#" data-toggle="modal" data-target="#myModalSalsa" data-backdrop="static" data-keyboard="false" class="mdi mdi-food-variant font-24"></span>' +
                    
                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="addItem(' +
                    "'" + item.id + "'," +
                    "'" + item.txtCodigo + "'," +
                    "'0'," +
                    "'" + item.producto + "'," +
                    "'" + item.codcategoria + "'," +
                    "'" + item.categorias + "'," +
                    "'" + item.precio + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + item.ivaproducto + "', " +
                    "'" + item.existencia + "', " +
                    "'" + item.precioconiva + "', " +
                    "'" + item.tipo + "', " +
                    "'" + item.observacion + "', " +
                    "'" + item.salsa + "', " +
                    "'" + item.preparado + "', " +
                    "'='" +
                    ')"' +
                    ' class="mdi mdi-delete font-24"></span>' +"</td>" +
                    "</tr>";

                    $(nuevaFila).appendTo("#carrito tbody");
                                
                        $("#lblitems").text(Separador2(OperacionItems.toFixed(2)));
                        $("#labelsubtotal").text(Separador(Math.round(SubTotalTxt.toFixed(2))));
                        $("#lblsubtotal").text(Separador(Math.round(BaseImpIva1.toFixed(2))));
                        $("#lblsubtotal2").text(Separador(Math.round(BaseImpIva2.toFixed(2))));
                        $("#lbliva").text(Separador(Math.round(TotalIvaGeneral.toFixed(2))));
                        $("#lbldescontado").text(Separador(Math.round(TotalDescuento.toFixed(2))));
                        $("#lbldescuento").text(Separador(Math.round(TotalDescuentoGeneral.toFixed(2))));
                        $("#lbltotal").text(Separador(Math.round(TotalFactura.toFixed(2))));

                        $("#txtsubtotal").val(Math.round(BaseImpIva1.toFixed(2)));
                        $("#txtsubtotal2").val(Math.round(BaseImpIva2.toFixed(2)));
                        $("#txtIva").val(Math.round(TotalIvaGeneral.toFixed(2)));
                        $("#txtdescontado").val(Math.round(TotalDescuento.toFixed(2)));
                        $("#txtDescuento").val(Math.round(TotalDescuentoGeneral.toFixed(2)));
                        $("#txtTotal").val(Math.round(TotalFactura.toFixed(2)));
                        $("#txtTotalCompra").val(Math.round(TotalCompra.toFixed(2)));

                        /*####### ACTIVAR BOTON DE PAGO #######*/
                        $("#TextImporte").text(Separador(Math.round(TotalFactura.toFixed(2))));
                        $("#TextPagado").text(Separador(Math.round(TotalFactura.toFixed(2))));
                        $("#montopagado").val(Math.round(TotalFactura.toFixed(2)));

                        }
                    });

                    $("#busquedaproducto").focus();
                    LimpiarTexto();
                },
                "json"
            );
            return false;
        }
    }
});

/* CANCELAR LOS ITEM AGREGADOS EN REGISTRO */
$(document).ready(function() {
    $("#vaciar").click(function() {
        var Carrito = new Object();
        Carrito.Id = "vaciar";
        Carrito.Codigo = "vaciar";
        Carrito.Producto = "vaciar";
        Carrito.Codcategoria = "vaciar";
        Carrito.Categorias = "vaciar";
        Carrito.Precio      = "0";
        Carrito.Precio2      = "0";
        Carrito.Descproducto      = "0";
        Carrito.Ivaproducto = "vaciar";
        Carrito.Existencia = "vaciar";
        Carrito.Precioconiva      = "0";
        Carrito.Tipo      = "vaciar";
        Carrito.Observacion      = "vaciar";
        Carrito.Salsa      = "vaciar";
        Carrito.Preparado      = "vaciar";
        Carrito.Cantidad = "0";
        var DatosJson = JSON.stringify(Carrito);
        $.post('carritoventa.php', {
                MiCarrito: DatosJson
            },
            function(data, textStatus) {
                $("#carrito tbody").html("");
                var nuevaFila =
         "<tr class='warning-element' style='border-left: 2px solid #ffb22b !important; background: #fefde3;'>"+"<td class='text-center' colspan=5><h4>NO HAY DETALLES AGREGADOS</h4></td>"+"</tr>";
                $(nuevaFila).appendTo("#carrito tbody");
                LimpiarTexto();
            },
            "json"
        );
        return false;
    });
});


$(document).ready(function() {
    $('#vaciar').click(function() {
        $("#carrito tbody").html("");
        var nuevaFila =
        "<tr class='warning-element' style='border-left: 2px solid #ffb22b !important; background: #fefde3;'>"+"<td class='text-center' colspan=5><h4>NO HAY DETALLES AGREGADOS</h4></td>"+"</tr>";
        $(nuevaFila).appendTo("#carrito tbody");
        $("#saveventas")[0].reset();
        $("#codcliente").val("0");
        $("#nrodocumento").val("0");
        $("#busqueda").val("CONSUMIDOR FINAL");
        $("#lblitems").text("0.00");
        $("#labelsubtotal").text("0");
        $("#lblsubtotal").text("0");
        $("#lblsubtotal2").text("0");
        $("#lbliva").text("0");
        $("#lbldescontado").text("0");
        $("#lbldescuento").text("0");
        $("#lbltotal").text("0");

        $("#txtsubtotal").val("0");
        $("#txtsubtotal2").val("0");
        $("#txtIva").val("0");
        $("#txtdescontado").val("0");
        $("#txtDescuento").val("0");
        $("#txtTotal").val("0");

        /*####### ACTIVAR BOTON DE PAGO #######*/
        $("#TextImporte").text("0");
        $("#TextPagado").text("0");
        $("#TextCambio").text("0");
        $('#TextCliente').text("Consumidor Final");
        $('#TextCredito').text("0");
        $("#montopagado").val("0");
    });
});

/* CANCELAR LOS ITEM AGREGADOS EN REGISTRO */
$(document).ready(function() {
    $("#boton").click(function() {
        var Carrito = new Object();
        Carrito.Id = "vaciar";
        Carrito.Codigo = "vaciar";
        Carrito.Producto = "vaciar";
        Carrito.Codcategoria = "vaciar";
        Carrito.Categorias = "vaciar";
        Carrito.Precio      = "0";
        Carrito.Precio2      = "0";
        Carrito.Descproducto      = "0";
        Carrito.Ivaproducto = "vaciar";
        Carrito.Existencia = "vaciar";
        Carrito.Precioconiva      = "0";
        Carrito.Tipo      = "vaciar";
        Carrito.Observacion      = "vaciar";
        Carrito.Salsa      = "vaciar";
        Carrito.Preparado      = "vaciar";
        Carrito.Cantidad = "0";
        var DatosJson = JSON.stringify(Carrito);
        $.post('carritoventa.php', {
                MiCarrito: DatosJson
            },
            function(data, textStatus) {
                $("#carrito tbody").html("");
                var nuevaFila =
         "<tr class='warning-element' style='border-left: 2px solid #ffb22b !important; background: #fefde3;'>"+"<td class='text-center' colspan=5><h4>NO HAY DETALLES AGREGADOS</h4></td>"+"</tr>";
                $(nuevaFila).appendTo("#carrito tbody");
                LimpiarTexto();
            },
            "json"
        );
        return false;
    });
});


$(document).ready(function() {
    $('#boton').click(function() {
        $("#carrito tbody").html("");
        var nuevaFila =
        "<tr class='warning-element' style='border-left: 2px solid #ffb22b !important; background: #fefde3;'>"+"<td class='text-center' colspan=5><h4>NO HAY DETALLES AGREGADOS</h4></td>"+"</tr>";
        $(nuevaFila).appendTo("#carrito tbody");
        $("#saveventas")[0].reset();
        $("#codcliente").val("0");
        $("#nrodocumento").val("0");
        $("#busqueda").val("CONSUMIDOR FINAL");
        //$("#codcliente").val(($("#codcliente").val() == 0) ? "0" : $("#codcliente").val());
        //$("#busqueda").val(($("#busqueda").val() == "") ? "CONSUMIDOR FINAL" : $("#busqueda").val());
        $("#lblitems").text("0.00");
        $("#labelsubtotal").text("0");
        $("#lblsubtotal").text("0");
        $("#lblsubtotal2").text("0");
        $("#lbliva").text("0");
        $("#lbldescontado").text("0");
        $("#lbldescuento").text("0");
        $("#lbltotal").text("0");

        $("#txtsubtotal").val("0");
        $("#txtsubtotal2").val("0");
        $("#txtIva").val("0");
        $("#txtdescontado").val("0");
        $("#txtDescuento").val("0");
        $("#txtTotal").val("0");

        /*####### ACTIVAR BOTON DE PAGO #######*/
        $("#TextImporte").text("0");
        $("#TextPagado").text("0");
        $("#TextCambio").text("0");
        $('#TextCliente').text("Consumidor Final");
        $('#TextCredito').text("0");
        $("#montopagado").val("0");
    });
});

//FUNCION PARA ACTUALIZAR DESCUENTO EN DETALLE
$(document).ready(function(){
    $('#descproducto').keyup(function(){
        if ($('input#descproducto').val() > 100) { 
            $("#descproducto").val("0");
            swal("Oops", "EL DESCUENTO NO PUEDE SER MAYOR A 100%!", "error");
            return false;
        }
    });
});

//FUNCION PARA ACTUALIZAR CALCULO CON DESCUENTO
$(document).ready(function(){
    $('#cobrarmesa #descuento').keyup(function(){

    if ($('#cobrarmesa input#descuento').val() > 100) {
          
        $("#descuento").val("0");
        swal("Oops", "EL DESCUENTO GLOBAL NO PUEDE SER MAYOR A 100%!", "error");
        //return false;
    }
        var txtsubtotal = $('input#subtotalivasi').val();
        var txtsubtotal2 = $('input#subtotalivano').val();
        var txtIva = $('input#totaliva').val();
        var desc = $('input#descuento').val();
        descuento  = (desc > 100 ? "0.00" : desc/100);

        var opcionpropina = $('input:radio[name=opcionpropina]:checked').val();
        var totalpropina = $('input#totalpropina').val(); 
        var montopropinasugerida = $('input#montopropinasugerida').val();
        var montopagado = $('input#montopagado').val();
        var montopagado2 = $('input#montopagado2').val();
        var montodevuelto = $('input#montodevuelto').val(); 
        var montopropina = $('input#montopropina').val();
        var sumpagado = parseFloat(montopagado) + parseFloat(montopagado2);
                        
        //REALIZO EL CALCULO CON EL DESCUENTO INDICADO
        Subtotal = parseFloat(txtsubtotal) + parseFloat(txtsubtotal2) + parseFloat(txtIva); 
        TotalDescuentoGeneral   = parseFloat(Subtotal.toFixed(2)) * parseFloat(descuento.toFixed(2));
        TotalFactura   = parseFloat(Subtotal.toFixed(2)) - parseFloat(TotalDescuentoGeneral.toFixed(2)); 

        if (opcionpropina == null) {
        TotalGeneral   = parseFloat(TotalFactura);
        } else if (opcionpropina == 1) {
        TotalGeneral   = parseFloat(TotalFactura) + parseFloat(totalpropina);
        } else if (opcionpropina == 2) {
        TotalGeneral   = parseFloat(TotalFactura);
        } else if (opcionpropina == 3) {
        TotalGeneral   = parseFloat(TotalFactura) + parseFloat(montopropinasugerida);
        }

        if (parseFloat(TotalGeneral) > parseFloat(sumpagado)) {
        total_cambio = parseFloat(sumpagado) - parseFloat(TotalGeneral);
        } else if (parseFloat(sumpagado) > parseFloat(TotalGeneral)) {
        total_cambio = parseFloat(sumpagado) - parseFloat(TotalGeneral); 
        }
        var original_cambio = parseFloat(total_cambio.toFixed(2));  

        $("#txtDescuento2").val(Math.round(TotalDescuentoGeneral.toFixed(2)));
        $("#totaldescuento").val(Math.round(TotalDescuentoGeneral.toFixed(2)));

        $("#txtImporte").val(Math.round(TotalFactura.toFixed(2)));
        $("#txtTotalPago").val(Math.round(TotalFactura.toFixed(2)));
        $("#montodevuelto").val((TotalGeneral == sumpagado) ? "0" : Math.round(original_cambio.toFixed(2)));

        $("#TotalImporte").text(Separador(Math.round(TotalGeneral.toFixed(2))));
        $("#TotalPagado").text(Separador(Math.round(sumpagado.toFixed(2))));
        $("#TextCambio").text((TotalGeneral == sumpagado) ? "0" : Separador(Math.round(original_cambio.toFixed(2))));
    });
});


//FUNCION PARA ACTUALIZAR CALCULO CON DESCUENTO
$(document).ready(function(){
    $('#cobrarmesaseparada #descuento').keyup(function(){

    if ($('#cobrarmesaseparada input#descuento').val() > 100) {
          
        $("#descuento").val("0");
        swal("Oops", "EL DESCUENTO GLOBAL NO PUEDE SER MAYOR A 100%!", "error");
        //return false;
    }
        var txtsubtotal = $('input#subtotalivasi').val();
        var txtsubtotal2 = $('input#subtotalivano').val();
        var txtIva = $('input#txtIva').val();
        var desc = $('input#descuento').val();
        descuento  = (desc > 100 ? "0.00" : desc/100);

        var opcionpropina = $('input:radio[name=opcionpropina]:checked').val();
        var totalpropina = $('input#totalpropina').val(); 
        var montopropinasugerida = $('input#montopropinasugerida').val();
        var montopagado = $('input#montopagado').val();
        var montopagado2 = $('input#montopagado2').val();
        var montodevuelto = $('input#montodevuelto').val(); 
        var montopropina = $('input#montopropina').val();
        var sumpagado = parseFloat(montopagado) + parseFloat(montopagado2);
                        
        //REALIZO EL CALCULO CON EL DESCUENTO INDICADO
        Subtotal = parseFloat(txtsubtotal) + parseFloat(txtsubtotal2) + parseFloat(txtIva); 
        TotalDescuentoGeneral   = parseFloat(Subtotal.toFixed(2)) * parseFloat(descuento.toFixed(2));
        TotalFactura   = parseFloat(Subtotal.toFixed(2)) - parseFloat(TotalDescuentoGeneral.toFixed(2));

        if (opcionpropina == null) {
        TotalGeneral   = parseFloat(TotalFactura);
        } else if (opcionpropina == 1) {
        TotalGeneral   = parseFloat(TotalFactura) + parseFloat(totalpropina);
        } else if (opcionpropina == 2) {
        TotalGeneral   = parseFloat(TotalFactura);
        } else if (opcionpropina == 3) {
        TotalGeneral   = parseFloat(TotalFactura) + parseFloat(montopropinasugerida);
        }

        if (parseFloat(TotalGeneral) > parseFloat(sumpagado)) {
        total_cambio = parseFloat(sumpagado) - parseFloat(TotalGeneral);
        } else if (parseFloat(sumpagado) > parseFloat(TotalGeneral)) {
        total_cambio = parseFloat(sumpagado) - parseFloat(TotalGeneral); 
        }
        var original_cambio = parseFloat(total_cambio.toFixed(2));    

        $("#txtDescuento").val(Math.round(TotalDescuentoGeneral.toFixed(2)));
        $("#totaldescuento").val(Math.round(TotalDescuentoGeneral.toFixed(2)));

        $("#txtImporte").val(Math.round(TotalFactura.toFixed(2)));
        $("#txtTotalPago").val(Math.round(TotalFactura.toFixed(2)));
        $("#montodevuelto").val((TotalGeneral == sumpagado) ? "0" : Math.round(original_cambio.toFixed(2)));

        $("#TotalImporte").text(Separador(Math.round(TotalGeneral.toFixed(2))));
        $("#TotalPagado").text(Separador(Math.round(sumpagado.toFixed(2))));
        $("#TextCambio").text((TotalGeneral == sumpagado) ? "0" : Separador(Math.round(original_cambio.toFixed(2))));
    });
});

    $("#carrito tbody").on('keydown', 'input', function(e) {
        var element = $(this);
        var pvalue = element.val();
        /*var code = e.charCode || e.keyCode;
        var avalue = String.fromCharCode(code);*/
        var regx = /^[A-Za-z0-9 _.-]+$/;
        var action = element.siblings('button').first().attr('onclick');
        var params;
        //if (code !== 11 && /[^\d]/ig.test(avalue)) {
        if (!regx.test(e.charCode) || !regx.test(e.keyCode)){
            e.preventDefault();
            return;
        }

        if (element.attr('data-proc') == '1') {
            return true;
        }
        element.attr('data-proc', '1');
        params = action.match(/\'([^\']+)\'/g).map(function(v) {
            return v.replace(/\'/g, '');
        });
        setTimeout(function() {
            if (element.attr('data-proc') == '1') {
                var value = element.val() || 0;
                addItem(
                    params[0],
                    params[1],
                    value,
                    params[3],
                    params[4],
                    params[5],
                    params[6],
                    params[7],
                    params[8],
                    params[9],
                    params[10],
                    params[11],
                    params[12],
                    params[13],
                    params[14],
                    params[15],
                    '='
                );
                element.attr('data-proc', '0');
            }
        }, 500);
    });
});


// FUNCION PARA MOSTRAR PEDIDOS EN MESA
function VerificaMesa(codmesa){

$('#muestradetallemesa').html('<center><i class="fa fa-spin fa-spinner"></i> Cargando información, por favor espere....</center>');

var dataString = 'BuscaPedidosMesa=si&codmesa='+codmesa;

$.ajax({
        type: "GET",
        url: "detalles_mesas.php",
        data: dataString,
        success: function(response) { 
            $('#pedidos').load("detalles_mesas.php?CargaPedidosMesa=si&codmesa="+codmesa);
            $("#loading_productos").load("salas_mesas.php?CargaProductos=si");           
            $('#muestradetallemesa').empty();
            $('#muestradetallemesa').append(''+response+'').fadeIn("slow");
            $("#muestra_detalles_mesas").hide();
            $("#muestra_detalles_pedidos").show();
        }
    });
}

// FUNCION PARA CAMBIO DE MESA
function CambiarMesa(codpedido,mesa_actual,nomsala,nommesa) 
{
  // aqui asigno cada valor a los campos correspondientes
  $("#cambiarmesa #codpedido").val(codpedido);
  $("#cambiarmesa #mesa_actual").val(mesa_actual);
  $("#cambiarmesa #salaentra").text(nomsala);
  $("#cambiarmesa #mesaentra").text(nommesa);
}

// FUNCION PARA MOSTRAR DETALLE DE PEDIDOS EN MESA E3N MODAL
function MostrarDetallesPedidos(codpedido,codmesa,codsucursal){

$('#muestradetallepedidosmesa').html('<center><i class="fa fa-spin fa-spinner"></i> Cargando información, por favor espere....</center>');

var dataString = "BuscaDetallesPedidosModal=si&codpedido="+codpedido+"&codmesa="+codmesa+"&codsucursal="+codsucursal;

$.ajax({
        type: "GET",
        url: "detalles_mesas.php",
        data: dataString,
        success: function(response) { 
            $('#muestradetallepedidosmesa').empty();
            $('#muestradetallepedidosmesa').append(''+response+'').fadeIn("slow");
        }
   });
}

/////FUNCION PARA ELIMINAR DETALLE DE PEDIDOS EN MESA
function EliminaPedidoMesa(coddetallepedido,codpedido,codmesa,codsucursal,tipo) {
        swal({
          title: "¿Estás seguro?", 
          text: "¿Estás seguro de Eliminar este Detalle en Pedido?", 
          type: "warning",
          showCancelButton: true,
          cancelButtonText: "Cancelar",
          cancelButtonColor: '#d33',
          closeOnConfirm: false,
          confirmButtonText: "Eliminar",
          confirmButtonColor: "#3085d6"
        }, function() {
             $.ajax({
                  type: "GET",
                  url: "eliminar.php",
                  data: "coddetallepedido="+coddetallepedido+"&codpedido="+codpedido+"&codmesa="+codmesa+"&codsucursal="+codsucursal+"&tipo="+tipo,
                  success: function(data){

            swal("Eliminado!", "Datos eliminados con éxito!", "success");
            $('#muestradetallemesa').load("detalles_mesas.php?BuscaPedidosMesa=si&codmesa="+codmesa);
            $('#muestradetallepedidosmesa').load("detalles_mesas.php?BuscaDetallesPedidosModal=si&codpedido="+codpedido+"&codmesa="+codmesa+"&codsucursal="+codsucursal);
            }
        })
    });
}

/////FUNCION PARA CANCELAR PEDIDOS EN MESA
function CancelarPedidoMesa(codpedido,codmesa,codsucursal,tipo) {
        swal({
          title: "¿Estás seguro?", 
          text: "¿Estás seguro de Cancelar todos los Detalles de este Pedido en Mesa?", 
          type: "warning",
          showCancelButton: true,
          cancelButtonText: "Cancelar",
          cancelButtonColor: '#d33',
          closeOnConfirm: false,
          confirmButtonText: "Continuar",
          confirmButtonColor: "#3085d6"
        }, function() {
             $.ajax({
                  type: "GET",
                  url: "eliminar.php",
                  data: "codpedido="+codpedido+"&codmesa="+codmesa+"&codsucursal="+codsucursal+"&tipo="+tipo,
                  success: function(data){

          if(data==1){

            swal("Cancelado!", "El Pedido en Mesa fue Cancelado Exitosamente!", "success");
            $('#muestradetallemesa').load("detalles_mesas.php?BuscaPedidosMesa=si&codmesa="+codmesa);
            $('#loading_productos').load("salas_mesas?CargaProductos=si");
            }
          }
        })
    });
}


// FUNCION PARA MOSTRAR PEDIDOS EN MESA PENDIENTE POR PAGAR
function ProcesarMesa(codmesa,codsucursal){

$('#muestradetallemesa').html('<center><i class="fa fa-spin fa-spinner"></i> Cargando información, por favor espere....</center>');

var dataString = 'BuscaDetallesPedidosMesa=si&codmesa='+codmesa+'&codsucursal='+codsucursal;

$.ajax({
        type: "GET",
        url: "detalles_mesas.php",
        data: dataString,
        success: function(response) { 
            $('#muestradetallemesa').empty();
            $('#muestradetallemesa').append(''+response+'').fadeIn("slow");
            $('#loading_mesas').load("salas_mesas?CargaMesas=si");
        }
    });
}


// FUNCION PARA COBRAR MESA EN VENTANA MODAL
function CobrarMesa(codpedido,codmesa,totalpago,codsucursal,tipo,procedimiento){

$('#cierremesa').html('<center><i class="fa fa-spin fa-spinner"></i> Cargando información, por favor espere....</center>');

var dataString = 'CargaModalCobrarMesa=si&codpedido='+codpedido+'&codmesa='+codmesa+'&totalpago='+totalpago+'&codsucursal='+codsucursal+'&tipo='+tipo+'&procedimiento='+procedimiento;

$.ajax({
        type: "GET",
        url: "detalles_mesas.php",
        data: dataString,
        success: function(response) { 
            $('#cierremesa').empty();
            $('#cierremesa').append(''+response+'').fadeIn("slow");
        }
    });
}

// FUNCION PARA SEPARAR PAGO DE MESA EN VENTANA MODAL
function SepararCuenta(codpedido,codmesa,mesero,codsucursal,tipo,procedimiento){

$('#separarcuenta').html('<center><i class="fa fa-spin fa-spinner"></i> Cargando información, por favor espere....</center>');

var dataString = 'CargaModalSepararPago=si&codpedido='+codpedido+'&codmesa='+codmesa+'&mesero='+mesero+'&codsucursal='+codsucursal+'&tipo='+tipo+'&procedimiento='+procedimiento;

$.ajax({
        type: "GET",
        url: "detalles_mesas.php",
        data: dataString,
        success: function(response) { 
            $('#separarcuenta').empty();
            $('#separarcuenta').append(''+response+'').fadeIn("slow");
        }
    });
}

// FUNCION PARA MOSTRAR OPCIONES DE PAGO DE PROPINA
function CargaOpcionPropina(){

var opcionpropina = $('input:radio[name=opcionpropina]:checked').val(); 
var propinasugerida = $('input#propinasugerida').val();
var totalpropina = $('input#totalpropina').val();
var montopropinasugerida = $('input#montopropinasugerida').val();

var montototal = $('input#txtTotalPago').val();
var montopagado = $('input#montopagado').val();
var montopagado2 = $('input#montopagado2').val();
var montodevuelto = $('input#montodevuelto').val(); 
var montopropina = $('input#montopropina').val();

if (opcionpropina == 1) {
            
    //REALIZO EL CALCULO
    $("#montopropinasugerida").attr('disabled', true);
    $('input#montopropinasugerida').val("0");
    var sumtotal = parseFloat(montototal) + parseFloat(montopropina) + parseFloat(totalpropina);
    var Sumatoria = parseFloat(sumtotal.toFixed(2));

    var sumpagado = parseFloat(montopagado) + parseFloat(montopagado2);
    var subtotal= parseFloat(sumpagado) + parseFloat(montopropina);
    total = parseFloat(sumpagado) - parseFloat(sumtotal);
    var original = parseFloat(total.toFixed(2));

} else if (opcionpropina == 2) {
            
    //REALIZO EL CALCULO
    $("#montopropinasugerida").attr('disabled', true);
    $('input#montopropinasugerida').val("0");
    var sumtotal = parseFloat(montototal) + parseFloat(montopropina);
    var Sumatoria = parseFloat(sumtotal.toFixed(2));

} else if (opcionpropina == 3) {
            
    //REALIZO EL CALCULO
    $("#montopropinasugerida").attr('disabled', false);
    $("input#montopropinasugerida").focus();
    var sumtotal = parseFloat(montototal) + parseFloat(montopropina) + parseFloat(montopropinasugerida);
    var Sumatoria = parseFloat(sumtotal.toFixed(2));
}

    var sumpagado = parseFloat(montopagado) + parseFloat(montopagado2);
    if (parseFloat(Sumatoria) > parseFloat(sumpagado)) {
    total_cambio = parseFloat(sumpagado) - parseFloat(Sumatoria);
    } else if (parseFloat(sumpagado) > parseFloat(Sumatoria)) {
    total_cambio = parseFloat(sumpagado) - parseFloat(Sumatoria); 
    }
    var original_cambio = parseFloat(total_cambio.toFixed(2));

    $("#TotalImporte").text(Separador(Math.round(Sumatoria.toFixed(2))));
    $("#TotalPagado").text(Separador(Math.round(sumpagado.toFixed(2))));
    $("#TextCambio").text((Sumatoria == sumpagado) ? "0" : Separador(Math.round(original_cambio.toFixed(2))));
    $("#montodevuelto").val((Sumatoria == sumpagado) ? "0" : Math.round(original_cambio.toFixed(2)));
}


//FUNCION PARA CALCULAR MONTO DEVOLUCION EN VENTA
function DevolucionVenta(){
      
    if ($('input#txtTotalPago').val()==0.00 || $('input#txtTotalPago').val()==0 || $('input#txtTotalPago').val()=="") {
              
        $("#montopagado").val("0");
        $("#montopagado2").val("0");
        swal("Oops", "POR FAVOR AGREGUE DETALLES PARA CONTINUAR CON LA VENTA DE PRODUCTOS!", "error");
        return false;
   
    } else {
      
    var opcionpropina = $('input:radio[name=opcionpropina]:checked').val();
    var montototal = $('input#txtTotalPago').val();
    var montopagado = $('input#montopagado').val();
    var montopagado2 = $('input#montopagado2').val();
    var montodevuelto = $('input#montodevuelto').val(); 
    var montopropina = $('input#montopropina').val();
    var totalpropina = $('input#totalpropina').val(); 
    var montopropinasugerida = $('input#montopropinasugerida').val();
            
    //REALIZO EL CALCULO Y MUESTRO LA DEVOLUCION
    if (opcionpropina == 1) {
        var sumtotal = parseFloat(montototal) + parseFloat(montopropina) + parseFloat(totalpropina);
    } else if (opcionpropina == 2) {
        var sumtotal = parseFloat(montototal) + parseFloat(montopropina);
    } else if (opcionpropina == 3) {
        var sumtotal = parseFloat(montototal) + parseFloat(montopropina) + parseFloat(montopropinasugerida);
    }
    var Sumatoria = parseFloat(sumtotal.toFixed(2));
    
    var sumpagado = parseFloat(montopagado) + parseFloat(montopagado2);
    total = parseFloat(sumpagado) - parseFloat(sumtotal);
    var original = parseFloat(total.toFixed(2));

    $("#TotalImporte").text((montopagado == "" || montopagado == "0" || montopagado == "0") ? Separador(Math.round(Sumatoria.toFixed(2))) : Separador(Math.round(Sumatoria.toFixed(2))));
    $("#txtImporte").val((montopagado == "" || montopagado == "0" || montopagado == "0") ? Math.round(Sumatoria.toFixed(2)) : Math.round(Sumatoria.toFixed(2)));
    $("#TotalPagado").text((montopagado == "" || montopagado == "0" || montopagado == "0") ? Separador(Math.round(sumtotal)) : Separador(Math.round(sumpagado.toFixed(2))));
    $("#TextCambio").text((montopagado == "" || montopagado == "0" || montopagado == "0") ? Separador(Math.round(sumtotal)) : Separador(Math.round(original.toFixed(2))));
    $("#montodevuelto").val((montopagado == "" || montopagado == "0" || montopagado == "0") ? Math.round(sumtotal) : Math.round(original.toFixed(2)));
   }
}


// FUNCION PARA MOSTRAR CONDICIONES DE PAGO
function CargaCondicionesPagos(){

var tipopago = $('input:radio[name=tipopago]:checked').val(); 
var montototal = $('input#txtTotalPago').val(); 
var montopropina = $('input#totalpropina').val();

$("#TextPagado").text(Separador(Math.round(montototal)));
$("#TextCambio").text("0");

var dataString = 'BuscaCondicionesPagosMesas=si&tipopago='+tipopago+"&txtTotalPago="+montototal+"&txtTotalPropina="+montopropina;

    $.ajax({
        type: "GET",
        url: "condiciones_pagos.php",
        data: dataString,
        success: function(response) {            
            $('#muestra_condiciones').empty();
            $('#muestra_condiciones').append(''+response+'').fadeIn("slow");                
        }
    });
}


//FUNCIONES PARA ACTIVAR-DESACTIVAR MONTO PAGO #2
function FormasPagos2(){
    
    var formapago = $('select#formapago2').val();

    if (formapago != "" || formapago === true) {

        $("#montopagado2").attr('disabled', false);
        $("#montopagado2").focus();

    } else if (formapago == "" || formapago === true) {

        $("#montopagado2").attr('disabled', true);
        $("#montopagado2").val("0");
    }
}


//FUNCION PARA MOSTRAR PRODUCTOS FAVORITOS
function MuestraProductosFavoritos(){

    $('#productos_favoritos').load("salas_mesas?Muestra_Productos_Favoritos=si");
};

//FUNCION PARA MOSTRAR COMBOS FAVORITOS
function MuestraCombosFavoritos(){

    $('#combos_favoritos').load("salas_mesas?Muestra_Combos_Favoritos=si");
};

//FUNCION PARA MOSTRAR EXTRAS FAVORITOS
function MuestraExtrasFavoritos(){

    $('#extras_favoritos').load("salas_mesas?Muestra_Extras_Favoritos=si");
};

//FUNCION PARA MOSTRAR/OCULTAR INPUT OBSERVACION
function MuestraFavoritos(){
  var favorito = $('#favoritos');
    if(favorito.is(':visible')){
       favorito.hide(100);
       $('#favoritos').html("");

    } else {
       favorito.show(100);
       $('#favoritos').load("salas_mesas?Muestra_Favoritos=si");
    }
};


//FUNCION PARA ENVIAR DETALLES DE SALSA
function CargaDetallesSalsas(){        

    var categorias = new Array();

    $("input[type=checkbox]:checked").each(function(){
        //cada elemento seleccionado            
        categorias.push($(this).val());
    });

    $("#nombres_salsa").val(categorias);
    //$("#muestradetallesalsas").load("detalles_mesas.php?CargaDetalleSalsasAgregadas=si&nomsalsa="+categorias);
}


//FUNCION PARA LIMPIAR INPUT
function LimpiarTexto() {
    $("#busquedaproducto").val("");
    $("#idproducto").val("");
    $("#codproducto").val("");
    $("#producto").val("");
    $("#codcategoria").val("");
    $("#categorias").val("");
    $("#preciocompra").val("");
    $("#precioventa").val("");
    $("#descproducto").val("");
    $("#ivaproducto").val("");
    $("#existencia").val("");
    $("#precioconiva").val("");
    $("#tipo").val("");
    $("#observacion").val("");
    $("#salsa").val("");
    $("#preparado").val("");
    $("#cantidad").val("1");
}


function addItem(id, codigo, cantidad, producto, codcategoria, categorias, precio, precio2, descproducto, ivaproducto, existencia, precioconiva, tipo, observacion, salsa, preparado, opCantidad) {

    var Carrito = new Object();
    Carrito.Id = id;
    Carrito.Codigo = codigo;
    Carrito.Producto = producto;
    Carrito.Codcategoria = codcategoria;
    Carrito.Categorias = categorias;
    Carrito.Precio = precio;
    Carrito.Precio2 = precio2;
    Carrito.Descproducto = descproducto;
    Carrito.Ivaproducto = ivaproducto;
    Carrito.Existencia = existencia;
    Carrito.Precioconiva      = precioconiva;
    Carrito.Tipo      = tipo;
    Carrito.Observacion      = observacion;
    Carrito.Salsa      = salsa;
    Carrito.Preparado      = preparado;
    Carrito.Cantidad = cantidad;
    Carrito.opCantidad = opCantidad;
    var DatosJson = JSON.stringify(Carrito);
    $.post('carritoventa.php', {
            MiCarrito: DatosJson
        },
        function(data, textStatus) {
            $("#carrito tbody").html("");
            var contador = 0;
            var OperacionItems = 0;
            var TotalDescuento = 0;
            var SubtotalFact = 0;
            var BaseImpIva = 0;
            var BaseImpIva2 = 0;
            var TotalIvaGeneral = 0;
            var TotalCompra = 0;

            $.each(data, function(i, item) {
                var cantsincero = item.cantidad;
                cantsincero = parseFloat(cantsincero);
                if (cantsincero != 0) {
                    contador = contador + 1;

                //CALCULO DEL TOTAL DE ITEMS
                var Items= parseFloat(cantsincero);
                OperacionItems = parseFloat(OperacionItems) + parseFloat(Items);

                //CALCULO DEL TOTAL DE COMPRAS
                var OperacionCompra= parseFloat(item.precio) * parseFloat(item.cantidad);
                TotalCompra = parseFloat(TotalCompra) + parseFloat(OperacionCompra);

                //CALCULO DEL VALOR TOTAL
                var ValorTotal= parseFloat(item.precio2) * parseFloat(item.cantidad);

                //CALCULO DEL TOTAL DEL DESCUENTO %
                var DetalleDescuento = ValorTotal * item.descproducto / 100;
                TotalDescuento = parseFloat(TotalDescuento) + parseFloat(DetalleDescuento);

                //OBTENEMOS DESCUENTO INDIVIDUAL POR PRODUCTOS
                var descsiniva = item.precio2 * item.descproducto / 100;
                var descconiva = item.precioconiva * item.descproducto / 100;

                 //CALCULO DE BASE IMPONIBLE IVA SIN PORCENTAJE
                var Operac= parseFloat(item.precio2) - parseFloat(descsiniva);
                var Operacion= parseFloat(Operac) * parseFloat(item.cantidad);
                Subtotal = Operacion.toFixed(2);

                //CALCULO DE BASE IMPONIBLE IVA CON PORCENTAJE
                var Operac3 = parseFloat(item.precioconiva) - parseFloat(descconiva);
                var Operacion3 = parseFloat(Operac3) * parseFloat(item.cantidad);
                var Subbaseimponiva = Operacion3.toFixed(2);

                
                //CALCULO GENERAL DE IVA CON BASE IVA * IVA %
                var ivg = $('input#iva').val();
                ivg2  = ivg;

                //CALCULO VALOR DISCRIMINADO
                var ValorImpuesto = (ivg2 <= 9) ? "1.0"+parseInt(ivg2) : "1."+parseInt(ivg2);
                var Discriminado = parseFloat(Operac3) / ValorImpuesto;
                var SubtotalDiscriminado = parseFloat(Operac3) - parseFloat(Discriminado);
                var BaseDiscriminado = parseFloat(SubtotalDiscriminado) * parseFloat(item.cantidad);
                TotalIvaGeneral = parseFloat(TotalIvaGeneral) + parseFloat(BaseDiscriminado);

                //BASE IMPONIBLE IVA CON PORCENTAJE
                BaseImpIva = parseFloat(BaseImpIva) + parseFloat(Subbaseimponiva);
                BaseImpIva1 = parseFloat(BaseImpIva) - parseFloat(TotalIvaGeneral);
                

                //BASE IMPONIBLE IVA SIN PORCENTAJE
                BaseImpIva2 = (item.ivaproducto != "(E)") ? BaseImpIva2 : parseFloat(BaseImpIva2) + parseFloat(Subtotal);
                
                //CALCULAMOS DESCUENTO POR PRODUCTO
                var desc = $('input#descuento').val();
                desc2  = desc/100;
                
                //CALCULO DEL TOTAL DE FACTURA
                SubTotalTxt = parseFloat(BaseImpIva1) + parseFloat(BaseImpIva2);
                Total = parseFloat(BaseImpIva1) + parseFloat(BaseImpIva2) + parseFloat(TotalIvaGeneral);
                TotalDescuentoGeneral   = parseFloat(Total.toFixed(2)) * parseFloat(desc2.toFixed(2));
                TotalFactura   = parseFloat(Total.toFixed(2)) - parseFloat(TotalDescuentoGeneral.toFixed(2));

                var nuevaFila =
                "<tr class='warning-element' style='border-left: 2px solid #ffb22b !important; background: #fefde3;'>" +
                    "<td width='18%' class='m-t-0'>" +
                    '<button class="btn btn-sm" style="cursor:pointer;border-radius:5px 0px 0px 5px;background-color:#cd874a;" onclick="addItem(' +
                    "'" + item.id + "'," +
                    "'" + item.txtCodigo + "'," +
                    "'-1'," +
                    "'" + item.producto + "'," +
                    "'" + item.codcategoria + "'," +
                    "'" + item.categorias + "'," +
                    "'" + item.precio + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + item.ivaproducto + "', " +
                    "'" + item.existencia + "', " +
                    "'" + item.precioconiva + "', " +
                    "'" + item.tipo + "', " +
                    "'" + item.observacion + "', " +
                    "'" + item.salsa + "', " +
                    "'" + item.preparado + "', " +
                    "'-'" +
                    ')"' +
                    " type='button'><span class='fa fa-minus'></span></button>" +
                    "<input type='text' id='" + item.cantidad + "' class='bold' style='width:40px;height:25px;border:#f9d655;' value='" + item.cantidad + "'>" +
                    '<button class="btn btn-sm" style="cursor:pointer;border-radius:0px 5px 5px 0px;background-color:#cd874a;" onclick="addItem(' +
                    "'" + item.id + "'," +
                    "'" + item.txtCodigo + "'," +
                    "'+1'," +
                    "'" + item.producto + "'," +
                    "'" + item.codcategoria + "'," +
                    "'" + item.categorias + "'," +
                    "'" + item.precio + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + item.ivaproducto + "', " +
                    "'" + item.existencia + "', " +
                    "'" + item.precioconiva + "', " +
                    "'" + item.tipo + "', " +
                    "'" + item.observacion + "', " +
                    "'" + item.salsa + "', " +
                    "'" + item.preparado + "', " +
                    "'+'" +
                    ')"' +
                    " type='button'><span class='fa fa-plus'></span></button></div></div></td>" +
                    "<td width='46%' class='text-left m-t-0'><abbr title='" + (item.codcategoria == '' || item.codcategoria == '0' ? '******' : item.categorias) + "'><h6 class='alert-link'>" + item.producto + "</h6></abbr>" + (item.observacion == "" || item.observacion == ", " ? "" : "<span class='badge badge-pill badge-warning alert-link'>" + item.observacion + "</span>") + "" + (item.salsa == "" || item.salsa == ", " ? "" : "</span><span class='badge badge-pill badge-info alert-link'>" + item.salsa + "</span>" ) + "</td>" +
                    "<td width='12%' class='m-t-0'><h6 class='alert-link'>" + Separador(Math.round(item.precio2)) + "</h6></td>" +
                    "<td width='14%' class='m-t-0'><h6 class='alert-link'>" + Separador(Math.round(Operacion.toFixed(2))) + "</h6></td>" +
                    "<td width='10%' class='m-t-0'>" +
                    
                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="AsignaDescuento(' +
                    "'" + item.txtCodigo + "'," +
                    "'" + item.tipo + "'," +
                    "'" + item.cantidad + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + (item.observacion == "" || item.observacion == ", " ? "" : item.observacion.replace(/\s/g,"_")) + "', " +
                    "'" + (item.salsa == "" || item.salsa == ", " ? "" : item.salsa.replace(/\s/g,"_")) + "'" +
                    ')"' +
                    ' data-original-title="" data-href="#" data-toggle="modal" data-target="#myModalDescuento" data-backdrop="static" data-keyboard="false" class="mdi mdi-pencil font-24"></span>' +
                    
                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="AsignaObservacion(' +
                    "'" + item.txtCodigo + "'," +
                    "'" + item.tipo + "'," +
                    "'" + item.cantidad + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + (item.observacion == "" || item.observacion == ", " ? "" : item.observacion.replace(/\s/g,"_")) + "', " +
                    "'" + (item.salsa == "" || item.salsa == ", " ? "" : item.salsa.replace(/\s/g,"_")) + "'" +
                    ')"' +
                    ' data-original-title="" data-href="#" data-toggle="modal" data-target="#myModalObservacion" data-backdrop="static" data-keyboard="false" class="mdi mdi-comment-text-outline font-24"></span>' +

                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="AsignaSalsa(' +
                    "'" + item.txtCodigo + "'," +
                    "'" + item.tipo + "'," +
                    "'" + item.cantidad + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + (item.observacion == "" || item.observacion == ", " ? "" : item.observacion.replace(/\s/g,"_")) + "', " +
                    "'" + (item.salsa == "" || item.salsa == ", " ? "" : item.salsa.replace(/\s/g,"_")) + "'" +
                    ')"' +
                    ' data-original-title="" data-href="#" data-toggle="modal" data-target="#myModalSalsa" data-backdrop="static" data-keyboard="false" class="mdi mdi-food-variant font-24"></span>' +
                    
                    '<span style="cursor:pointer;color:#cd874a;" ' +
                    'onclick="addItem(' +
                    "'" + item.id + "'," +
                    "'" + item.txtCodigo + "'," +
                    "'0'," +
                    "'" + item.producto + "'," +
                    "'" + item.codcategoria + "'," +
                    "'" + item.categorias + "'," +
                    "'" + item.precio + "', " +
                    "'" + item.precio2 + "', " +
                    "'" + item.descproducto + "', " +
                    "'" + item.ivaproducto + "', " +
                    "'" + item.existencia + "', " +
                    "'" + item.precioconiva + "', " +
                    "'" + item.tipo + "', " +
                    "'" + item.observacion + "', " +
                    "'" + item.salsa + "', " +
                    "'" + item.preparado + "', " +
                    "'='" +
                    ')"' +
                    ' class="mdi mdi-delete font-24"></span>' +"</td>" +
                    "</tr>";

                    $(nuevaFila).appendTo("#carrito tbody");
                                
                    $("#lblitems").text(Separador2(OperacionItems.toFixed(2)));
                    $("#labelsubtotal").text(Separador(Math.round(SubTotalTxt.toFixed(2))));
                    $("#lblsubtotal").text(Separador(Math.round(BaseImpIva1.toFixed(2))));
                    $("#lblsubtotal2").text(Separador(Math.round(BaseImpIva2.toFixed(2))));
                    $("#lbliva").text(Separador(Math.round(TotalIvaGeneral.toFixed(2))));
                    $("#lbldescontado").text(Separador(Math.round(TotalDescuento.toFixed(2))));
                    $("#lbldescuento").text(Separador(Math.round(TotalDescuentoGeneral.toFixed(2))));
                    $("#lbltotal").text(Separador(Math.round(TotalFactura.toFixed(2))));

                    $("#txtsubtotal").val(Math.round(BaseImpIva1.toFixed(2)));
                    $("#txtsubtotal2").val(Math.round(BaseImpIva2.toFixed(2)));
                    $("#txtIva").val(Math.round(TotalIvaGeneral.toFixed(2)));
                    $("#txtdescontado").val(Math.round(TotalDescuento.toFixed(2)));
                    $("#txtDescuento").val(Math.round(TotalDescuentoGeneral.toFixed(2)));
                    $("#txtTotal").val(Math.round(TotalFactura.toFixed(2)));
                    $("#txtTotalCompra").val(Math.round(TotalCompra.toFixed(2)));

                    /*####### ACTIVAR BOTON DE PAGO #######*/
                    $("#TextImporte").text(Separador(Math.round(TotalFactura.toFixed(2))));
                    $("#TextPagado").text(Separador(Math.round(TotalFactura.toFixed(2))));
                    $("#montopagado").val(Math.round(TotalFactura.toFixed(2)));
                }
            });

            if (contador == 0) {

                $("#carrito tbody").html("");

                var nuevaFila =
                "<tr class='warning-element' style='border-left: 2px solid #ffb22b !important; background: #fefde3;'>"+"<td class='text-center' colspan=5><h4>NO HAY DETALLES AGREGADOS</h4></td>"+"</tr>";
                $(nuevaFila).appendTo("#carrito tbody");

                //alert("ELIMINAMOS TODOS LOS SUBTOTAL Y TOTALES");
                //$("#saveventas")[0].reset();
                $("#lblitems").text("0.00");
                $("#labelsubtotal").text("0");
                $("#labelsubtotal").text(Separador(SubTotalTxt.toFixed(2)));
                $("#lblsubtotal").text("0");
                $("#lblsubtotal2").text("0");
                $("#lbliva").text("0");
                $("#lbldescontado").text("0");
                $("#lbldescuento").text("0");
                $("#lbltotal").text("0");
                
                $("#txtsubtotal").val("0");
                $("#txtsubtotal2").val("0");
                $("#txtIva").val("0");
                $("#txtdescontado").val("0");
                $("#txtDescuento").val("0");
                $("#txtTotal").val("0");
                $("#txtTotalCompra").val("0");

                /*####### ACTIVAR BOTON DE PAGO #######*/
                $("#TextImporte").text("0");
                $("#TextPagado").text("0");
                $("#montopagado").text("0");

            }
            LimpiarTexto();
        },
        "json"
    );
    return false;
}