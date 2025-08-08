var ventana;
var cocina;
var bar;
var reposteria;

/*#################### funcion para mostrar ventana general ####################*/
function VentanaCentrada(theURL,winName,features, myWidth, myHeight, isCenter){
  
  if(window.screen)if(isCenter)if(isCenter=="true"){
    var myLeft = (screen.width-myWidth)/2;
    var myTop = (screen.height-myHeight)/2;
    features+=(features!='')?',':'';
    features+=',left='+myLeft+',top='+myTop;
  }
  ventana = window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);

  //setTimeout(ImprimirVentana,100);//configurar tiempo en segundos
  //setTimeout(CerrarVentana,14000);//configurar tiempo en segundos (10 segundos)
}

function ImprimirVentana(){
  ventana.print();
}

function CerrarVentana(){
  ventana.close();
}


/*#################### funcion para mostrar ventana cocina ####################*/
function VentanaCentradaCocina(theURL,winName,features, myWidth, myHeight, isCenter){
  
  if(window.screen)if(isCenter)if(isCenter=="true"){
    var myLeft = (screen.width-myWidth)/2;
    var myTop = (screen.height-myHeight)/2;
    features+=(features!='')?',':'';
    features+=',left='+myLeft+',top='+myTop;
  }
  cocina = window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
  //window.print();

  setTimeout(CerrarVentanaCocina,18000);//configurar tiempo en segundos (85 segundos)
}

function CerrarVentanaCocina(){
  cocina.close();
}


/*#################### funcion para mostrar ventana bar ####################*/
function VentanaCentradaBar(theURL,winName,features, myWidth, myHeight, isCenter){
  
  if(window.screen)if(isCenter)if(isCenter=="true"){
    var myLeft = (screen.width-myWidth)/2;
    var myTop = (screen.height-myHeight)/2;
    features+=(features!='')?',':'';
    features+=',left='+myLeft+',top='+myTop;
  }
  bar = window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);

  setTimeout(CerrarVentanaBar,18000);//configurar tiempo en segundos (85 segundos)
}

function CerrarVentanaBar(){
  bar.close();
}


/*#################### funcion para mostrar ventana reposteria ####################*/
function VentanaCentradaReposteria(theURL,winName,features, myWidth, myHeight, isCenter){
  
  if(window.screen)if(isCenter)if(isCenter=="true"){
    var myLeft = (screen.width-myWidth)/2;
    var myTop = (screen.height-myHeight)/2;
    features+=(features!='')?',':'';
    features+=',left='+myLeft+',top='+myTop;
  }
  reposteria = window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);

  setTimeout(CerrarVentanaReposteria,18000);//configurar tiempo en segundos (85 segundos)
}

function CerrarVentanaReposteria(){
  reposteria.close();
}