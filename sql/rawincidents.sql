/*
Navicat MySQL Data Transfer

Source Server         : thismysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : policeshootings

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2014-12-18 15:33:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rawincidents
-- ----------------------------
DROP TABLE IF EXISTS `rawincidents`;
CREATE TABLE `rawincidents` (
  `Timestamp` varchar(255) DEFAULT NULL,
  `Incident ID` varchar(255) NOT NULL,
  `Police case number` varchar(255) DEFAULT NULL,
  `Summary of incident` text,
  `Date` varchar(255) DEFAULT NULL,
  `Time` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ZIP code` varchar(255) DEFAULT NULL,
  `Injury level` varchar(255) DEFAULT NULL,
  `Manner of death` varchar(255) DEFAULT NULL,
  `Total shots fired by police` varchar(255) DEFAULT NULL,
  `Total shots that hit suspect` varchar(255) DEFAULT NULL,
  `Number of cops who fired` varchar(255) DEFAULT NULL,
  `Number of suspects shot or shot at` varchar(255) DEFAULT NULL,
  `Source of initial contact` varchar(255) DEFAULT NULL,
  `Call type` varchar(255) DEFAULT NULL,
  `Domestic dispute?` varchar(255) DEFAULT NULL,
  `Less-lethal force?` varchar(255) DEFAULT NULL,
  `Suicide by cop?` varchar(255) DEFAULT NULL,
  `Shots fired into vehicle?` varchar(255) DEFAULT NULL,
  `Accidental discharge?` varchar(255) DEFAULT NULL,
  `Foot pursuit?` varchar(255) DEFAULT NULL,
  `Car pursuit?` varchar(255) DEFAULT NULL,
  `Physical struggle?` varchar(255) DEFAULT NULL,
  `Lawsuit filed?` varchar(255) DEFAULT NULL,
  `Discrepancies?` varchar(255) DEFAULT NULL,
  `Model case?` varchar(255) DEFAULT NULL,
  `Notes` text,
  `Review board?` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Other officer(s) injured?` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Incident ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
