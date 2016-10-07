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


-- Dumping structure for table crowdflow.aw_sentiment_deliverables
CREATE TABLE IF NOT EXISTS `aw_sentiment_deliverables` (
  `deliverable_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(50) unsigned NOT NULL DEFAULT '0',
  `fk_user_id` int(50) unsigned NOT NULL DEFAULT '0',
  `answer` int(1) unsigned DEFAULT '0' COMMENT '1=negative, 2=neutral, 3=positive',
  `time_taken` int(50) unsigned NOT NULL DEFAULT '0',
  `skipped` int(1) unsigned NOT NULL DEFAULT '0',
  `is_correct` int(1) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`deliverable_id`),
  KEY `FK_SENTIMENT_RESOURCE_DELIVERABLE` (`resource_id`),
  KEY `FK_SENTIMENT_USER` (`fk_user_id`),
  CONSTRAINT `FK_SENTIMENT_RESOURCE_DELIVERABLE` FOREIGN KEY (`resource_id`) REFERENCES `aw_sentiment_resources` (`resource_id`),
  CONSTRAINT `FK_SENTIMENT_USER` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the answer deliverables for sentiment analysis task.';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
