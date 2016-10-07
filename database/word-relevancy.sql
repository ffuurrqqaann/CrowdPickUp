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


-- Dumping structure for table crowdflow.aw_word_relevancy_deliverables
CREATE TABLE IF NOT EXISTS `aw_word_relevancy_deliverables` (
  `deliverable_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(50) unsigned NOT NULL DEFAULT '0',
  `fk_sentence_id` int(50) unsigned NOT NULL DEFAULT '0',
  `fk_word_id` int(50) unsigned DEFAULT '0',
  `time_taken` int(50) unsigned NOT NULL DEFAULT '0',
  `skipped` int(50) unsigned NOT NULL DEFAULT '0',
  `is_correct` int(1) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`deliverable_id`),
  KEY `FK_USER_ID` (`fk_user_id`),
  KEY `FK_DELIVERABLE_SENTENCE_ID` (`fk_sentence_id`),
  KEY `FK_DELIVERABLE_WORD_ID` (`fk_word_id`),
  CONSTRAINT `FK_DELIVERABLE_SENTENCE_ID` FOREIGN KEY (`fk_sentence_id`) REFERENCES `aw_word_relevancy_sentences` (`sentence_id`),
  CONSTRAINT `FK_DELIVERABLE_WORD_ID` FOREIGN KEY (`fk_word_id`) REFERENCES `aw_word_relevancy_words` (`word_id`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the word relevancy task deliverables';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
