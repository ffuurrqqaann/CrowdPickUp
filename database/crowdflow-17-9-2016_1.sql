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


-- Dumping structure for table crowdflow.authorities
CREATE TABLE IF NOT EXISTS `authorities` (
  `authority_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(50) unsigned NOT NULL DEFAULT '0',
  `username` char(12) NOT NULL DEFAULT '0',
  `authority` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`authority_id`),
  KEY `FK_USER_USER_ID_AUTHORITY` (`fk_user_id`),
  KEY `FK_USER_USERNAME` (`username`),
  CONSTRAINT `FK_USER_USERNAME` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_USER_USER_ID_AUTHORITY` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='This table contains the user authorities';

-- Dumping data for table crowdflow.authorities: ~6 rows (approximately)
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`authority_id`, `fk_user_id`, `username`, `authority`) VALUES
	(1, 18, 'furqan', 'ROLE_USER'),
	(2, 233, 'furqan1234', 'ROLE_USER'),
	(3, 237, 'eeeeee', 'ROLE_USER'),
	(4, 238, 'tttttt', 'USER_ROLE'),
	(5, 239, 'yyyyyy', 'ROLE_USER'),
	(6, 240, 'uuuuuu', 'ROLE_USER'),
	(7, 241, 'Jorge', 'ROLE_USER'),
	(8, 242, 'Test', 'ROLE_USER'),
	(9, 243, 'Mmm', 'ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_image_identification_deliverables
CREATE TABLE IF NOT EXISTS `aw_image_identification_deliverables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) unsigned NOT NULL DEFAULT '0',
  `suggested_name` varchar(50) DEFAULT NULL,
  `fk_user_id` int(11) unsigned DEFAULT NULL,
  `time_taken` int(11) unsigned NOT NULL,
  `skipped` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0=rejected, 1=pending, 2=approved',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TASK3_USER_USER_ID` (`fk_user_id`),
  KEY `FK_TASK3_IMAGE_RESOURCE_ID` (`resource_id`),
  CONSTRAINT `FK_TASK3_IMAGE_RESOURCE_ID` FOREIGN KEY (`resource_id`) REFERENCES `aw_image_identification_resources` (`resource_id`),
  CONSTRAINT `FK_TASK3_USER_USER_ID` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COMMENT='This table contains the history of tasks''s data that user enters while completing task3';

-- Dumping data for table crowdflow.aw_image_identification_deliverables: ~8 rows (approximately)
/*!40000 ALTER TABLE `aw_image_identification_deliverables` DISABLE KEYS */;
INSERT INTO `aw_image_identification_deliverables` (`id`, `resource_id`, `suggested_name`, `fk_user_id`, `time_taken`, `skipped`, `created`, `updated`) VALUES
	(30, 2, '', 224, 3, 1, '2016-08-11 21:21:34', NULL),
	(31, 1, 'applesini', 225, 10, 0, '2016-08-13 20:57:38', NULL),
	(32, 1, '', 18, 56, 1, '2016-08-20 23:52:36', NULL),
	(33, 2, '', 224, 3, 1, '2016-08-20 23:52:46', NULL),
	(34, 1, 'applesini', 241, 30, 0, '2016-08-22 16:06:23', NULL),
	(35, 2, '', 241, 38, 1, '2016-08-22 16:08:14', NULL),
	(36, 2, '', 233, 9, 1, '2016-08-23 22:23:59', NULL),
	(37, 2, 'Yellow', 224, 47, 0, '2016-08-25 15:21:53', NULL),
	(38, 2, '', 242, 4, 1, '2016-08-25 15:23:56', NULL),
	(39, 1, 'Gsg', 242, 5, 0, '2016-08-25 15:24:01', NULL),
	(40, 2, '', 18, 1, 1, '2016-09-10 08:25:04', NULL),
	(41, 3, '', 18, 19, 1, '2016-09-10 08:27:29', '2016-09-10 08:27:52');
/*!40000 ALTER TABLE `aw_image_identification_deliverables` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_image_identification_resources
CREATE TABLE IF NOT EXISTS `aw_image_identification_resources` (
  `resource_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_url` text NOT NULL,
  `ground_truth` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`resource_id`),
  KEY `FK_IDENTIFIER_IDENTIFIER_ID` (`ground_truth`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COMMENT='This table contains the Image resources for task3';

-- Dumping data for table crowdflow.aw_image_identification_resources: ~49 rows (approximately)
/*!40000 ALTER TABLE `aw_image_identification_resources` DISABLE KEYS */;
INSERT INTO `aw_image_identification_resources` (`resource_id`, `image_url`, `ground_truth`, `created_at`, `updated_at`) VALUES
	(1, 'images/objects/orange.jpg', 'orange', '2016-09-01 20:11:55', '2015-09-19 00:01:07'),
	(2, 'images/objects/banana.jpg', 'banana', '2016-09-01 20:11:56', '2015-09-19 00:04:05'),
	(3, 'images/objects/apple.jpg', 'apple', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(4, 'images/objects/apricot.jpg', 'apricot', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(5, 'images/objects/avocado.jpg', 'avocado', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(6, 'images/objects/bilberry.jpg', 'bilberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(7, 'images/objects/blackberry.png', 'blackberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(8, 'images/objects/blackcurrant.jpg', 'blackcurrant', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(9, 'images/objects/blueberry.jpg', 'blueberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(10, 'images/objects/boysenberry.jpg', 'boysenberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(11, 'images/objects/cherimoya.jpg', 'cherimoya', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(12, 'images/objects/cherry.png', 'cherry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(13, 'images/objects/cloudberry.jpg', 'cloudberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(14, 'images/objects/coconut.jpg', 'coconut', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(15, 'images/objects/cranberries.jpg', 'cranberries', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(16, 'images/objects/currants.jpg', 'currants', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(17, 'images/objects/damson.jpg', 'damson', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(18, 'images/objects/dates.jpg', 'dates', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(19, 'images/objects/dragon-fruit.jpg', 'dragon-fruit', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(20, 'images/objects/durian.png', 'durian', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(21, 'images/objects/elderberries.jpg', 'elderberries', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(22, 'images/objects/feijoa.jpg', 'feijoa', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(23, 'images/objects/fig.jpg', 'fig', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(24, 'images/objects/goji-berry.jpg', 'goji-berry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(25, 'images/objects/gooseberry.jpg', 'gooseberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(26, 'images/objects/grapefruit.jpg', 'grapefruit', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(27, 'images/objects/grapes.jpg', 'grapes', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(28, 'images/objects/guava.png', 'guava', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(29, 'images/objects/jabuticaba.png', 'jabuticaba', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(30, 'images/objects/jackfruit.jpg', 'jackfruit', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(31, 'images/objects/jambul.jpg', 'jambul', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(32, 'images/objects/kiwi.jpg', 'kiwi', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(33, 'images/objects/lemon.jpg', 'lemon', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(34, 'images/objects/lime.jpg', 'lime', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(35, 'images/objects/lychee.jpg', 'lychee', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(36, 'images/objects/mango.jpg', 'mango', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(37, 'images/objects/melon.jpg', 'melon', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(38, 'images/objects/nectarines.jpg', 'nectarines', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(39, 'images/objects/olive.jpg', 'olive', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(40, 'images/objects/papaya.jpg', 'papaya', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(41, 'images/objects/peach.jpg', 'peach', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(42, 'images/objects/pear.jpg', 'pear', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(43, 'images/objects/pineapple.jpg', 'pineapple', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(44, 'images/objects/plum.jpg', 'plum', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(45, 'images/objects/plumcot.jpg', 'plumcot', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(46, 'images/objects/pomelo.jpg', 'pomelo', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(47, 'images/objects/raspberry.jpg', 'raspberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(48, 'images/objects/strawberry.jpg', 'strawberry', '2016-09-10 08:22:17', '2016-09-10 08:22:17'),
	(49, 'images/objects/tomato.jpg', 'tomato', '2016-09-10 08:22:17', '2016-09-10 08:22:17');
/*!40000 ALTER TABLE `aw_image_identification_resources` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_sentiment_deliverables
CREATE TABLE IF NOT EXISTS `aw_sentiment_deliverables` (
  `deliverable_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(50) unsigned NOT NULL DEFAULT '0',
  `fk_user_id` int(50) unsigned NOT NULL DEFAULT '0',
  `answer` int(1) unsigned DEFAULT '0' COMMENT '1=negative, 2=neutral, 3=positive',
  `time_taken` int(50) unsigned NOT NULL DEFAULT '0',
  `skipped` int(1) unsigned NOT NULL DEFAULT '0',
  `is_correct` int(1) unsigned DEFAULT NULL,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`deliverable_id`),
  KEY `FK_SENTIMENT_RESOURCE_DELIVERABLE` (`resource_id`),
  KEY `FK_SENTIMENT_USER` (`fk_user_id`),
  CONSTRAINT `FK_SENTIMENT_RESOURCE_DELIVERABLE` FOREIGN KEY (`resource_id`) REFERENCES `aw_sentiment_resources` (`resource_id`),
  CONSTRAINT `FK_SENTIMENT_USER` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 COMMENT='This table contains the answer deliverables for sentiment analysis task.';

-- Dumping data for table crowdflow.aw_sentiment_deliverables: ~11 rows (approximately)
/*!40000 ALTER TABLE `aw_sentiment_deliverables` DISABLE KEYS */;
INSERT INTO `aw_sentiment_deliverables` (`deliverable_id`, `resource_id`, `fk_user_id`, `answer`, `time_taken`, `skipped`, `is_correct`, `created`, `updated`) VALUES
	(41, 7, 18, 1, 7, 1, 0, '2016-08-11 21:29:45', '0000-00-00 00:00:00'),
	(42, 5, 18, 1, 4, 0, 0, '2016-08-11 21:29:59', '0000-00-00 00:00:00'),
	(43, 1, 18, 1, 7, 0, 0, '2016-08-18 18:02:47', '0000-00-00 00:00:00'),
	(44, 2, 18, 1, 5, 0, 0, '2016-08-21 00:46:38', '0000-00-00 00:00:00'),
	(45, 3, 18, 1, 4, 0, 0, '2016-08-21 21:37:20', '0000-00-00 00:00:00'),
	(46, 4, 18, 0, 16, 1, 0, '2016-08-22 00:27:07', '0000-00-00 00:00:00'),
	(47, 8, 241, 3, 14, 0, 0, '2016-08-22 16:18:37', '0000-00-00 00:00:00'),
	(48, 6, 18, 0, 4, 1, 0, '2016-08-23 22:25:39', '0000-00-00 00:00:00'),
	(49, 15, 242, 2, 11, 0, 0, '2016-08-25 15:29:30', '0000-00-00 00:00:00'),
	(50, 8, 18, 1, 23, 0, 0, '2016-08-30 22:36:21', '0000-00-00 00:00:00'),
	(51, 9, 18, 3, 33, 0, 1, '2016-08-30 22:36:55', '0000-00-00 00:00:00'),
	(52, 10, 18, 0, 4, 1, 0, '2016-08-30 22:45:38', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `aw_sentiment_deliverables` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_sentiment_resources
CREATE TABLE IF NOT EXISTS `aw_sentiment_resources` (
  `resource_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `sentence` text NOT NULL,
  `ground_truth` int(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COMMENT='This table contains the sentences and the ground truths of the sentiment analysis tasks.';

-- Dumping data for table crowdflow.aw_sentiment_resources: ~27 rows (approximately)
/*!40000 ALTER TABLE `aw_sentiment_resources` DISABLE KEYS */;
INSERT INTO `aw_sentiment_resources` (`resource_id`, `sentence`, `ground_truth`, `created`, `updated`) VALUES
	(1, 'The weather is great today!', 1, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(2, 'The lecture was very informative.', 1, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(3, 'My friends think the price is too expensive.', 3, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(4, 'I’m loving it so far.', 1, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(5, 'I’ve just finished my work.', 2, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(6, 'He’s been useless to the team so far.', 3, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(7, 'I hate it when she acts like that.', 3, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(8, 'The keys are on the table.', 2, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(9, 'My internet provider does a great job when it comes to stealing money from me', 3, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(10, 'The only downside of this restaurant is that it charges me too little for its service.', 1, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(11, 'Can you recommend a good tool I could use?', 2, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(12, 'This browser uses a lot of memory', 3, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(13, 'Absolutely adore it when my bus is late.', 3, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(14, 'I’m so pleased road construction woke me up with a bang.', 3, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(15, 'The new album is so sick.', 1, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(16, 'That was such a wicked performance by him on the field.', 1, '2016-07-04 14:00:44', '2016-07-04 14:00:44'),
	(17, 'I am responsible for me, my acting and my life!', 3, '2016-09-01 20:08:14', '2016-09-01 20:08:14'),
	(18, 'I am happy and thankful for every day of my life!', 3, '2016-09-01 20:08:14', '2016-09-01 20:08:14'),
	(19, 'Every defeat has got two winnings!', 3, '2016-09-01 20:08:14', '2016-09-01 20:08:14'),
	(20, 'I like me and I am loved!', 3, '2016-09-01 20:08:14', '2016-09-01 20:08:14'),
	(21, 'Thanks my parents, they did all that was possible.', 3, '2016-09-01 20:08:14', '2016-09-01 20:08:14'),
	(22, 'I enjoy the dancing of life with all my heart!', 3, '2016-09-01 20:08:14', '2016-09-01 20:08:14'),
	(23, 'It is not possible in this short span of time', 1, '2016-09-01 20:09:54', '2016-09-01 20:09:54'),
	(24, 'I will try my best to complete this task by today', 1, '2016-09-01 20:09:54', '2016-09-01 20:09:54'),
	(25, 'This is not my problem as it is not my job', 1, '2016-09-01 20:09:54', '2016-09-01 20:09:54'),
	(26, 'This is all what I can do for now', 1, '2016-09-01 20:09:54', '2016-09-01 20:09:54'),
	(27, 'I hate this company for that unfair they are doing to me', 1, '2016-09-01 20:09:54', '2016-09-01 20:09:54'),
	(28, 'Well, I thought this would be a lot more challenging', 2, '2016-09-01 20:11:21', '2016-09-01 20:11:21'),
	(29, 'Oh, no, of course, not. Everything was very clear', 2, '2016-09-01 20:11:21', '2016-09-01 20:11:21'),
	(30, 'How about we just take a minute to talk about the price a little bit more?', 2, '2016-09-01 20:11:21', '2016-09-01 20:11:21'),
	(31, 'I am impressed how easily we could find a common language with you, guys.', 2, '2016-09-01 20:11:21', '2016-09-01 20:11:21');
/*!40000 ALTER TABLE `aw_sentiment_resources` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_visual_deliverables
CREATE TABLE IF NOT EXISTS `aw_visual_deliverables` (
  `deliverable_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fk_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `answer` varchar(5) DEFAULT '0',
  `time_taken` int(11) unsigned NOT NULL DEFAULT '0',
  `skipped` int(1) unsigned NOT NULL DEFAULT '0',
  `is_correct` int(1) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`deliverable_id`),
  KEY `FK_VISUAL_RESOURCE` (`resource_id`),
  KEY `FK_VISUAL_USERS` (`fk_user_id`),
  CONSTRAINT `FK_VISUAL_RESOURCE` FOREIGN KEY (`resource_id`) REFERENCES `aw_visual_resources` (`resource_id`),
  CONSTRAINT `FK_VISUAL_USERS` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='This task contains the deliverables for the visual task (anywhere)';

-- Dumping data for table crowdflow.aw_visual_deliverables: ~12 rows (approximately)
/*!40000 ALTER TABLE `aw_visual_deliverables` DISABLE KEYS */;
INSERT INTO `aw_visual_deliverables` (`deliverable_id`, `resource_id`, `fk_user_id`, `answer`, `time_taken`, `skipped`, `is_correct`, `created`, `updated`) VALUES
	(9, 25, 18, '', 5, 1, 0, '2016-08-11 21:50:21', NULL),
	(10, 7, 18, '1', 22, 0, 0, '2016-08-11 21:50:55', NULL),
	(11, 1, 18, '1', 6, 0, 0, '2016-08-18 18:34:05', NULL),
	(12, 2, 18, '', 0, 1, 0, '2016-08-21 00:54:09', NULL),
	(13, 3, 18, '1', 9, 0, 0, '2016-08-21 00:54:27', NULL),
	(14, 5, 241, '1', 53, 0, 0, '2016-08-22 16:19:34', NULL),
	(15, 4, 18, '', 4, 1, 0, '2016-08-23 22:25:51', NULL),
	(16, 24, 242, '1', 13, 0, 0, '2016-08-25 15:29:55', NULL),
	(17, 1, 242, '', 2, 1, 0, '2016-08-25 15:29:58', NULL),
	(18, 5, 18, '1', 9, 0, 0, '2016-08-30 23:06:24', NULL),
	(19, 6, 18, '', 7, 1, 0, '2016-08-30 23:07:48', NULL),
	(20, 8, 18, '1', 20, 0, 1, '2016-08-30 23:08:08', NULL);
/*!40000 ALTER TABLE `aw_visual_deliverables` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_visual_resources
CREATE TABLE IF NOT EXISTS `aw_visual_resources` (
  `resource_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_path` text NOT NULL,
  `ground_truth` int(1) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COMMENT='This table contains the visual task resources.';

-- Dumping data for table crowdflow.aw_visual_resources: ~29 rows (approximately)
/*!40000 ALTER TABLE `aw_visual_resources` DISABLE KEYS */;
INSERT INTO `aw_visual_resources` (`resource_id`, `image_path`, `ground_truth`, `created`, `updated`) VALUES
	(1, 'images/1.png', 1, '2016-07-02 13:34:48', '2016-07-02 13:34:46'),
	(2, 'images/2.png', 1, '2016-07-02 13:35:01', '2016-07-02 13:35:00'),
	(3, 'images/3.png', 1, '2016-07-02 13:35:13', '2016-07-02 13:35:12'),
	(4, 'images/4.png', 1, '2016-07-02 13:35:26', '2016-07-02 13:35:24'),
	(5, 'images/5.png', 1, '2016-07-02 13:35:38', '2016-07-02 13:35:33'),
	(6, 'images/6.png', 2, '2016-07-02 13:36:01', '2016-07-02 13:35:58'),
	(7, 'images/7.png', 2, '2016-07-02 13:36:12', '2016-07-02 13:36:10'),
	(8, 'images/8.png', 1, '2016-07-02 13:36:28', '2016-07-02 13:36:27'),
	(9, 'images/9.png', 2, '2016-07-02 13:36:46', '2016-07-02 13:36:45'),
	(10, 'images/10.png', 2, '2016-07-02 13:36:57', '2016-07-02 13:36:56'),
	(11, 'images/11.png', 2, '2016-07-02 13:37:07', '2016-07-02 13:37:06'),
	(12, 'images/12.png', 1, '2016-07-02 13:37:23', '2016-07-02 13:37:22'),
	(13, 'images/13.png', 2, '2016-07-02 13:37:43', '2016-07-02 13:37:42'),
	(14, 'images/14.png', 2, '2016-07-02 13:37:57', '2016-07-02 13:37:56'),
	(15, 'images/15.png', 2, '2016-07-02 13:38:08', '2016-07-02 13:38:07'),
	(16, 'images/16.png', 1, '2016-07-02 13:38:26', '2016-07-02 13:38:27'),
	(17, 'images/17.png', 2, '2016-07-02 13:38:41', '2016-07-02 13:38:41'),
	(18, 'images/18.png', 1, '2016-07-02 13:38:54', '2016-07-02 13:38:55'),
	(19, 'images/19.png', 2, '2016-07-02 13:39:07', '2016-07-02 13:39:07'),
	(20, 'images/20.png', 1, '2016-07-02 13:39:53', '2016-07-02 13:39:53'),
	(21, 'images/21.png', 2, '2016-07-02 13:40:18', '2016-07-02 13:40:18'),
	(22, 'images/22.png', 2, '2016-07-02 13:40:29', '2016-07-02 13:40:29'),
	(23, 'images/23.png', 1, '2016-07-02 13:40:45', '2016-07-02 13:40:45'),
	(24, 'images/24.png', 2, '2016-07-02 13:43:58', '2016-07-02 13:43:58'),
	(25, 'images/25.png', 2, '2016-07-02 13:43:58', '2016-07-02 13:43:58'),
	(26, 'images/26.png', 2, '2016-07-02 13:43:58', '2016-07-02 13:43:58'),
	(27, 'images/27.png', 2, '2016-07-02 13:43:58', '2016-07-02 13:43:58'),
	(28, 'images/28.png', 2, '2016-07-02 13:43:58', '2016-07-02 13:43:58'),
	(29, 'images/29.png', 2, '2016-07-02 13:43:58', '2016-07-02 13:43:58');
/*!40000 ALTER TABLE `aw_visual_resources` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_word_relevancy_deliverables
CREATE TABLE IF NOT EXISTS `aw_word_relevancy_deliverables` (
  `deliverable_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(50) unsigned NOT NULL DEFAULT '0',
  `fk_sentence_id` int(50) unsigned NOT NULL DEFAULT '0',
  `fk_word_id` int(50) unsigned DEFAULT '0',
  `time_taken` int(50) unsigned NOT NULL DEFAULT '0',
  `skipped` int(50) unsigned NOT NULL DEFAULT '0',
  `is_correct` int(1) unsigned DEFAULT '0',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`deliverable_id`),
  KEY `FK_USER_ID` (`fk_user_id`),
  KEY `FK_DELIVERABLE_SENTENCE_ID` (`fk_sentence_id`),
  KEY `FK_DELIVERABLE_WORD_ID` (`fk_word_id`),
  CONSTRAINT `FK_DELIVERABLE_SENTENCE_ID` FOREIGN KEY (`fk_sentence_id`) REFERENCES `aw_word_relevancy_sentences` (`sentence_id`),
  CONSTRAINT `FK_DELIVERABLE_WORD_ID` FOREIGN KEY (`fk_word_id`) REFERENCES `aw_word_relevancy_words` (`word_id`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COMMENT='This table contains the word relevancy task deliverables';

-- Dumping data for table crowdflow.aw_word_relevancy_deliverables: ~19 rows (approximately)
/*!40000 ALTER TABLE `aw_word_relevancy_deliverables` DISABLE KEYS */;
INSERT INTO `aw_word_relevancy_deliverables` (`deliverable_id`, `fk_user_id`, `fk_sentence_id`, `fk_word_id`, `time_taken`, `skipped`, `is_correct`, `created`, `updated`) VALUES
	(13, 19, 3, NULL, 9, 1, 0, '2016-08-11 22:36:59', '0000-00-00 00:00:00'),
	(14, 225, 2, 4, 2, 0, 0, '2016-08-11 22:37:12', '0000-00-00 00:00:00'),
	(15, 19, 1, NULL, 9, 1, 0, '2016-08-18 11:04:37', '0000-00-00 00:00:00'),
	(16, 227, 2, NULL, 3, 1, 0, '2016-08-23 22:26:03', '0000-00-00 00:00:00'),
	(17, 233, 1, NULL, 4, 1, 0, '2016-08-23 22:26:07', '0000-00-00 00:00:00'),
	(18, 227, 3, NULL, 2, 1, 0, '2016-08-23 22:26:09', '0000-00-00 00:00:00'),
	(19, 242, 2, 6, 18, 0, 0, '2016-08-29 13:42:51', '0000-00-00 00:00:00'),
	(20, 242, 1, 3, 43, 0, 0, '2016-08-29 13:43:35', '0000-00-00 00:00:00'),
	(21, 242, 3, 8, 12, 0, 0, '2016-08-29 13:43:48', '0000-00-00 00:00:00'),
	(22, 18, 10, NULL, 19, 1, 0, '2016-08-30 23:36:40', '0000-00-00 00:00:00'),
	(23, 18, 1, 3, 14, 0, 0, '2016-08-30 23:38:46', '0000-00-00 00:00:00'),
	(27, 18, 2, 5, 22, 0, 0, '2016-08-31 20:37:44', '0000-00-00 00:00:00'),
	(28, 18, 3, 8, 13, 0, 0, '2016-08-31 20:39:30', '0000-00-00 00:00:00'),
	(29, 18, 4, 11, 9, 0, 0, '2016-08-31 20:40:27', '0000-00-00 00:00:00'),
	(30, 18, 5, 14, 38, 0, 0, '2016-08-31 20:41:05', '0000-00-00 00:00:00'),
	(31, 18, 6, 16, 18, 0, 0, '2016-08-31 20:44:23', '0000-00-00 00:00:00'),
	(32, 18, 7, 20, 50, 0, 0, '2016-08-31 20:53:14', '0000-00-00 00:00:00'),
	(33, 18, 8, 21, 14, 0, 0, '2016-08-31 20:57:45', '0000-00-00 00:00:00'),
	(34, 18, 9, 25, 143, 0, 0, '2016-08-31 21:00:09', '0000-00-00 00:00:00'),
	(35, 18, 11, 30, 10, 0, 1, '2016-09-01 12:07:56', '0000-00-00 00:00:00'),
	(36, 18, 12, 34, 36, 0, 0, '2016-09-01 12:08:32', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `aw_word_relevancy_deliverables` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_word_relevancy_sentences
CREATE TABLE IF NOT EXISTS `aw_word_relevancy_sentences` (
  `sentence_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `ground_truth` int(50) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`sentence_id`),
  KEY `FK_GROUND_TRUTH_WORD_ID` (`ground_truth`),
  CONSTRAINT `FK_GROUND_TRUTH_WORD_ID` FOREIGN KEY (`ground_truth`) REFERENCES `aw_word_relevancy_words` (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COMMENT='This table contains the sentences for the relevancy tasks.';

-- Dumping data for table crowdflow.aw_word_relevancy_sentences: ~27 rows (approximately)
/*!40000 ALTER TABLE `aw_word_relevancy_sentences` DISABLE KEYS */;
INSERT INTO `aw_word_relevancy_sentences` (`sentence_id`, `text`, `ground_truth`, `created`, `updated`) VALUES
	(1, 'She quailed at his heartless words.', 3, '2016-07-07 23:24:37', '2016-07-07 23:24:37'),
	(2, 'The withering of their grasslands forced the nomads of the Sahara to descend into the Nile valley.', 6, '2016-07-07 23:25:06', '2016-07-07 23:25:06'),
	(3, 'She urged her horse onward until she reached the short obelisk marking the road leading into Landis.', 8, '2016-07-07 23:25:16', '2016-07-07 23:25:16'),
	(4, 'The inscription of memorable utterances on durable materials', 9, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(5, 'I felt elated at beating Dennis', 12, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(6, 'His teeth were bared in a feral snarl', 15, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(7, 'The look in his eyes became furtive', 18, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(8, 'She had embezzled £5,600,000 in company funds', 21, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(9, 'He extolled the virtues of the Russian peoples', 24, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(10, 'King Malcolm struggled to unite his fractious kingdom', 27, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(11, 'A look of haughty disdain', 30, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(12, 'He could have strangled this impudent upstart', 33, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(13, 'They felt inhibited by the presence of healthcare professionals', 36, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(14, 'Everyone took the company president’s resignation as the company’s knell of bankruptcy', 39, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(15, 'The more lurid details of the massacre were too frightening for the children', 42, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(16, 'The designs are hand-glazed with meticulous care', 45, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(17, 'He was familiar with the nuances of the local dialect', 48, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(18, 'He wondered if the doctor was being deliberately obtuse', 51, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(19, 'It succinctly covered all the salient points of the case', 54, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(20, 'After such gatherings she would be taciturn and morose', 57, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(21, 'She took umbrage at his remarks', 60, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(22, 'My sister is a shallow sycophant who will flatter anyone for a free designer handbag', 63, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(23, 'The more lurid details of the massacre were too frightening for the children', 66, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(24, 'A day that will live in infamy', 69, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(25, 'A stubbornly insular farming people', 72, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(26, 'The referee\'s inept handling of the match', 75, '2016-08-30 14:15:50', '2016-08-30 14:15:50'),
	(27, 'she said plumpness was a sign of gluttony in most cases', 78, '2016-08-30 14:15:50', '2016-08-30 14:15:50');
/*!40000 ALTER TABLE `aw_word_relevancy_sentences` ENABLE KEYS */;


-- Dumping structure for table crowdflow.aw_word_relevancy_words
CREATE TABLE IF NOT EXISTS `aw_word_relevancy_words` (
  `word_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `fk_sentence_id` int(50) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`word_id`),
  KEY `FK_WORDS_SENTENCE_ID` (`fk_sentence_id`),
  CONSTRAINT `FK_WORDS_SENTENCE_ID` FOREIGN KEY (`fk_sentence_id`) REFERENCES `aw_word_relevancy_sentences` (`sentence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1 COMMENT='This table contains the words relevant to the words in aw_word_relevancy_sentences';

-- Dumping data for table crowdflow.aw_word_relevancy_words: ~80 rows (approximately)
/*!40000 ALTER TABLE `aw_word_relevancy_words` DISABLE KEYS */;
INSERT INTO `aw_word_relevancy_words` (`word_id`, `text`, `fk_sentence_id`, `created_at`, `updated_at`) VALUES
	(1, 'confront', 1, '2016-07-07 23:26:53', '2016-07-07 23:26:53'),
	(2, 'approach', 1, '2016-07-07 23:27:04', '2016-07-07 23:27:05'),
	(3, 'shake', 1, '2016-07-07 23:27:13', '2016-07-07 23:27:14'),
	(4, 'still', 2, '2016-07-07 23:27:26', '2016-07-07 23:27:27'),
	(5, 'immobile', 2, '2016-07-07 23:27:34', '2016-07-07 23:27:35'),
	(6, 'wanderer', 2, '2016-07-07 23:27:45', '2016-07-07 23:27:45'),
	(7, 'bottom', 3, '2016-07-07 23:28:09', '2016-07-07 23:28:09'),
	(8, 'monument', 3, '2016-07-07 23:28:19', '2016-07-07 23:28:19'),
	(9, 'carving', 4, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(10, 'exclude', 4, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(11, 'checkoff', 4, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(12, 'jubilant', 5, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(13, 'down', 5, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(14, 'troubled', 5, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(15, 'savage', 6, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(16, 'tame', 6, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(17, 'pet', 6, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(18, 'creepy', 7, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(19, 'fortright', 7, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(20, 'open', 7, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(21, 'misuse', 8, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(22, 'pay', 8, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(23, 'reimburse', 8, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(24, 'acclaim', 9, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(25, 'blame', 9, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(26, 'castigate', 9, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(27, 'headstrong', 10, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(28, 'blame', 10, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(29, 'castigate', 10, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(30, 'cavalier', 11, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(31, 'meek', 11, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(32, 'timid', 11, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(33, 'cheeky', 12, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(34, 'polite', 12, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(35, 'retiring', 12, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(36, 'constrain', 13, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(37, 'encourage', 13, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(38, 'support', 13, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(39, 'proclaim', 14, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(40, 'obscure', 14, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(41, 'cover', 14, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(42, 'vivid', 15, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(43, 'dull', 15, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(44, 'pleasant', 15, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(45, 'precise', 16, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(46, 'thoughtless', 16, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(47, 'uncritical', 16, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(48, 'refinement', 17, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(49, 'information', 17, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(50, 'light', 17, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(51, 'stolid', 18, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(52, 'pointed', 18, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(53, 'quick', 18, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(54, 'striking', 19, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(55, 'insignificant', 19, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(56, 'unimportant', 19, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(57, 'antisocial', 20, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(58, 'fluent', 20, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(59, 'wordy', 20, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(60, 'wrath', 21, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(61, 'delight', 21, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(62, 'cheer', 21, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(63, 'toady', 22, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(64, 'independent', 22, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(65, 'guardian', 22, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(66, 'distinct', 23, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(67, 'mild', 23, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(68, 'pleasant', 23, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(69, 'evil', 24, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(70, 'esteem', 24, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(71, 'virtue', 24, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(72, 'illiberal', 25, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(73, 'broad-minded', 25, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(74, 'neutral', 25, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(75, 'unhandy', 26, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(76, 'fit', 26, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(77, 'proper', 26, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(78, 'penchant', 27, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(79, 'apathy', 27, '2016-08-30 14:38:14', '2016-08-30 14:38:14'),
	(80, 'lethargy', 27, '2016-08-30 14:38:14', '2016-08-30 14:38:14');
/*!40000 ALTER TABLE `aw_word_relevancy_words` ENABLE KEYS */;


-- Dumping structure for table crowdflow.hobbies
CREATE TABLE IF NOT EXISTS `hobbies` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `fk_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `time_taken` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COMMENT='This table contains the hobbies for the oulu hobbies task';

-- Dumping data for table crowdflow.hobbies: ~35 rows (approximately)
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` (`id`, `name`, `status`, `fk_user_id`, `time_taken`, `created`) VALUES
	(1, 'Skydiving', 1, 0, 0, '2016-08-12 20:27:48'),
	(2, 'Icehockey', 1, 0, 0, '2016-08-12 20:27:48'),
	(3, 'Deep Sea Diving', 1, 0, 0, '2016-08-12 20:27:48'),
	(4, 'Fishing', 1, 0, 0, '2016-08-12 20:27:48'),
	(5, 'Sea Surfing', 1, 0, 0, '2016-08-12 20:27:48'),
	(6, 'Volleyball', 1, 0, 0, '2016-08-12 20:27:48'),
	(7, 'Cricket', 1, 0, 0, '2016-08-12 20:27:48'),
	(8, 'Football', 1, 0, 0, '2016-08-12 20:27:48'),
	(12, 'Canoeing', 0, 243, 32, '2016-09-01 14:58:40'),
	(13, 'Aircraft Spotting', 1, 18, 0, '2016-09-01 20:04:07'),
	(14, 'Airbrushing', 1, 18, 0, '2016-09-01 20:04:07'),
	(15, 'Archery', 1, 18, 0, '2016-09-01 20:04:07'),
	(16, 'Badminton', 1, 18, 0, '2016-09-01 20:04:07'),
	(17, 'Baseball', 1, 18, 0, '2016-09-01 20:04:07'),
	(18, 'Base Jumping', 1, 18, 0, '2016-09-01 20:04:07'),
	(19, 'Basketball', 1, 18, 0, '2016-09-01 20:04:07'),
	(20, 'Bicycling', 1, 18, 0, '2016-09-01 20:04:07'),
	(21, 'Boating', 1, 18, 0, '2016-09-01 20:04:07'),
	(22, 'Body Building', 1, 18, 0, '2016-09-01 20:04:07'),
	(23, 'Bowling', 1, 18, 0, '2016-09-01 20:04:07'),
	(24, 'Calligraphy', 1, 18, 0, '2016-09-01 20:04:07'),
	(25, 'Coloring', 1, 18, 0, '2016-09-01 20:04:07'),
	(26, 'Floorball', 1, 18, 0, '2016-09-01 20:04:07'),
	(27, 'Four Wheeling', 1, 18, 0, '2016-09-01 20:04:07'),
	(28, 'Gymnastics', 1, 18, 0, '2016-09-01 20:04:07'),
	(29, 'Hot air ballooning', 1, 18, 0, '2016-09-01 20:04:07'),
	(30, 'Mountain Biking', 1, 18, 0, '2016-09-01 20:04:07'),
	(31, 'Mountain Climbing', 1, 18, 0, '2016-09-01 20:04:07'),
	(32, 'Paintball', 1, 18, 0, '2016-09-01 20:04:07'),
	(33, 'Paragliding', 1, 18, 0, '2016-09-01 20:04:07'),
	(34, 'Skateboarding', 1, 18, 0, '2016-09-01 20:04:07'),
	(35, 'Snorkeling', 1, 18, 0, '2016-09-01 20:04:07'),
	(36, 'Snowboarding', 1, 18, 0, '2016-09-01 20:04:07'),
	(37, 'Swimming', 1, 18, 0, '2016-09-01 20:04:07'),
	(38, 'Trekking', 1, 18, 0, '2016-09-01 20:04:07');
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;


-- Dumping structure for table crowdflow.housing_locations
CREATE TABLE IF NOT EXISTS `housing_locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='This table contains the student housing task location';

-- Dumping data for table crowdflow.housing_locations: ~11 rows (approximately)
/*!40000 ALTER TABLE `housing_locations` DISABLE KEYS */;
INSERT INTO `housing_locations` (`id`, `name`) VALUES
	(1, 'Keskusta'),
	(2, 'Raksila'),
	(3, 'Alppila'),
	(4, 'Linnanmaa'),
	(5, 'Syynimaa'),
	(6, 'Kaijonharju'),
	(7, 'Toppila'),
	(8, 'Höyhtyä'),
	(9, 'Peltola'),
	(10, 'Rajakylä'),
	(11, 'Toivoniemi');
/*!40000 ALTER TABLE `housing_locations` ENABLE KEYS */;


-- Dumping structure for table crowdflow.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `image` text,
  `latitude` decimal(11,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='This table contains the location information for the "Place a new tag" task.';

-- Dumping data for table crowdflow.locations: ~4 rows (approximately)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `name`, `address`, `description`, `image`, `latitude`, `longitude`) VALUES
	(2, 'tokmanni', 'Erkki Koiso-Kanttilan katu 5, 90570 Oulu, Finland', 'This is just near by yliopistokatu', 'http://s3-media2.fl.yelpcdn.com/bphoto/36d1iacWVlZTc1QYbDoM3A/ls.jpg', 65.05776810, 25.46912070),
	(3, 'prisma', 'Erkki Koiso-Kanttilan katu 5, 90570 Oulu, Finland', 'This is just near by synninnma', 'http://www.realfoodsuomi.com/wp-content/uploads/2013/03/makeiset.jpg', 65.05776810, 25.46912070),
	(5, 'sale', 'Erkki Koiso-Kanttilan katu 5, 90570 Oulu, Finland', 'This place is near sale', 'http://photos.travellerspoint.com/71462/IMG_6628.jpg', 65.05776810, 25.46912070),
	(7, 'k market', 'Erkki Koiso-Kanttilan katu 5, 90570 Oulu, Finland', 'The tag is in k market', 'http://s3-media1.fl.yelpcdn.com/bphoto/lVEW0bbHT-ydhaiXbf50iQ/ls.jpg', 65.05776810, 25.46912070);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;


-- Dumping structure for table crowdflow.location_place_description_deliverables
CREATE TABLE IF NOT EXISTS `location_place_description_deliverables` (
  `deliverable_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(50) unsigned NOT NULL DEFAULT '0',
  `location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `crowdedness` int(1) unsigned NOT NULL DEFAULT '0',
  `weather` int(1) unsigned NOT NULL DEFAULT '0',
  `noise` int(1) unsigned NOT NULL DEFAULT '0',
  `localrestaurant` text NOT NULL,
  `trafficsituation` int(1) unsigned NOT NULL DEFAULT '0',
  `availableservices` int(1) unsigned NOT NULL DEFAULT '0',
  `locationeasytofind` int(1) unsigned NOT NULL DEFAULT '0',
  `time_taken` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`deliverable_id`),
  KEY `FK_LPDD_USER_ID` (`fk_user_id`),
  KEY `FK_LOCATION_ID` (`location_id`),
  CONSTRAINT `FK_LOCATION_ID` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK_LPDD_USER_ID` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='This table contains the place description deliverables';

-- Dumping data for table crowdflow.location_place_description_deliverables: ~3 rows (approximately)
/*!40000 ALTER TABLE `location_place_description_deliverables` DISABLE KEYS */;
INSERT INTO `location_place_description_deliverables` (`deliverable_id`, `fk_user_id`, `location_id`, `crowdedness`, `weather`, `noise`, `localrestaurant`, `trafficsituation`, `availableservices`, `locationeasytofind`, `time_taken`, `created`, `updated`) VALUES
	(9, 18, 7, 1, 1, 1, 'testing', 1, 1, 1, 15, NULL, NULL),
	(10, 18, 2, 1, 1, 1, 'testing', 1, 1, 1, 7, '2016-08-06 21:13:58', NULL),
	(11, 18, 3, 1, 1, 1, 'testing', 1, 1, 1, 5, '2016-08-07 12:16:10', NULL),
	(12, 18, 5, 1, 1, 1, 'testing', 1, 1, 1, 52, '2016-08-08 16:03:05', NULL);
/*!40000 ALTER TABLE `location_place_description_deliverables` ENABLE KEYS */;


-- Dumping structure for table crowdflow.location_place_description_questions
CREATE TABLE IF NOT EXISTS `location_place_description_questions` (
  `question_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='This table contains the questions for the location based task i.e., Describe the place.';

-- Dumping data for table crowdflow.location_place_description_questions: ~4 rows (approximately)
/*!40000 ALTER TABLE `location_place_description_questions` DISABLE KEYS */;
INSERT INTO `location_place_description_questions` (`question_id`, `text`, `created`, `updated`) VALUES
	(1, 'question1', '2016-07-08 16:02:18', '2016-07-08 16:02:19'),
	(2, 'question2', '2016-07-08 16:02:21', '2016-07-08 16:02:22'),
	(3, 'question3', '2016-07-08 16:02:25', '2016-07-08 16:02:26'),
	(4, 'question4', '2016-07-08 16:02:27', '2016-07-08 16:02:27');
/*!40000 ALTER TABLE `location_place_description_questions` ENABLE KEYS */;


-- Dumping structure for table crowdflow.location_ratings
CREATE TABLE IF NOT EXISTS `location_ratings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `rating` int(11) unsigned NOT NULL DEFAULT '0',
  `fk_location_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_LOCATION_RATING_USER_USER_ID` (`fk_user_id`),
  KEY `FK_LOCATION_RATING_LOCATIONS_LOCATION_ID` (`fk_location_id`),
  CONSTRAINT `FK_LOCATION_RATING_LOCATIONS_LOCATION_ID` FOREIGN KEY (`fk_location_id`) REFERENCES `locations` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_LOCATION_RATING_USER_USER_ID` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the ratings that the users give to the location while completing the location based tasks';

-- Dumping data for table crowdflow.location_ratings: ~0 rows (approximately)
/*!40000 ALTER TABLE `location_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_ratings` ENABLE KEYS */;


-- Dumping structure for table crowdflow.oulu_hobbies_deliverables
CREATE TABLE IF NOT EXISTS `oulu_hobbies_deliverables` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) NOT NULL,
  `answer` text,
  `fk_hobby_id` int(255) unsigned NOT NULL,
  `time_taken` int(11) unsigned NOT NULL,
  `skipped` int(1) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='This table contains the deliverables for the oulu hobbies task';

-- Dumping data for table crowdflow.oulu_hobbies_deliverables: ~13 rows (approximately)
/*!40000 ALTER TABLE `oulu_hobbies_deliverables` DISABLE KEYS */;
INSERT INTO `oulu_hobbies_deliverables` (`id`, `fk_user_id`, `answer`, `fk_hobby_id`, `time_taken`, `skipped`, `created`) VALUES
	(1, 224, 'icehockey', 2, 9, 0, '2016-08-13 00:10:11'),
	(2, 18, '', 8, 13, 1, '2016-08-13 00:15:37'),
	(4, 18, 'banani', 1, 21, 0, '2016-08-14 10:12:15'),
	(5, 18, 'banani', 3, 37, 0, '2016-08-14 10:16:23'),
	(6, 18, '', 4, 8, 1, '2016-08-14 10:16:39'),
	(7, 18, '', 5, 2, 1, '2016-08-14 10:16:44'),
	(8, 18, '', 6, 2, 1, '2016-08-14 10:16:49'),
	(9, 18, '', 7, 0, 1, '2016-08-14 10:16:51'),
	(10, 18, '', 9, 1, 1, '2016-08-14 10:16:54'),
	(11, 18, '', 10, 1, 1, '2016-08-14 10:16:59'),
	(12, 242, '', 2, 19, 1, '2016-08-23 22:20:58'),
	(13, 18, '', 11, 6, 1, '2016-08-23 22:22:52'),
	(14, 242, '', 5, 9, 1, '2016-08-25 15:26:14'),
	(15, 18, 'asfsfsdfsdfsdfd', 2, 5, 0, '2016-08-26 20:57:44');
/*!40000 ALTER TABLE `oulu_hobbies_deliverables` ENABLE KEYS */;


-- Dumping structure for table crowdflow.situated_hobbies
CREATE TABLE IF NOT EXISTS `situated_hobbies` (
  `hobby_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) unsigned NOT NULL,
  `sky_diving` int(1) NOT NULL,
  `sky_diving_found_text` text,
  `ice_hockey` int(1) NOT NULL,
  `ice_hockey_found_text` text,
  `deep_sea_diving` int(1) NOT NULL,
  `deep_sea_diving_found_text` text,
  `fishing` int(1) NOT NULL,
  `fishing_found_text` text,
  `sea_surfing` int(1) NOT NULL,
  `sea_surfing_found_text` text,
  `volleyball` int(1) NOT NULL,
  `volleyball_found_text` text,
  `cricket` int(1) NOT NULL,
  `cricket_found_text` text,
  `football` int(1) NOT NULL,
  `football_found_text` text,
  `time_taken` int(11) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`hobby_id`),
  KEY `FK_USER_SITUATED_HOBBIES` (`fk_user_id`),
  CONSTRAINT `FK_USER_SITUATED_HOBBIES` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='This table contains the hobbies that a user can find in oulu.';

-- Dumping data for table crowdflow.situated_hobbies: ~1 rows (approximately)
/*!40000 ALTER TABLE `situated_hobbies` DISABLE KEYS */;
INSERT INTO `situated_hobbies` (`hobby_id`, `fk_user_id`, `sky_diving`, `sky_diving_found_text`, `ice_hockey`, `ice_hockey_found_text`, `deep_sea_diving`, `deep_sea_diving_found_text`, `fishing`, `fishing_found_text`, `sea_surfing`, `sea_surfing_found_text`, `volleyball`, `volleyball_found_text`, `cricket`, `cricket_found_text`, `football`, `football_found_text`, `time_taken`, `created`, `updated`) VALUES
	(8, 18, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 3, '2016-08-07 12:17:54', NULL);
/*!40000 ALTER TABLE `situated_hobbies` ENABLE KEYS */;


-- Dumping structure for table crowdflow.student_housing_deliverable
CREATE TABLE IF NOT EXISTS `student_housing_deliverable` (
  `deliverable_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) unsigned NOT NULL,
  `fk_housing_location_id` int(11) unsigned NOT NULL,
  `cleanliness` int(1) unsigned DEFAULT NULL,
  `nearby_services` int(1) unsigned DEFAULT NULL,
  `location` int(1) unsigned DEFAULT NULL,
  `cost` int(1) unsigned DEFAULT NULL,
  `internet` int(1) unsigned DEFAULT NULL,
  `maintenance` int(1) unsigned DEFAULT NULL,
  `is_skipped` int(1) unsigned DEFAULT NULL,
  `time_taken` int(11) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`deliverable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table crowdflow.student_housing_deliverable: ~2 rows (approximately)
/*!40000 ALTER TABLE `student_housing_deliverable` DISABLE KEYS */;
INSERT INTO `student_housing_deliverable` (`deliverable_id`, `fk_user_id`, `fk_housing_location_id`, `cleanliness`, `nearby_services`, `location`, `cost`, `internet`, `maintenance`, `is_skipped`, `time_taken`, `created`) VALUES
	(1, 18, 3, 1, 1, 1, 1, 1, 1, 1, 3, '2016-08-11 19:31:12'),
	(2, 224, 5, 5, 5, 5, 5, 5, 5, 0, 9, '2016-08-11 19:37:50'),
	(3, 18, 1, 0, 0, 0, 0, 0, 0, 1, 4, '2016-08-14 10:44:07'),
	(4, 241, 4, 4, 4, 3, 2, 2, 3, 0, 5, '2016-08-22 16:14:16'),
	(5, 18, 2, 0, 0, 0, 0, 0, 0, 1, 8, '2016-08-23 22:23:07');
/*!40000 ALTER TABLE `student_housing_deliverable` ENABLE KEYS */;


-- Dumping structure for table crowdflow.student_housing_deliverables
CREATE TABLE IF NOT EXISTS `student_housing_deliverables` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) unsigned NOT NULL,
  `keskusta_cleanliness` int(1) unsigned DEFAULT NULL,
  `keskusta_service` int(1) unsigned DEFAULT NULL,
  `keskusta_location` int(1) unsigned DEFAULT NULL,
  `keskusta_cost` int(1) unsigned DEFAULT NULL,
  `keskusta_internet_facility` int(1) unsigned DEFAULT NULL,
  `keskusta_no_information` int(1) unsigned DEFAULT NULL,
  `raksila_cleanliness` int(1) unsigned DEFAULT NULL,
  `raksila_service` int(1) unsigned DEFAULT NULL,
  `raksila_location` int(1) unsigned DEFAULT NULL,
  `raksila_cost` int(1) unsigned DEFAULT NULL,
  `raksila_internet_facility` int(1) unsigned DEFAULT NULL,
  `raksila_no_information` int(1) unsigned DEFAULT NULL,
  `alppila_cleanliness` int(1) unsigned DEFAULT NULL,
  `alppila_service` int(1) unsigned DEFAULT NULL,
  `alppila_location` int(1) unsigned DEFAULT NULL,
  `alppila_cost` int(1) unsigned DEFAULT NULL,
  `alppila_internet_facility` int(1) unsigned DEFAULT NULL,
  `alppila_no_information` int(1) unsigned DEFAULT NULL,
  `linnanmaa_cleanliness` int(1) unsigned DEFAULT NULL,
  `linnanmaa_service` int(1) unsigned DEFAULT NULL,
  `linnanmaa_location` int(1) unsigned DEFAULT NULL,
  `linnanmaa_cost` int(1) unsigned DEFAULT NULL,
  `linnanmaa_internet_facility` int(1) unsigned DEFAULT NULL,
  `linnanmaa_no_information` int(1) unsigned DEFAULT NULL,
  `syynimaa_cleanliness` int(1) unsigned DEFAULT NULL,
  `syynimaa_service` int(1) unsigned DEFAULT NULL,
  `syynimaa_location` int(1) unsigned DEFAULT NULL,
  `syynimaa_cost` int(1) unsigned DEFAULT NULL,
  `syynimaa_internet_facility` int(1) unsigned DEFAULT NULL,
  `syynimaa_no_information` int(1) unsigned DEFAULT NULL,
  `kaijonharju_cleanliness` int(1) unsigned DEFAULT NULL,
  `kaijonharju_service` int(1) unsigned DEFAULT NULL,
  `kaijonharju_location` int(1) unsigned DEFAULT NULL,
  `kaijonharju_cost` int(1) unsigned DEFAULT NULL,
  `kaijonharju_internet_facility` int(1) unsigned DEFAULT NULL,
  `kaijonharju_no_information` int(1) unsigned DEFAULT NULL,
  `toppila_cleanliness` int(1) unsigned DEFAULT NULL,
  `toppila_service` int(1) unsigned DEFAULT NULL,
  `toppila_location` int(1) unsigned DEFAULT NULL,
  `toppila_cost` int(1) unsigned DEFAULT NULL,
  `toppila_internet_facility` int(1) unsigned DEFAULT NULL,
  `toppila_no_information` int(1) unsigned DEFAULT NULL,
  `hoyhtya_cleanliness` int(1) unsigned DEFAULT NULL,
  `hoyhtya_service` int(1) unsigned DEFAULT NULL,
  `hoyhtya_location` int(1) unsigned DEFAULT NULL,
  `hoyhtya_cost` int(1) unsigned DEFAULT NULL,
  `hoyhtya_internet_facility` int(1) unsigned DEFAULT NULL,
  `hoyhtya_no_information` int(1) unsigned DEFAULT NULL,
  `peltola_cleanliness` int(1) unsigned DEFAULT NULL,
  `peltola_service` int(1) unsigned DEFAULT NULL,
  `peltola_location` int(1) unsigned DEFAULT NULL,
  `peltola_cost` int(1) unsigned DEFAULT NULL,
  `peltola_internet_facility` int(1) unsigned DEFAULT NULL,
  `peltola_no_information` int(1) unsigned DEFAULT NULL,
  `rajakyla_cleanliness` int(1) unsigned DEFAULT NULL,
  `rajakyla_location` int(1) unsigned DEFAULT NULL,
  `rajakyla_cost` int(1) unsigned DEFAULT NULL,
  `rajakyla_internet_facility` int(1) unsigned DEFAULT NULL,
  `rajakyla_no_information` int(1) unsigned DEFAULT NULL,
  `toivoniemi_cleanliness` int(1) unsigned DEFAULT NULL,
  `toivoniemi_service` int(1) unsigned DEFAULT NULL,
  `toivoniemi_cost` int(1) unsigned DEFAULT NULL,
  `toivoniemi_internet_facility` int(1) unsigned DEFAULT NULL,
  `toivoniemi_no_information` int(1) unsigned DEFAULT NULL,
  `time_taken` int(11) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_STUDENT_HOUSING_USERS_USER_ID` (`fk_user_id`),
  CONSTRAINT `FK_STUDENT_HOUSING_USERS_USER_ID` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the deliverables for the student housing task.';

-- Dumping data for table crowdflow.student_housing_deliverables: ~0 rows (approximately)
/*!40000 ALTER TABLE `student_housing_deliverables` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_housing_deliverables` ENABLE KEYS */;


-- Dumping structure for table crowdflow.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(32) NOT NULL,
  `task_description` text,
  `fk_task_category_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(200) NOT NULL,
  `def_reward` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TASKS_CATEGORY_CATEGORY_ID` (`fk_task_category_id`),
  CONSTRAINT `FK_TASKS_CATEGORY_CATEGORY_ID` FOREIGN KEY (`fk_task_category_id`) REFERENCES `task_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table crowdflow.tasks: ~11 rows (approximately)
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id`, `task_name`, `task_description`, `fk_task_category_id`, `screen_name`, `def_reward`, `created_at`, `updated_at`) VALUES
	(3, 'survey', 'This is a survey', 3, 'Online Survey', 10, '0000-00-00 00:00:00', '2015-09-09 14:52:19'),
	(4, 'survey2', 'This is another survey', 3, 'Online survey 2', 10, '0000-00-00 00:00:00', '2015-09-09 14:52:19'),
	(5, 'Visual Analysis', 'Answer which building is closer to you', 3, 'Visual Analysis', 10, '0000-00-00 00:00:00', '2015-09-12 08:38:27'),
	(6, 'Sentiment Analysis', 'Categorize the sentence as positive, neutral or negative', 3, 'Sentiment Analysis', 10, '0000-00-00 00:00:00', '2015-09-12 08:40:14'),
	(8, 'Image Identification', 'Translate the following Object in the image into Finnish', 1, 'Image Identification', 10, '0000-00-00 00:00:00', '2015-09-12 08:43:36'),
	(9, 'Place a New Tag', 'Your Task is to place the printed tag to the location that has been described below', 2, 'Place a New Tag', 0, '0000-00-00 00:00:00', '2015-09-21 19:11:16'),
	(10, 'Describe the place', 'Please visit the following location and describe it by answering simple questions', 2, 'Describe the Place', 0, '0000-00-00 00:00:00', '2015-10-18 16:19:26'),
	(11, 'Word Translation', 'Translate the Following into Finnish', 3, 'Word Translation', 10, '2016-06-26 17:05:31', '2016-06-26 17:05:32'),
	(12, 'Word Relevance', 'Please select a relevant word for the following sentence', 3, 'Word/Task Relevance', 10, '0000-00-00 00:00:00', '2016-07-07 22:28:48'),
	(13, 'Hobbies in Oulu', 'Can you do the following hobby in Oulu. If yes give more information on it (when, where, how, etc.)', 1, 'Hobbies in Oulu', 10, '2016-07-12 07:52:11', '2016-07-12 07:52:12'),
	(14, 'Student Housing', 'Please rate the Student Housing Areas for University Students', 1, 'Student Housing', 10, '2016-08-10 19:57:13', '2016-08-10 19:57:14');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;


-- Dumping structure for table crowdflow.task_categories
CREATE TABLE IF NOT EXISTS `task_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='This table contains the categories of the tasks.\r\n1. Situated\r\n2. Location based\r\n3. Anywhere';

-- Dumping data for table crowdflow.task_categories: ~3 rows (approximately)
/*!40000 ALTER TABLE `task_categories` DISABLE KEYS */;
INSERT INTO `task_categories` (`id`, `name`, `description`) VALUES
	(1, 'Situated', 'Task that you perform close around the tag.'),
	(2, 'Located', 'Tasks in which you have to move to specific location.\r\n'),
	(3, 'Anywhere', 'Tasks that you can perform anywhere irrespective of the location.');
/*!40000 ALTER TABLE `task_categories` ENABLE KEYS */;


-- Dumping structure for table crowdflow.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(12) NOT NULL,
  `password` char(32) NOT NULL,
  `balance` int(11) unsigned NOT NULL DEFAULT '0',
  `enabled` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;

-- Dumping data for table crowdflow.users: ~205 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `balance`, `enabled`) VALUES
	(4, 'valtteri', 'cdafb8a3654d98cb96f82f0319fc237e', 370, 1),
	(5, 'QinNai', 'dc7e1ce437a92d654d72797f797eea9d', 462, 1),
	(6, 'fulidi', 'c3c41c86d8df0bdd209722de0a12bd9a', 76, 1),
	(7, 'elsebai', '1f04d0e45a1681d6309a235d53bde368', 860, 1),
	(8, 'niohuka', 'a50eb22f91342f12ac1bde8af85b4d5a', 624, 1),
	(9, 'anrytila', '97f59282e395ae5feda5167a4589a79e', 20, 1),
	(10, 'jodi', 'f35457a69babe5f1340a86cd415fc0fc', 440, 1),
	(11, 'silentron', '528c5dcf9d5fc2974fc10f3cb9c12735', 635, 1),
	(12, 'partane', '7207560e6b35c7869c61a3a9b7184e16', 910, 1),
	(13, 'mmonney', '3e118659c5bdd677748cbe9d0a59fa72', 468, 1),
	(14, 'Pirttirieska', '3fa011829094ab0a680bcd9c9e58951e', 110, 1),
	(15, 'seunlaiyemo', 'c8d3a3cd16ccbbe11c90585dec8bfa0d', 150, 1),
	(16, 'Skwrl', 'a314cd218c006279d09e0e3070d4f036', 3879, 1),
	(17, 'Hanna', '9e30ad7ad86beee3febe767de39c96aa', 145, 1),
	(18, 'furqan', 'df4358b3b8209d8123ac6384d02ef8d0', 470, 1),
	(19, 'gfunho', '004893474ed1a678ab022bcb22bc6bea', 330, 1),
	(20, 'henou', '21becc92e0b90093c36d65cbfbd2bdeb', 1615, 1),
	(21, 'cunccu', 'cfdf3e35e65a687a460d3083d169cb4f', 438, 1),
	(22, 'flow', '182ae4795fd5a53efb928bad0653f8ac', 1635, 1),
	(23, 'okuuva', 'ae5c4118781c8d9b80bfe82d782b69ed', 100, 1),
	(24, 'axordahaxor', 'b73bfb9a73e0971c4363753a12fc05be', 1580, 1),
	(25, 'jiggly', 'baaa968912dda63ff2cb11692505ce33', 150, 1),
	(26, 'uzairkhan', 'c73a1708dcd50fd13e456989a529a35a', 120, 1),
	(27, 'jupikkar', 'd4bb4c52453e0f098e438c404c17c1fc', 695, 1),
	(28, 'SonHurja\n', 'feef9d123c5f493155fcada7f1adcc66', 790, 1),
	(29, 'Everkistus', '7fcf4ed0b0c41dfe5ee4aa648e1c4587', 440, 1),
	(30, 'kyosti', 'fd69f000cf0d7db5c2e77207e28732bd', 1080, 1),
	(31, 'hane', 'aa413f503d5a7114ea05e2446c0969d7', 1165, 1),
	(32, 'veikkojuhani', '547979f9f279da15d0f11c31de940792', 1480, 1),
	(33, 'Tidal', '4cfdb2fea3d241828a5eee4102f54f95', 755, 1),
	(34, 'mspBZ', 'f8aa46fe289cdb11965a760d29e50f08', 130, 1),
	(35, 'phail3d', 'e27e4ac389d9a392948d87d4c759346c', 135, 1),
	(36, 'uitoulu', '64334670c959e845d28b9f6467afda42', 260, 1),
	(38, 'ninar', 'b96133e44285f3c8c1c1624cb292153b', 110, 1),
	(39, 'perkele', '44f7da2bf4388c24faf5a6e197639689', 345, 1),
	(40, 'lorency', '2bea7d8f059346dcc1dc6bb78bb0d548', 500, 1),
	(41, 'albuss', '62cb2f5c57b46308a5a28e7fd29fff67', 160, 1),
	(42, 'mareliini', 'f4df54a5881870a4c2b3e7470d276115', 1108, 1),
	(43, 'metiliel', '820dbdbffa27e1b1492e0f70ed695437', 1035, 1),
	(44, 'pekkepee', '56765b03b9a978e268ac6acaf68c6940', 120, 1),
	(45, 'tuuri', 'c42439136bb76e11f5cf209f9bb0eac5', 0, 1),
	(46, 'minntaur', '29899f6d521b9eb53eeaa7cedf020ba7', 1870, 1),
	(47, 'chadez', '93910d1ba37bd48974bd7195bf6b5c90', 945, 1),
	(48, 'V1N3', '33da687f0cfd5e02abb89206c0e5f69b', 1675, 1),
	(49, 'miika', 'b82386ff3201f72f81585e0c82dab764', 262, 1),
	(50, 'esah', 'e04151da48b7fcf37699294f0c4a33d9', 130, 1),
	(51, 'sami', '8b162e48af7bb8592be8eaf9fd6e220e', 160, 1),
	(52, 'yadjei', 'aadb5ec614cccdcdbc0aafca7d97a673', 290, 1),
	(53, 'anokie', '6474a3456947f8603ccf1b53e6a41874', 1240, 1),
	(54, 'Henriette', 'fee1c36c5ecb98bd28d16a687a831544', 120, 1),
	(55, 'vpukari', 'b520224301292b8df659ab9809f1a339', 275, 1),
	(56, 'bennj09', '917b0df268e9d29f14308d2b072a6baa', 130, 1),
	(57, 'ardiana', 'deee1f8ad257954c3cd9efc1599c8033', 110, 1),
	(58, 'iremmella', 'efc7bf3f03c12ed932a7d34778814bed', 195, 1),
	(59, 'saseppal', '83077c6d225d1e222e4e7b1bb9526197', 498, 1),
	(60, 'pehmeajanis', '894e12d865c853a5e70790b902aecbf6', 825, 1),
	(61, 'luru92', 'bfa20715cd2c1afdae9c2de518da5a7e', 120, 1),
	(62, 'annis', 'efc74cd94b004d2660e247cc4b9b9c9a', 1415, 1),
	(63, 'lasses', 'a8486a2aaf7b9537a09937669a328f73', 260, 1),
	(64, 'oliver', 'e4b4ad4c687be8faa9367e627e3e45bc', 650, 1),
	(67, 'pitegelb', 'd7af329c5d8cfeb5f91770383b623d70', 130, 1),
	(68, 'Kerle', 'c9835c0cc023c82092310645a2504856', 1150, 1),
	(69, 'hontto1', 'bf47689daec7a806b9d1ebc94434455b', 380, 1),
	(70, 'victor', '999d39762818b158458208efc14480b0', 250, 1),
	(71, 'ojssd', '3509d9ceebec2d87314cac6e8d15d6ac', 120, 1),
	(72, 'Lutrine', 'c571eab2443810ba26e99bd7d41c610f', 230, 1),
	(73, 'laventeli', 'a5047e6fe63f0fa84c64fed008cd2cde', 310, 1),
	(75, 'lollero45', '528853a21aeec55af107ca88a4389db5', 100, 1),
	(76, 'shl1397917\n', '0cdd16a13b93a2679aeed10cb8fee660', 100, 1),
	(77, 'julli', '7a5f0c1cfc3cb586044291802e9cc2f1', 130, 1),
	(78, 'anykanen', 'f851aeb4af046d0a856507f2d21457b2', 810, 1),
	(79, 'soraFIN', 'bbef41fc961dd6db8ed47b4656241d75', 590, 1),
	(80, 'markcopher', 'b5ed63b45e5df2f9094968312cec82f9', 555, 1),
	(82, 'petteri', '0add586ab18254b8da783e04b73ec1d8', 600, 1),
	(83, 'waqar', '9f63c913deb21d78eeea16368d904c70', 1435, 1),
	(85, 'aleksi', 'f780c72d38656355b9dad682b8a94bc1', 600, 1),
	(88, 'Soikkeli', '54a1212ae3d6a9d09d24ed86f833e2bb', 450, 1),
	(91, 'jeppis', '58eb4c7050689b90fdfab06e16157611', 260, 1),
	(94, 'rabbeli', '1bd7d23360cfe3feaa33dafd27249c28', 130, 1),
	(96, 'moneymaker', '3a8c1dacacb96c2a2b0442105925dc22', 120, 1),
	(98, 'asdfg', '17d6c454939f70f342cb33be99c7e986', 140, 1),
	(99, 'nikkeli', '8b2d1eac2a8c8a85da40e1980c4f72cb', 100, 1),
	(100, 'vesafani', '28fbc3039080b73fecb21b2d1a9b74ba', 130, 1),
	(101, 'Jussi', '5d4fc120b6932e070cc1f00cf3804f31', 665, 1),
	(102, 'Honya', '388d55f3cb0c26a1182e2eb9458de70d', 445, 1),
	(103, 'nuua', '861cb6a6db7e2978f5c1ceb91b86662e', 210, 1),
	(104, 'Noctu', '01fb3e60aff5102563ed090ed0f296bb', 2685, 1),
	(105, 'bereket', '73f4cb2d135f10c2b425ebaace038ad0', 130, 1),
	(106, 'duthoron', '6a58aa8d9750b50b70d5bc720ed0fd47', 245, 1),
	(107, 'ainstain', '84b6b2ecd5adc8eff202c64e213de0bb', 610, 1),
	(108, 'vaari', '967bd8316124a99d6b88cac7e8297b21', 0, 1),
	(109, 'mirka', 'c3f877af861c7d7ed47e4e58211af69c', 840, 1),
	(110, 'someone', '347eb2471dfd3d339163f2cdab1961b6', 130, 1),
	(111, 'sampooko', '53ddf787c77b6c2943fa598b27e210ae', 510, 1),
	(112, 'jarpiili', '1b7f75fcd8816e358db7b9fdc76e5393', 171, 1),
	(113, 'nashpred', '9ed6fcc67255ae4583346b081350f60d', 2145, 1),
	(114, 'tttt', 'd7a3771c7dabe12554e0bcd62135c153', 100, 1),
	(115, 'hrtavakoli', 'b88718183065d968f5c5e29a0a456c89', 120, 1),
	(116, 'epeli', 'fdd552f37addc10b291f64462d52fae6', 110, 1),
	(117, 'katti', 'ac82d4ce79597b29b3d0470c5308f242', 700, 1),
	(118, 'Shafer', 'b0d4319942e634d1e390d137845226b8', 140, 1),
	(119, 'jouni', 'ec0e9fb03bd1f4ea9cdc95bb041cad69', 0, 1),
	(120, '360degrees', 'a2b427e1c214cf3d4bb45a1d1a5e8a53', 870, 1),
	(121, 'tatami', '8358a3d39fb0c9fb8fe813a67a62f20b', 247, 1),
	(122, 'suvi', '467a2204b9be51d69f67e120e3f87d19', 870, 1),
	(123, 'lazze', '7750392ef974c5ebba5de0311972fd7e', 1448, 1),
	(124, 'oronka', 'ac1a9f993895414b8ab55343c62c2119', 680, 1),
	(125, 'dylan88', '08e046fcc8e458f1b89d2e277ebd6010', 65, 1),
	(126, 'tmuk', 'e776b1267775524d48adb55e32ff66dc', 115, 1),
	(127, 'osmohyov', '5ea6dc2916cbcbf86ff7868c7c65db72', 250, 1),
	(128, 'narvi', 'aa34e9d61b40031845fd208109e130ca', 240, 1),
	(129, 'pirttikp', 'd33722c575050102dcc096422e750e4b', 344, 1),
	(130, 'procyon', '8d0d589977622ddfd59d04e9bb19f6e6', 125, 1),
	(131, 'ghjk', '5e28111447cfb426dd9980f32d6198a2', 160, 1),
	(132, 'pauli', '89a4281f362711d872f18f501c200653', 525, 1),
	(133, 'jani', 'd2ef7872a97dfa32a048da960b5c03a5', 549, 1),
	(134, 'kukisti', '63a7d876a56b7227950be2a0658d1958', 200, 1),
	(135, 'Burger', '64b839229a29e6bd0f6e45ab60784b5a', 900, 1),
	(136, 'vilmuri91', '181e866b376e1ddc373a5a6de4a18ebd', 200, 1),
	(137, 'i7gigjy', 'a53b2aedbaccf8d8618d96857a451265', 238, 1),
	(138, 'aewyatt', 'd0704b640f5abe1040b6ecd419f846b6', 2170, 1),
	(139, 'Haseeb', 'e0e7dcb2ad9874afd6ee0ae3bbcd0127', 550, 1),
	(140, 'ldsilva', '39f44f7c1694d21af0a23dacb3d90731', 825, 1),
	(141, 'laardi', '003f4f4f97aa71540560a6bbbdabfafb', 100, 1),
	(142, 'albertti', 'dce28eacf78857c6948f7c0c613b0abc', 220, 1),
	(143, 'lndrntm', '0d5ed06a347f2383d6d91bbe3cd6624f', 640, 1),
	(144, 'arna1cb', '2f6a0a346c85296535b972adeb2da061', 0, 1),
	(145, 'masterod', '8cb287451fc7accc918ee5f96be8fcb9', 331, 1),
	(146, 'kaiWang', '6ab856f8e380b82d0742b1f628bf2425', 110, 1),
	(147, 'ttttt', 'eb966ee4d6c0080ff64f14cf36c973ab', 100, 1),
	(148, 'JoKa', '1268dcc17430ae1b29a46027a2ca3795', 110, 1),
	(149, 'daminho', '67632f355b7d7322303b8d7a7e2610db', 330, 1),
	(150, 'ertuu', '22e2f5102de0ec45ebfb75baf865367e', 460, 1),
	(151, 'mike', '3c0ae99260d919fbdab9f2c43f8f4b1e', 390, 1),
	(152, 'hurdur', '6be7154ee2010e50b00f12b2471d81af', 0, 1),
	(153, 'visard', '21bc39ae936a2ccbd0bfc2526f9f8585', 0, 1),
	(154, 'tatti', '76e0caac46851612e7a91e2526ddb27f', 100, 1),
	(155, 'kshafqat', '61a466430783df51f9ccc06851830abe', 130, 1),
	(156, 'referrer', '88e4a6b3620444599144f20ea9aab402', 1520, 1),
	(157, 'biba', '4aaa2d277e1294f5cabe34759f785011', 184, 1),
	(158, 'mkaivoso', 'cd0e0a3f9fbec5841c6701c99b203023', 924, 1),
	(159, 'MariKari', 'a3e571b5a76a3763da481aad20afb359', 6065, 1),
	(160, 'jumaoj', '5dc5075ae1f196b46f3035e78cf53bae', 799, 1),
	(161, 'luke', 'ed5948748cb550ddeccb62dacf02705e', 850, 1),
	(162, 'vaiski', '7595541e150b7f896d8eb37e3ee0ba12', 0, 1),
	(163, 'almq', '3604e53959a5db8d75d42036513f792f', 260, 1),
	(164, 'gyygeli', 'af171e2629eae3e8f9fe4de182ffca03', 778, 1),
	(165, 'valerie', '07f51910c398ec8e3572899b4e440f56', 404, 1),
	(166, 'Cloud', '195efee66193cd54dab84854f99b0471', 48, 1),
	(167, 'sabidussi', '53c2fc7667aedf0e753dd41d51ab338b', 250, 1),
	(168, 'mkhalid', '738fea151c3f46d7ef451ff626fba74f', 145, 1),
	(169, 'tpaoi', '357a2715b18845e3ab72b50a040f8593', 0, 1),
	(170, 'derp', 'f7e8bcd068a7b237079bcddfa712791a', 0, 1),
	(171, 'guidoz', '434e7d36cd951740c22a9cadcc304232', 0, 1),
	(172, 'julen', 'b4027efcc5d3c899e7dc98fae2222ae2', 1550, 1),
	(173, 'gggg', '2d85cda39f1790a0d0180f3f8d2f3cba', 100, 1),
	(174, 'manailija', 'eeca6d66e3797371104e1c0950ea6269', 0, 1),
	(175, 'allhu', '57785b186d82d9b157036ff097e2bc37', 335, 1),
	(176, 'pegs', 'b51fdc680eb3e0fe9111d7ff1b477c55', 97, 1),
	(177, 'hmarin', '09f5755101da0daabb66f804d9f15620', 1285, 1),
	(178, 'ouspg', 'b2db2368607ed002a28ddd96b26a0504', 100, 1),
	(179, 'nallepuh', '029b26c4aee971a852822c077cc1684c', 425, 1),
	(180, 'moravain', 'cf2d7dac49ddc52baaa19beeae72b806', 86, 1),
	(181, 'joms', '07e5e163f17bbad54e9c02f27a1d5e06', 495, 1),
	(182, 'ksingh', 'fc937c9b0465ea1d5677ff260c7a237a', 200, 1),
	(183, 'lemmes', '5106b1cc9c23860f3104f5d47c17aea7', 105, 1),
	(184, 'rafaeluab', '5c1b692b77b86076c7c4fe5678d527ac', 551, 1),
	(185, 'aggelosf', '740d895961144cadba3e8788c2ccc1e5', 100, 1),
	(186, 'napiton', 'aa9676e1dd1225cce9a6e2fca0e725b1', 818, 1),
	(187, 'irtiza', '2376154163e114a39f4dbbf4d4da62fd', 145, 1),
	(188, 'katona', 'c8307b28c8e185f5494c2b1b76c8fb1f', 230, 1),
	(189, 'puuro', '4a8da295f08f4767a94d3a528b4360ea', 125, 1),
	(190, 'abc123', '3a559f1f6dc4ad5bb6765e8c162f9d46', 140, 1),
	(191, 'kala', 'd6cf258cb0db4becdc0ceee4d7eb6cb0', 764, 1),
	(192, 'jennyn', '5c625498315f37a52ad607b6692451a1', 1075, 1),
	(193, 'qqqq', '17d40838e03177bea1e3d78e232f1fb6', 128, 1),
	(194, 'tohtonen', '1e50d33a15f5140140abd494200a2864', 175, 1),
	(195, 'Haukka', 'bc15a08aaf027ed02a78be14b0c759e2', 100, 1),
	(196, 'pessi69', 'ff8b87167325e99d75395b2c167fd505', 540, 1),
	(197, 'kinuski', 'ee8532b16b377a73eef01d564048b82d', 34, 1),
	(198, 'hildurbia', '7d78e64af4f08371d4d385b0b241b40b', 325, 1),
	(199, 'aleksisi', '948f2d5e09a4c10cba0bbd13dacf37b5', 205, 1),
	(200, 'heleijaa', '9d4f8dbfedd7592bdb7541dd6c948a41', 0, 1),
	(201, 'perttu', '55b722e9532f530bf1697660903af667', 600, 1),
	(202, 'Tyndlerin', '423c64941f9509945485155f9361db29', 385, 1),
	(203, 'aaaa', '86951bf8ff66de7b607ec87fb01482ef', 280, 1),
	(204, 'henchoz', '8ddef05d82afe841ea0f6a18b1c3be9b', 100, 1),
	(205, 'jarikari', 'f24d9dd5a92f36059335ed1f08d46ba9', 0, 1),
	(206, 'gonner', '2ff662cb10d6aa2e8408389921bef902', 145, 1),
	(207, 'haichutxiu', 'df2fba4b1e936fc04d1c9fdf49a6a7af', 210, 1),
	(208, 'juuja', 'a1581e54f9a1153c920f0380c535f1c5', 71, 1),
	(209, 'olppa', '7f08d520afdf65f0696be33df86e4925', 190, 1),
	(210, 'iran88', '3e2163fa16b7228af523323327ab76cc', 435, 1),
	(211, 'msanka', '4e5dc28ade7fe1a812f6f29690b3fcce', 235, 1),
	(212, 'admin', 'a2053546fc4f48bedbcbe36ad05c73fa', 400, 1),
	(213, 'demo', 'ac80f534698f42de13d33b588a851690', 100, 1),
	(215, 'test2', 'd9af0bd0f01053e31771c646798724ec', 100, 1),
	(216, 'test3', '6f4030b803814506ace568b88642b300', 100, 1),
	(217, 'skidi', '70708f536e76526189acaab421e1bd63', 100, 1),
	(218, 'testing', 'testacc', 0, 1),
	(220, 'testing1', 'testacc', 0, 1),
	(222, 'testacc', '33c0fc48dfec3ddae7e3398e30e89a61', 0, 1),
	(223, 'blablabla', '1a36591bceec49c832079e270d7e8b73', 0, 1),
	(224, 'furqan-ahmed', '1a36591bceec49c832079e270d7e8b73', 0, 1),
	(225, 'furqan_ahmed', 'df4358b3b8209d8123ac6384d02ef8d0', 0, 1),
	(226, 'etfgs', 'df4358b3b8209d8123ac6384d02ef8d0', 0, 1),
	(227, 'furqan09090', '9aa647b6a197360c7eb419e65688a939', 0, 1),
	(228, 'faizanahmed', 'e10adc3949ba59abbe56e057f20f883e', 0, 1),
	(229, 'fffff', '71f396e4134a1160d90bb1439876df31', 0, 1),
	(230, 'rrrrrrr', 'dab5b23703d114558022b4b4c995379b', 0, 1),
	(231, 'rfrfrf', '2673513952dabe341914f239ce1665d1', 0, 1),
	(232, 'Qwerty', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, 1),
	(233, 'furqan1234', 'dea11674eb3fc8dd363c095198663cdb', 0, 1),
	(234, 'yyyyy', '94e7d712742adbbb7a73a1d52a7cc1a9', 0, 1),
	(235, 'qqqqqq', '343b1c4a3ea721b2d640fc8700db0f36', 0, 1),
	(236, 'wwwwww', 'd785c99d298a4e9e6e13fe99e602ef42', 0, 1),
	(237, 'eeeeee', 'cd87cd5ef753a06ee79fc75dc7cfe66c', 0, 1),
	(238, 'tttttt', 'bcc720f2981d1a68dbd66ffd67560c37', 0, 1),
	(239, 'yyyyyy', '94e7d712742adbbb7a73a1d52a7cc1a9', 0, 1),
	(240, 'uuuuuu', '8de1ebe5220196d6acdb486f346fe162', 0, 1),
	(241, 'Jorge', 'd67326a22642a324aa1b0745f2f17abb', 10, 1),
	(242, 'Test', '098f6bcd4621d373cade4e832627b4f6', 30, 1),
	(243, 'Mmm', 'c4efd5020cb49b9d3257ffa0fbccc0ae', 0, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table crowdflow.user_tasks
CREATE TABLE IF NOT EXISTS `user_tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk_task_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fk_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `submitted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk_status_id` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_USER_TASKS_TASKS` (`fk_task_id`),
  KEY `FK_USER_TASKS_USERS` (`fk_user_id`),
  KEY `FK_USER_TASKS_STATUSES` (`fk_status_id`),
  CONSTRAINT `FK_USER_TASKS_STATUSES` FOREIGN KEY (`fk_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `FK_USER_TASKS_TASKS` FOREIGN KEY (`fk_task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `FK_USER_TASKS_USERS` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='This table contains the tasks that user have completed and either in pending, rejected and approved status';

-- Dumping data for table crowdflow.user_tasks: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_tasks` DISABLE KEYS */;
INSERT INTO `user_tasks` (`id`, `fk_task_id`, `fk_user_id`, `submitted_at`, `fk_status_id`) VALUES
	(1, 3, 18, '2015-07-05 11:36:36', 2),
	(2, 4, 18, '2015-07-05 11:36:36', 2);
/*!40000 ALTER TABLE `user_tasks` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
