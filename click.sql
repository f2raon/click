-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: click
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rate` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'Австралийский доллар','46,3023'),(2,'Азербайджанский манат','38,1825'),(3,'Фунт стерлингов Соединенного королевства','84,7084'),(4,'Армянских драмов','13,3011'),(5,'Белорусский рубль','30,4373'),(6,'Болгарский лев','37,3266'),(7,'Бразильский реал','16,8299'),(8,'Венгерских форинтов','22,7422'),(9,'Гонконгских долларов','82,5832'),(10,'Датских крон','97,8011'),(11,'Доллар США','64,7766'),(12,'Евро','72,9708'),(13,'Индийских рупий','93,1100'),(14,'Казахстанских тенге','17,0442'),(15,'Канадский доллар','48,6969'),(16,'Киргизских сомов','92,5512'),(17,'Китайских юаней','96,4957'),(18,'Молдавских леев','37,0682'),(19,'Норвежских крон','75,8686'),(20,'Польский злотый','17,0303'),(21,'Румынский лей','15,3656'),(22,'СДР (специальные права заимствования)','89,8866'),(23,'Сингапурский доллар','47,8657'),(24,'Таджикских сомони','68,6920'),(25,'Турецкая лира','11,4106'),(26,'Новый туркменский манат','18,5341'),(27,'Узбекских сумов','76,6690'),(28,'Украинских гривен','24,2165'),(29,'Чешских крон','28,4945'),(30,'Шведских крон','70,0454'),(31,'Швейцарский франк','64,8609'),(32,'Южноафриканских рэндов','46,0617'),(33,'Вон Республики Корея','56,7782'),(34,'Японских иен','58,2183');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-10  1:31:15
