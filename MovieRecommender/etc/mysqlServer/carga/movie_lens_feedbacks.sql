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
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`movie_id`,`user_id`),
  KEY `fk_feedbacks_movies1_idx` (`movie_id`),
  KEY `fk_feedbacks_user1_idx` (`user_id`),
  CONSTRAINT `fk_feedbacks_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedbacks_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (601,133545,3,'2016-11-20 18:26:51',99),(602,91873,3,'2016-11-20 18:26:51',99),(603,113741,3,'2016-11-20 18:26:51',99),(604,144620,3,'2016-11-20 18:26:52',99),(605,98604,3,'2016-11-20 18:26:52',99),(606,105468,3,'2016-11-20 18:26:52',4),(607,145935,3,'2016-11-20 18:26:52',99),(608,149406,3,'2016-11-20 18:26:52',5),(609,85438,3,'2016-11-20 18:26:52',99),(610,103819,3,'2016-11-20 18:26:52',99),(611,54272,3,'2016-11-20 18:26:52',5),(612,3384,3,'2016-11-20 18:26:52',99),(613,215,3,'2016-11-20 18:26:52',99),(614,59590,3,'2016-11-20 18:26:52',99),(615,58559,3,'2016-11-20 18:26:52',2),(616,1301,3,'2016-11-20 18:26:52',99),(617,1209,3,'2016-11-20 18:26:52',99),(618,5893,3,'2016-11-20 18:26:52',99),(619,27731,3,'2016-11-20 18:26:52',99),(620,1809,3,'2016-11-20 18:26:52',99),(621,105585,8,'2016-11-20 19:11:10',1),(622,129354,8,'2016-11-20 19:11:10',3),(623,99415,8,'2016-11-20 19:11:10',1),(624,104337,8,'2016-11-20 19:11:10',1),(625,140267,8,'2016-11-20 19:11:10',5),(626,88129,8,'2016-11-20 19:11:10',1),(627,114074,8,'2016-11-20 19:11:10',1),(628,130634,8,'2016-11-20 19:11:11',3),(629,96432,8,'2016-11-20 19:11:11',1),(630,117444,8,'2016-11-20 19:11:11',1),(631,1625,8,'2016-11-20 19:11:11',3),(632,93840,8,'2016-11-20 19:11:11',5),(633,1784,8,'2016-11-20 19:11:11',1),(634,1357,8,'2016-11-20 19:11:11',1),(635,1873,8,'2016-11-20 19:11:11',5),(636,5015,8,'2016-11-20 19:11:11',99),(637,1827,8,'2016-11-20 19:11:11',99),(638,59519,8,'2016-11-20 19:11:11',99),(639,63876,8,'2016-11-20 19:11:11',99),(640,39292,8,'2016-11-20 19:11:11',99),(641,101106,8,'2016-11-20 19:12:34',99),(642,105593,8,'2016-11-20 19:12:34',99),(643,90647,8,'2016-11-20 19:12:34',3),(644,84615,8,'2016-11-20 19:12:34',99),(645,93855,8,'2016-11-20 19:12:34',99),(646,149406,8,'2016-11-20 19:12:34',3),(647,100032,8,'2016-11-20 19:12:34',99),(648,83086,8,'2016-11-20 19:12:34',99),(649,146309,8,'2016-11-20 19:12:34',4),(650,113741,8,'2016-11-20 19:12:34',99),(651,58559,8,'2016-11-20 19:12:34',5),(652,2692,8,'2016-11-20 19:12:34',5),(653,58998,8,'2016-11-20 19:12:34',99),(654,54272,8,'2016-11-20 19:12:34',4),(655,3527,8,'2016-11-20 19:12:34',5),(656,4327,8,'2016-11-20 19:12:34',99),(657,63082,8,'2016-11-20 19:12:34',99),(658,215,8,'2016-11-20 19:12:34',99),(659,5223,8,'2016-11-20 19:12:34',99),(660,112852,8,'2016-11-20 19:12:34',4),(661,131168,8,'2016-11-20 19:47:29',99),(662,81083,8,'2016-11-20 19:47:29',99),(663,145935,8,'2016-11-20 19:47:29',99),(664,103819,8,'2016-11-20 19:47:29',99),(665,144620,8,'2016-11-20 19:47:29',4),(666,81562,8,'2016-11-20 19:47:29',4),(667,133545,8,'2016-11-20 19:47:29',99),(668,106236,8,'2016-11-20 19:47:30',99),(669,98604,8,'2016-11-20 19:47:30',4),(670,91873,8,'2016-11-20 19:47:30',99),(671,26111,8,'2016-11-20 19:47:30',99),(672,8928,8,'2016-11-20 19:47:30',99),(673,92163,8,'2016-11-20 19:47:30',99),(674,1190,8,'2016-11-20 19:47:30',99),(675,79686,8,'2016-11-20 19:47:30',99),(676,5385,8,'2016-11-20 19:47:30',99),(677,264,8,'2016-11-20 19:47:30',99),(678,3504,8,'2016-11-20 19:47:30',99),(679,2550,8,'2016-11-20 19:47:30',99),(680,6971,8,'2016-11-20 19:47:30',99),(681,86781,11,'2016-11-21 00:05:04',4),(682,82463,11,'2016-11-21 00:05:04',99),(683,110194,11,'2016-11-21 00:05:04',2),(684,90057,11,'2016-11-21 00:05:04',2),(685,107771,11,'2016-11-21 00:05:04',99),(686,80906,11,'2016-11-21 00:05:04',4),(687,121491,11,'2016-11-21 00:05:04',99),(688,66297,11,'2016-11-21 00:05:04',1),(689,76173,11,'2016-11-21 00:05:04',99),(690,57243,11,'2016-11-21 00:05:04',99),(691,5752,11,'2016-11-21 00:05:04',99),(692,7089,11,'2016-11-21 00:05:04',99),(693,8989,11,'2016-11-21 00:05:04',99),(694,69458,11,'2016-11-21 00:05:04',2),(695,1031,11,'2016-11-21 00:05:04',2),(696,32025,11,'2016-11-21 00:05:04',99),(717,101285,3,'2016-11-21 18:47:50',99),(718,129354,3,'2016-11-21 18:47:50',99),(719,117444,3,'2016-11-21 18:47:50',99),(720,87444,3,'2016-11-21 18:47:50',99),(721,101884,3,'2016-11-21 18:47:50',99),(722,108506,3,'2016-11-21 18:47:50',99),(723,90522,3,'2016-11-21 18:47:50',99),(724,125916,3,'2016-11-21 18:47:50',3),(725,88744,3,'2016-11-21 18:47:50',2),(726,119068,3,'2016-11-21 18:47:50',99),(727,45210,3,'2016-11-21 18:47:50',99),(728,76091,3,'2016-11-21 18:47:50',99),(729,33162,3,'2016-11-21 18:47:50',99),(730,49961,3,'2016-11-21 18:47:50',99),(731,72641,3,'2016-11-21 18:47:50',99),(732,59519,3,'2016-11-21 18:47:50',99),(733,104272,3,'2016-11-21 18:47:50',99),(734,47423,3,'2016-11-21 18:47:50',99),(735,6323,3,'2016-11-21 18:47:50',99),(736,553,3,'2016-11-21 18:47:50',99),(737,89087,3,'2016-11-21 18:51:03',99),(738,104906,3,'2016-11-21 18:51:03',99),(739,95135,3,'2016-11-21 18:51:03',99),(740,96488,3,'2016-11-21 18:51:03',99),(741,75985,3,'2016-11-21 18:51:03',99),(742,85774,3,'2016-11-21 18:51:03',4),(743,111680,3,'2016-11-21 18:51:04',99),(744,106491,3,'2016-11-21 18:51:04',99),(745,142448,3,'2016-11-21 18:51:04',99),(746,95449,3,'2016-11-21 18:51:04',99),(747,586,3,'2016-11-21 18:51:04',4),(748,1036,3,'2016-11-21 18:51:04',99),(749,492,3,'2016-11-21 18:51:04',99),(750,2867,3,'2016-11-21 18:51:04',99),(751,90439,3,'2016-11-21 18:51:04',99),(752,34405,3,'2016-11-21 18:51:04',99),(753,96728,3,'2016-11-21 18:51:04',99),(754,30816,3,'2016-11-21 18:51:04',4),(755,407,3,'2016-11-21 18:51:04',99),(756,60333,3,'2016-11-21 18:51:04',99),(757,107771,12,'2016-11-21 19:52:58',3),(758,110194,12,'2016-11-21 19:52:58',5),(759,82463,12,'2016-11-21 19:52:58',1),(760,80906,12,'2016-11-21 19:52:58',99),(761,86781,12,'2016-11-21 19:52:58',3),(762,90057,12,'2016-11-21 19:52:58',5),(763,69458,12,'2016-11-21 19:52:58',99),(764,1031,12,'2016-11-21 19:52:58',99),(765,8983,12,'2016-11-21 19:52:58',3),(766,5954,12,'2016-11-21 19:52:58',3),(767,7011,12,'2016-11-21 19:52:58',5),(768,55687,12,'2016-11-21 19:52:58',2),(769,37240,12,'2016-11-21 19:52:58',NULL),(770,1951,12,'2016-11-21 19:52:58',2),(771,68237,12,'2016-11-21 19:52:58',99),(772,95115,12,'2016-11-21 19:52:59',99),(773,116823,14,'2016-11-22 18:06:19',1),(774,106236,14,'2016-11-22 18:06:19',99),(775,98604,14,'2016-11-22 18:06:19',99),(776,146309,14,'2016-11-22 18:06:19',99),(777,106542,14,'2016-11-22 18:06:19',99),(778,88785,14,'2016-11-22 18:06:19',4),(779,101106,14,'2016-11-22 18:06:19',99),(780,149406,14,'2016-11-22 18:06:19',2),(781,112852,14,'2016-11-22 18:06:19',5),(782,133545,14,'2016-11-22 18:06:19',3),(783,1209,14,'2016-11-22 18:06:19',2),(784,60135,14,'2016-11-22 18:06:20',99),(785,1233,14,'2016-11-22 18:06:20',99),(786,26655,14,'2016-11-22 18:06:20',99),(787,63082,14,'2016-11-22 18:06:20',99),(788,2857,14,'2016-11-22 18:06:20',5),(789,26,14,'2016-11-22 18:06:20',99),(790,8094,14,'2016-11-22 18:06:20',99),(791,4190,14,'2016-11-22 18:06:20',99),(792,59590,14,'2016-11-22 18:06:20',99),(793,90057,3,'2016-11-22 19:09:39',99),(794,110194,3,'2016-11-22 19:09:39',99),(795,107771,3,'2016-11-22 19:09:39',99),(796,86781,3,'2016-11-22 19:09:39',99),(797,80906,3,'2016-11-22 19:09:39',99),(798,82463,3,'2016-11-22 19:09:39',99),(799,1951,3,'2016-11-22 19:09:39',99),(800,5878,3,'2016-11-22 19:09:39',99),(801,8983,3,'2016-11-22 19:09:39',99),(802,7089,3,'2016-11-22 19:09:40',99),(803,60943,3,'2016-11-22 19:09:40',99),(804,854,3,'2016-11-22 19:09:40',99),(805,45928,3,'2016-11-22 19:09:40',99),(806,57243,3,'2016-11-22 19:09:40',99),(807,4799,3,'2016-11-22 19:09:40',99),(808,31435,3,'2016-11-22 19:09:40',99),(809,101884,17,'2016-11-22 19:28:15',99),(810,140267,17,'2016-11-22 19:28:15',NULL),(811,157296,17,'2016-11-22 19:28:15',NULL),(812,92198,17,'2016-11-22 19:28:15',NULL),(813,87785,17,'2016-11-22 19:28:15',NULL),(814,135133,17,'2016-11-22 19:28:15',NULL),(815,86911,17,'2016-11-22 19:28:15',3),(816,142507,17,'2016-11-22 19:28:15',NULL),(817,96488,17,'2016-11-22 19:28:15',NULL),(818,106002,17,'2016-11-22 19:28:15',NULL),(819,57669,17,'2016-11-22 19:28:15',NULL),(820,85412,17,'2016-11-22 19:28:15',NULL),(821,45210,17,'2016-11-22 19:28:15',NULL),(822,130634,17,'2016-11-22 19:28:15',NULL),(823,492,17,'2016-11-22 19:28:15',NULL),(824,134881,17,'2016-11-22 19:28:15',NULL),(825,7459,17,'2016-11-22 19:28:15',4),(826,54881,17,'2016-11-22 19:28:15',NULL),(827,122900,17,'2016-11-22 19:28:15',NULL),(828,37733,17,'2016-11-22 19:28:15',NULL),(829,131168,17,'2016-11-22 19:36:16',4),(830,109183,17,'2016-11-22 19:36:16',NULL),(831,103137,17,'2016-11-22 19:36:16',NULL),(832,81083,17,'2016-11-22 19:36:16',NULL),(833,78499,17,'2016-11-22 19:36:16',1),(834,130073,17,'2016-11-22 19:36:16',1),(835,113741,17,'2016-11-22 19:36:16',NULL),(836,96588,17,'2016-11-22 19:36:16',99),(837,116887,17,'2016-11-22 19:36:16',2),(838,129428,17,'2016-11-22 19:36:16',99),(839,6971,17,'2016-11-22 19:36:16',NULL),(840,264,17,'2016-11-22 19:36:16',99),(841,2048,17,'2016-11-22 19:36:16',1),(842,3142,17,'2016-11-22 19:36:16',99),(843,1262,17,'2016-11-22 19:36:16',99),(844,1889,17,'2016-11-22 19:36:16',NULL),(845,4218,17,'2016-11-22 19:36:16',99),(846,70,17,'2016-11-22 19:36:16',NULL),(847,5385,17,'2016-11-22 19:36:16',99),(848,7947,17,'2016-11-22 19:36:16',99),(849,146309,17,'2016-11-22 19:40:55',NULL),(850,91873,17,'2016-11-22 19:40:55',NULL),(851,106236,17,'2016-11-22 19:40:55',NULL),(852,105593,17,'2016-11-22 19:40:55',NULL),(853,103819,17,'2016-11-22 19:40:55',NULL),(854,98243,17,'2016-11-22 19:40:55',NULL),(855,84615,17,'2016-11-22 19:40:55',NULL),(856,112852,17,'2016-11-22 19:40:55',NULL),(857,83086,17,'2016-11-22 19:40:55',NULL),(858,98604,17,'2016-11-22 19:40:55',NULL),(859,215,17,'2016-11-22 19:40:56',NULL),(860,2692,17,'2016-11-22 19:40:56',NULL),(861,412,17,'2016-11-22 19:40:56',99),(862,69458,17,'2016-11-22 19:40:56',NULL),(863,5354,17,'2016-11-22 19:40:56',99),(864,17,17,'2016-11-22 19:40:56',99),(865,5893,17,'2016-11-22 19:40:56',99),(866,6879,17,'2016-11-22 19:40:56',NULL),(867,2919,17,'2016-11-22 19:40:56',99),(868,149406,17,'2016-11-22 19:40:56',5),(869,110194,18,'2016-11-22 20:50:36',NULL),(870,152057,18,'2016-11-22 20:50:36',NULL),(871,103980,18,'2016-11-22 20:50:36',NULL),(872,86781,18,'2016-11-22 20:50:36',NULL),(873,94677,18,'2016-11-22 20:50:36',NULL),(874,79242,18,'2016-11-22 20:50:36',NULL),(875,104595,18,'2016-11-22 20:50:36',NULL),(876,112006,18,'2016-11-22 20:50:36',NULL),(877,98604,18,'2016-11-22 20:50:36',NULL),(878,102378,18,'2016-11-22 20:50:36',NULL),(879,8574,18,'2016-11-22 20:50:36',NULL),(880,50601,18,'2016-11-22 20:50:36',NULL),(881,26812,18,'2016-11-22 20:50:36',NULL),(882,587,18,'2016-11-22 20:50:36',NULL),(883,8989,18,'2016-11-22 20:50:36',NULL),(884,121491,18,'2016-11-22 20:50:36',NULL),(885,4102,18,'2016-11-22 20:50:36',NULL),(886,55031,18,'2016-11-22 20:50:36',NULL),(887,2467,18,'2016-11-22 20:50:36',NULL),(888,31410,18,'2016-11-22 20:50:36',NULL),(889,131168,18,'2016-11-22 20:52:37',NULL),(890,109183,18,'2016-11-22 20:52:37',NULL),(891,103137,18,'2016-11-22 20:52:37',NULL),(892,85412,18,'2016-11-22 20:52:37',NULL),(893,81083,18,'2016-11-22 20:52:37',NULL),(894,78499,18,'2016-11-22 20:52:37',NULL),(895,162376,18,'2016-11-22 20:52:37',NULL),(896,100390,18,'2016-11-22 20:52:37',NULL),(897,78637,18,'2016-11-22 20:52:37',NULL),(898,78499,18,'2016-11-22 20:52:37',NULL),(899,3783,18,'2016-11-22 20:52:37',NULL),(900,4716,18,'2016-11-22 20:52:37',NULL),(901,1262,18,'2016-11-22 20:52:37',NULL),(902,7934,18,'2016-11-22 20:52:37',NULL),(903,26111,18,'2016-11-22 20:52:37',NULL),(904,4218,18,'2016-11-22 20:52:37',NULL),(905,3142,18,'2016-11-22 20:52:37',NULL),(906,2640,18,'2016-11-22 20:52:37',NULL),(907,40278,18,'2016-11-22 20:52:37',NULL),(908,60487,18,'2016-11-22 20:52:37',5),(909,131168,20,'2016-11-22 20:53:02',99),(910,109183,20,'2016-11-22 20:53:02',99),(911,85412,20,'2016-11-22 20:53:02',99),(912,78499,20,'2016-11-22 20:53:03',1),(913,81083,20,'2016-11-22 20:53:03',99),(914,103137,20,'2016-11-22 20:53:03',99),(915,103772,20,'2016-11-22 20:53:03',5),(916,134025,20,'2016-11-22 20:53:03',99),(917,118702,20,'2016-11-22 20:53:03',99),(918,91134,20,'2016-11-22 20:53:03',99),(919,26111,20,'2016-11-22 20:53:03',NULL),(920,1190,20,'2016-11-22 20:53:03',99),(921,60487,20,'2016-11-22 20:53:03',99),(922,7947,20,'2016-11-22 20:53:03',99),(923,4716,20,'2016-11-22 20:53:03',99),(924,1949,20,'2016-11-22 20:53:03',99),(925,7934,20,'2016-11-22 20:53:03',99),(926,1345,20,'2016-11-22 20:53:04',99),(927,2640,20,'2016-11-22 20:53:04',5),(928,1262,20,'2016-11-22 20:53:04',99),(929,110194,21,'2016-11-22 20:56:00',99),(930,86781,21,'2016-11-22 20:56:00',3),(931,80906,21,'2016-11-22 20:56:00',99),(932,107771,21,'2016-11-22 20:56:00',99),(933,90057,21,'2016-11-22 20:56:00',99),(934,82463,21,'2016-11-22 20:56:00',99),(935,4799,21,'2016-11-22 20:56:00',99),(936,7089,21,'2016-11-22 20:56:00',99),(937,95115,21,'2016-11-22 20:56:00',99),(938,854,21,'2016-11-22 20:56:00',99),(939,48682,21,'2016-11-22 20:56:00',99),(940,5752,21,'2016-11-22 20:56:00',99),(941,8983,21,'2016-11-22 20:56:00',4),(942,32025,21,'2016-11-22 20:56:00',99),(943,5878,21,'2016-11-22 20:56:00',99),(944,60293,21,'2016-11-22 20:56:00',99),(945,129937,21,'2016-11-22 21:15:22',2),(946,90249,21,'2016-11-22 21:15:22',2),(947,91323,21,'2016-11-22 21:15:22',3),(948,95135,21,'2016-11-22 21:15:22',5),(949,87298,21,'2016-11-22 21:15:22',4),(950,104906,21,'2016-11-22 21:15:22',99),(951,133782,21,'2016-11-22 21:15:22',99),(952,114265,21,'2016-11-22 21:15:22',NULL),(953,96655,21,'2016-11-22 21:15:22',NULL),(954,129354,21,'2016-11-22 21:15:22',NULL),(955,728,21,'2016-11-22 21:15:22',NULL),(956,102716,21,'2016-11-22 21:15:22',1),(957,8983,21,'2016-11-22 21:15:22',2),(958,99112,21,'2016-11-22 21:15:22',NULL),(959,85412,21,'2016-11-22 21:15:22',1),(960,87304,21,'2016-11-22 21:15:22',NULL),(961,54881,21,'2016-11-22 21:15:22',NULL),(962,7143,21,'2016-11-22 21:15:22',3),(963,2867,21,'2016-11-22 21:15:22',2),(964,1036,21,'2016-11-22 21:15:22',NULL),(965,110194,22,'2016-11-22 21:27:22',NULL),(966,107771,22,'2016-11-22 21:27:22',NULL),(967,90057,22,'2016-11-22 21:27:22',NULL),(968,82463,22,'2016-11-22 21:27:23',NULL),(969,86781,22,'2016-11-22 21:27:23',NULL),(970,80906,22,'2016-11-22 21:27:23',NULL),(971,37741,22,'2016-11-22 21:27:23',NULL),(972,5954,22,'2016-11-22 21:27:23',NULL),(973,1031,22,'2016-11-22 21:27:23',NULL),(974,68237,22,'2016-11-22 21:27:23',NULL),(975,1206,22,'2016-11-22 21:27:23',NULL),(976,76173,22,'2016-11-22 21:27:23',NULL),(977,4799,22,'2016-11-22 21:27:23',NULL),(978,8983,22,'2016-11-22 21:27:23',NULL),(979,45928,22,'2016-11-22 21:27:23',NULL),(980,7459,22,'2016-11-22 21:27:23',NULL),(981,141866,22,'2016-11-22 21:31:39',1),(982,91873,22,'2016-11-22 21:31:39',5),(983,85438,22,'2016-11-22 21:31:39',2),(984,84615,22,'2016-11-22 21:31:39',4),(985,85412,22,'2016-11-22 21:31:39',2),(986,109187,22,'2016-11-22 21:31:39',1),(987,133545,22,'2016-11-22 21:31:39',5),(988,105468,22,'2016-11-22 21:31:39',5),(989,90647,22,'2016-11-22 21:31:39',4),(990,113741,22,'2016-11-22 21:31:39',1),(991,1809,22,'2016-11-22 21:31:39',1),(992,88345,22,'2016-11-22 21:31:40',4),(993,4016,22,'2016-11-22 21:31:40',4),(994,5110,22,'2016-11-22 21:31:40',4),(995,66297,22,'2016-11-22 21:31:40',4),(996,146309,22,'2016-11-22 21:31:40',NULL),(997,2944,22,'2016-11-22 21:31:40',NULL),(998,2278,22,'2016-11-22 21:31:40',NULL),(999,101850,22,'2016-11-22 21:31:40',NULL),(1000,4855,22,'2016-11-22 21:31:40',1),(1001,90647,24,'2016-11-22 23:02:16',NULL),(1002,83086,24,'2016-11-22 23:02:16',NULL),(1003,98243,24,'2016-11-22 23:02:16',NULL),(1004,81562,24,'2016-11-22 23:02:16',NULL),(1005,91873,24,'2016-11-22 23:02:16',NULL),(1006,144620,24,'2016-11-22 23:02:16',NULL),(1007,85412,24,'2016-11-22 23:02:16',NULL),(1008,112852,24,'2016-11-22 23:02:16',NULL),(1009,81083,24,'2016-11-22 23:02:16',NULL),(1010,103819,24,'2016-11-22 23:02:16',NULL),(1011,1301,24,'2016-11-22 23:02:16',NULL),(1012,101106,24,'2016-11-22 23:02:16',NULL),(1013,32728,24,'2016-11-22 23:02:16',NULL),(1014,1233,24,'2016-11-22 23:02:16',NULL),(1015,63082,24,'2016-11-22 23:02:16',NULL),(1016,215,24,'2016-11-22 23:02:16',NULL),(1017,2857,24,'2016-11-22 23:02:16',NULL),(1018,7020,24,'2016-11-22 23:02:16',NULL),(1019,60135,24,'2016-11-22 23:02:16',NULL),(1020,1252,24,'2016-11-22 23:02:16',NULL),(1021,104337,23,'2016-11-22 23:11:44',99),(1022,125916,23,'2016-11-22 23:11:44',99),(1023,122900,23,'2016-11-22 23:11:44',5),(1024,156726,23,'2016-11-22 23:11:44',99),(1025,100326,23,'2016-11-22 23:11:44',99),(1026,78316,23,'2016-11-22 23:11:44',4),(1027,85774,23,'2016-11-22 23:11:44',99),(1028,80858,23,'2016-11-22 23:11:44',99),(1029,90522,23,'2016-11-22 23:11:44',4),(1030,96432,23,'2016-11-22 23:11:44',99),(1031,90439,23,'2016-11-22 23:11:44',99),(1032,2423,23,'2016-11-22 23:11:44',99),(1033,7143,23,'2016-11-22 23:11:44',99),(1034,93840,23,'2016-11-22 23:11:44',99),(1035,31435,23,'2016-11-22 23:11:44',99),(1036,63876,23,'2016-11-22 23:11:44',99),(1037,2427,23,'2016-11-22 23:11:44',99),(1038,87234,23,'2016-11-22 23:11:44',99),(1039,6214,23,'2016-11-22 23:11:44',99),(1040,88129,23,'2016-11-22 23:11:44',99),(1041,98243,25,'2016-11-22 23:28:59',NULL),(1042,84615,25,'2016-11-22 23:28:59',NULL),(1043,85438,25,'2016-11-22 23:28:59',NULL),(1044,100032,25,'2016-11-22 23:28:59',NULL),(1045,144620,25,'2016-11-22 23:28:59',NULL),(1046,109187,25,'2016-11-22 23:28:59',NULL),(1047,90428,25,'2016-11-22 23:28:59',NULL),(1048,98604,25,'2016-11-22 23:28:59',NULL),(1049,93855,25,'2016-11-22 23:28:59',NULL),(1050,145935,25,'2016-11-22 23:28:59',NULL),(1051,26655,25,'2016-11-22 23:28:59',NULL),(1052,55820,25,'2016-11-22 23:28:59',NULL),(1053,4327,25,'2016-11-22 23:28:59',NULL),(1054,106236,25,'2016-11-22 23:28:59',NULL),(1055,2081,25,'2016-11-22 23:28:59',NULL),(1056,4855,25,'2016-11-22 23:28:59',NULL),(1057,60684,25,'2016-11-22 23:28:59',NULL),(1058,1809,25,'2016-11-22 23:28:59',NULL),(1059,2857,25,'2016-11-22 23:28:59',NULL),(1060,7505,25,'2016-11-22 23:28:59',NULL),(1061,98243,25,'2016-11-22 23:29:05',NULL),(1062,84615,25,'2016-11-22 23:29:05',NULL),(1063,85438,25,'2016-11-22 23:29:05',NULL),(1064,100032,25,'2016-11-22 23:29:05',NULL),(1065,144620,25,'2016-11-22 23:29:05',NULL),(1066,109187,25,'2016-11-22 23:29:06',NULL),(1067,90428,25,'2016-11-22 23:29:06',NULL),(1068,98604,25,'2016-11-22 23:29:06',NULL),(1069,93855,25,'2016-11-22 23:29:06',NULL),(1070,145935,25,'2016-11-22 23:29:06',NULL),(1071,26655,25,'2016-11-22 23:29:06',NULL),(1072,55820,25,'2016-11-22 23:29:06',NULL),(1073,4327,25,'2016-11-22 23:29:06',NULL),(1074,106236,25,'2016-11-22 23:29:06',NULL),(1075,2081,25,'2016-11-22 23:29:06',NULL),(1076,4855,25,'2016-11-22 23:29:06',NULL),(1077,60684,25,'2016-11-22 23:29:06',NULL),(1078,1809,25,'2016-11-22 23:29:06',NULL),(1079,2857,25,'2016-11-22 23:29:06',NULL),(1080,7505,25,'2016-11-22 23:29:06',NULL),(1081,83086,26,'2016-11-22 23:36:31',NULL),(1082,144620,26,'2016-11-22 23:36:31',NULL),(1083,84615,26,'2016-11-22 23:36:31',NULL),(1084,98604,26,'2016-11-22 23:36:31',NULL),(1085,105468,26,'2016-11-22 23:36:31',NULL),(1086,81083,26,'2016-11-22 23:36:31',NULL),(1087,106236,26,'2016-11-22 23:36:31',NULL),(1088,90428,26,'2016-11-22 23:36:31',NULL),(1089,90647,26,'2016-11-22 23:36:31',NULL),(1090,109187,26,'2016-11-22 23:36:31',NULL),(1091,146309,26,'2016-11-22 23:36:31',NULL),(1092,5876,26,'2016-11-22 23:36:31',NULL),(1093,60950,26,'2016-11-22 23:36:31',NULL),(1094,59590,26,'2016-11-22 23:36:31',NULL),(1095,1301,26,'2016-11-22 23:36:31',NULL),(1096,5223,26,'2016-11-22 23:36:31',NULL),(1097,17,26,'2016-11-22 23:36:31',NULL),(1098,5385,26,'2016-11-22 23:36:31',NULL),(1099,32728,26,'2016-11-22 23:36:31',NULL),(1100,6329,26,'2016-11-22 23:36:31',NULL),(1101,91873,26,'2016-11-22 23:39:58',4),(1102,105593,26,'2016-11-22 23:39:58',99),(1103,106542,26,'2016-11-22 23:39:58',99),(1104,85412,26,'2016-11-22 23:39:58',99),(1105,81562,26,'2016-11-22 23:39:58',99),(1106,112852,26,'2016-11-22 23:39:58',99),(1107,85438,26,'2016-11-22 23:39:58',99),(1108,123947,26,'2016-11-22 23:39:58',99),(1109,141866,26,'2016-11-22 23:39:58',99),(1110,133545,26,'2016-11-22 23:39:58',4),(1111,4327,26,'2016-11-22 23:39:58',99),(1112,2944,26,'2016-11-22 23:39:58',99),(1113,4292,26,'2016-11-22 23:39:58',99),(1114,106236,26,'2016-11-22 23:39:58',99),(1115,6683,26,'2016-11-22 23:39:58',99),(1116,17,26,'2016-11-22 23:39:58',4),(1117,2692,26,'2016-11-22 23:39:58',99),(1118,149406,26,'2016-11-22 23:39:58',5),(1119,76173,26,'2016-11-22 23:39:58',99),(1120,1086,26,'2016-11-22 23:39:58',99),(1121,81083,28,'2016-11-23 20:16:30',99),(1122,145935,28,'2016-11-23 20:16:30',99),(1123,98243,28,'2016-11-23 20:16:30',99),(1124,81562,28,'2016-11-23 20:16:30',99),(1125,90428,28,'2016-11-23 20:16:30',99),(1126,84615,28,'2016-11-23 20:16:30',99),(1127,105593,28,'2016-11-23 20:16:30',99),(1128,101106,28,'2016-11-23 20:16:30',99),(1129,88785,28,'2016-11-23 20:16:30',99),(1130,90647,28,'2016-11-23 20:16:30',5),(1131,2692,28,'2016-11-23 20:16:30',99),(1132,6329,28,'2016-11-23 20:16:30',99),(1133,1086,28,'2016-11-23 20:16:30',99),(1134,85412,28,'2016-11-23 20:16:30',99),(1135,58559,28,'2016-11-23 20:16:30',2),(1136,5223,28,'2016-11-23 20:16:30',99),(1137,2944,28,'2016-11-23 20:16:30',99),(1138,1209,28,'2016-11-23 20:16:30',99),(1139,3527,28,'2016-11-23 20:16:30',2),(1140,3384,28,'2016-11-23 20:16:30',99),(1141,157296,21,'2016-11-26 01:18:40',4),(1142,96863,21,'2016-11-26 01:18:40',99),(1143,135133,21,'2016-11-26 01:18:40',1),(1144,140267,21,'2016-11-26 01:18:40',99),(1145,114060,21,'2016-11-26 01:18:40',99),(1146,142507,21,'2016-11-26 01:18:40',99),(1147,92198,21,'2016-11-26 01:18:40',1),(1148,103107,21,'2016-11-26 01:18:40',99),(1149,125916,21,'2016-11-26 01:18:40',99),(1150,114074,21,'2016-11-26 01:18:40',99),(1151,99112,21,'2016-11-26 01:18:40',1),(1152,33162,21,'2016-11-26 01:18:40',99),(1153,57669,21,'2016-11-26 01:18:40',99),(1154,45210,21,'2016-11-26 01:18:40',99),(1155,104419,21,'2016-11-26 01:18:40',2),(1156,1827,21,'2016-11-26 01:18:40',99),(1157,35836,21,'2016-11-26 01:18:40',99),(1158,117533,21,'2016-11-26 01:18:40',99),(1159,62956,21,'2016-11-26 01:18:40',99),(1160,524,21,'2016-11-26 01:18:40',2),(1161,131168,21,'2016-11-26 01:31:36',99),(1162,81083,21,'2016-11-26 01:31:36',99),(1163,103137,21,'2016-11-26 01:31:36',99),(1164,109183,21,'2016-11-26 01:31:36',99),(1165,78499,21,'2016-11-26 01:31:36',3),(1166,76763,21,'2016-11-26 01:31:36',99),(1167,134881,21,'2016-11-26 01:31:36',99),(1168,104944,21,'2016-11-26 01:31:36',99),(1169,116887,21,'2016-11-26 01:31:36',1),(1170,119145,21,'2016-11-26 01:31:36',1),(1171,79686,21,'2016-11-26 01:31:36',99),(1172,3142,21,'2016-11-26 01:31:36',1),(1173,2483,21,'2016-11-26 01:31:36',99),(1174,26111,21,'2016-11-26 01:31:36',99),(1175,60487,21,'2016-11-26 01:31:36',1),(1176,1190,21,'2016-11-26 01:31:36',99),(1177,264,21,'2016-11-26 01:31:36',99),(1178,95313,21,'2016-11-26 01:31:36',1),(1179,92163,21,'2016-11-26 01:31:36',99),(1180,2640,21,'2016-11-26 01:31:36',99),(1181,152057,21,'2016-11-26 01:36:18',99),(1182,103980,21,'2016-11-26 01:36:18',99),(1183,117871,21,'2016-11-26 01:36:18',99),(1184,93840,21,'2016-11-26 01:36:18',2),(1185,101106,21,'2016-11-26 01:36:18',99),(1186,94677,21,'2016-11-26 01:36:18',1),(1187,107406,21,'2016-11-26 01:36:18',99),(1188,144976,21,'2016-11-26 01:36:18',99),(1189,118702,21,'2016-11-26 01:36:18',5),(1190,118105,21,'2016-11-26 01:36:18',99),(1191,587,21,'2016-11-26 01:36:18',3),(1192,1785,21,'2016-11-26 01:36:18',99),(1193,854,21,'2016-11-26 01:36:18',99),(1194,8989,21,'2016-11-26 01:36:18',99),(1195,5021,21,'2016-11-26 01:36:18',99),(1196,2081,21,'2016-11-26 01:36:18',2),(1197,1846,21,'2016-11-26 01:36:18',99),(1198,4197,21,'2016-11-26 01:36:18',99),(1199,121491,21,'2016-11-26 01:36:18',99),(1200,2467,21,'2016-11-26 01:36:18',3),(1201,103819,21,'2016-11-26 01:42:42',99),(1202,113741,21,'2016-11-26 01:42:42',99),(1203,88785,21,'2016-11-26 01:42:42',3),(1204,141866,21,'2016-11-26 01:42:42',99),(1205,84615,21,'2016-11-26 01:42:42',99),(1206,144620,21,'2016-11-26 01:42:42',3),(1207,92008,21,'2016-11-26 01:42:42',99),(1208,90428,21,'2016-11-26 01:42:42',99),(1209,83086,21,'2016-11-26 01:42:42',99),(1210,91873,21,'2016-11-26 01:42:42',99),(1211,3612,21,'2016-11-26 01:42:42',99),(1212,1086,21,'2016-11-26 01:42:42',99),(1213,48972,21,'2016-11-26 01:42:42',99),(1214,7020,21,'2016-11-26 01:42:42',99),(1215,4327,21,'2016-11-26 01:42:42',99),(1216,2081,21,'2016-11-26 01:42:42',4),(1217,55078,21,'2016-11-26 01:42:42',99),(1218,5354,21,'2016-11-26 01:42:42',99),(1219,55820,21,'2016-11-26 01:42:42',99),(1220,88345,21,'2016-11-26 01:42:42',99),(1221,130073,21,'2016-11-26 01:46:51',5),(1222,106920,21,'2016-11-26 01:46:51',5),(1223,90343,21,'2016-11-26 01:46:51',99),(1224,101362,21,'2016-11-26 01:46:51',99),(1225,114028,21,'2016-11-26 01:46:51',99),(1226,113640,21,'2016-11-26 01:46:51',99),(1227,105254,21,'2016-11-26 01:46:51',99),(1228,137337,21,'2016-11-26 01:46:51',5),(1229,100390,21,'2016-11-26 01:46:51',99),(1230,89072,21,'2016-11-26 01:46:51',99),(1231,8989,21,'2016-11-26 01:46:51',99),(1232,121491,21,'2016-11-26 01:46:51',99),(1233,588,21,'2016-11-26 01:46:51',3),(1234,2081,21,'2016-11-26 01:46:51',4),(1235,3510,21,'2016-11-26 01:46:51',99),(1236,4102,21,'2016-11-26 01:46:51',99),(1237,60943,21,'2016-11-26 01:46:51',99),(1238,5021,21,'2016-11-26 01:46:51',99),(1239,50601,21,'2016-11-26 01:46:51',3),(1240,2000,21,'2016-11-26 01:46:51',2),(1241,111113,30,'2016-11-27 03:18:07',NULL),(1242,79132,30,'2016-11-27 03:18:07',NULL),(1243,90469,30,'2016-11-27 03:18:07',NULL),(1244,134881,30,'2016-11-27 03:18:07',NULL),(1245,87444,30,'2016-11-27 03:18:07',NULL),(1246,96863,30,'2016-11-27 03:18:07',NULL),(1247,158528,30,'2016-11-27 03:18:07',NULL),(1248,96691,30,'2016-11-27 03:18:07',NULL),(1249,90522,30,'2016-11-27 03:18:07',NULL),(1250,114670,30,'2016-11-27 03:18:07',NULL),(1251,449,30,'2016-11-27 03:18:07',NULL),(1252,33162,30,'2016-11-27 03:18:07',NULL),(1253,767,30,'2016-11-27 03:18:07',NULL),(1254,2423,30,'2016-11-27 03:18:07',NULL),(1255,8364,30,'2016-11-27 03:18:07',NULL),(1256,1036,30,'2016-11-27 03:18:07',NULL),(1257,81158,30,'2016-11-27 03:18:07',NULL),(1258,60943,30,'2016-11-27 03:18:07',NULL),(1259,117533,30,'2016-11-27 03:18:07',NULL),(1260,115149,30,'2016-11-27 03:18:07',NULL),(1261,90057,31,'2016-11-28 20:39:36',99),(1262,110194,31,'2016-11-28 20:39:36',99),(1263,80906,31,'2016-11-28 20:39:36',99),(1264,82463,31,'2016-11-28 20:39:36',99),(1265,107771,31,'2016-11-28 20:39:36',99),(1266,86781,31,'2016-11-28 20:39:36',NULL),(1267,60293,31,'2016-11-28 20:39:36',3),(1268,7459,31,'2016-11-28 20:39:36',2),(1269,31435,31,'2016-11-28 20:39:36',4),(1270,37240,31,'2016-11-28 20:39:36',99),(1271,27831,31,'2016-11-28 20:39:36',99),(1272,5878,31,'2016-11-28 20:39:36',99),(1273,66297,31,'2016-11-28 20:39:36',3),(1274,1594,31,'2016-11-28 20:39:36',99),(1275,68237,31,'2016-11-28 20:39:36',2),(1276,1951,31,'2016-11-28 20:39:36',99),(1277,104337,31,'2016-11-28 20:41:41',99),(1278,157296,31,'2016-11-28 20:41:41',4),(1279,91842,31,'2016-11-28 20:41:41',99),(1280,98836,31,'2016-11-28 20:41:41',99),(1281,113225,31,'2016-11-28 20:41:41',99),(1282,133782,31,'2016-11-28 20:41:41',99),(1283,117444,31,'2016-11-28 20:41:42',3),(1284,94325,31,'2016-11-28 20:41:42',99),(1285,80860,31,'2016-11-28 20:41:42',3),(1286,103107,31,'2016-11-28 20:41:42',99),(1287,59519,31,'2016-11-28 20:41:42',99),(1288,99112,31,'2016-11-28 20:41:42',3),(1289,130634,31,'2016-11-28 20:41:42',4),(1290,104272,31,'2016-11-28 20:41:42',3),(1291,477,31,'2016-11-28 20:41:42',99),(1292,34405,31,'2016-11-28 20:41:42',2),(1293,67429,31,'2016-11-28 20:41:42',5),(1294,142507,31,'2016-11-28 20:41:42',99),(1295,767,31,'2016-11-28 20:41:42',99),(1296,96655,31,'2016-11-28 20:41:42',2),(1317,110194,34,'2016-11-30 13:07:04',99),(1318,90057,34,'2016-11-30 13:07:04',99),(1319,82463,34,'2016-11-30 13:07:04',99),(1320,80906,34,'2016-11-30 13:07:04',99),(1321,86781,34,'2016-11-30 13:07:04',99),(1322,107771,34,'2016-11-30 13:07:04',99),(1323,68237,34,'2016-11-30 13:07:04',99),(1324,60943,34,'2016-11-30 13:07:04',99),(1325,48682,34,'2016-11-30 13:07:04',99),(1326,121491,34,'2016-11-30 13:07:04',99),(1327,95115,34,'2016-11-30 13:07:04',99),(1328,76173,34,'2016-11-30 13:07:04',99),(1329,7459,34,'2016-11-30 13:07:04',2),(1330,1594,34,'2016-11-30 13:07:04',NULL),(1331,45928,34,'2016-11-30 13:07:04',2),(1332,1206,34,'2016-11-30 13:07:04',99),(1333,96488,34,'2016-11-30 13:26:38',NULL),(1334,132458,34,'2016-11-30 13:26:38',NULL),(1335,95449,34,'2016-11-30 13:26:38',3),(1336,117444,34,'2016-11-30 13:26:38',3),(1337,130634,34,'2016-11-30 13:26:38',4),(1338,103107,34,'2016-11-30 13:26:38',99),(1339,117533,34,'2016-11-30 13:26:38',99),(1340,129937,34,'2016-11-30 13:26:38',NULL),(1341,87444,34,'2016-11-30 13:26:38',3),(1342,88129,34,'2016-11-30 13:26:38',3),(1343,96728,34,'2016-11-30 13:26:38',NULL),(1344,8937,34,'2016-11-30 13:26:38',NULL),(1345,4022,34,'2016-11-30 13:26:38',2),(1346,107771,34,'2016-11-30 13:26:38',99),(1347,508,34,'2016-11-30 13:26:38',99),(1348,2423,34,'2016-11-30 13:26:39',99),(1349,2336,34,'2016-11-30 13:26:39',99),(1350,2427,34,'2016-11-30 13:26:39',99),(1351,142507,34,'2016-11-30 13:26:39',NULL),(1352,41569,34,'2016-11-30 13:26:39',2),(1353,131168,34,'2016-11-30 13:44:04',3),(1354,109183,34,'2016-11-30 13:44:04',99),(1355,78499,34,'2016-11-30 13:44:04',1),(1356,85412,34,'2016-11-30 13:44:04',2),(1357,81083,34,'2016-11-30 13:44:04',1),(1358,103137,34,'2016-11-30 13:44:05',99),(1359,90266,34,'2016-11-30 13:44:05',99),(1360,122886,34,'2016-11-30 13:44:05',2),(1361,146309,34,'2016-11-30 13:44:05',99),(1362,95949,34,'2016-11-30 13:44:05',1),(1363,7934,34,'2016-11-30 13:44:05',99),(1364,26393,34,'2016-11-30 13:44:05',99),(1365,7892,34,'2016-11-30 13:44:05',3),(1366,4218,34,'2016-11-30 13:44:05',2),(1367,26111,34,'2016-11-30 13:44:05',99),(1368,79686,34,'2016-11-30 13:44:05',99),(1369,8928,34,'2016-11-30 13:44:05',3),(1370,2483,34,'2016-11-30 13:44:05',99),(1371,6971,34,'2016-11-30 13:44:05',99),(1372,70,34,'2016-11-30 13:44:05',4),(1373,112852,35,'2016-11-30 18:27:44',3),(1374,88785,35,'2016-11-30 18:27:44',4),(1375,109187,35,'2016-11-30 18:27:44',2),(1376,98604,35,'2016-11-30 18:27:44',5),(1377,141866,35,'2016-11-30 18:27:44',2),(1378,83086,35,'2016-11-30 18:27:44',2),(1379,90647,35,'2016-11-30 18:27:44',4),(1380,81083,35,'2016-11-30 18:27:45',2),(1381,105593,35,'2016-11-30 18:27:45',1),(1382,133545,35,'2016-11-30 18:27:45',1),(1383,146309,35,'2016-11-30 18:27:45',5),(1384,17,35,'2016-11-30 18:27:45',3),(1385,4327,35,'2016-11-30 18:27:45',2),(1386,949,35,'2016-11-30 18:27:45',2),(1387,27731,35,'2016-11-30 18:27:45',4),(1388,6879,35,'2016-11-30 18:27:45',2),(1389,58998,35,'2016-11-30 18:27:45',4),(1390,1086,35,'2016-11-30 18:27:45',2),(1391,48972,35,'2016-11-30 18:27:45',2),(1392,113741,35,'2016-11-30 18:27:45',2),(1393,90647,36,'2016-12-01 14:51:13',NULL),(1394,85412,36,'2016-12-01 14:51:13',NULL),(1395,85438,36,'2016-12-01 14:51:13',NULL),(1396,92008,36,'2016-12-01 14:51:13',NULL),(1397,116823,36,'2016-12-01 14:51:13',5),(1398,146309,36,'2016-12-01 14:51:13',NULL),(1399,141866,36,'2016-12-01 14:51:13',NULL),(1400,112852,36,'2016-12-01 14:51:13',NULL),(1401,93855,36,'2016-12-01 14:51:13',NULL),(1402,84615,36,'2016-12-01 14:51:13',NULL),(1403,106236,36,'2016-12-01 14:51:13',NULL),(1404,4016,36,'2016-12-01 14:51:13',NULL),(1405,2880,36,'2016-12-01 14:51:13',NULL),(1406,4349,36,'2016-12-01 14:51:13',NULL),(1407,76173,36,'2016-12-01 14:51:13',NULL),(1408,55078,36,'2016-12-01 14:51:13',NULL),(1409,63082,36,'2016-12-01 14:51:13',NULL),(1410,54272,36,'2016-12-01 14:51:13',NULL),(1411,98604,36,'2016-12-01 14:51:13',NULL),(1412,5385,36,'2016-12-01 14:51:13',NULL),(1413,133545,36,'2016-12-01 14:53:23',NULL),(1414,144620,36,'2016-12-01 14:53:23',NULL),(1415,149406,36,'2016-12-01 14:53:23',NULL),(1416,100032,36,'2016-12-01 14:53:23',NULL),(1417,83086,36,'2016-12-01 14:53:23',NULL),(1418,103819,36,'2016-12-01 14:53:23',NULL),(1419,81083,36,'2016-12-01 14:53:23',NULL),(1420,81562,36,'2016-12-01 14:53:23',NULL),(1421,105593,36,'2016-12-01 14:53:23',NULL),(1422,113741,36,'2016-12-01 14:53:23',NULL),(1423,55078,36,'2016-12-01 14:53:23',NULL),(1424,85412,36,'2016-12-01 14:53:23',NULL),(1425,7505,36,'2016-12-01 14:53:23',NULL),(1426,106236,36,'2016-12-01 14:53:23',NULL),(1427,5110,36,'2016-12-01 14:53:23',NULL),(1428,2944,36,'2016-12-01 14:53:23',NULL),(1429,3612,36,'2016-12-01 14:53:23',NULL),(1430,4016,36,'2016-12-01 14:53:23',4),(1431,60135,36,'2016-12-01 14:53:23',NULL),(1432,55820,36,'2016-12-01 14:53:23',NULL),(1433,131168,36,'2016-12-01 14:54:07',NULL),(1434,103137,36,'2016-12-01 14:54:07',5),(1435,78499,36,'2016-12-01 14:54:07',NULL),(1436,109183,36,'2016-12-01 14:54:07',NULL),(1437,140747,36,'2016-12-01 14:54:07',NULL),(1438,88129,36,'2016-12-01 14:54:07',NULL),(1439,74795,36,'2016-12-01 14:54:07',NULL),(1440,134859,36,'2016-12-01 14:54:07',NULL),(1441,79139,36,'2016-12-01 14:54:07',NULL),(1442,118702,36,'2016-12-01 14:54:07',NULL),(1443,26393,36,'2016-12-01 14:54:07',NULL),(1444,1345,36,'2016-12-01 14:54:07',NULL),(1445,2550,36,'2016-12-01 14:54:07',NULL),(1446,95313,36,'2016-12-01 14:54:07',NULL),(1447,3504,36,'2016-12-01 14:54:08',NULL),(1448,6971,36,'2016-12-01 14:54:08',NULL),(1449,7947,36,'2016-12-01 14:54:08',NULL),(1450,1949,36,'2016-12-01 14:54:08',NULL),(1451,7934,36,'2016-12-01 14:54:08',NULL),(1452,8928,36,'2016-12-01 14:54:08',NULL),(1453,90439,36,'2016-12-01 14:56:38',NULL),(1454,91842,36,'2016-12-01 14:56:38',NULL),(1455,111680,36,'2016-12-01 14:56:38',NULL),(1456,90249,36,'2016-12-01 14:56:38',NULL),(1457,93840,36,'2016-12-01 14:56:38',NULL),(1458,90866,36,'2016-12-01 14:56:38',3),(1459,81784,36,'2016-12-01 14:56:38',NULL),(1460,105585,36,'2016-12-01 14:56:38',NULL),(1461,142507,36,'2016-12-01 14:56:38',NULL),(1462,99912,36,'2016-12-01 14:56:38',NULL),(1463,2867,36,'2016-12-01 14:56:38',NULL),(1464,1282,36,'2016-12-01 14:56:38',NULL),(1465,2272,36,'2016-12-01 14:56:38',NULL),(1466,524,36,'2016-12-01 14:56:38',NULL),(1467,60161,36,'2016-12-01 14:56:38',NULL),(1468,477,36,'2016-12-01 14:56:38',NULL),(1469,2423,36,'2016-12-01 14:56:38',NULL),(1470,72641,36,'2016-12-01 14:56:38',NULL),(1471,1036,36,'2016-12-01 14:56:38',NULL),(1472,63876,36,'2016-12-01 14:56:38',NULL),(1473,96863,6,'2016-12-03 02:21:13',NULL),(1474,87785,6,'2016-12-03 02:21:13',NULL),(1475,101884,6,'2016-12-03 02:21:13',NULL),(1476,87298,6,'2016-12-03 02:21:13',NULL),(1477,111113,6,'2016-12-03 02:21:13',5),(1478,98836,6,'2016-12-03 02:21:13',NULL),(1479,142448,6,'2016-12-03 02:21:13',NULL),(1480,116397,6,'2016-12-03 02:21:13',NULL),(1481,96655,6,'2016-12-03 02:21:13',NULL),(1482,103539,6,'2016-12-03 02:21:13',NULL),(1483,767,6,'2016-12-03 02:21:13',NULL),(1484,1282,6,'2016-12-03 02:21:13',4),(1485,34528,6,'2016-12-03 02:21:13',NULL),(1486,508,6,'2016-12-03 02:21:13',NULL),(1487,157296,6,'2016-12-03 02:21:13',NULL),(1488,5679,6,'2016-12-03 02:21:13',5),(1489,2580,6,'2016-12-03 02:21:13',NULL),(1490,99112,6,'2016-12-03 02:21:13',4),(1491,39292,6,'2016-12-03 02:21:13',NULL),(1492,31435,6,'2016-12-03 02:21:13',99),(1493,125916,6,'2016-12-03 02:35:28',1),(1494,96691,6,'2016-12-03 02:35:28',5),(1495,130634,6,'2016-12-03 02:35:29',5),(1496,104321,6,'2016-12-03 02:35:29',99),(1497,95135,6,'2016-12-03 02:35:29',99),(1498,90866,6,'2016-12-03 02:35:29',5),(1499,87234,6,'2016-12-03 02:35:29',99),(1500,94325,6,'2016-12-03 02:35:29',99),(1501,140267,6,'2016-12-03 02:35:29',5),(1502,91842,6,'2016-12-03 02:35:29',5),(1503,5389,6,'2016-12-03 02:35:29',99),(1504,508,6,'2016-12-03 02:35:29',99),(1505,3255,6,'2016-12-03 02:35:29',99),(1506,103539,6,'2016-12-03 02:35:29',5),(1507,102716,6,'2016-12-03 02:35:29',5),(1508,104272,6,'2016-12-03 02:35:29',99),(1509,118468,6,'2016-12-03 02:35:29',99),(1510,63876,6,'2016-12-03 02:35:29',99),(1511,55805,6,'2016-12-03 02:35:29',99),(1512,32,6,'2016-12-03 02:35:29',5),(1513,83086,6,'2016-12-07 20:02:18',NULL),(1514,109187,6,'2016-12-07 20:02:18',NULL),(1515,88785,6,'2016-12-07 20:02:18',NULL),(1516,105468,6,'2016-12-07 20:02:18',NULL),(1517,133545,6,'2016-12-07 20:02:18',NULL),(1518,141866,6,'2016-12-07 20:02:18',NULL),(1519,103819,6,'2016-12-07 20:02:18',NULL),(1520,85438,6,'2016-12-07 20:02:18',NULL),(1521,149406,6,'2016-12-07 20:02:18',NULL),(1522,113741,6,'2016-12-07 20:02:18',NULL),(1523,32728,6,'2016-12-07 20:02:18',NULL),(1524,1301,6,'2016-12-07 20:02:18',NULL),(1525,88345,6,'2016-12-07 20:02:18',NULL),(1526,101106,6,'2016-12-07 20:02:19',NULL),(1527,2857,6,'2016-12-07 20:02:19',NULL),(1528,6683,6,'2016-12-07 20:02:19',NULL),(1529,5385,6,'2016-12-07 20:02:19',NULL),(1530,145935,6,'2016-12-07 20:02:19',NULL),(1531,101850,6,'2016-12-07 20:02:19',NULL),(1532,26694,6,'2016-12-07 20:02:19',NULL),(1533,84615,38,'2016-12-07 21:16:35',NULL),(1534,123947,38,'2016-12-07 21:16:35',NULL),(1535,98604,38,'2016-12-07 21:16:35',NULL),(1536,112852,38,'2016-12-07 21:16:35',NULL),(1537,146309,38,'2016-12-07 21:16:35',NULL),(1538,98243,38,'2016-12-07 21:16:35',NULL),(1539,88785,38,'2016-12-07 21:16:35',NULL),(1540,91873,38,'2016-12-07 21:16:35',NULL),(1541,133545,38,'2016-12-07 21:16:35',NULL),(1542,144620,38,'2016-12-07 21:16:35',NULL),(1543,5354,38,'2016-12-07 21:16:35',NULL),(1544,5876,38,'2016-12-07 21:16:35',NULL),(1545,145935,38,'2016-12-07 21:16:35',NULL),(1546,7505,38,'2016-12-07 21:16:36',NULL),(1547,5223,38,'2016-12-07 21:16:36',NULL),(1548,100032,38,'2016-12-07 21:16:36',NULL),(1549,2857,38,'2016-12-07 21:16:36',NULL),(1550,2919,38,'2016-12-07 21:16:36',NULL),(1551,8464,38,'2016-12-07 21:16:36',NULL),(1552,55078,38,'2016-12-07 21:16:36',NULL);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 11:15:24
