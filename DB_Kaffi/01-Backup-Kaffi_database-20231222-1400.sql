-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: kaffi_database
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Café','Variedades de café caliente'),(2,'Bebidas','Refrescos y bebidas frías'),(3,'Frappés','Bebidas frías y espumosas'),(4,'Especialidades','Productos especiales del chef'),(5,'Bagels','Panecillos de bagel con diversos rellenos'),(6,'Paninis','Sandwiches calientes prensados'),(7,'Cuernitos','Productos de panadería en forma de cuerno'),(8,'Waffles','Waffles dulces y salados'),(9,'Panes','Variedades de pan fresco');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id_orden` bigint NOT NULL AUTO_INCREMENT,
  `monto_total` decimal(9,2) DEFAULT NULL,
  `fecha_orden` timestamp NOT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `fk_ordenes_usuarios1_idx` (`id_usuario`),
  CONSTRAINT `fk_ordenes_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1,0.00,'2023-12-01 06:00:00',6),(2,0.00,'2023-12-02 06:00:00',7),(3,0.00,'2023-12-03 06:00:00',5),(4,0.00,'2023-12-04 06:00:00',5),(5,0.00,'2023-12-05 06:00:00',7);
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_has_productos`
--

DROP TABLE IF EXISTS `ordenes_has_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_has_productos` (
  `id_orden` bigint NOT NULL,
  `id_producto` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(9,2) NOT NULL,
  `total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_producto`),
  KEY `fk_ordenes_has_productos_productos1_idx` (`id_producto`),
  KEY `fk_ordenes_has_productos_ordenes1_idx` (`id_orden`),
  CONSTRAINT `fk_ordenes_has_productos_ordenes1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`),
  CONSTRAINT `fk_ordenes_has_productos_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_has_productos`
--

