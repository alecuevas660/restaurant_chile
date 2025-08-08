# +===================================================================
# | Generado el 23-02-2025 a las 21:34:18 
# | Servidor: localhost
# | MySQL Version: 10.4.32-MariaDB
# | PHP Version: 8.0.30
# | Base de datos: 'softrestaurant_chile'
# | Tablas: abonoscreditos;  arqueocaja;  cajas;  categorias;  ciudades;  clientes;  combos;  combosxproductos;  compras;  comunas;  configuracion;  cotizaciones;  creditosxclientes;  detallecompras;  detallecotizaciones;  detallenotas;  detallepedidos;  detalletraspasos;  detalleventas;  documentos;  impuestos;  ingredientes;  kardex_combos;  kardex_ingredientes;  kardex_productos;  log;  medidas;  mesas;  movimientoscajas;  notascredito;  notificaciones;  pedidos;  productos;  productosxingredientes;  proveedores;  salas;  salsas;  sucursales;  tiposcambio;  tiposmoneda;  traspasos;  usuarios;  ventas
# +-------------------------------------------------------------------
# Si tienen tablas con relacion y no estan en orden dara problemas al recuperar datos. Para evitarlo:
SET FOREIGN_KEY_CHECKS=0; 
SET time_zone = '+00:00';
SET sql_mode = ''; 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
# | Vaciado de tabla 'abonoscreditos'
# +-------------------------------------
DROP TABLE IF EXISTS `abonoscreditos`;


