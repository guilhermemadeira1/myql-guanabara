CREATE DATABASE  IF NOT EXISTS `cadastro` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `cadastro`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cadastro
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id_aluno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `nascimento` date NOT NULL,
  `profissao` varchar(30) DEFAULT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(30) DEFAULT 'BRASIL',
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'GODOFREDO','1984-01-02','Programador','M',78.50,1.83,'BRASIL'),(2,'MARIA','1999-12-30','Programador','F',55.20,1.65,'PORTUGAL'),(3,'JOSÉ','1977-08-16','Gestor','M',73.10,1.72,'ESPANHA'),(4,'JULIA','1957-09-21','Programador','F',68.00,1.42,'BRASIL'),(5,'JOAO','1970-09-21','Gestor','M',78.00,1.80,'BRASIL'),(6,'PEDRO','1999-08-13','Programador','M',80.60,1.78,'BRASIL'),(7,'CREUZA','1961-01-04','Programador','F',60.10,1.56,'URUGUAI'),(8,'ARNALDO','1985-05-02','Programador','M',71.20,1.62,'CHILE'),(9,'Ana Silva','2000-05-14','Engenheiro','F',55.50,1.65,'BRASIL'),(10,'Bruno Santos','1998-08-22','Médico','M',72.00,1.75,'PORTUGAL'),(11,'Carla Mendes','1995-11-30','Advogado','F',60.00,1.70,'ARGENTINA'),(12,'Daniel Pereira','2001-02-18','Arquiteto','M',80.20,1.80,'BRASIL'),(13,'Eliana Costa','1997-07-06','Professor','F',58.30,1.62,'CHILE'),(14,'Fabio Lima','1999-09-10','Engenheiro','M',90.00,1.85,'MÉXICO'),(15,'Gabriela Rocha','2002-03-25','Médico','F',65.40,1.68,'COLÔMBIA'),(16,'Henrique Alves','1996-12-15','Advogado','M',77.50,1.78,'ESPANHA'),(17,'Isabela Souza','1994-04-08','Nutricionista','F',52.00,1.60,'ITÁLIA'),(18,'Jorge Oliveira','2000-10-01','Professor','M',85.00,1.82,'BRASIL'),(19,'Lucas Martins','2016-01-10',NULL,'M',20.50,1.10,'BRASIL'),(20,'Mariana Alves','2017-05-22',NULL,'F',18.30,1.05,'PORTUGAL'),(21,'Pedro Costa','2018-03-15',NULL,'M',22.00,1.12,'ESPANHA'),(22,'Sofia Lima','2019-08-30',NULL,'F',19.00,1.08,'ARGENTINA'),(23,'Carlos Silveira','2003-06-18','Mecânico','M',95.20,1.67,'PORTUGAL'),(24,'Fernando Braga','2001-01-01','Professor','M',100.10,1.95,'URUGUAI'),(25,'Juracema Elias','2001-01-01','Advogado','F',100.10,1.92,'CHILE');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `idcurso` int(10) unsigned NOT NULL,
  `nome` varchar(20) NOT NULL,
  `descricao` text NOT NULL,
  `carga` int(10) unsigned NOT NULL,
  `aulas` int(10) unsigned DEFAULT NULL,
  `ano` year(4) NOT NULL DEFAULT 2016,
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'HTML5','Curso de HTML5',40,37,2014),(2,'Algoritmos','Lógica de programação',20,15,2014),(3,'Photoshop','Dicas de Photoshop CC',10,8,2014),(4,'PHP','Curso de PHP para iniciantes',40,20,2015),(5,'Java','Introdução à linguagem Java',29,39,2015),(6,'MySQL','Banco de dados MySQL',30,15,2016),(7,'Word','Curso completo de Word',40,30,2016),(10,'Youtuber','Gerar polêmica e ganahar inscritos',5,2,2050),(11,'PHP8','Curso de PHP versão 8',30,20,2021);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cadastro'
--

--
-- Dumping routines for database 'cadastro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-31  0:08:47
