CREATE DATABASE  IF NOT EXISTS `bibliotheque` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bibliotheque`;


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
-- Table structure for table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adherent` (
  `IdAdherent` char(20) NOT NULL,
  `NomAdherent` varchar(100) NOT NULL,
  `PrenomAdherent` varchar(100) NOT NULL,
  PRIMARY KEY (`IdAdherent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adherent` 
--

LOCK TABLES `adherent` WRITE;
/*!40000 ALTER TABLE `adherent` DISABLE KEYS */;
INSERT INTO `adherent` VALUES ('A001','Bost','Vincent'),('A002','Morillon','Jean'),('A003','Goddaert','Elisabeth'),('A007','Alertino','Jose'),('A9087','Feugeas','Frédéric'),('GB01223452','Guionie','Lucien');
/*!40000 ALTER TABLE `adherent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemplaire` (
  `IdExemplaire` int(11) NOT NULL AUTO_INCREMENT,
  `Empruntable` tinyint(1) NOT NULL,
  `ISBN` char(20) NOT NULL,
  PRIMARY KEY (`IdExemplaire`),
  KEY `FK_Exemplaire_Livre` (`ISBN`),
  CONSTRAINT `FK_Exemplaire_Livre` FOREIGN KEY (`ISBN`) REFERENCES `livre` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplaire`
--

LOCK TABLES `exemplaire` WRITE;
/*!40000 ALTER TABLE `exemplaire` DISABLE KEYS */;
INSERT INTO `exemplaire` VALUES (1,1,'LIV001'),(2,0,'LIV002'),(3,1,'LIV001'),(4,1,'LIV002'),(5,1,'LIV003'),(6,1,'LIV003');
/*!40000 ALTER TABLE `exemplaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livre`
--

DROP TABLE IF EXISTS `livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livre` (
  `ISBN` char(20) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livre`
--

LOCK TABLES `livre` WRITE;
/*!40000 ALTER TABLE `livre` DISABLE KEYS */;
INSERT INTO `livre` VALUES ('LIV001','Linq Entities Core'),('LIV002','ASP MVC Core'),('LIV003','Pratique du Design web'),('LIV004','Design Pattern');
/*!40000 ALTER TABLE `livre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret`
--

DROP TABLE IF EXISTS `pret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pret` (
  `IdAdherent` char(20) NOT NULL,
  `IdExemplaire` int(11) NOT NULL,
  `DateEmprunt` date NOT NULL,
  `DateRetour` date DEFAULT NULL,
  PRIMARY KEY (`IdAdherent`,`IdExemplaire`,`DateEmprunt`),
  KEY `FK_Pret_Exemplaire` (`IdExemplaire`),
  CONSTRAINT `FK_Pret_Adherent` FOREIGN KEY (`IdAdherent`) REFERENCES `adherent` (`IdAdherent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pret_Exemplaire` FOREIGN KEY (`IdExemplaire`) REFERENCES `exemplaire` (`IdExemplaire`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret`
--

LOCK TABLES `pret` WRITE;
/*!40000 ALTER TABLE `pret` DISABLE KEYS */;
INSERT INTO `pret` VALUES ('A001',1,'2020-01-03',NULL),('A001',2,'2020-01-04',NULL),('A002',1,'2020-02-01','2020-02-03'),('A002',3,'2020-02-04',NULL);
/*!40000 ALTER TABLE `pret` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-21  9:53:38