/*
Navicat MySQL Data Transfer

Source Server         : thismysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : policeshootings

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2014-12-18 16:04:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rawofficers
-- ----------------------------
DROP TABLE IF EXISTS `rawofficers`;
CREATE TABLE `rawofficers` (
  `Timestamp` varchar(255) DEFAULT NULL,
  `Incident ID` varchar(255) DEFAULT NULL,
  `Officer last name` varchar(255) DEFAULT NULL,
  `First name` varchar(255) DEFAULT NULL,
  `Middle name or initial` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Ethnicity` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `FDLE ID number` varchar(255) DEFAULT NULL,
  `Agency` varchar(255) DEFAULT NULL,
  `Agency ID number` varchar(255) DEFAULT NULL,
  `Officer's assignment` varchar(255) DEFAULT NULL,
  `PBSO District` varchar(255) DEFAULT NULL,
  `Number of shots fired by officer` varchar(255) DEFAULT NULL,
  `Officer weapon` varchar(255) DEFAULT NULL,
  `Officer injuries?` varchar(255) DEFAULT NULL,
  `Did officer die?` varchar(255) DEFAULT NULL,
  `Discipline?` varchar(255) DEFAULT NULL,
  `Rank` varchar(255) DEFAULT NULL,
  `Off-duty?` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
