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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `image_link` varchar(200) DEFAULT NULL,
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Adolfo','adolfoguimaraes@gmail.com','https://lh5.googleusercontent.com/-EJKkZ6Elfwo/AAAAAAAAAAI/AAAAAAAABHQ/R0feP3YUBb0/photo.jpg','2016-11-07 23:01:25'),(6,'Jonas','jonjts@gmail.com','https://lh3.googleusercontent.com/-94PqF4zCEdY/AAAAAAAAAAI/AAAAAAAAFYg/V9J8KA4zRXw/photo.jpg','2016-11-08 04:01:25'),(8,'Leandro','chvmbinh0@gmail.com','https://lh4.googleusercontent.com/-YhXyaXVRSM0/AAAAAAAAAAI/AAAAAAAABSo/rGAYA3N0phY/photo.jpg','2016-11-12 14:37:27'),(9,'Jonh','jonhpaulo.jp@gmail.com','https://lh3.googleusercontent.com/-m_emOc6Ohj0/AAAAAAAAAAI/AAAAAAAAAxs/XdpZFVr-Nmc/photo.jpg','2016-11-14 12:48:12'),(10,'karielly','karielly.kari@gmail.com','https://lh4.googleusercontent.com/-luoub99MZUI/AAAAAAAAAAI/AAAAAAAAASA/i_IdbiPXeA8/photo.jpg','2016-11-14 14:15:29'),(11,'Bruna','bruna.silva2095@gmail.com','https://lh3.googleusercontent.com/-UFZ_OOZiM7w/AAAAAAAAAAI/AAAAAAAADkw/YlosG1uFu0c/photo.jpg','2016-11-14 14:24:29'),(12,'Gabriel','gabriel.menezes96@unit.grupotiradentes.com','https://lh3.googleusercontent.com/-o3NPYR27rQk/AAAAAAAAAAI/AAAAAAAAAAA/DU64CaOvID8/photo.jpg','2016-11-14 15:26:48'),(13,'Lucas','lucas.grocha@unit.grupotiradentes.com','https://lh5.googleusercontent.com/-0Qu_xgHnzy8/AAAAAAAAAAI/AAAAAAAAAAs/ryF7PnrRPyo/photo.jpg','2016-11-14 15:37:24'),(14,'Victor','victor.flavio@unit.grupotiradentes.com','https://lh4.googleusercontent.com/-hAs4tdfvBkc/AAAAAAAAAAI/AAAAAAAAABk/nAcegWZaaJw/photo.jpg','2016-11-15 22:23:59'),(15,'Lucas','lucasgabriel@getinfo.net.br','https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg','2016-11-17 19:48:01'),(16,'Daiane','daianeaze16@gmail.com','https://lh4.googleusercontent.com/-ok7-pIgeTg0/AAAAAAAAAAI/AAAAAAAALoc/WclaSnuEBrc/photo.jpg','2016-11-21 16:15:15'),(17,'Chris','chmetavares@gmail.com','https://lh5.googleusercontent.com/-8xlYGfLeis4/AAAAAAAAAAI/AAAAAAAABJA/8tkP5jghXAU/photo.jpg','2016-11-22 18:53:09'),(18,'Diego','diegovenancio@growbit.com','https://lh5.googleusercontent.com/-dd5VvIN6wb4/AAAAAAAAAAI/AAAAAAAAABQ/55sbffw_cYo/photo.jpg','2016-11-22 20:43:42'),(19,'James','jamessouza@growbit.com','https://lh6.googleusercontent.com/-Weu88Lozhn8/AAAAAAAAAAI/AAAAAAAAABM/sg0ykmaNdM4/photo.jpg','2016-11-22 20:46:26'),(20,'Thaisley','thaiisley@gmail.com','https://lh5.googleusercontent.com/-tU2BiU_PEdk/AAAAAAAAAAI/AAAAAAAAFWM/JRXjcjwzfk4/photo.jpg','2016-11-22 20:49:32'),(21,'Igor','igorsantos1993@gmail.com','https://lh4.googleusercontent.com/-IgL5KzJxLnU/AAAAAAAAAAI/AAAAAAAAABI/GhNxFGcuHTg/photo.jpg','2016-11-22 20:52:33'),(22,'Luana','luana.adsantos1@gmail.com','https://lh3.googleusercontent.com/-MLRovRFzJ-A/AAAAAAAAAAI/AAAAAAAAACM/xQFmSJDIpa8/photo.jpg','2016-11-22 21:23:45'),(23,'Géssica','gssica.aragao@gmail.com','https://lh6.googleusercontent.com/-DCvziwxYfuU/AAAAAAAAAAI/AAAAAAAAAFo/O3GIbwZeqC0/photo.jpg','2016-11-22 22:59:51'),(24,'Stephany','pitephany@gmail.com','https://lh5.googleusercontent.com/-0xZXQ5mKTuc/AAAAAAAAAAI/AAAAAAAABJM/ODzctWlkm_E/photo.jpg','2016-11-22 23:01:09'),(25,'Thiago','thiagosobral@growbit.com','https://lh5.googleusercontent.com/-CJQOcO9dLC8/AAAAAAAAAAI/AAAAAAAAABg/vwbmiX6_mIs/photo.jpg','2016-11-22 23:28:32'),(26,'Marília','mariliaazevedosilveira@gmail.com','https://lh5.googleusercontent.com/-YuZ3rC6WLG0/AAAAAAAAAAI/AAAAAAAAAcw/qSmy2oC3o_c/photo.jpg','2016-11-22 23:35:22'),(27,'Humberto','humb.eliasj@gmail.com','https://lh6.googleusercontent.com/-KgVQoNIm0_Q/AAAAAAAAAAI/AAAAAAAAABc/vGdTG6XJwmQ/photo.jpg','2016-11-22 23:58:35'),(28,'turma','alvoradatti@gmail.com','https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg','2016-11-23 20:13:11'),(29,'Fernando','fernando013farmacia@gmail.com','https://lh5.googleusercontent.com/-cY0dXhMElfY/AAAAAAAAAAI/AAAAAAAAACQ/D1mpew903sg/photo.jpg','2016-11-24 17:45:06'),(30,'Carine','marilia.arqurb@gmail.com','https://lh5.googleusercontent.com/-YmgFdsKvpIM/AAAAAAAAAAI/AAAAAAAANPM/W3f2dOXb7UA/photo.jpg','2016-11-27 03:16:30'),(31,'Marcel','marcel3f@gmail.com','https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg','2016-11-28 20:36:03'),(32,'Letícia','leticia.soares.bonifacio@gmail.com','https://lh3.googleusercontent.com/-EJnjFqUCn4o/AAAAAAAAAAI/AAAAAAAABi4/jYi93YiKDs4/photo.jpg','2016-11-29 00:41:31'),(33,'Tawanny','tawanny.pimentel@gmail.com','https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg','2016-11-30 11:40:27'),(34,'Edson','xino.mbr@gmail.com','https://lh6.googleusercontent.com/-S5oPr72dhE8/AAAAAAAAAAI/AAAAAAAAJIg/RADUc9oqBHQ/photo.jpg','2016-11-30 13:02:59'),(35,'Raquel','raquelmctf@gmail.com','https://lh4.googleusercontent.com/-KsKsAP7HWWo/AAAAAAAAAAI/AAAAAAAAAFs/B-iC-o-PSaY/photo.jpg','2016-11-30 18:24:25'),(36,'Josy','josyyasmin18@gmail.com','https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg','2016-12-01 14:47:44'),(37,'José','jose.bsantos@unit.grupotiradentes.com','https://lh3.googleusercontent.com/-8iPvOLVIjCc/AAAAAAAAAAI/AAAAAAAAAAA/sdklvOqe5jM/photo.jpg','2016-12-06 03:09:02'),(38,'Tacyanne Bernadete','tacyblpimentel@gmail.com','https://lh6.googleusercontent.com/-AxD8OWDFlHw/AAAAAAAAAAI/AAAAAAAAwrk/8WH7CB7jPf8/photo.jpg','2016-12-07 21:14:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 11:14:42