# | Estructura de la tabla 'abonoscreditos'
# +-------------------------------------
CREATE TABLE `abonoscreditos` (
  `codabono` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montoabono` decimal(12,2) NOT NULL,
  `formaabono` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaabono` datetime NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codabono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'abonoscreditos'
# +-------------------------------------

# | Vaciado de tabla 'arqueocaja'
# +-------------------------------------
DROP TABLE IF EXISTS `arqueocaja`;


# | Estructura de la tabla 'arqueocaja'
# +-------------------------------------
CREATE TABLE `arqueocaja` (
  `codarqueo` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `montoinicial` decimal(12,2) NOT NULL,
  `efectivo` decimal(12,2) NOT NULL,
  `cheque` decimal(12,2) NOT NULL,
  `tcredito` decimal(12,2) NOT NULL,
  `tdebito` decimal(12,2) NOT NULL,
  `tprepago` decimal(12,2) NOT NULL,
  `transferencia` decimal(12,2) NOT NULL,
  `electronico` decimal(12,2) NOT NULL,
  `cupon` decimal(12,2) NOT NULL,
  `otros` decimal(12,2) NOT NULL,
  `creditos` decimal(12,2) NOT NULL,
  `abonosefectivo` decimal(12,2) NOT NULL,
  `abonosotros` decimal(12,2) NOT NULL,
  `propinasefectivo` decimal(12,2) NOT NULL,
  `propinascheque` decimal(12,2) NOT NULL,
  `propinastcredito` decimal(12,2) NOT NULL,
  `propinastdebito` decimal(12,2) NOT NULL,
  `propinastprepago` decimal(12,2) NOT NULL,
  `propinastransferencia` decimal(12,2) NOT NULL,
  `propinaselectronico` decimal(12,2) NOT NULL,
  `propinascupon` decimal(12,2) NOT NULL,
  `propinasotros` decimal(12,2) NOT NULL,
  `ingresosefectivo` decimal(12,2) NOT NULL,
  `ingresosotros` decimal(12,2) NOT NULL,
  `egresos` decimal(12,2) NOT NULL,
  `egresonotas` decimal(12,2) NOT NULL,
  `nroticket` int(5) NOT NULL,
  `nroboleta` int(5) NOT NULL,
  `nrofactura` int(5) NOT NULL,
  `nronota` int(5) NOT NULL,
  `dineroefectivo` decimal(12,2) NOT NULL,
  `diferencia` decimal(12,2) NOT NULL,
  `comentarios` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaapertura` datetime NOT NULL,
  `fechacierre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statusarqueo` int(2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codarqueo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'arqueocaja'
# +-------------------------------------

# | Vaciado de tabla 'cajas'
# +-------------------------------------
DROP TABLE IF EXISTS `cajas`;


# | Estructura de la tabla 'cajas'
# +-------------------------------------
CREATE TABLE `cajas` (
  `codcaja` int(11) NOT NULL AUTO_INCREMENT,
  `nrocaja` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomcaja` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codcaja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'cajas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `cajas` (`codcaja`, `nrocaja`, `nomcaja`, `codigo`, `codsucursal`) VALUES 
      ('1', '001', 'CAJA PRINCIPAL', '2', '1'), 
      ('2', '002', 'CAJA SECUNDARIA', '5', '1'), 
      ('3', '435435', 'TRETRETRT', '4', '2');
COMMIT;

# | Vaciado de tabla 'categorias'
# +-------------------------------------
DROP TABLE IF EXISTS `categorias`;


# | Estructura de la tabla 'categorias'
# +-------------------------------------
CREATE TABLE `categorias` (
  `codcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomcategoria` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'categorias'
# +-------------------------------------

# | Vaciado de tabla 'ciudades'
# +-------------------------------------
DROP TABLE IF EXISTS `ciudades`;


# | Estructura de la tabla 'ciudades'
# +-------------------------------------
CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `codciudad` int(11) NOT NULL,
  `ciudad` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'ciudades'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `ciudades` (`id_ciudad`, `codciudad`, `ciudad`, `id_region`) VALUES 
      ('1', '1', 'ARICA', '1'), 
      ('2', '2', 'IQUIQUE', '2'), 
      ('3', '3', 'ALTO HOSPICIO', '2'), 
      ('4', '4', 'POZO ALMONTE', '2'), 
      ('5', '5', 'ANTOFAGASTA', '3'), 
      ('6', '6', 'CALAMA', '3'), 
      ('7', '7', 'TOCOPILLA', '3'), 
      ('8', '8', 'TALTAL', '3'), 
      ('9', '9', 'MEJILLONES', '3'), 
      ('10', '10', 'MARÍA ELENA', '3'), 
      ('11', '11', 'COPIAPÓ', '4'), 
      ('12', '12', 'CALDERA', '4'), 
      ('13', '13', 'TIERRA AMARILLA', '4'), 
      ('14', '14', 'CHAÑARAL', '4'), 
      ('15', '15', 'DIEGO DE ALMAGRO', '4'), 
      ('16', '16', 'EL SALVADOR', '4'), 
      ('17', '17', 'VALLENAR', '4'), 
      ('18', '18', 'HUASCO', '4'), 
      ('19', '19', 'LA SERENA', '5'), 
      ('20', '20', 'COQUIMBO', '5'), 
      ('21', '21', 'ANDACOLLO', '5'), 
      ('22', '22', 'VICUÑA', '5'), 
      ('23', '23', 'ILLAPEL', '5'), 
      ('24', '24', 'LOS VILOS', '5'), 
      ('25', '25', 'SALAMANCA', '5'), 
      ('26', '26', 'OVALLE', '5'), 
      ('27', '27', 'COMBARBALA', '5'), 
      ('28', '28', 'MONTE PATRIA', '5'), 
      ('29', '29', 'VALPARAÍSO', '6'), 
      ('30', '30', 'CONCÓN', '6'), 
      ('31', '31', 'VIÑA DEL MAR', '6'), 
      ('32', '32', 'VILLA ALEMANA', '6'), 
      ('33', '33', 'QUILPUÉ', '6'), 
      ('34', '34', 'PLACILLA DE PEÑUELAS', '6'), 
      ('35', '35', 'SAN ANTONIO', '6'), 
      ('36', '36', 'SANTO DOMINGO', '6'), 
      ('37', '37', 'CARTAGENA', '6'), 
      ('38', '38', 'QUILLOTA', '6'), 
      ('39', '39', 'HIJUELAS', '6'), 
      ('40', '40', 'LA CALERA', '6'), 
      ('41', '41', 'LA CRUZ', '6'), 
      ('42', '42', 'SAN FELIPE', '6'), 
      ('43', '43', 'CASABLANCA', '6'), 
      ('44', '44', 'LAS VENTANAS', '6'), 
      ('45', '45', 'QUINTERO', '6'), 
      ('46', '46', 'LOS ANDES', '6'), 
      ('47', '47', 'CALLE LARGA', '6'), 
      ('48', '48', 'RINCONADA', '6'), 
      ('49', '49', 'SAN ESTEBAN', '6'), 
      ('50', '50', 'LA LIGUA', '6'), 
      ('51', '51', 'CABILDO', '6'), 
      ('52', '52', 'LIMACHE', '6'), 
      ('53', '53', 'NOGALES', '6'), 
      ('54', '54', 'EL MELÓN', '6'), 
      ('55', '55', 'OLMUÉ', '6'), 
      ('56', '56', 'ALGARROBO', '6'), 
      ('57', '57', 'EL QUISCO', '6'), 
      ('58', '58', 'EL TABO', '6'), 
      ('59', '59', 'CATEMU', '6'), 
      ('60', '60', 'LLAILLAY', '6'), 
      ('61', '61', 'PUTAENDO', '6'), 
      ('62', '62', 'SANTA MARÍA', '6'), 
      ('63', '213', 'PAPUDO', '6'), 
      ('64', '63', 'RANCAGUA', '7'), 
      ('65', '64', 'MACHALÍ', '7'), 
      ('66', '65', 'GULTRO', '7'), 
      ('67', '66', 'CODEGUA', '7'), 
      ('68', '67', 'DOÑIHUE', '7'), 
      ('69', '68', 'LO MIRANDA', '7'), 
      ('70', '69', 'GRANEROS', '7'), 
      ('71', '70', 'LAS CABRAS', '7'), 
      ('72', '71', 'SAN FRANCISCO DE MOSTAZAL', '7'), 
      ('73', '72', 'PEUMO', '7'), 
      ('74', '73', 'QUINTA DE TILCOCO', '7'), 
      ('75', '74', 'RENGO', '7'), 
      ('76', '75', 'REQUÍNOA', '7'), 
      ('77', '76', 'SAN VICENTE DE TAGUA TAGUA', '7'), 
      ('78', '77', 'PICHILEMU', '7'), 
      ('79', '78', 'SAN FERNANDO', '7'), 
      ('80', '79', 'CHIMBARONGO', '7'), 
      ('81', '80', 'NANCAGUA', '7'), 
      ('82', '81', 'PALMILLA', '7'), 
      ('83', '82', 'SANTA CRUZ', '7'), 
      ('84', '83', 'TALCA', '8'), 
      ('85', '84', 'CURICÓ', '8'), 
      ('86', '85', 'LINARES', '8'), 
      ('87', '86', 'CONSTITUCIÓN', '8'), 
      ('88', '87', 'SAN CLEMENTE', '8'), 
      ('89', '88', 'CAUQUENES', '8'), 
      ('90', '89', 'HUALAÑÉ', '8'), 
      ('91', '90', 'MOLINA', '8'), 
      ('92', '91', 'TENO', '8'), 
      ('93', '92', 'LONGAVÍ', '8'), 
      ('94', '93', 'PARRAL', '8'), 
      ('95', '94', 'SAN JAVIER', '8'), 
      ('96', '95', 'VILLA ALEGRE', '8'), 
      ('97', '96', 'CONCEPCIÓN', '9'), 
      ('98', '97', 'TALCAHUANO', '9'), 
      ('99', '98', 'CHIGUAYANTE', '9'), 
      ('100', '99', 'CORONEL', '9'), 
      ('101', '100', 'HUALQUI', '9'), 
      ('102', '101', 'LOTA', '9'), 
      ('103', '102', 'PENCO', '9'), 
      ('104', '103', 'TOM&EACUTE;', '9'), 
      ('105', '104', 'HUALP&EACUTE;N', '9'), 
      ('106', '105', 'SAN PEDRO DE LA PAZ', '9'), 
      ('107', '108', 'LOS &AACUTE;NGELES', '9'), 
      ('108', '109', 'SANTA JUANA', '9'), 
      ('109', '110', 'LEBU', '9'), 
      ('110', '111', 'ARAUCO', '9'), 
      ('111', '112', 'CA&NTILDE;ETE', '9'), 
      ('112', '113', 'CURANILAHUE', '9'), 
      ('113', '114', 'LOS &AACUTE;LAMOS', '9'), 
      ('114', '115', 'CABRERO', '9'), 
      ('115', '116', 'MONTE &AACUTE;GUILA', '9'), 
      ('116', '117', 'CONURBACI&OACUTE;N&NBSP;LA LAJA-SAN ROSENDO', '9'), 
      ('117', '118', 'MULCH&EACUTE;N', '9'), 
      ('118', '119', 'NACIMIENTO', '9'), 
      ('119', '120', 'SANTA B&AACUTE;RBARA', '9'), 
      ('120', '121', 'HU&EACUTE;PIL', '9'), 
      ('121', '122', 'YUMBEL', '9'), 
      ('122', '199', 'PEMUCO', '9'), 
      ('123', '130', 'TEMUCO', '10'), 
      ('124', '131', 'PADRE LAS CASAS', '10'), 
      ('125', '132', 'LABRANZA', '10'), 
      ('126', '133', 'CARAHUE', '10'), 
      ('127', '134', 'CUNCO', '10'), 
      ('128', '135', 'FREIRE', '10'), 
      ('129', '136', 'GORBEA', '10'), 
      ('130', '137', 'LAUTARO', '10'), 
      ('131', '138', 'LONCOCHE', '10'), 
      ('132', '139', 'NUEVA IMPERIAL', '10'), 
      ('133', '140', 'PITRUFQU&EACUTE;N', '10'), 
      ('134', '141', 'PUC&OACUTE;N', '10'), 
      ('135', '142', 'VILLARRICA', '10'), 
      ('136', '143', 'ANGOL', '10'), 
      ('137', '144', 'COLLIPULLI', '10'), 
      ('138', '145', 'CURACAUT&IACUTE;N', '10'), 
      ('139', '146', 'PUR&EACUTE;N', '10'), 
      ('140', '147', 'RENAICO', '10'), 
      ('141', '148', 'TRAIGU&EACUTE;N', '10'), 
      ('142', '149', 'VICTORIA', '10'), 
      ('143', '150', 'VALDIVIA', '11'), 
      ('144', '151', 'FUTRONO', '11'), 
      ('145', '152', 'LA UNI&OACUTE;N', '11'), 
      ('146', '153', 'LANCO', '11'), 
      ('147', '154', 'LOS LAGOS', '11'), 
      ('148', '155', 'SAN JOS&EACUTE; DE LA MARIQUINA', '11'), 
      ('149', '156', 'PAILLACO', '11'), 
      ('150', '157', 'PANGUIPULLI', '11'), 
      ('151', '158', 'R&IACUTE;O BUENO', '11'), 
      ('152', '159', 'PUERTO MONTT', '12'), 
      ('153', '160', 'PUERTO VARAS', '12'), 
      ('154', '161', 'CALBUCO', '12'), 
      ('155', '162', 'FRESIA', '12'), 
      ('156', '163', 'FRUTILLAR', '12'), 
      ('157', '164', 'LOS MUERMOS', '12'), 
      ('158', '165', 'LLANQUIHUE', '12'), 
      ('159', '166', 'CASTRO', '12'), 
      ('160', '167', 'ANCUD', '12'), 
      ('161', '168', 'QUELL&OACUTE;N', '12'), 
      ('162', '169', 'OSORNO', '12'), 
      ('163', '170', 'PURRANQUE', '12'), 
      ('164', '171', 'R&IACUTE;O NEGRO', '12'), 
      ('165', '214', 'CHAIT&EACUTE;N', '12'), 
      ('166', '215', 'CHONCHI', '12'), 
      ('167', '172', 'COYHAIQUE', '13'), 
      ('168', '173', 'PUERTO AYS&EACUTE;N', '13'), 
      ('169', '212', 'CHILE CHICO', '13'), 
      ('170', '174', 'PUNTA ARENAS', '14'), 
      ('171', '175', 'PUERTO NATALES', '14'), 
      ('172', '211', 'PUERTO WILLIAMS', '14'), 
      ('173', '176', 'SANTIAGO', '15'), 
      ('174', '177', 'SAN JOS&EACUTE; DE MAIPO', '15'), 
      ('175', '178', 'COLINA', '15'), 
      ('176', '179', 'LAMPA', '15'), 
      ('177', '180', 'BATUCO', '15'), 
      ('178', '181', 'TILTIL', '15'), 
      ('179', '182', 'BUIN', '15'), 
      ('180', '183', 'ALTO JAHUEL', '15'), 
      ('181', '184', 'BAJOS DE SAN AGUST&IACUTE;N', '15'), 
      ('182', '185', 'PAINE', '15'), 
      ('183', '186', 'HOSPITAL', '15'), 
      ('184', '187', 'MELIPILLA', '15'), 
      ('185', '188', 'CURACAV&IACUTE;', '15'), 
      ('186', '189', 'TALAGANTE', '15'), 
      ('187', '190', 'EL MONTE', '15'), 
      ('188', '191', 'ISLA DE MAIPO', '15'), 
      ('189', '192', 'LA ISLITA', '15'), 
      ('190', '193', 'PE&NTILDE;AFLOR', '15'), 
      ('191', '106', 'CHILL&AACUTE;N', '27'), 
      ('192', '107', 'CHILL&AACUTE;N VIEJO', '27'), 
      ('193', '123', 'BULNES', '27'), 
      ('194', '124', 'COELEMU', '27'), 
      ('195', '125', 'COIHUECO', '27'), 
      ('196', '126', 'QUILL&OACUTE;N', '27'), 
      ('197', '127', 'QUIRIHUE', '27'), 
      ('198', '128', 'SAN CARLOS', '27'), 
      ('199', '129', 'YUNGAY', '27');
COMMIT;

# | Vaciado de tabla 'clientes'
# +-------------------------------------
DROP TABLE IF EXISTS `clientes`;


# | Estructura de la tabla 'clientes'
# +-------------------------------------
CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipocliente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documcliente` int(11) NOT NULL,
  `dnicliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomcliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `razoncliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `girocliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfcliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `direccliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emailcliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `limitecredito` float(12,2) NOT NULL,
  `fechaingreso` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'clientes'
# +-------------------------------------

# | Vaciado de tabla 'combos'
# +-------------------------------------
DROP TABLE IF EXISTS `combos`;


# | Estructura de la tabla 'combos'
# +-------------------------------------
CREATE TABLE `combos` (
  `idcombo` int(11) NOT NULL AUTO_INCREMENT,
  `codcombo` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomcombo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `existencia` decimal(12,2) NOT NULL,
  `stockminimo` decimal(12,2) NOT NULL,
  `stockmaximo` decimal(12,2) NOT NULL,
  `ivacombo` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `desccombo` decimal(12,2) NOT NULL,
  `preparado` int(2) NOT NULL,
  `favorito` int(2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idcombo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'combos'
# +-------------------------------------

# | Vaciado de tabla 'combosxproductos'
# +-------------------------------------
DROP TABLE IF EXISTS `combosxproductos`;


# | Estructura de la tabla 'combosxproductos'
# +-------------------------------------
CREATE TABLE `combosxproductos` (
  `iddetallecombo` int(11) NOT NULL AUTO_INCREMENT,
  `codcombo` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idproducto` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` decimal(12,2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`iddetallecombo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'combosxproductos'
# +-------------------------------------

# | Vaciado de tabla 'compras'
# +-------------------------------------
DROP TABLE IF EXISTS `compras`;


# | Estructura de la tabla 'compras'
# +-------------------------------------
CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `codcompra` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codfactura` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasic` decimal(12,2) NOT NULL,
  `subtotalivanoc` decimal(12,2) NOT NULL,
  `ivac` decimal(12,2) NOT NULL,
  `totalivac` decimal(12,2) NOT NULL,
  `descontadoc` decimal(12,2) NOT NULL,
  `descuentoc` decimal(12,2) NOT NULL,
  `totaldescuentoc` decimal(12,2) NOT NULL,
  `totalpagoc` decimal(12,2) NOT NULL,
  `tipocompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formacompra` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechavencecredito` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechapagado` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statuscompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaemision` date NOT NULL,
  `fecharecepcion` date NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'compras'
# +-------------------------------------

# | Vaciado de tabla 'comunas'
# +-------------------------------------
DROP TABLE IF EXISTS `comunas`;


# | Estructura de la tabla 'comunas'
# +-------------------------------------
CREATE TABLE `comunas` (
  `id_comuna` int(11) NOT NULL AUTO_INCREMENT,
  `codcomuna` int(11) NOT NULL,
  `comuna` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `numero` int(11) NOT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'comunas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `comunas` (`id_comuna`, `codcomuna`, `comuna`, `numero`, `id_region`) VALUES 
      ('1', '1', 'ARICA', '15101', '1'), 
      ('2', '2', 'CAMARONES', '15102', '1'), 
      ('3', '3', 'PUTRE', '15201', '1'), 
      ('4', '4', 'GENERAL LAGOS', '15202', '1'), 
      ('5', '5', 'IQUIQUE', '1101', '2'), 
      ('6', '6', 'ALTO HOSPICIO', '1107', '2'), 
      ('7', '7', 'POZO ALMONTE', '1401', '2'), 
      ('8', '8', 'CAMIÑA', '1402', '2'), 
      ('9', '9', 'COLCHANE', '1403', '2'), 
      ('10', '10', 'HUARA', '1404', '2'), 
      ('11', '11', 'PICA', '1405', '2'), 
      ('12', '12', 'ANTOFAGASTA', '2101', '3'), 
      ('13', '13', 'MEJILLONES', '2102', '3'), 
      ('14', '14', 'SIERRA GORDA', '2103', '3'), 
      ('15', '15', 'TALTAL', '2104', '3'), 
      ('16', '16', 'CALAMA', '2201', '3'), 
      ('17', '17', 'OLLAGUE', '2202', '3'), 
      ('18', '18', 'SAN PEDRO DE ATACAMA', '2203', '3'), 
      ('19', '19', 'TOCOPILLA', '2301', '3'), 
      ('20', '20', 'MARÍA ELENA', '2302', '3'), 
      ('21', '21', 'COPIAPÓ', '3101', '4'), 
      ('22', '22', 'CALDERA', '3102', '4'), 
      ('23', '23', 'TIERRA AMARILLA', '3103', '4'), 
      ('24', '24', 'CHAÑARAL', '3201', '4'), 
      ('25', '25', 'DIEGO DE ALMAGRO', '3202', '4'), 
      ('26', '26', 'VALLENAR', '3301', '4'), 
      ('27', '27', 'ALTO DEL CARMEN', '3302', '4'), 
      ('28', '28', 'FREIRINA', '3303', '4'), 
      ('29', '29', 'HUASCO', '3304', '4'), 
      ('30', '30', 'LA SERENA', '4101', '5'), 
      ('31', '31', 'COQUIMBO', '4102', '5'), 
      ('32', '32', 'ANDACOLLO', '4103', '5'), 
      ('33', '33', 'LA HIGUERA', '4104', '5'), 
      ('34', '34', 'PAIHUANO', '4105', '5'), 
      ('35', '35', 'VICUÑA', '4106', '5'), 
      ('36', '36', 'ILLAPEL', '4201', '5'), 
      ('37', '37', 'CANELA', '4202', '5'), 
      ('38', '38', 'LOS VILOS', '4203', '5'), 
      ('39', '39', 'SALAMANCA', '4204', '5'), 
      ('40', '40', 'OVALLE', '4301', '5'), 
      ('41', '41', 'COMBARBALÁ', '4302', '5'), 
      ('42', '42', 'MONTE PATRIA', '4303', '5'), 
      ('43', '43', 'PUNITAQUI', '4304', '5'), 
      ('44', '44', 'RÍO HURTADO', '4305', '5'), 
      ('45', '45', 'VALPARAÍSO', '5101', '6'), 
      ('46', '46', 'CASABLANCA', '5102', '6'), 
      ('47', '47', 'CONCÓN', '5103', '6'), 
      ('48', '48', 'JUAN FERNÁNDEZ', '5104', '6'), 
      ('49', '49', 'PUCHUNCAVÍ', '5105', '6'), 
      ('50', '50', 'QUINTERO', '5107', '6'), 
      ('51', '51', 'VIÑA DEL MAR', '5109', '6'), 
      ('52', '52', 'ISLA DE PASCUA', '5201', '6'), 
      ('53', '53', 'LOS ANDES', '5301', '6'), 
      ('54', '54', 'CALLE LARGA', '5302', '6'), 
      ('55', '55', 'RINCONADA', '5303', '6'), 
      ('56', '56', 'SAN ESTEBAN', '5304', '6'), 
      ('57', '57', 'LA LIGUA', '5401', '6'), 
      ('58', '58', 'CABILDO', '5402', '6'), 
      ('59', '59', 'PAPUDO', '5403', '6'), 
      ('60', '60', 'PETORCA', '5404', '6'), 
      ('61', '61', 'ZAPALLAR', '5405', '6'), 
      ('62', '62', 'QUILLOTA', '5501', '6'), 
      ('63', '63', 'LA CALERA', '5502', '6'), 
      ('64', '64', 'HIJUELAS', '5503', '6'), 
      ('65', '65', 'LA CRUZ', '5504', '6'), 
      ('66', '66', 'NOGALES', '5506', '6'), 
      ('67', '67', 'SAN ANTONIO', '5601', '6'), 
      ('68', '68', 'ALGARROBO', '5602', '6'), 
      ('69', '69', 'CARTAGENA', '5603', '6'), 
      ('70', '70', 'EL QUISCO', '5604', '6'), 
      ('71', '71', 'EL TABO', '5605', '6'), 
      ('72', '72', 'SANTO DOMINGO', '5606', '6'), 
      ('73', '73', 'SAN FELIPE', '5701', '6'), 
      ('74', '74', 'CATEMU', '5702', '6'), 
      ('75', '75', 'LLAILLAY', '5703', '6'), 
      ('76', '76', 'PANQUEHUE', '5704', '6'), 
      ('77', '77', 'PUTAENDO', '5705', '6'), 
      ('78', '78', 'SANTA MARÍA', '5706', '6'), 
      ('79', '79', 'QUILPUÉ', '5801', '6'), 
      ('80', '80', 'LIMACHE', '5802', '6'), 
      ('81', '81', 'OLMUÉ', '5803', '6'), 
      ('82', '82', 'VILLA ALEMANA', '5804', '6'), 
      ('83', '83', 'RANCAGUA', '6101', '7'), 
      ('84', '84', 'CODEGUA', '6102', '7'), 
      ('85', '85', 'COINCO', '6103', '7'), 
      ('86', '86', 'COLTAUCO', '6104', '7'), 
      ('87', '87', 'DOÑIHUE', '6105', '7'), 
      ('88', '88', 'GRANEROS', '6106', '7'), 
      ('89', '89', 'LAS CABRAS', '6107', '7'), 
      ('90', '90', 'MACHALÍ', '6108', '7'), 
      ('91', '91', 'MALLOA', '6109', '7'), 
      ('92', '92', 'MOSTAZAL', '6110', '7'), 
      ('93', '93', 'OLIVAR', '6111', '7'), 
      ('94', '94', 'PEUMO', '6112', '7'), 
      ('95', '95', 'PICHIDEGUA', '6113', '7'), 
      ('96', '96', 'QUINTA DE TILCOCO', '6114', '7'), 
      ('97', '97', 'RENGO', '6115', '7'), 
      ('98', '98', 'REQUÍNOA', '6116', '7'), 
      ('99', '99', 'SAN VICENTE', '6117', '7'), 
      ('100', '100', 'PICHILEMU', '6201', '7'), 
      ('101', '101', 'LA ESTRELLA', '6202', '7'), 
      ('102', '102', 'LITUECHE', '6203', '7'), 
      ('103', '103', 'MARCHIHUE', '6204', '7'), 
      ('104', '104', 'NAVIDAD', '6205', '7'), 
      ('105', '105', 'PAREDONES', '6206', '7'), 
      ('106', '106', 'SAN FERNANDO', '6301', '7'), 
      ('107', '107', 'CH&EACUTE;PICA', '6302', '7'), 
      ('108', '108', 'CHIMBARONGO', '6303', '7'), 
      ('109', '109', 'LOLOL', '6304', '7'), 
      ('110', '110', 'NANCAGUA', '6305', '7'), 
      ('111', '111', 'PALMILLA', '6306', '7'), 
      ('112', '112', 'PERALILLO', '6307', '7'), 
      ('113', '113', 'PLACILLA', '6308', '7'), 
      ('114', '114', 'PUMANQUE', '6309', '7'), 
      ('115', '115', 'SANTA CRUZ', '6310', '7'), 
      ('116', '116', 'TALCA', '7101', '8'), 
      ('117', '117', 'CONSTITUCIÓN', '7102', '8'), 
      ('118', '118', 'CUREPTO', '7103', '8'), 
      ('119', '119', 'EMPEDRADO', '7104', '8'), 
      ('120', '120', 'MAULE', '7105', '8'), 
      ('121', '121', 'PELARCO', '7106', '8'), 
      ('122', '122', 'PENCAHUE', '7107', '8'), 
      ('123', '123', 'RÍO CLARO', '7108', '8'), 
      ('124', '124', 'SAN CLEMENTE', '7109', '8'), 
      ('125', '125', 'SAN RAFAEL', '7110', '8'), 
      ('126', '126', 'CAUQUENES', '7201', '8'), 
      ('127', '127', 'CHANCO', '7202', '8'), 
      ('128', '128', 'PELLUHUE', '7203', '8'), 
      ('129', '129', 'CURIC&OACUTE;', '7301', '8'), 
      ('130', '130', 'HUALAÑÉ', '7302', '8'), 
      ('131', '131', 'LICANTÉN', '7303', '8'), 
      ('132', '132', 'MOLINA', '7304', '8'), 
      ('133', '133', 'RAUCO', '7305', '8'), 
      ('134', '134', 'ROMERAL', '7306', '8'), 
      ('135', '135', 'SAGRADA FAMILIA', '7307', '8'), 
      ('136', '136', 'TENO', '7308', '8'), 
      ('137', '137', 'VICHUQU&EACUTE;N', '7309', '8'), 
      ('138', '138', 'LINARES', '7401', '8'), 
      ('139', '139', 'COLBÚN', '7402', '8'), 
      ('140', '140', 'LONGAVÍ', '7403', '8'), 
      ('141', '141', 'PARRAL', '7404', '8'), 
      ('142', '142', 'RETIRO', '7405', '8'), 
      ('143', '143', 'SAN JAVIER', '7406', '8'), 
      ('144', '144', 'VILLA ALEGRE', '7407', '8'), 
      ('145', '145', 'YERBAS BUENAS', '7408', '8'), 
      ('146', '146', 'CONCEPCIÓN', '8101', '9'), 
      ('147', '147', 'CORONEL', '8102', '9'), 
      ('148', '148', 'CHIGUAYANTE', '8103', '9'), 
      ('149', '149', 'FLORIDA', '8104', '9'), 
      ('150', '150', 'HUALQUI', '8105', '9'), 
      ('151', '151', 'LOTA', '8106', '9'), 
      ('152', '152', 'PENCO', '8107', '9'), 
      ('153', '153', 'SAN PEDRO DE LA PAZ', '8108', '9'), 
      ('154', '154', 'SANTA JUANA', '8109', '9'), 
      ('155', '155', 'TALCAHUANO', '8110', '9'), 
      ('156', '156', 'TOM&EACUTE;', '8111', '9'), 
      ('157', '157', 'HUALPÉN', '8112', '9'), 
      ('158', '158', 'LEBU', '8201', '9'), 
      ('159', '159', 'ARAUCO', '8202', '9'), 
      ('160', '160', 'CAÑETE', '8203', '9'), 
      ('161', '161', 'CONTULMO', '8204', '9'), 
      ('162', '162', 'CURANILAHUE', '8205', '9'), 
      ('163', '163', 'LOS ÁLAMOS', '8206', '9'), 
      ('164', '164', 'TIRÚA', '8207', '9'), 
      ('165', '165', 'LOS ÁNGELES', '8301', '9'), 
      ('166', '166', 'ANTUCO', '8302', '9'), 
      ('167', '167', 'CABRERO', '8303', '9'), 
      ('168', '168', 'LAJA', '8304', '9'), 
      ('169', '169', 'MULCH&EACUTE;N', '8305', '9'), 
      ('170', '170', 'NACIMIENTO', '8306', '9'), 
      ('171', '171', 'NEGRETE', '8307', '9'), 
      ('172', '172', 'QUILACO', '8308', '9'), 
      ('173', '173', 'QUILLECO', '8309', '9'), 
      ('174', '174', 'SAN ROSENDO', '8310', '9'), 
      ('175', '175', 'SANTA BÁRBARA', '8311', '9'), 
      ('176', '176', 'TUCAPEL', '8312', '9'), 
      ('177', '177', 'YUMBEL', '8313', '9'), 
      ('178', '178', 'ALTO BIOBÍO', '8314', '9'), 
      ('179', '200', 'TEMUCO', '9101', '10'), 
      ('180', '201', 'CARAHUE', '9102', '10'), 
      ('181', '202', 'CUNCO', '9103', '10'), 
      ('182', '203', 'CURARREHUE', '9104', '10'), 
      ('183', '204', 'FREIRE', '9105', '10'), 
      ('184', '205', 'GALVARINO', '9106', '10'), 
      ('185', '206', 'GORBEA', '9107', '10'), 
      ('186', '207', 'LAUTARO', '9108', '10'), 
      ('187', '208', 'LONCOCHE', '9109', '10'), 
      ('188', '209', 'MELIPEUCO', '9110', '10'), 
      ('189', '210', 'NUEVA IMPERIAL', '9111', '10'), 
      ('190', '211', 'PADRE LAS CASAS', '9112', '10'), 
      ('191', '212', 'PERQUENCO', '9113', '10'), 
      ('192', '213', 'PITRUFQU&EACUTE;N', '9114', '10'), 
      ('193', '214', 'PUCÓN', '9115', '10'), 
      ('194', '215', 'SAAVEDRA', '9116', '10'), 
      ('195', '216', 'TEODORO SCHMIDT', '9117', '10'), 
      ('196', '217', 'TOLTÉN', '9118', '10'), 
      ('197', '218', 'VILCÚN', '9119', '10'), 
      ('198', '219', 'VILLARRICA', '9120', '10'), 
      ('199', '220', 'CHOLCHOL', '9121', '10'), 
      ('200', '221', 'ANGOL', '9201', '10'), 
      ('201', '222', 'COLLIPULLI', '9202', '10'), 
      ('202', '223', 'CURACAUTÍN', '9203', '10'), 
      ('203', '224', 'ERCILLA', '9204', '10'), 
      ('204', '225', 'LONQUIMAY', '9205', '10'), 
      ('205', '226', 'LOS SAUCES', '9206', '10'), 
      ('206', '227', 'LUMACO', '9207', '10'), 
      ('207', '228', 'PURÉN', '9208', '10'), 
      ('208', '229', 'RENAICO', '9209', '10'), 
      ('209', '230', 'TRAIGUÉN', '9210', '10'), 
      ('210', '231', 'VICTORIA', '9211', '10'), 
      ('211', '232', 'VALDIVIA', '14101', '11'), 
      ('212', '233', 'CORRAL', '14102', '11'), 
      ('213', '234', 'LANCO', '14103', '11'), 
      ('214', '235', 'LOS LAGOS', '14104', '11'), 
      ('215', '236', 'MÁFIL', '14105', '11'), 
      ('216', '237', 'MARIQUINA', '14106', '11'), 
      ('217', '238', 'PAILLACO', '14107', '11'), 
      ('218', '239', 'PANGUIPULLI', '14108', '11'), 
      ('219', '240', 'LA UNIÓN', '14201', '11'), 
      ('220', '241', 'FUTRONO', '14202', '11'), 
      ('221', '242', 'LAGO RANCO', '14203', '11'), 
      ('222', '243', 'RÍO BUENO', '14204', '11'), 
      ('223', '244', 'PUERTO MONTT', '10101', '12'), 
      ('224', '245', 'CALBUCO', '10102', '12'), 
      ('225', '246', 'COCHAMO', '10103', '12'), 
      ('226', '247', 'FRESIA', '10104', '12'), 
      ('227', '248', 'FRUTILLAR', '10105', '12'), 
      ('228', '249', 'LOS MUERMOS', '10106', '12'), 
      ('229', '250', 'LLANQUIHUE', '10107', '12'), 
      ('230', '251', 'MAULLÍN', '10108', '12'), 
      ('231', '252', 'PUERTO VARAS', '10109', '12'), 
      ('232', '253', 'CASTRO', '10201', '12'), 
      ('233', '254', 'ANCUD', '10202', '12'), 
      ('234', '255', 'CHONCHI', '10203', '12'), 
      ('235', '256', 'CURACO DE VÉLEZ', '10204', '12'), 
      ('236', '257', 'DALCAHUE', '10205', '12'), 
      ('237', '258', 'PUQUELDÓN', '10206', '12'), 
      ('238', '259', 'QUEILÉN', '10207', '12'), 
      ('239', '260', 'QUELLÓN', '10208', '12'), 
      ('240', '261', 'QUEMCHI', '10209', '12'), 
      ('241', '262', 'QUINCHAO', '10210', '12'), 
      ('242', '263', 'OSORNO', '10301', '12'), 
      ('243', '264', 'PUERTO OCTAY', '10302', '12'), 
      ('244', '265', 'PURRANQUE', '10303', '12'), 
      ('245', '266', 'PUYEHUE', '10304', '12'), 
      ('246', '267', 'RÍO NEGRO', '10305', '12'), 
      ('247', '268', 'SAN JUAN DE LA COSTA', '10306', '12'), 
      ('248', '269', 'SAN PABLO', '10307', '12'), 
      ('249', '270', 'CHAITÉN', '10401', '12'), 
      ('250', '271', 'FUTALEUFÚ', '10402', '12'), 
      ('251', '272', 'HUALAIHUÉ', '10403', '12'), 
      ('252', '273', 'PALENA', '10404', '12'), 
      ('253', '274', 'COYHAIQUE', '11101', '13'), 
      ('254', '275', 'LAGO VERDE', '11102', '13'), 
      ('255', '276', 'AYSÉN', '11201', '13'), 
      ('256', '277', 'CISNES', '11202', '13'), 
      ('257', '278', 'GUAITECAS', '11203', '13'), 
      ('258', '279', 'COCHRANE', '11301', '13'), 
      ('259', '280', 'O\'HIGGINS', '11302', '13'), 
      ('260', '281', 'TORTEL', '11303', '13'), 
      ('261', '282', 'CHILE CHICO', '11401', '13'), 
      ('262', '283', 'RÍO IBAÑEZ', '11402', '13'), 
      ('263', '284', 'PUNTA ARENAS', '12101', '14'), 
      ('264', '285', 'LAGUNA BLANCA', '12102', '14'), 
      ('265', '286', 'RÍO VERDE', '12103', '14'), 
      ('266', '287', 'SAN GREGORIO', '12104', '14'), 
      ('267', '288', 'CABO DE HORNOS', '12201', '14'), 
      ('268', '289', 'ANTÁRTICA', '12202', '14'), 
      ('269', '290', 'PORVENIR', '12301', '14'), 
      ('270', '291', 'PRIMAVERA', '12302', '14'), 
      ('271', '292', 'TIMAUKEL', '12303', '14'), 
      ('272', '293', 'NATALES', '12401', '14'), 
      ('273', '294', 'TORRES DEL PAINE', '12402', '14'), 
      ('274', '295', 'SANTIAGO', '13101', '15'), 
      ('275', '296', 'CERRILLOS', '13102', '15'), 
      ('276', '297', 'CERRO NAVIA', '13103', '15'), 
      ('277', '298', 'CONCHALÍ', '13104', '15'), 
      ('278', '299', 'EL BOSQUE', '13105', '15'), 
      ('279', '300', 'ESTACIÓN CENTRAL', '13106', '15'), 
      ('280', '301', 'HUECHURABA', '13107', '15'), 
      ('281', '302', 'INDEPENDENCIA', '13108', '15'), 
      ('282', '303', 'LA CISTERNA', '13109', '15'), 
      ('283', '304', 'LA FLORIDA', '13110', '15'), 
      ('284', '305', 'LA GRANJA', '13111', '15'), 
      ('285', '306', 'LA PINTANA', '13112', '15'), 
      ('286', '307', 'LA REINA', '13113', '15'), 
      ('287', '308', 'LAS CONDES', '13114', '15'), 
      ('288', '309', 'LO BARNECHEA', '13115', '15'), 
      ('289', '310', 'LO ESPEJO', '13116', '15'), 
      ('290', '311', 'LO PRADO', '13117', '15'), 
      ('291', '312', 'MACUL', '13118', '15'), 
      ('292', '313', 'MAIPÚ', '13119', '15'), 
      ('293', '314', 'ÑUÑOA', '13120', '15'), 
      ('294', '315', 'PEDRO AGUIRRE CERDA', '13121', '15'), 
      ('295', '316', 'PEÑALOLÉN', '13122', '15'), 
      ('296', '317', 'PROVIDENCIA', '13123', '15'), 
      ('297', '318', 'PUDAHUEL', '13124', '15'), 
      ('298', '319', 'QUILICURA', '13125', '15'), 
      ('299', '320', 'QUINTA NORMAL', '13126', '15'), 
      ('300', '321', 'RECOLETA', '13127', '15');
COMMIT;
INSERT IGNORE INTO `comunas` (`id_comuna`, `codcomuna`, `comuna`, `numero`, `id_region`) VALUES 
      ('301', '322', 'RENCA', '13128', '15'), 
      ('302', '323', 'SAN JOAQUÍN', '13129', '15'), 
      ('303', '324', 'SAN MIGUEL', '13130', '15'), 
      ('304', '325', 'SAN RAM&OACUTE;N', '13131', '15'), 
      ('305', '326', 'VITACURA', '13132', '15'), 
      ('306', '327', 'PUENTE ALTO', '13201', '15'), 
      ('307', '328', 'PIRQUE', '13202', '15'), 
      ('308', '329', 'SAN JOSÉ DE MAIPO', '13203', '15'), 
      ('309', '330', 'COLINA', '13301', '15'), 
      ('310', '331', 'LAMPA', '13302', '15'), 
      ('311', '332', 'TIL TIL', '13303', '15'), 
      ('312', '333', 'SAN BERNARDO', '13401', '15'), 
      ('313', '334', 'BUIN', '13402', '15'), 
      ('314', '335', 'CALERA DE TANGO', '13403', '15'), 
      ('315', '336', 'PAINE', '13404', '15'), 
      ('316', '337', 'MELIPILLA', '13501', '15'), 
      ('317', '338', 'ALHUÉ', '13502', '15'), 
      ('318', '339', 'CURACAVÍ', '13503', '15'), 
      ('319', '340', 'MARÍA PINTO', '13504', '15'), 
      ('320', '341', 'SAN PEDRO', '13505', '15'), 
      ('321', '342', 'TALAGANTE', '13601', '15'), 
      ('322', '343', 'EL MONTE', '13602', '15'), 
      ('323', '344', 'ISLA DE MAIPO', '13603', '15'), 
      ('324', '345', 'PADRE HURTADO', '13604', '15'), 
      ('325', '346', 'PEÑAFLOR', '13605', '15'), 
      ('326', '179', 'CHILLÁN', '8401', '27'), 
      ('327', '180', 'BULNES', '8402', '27'), 
      ('328', '184', 'CHILLÁN VIEJO', '8406', '27'), 
      ('329', '185', 'EL CARMEN', '8407', '27'), 
      ('330', '188', 'PEMUCO', '8410', '27'), 
      ('331', '189', 'PINTO', '8411', '27'), 
      ('332', '191', 'QUILLÓN', '8413', '27'), 
      ('333', '196', 'SAN IGNACIO', '8418', '27'), 
      ('334', '199', 'YUNGAY', '8421', '27'), 
      ('335', '181', 'COBQUECURA', '8403', '27'), 
      ('336', '182', 'COELEMU', '8404', '27'), 
      ('337', '186', 'NINHUE', '8408', '27'), 
      ('338', '190', 'PORTEZUELO', '8412', '27'), 
      ('339', '192', 'QUIRIHUE', '8414', '27'), 
      ('340', '193', 'RÁNQUIL', '8415', '27'), 
      ('341', '198', 'TREGUACO', '8420', '27'), 
      ('342', '183', 'COIHUECO', '8405', '27'), 
      ('343', '187', 'ÑIQUÉN', '8409', '27'), 
      ('344', '194', 'SAN CARLOS', '8416', '27'), 
      ('345', '195', 'SAN FABIÁN', '8417', '27'), 
      ('346', '197', 'SAN NICOLÁS', '8419', '27');
COMMIT;

# | Vaciado de tabla 'configuracion'
# +-------------------------------------
DROP TABLE IF EXISTS `configuracion`;


# | Estructura de la tabla 'configuracion'
# +-------------------------------------
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `documsucursal` int(11) NOT NULL,
  `cuitsucursal` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `codgiro` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `girosucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfsucursal` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correosucursal` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `direcsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `documencargado` int(11) NOT NULL,
  `dniencargado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomencargado` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfencargado` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'configuracion'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `configuracion` (`id`, `documsucursal`, `cuitsucursal`, `nomsucursal`, `codgiro`, `girosucursal`, `tlfsucursal`, `correosucursal`, `id_ciudad`, `id_comuna`, `direcsucursal`, `documencargado`, `dniencargado`, `nomencargado`, `tlfencargado`) VALUES 
      ('1', '3', 'J-40737578-4', 'SOFTWARE PARA RESTAURANTES', '00998123', 'VENTAS DE COMIDA Y BEBIDAS', '0414 0073940', 'ELSAIYA@GMAIL.COM', '0', '0', 'AVENIDA ROMULO, CALLE 51 # 47-48', '16', '18633174', 'RUBEN DARIO CHIRINOS RODRIGUEZ', '+5804247424274');
COMMIT;

# | Vaciado de tabla 'cotizaciones'
# +-------------------------------------
DROP TABLE IF EXISTS `cotizaciones`;


# | Estructura de la tabla 'cotizaciones'
# +-------------------------------------
CREATE TABLE `cotizaciones` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codcotizacion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipodocumento` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codfactura` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descontado` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechacotizacion` datetime NOT NULL,
  `procesada` int(2) NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'cotizaciones'
# +-------------------------------------

# | Vaciado de tabla 'creditosxclientes'
# +-------------------------------------
DROP TABLE IF EXISTS `creditosxclientes`;


# | Estructura de la tabla 'creditosxclientes'
# +-------------------------------------
CREATE TABLE `creditosxclientes` (
  `codcredito` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montocredito` decimal(12,2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codcredito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'creditosxclientes'
# +-------------------------------------

# | Vaciado de tabla 'detallecompras'
# +-------------------------------------
DROP TABLE IF EXISTS `detallecompras`;


# | Estructura de la tabla 'detallecompras'
# +-------------------------------------
CREATE TABLE `detallecompras` (
  `coddetallecompra` int(11) NOT NULL AUTO_INCREMENT,
  `codcompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(2) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `preciocomprac` decimal(12,2) NOT NULL,
  `precioventac` decimal(12,2) NOT NULL,
  `cantcompra` decimal(12,2) NOT NULL,
  `ivaproductoc` decimal(12,2) NOT NULL,
  `descproductoc` decimal(12,2) NOT NULL,
  `descfactura` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentoc` decimal(12,2) NOT NULL,
  `subtotalimpuestos` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `lotec` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaelaboracionc` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaexpiracionc` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetallecompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'detallecompras'
# +-------------------------------------

# | Vaciado de tabla 'detallecotizaciones'
# +-------------------------------------
DROP TABLE IF EXISTS `detallecotizaciones`;


# | Estructura de la tabla 'detallecotizaciones'
# +-------------------------------------
CREATE TABLE `detallecotizaciones` (
  `coddetallecotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codcotizacion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idproducto` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantcotizacion` decimal(12,2) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` decimal(12,2) NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `subtotalimpuestos` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  `detallesobservaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `detallesalsas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `preparado` int(2) NOT NULL,
  `tipo` int(2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetallecotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'detallecotizaciones'
# +-------------------------------------

# | Vaciado de tabla 'detallenotas'
# +-------------------------------------
DROP TABLE IF EXISTS `detallenotas`;


# | Estructura de la tabla 'detallenotas'
# +-------------------------------------
CREATE TABLE `detallenotas` (
  `coddetallenota` int(11) NOT NULL AUTO_INCREMENT,
  `codnota` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idproducto` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantventa` int(15) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` decimal(12,2) NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `subtotalimpuestos` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `tipo` int(2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetallenota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'detallenotas'
# +-------------------------------------

# | Vaciado de tabla 'detallepedidos'
# +-------------------------------------
DROP TABLE IF EXISTS `detallepedidos`;


# | Estructura de la tabla 'detallepedidos'
# +-------------------------------------
CREATE TABLE `detallepedidos` (
  `coddetallepedido` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `numpedido` int(11) NOT NULL,
  `numero` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmesa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantventa` decimal(12,2) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` decimal(12,2) NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `subtotalimpuestos` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  `observacionespedido` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `salsaspedido` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cocinero` int(2) NOT NULL,
  `preparado` int(2) NOT NULL,
  `tipodetalle` int(2) NOT NULL,
  `detallepedido` int(11) NOT NULL,
  `statusdetalle` int(11) NOT NULL,
  `fechadetallepedido` datetime NOT NULL,
  `fechadetalleentrega` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `bandera_pedido` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetallepedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'detallepedidos'
# +-------------------------------------

# | Vaciado de tabla 'detalletraspasos'
# +-------------------------------------
DROP TABLE IF EXISTS `detalletraspasos`;


# | Estructura de la tabla 'detalletraspasos'
# +-------------------------------------
CREATE TABLE `detalletraspasos` (
  `coddetalletraspaso` int(11) NOT NULL AUTO_INCREMENT,
  `codtraspaso` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(2) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `cantidad` decimal(12,2) NOT NULL,
  `ivaproducto` decimal(12,2) NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `subtotalimpuestos` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  `lote` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaelaboracion` date NOT NULL,
  `fechaexpiracion` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetalletraspaso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'detalletraspasos'
# +-------------------------------------

# | Vaciado de tabla 'detalleventas'
# +-------------------------------------
DROP TABLE IF EXISTS `detalleventas`;


# | Estructura de la tabla 'detalleventas'
# +-------------------------------------
CREATE TABLE `detalleventas` (
  `coddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idproducto` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantventa` decimal(12,2) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` decimal(12,2) NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `subtotalimpuestos` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  `detallesobservaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `detallesalsas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`coddetalleventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'detalleventas'
# +-------------------------------------

# | Vaciado de tabla 'documentos'
# +-------------------------------------
DROP TABLE IF EXISTS `documentos`;


# | Estructura de la tabla 'documentos'
# +-------------------------------------
CREATE TABLE `documentos` (
  `coddocumento` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`coddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'documentos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `documentos` (`coddocumento`, `documento`, `descripcion`) VALUES 
      ('1', 'CI', 'CEDULA DE IDENTIDAD	'), 
      ('2', 'DNI', 'DOCUMENTO NACIONAL DE IDENTIDAD'), 
      ('3', 'RUN', 'ROL ÚNICO NACIONAL'), 
      ('4', 'RUT', 'ROL ÚNICO TRIBUTARIO');
COMMIT;

# | Vaciado de tabla 'impuestos'
# +-------------------------------------
DROP TABLE IF EXISTS `impuestos`;


# | Estructura de la tabla 'impuestos'
# +-------------------------------------
CREATE TABLE `impuestos` (
  `codimpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nomimpuesto` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `valorimpuesto` decimal(12,2) NOT NULL,
  `statusimpuesto` int(2) NOT NULL,
  `fechaimpuesto` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codimpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'impuestos'
# +-------------------------------------

# | Vaciado de tabla 'ingredientes'
# +-------------------------------------
DROP TABLE IF EXISTS `ingredientes`;


# | Estructura de la tabla 'ingredientes'
# +-------------------------------------
CREATE TABLE `ingredientes` (
  `idingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `codingrediente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomingrediente` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmedida` int(11) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `cantingrediente` decimal(12,2) NOT NULL,
  `stockminimo` decimal(12,2) NOT NULL,
  `stockmaximo` decimal(12,2) NOT NULL,
  `ivaingrediente` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descingrediente` decimal(12,2) NOT NULL,
  `lote` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaexpiracion` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `preparado` int(2) NOT NULL,
  `favorito` int(2) NOT NULL,
  `controlstocki` int(2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'ingredientes'
# +-------------------------------------

# | Vaciado de tabla 'kardex_combos'
# +-------------------------------------
DROP TABLE IF EXISTS `kardex_combos`;


# | Estructura de la tabla 'kardex_combos'
# +-------------------------------------
CREATE TABLE `kardex_combos` (
  `codkardex` int(11) NOT NULL AUTO_INCREMENT,
  `codproceso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcombo` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `entradas` decimal(12,2) NOT NULL,
  `salidas` decimal(12,2) NOT NULL,
  `devolucion` decimal(12,2) NOT NULL,
  `stockactual` decimal(12,2) NOT NULL,
  `ivacombo` decimal(12,2) NOT NULL,
  `desccombo` decimal(12,2) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `documento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codkardex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'kardex_combos'
# +-------------------------------------

# | Vaciado de tabla 'kardex_ingredientes'
# +-------------------------------------
DROP TABLE IF EXISTS `kardex_ingredientes`;


# | Estructura de la tabla 'kardex_ingredientes'
# +-------------------------------------
CREATE TABLE `kardex_ingredientes` (
  `codkardex` int(11) NOT NULL AUTO_INCREMENT,
  `codproceso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codingrediente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `entradas` decimal(12,2) NOT NULL,
  `salidas` decimal(12,2) NOT NULL,
  `devolucion` decimal(12,2) NOT NULL,
  `stockactual` decimal(12,2) NOT NULL,
  `ivaingrediente` decimal(12,2) NOT NULL,
  `descingrediente` decimal(12,2) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `documento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codkardex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'kardex_ingredientes'
# +-------------------------------------

# | Vaciado de tabla 'kardex_productos'
# +-------------------------------------
DROP TABLE IF EXISTS `kardex_productos`;


# | Estructura de la tabla 'kardex_productos'
# +-------------------------------------
CREATE TABLE `kardex_productos` (
  `codkardex` int(11) NOT NULL AUTO_INCREMENT,
  `codproceso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `entradas` decimal(12,2) NOT NULL,
  `salidas` decimal(12,2) NOT NULL,
  `devolucion` decimal(12,2) NOT NULL,
  `stockactual` decimal(12,2) NOT NULL,
  `ivaproducto` decimal(12,2) NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `documento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codkardex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'kardex_productos'
# +-------------------------------------

# | Vaciado de tabla 'log'
# +-------------------------------------
DROP TABLE IF EXISTS `log`;


# | Estructura de la tabla 'log'
# +-------------------------------------
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo` datetime DEFAULT NULL,
  `detalles` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `paginas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'log'
# +-------------------------------------

# | Vaciado de tabla 'medidas'
# +-------------------------------------
DROP TABLE IF EXISTS `medidas`;


# | Estructura de la tabla 'medidas'
# +-------------------------------------
CREATE TABLE `medidas` (
  `codmedida` int(11) NOT NULL AUTO_INCREMENT,
  `nommedida` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codmedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'medidas'
# +-------------------------------------

# | Vaciado de tabla 'mesas'
# +-------------------------------------
DROP TABLE IF EXISTS `mesas`;


# | Estructura de la tabla 'mesas'
# +-------------------------------------
CREATE TABLE `mesas` (
  `codmesa` int(11) NOT NULL AUTO_INCREMENT,
  `codsala` int(11) NOT NULL,
  `nommesa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `puestos` int(2) NOT NULL,
  `fecha` date NOT NULL,
  `statusmesa` int(1) NOT NULL,
  PRIMARY KEY (`codmesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'mesas'
# +-------------------------------------

# | Vaciado de tabla 'movimientoscajas'
# +-------------------------------------
DROP TABLE IF EXISTS `movimientoscajas`;


# | Estructura de la tabla 'movimientoscajas'
# +-------------------------------------
CREATE TABLE `movimientoscajas` (
  `codmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codarqueo` int(11) NOT NULL,
  `codcaja` int(11) NOT NULL,
  `tipomovimiento` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcionmovimiento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montomovimiento` decimal(12,2) NOT NULL,
  `mediomovimiento` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechamovimiento` datetime NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codmovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'movimientoscajas'
# +-------------------------------------

# | Vaciado de tabla 'notascredito'
# +-------------------------------------
DROP TABLE IF EXISTS `notascredito`;


# | Estructura de la tabla 'notascredito'
# +-------------------------------------
CREATE TABLE `notascredito` (
  `idnota` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `codnota` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codfactura` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipodocumento` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `facturaventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descontado` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `fechanota` datetime NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `bpsii` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'notascredito'
# +-------------------------------------

# | Vaciado de tabla 'notificaciones'
# +-------------------------------------
DROP TABLE IF EXISTS `notificaciones`;


# | Estructura de la tabla 'notificaciones'
# +-------------------------------------
CREATE TABLE `notificaciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codpedido` int(11) DEFAULT NULL,
  `numpedido` int(11) NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `codmesa` int(11) DEFAULT NULL,
  `concepto` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo` int(2) NOT NULL,
  `preparado` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'notificaciones'
# +-------------------------------------

# | Vaciado de tabla 'pedidos'
# +-------------------------------------
DROP TABLE IF EXISTS `pedidos`;


# | Estructura de la tabla 'pedidos'
# +-------------------------------------
CREATE TABLE `pedidos` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `numpedido` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `numero` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmesa` int(11) NOT NULL,
  `referencia` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descontado` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `descripciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipopedido` int(11) NOT NULL,
  `statuspedido` int(11) NOT NULL,
  `repartidor` int(11) NOT NULL,
  `fechapedido` datetime NOT NULL,
  `fechaentrega` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `mesero` int(11) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;
                
# | Carga de datos de la tabla 'pedidos'
# +-------------------------------------

# | Vaciado de tabla 'productos'
# +-------------------------------------
DROP TABLE IF EXISTS `productos`;


# | Estructura de la tabla 'productos'
# +-------------------------------------
CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `existencia` decimal(12,2) NOT NULL,
  `stockminimo` decimal(12,2) NOT NULL,
  `stockmaximo` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `codigobarra` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `lote` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaelaboracion` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaexpiracion` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `stockteorico` int(10) NOT NULL,
  `motivoajuste` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `preparado` int(2) NOT NULL,
  `favorito` int(2) NOT NULL,
  `controlstockp` int(2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'productos'
# +-------------------------------------

# | Vaciado de tabla 'productosxingredientes'
# +-------------------------------------
DROP TABLE IF EXISTS `productosxingredientes`;


# | Estructura de la tabla 'productosxingredientes'
# +-------------------------------------
CREATE TABLE `productosxingredientes` (
  `codagrega` int(11) NOT NULL AUTO_INCREMENT,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idingrediente` int(11) NOT NULL,
  `codingrediente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantracion` decimal(5,2) NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codagrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'productosxingredientes'
# +-------------------------------------

# | Vaciado de tabla 'proveedores'
# +-------------------------------------
DROP TABLE IF EXISTS `proveedores`;


# | Estructura de la tabla 'proveedores'
# +-------------------------------------
CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documproveedor` int(11) NOT NULL,
  `cuitproveedor` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomproveedor` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfproveedor` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `direcproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `vendedor` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfvendedor` varchar(20) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `fechaingreso` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'proveedores'
# +-------------------------------------

# | Vaciado de tabla 'salas'
# +-------------------------------------
DROP TABLE IF EXISTS `salas`;


# | Estructura de la tabla 'salas'
# +-------------------------------------
CREATE TABLE `salas` (
  `codsala` int(11) NOT NULL AUTO_INCREMENT,
  `nomsala` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codsala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'salas'
# +-------------------------------------

# | Vaciado de tabla 'salsas'
# +-------------------------------------
DROP TABLE IF EXISTS `salsas`;


# | Estructura de la tabla 'salsas'
# +-------------------------------------
CREATE TABLE `salsas` (
  `idsalsa` int(11) NOT NULL AUTO_INCREMENT,
  `codsalsa` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomsalsa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idsalsa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'salsas'
# +-------------------------------------

# | Vaciado de tabla 'sucursales'
# +-------------------------------------
DROP TABLE IF EXISTS `sucursales`;


# | Estructura de la tabla 'sucursales'
# +-------------------------------------
CREATE TABLE `sucursales` (
  `codsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nrosucursal` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documsucursal` int(11) NOT NULL,
  `cuitsucursal` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `codgiro` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `girosucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `direcsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `correosucursal` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfsucursal` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nroactividadsucursal` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `inicioticket` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `inicioboleta` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `iniciofactura` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `inicionotacredito` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaautorsucursal` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `llevacontabilidad` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documencargado` int(11) NOT NULL,
  `dniencargado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomencargado` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfencargado` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descsucursal` decimal(12,2) NOT NULL,
  `porcentajepropina` decimal(12,2) NOT NULL,
  `codmoneda` int(11) NOT NULL,
  `codmoneda2` int(11) NOT NULL,
  `comanda_cocina` int(2) NOT NULL,
  `comanda_bar` int(2) NOT NULL,
  `comanda_reposteria` int(2) NOT NULL,
  `membrete` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(2) NOT NULL,
  `lioren_token` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codsucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'sucursales'
# +-------------------------------------

# | Vaciado de tabla 'tiposcambio'
# +-------------------------------------
DROP TABLE IF EXISTS `tiposcambio`;


# | Estructura de la tabla 'tiposcambio'
# +-------------------------------------
CREATE TABLE `tiposcambio` (
  `codcambio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcioncambio` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montocambio` decimal(12,3) NOT NULL,
  `codmoneda` int(11) NOT NULL,
  `fechacambio` date NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`codcambio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'tiposcambio'
# +-------------------------------------

# | Vaciado de tabla 'tiposmoneda'
# +-------------------------------------
DROP TABLE IF EXISTS `tiposmoneda`;


# | Estructura de la tabla 'tiposmoneda'
# +-------------------------------------
CREATE TABLE `tiposmoneda` (
  `codmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `moneda` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `siglas` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `simbolo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'tiposmoneda'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `tiposmoneda` (`codmoneda`, `moneda`, `siglas`, `simbolo`) VALUES 
      ('1', 'PESO CHILENO', 'CLP', '$');
COMMIT;

# | Vaciado de tabla 'traspasos'
# +-------------------------------------
DROP TABLE IF EXISTS `traspasos`;


# | Estructura de la tabla 'traspasos'
# +-------------------------------------
CREATE TABLE `traspasos` (
  `idtraspaso` int(11) NOT NULL AUTO_INCREMENT,
  `codtraspaso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codfactura` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `recibe` int(11) NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descontado` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `fechatraspaso` datetime NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idtraspaso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'traspasos'
# +-------------------------------------

# | Vaciado de tabla 'usuarios'
# +-------------------------------------
DROP TABLE IF EXISTS `usuarios`;


# | Estructura de la tabla 'usuarios'
# +-------------------------------------
CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nivel` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` int(2) NOT NULL,
  `comision` float(12,2) NOT NULL,
  `codsucursal` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `gruposid` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'usuarios'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `usuarios` (`codigo`, `dni`, `nombres`, `sexo`, `direccion`, `telefono`, `email`, `usuario`, `password`, `nivel`, `status`, `comision`, `codsucursal`, `gruposid`) VALUES 
      ('1', '123456789', 'ADMINISTRADOR GENERAL', 'MASCULINO', '000000000000', '000000000000', '000000000000@GMAIL.COM', 'RUBENPAREDES', '$2y$10$4vrySDXHwE8zBvmd//DeOeDSiUiFO7JIkSv6Y5L5/uGDsCd5wDPZW', 'ADMINISTRADOR(A) GENERAL', '1', '0.00', '0', '0');
COMMIT;

# | Vaciado de tabla 'ventas'
# +-------------------------------------
DROP TABLE IF EXISTS `ventas`;


# | Estructura de la tabla 'ventas'
# +-------------------------------------
CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmesa` int(11) NOT NULL,
  `tipodocumento` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codarqueo` int(11) NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codfactura` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codserie` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codautorizacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion_delivery` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descontado` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `opcionpropina` int(2) NOT NULL,
  `propinasugerida` decimal(12,2) NOT NULL,
  `totalpropina` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `creditopagado` decimal(12,2) NOT NULL,
  `montodelivery` decimal(12,2) NOT NULL,
  `tipopago` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formapago` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montopagado` decimal(12,2) NOT NULL,
  `formapago2` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montopagado2` decimal(12,2) NOT NULL,
  `formapropina` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montopropina` decimal(12,2) NOT NULL,
  `montodevuelto` decimal(12,2) NOT NULL,
  `fechavencecredito` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechapagado` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statusventa` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaventa` datetime NOT NULL,
  `delivery` int(2) NOT NULL,
  `repartidor` int(11) NOT NULL,
  `entregado` int(2) NOT NULL,
  `descripciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaentrega` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statuspedido` int(2) NOT NULL,
  `tipoventa` int(2) NOT NULL,
  `codigo` int(11) NOT NULL,
  `mesero` int(11) NOT NULL,
  `docelectronico` int(2) NOT NULL,
  `bpsii` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
                
# | Carga de datos de la tabla 'ventas'
# +-------------------------------------

