/*
SQLyog Ultimate - MySQL GUI v8.22 
MySQL - 5.1.36-community-log : Database - findaride
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`findaride` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `findaride`;

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `rideID` bigint(20) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  KEY `FK_request` (`rideID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`rideID`,`userID`,`status`) values (0,1,1),(1,1,0);

/*Table structure for table `ride` */

DROP TABLE IF EXISTS `ride`;

CREATE TABLE `ride` (
  `userID` bigint(20) DEFAULT NULL,
  `sourceaddr` varchar(100) DEFAULT NULL,
  `destaddr` varchar(100) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `cost` int(4) DEFAULT NULL,
  `seats` int(2) DEFAULT NULL,
  `rideID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rideID`),
  KEY `FK_ride` (`userID`),
  CONSTRAINT `FK_ride` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `ride` */

insert  into `ride`(`userID`,`sourceaddr`,`destaddr`,`starttime`,`cost`,`seats`,`rideID`) values (NULL,'HollyHall','University','18:00:00',0,4,2);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`userID`,`username`,`sex`,`email`,`phonenumber`,`tstamp`,`uname`,`password`) values (41,'Sameer','Male','sometihng','12353','2010-04-01 00:00:01','sameer',' password'),(42,'Samee123r','Male','sometihng','1233353','2010-04-01 00:00:14','samr',' password'),(43,'Samee123fa','Mafdae','s232metihng','1233353','2010-04-01 00:00:22','samr',' password'),(44,'Samee123fa','Mafdae','s232metihng','121233353','2010-04-01 00:00:29','s121mr',' password'),(45,'Shaunak','Mafdae','s232metihdffdg','121233353','2010-04-01 00:00:37','s121mr',' password');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
