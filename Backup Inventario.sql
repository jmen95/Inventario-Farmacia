/*
SQLyog Ultimate v9.63 
MySQL - 5.5.32 : Database - inventario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `inventario`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`inventario` /*!40100 DEFAULT CHARACTER SET utf8 */;


/*Table structure for table `auditoria` */

DROP TABLE IF EXISTS `auditoria`;

CREATE TABLE `auditoria` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Accion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `auditoria` */

LOCK TABLES `auditoria` WRITE;

insert  into `auditoria`(`Codigo`,`Fecha`,`Hora`,`Accion`,`Usuario`) values (1,'2014-03-17',NULL,NULL,NULL),(2,'2014-03-17',NULL,NULL,NULL),(3,'2014-03-17','07:58:54',NULL,NULL),(4,'2014-03-17','08:00:24','Insertar',NULL),(5,'2014-03-20','07:50:25','Insertar',NULL),(6,'2014-03-23','21:49:37','Insertar',NULL),(16,'2015-11-22','16:39:39','Insertar',NULL);

UNLOCK TABLES;

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `gruCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `gruNombre` varchar(50) NOT NULL,
  `gruDescripcion` varchar(100) DEFAULT NULL,
  `gruEstado` varchar(2) DEFAULT 'AC',
  PRIMARY KEY (`gruCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `grupo` */

LOCK TABLES `grupo` WRITE;

insert  into `grupo`(`gruCodigo`,`gruNombre`,`gruDescripcion`,`gruEstado`) values (1,'Materiales de construcción',NULL,'AC'),(2,'Pinturas',NULL,'AC'),(3,'Herramientas',NULL,'AC'),(4,'Sanitario',NULL,'AC'),(5,'Eléctricos',NULL,'AC'),(6,'Pegantes',NULL,'AC'),(7,'Tornillería',NULL,'AC');

UNLOCK TABLES;

/*Table structure for table `marca` */

DROP TABLE IF EXISTS `marca`;

