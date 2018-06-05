-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2018 at 04:00 PM
-- Server version: 5.7.22-0ubuntu0.17.10.1
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Hotel_eval`
--

-- --------------------------------------------------------

--
-- Table structure for table `Authentification`
--

CREATE TABLE `Authentification` (
  `id_auth` int(255) NOT NULL,
  `id_client_auth` int(255) NOT NULL,
  `mdp` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE `Categorie` (
  `id_categorie` int(255) NOT NULL,
  `type` enum('matériel','bien-être','repas','spécial') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Chambre`
--

CREATE TABLE `Chambre` (
  `id_chambre` int(255) NOT NULL,
  `nom_chambre` varchar(255) NOT NULL,
  `superficie` decimal(25,0) NOT NULL,
  `etage` int(25) NOT NULL,
  `vue` varchar(25) NOT NULL,
  `accessibilite` tinyint(1) NOT NULL,
  `suite` tinyint(1) NOT NULL,
  `prix_chambre` decimal(25,0) NOT NULL,
  `id_lit_chambre` int(255) NOT NULL,
  `id_sdb_chambre` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `id_client` int(255) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone` int(15) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Etat_reservation`
--

CREATE TABLE `Etat_reservation` (
  `id_etat` int(255) NOT NULL,
  `type` enum('en cours','paiement effectué','annulée') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Facture`
--

CREATE TABLE `Facture` (
  `id_facture` int(255) NOT NULL,
  `id_service_facture` int(255) NOT NULL,
  `quantite_service` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Lits`
--

CREATE TABLE `Lits` (
  `id_lit` int(255) NOT NULL,
  `type` enum('simple','queen size','king size') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Reservations`
--

CREATE TABLE `Reservations` (
  `id_reservation` int(255) NOT NULL,
  `id_client_reserv` int(255) NOT NULL,
  `id_chambre_reserv` int(255) NOT NULL,
  `id_facture_reserv` int(255) NOT NULL,
  `id_etat_reserv` int(255) NOT NULL,
  `date_arrivee` date NOT NULL,
  `date_depart` date NOT NULL,
  `nb_nuits` int(255) NOT NULL,
  `prix_total` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sdb`
--

CREATE TABLE `Sdb` (
  `id_sdb` int(255) NOT NULL,
  `type` enum('douche','baignoire','douche et baignoire') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Service`
--

CREATE TABLE `Service` (
  `id_service` int(255) NOT NULL,
  `nom_service` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id_categorie_service` int(255) NOT NULL,
  `prix_service` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Service_Chambre`
--

CREATE TABLE `Service_Chambre` (
  `id_chambre_serv_chamb` int(255) NOT NULL,
  `id_service_serv_chamb` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Authentification`
--
ALTER TABLE `Authentification`
  ADD PRIMARY KEY (`id_auth`),
  ADD KEY `id_client` (`id_client_auth`),
  ADD KEY `id_client_2` (`id_client_auth`);

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `Chambre`
--
ALTER TABLE `Chambre`
  ADD PRIMARY KEY (`id_chambre`),
  ADD KEY `id_lit` (`id_lit_chambre`),
  ADD KEY `id_sdb` (`id_sdb_chambre`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `Etat_reservation`
--
ALTER TABLE `Etat_reservation`
  ADD PRIMARY KEY (`id_etat`);

--
-- Indexes for table `Facture`
--
ALTER TABLE `Facture`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `id_service` (`id_service_facture`);

--
-- Indexes for table `Lits`
--
ALTER TABLE `Lits`
  ADD PRIMARY KEY (`id_lit`);

--
-- Indexes for table `Reservations`
--
ALTER TABLE `Reservations`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_client` (`id_client_reserv`),
  ADD KEY `id_chambre` (`id_chambre_reserv`),
  ADD KEY `id_facture` (`id_facture_reserv`),
  ADD KEY `id_état` (`id_etat_reserv`);

--
-- Indexes for table `Sdb`
--
ALTER TABLE `Sdb`
  ADD PRIMARY KEY (`id_sdb`);

--
-- Indexes for table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `id_catégorie` (`id_categorie_service`);

--
-- Indexes for table `Service_Chambre`
--
ALTER TABLE `Service_Chambre`
  ADD KEY `id_chambre` (`id_chambre_serv_chamb`),
  ADD KEY `id_service` (`id_service_serv_chamb`),
  ADD KEY `id_chambre_2` (`id_chambre_serv_chamb`),
  ADD KEY `id_service_2` (`id_service_serv_chamb`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Authentification`
--
ALTER TABLE `Authentification`
  MODIFY `id_auth` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `id_categorie` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Chambre`
--
ALTER TABLE `Chambre`
  MODIFY `id_chambre` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `id_client` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Etat_reservation`
--
ALTER TABLE `Etat_reservation`
  MODIFY `id_etat` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Facture`
--
ALTER TABLE `Facture`
  MODIFY `id_facture` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Lits`
--
ALTER TABLE `Lits`
  MODIFY `id_lit` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Reservations`
--
ALTER TABLE `Reservations`
  MODIFY `id_reservation` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Sdb`
--
ALTER TABLE `Sdb`
  MODIFY `id_sdb` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Service`
--
ALTER TABLE `Service`
  MODIFY `id_service` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Authentification`
--
ALTER TABLE `Authentification`
  ADD CONSTRAINT `Authentification_ibfk_1` FOREIGN KEY (`id_client_auth`) REFERENCES `Client` (`id_client`);

--
-- Constraints for table `Chambre`
--
ALTER TABLE `Chambre`
  ADD CONSTRAINT `Chambre_ibfk_1` FOREIGN KEY (`id_lit_chambre`) REFERENCES `Lits` (`id_lit`),
  ADD CONSTRAINT `Chambre_ibfk_2` FOREIGN KEY (`id_sdb_chambre`) REFERENCES `Sdb` (`id_sdb`);

--
-- Constraints for table `Facture`
--
ALTER TABLE `Facture`
  ADD CONSTRAINT `Facture_ibfk_1` FOREIGN KEY (`id_service_facture`) REFERENCES `Service` (`id_service`);

--
-- Constraints for table `Reservations`
--
ALTER TABLE `Reservations`
  ADD CONSTRAINT `Reservations_ibfk_1` FOREIGN KEY (`id_chambre_reserv`) REFERENCES `Chambre` (`id_chambre`),
  ADD CONSTRAINT `Reservations_ibfk_2` FOREIGN KEY (`id_client_reserv`) REFERENCES `Client` (`id_client`),
  ADD CONSTRAINT `Reservations_ibfk_3` FOREIGN KEY (`id_etat_reserv`) REFERENCES `Etat_reservation` (`id_etat`),
  ADD CONSTRAINT `Reservations_ibfk_4` FOREIGN KEY (`id_facture_reserv`) REFERENCES `Facture` (`id_facture`);

--
-- Constraints for table `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`id_categorie_service`) REFERENCES `Categorie` (`id_categorie`);

--
-- Constraints for table `Service_Chambre`
--
ALTER TABLE `Service_Chambre`
  ADD CONSTRAINT `Service_Chambre_ibfk_1` FOREIGN KEY (`id_service_serv_chamb`) REFERENCES `Service` (`id_service`),
  ADD CONSTRAINT `Service_Chambre_ibfk_2` FOREIGN KEY (`id_chambre_serv_chamb`) REFERENCES `Chambre` (`id_chambre`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
