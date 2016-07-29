-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.9


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema festivaldatabase2
--

CREATE DATABASE IF NOT EXISTS festivaldatabase2;
USE festivaldatabase2;

--
-- Definition of table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(40) NOT NULL,
  `places` varchar(40) NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `eventtype` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`eventid`,`name`,`description`,`places`,`duration`,`eventtype`) VALUES 
 (1002,'NCCL Semi Finals','North Division Cricket Match','New Codington Stadium','1800-2200','Sporting Event'),
 (1003,'Fireworks Show','Spectacular Display at River','New Codington River Walk','1900-2000','Attraction'),
 (1004,'Garden Tour','Tour the Beautiful Rose Garden','Rose Garden','1000-1400','Tour'),
 (1005,'NCCL Championship','North vs. South Cricket Match','New Codington Stadium','1800-2200','Sporting Event'),
 (1006,'Pavlova  - All World Tour','Pavlova in Concert','New Codington Music Hall','1930-2130','Concert'),
 (1007,'ppp','pp','pp','6000','pp'),
 (1008,'ppp','pp','pp','6000','pp'),
 (1009,'ppp','pp','pp','6000','pp'),
 (1010,'kk','kk','kk','kk','kk'),
 (1011,'kk','kk','kk','kk','kk'),
 (1012,'ii','ii','ii','ii','ii'),
 (1013,'ll','ll','ll','ll','ll'),
 (1014,'dd','dd','dd','dd','dd'),
 (1015,'jj','jj','jj','jj','jj'),
 (1016,'ss','ss','ss','99','ss');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


--
-- Definition of table `eventcoordinator`
--

