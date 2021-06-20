-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 19, 2021 at 04:34 PM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_g`
--

-- --------------------------------------------------------

--
-- Table structure for table `ASSICIER`
--

CREATE TABLE `ASSICIER` (
  `ID_PRODUIT` int NOT NULL,
  `ID_COMMANDE` int NOT NULL,
  `CREATED_AT_` timestamp NULL DEFAULT NULL,
  `UPDATED_AT_` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CARTE`
--

CREATE TABLE `CARTE` (
  `ID_CARTE` int NOT NULL,
  `ID_CLIENT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CATEGORIE`
--


CREATE TABLE `CATEGORIE` ( 
`ID_CATEGORIE` varchar(255) CHARACTER SET utf8 NOT NULL,
 `NOM_TYPE` mediumtext NULL
 )ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT`
--

CREATE TABLE `CLIENT` (
  `ID_CLIENT` int NOT NULL,
  `NOM_CLIENT` mediumtext,
  `PRENOM` mediumtext,
  `EMAIL_CLIENT` mediumtext,
  `PASS_CLIENT` mediumtext,
  `ADRESS_CLIENT` mediumtext,
  `TELE_CLIENT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `COMMANDE`
--

CREATE TABLE `COMMANDE` (
  `ID_COMMANDE` int NOT NULL,
  `ID_CLIENT` int NOT NULL,
  `PRIX_TOTAL` double DEFAULT NULL,
  `DATE_PAIEMENT` date DEFAULT NULL,
  `DATE_LIVRAISON` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CONTIENT`
--

CREATE TABLE `CONTIENT` (
  `ID_CARTE` int NOT NULL,
  `ID_PRODUIT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `PRODUIT`
--

create table `PRODUIT` 
(
   `ID_PRODUIT` int NOT NULL,
   `name`  VARCHAR(255) NOT NULL,
   `type`  VARCHAR(255) NOT NULL,
   `description` VARCHAR(255) null,
   `price` DOUBLE null,
   `upc` VARCHAR(255) null,
   `manufacturer` VARCHAR(255) null,
   `model` VARCHAR(255) null,
   `SHIPPING` DOUBLE null,
   `url` VARCHAR(255) null,
   `image` VARCHAR(255)  null
);


CREATE TABLE `PRODUIT_CATEGORIE` ( `ID_PRODUIT` integer not null, `ID_CATEGORIE` varchar(255) CHARACTER SET utf8 NOT NULL, PRIMARY KEY (`ID_PRODUIT`,`ID_CATEGORIE`) );
-- Indexes for dumped tables
--

--
-- Indexes for table `ASSICIER`
--
ALTER TABLE `ASSICIER`
  ADD PRIMARY KEY (`ID_COMMANDE`,`ID_PRODUIT`),
  ADD KEY `ID_PRODUIT` (`ID_PRODUIT`);

--
-- Indexes for table `CARTE`
--
ALTER TABLE `CARTE`
  ADD PRIMARY KEY (`ID_CARTE`),
  ADD KEY `ID_CLIENT` (`ID_CLIENT`);

--
-- Indexes for table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
  ADD PRIMARY KEY (`ID_CATEGORIE`);

--
-- Indexes for table `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD PRIMARY KEY (`ID_CLIENT`);

--
-- Indexes for table `COMMANDE`
--
ALTER TABLE `COMMANDE`
  ADD PRIMARY KEY (`ID_COMMANDE`),
  ADD KEY `ID_CLIENT` (`ID_CLIENT`);

--
-- Indexes for table `CONTIENT`
--
ALTER TABLE `CONTIENT`
  ADD PRIMARY KEY (`ID_CARTE`,`ID_PRODUIT`),
  ADD KEY `ID_PRODUIT` (`ID_PRODUIT`);

--
-- Indexes for table `PRODUIT`
--
ALTER TABLE `PRODUIT`
  ADD PRIMARY KEY (`ID_PRODUIT`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ASSICIER`
--
ALTER TABLE `ASSICIER`
  ADD CONSTRAINT `ASSICIER_ibfk_1` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `COMMANDE` (`ID_COMMANDE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ASSICIER_ibfk_2` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `PRODUIT` (`ID_PRODUIT`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `CARTE`
--
ALTER TABLE `CARTE`
  ADD CONSTRAINT `CARTE_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `CLIENT` (`ID_CLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `COMMANDE`
--
ALTER TABLE `COMMANDE`
  ADD CONSTRAINT `COMMANDE_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `CLIENT` (`ID_CLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `CONTIENT`
--
ALTER TABLE `CONTIENT`
  ADD CONSTRAINT `CONTIENT_ibfk_1` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `PRODUIT` (`ID_PRODUIT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `CONTIENT_ibfk_2` FOREIGN KEY (`ID_CARTE`) REFERENCES `CARTE` (`ID_CARTE`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `PRODUIT`
--
ALTER TABLE `PRODUIT_CATEGORIE`
  ADD CONSTRAINT `PRODUIT_CATEGORIE_ibfk_1` FOREIGN KEY (`ID_CATEGORIE`) REFERENCES `CATEGORIE` (`ID_CATEGORIE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `PRODUIT_CATEGORIE_ibfk_2` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `PRODUIT` (`ID_PRODUIT`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