CREATE TABLE `marca` (
  `marCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `marNombre` varchar(100) NOT NULL,
  `marDescripcion` varchar(200) DEFAULT NULL,
  `marEstado` varchar(2) DEFAULT 'AC',
  PRIMARY KEY (`marCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `marca` */

LOCK TABLES `marca` WRITE;

insert  into `marca`(`marCodigo`,`marNombre`,`marDescripcion`,`marEstado`) values (1,'Genfar',NULL,'AC'),(2,'JGB',NULL,'AC');

UNLOCK TABLES;

/*Table structure for table `movimientos` */

DROP TABLE IF EXISTS `movimientos`;

CREATE TABLE `movimientos` (
  `movCodigo` int(11) NOT NULL,
  `movCodUser` int(11) DEFAULT NULL,
  `movCodProducto` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `movAccion` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `movCantidad` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`movCodigo`),
  KEY `movCodProducto` (`movCodProducto`),
  KEY `movCodUser` (`movCodUser`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`movCodProducto`) REFERENCES `producto` (`proCodigoBarra`),
  CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`movCodUser`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `movimientos` */

LOCK TABLES `movimientos` WRITE;

insert  into `movimientos`(`movCodigo`,`movCodUser`,`movCodProducto`,`movAccion`,`movCantidad`) values (0,NULL,'0804541','Agregado','2');

UNLOCK TABLES;

/*Table structure for table `paginas` */

DROP TABLE IF EXISTS `paginas`;

CREATE TABLE `paginas` (
  `pagid` int(11) NOT NULL AUTO_INCREMENT,
  `pagname` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `pagurl` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `pagicono` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pagestado` varchar(1) COLLATE utf8_spanish2_ci DEFAULT 'A',
  PRIMARY KEY (`pagid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `paginas` */

LOCK TABLES `paginas` WRITE;

insert  into `paginas`(`pagid`,`pagname`,`pagurl`,`pagicono`,`pagestado`) values (1,'PAGINA 1','URL1','ICONO1','A'),(2,'PAGINA 2','URL2','ICONO2','A');

UNLOCK TABLES;

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `perid` int(11) NOT NULL AUTO_INCREMENT,
  `perpag` int(11) NOT NULL,
  `peridrol` int(11) NOT NULL,
  `peredita` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  PRIMARY KEY (`perid`),
  UNIQUE KEY `peridrol` (`peridrol`,`perpag`),
  KEY `perpag` (`perpag`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`peridrol`) REFERENCES `role` (`rolid`) ON DELETE NO ACTION,
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`perpag`) REFERENCES `paginas` (`pagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `permisos` */

LOCK TABLES `permisos` WRITE;

UNLOCK TABLES;

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `proCodigoBarra` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `proNombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `proMarCodigo` int(11) DEFAULT NULL,
  `proValorCompra` int(30) DEFAULT NULL,
  `proStockMaximo` int(100) DEFAULT NULL,
  `proStockMinimo` int(99) DEFAULT NULL,
  `proStockBodega` int(100) DEFAULT NULL,
  `proGruCodigo` int(11) DEFAULT NULL,
  `proEstado` varchar(2) CHARACTER SET latin1 NOT NULL DEFAULT 'AC' COMMENT 'AC=Activo, IN=Inactivo',
  `proFechaIngreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proUbicacion` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `proImagen` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `proFechaVencimiento` date DEFAULT NULL,
  `proTipoDescarga` int(11) DEFAULT NULL,
  `proReferencia` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `proLote` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `proIdUsuario` int(11) DEFAULT NULL COMMENT 'Usuario que modifica',
  PRIMARY KEY (`proCodigoBarra`),
  KEY `proMarCodigo` (`proMarCodigo`),
  KEY `proGruCodigo` (`proGruCodigo`),
  KEY `proTipoDescarga` (`proTipoDescarga`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`proMarCodigo`) REFERENCES `marca` (`marCodigo`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`proGruCodigo`) REFERENCES `grupo` (`gruCodigo`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`proTipoDescarga`) REFERENCES `tipodescarga` (`tideCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `producto` */

LOCK TABLES `producto` WRITE;

insert  into `producto`(`proCodigoBarra`,`proNombre`,`proMarCodigo`,`proValorCompra`,`proStockMaximo`,`proStockMinimo`,`proStockBodega`,`proGruCodigo`,`proEstado`,`proFechaIngreso`,`proUbicacion`,`proImagen`,`proFechaVencimiento`,`proTipoDescarga`,`proReferencia`,`proLote`,`proIdUsuario`) values ('0804541','h',1,23,NULL,2,2,1,'AC','2015-11-22 16:39:39','2',NULL,'2015-04-16',2,'RF-54563','7898421855132155',NULL),('1','Caja',2,450,10,20,4,2,'AC','2014-03-17 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','Vinilo',2,470,10,20,5,2,'AC','2014-03-09 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3','Vinilo',2,480,10,20,5,2,'AC','2014-03-09 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4','Vinilo',2,450,10,25,5,2,'AC','2014-03-12 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5','Vinilo',2,450,10,20,5,2,'AC','2014-03-10 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6','Vinilo',2,450,10,20,5,2,'AC','2014-03-10 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7','Cemento',1,450,10,20,5,1,'AC','2014-03-17 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8','df',1,12,12,12,12,2,'AC','2015-11-22 12:38:18','2','',NULL,1,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rolid` int(11) NOT NULL AUTO_INCREMENT,
  `rolname` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `roldesc` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `rolestado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`rolid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `role` */

LOCK TABLES `role` WRITE;

insert  into `role`(`rolid`,`rolname`,`roldesc`,`rolestado`) values (1,'ADMINISTRADOR','ADMINISTRADOR DEL SISTEMA','AC'),(2,'AUXILIAR','AUXILIAR DE CONTABILIDAD','AC');

UNLOCK TABLES;

/*Table structure for table `roleusr` */

DROP TABLE IF EXISTS `roleusr`;

CREATE TABLE `roleusr` (
  `ruid` int(11) NOT NULL AUTO_INCREMENT,
  `ruuserid` int(11) NOT NULL,
  `ruroleid` int(11) NOT NULL,
  PRIMARY KEY (`ruid`),
  UNIQUE KEY `ruuserid` (`ruuserid`,`ruroleid`),
  KEY `ruroleid` (`ruroleid`),
  CONSTRAINT `roleusr_ibfk_2` FOREIGN KEY (`ruroleid`) REFERENCES `role` (`rolid`),
  CONSTRAINT `roleusr_ibfk_3` FOREIGN KEY (`ruuserid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `roleusr` */

LOCK TABLES `roleusr` WRITE;

insert  into `roleusr`(`ruid`,`ruuserid`,`ruroleid`) values (17,19,1),(18,19,2);

UNLOCK TABLES;

/*Table structure for table `tipodescarga` */

DROP TABLE IF EXISTS `tipodescarga`;

CREATE TABLE `tipodescarga` (
  `tideCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `tideNombre` varchar(100) NOT NULL,
  `tideDescripcion` varchar(200) DEFAULT NULL,
  `tideEstado` varchar(2) DEFAULT 'AC',
  PRIMARY KEY (`tideCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tipodescarga` */

LOCK TABLES `tipodescarga` WRITE;

insert  into `tipodescarga`(`tideCodigo`,`tideNombre`,`tideDescripcion`,`tideEstado`) values (1,'Unidad',NULL,'AC'),(2,'Gramos',NULL,'AC'),(3,'Mililitros',NULL,'AC');

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `userpass` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `userdoc` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `userusu` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usertele` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `userdir` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usercorreo` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `userestado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userusu` (`userusu`),
  UNIQUE KEY `userdoc` (`userdoc`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`username`,`userpass`,`userdoc`,`userid`,`userusu`,`usertele`,`userdir`,`usercorreo`,`userestado`) values ('JESÚS MENDOZA','3c2a6eb64cc629de76c419308830c53bbe63b874f6a526f7cd784182b33a2f5f3daaab47b5bde5868b82e4dd3b521d147a7542292b689acdf60122b97e99523f','1042450864',19,'JMEN','3002119842','Calle 70 # 2-19','jmen95@misena.edu.co','AC');

UNLOCK TABLES;

CREATE TABLE Venta
(
ventId INT AUTO_INCREMENT NOT NULL,
ventCostoTotal INT NOT NULL,
venFechaRegistro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (ventId)
);
CREATE TABLE VentaDetalle
(
vedeId INT AUTO_INCREMENT NOT NULL,
vedeIdVenta INT NOT NULL,
vedeCodigoBarrasProducto VARCHAR(100)  COLLATE utf8_spanish2_ci NOT NULL,
vedeNombreProducto VARCHAR(700) NOT NULL,
vedePrecioVentaUnitarioProducto INT NOT NULL,
vedeCantidad INT NOT NULL,
vedeTotalPrecioVenta INT NOT NULL,
vedeDescuentoint INT,

PRIMARY KEY (vedeId)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;; 

ALTER TABLE ventadetalle ADD FOREIGN KEY (vedeIdVenta) REFERENCES venta(ventId)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ventadetalle ADD FOREIGN KEY (vedeCodigoBarrasProducto) REFERENCES producto(proCodigoBarra)
ON UPDATE CASCADE ON DELETE CASCADE;

/* Trigger structure for table `producto` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insertarPro` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insertarPro` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
    INSERT INTO auditoria(Fecha,Hora,Accion) VALUES (CURDATE(),curtime(),"Insertar");
    insert into movimientos values(0,NEW.proIdUsuario,NEW.proCodigoBarra,"Agregado",new.proStockBodega);
END */$$


DELIMITER ;

/* Trigger structure for table `producto` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `actualizarPro` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `actualizarPro` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
	DECLARE cantidad int;
	DECLARE accion varchar(100);
	INSERT INTO auditoria(Fecha,Hora,Accion) VALUES (CURDATE(),CURTIME(),"Insertar");
	IF OLD.proStockBodega<>new.proStockBodega THEN
		IF OLD.proStockBodega>NEW.proStockBodega THEN
			SET accion="Egreso";
			set cantidad=OLD.proStockBodega-NEW.proStockBodega;
		ELSE
			SET accion="Ingreso";
			SET cantidad=NEW.proStockBodega-OLD.proStockBodega;
		END IF;
		INSERT INTO movimientos VALUES(0,NEW.proIdUsuario,proCodigoBarra,accion,cantidad);
	END IF;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `cliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `cliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `cliente`(in cod int, in nom varchar(100), in dir varchar(100),in tel int)
BEGIN
	IF EXISTS(SELECT * FROM cliente WHERE cliCodigo=cod) THEN
	UPDATE  cliente SET cliNombre=nom,cliDireccion=dir,cliTelefono=tel WHERE cliCodigo =cod;
	SELECT "Se actualizado satisfactoriamente";
	ELSE
	INSERT INTO cliente VALUES(cod,nom,dir,tel);
	SELECT "Guardado satisfactoriamente";
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `consul` */

/*!50003 DROP PROCEDURE IF EXISTS  `consul` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `consul`(in cod int,in nom varchar(100))
BEGIN
	SELECT * FROM producto WHERE proCodigo=cod OR proNombre=nom;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `factura` */

/*!50003 DROP PROCEDURE IF EXISTS  `factura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `factura`(in cod int, in fi date,IN fl DATE,in codCli int, in codUsu int, in t int,IN codPro INT, IN cant INT,IN st INT)
BEGIN
		IF EXISTS(SELECT * FROM factura WHERE facCodigo=cod) THEN
			UPDATE  factura SET facTotalFactura=t WHERE facCodigo =cod;
		ELSE
			INSERT INTO factura VALUES(NULL,fi,fl,codCli,codUsu,t);
		END IF;
		CALL venta(cod,codPro,cant,st);
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `grupo` */

/*!50003 DROP PROCEDURE IF EXISTS  `grupo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `grupo`(IN nom VARCHAR(100))
BEGIN
	SELECT p.proCodigo AS Codigo,p.proFecha AS Fecha,p.proNombre AS Nombre,g.gruNombre AS Grupo,m.marNombre AS Marca,p.proStockMaximo AS Stock_Maximo,p.proStockMinimo AS Stock_Minimo, p.proStockBodega AS Stock_Bodega, p.proValorCompra AS Valor_Compra, p.proValorVenta AS Valor_Venta FROM producto p,marca m,grupo g WHERE p.proGruCodigo=g.gruCodigo AND p.proMarCodigo=m.marCodigo AND p.proEstado='Activo' AND g.gruNombre =nom;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Guardar` */

/*!50003 DROP PROCEDURE IF EXISTS  `Guardar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `Guardar`(in Codigo int,IN Nombre VARCHAR(100),IN MarCodigo INT,IN ValorCompra INT,IN ValorVenta INT,IN StockMaximo INT,IN StockMinimo INT,IN StockBodega INT ,IN GruCodigo INT,IN Estado varchar(100),IN Fecha DATE)
begin
IF exists(select * FROM producto where proCodigo=Codigo) then
update  producto set proCodigo=Codigo,proNombre=Nombre,proMarCodigo=MarCodigo,proValorCompra=ValorCompra,proValorVenta=ValorVenta,proStockMaximo=StockMaximo,proStockMinimo=StockMinimo,proStockBodega=StockBodega,proGruCodigo=GruCodigo,proEstado=Estado,proFecha=Fecha WHERE proCodigo =Codigo;
select "Se actualizado satisfactoriamente";
else
insert into producto values(Codigo,Nombre,MarCodigo,ValorCompra,ValorVenta,StockMaximo,StockMinimo,StockBodega,GruCodigo,Estado,Fecha);
select "Guardado satisfactoriamente";
end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `insertarGrupo` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarGrupo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `insertarGrupo`(IN nom VARCHAR(200))
BEGIN
IF EXISTS(SELECT* FROM grupo WHERE gruNombre=nom) THEN
	SELECT "Grupo existe";
ELSE
	INSERT INTO grupo VALUES(NULL,nom);
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarMarca` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarMarca` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `insertarMarca`(in nom varchar(200))
begin
if exists(select* from marca where marNombre=nom) then
	select "Marca existe";
else
	insert into marca values(null,nom);
end If;

end */$$
DELIMITER ;

/* Procedure structure for procedure `nombre` */

/*!50003 DROP PROCEDURE IF EXISTS  `nombre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `nombre`(in nom varchar(100))
BEGIN
	Select p.proCodigo as Codigo,p.proFecha as Fecha,p.proNombre as Nombre,g.gruNombre as Grupo,m.marNombre as Marca,p.proStockMaximo as Stock_Maximo,p.proStockMinimo as Stock_Minimo, p.proStockBodega as Stock_Bodega, p.proValorCompra as Valor_Compra, p.proValorVenta as Valor_Venta from producto p,marca m,grupo g where p.proGruCodigo=g.gruCodigo and p.proMarCodigo=m.marCodigo and p.proEstado='Activo' and p.proNombre like CONCAT('%',nom,'%');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `venta` */

/*!50003 DROP PROCEDURE IF EXISTS  `venta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `venta`(IN cod INT, IN codPro INT, IN cant INT,IN t INT)
BEGIN
	INSERT INTO venta VALUES(NULL,cod,codPro,cant,t);
	update producto set proStockBodega=proStockBodega-cant where proCodigo=codPro;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