DROP TABLE IF EXISTS `eventcoordinator`;
CREATE TABLE `eventcoordinator` (
  `eventcoordinatorid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(40) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`eventcoordinatorid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventcoordinator`
--

/*!40000 ALTER TABLE `eventcoordinator` DISABLE KEYS */;
INSERT INTO `eventcoordinator` (`eventcoordinatorid`,`username`,`password`,`firstname`,`lastname`,`email`,`phonenumber`,`place`) VALUES 
 (101,'admin','admin001','admin','admin','admin@gmail.com','9898','P001'),
 (102,'admin2','admin2001','admin2','admin2','admin2@gmail.com','2323','P001'),
 (103,'admin3','admin3001','admin3','admin3','admin3@gmail.com','2323','P002'),
 (104,'admin4','admin4001','admin4','admin4','admin4@gmail.com','2323','P002'),
 (105,'admin5','admin5001','admin5','admin5','admin5@gmail.com','2323','P003'),
 (106,'admin6','admin6001','admin6','admin6','admin6@gmail.com','2323','P004'),
 (107,'admin7','admin7001','admin7','admin7','admin7@gmail.com','2323','P004');
/*!40000 ALTER TABLE `eventcoordinator` ENABLE KEYS */;


--
-- Definition of table `eventsession`
--

DROP TABLE IF EXISTS `eventsession`;
CREATE TABLE `eventsession` (
  `eventsessionid` int(11) NOT NULL AUTO_INCREMENT,
  `eventcoordinatorid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `seatsavailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventsessionid`),
  KEY `eventsession_event` (`eventid`),
  KEY `eventsession_coordinator` (`eventcoordinatorid`),
  CONSTRAINT `eventsession_coordinator` FOREIGN KEY (`eventcoordinatorid`) REFERENCES `eventcoordinator` (`eventcoordinatorid`),
  CONSTRAINT `eventsession_event` FOREIGN KEY (`eventid`) REFERENCES `event` (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=10025 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventsession`
--

/*!40000 ALTER TABLE `eventsession` DISABLE KEYS */;
INSERT INTO `eventsession` (`eventsessionid`,`eventcoordinatorid`,`eventid`,`seatsavailable`) VALUES 
 (10004,104,1002,19),
 (10005,105,1003,397),
 (10006,106,1003,395),
 (10007,103,1013,50),
 (10008,103,1013,49),
 (10009,103,1013,50),
 (10010,103,1013,50),
 (10011,103,1013,50),
 (10012,103,1013,50),
 (10013,101,1014,49),
 (10014,101,1014,50),
 (10015,101,1014,50),
 (10016,101,1014,50),
 (10017,101,1014,50),
 (10018,101,1014,50),
 (10019,101,1015,56),
 (10020,101,1015,50),
 (10021,101,1015,50),
 (10022,101,1015,50),
 (10023,101,1016,49),
 (10024,101,1016,50);
/*!40000 ALTER TABLE `eventsession` ENABLE KEYS */;


--
-- Definition of table `eventsessionsignup`
--

DROP TABLE IF EXISTS `eventsessionsignup`;
CREATE TABLE `eventsessionsignup` (
  `signupid` int(11) NOT NULL AUTO_INCREMENT,
  `visitorid` int(11) NOT NULL,
  `eventsessionid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  PRIMARY KEY (`signupid`),
  KEY `esignup_visitor` (`visitorid`),
  KEY `esignup_esession` (`eventsessionid`),
  KEY `esignup_event` (`eventid`),
  CONSTRAINT `esignup_esession` FOREIGN KEY (`eventsessionid`) REFERENCES `eventsession` (`eventsessionid`),
  CONSTRAINT `esignup_event` FOREIGN KEY (`eventid`) REFERENCES `event` (`eventid`),
  CONSTRAINT `esignup_visitor` FOREIGN KEY (`visitorid`) REFERENCES `visitor` (`visitorid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventsessionsignup`
--

/*!40000 ALTER TABLE `eventsessionsignup` DISABLE KEYS */;
INSERT INTO `eventsessionsignup` (`signupid`,`visitorid`,`eventsessionid`,`eventid`) VALUES 
 (1,1001,10019,1015),
 (3,1006,10013,1014),
 (4,1006,10004,1002),
 (5,1009,10004,1002),
 (6,1009,10005,1003),
 (7,1007,10023,1016);
/*!40000 ALTER TABLE `eventsessionsignup` ENABLE KEYS */;


--
-- Definition of table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `visitorid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(40) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `isadmin` bit(1) NOT NULL DEFAULT b'0',
  `message` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`visitorid`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitor`
--

/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` (`visitorid`,`username`,`password`,`firstname`,`lastname`,`email`,`phonenumber`,`address`,`isadmin`,`message`) VALUES 
 (1001,'bsmith','password','Bob','Smith','bsmith@email.com','748937487',NULL,0x00,''),
 (1002,'npatel','password','Nitin','Patel','npatel@email.com','3392382',NULL,0x00,''),
 (1003,'jjones','password','James','Jones','jjones@email.com','2342343244',NULL,0x00,''),
 (1004,'jfrancois','password','Jacques','Francois','jfrancois@email.com','1234567890',NULL,0x00,''),
 (1005,'rkreiger','password','Robert','Kreiger','rkreiger@email.com','49872938',NULL,0x00,''),
 (1006,'ylee','password','Yi-Hui','Lee','ylee@email.com','21239393',NULL,0x00,''),
 (1007,'admin','admin','F - Admin','L - Admin','admin@email.com','21239393',NULL,0x01,''),
 (1008,'1','1','1','1','1@email.com','0123456789','chneni',0x00,NULL),
 (1009,'lk','lk','lk','lk','122@email.com','0123456789','Bang',0x00,NULL),
 (1010,'1234567890123456789012345678','1234567890123456789012345678','1234567890123456789012345678','1234567890123456789012345678','1234567890123456789012345678@email.com','1234567890123456789012345678','1234567890123456789012345678',0x00,NULL),
 (1011,'kavita','123','kavita','Tanwar','kavi@gmail.com','1234567890',NULL,0x00,NULL),
 (1012,'KavitaRao','123','KavitaRao','Tanwar','kavi@gmail.com','1234567890',NULL,0x00,NULL);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