LOCK TABLES `ordenes_has_productos` WRITE;
/*!40000 ALTER TABLE `ordenes_has_productos` DISABLE KEYS */;
INSERT INTO `ordenes_has_productos` VALUES (1,2,1,25.00,25.00),(1,40,1,65.00,65.00),(2,24,4,65.00,260.00),(3,35,1,55.00,55.00),(3,38,1,60.00,60.00),(3,45,2,70.00,140.00),(4,2,4,25.00,100.00),(5,40,2,65.00,130.00);
/*!40000 ALTER TABLE `ordenes_has_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `img_url` varchar(120) NOT NULL,
  `id_categoria` bigint NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_categorias1_idx` (`id_categoria`),
  CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Café Americano',50.00,'Café espresso mezclado con agua caliente','../images/imagenes-menu/Cafes/cafe_americano.png',1),(2,'Espresso',25.00,'Un tiro de café concentrado','../images/imagenes-menu/Cafes/cafe_espresso.jpg',1),(3,'Doble',30.00,'Doble tiro de café espresso','../images/imagenes-menu/Cafes/Doble.png',1),(4,'Café latte',50.00,'Café espresso con una generosa cantidad de leche vaporizada','../images/imagenes-menu/Cafes/Cafe-latte.png',1),(5,'Capuccino',50.00,'Mezcla equilibrada de café espresso, leche vaporizada y espuma de leche','../images/imagenes-menu/Cafes/Capuccino.png',1),(6,'Café de olla',39.00,'Café infusionado con especias y piloncillo','../images/imagenes-menu/Cafes/Cafe-olla.png',1),(7,'Mocha',55.00,'Café espresso con jarabe de chocolate y leche vaporizada','../images/imagenes-menu/Cafes/Mocha.png',1),(8,'Mocha blanco',55.00,'Café espresso con jarabe de vainilla, chocolate blanco y leche vaporizada','../images/imagenes-menu/Cafes/Mocha-blanco.png',1),(9,'Nutellate',55.00,'Café con leche infusionado con deliciosa crema de avellanas Nutella','../images/imagenes-menu/Cafes/Nutellate.png',1),(10,'Dirty chai',60.00,'Chai latte con un toque de espresso','../images/imagenes-menu/Cafes/Dirty-chai.png',1),(11,'Affogato',40.00,'Bola de helado cubierta con un shot caliente de espresso','../images/imagenes-menu/Cafes/cafe_affogato.jpg',1),(12,'Matcha latte',50.00,'Bebida sabor Matcha','../images/imagenes-menu/Bebidas/matcha_latte.png',2),(13,'Chai latte',55.00,'Bebida sabor chai','../images/imagenes-menu/Bebidas/chai-latte.png',2),(14,'Chocolate',45.00,'Bebida sabor chocolate','../images/imagenes-menu/Bebidas/bebidas_chocolate.jpg',2),(15,'Smoothie (mango/fresa)',55.00,'Bebida sabor mango o fresa','../images/imagenes-menu/Bebidas/bebidas_smoothiemango.jpg',2),(16,'Licuado de frutos rojos',58.00,'Bebida sabor frutos rojos, fresa, frambuesa y arándano','../images/imagenes-menu/Bebidas/bebidas_licuado.jpg',2),(17,'Curacao azul',45.00,'Bebida con alcohol de cáscaras de naranja amarga con jarabe de azúcar refinada','../images/imagenes-menu/Bebidas/bebidas_curacaoazul.jpg',2),(18,'Soda italiana',45.00,'Bebida con agua gasificada y jarabe de fruta natural','../images/imagenes-menu/Bebidas/Soda-italiana.png',2),(19,'Tisanas',45.00,'Bebida sabor frutas deshidratadas','../images/imagenes-menu/Bebidas/bebidas_tisana.jpg',2),(20,'Café',65.00,'Frappe con sabor a café','../images/imagenes-menu/Frappes/Cafe.png',3),(21,'Oreo',65.00,'Frappe hecho con un rico sabor a chocolate, un toque de café y trozos de galleta oreo','../images/imagenes-menu/Frappes/frappes_oreo.jpg',3),(22,'Mocha',65.00,'Frappe con sabor a chocolate y café','../images/imagenes-menu/Frappes/frappes_mocha.jpg',3),(23,'Mocha blanco',65.00,'Frappe con sabor a chocolate blanco y café','../images/imagenes-menu/Frappes/frappes_mochablanco.jpg',3),(24,'Chai cream',65.00,'Frappe con sabor a chai y crema','../images/imagenes-menu/Frappes/Chai-cream.png',3),(25,'Irlandés',65.00,'Frappe con un toque irlandés y café','../images/imagenes-menu/Frappes/Irlandes.png',3),(26,'Nuez',65.00,'Frappe con sabor a nuez','../images/imagenes-menu/Frappes/frappes_nuez.jpg',3),(27,'Caramelo',65.00,'Frappe con sabor a caramelo','../images/imagenes-menu/Frappes/frappes_caramelo.jpg',3),(28,'Kinder bueno',70.00,'Frappe con sabor a Kinder Bueno','../images/imagenes-menu/Frappes/frappes_kinderbueno.jpg',3),(29,'Nutella',70.00,'Frappe con sabor a Nutella','../images/imagenes-menu/Frappes/Nutella.png',3),(30,'Chocoberry',65.00,'Frappe con sabor a chocolate y bayas','../images/imagenes-menu/Frappes/frappes_chocoberry.jpg',3),(31,'Fresas con crema',70.00,'Frappe con sabor a fresas y crema','../images/imagenes-menu/Frappes/Fresas-con-crema.png',3),(32,'Chocomenta',70.00,'Frappe con sabor a chocolate y menta','../images/imagenes-menu/Frappes/frappes_chocomenta.jpg',3),(33,'Green matcha',65.00,'Frappe con sabor a matcha verde','../images/imagenes-menu/Frappes/Green.matcha.png',3),(34,'Sea Salt Caramel',60.00,'Delicioso dulce de caramelo con chocolate con un toque de sal','../images/imagenes-menu/Especialidades/Sea-salt-caramel.png',4),(35,'Dark horchata ice',55.00,'Horchata con trozos de canela y un toque de café','../images/imagenes-menu/Especialidades/Dark-horchata-ice.png',4),(36,'Tonicoffee',55.00,'Una capa de café y agua con una temperatura fría','../images/imagenes-menu/Especialidades/tonicoffee.png',4),(37,'Chocolate bomb',65.00,'Bomba de chocolate con explosión de sabor','../images/imagenes-menu/Especialidades/Chocolate-bomb.png',4),(38,'Vainilla Macchiato',60.00,'Café con leche y un toque de vainilla','../images/imagenes-menu/Especialidades/Vainilla-macchiato.png',4),(39,'Cinnamon Latte',60.00,'Café con leche y canela para un toque especiado','../images/imagenes-menu/Especialidades/Cinnamon-latte.png',4),(40,'Bagel clásico',65.00,'Bagel tostado con jamón, queso, lechuga, tomate y aderezada con mayonesa','../images/imagenes-menu/Bagels/clasico.jpg',5),(41,'Bagel serrano',80.00,'Bagel tostado de parmesano con jamón serrano, queso manchego, tomate cherry, arúgula y aceite balsámico','../images/imagenes-menu/Bagels/serrano.png',5),(42,'Bagel dulce/salado',40.00,'Bagel tostado con queso crema y mermelada de fresa','../images/imagenes-menu/Bagels/dulce-salado.png',5),(43,'Bagel pizza',65.00,'Bagel tostado con salsa de tomate, peperoni, salami, queso mozzarella y orégano','../images/imagenes-menu/Bagels/pizza.png',5),(44,'Panini italiano',70.00,'Pan artesanal con salami, queso, lechuga, tomate, aderezo, con mayonesa y aceite balsámico','../images/imagenes-menu/Paninis/panini_italiano.jpg',6),(45,'Pizanini',70.00,'Pan artesanal con salsa de tomate, peperoni, salami, queso mozzarella y una pisca de orégano','../images/imagenes-menu/Paninis/paninis_pizzanini.jpg',6),(46,'Panini vegetariano',70.00,'Pan artesanal con lechuga, espinaca, tomate, champiñones, y aderezado con mayonesa de aguacate','../images/imagenes-menu/Paninis/panini_vegetariano.jpg',6),(47,'Cuernito clásico',65.00,'Croissant hojaldrado con jamón, queso, alfalfa, aderezado con mayonesa','../images/imagenes-menu/Cuernitos/cuernitos_clasico.jpg',7),(48,'Cuernito italiano',65.00,'Croissant hojaldrado con jamón, queso, lechuga, tomate y aderezado con mayonesa','../images/imagenes-menu/Cuernitos/cuernito_italiano.jpg',7),(49,'Waffle tradicional',80.00,'Waffle con nuez, chocolate líquido y crema batida','../images/imagenes-menu/Waffles/waffle-tradicional.png',8),(50,'Waffle con helado o fresas',90.00,'Waffle con nuez, chocolate líquido, helado de vainilla o fresas','../images/imagenes-menu/Waffles/waffle-con-helado-o-fresas.png',8),(51,'Brownie',20.00,'Bizcocho de chocolate pequeño con nueces','../images/imagenes-menu/Panes/panes_brownie.jpg',9),(52,'Rol de canela',45.00,'Delicioso rollo de masa con canela y glaseado','../images/imagenes-menu/Panes/pan_rolcanela.jpg',9),(53,'Pan de zanahoria',45.00,'Pan esponjoso con zanahoria rallada y nueces','../images/imagenes-menu/Panes/pan_zanahoria.jpg',9),(54,'Pan de elote',45.00,'Pan suave y esponjoso con granos de elote','../images/imagenes-menu/Panes/pan_elote.jpg',9),(55,'Galleta de chispas',40.00,'Galleta crujiente con deliciosas chispas de chocolate','../images/imagenes-menu/Panes/galleta-de-chispas.png',9),(56,'Galleta de M&M\'s',40.00,'Galleta con coloridas y sabrosas M&M\'s','../images/imagenes-menu/Panes/galletas-m&m\'s.png',9),(57,'Croissant',37.00,'Clásico croissant hojaldrado y delicioso','../images/imagenes-menu/Panes/croissants.png',9),(58,'Brownie con helado',55.00,'Brownie acompañado de una bola de helado','../images/imagenes-menu/Panes/brownie-con-helado.png',9);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_usuarios`
--

DROP TABLE IF EXISTS `tipos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_usuarios` (
  `id_tipo_usuario` bigint NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(25) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_usuarios`
--

LOCK TABLES `tipos_usuarios` WRITE;
/*!40000 ALTER TABLE `tipos_usuarios` DISABLE KEYS */;
INSERT INTO `tipos_usuarios` VALUES (1,'Administrador','Administrador de página Kaffi-Ecommerce'),(2,'Cliente','Usuario con cuenta creada en Kaffi-Ecommerce');
/*!40000 ALTER TABLE `tipos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(45) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `id_tipo_usuario` bigint NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_tipo_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_usuarios_tipos_usuarios_idx` (`id_tipo_usuario`),
  CONSTRAINT `fk_usuarios_tipos_usuarios` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_usuarios` (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Oswaldo','Fonseca Mejia','leonNeumann.26121990@gmail.com','Code_Titans123','Beberly Hills 90210',1),(2,'Fernando','Juarez Sanchez','juarezsfw@outlook.com','Code_Titans123','Fondo de bikin No.154',1),(3,'Alan','Villa Ocampo','zailancoc@gmail.com','Code_Titans123','Fondo de bikin No.897',1),(4,'Rafael','Ceniceros Ceballos','rrafa7114@gmail.com','Code_Titans123','Fondo de bikin No.897',1),(5,'Cristiano Ronaldo','Dos Santos Aveiro','CR7_oficial@gmail.com','Code_Titans123','Al Nassir 15432 Arabia SAudita',2),(6,'Andrés Manuel','López Obrador','AMLO_4T@gmail.com','Code_Titans123','Palacio Nacional CDMX',2),(7,'Isaac','Newton','fisicomuerto@gmail.com','Code_Titans123','Woolsthorpe Manor Hous',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-22 13:59:51
