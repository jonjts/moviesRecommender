-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: movie_lens
-- ------------------------------------------------------
-- Server version	5.5.52

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `moods`
--

DROP TABLE IF EXISTS `moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moods`
--

LOCK TABLES `moods` WRITE;
/*!40000 ALTER TABLE `moods` DISABLE KEYS */;
INSERT INTO `moods` VALUES (20,'Barbarismo',0),(21,'Vida',0),(22,'Energia',0),(23,'Revolta',0),(24,'Ira',0),(25,'Perigo',0),(26,'Paixao',0),(27,'Dinamismo',0),(28,'Forca',0),(29,'Baixeza',0),(30,'Movimento',0),(31,'Coragem',0),(32,'Intensidade',0),(33,'Vigor',0),(34,'Pederio',0),(35,'Violencia',1),(36,'Excitacao',0),(37,'Calor',0),(38,'Gloria',0),(39,'Luminosidade',0),(40,'Estimulo',0),(41,'Vivacidade',0),(42,'Luxuria',0),(43,'Dureza',0),(44,'Euforia',0),(45,'Tentacao',0),(46,'Alegria',1),(47,'Advertencia',0),(48,'Traicao',1),(49,'Iluminacao',0),(50,'Corvadia',0),(51,'Vontade',0),(52,'Ciume',0),(53,'Orgulho',0),(54,'Fe',0),(55,'Sabedoria',0),(56,'Gozo',0),(57,'Alerta',0),(58,'Conforto',0),(59,'Esperanca',0),(60,'Amizade',0),(61,'Calma',0),(62,'Verdade',0),(63,'Equilíbrio',0),(64,'Saude',0),(65,'Seguranca',0),(66,'Ideal',0),(67,'Tranquilidade',1),(68,'Paz',0),(69,'Bem-estar',0),(70,'Serenidade',0),(71,'Abundancia',0),(72,'Juventude',0),(73,'Crenca',0),(74,'Adolescencia',0),(75,'Suavidade',0),(76,'Intelectualidade',0),(77,'Sentido',0),(78,'Preucupacao',0),(79,'Meditacao',0),(80,'Infinito',0),(81,'Nobreza',0),(82,'Confianca',1),(83,'Frieza',0),(84,'Limpeza',0),(85,'Repouso',0),(86,'Imaterialidade',0),(87,'Afastemento',0),(88,'Misterio',1),(89,'Profundidade',0),(90,'Fantasia',0),(91,'Dignidade',0),(92,'Justica',0),(93,'Eletricidade',0),(94,'Grandeza',0),(95,'Misticismo',0),(96,'Egoismo',0),(97,'Espiritualidade',0),(98,'Delicadeza',0),(99,'Angustia',1),(100,'Depressao',0),(101,'Intimidade',0),(102,'Feminilidade',0),(103,'Pompa',0),(104,'Valor',0),(105,'Satisfacao',0),(106,'Respeito',0),(107,'Poder',0),(108,'Riqueza',1),(109,'Pastosidade',0),(110,'Melancolia',1),(111,'Isolamento',1),(112,'Pesar',0),(113,'Humildade',0),(114,'Inocencia',0),(115,'Modetia',0),(116,'Afirmacao',0),(117,'Pureza',0),(118,'Piedade',0),(119,'Deleite',0),(120,'Despertar',0),(121,'Ordem',0),(122,'Pensamento',0),(123,'Simplicidade',0),(124,'Otimismo',1),(125,'Luz',0),(126,'Virtude',0),(127,'Leveza',0),(128,'Claridade',0),(129,'Amplitude',0),(130,'Sombra',0),(131,'Passividade',0),(132,'Tedio',0),(133,'Neutralidade',0),(134,'Tristeza',0),(135,'Compaixao',0),(136,'Passado',0),(137,'Velhice',0),(138,'Decadencia',0),(139,'Seriedade',0),(140,'Pena',0),(141,'Desanimo',0),(142,'Finura',0),(143,'Oposicao',0),(144,'Mal',0),(145,'Miseria',0),(146,'Dor',0),(147,'Nulidade',0),(148,'Vacuo',0),(149,'Agressividade',0),(150,'Medo',0),(151,'Opressao',0),(152,'Trevas',0),(153,'Negacao',0),(154,'Fatalidade',0),(155,'Sordidez',0),(156,'Pessimismo',0),(157,'Desgraca',0),(158,'Temor',0),(159,'Frigidez',0),(160,'Maldade',1);
/*!40000 ALTER TABLE `moods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 11:15:13
