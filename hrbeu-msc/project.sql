-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: msc
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('1','张','123'),('2','朱','123'),('3','李','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `stu_no` varchar(10) NOT NULL,
  `sub_no` varchar(10) NOT NULL,
  `usual_grade` double DEFAULT NULL,
  `paper_grade` double DEFAULT NULL,
  `final_grade` double NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stu_no`,`sub_no`),
  KEY `fk_g_sub` (`sub_no`),
  CONSTRAINT `fk_g_s` FOREIGN KEY (`stu_no`) REFERENCES `student` (`stu_no`),
  CONSTRAINT `fk_g_sub` FOREIGN KEY (`sub_no`) REFERENCES `subject` (`sub_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES ('1','1',30,80,94,'good'),('1','1124',25,100,95,'优秀'),('1','2014',10,80,66,'及格，仍需努力'),('2','1076',0,60,42,'不及格'),('2','2014',20,100,90,'不错'),('3','0652',40,100,100,'非常好'),('3','3057',18,100,98,'很好！'),('4','1076',16,100,86,'良好'),('5','0652',31,90,85,'还行'),('5','1076',13,80,69,'及格'),('5','2513',0,100,90,'优秀');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_te_sub`
--

DROP TABLE IF EXISTS `stu_te_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_te_sub` (
  `stu_no` varchar(10) NOT NULL,
  `te_no` varchar(10) NOT NULL,
  `sub_no` varchar(10) NOT NULL,
  PRIMARY KEY (`stu_no`,`sub_no`,`te_no`),
  KEY `fk_teno` (`te_no`),
  KEY `fk_subno` (`sub_no`),
  CONSTRAINT `fk_stuno` FOREIGN KEY (`stu_no`) REFERENCES `student` (`stu_no`),
  CONSTRAINT `fk_subno` FOREIGN KEY (`sub_no`) REFERENCES `subject` (`sub_no`),
  CONSTRAINT `fk_teno` FOREIGN KEY (`te_no`) REFERENCES `teacher` (`te_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_te_sub`
--

LOCK TABLES `stu_te_sub` WRITE;
/*!40000 ALTER TABLE `stu_te_sub` DISABLE KEYS */;
INSERT INTO `stu_te_sub` VALUES ('1','1','1124'),('1','1','2014'),('2','1','2014'),('3','2','3057'),('2','4','1076'),('4','4','1076'),('5','4','1076'),('3','6','0652'),('5','6','0652'),('5','6','2513');
/*!40000 ALTER TABLE `stu_te_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `stu_no` varchar(10) NOT NULL,
  `stu_name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `class` varchar(10) NOT NULL,
  `major` varchar(20) NOT NULL,
  `admissiontime` date NOT NULL,
  `sex` varchar(1) NOT NULL,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`stu_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1','dsff','123','2016','软件工程','2018-07-28','男','计算机'),('2','沈平杰','123','2016','软件工程','2018-07-25','男','软件'),('22','猪八戒','123','2018','计算机','2011-02-01','男','河海'),('3','邓','123','2016','船舶','2018-08-03','男','船舶学院'),('4','黄浩','123','2016','英语','2018-08-16','男','外语学院'),('5','赵可','123','2016','经济','2018-08-01','女','经济学院'),('77','猪八戒','123','2018','计算机','2010-02-02','男','河海'),('8','猪八戒','123','2018','河海','2011-02-02','男','河海');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `sub_no` varchar(10) NOT NULL,
  `sub_name` varchar(10) NOT NULL,
  `open_department` varchar(20) NOT NULL,
  `paper_grade_per` float NOT NULL,
  PRIMARY KEY (`sub_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('0652','马克思','马克思学院',0.6),('1','美术','美院',0.8),('1076','英语','外语学院',0.7),('1124','软工基础','软件学院',0.7),('2','美术','美院',0.8),('2014','java编程','软件',0.7),('2513','微观经济学','经济学院',0.9),('3057','船舶设计','船舶学院',0.8);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `te_no` varchar(10) NOT NULL,
  `te_name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  `wage` int(11) NOT NULL,
  `entry_time` date NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phonenumber` varchar(11) DEFAULT NULL,
  `job_title` varchar(10) NOT NULL,
  PRIMARY KEY (`te_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('1','李达','123','计算机',10000,'1901-02-02','131@163.com','13544443333','教授'),('2','李奎','123','船舶',9888,'1901-02-02','131@163.com','13544443333','教授'),('3','李君','123','机电学院',8700,'2007-01-18','1234@163.com','13544447777','副教授'),('4','李木','123','外语学院',9000,'2018-08-01','limu@163.com','18845667898','讲师'),('5','李鑫','123','经济学院',10004,'2018-08-15','789@163.com','15789772343','教授'),('6','李珠','123','马克思学院',7866,'2018-07-11','lizhu@qq.com','13467873321','讲师'),('8','李达','123','河海',1234,'1900-01-01','131@163.com','13544443333','教授');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'msc'
--

--
-- Dumping routines for database 'msc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-12 20:41:21
