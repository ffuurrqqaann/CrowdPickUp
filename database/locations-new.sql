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


-- Dumping structure for table crowdflow.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `image` text,
  `latitude` decimal(11,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `postal_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='This table contains the location information for the "Place a new tag" task.';

-- Dumping data for table crowdflow.locations: ~4 rows (approximately)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `name`, `address`, `description`, `image`, `latitude`, `longitude`, `postal_code`) VALUES
	(8, 'University Of Oulu', 'Paavo Havaksen tie 5, 90570 Oulu, Finland', 'The Tag is in Stories Cafeteria just in the entrance of the R Gate Of University Of Oulu Linnanma Campus.', 'images/located/uol.jpg', 65.05801730, 25.46738140, '90570'),
	(10, 'Tokmanni, Linnanmaa', 'Sammonkatu 5, 90570 Oulu', 'Tokmanni super market in Linnanmaa', 'images/located/tokmanni.jpg', 65.05876800, 25.47760700, '90570'),
	(11, 'Toripakka Bus Station, City Center', 'Torikatu 12, 90100 Oulu, Finland', 'Toripakka Stop at the City Center', 'images/located/toripakka.jpg', 65.01347100, 25.46978500, '90100'),
	(12, 'Toripoliisi, City Center', 'Rantakatu 6, 90100 Oulu, Finland', 'Police Statue in market place near City Center', 'images/located/toripoliisi.jpg', 65.01335700, 25.46560200, '90100'),
	(13, 'Prisma, Raksila', 'Tehtaankatu 3, 90130 Oulu', 'Prisma Super Market in Raksila', 'images/located/prisma.jpg', 65.01045200, 25.49055800, '90130'),
	(14, 'Idea Park', 'Ritaharjuntie 49, 90540 Oulu', 'Idea Park, Oulu', 'images/located/ideapark.jpg', 65.07705900, 25.44609200, '90540'),
	(15, 'Tuiran uimaranta', 'Tuiran uimaranta, 90500 Oulu', 'Tuira Beach, Oulu', 'images/located/tuira.jpg', 65.02268600, 25.48864400, '90500'),
	(16, 'Stockmann', 'Kirkkokatu 14, 90100 Oulu', 'Stockmann in the City Center', 'images/located/stockmann.jpg', 65.01157500, 25.46907900, '90100'),
	(17, 'Valkea', 'Isokatu 25, 90100 Oulu', 'Valkea in the City Center', 'images/located/valkea.jpg', 65.01136300, 25.47250900, '90100'),
	(18, 'University Of Applied Sciences', 'Kiviharjunlenkki 1, 90220 Oulu', 'Univeristy Of Applied Sciences', 'images/located/uoas.jpg', 65.01003400, 25.51004300, '90220');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
