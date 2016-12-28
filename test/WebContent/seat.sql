CREATE DATABASE  IF NOT EXISTS `test` 
USE `test`;



CREATE TABLE `seat` (
  `seat_no` int(11) NOT NULL,
  `seat_use` int(11) DEFAULT NULL,
  PRIMARY KEY (`seat_no`)
); 

INSERT INTO `seat` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0);
