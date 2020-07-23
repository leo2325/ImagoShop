-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 06 juil. 2020 à 12:21
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `shopimago`
--

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) NOT NULL,
  `TotalAmount` double DEFAULT NULL,
  `TaxRate` float DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `CreationTimestamp` datetime NOT NULL,
  `CompleteTimestamp` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `QuantityOrdered` int(3) NOT NULL,
  `Meal_Id` int(11) NOT NULL,
  `Order_Id` int(11) NOT NULL,
  `PriceEach` double NOT NULL,
  `Size_Id` int(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tee`
--

DROP TABLE IF EXISTS `tee`;
CREATE TABLE IF NOT EXISTS `tee` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Photo` varchar(30) NOT NULL,
  `Color` varchar(11) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `QuantityInStock` tinyint(4) NOT NULL,
  `BuyPrice` double NOT NULL,
  `SalePrice` double NOT NULL,
  `Size` varchar(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tee`
--

INSERT INTO `tee` (`Id`, `Name`, `Photo`, `Color`, `Description`, `QuantityInStock`, `BuyPrice`, `SalePrice`, `Size`) VALUES
(1, 'Barrington Levy Tee', 'barri.png', 'Noir', 'Impression graphique\r\ncol rond - 100% coton - \r\nLimités à 100 exemplaires.', 100, 6, 36, ''),
(2, 'Triangle Tee', 'triangle.png', 'Noir', 'Impression graphique\r\ncol rond - 100% coton - \r\nLimités à 80 exemplaires.', 80, 6, 36, ''),
(3, 'City Tee', 'city.png', 'Blanc', 'Impression graphique\r\ncol rond - 100% coton - \r\nLimités à 80 exemplaires.', 80, 6, 36, ''),
(4, 'Couple Tee', 'couple.png', 'Noir', 'Impression graphique\r\ncol rond - 100% coton - \r\nLimités à 100 exemplaires.', 100, 6, 36, ''),
(5, 'Pin Up Tee', 'pinup.png', 'Bleu clair', 'Impression graphique\r\ncol rond - 100% coton - \r\nLimités à 100 exemplaires.', 100, 6, 36, ''),
(6, 'Boxing Tee', 'boxe.png', 'Noir', 'Impression graphique Kery James -\r\ncol rond - 100% coton - \r\nLimités à 100 exemplaires.', 100, 6, 36, ''),
(7, 'Training Tee', 'training.png', 'Blanc', 'Impression graphique Kery James -\r\ncol rond - 100% coton\r\nLimités à 100 exemplaires.', 100, 6, 36, ''),
(8, 'Pharaoh Tee', 'pharaoh.png', 'Noir', 'Impression graphique Snoop Dogg -\r\ncol rond - 100% coton - \r\nLimités à 100 exemplaires.', 100, 6, 36, ''),
(9, 'Smoke Tee', 'smoke.png', 'BleuVert', 'Impression graphique Snoop Dogg\r\ncol rond - 100% coton - \r\nLimités à 100 exemplaires.', 100, 6, 36, '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(80) NOT NULL,
  `lastName` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(120) NOT NULL,
  `creationTimestamp` datetime DEFAULT NULL,
  `lastConnexion` datetime DEFAULT NULL,
  `address` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL,
  `zipCode` varchar(5) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `firstName`, `lastName`, `email`, `password`, `creationTimestamp`, `lastConnexion`, `address`, `city`, `zipCode`, `role`) VALUES
(5, 'Leo', 'timbert', 'cast.leotimbert@gmail.com', '$2y$11$a459c85216455cf0b9409uw9IJpwhVEWurULGCb/nsHNboF81crvu', '2020-05-12 13:20:30', NULL, '3 RUE GEORGES BAUDELAIRE', 'Orly', '94310', 'admin'),
(6, 'bob', 'sinclar', 'boby@email.com', '$2y$11$773c660e8060c4750eb24u7ZwAtWPr4nmkQLuPq1tzsUZO5dKWSqq', '2020-05-12 13:21:55', NULL, '11 rue everybody', 'paris', '75011', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
