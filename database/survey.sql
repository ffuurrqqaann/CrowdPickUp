-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for crowdflow
CREATE DATABASE IF NOT EXISTS `crowdflow` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `crowdflow`;


-- Dumping structure for table crowdflow.survey_deliverables
CREATE TABLE IF NOT EXISTS `survey_deliverables` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) unsigned NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` varchar(10) NOT NULL,
  `education` int(1) NOT NULL,
  `field_study` int(1) NOT NULL,
  `living` int(1) NOT NULL,
  `is_crowdsourcing_worker` int(1) NOT NULL,
  `is_reserved` int(1) NOT NULL,
  `is_generally_trusting` int(1) NOT NULL,
  `lazy` int(1) NOT NULL,
  `relaxed` int(1) NOT NULL,
  `artistic_interest` int(1) NOT NULL,
  `sociable` int(1) NOT NULL,
  `find_faults` int(1) NOT NULL,
  `thorough_job` int(1) NOT NULL,
  `nervous` int(1) NOT NULL,
  `active_imagination` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USER_SURVEY` (`fk_user_id`),
  CONSTRAINT `FK_USER_SURVEY` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the survey deliverablesof the users';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
