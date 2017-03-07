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
-- Table structure for table `mood_type`
--

DROP TABLE IF EXISTS `mood_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mood_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mood_id` int(11) NOT NULL,
  `generic_mood_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`mood_id`,`generic_mood_id`),
  KEY `fk_mood_type_moods1_idx` (`mood_id`),
  KEY `fk_mood_type_generic_mood1_idx` (`generic_mood_id`),
  CONSTRAINT `fk_mood_type_generic_mood1` FOREIGN KEY (`generic_mood_id`) REFERENCES `generic_moods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mood_type_moods1` FOREIGN KEY (`mood_id`) REFERENCES `moods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood_type`
--

LOCK TABLES `mood_type` WRITE;
/*!40000 ALTER TABLE `mood_type` DISABLE KEYS */;
INSERT INTO `mood_type` VALUES (1,35,1),(4,46,2),(2,48,1),(5,48,2),(6,67,2),(17,67,6),(7,82,2),(16,82,5),(13,99,2),(8,108,2),(15,108,4),(10,110,4),(12,110,4),(9,111,4),(14,124,2),(3,160,1),(11,160,4);
/*!40000 ALTER TABLE `mood_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 11:14:47
