/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 5.6.51 : Database - ip2location
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ip2location` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ip2location`;

/*Table structure for table `domain_history` */

DROP TABLE IF EXISTS `domain_history`;

CREATE TABLE `domain_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(128) DEFAULT NULL,
  `domain_ip` varchar(255) DEFAULT NULL,
  `country_code` char(2) DEFAULT NULL,
  `country_name` varchar(64) DEFAULT NULL,
  `region_name` varchar(128) DEFAULT NULL,
  `city_name` varchar(128) DEFAULT NULL,
  `last_searched_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
