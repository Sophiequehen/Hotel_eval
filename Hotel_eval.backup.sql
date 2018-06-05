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

--
-- Dumping data for table `Authentification`
--

INSERT INTO `Authentification` (`id_auth`, `id_client_auth`, `mdp`) VALUES
(1, 1, 'jacksonp'),
(2, 2, 'lilamina'),
(5, 3, 'marcanto'),
(6, 4, 'louisead');

-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE `Categorie` (
  `id_categorie` int(255) NOT NULL,
  `type` enum('matériel','bien-être','repas','spécial') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Categorie`
--

INSERT INTO `Categorie` (`id_categorie`, `type`) VALUES
(1, 'matériel'),
(2, 'bien-être'),
(3, 'repas'),
(4, 'spécial');

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

--
-- Dumping data for table `Chambre`
--

INSERT INTO `Chambre` (`id_chambre`, `nom_chambre`, `superficie`, `etage`, `vue`, `accessibilite`, `suite`, `prix_chambre`, `id_lit_chambre`, `id_sdb_chambre`) VALUES
(1, 'Marinière', '30', 3, 'Sur l\'océan', 1, 1, '50', 1, 3),
(2, 'La champêtre', '25', 2, 'Sur le pré d\'en face', 0, 0, '25', 1, 2),
(3, 'La cosy', '45', 5, 'Sur le parc fleuri', 0, 1, '45', 3, 3),
(4, 'La montagnarde', '40', 4, 'Sur le col', 0, 0, '35', 2, 2);

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

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`id_client`, `nom_client`, `prenom`, `telephone`, `mail`, `adresse`) VALUES
(1, 'Please', 'Jackson', 787654323, 'jackson@gmail.com', '28, rue des acacias, Lyon'),
(2, 'Mina', 'Lila', 787456534, 'lila@gmail.com', '50 avenue des lavandes, Tour'),
(3, 'Antoine', 'Marc', 213243265, 'marc@gmail.com', '45, allée des pyramides, Égypte'),
(4, 'Adam', 'Louise', 987657865, 'louise@gmailo.com', '90, avenue du Bourg, Amsterdam');

-- --------------------------------------------------------

--
-- Table structure for table `Etat_reservation`
--

CREATE TABLE `Etat_reservation` (
  `id_etat` int(255) NOT NULL,
  `type` enum('en cours','paiement effectué','annulée') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Etat_reservation`
--

INSERT INTO `Etat_reservation` (`id_etat`, `type`) VALUES
(1, 'en cours'),
(2, 'paiement effectué'),
(3, 'annulée');

-- --------------------------------------------------------

--
-- Table structure for table `Facture`
--

CREATE TABLE `Facture` (
  `id_facture` int(255) NOT NULL,
  `id_service_facture` int(255) NOT NULL,
  `quantite_service` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Facture`
--

INSERT INTO `Facture` (`id_facture`, `id_service_facture`, `quantite_service`) VALUES
(1, 1, 3),
(2, 3, 1),
(3, 2, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Lits`
--

CREATE TABLE `Lits` (
  `id_lit` int(255) NOT NULL,
  `type` enum('simple','queen size','king size') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Lits`
--

INSERT INTO `Lits` (`id_lit`, `type`) VALUES
(1, 'simple'),
(2, 'queen size'),
(3, 'king size');

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

--
-- Dumping data for table `Reservations`
--

INSERT INTO `Reservations` (`id_reservation`, `id_client_reserv`, `id_chambre_reserv`, `id_facture_reserv`, `id_etat_reserv`, `date_arrivee`, `date_depart`, `nb_nuits`, `prix_total`) VALUES
(1, 2, 2, 1, 2, '2018-06-05', '2018-06-08', 3, '99'),
(2, 4, 1, 2, 1, '2018-06-14', '2018-06-15', 1, '100'),
(3, 1, 4, 4, 3, '2018-06-15', '2018-06-17', 2, '82');

-- --------------------------------------------------------

--
-- Table structure for table `Sdb`
--

CREATE TABLE `Sdb` (
  `id_sdb` int(255) NOT NULL,
  `type` enum('douche','baignoire','douche et baignoire') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sdb`
--

INSERT INTO `Sdb` (`id_sdb`, `type`) VALUES
(1, 'douche'),
(2, 'baignoire'),
(3, 'douche et baignoire');

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

--
-- Dumping data for table `Service`
--

INSERT INTO `Service` (`id_service`, `nom_service`, `description`, `id_categorie_service`, `prix_service`) VALUES
(1, 'Petit-déjeuner en chambre', 'Vous pouvez bénéficier d\'un service d\'étage vous apportant le petit-déjeuner à l\'heure souhaitée', 3, '8'),
(2, 'Mini-bar', 'En suite, vous avez accès au mini-bar rempli de gourmandises, qui pourront, nous l\'espèrons, vous combler à toute heure', 1, '15'),
(3, 'Bouteille de champagne', 'Une occasion à fêter, un évènement hors du commun ou par simple envie, n\'hésitez pas à demander notre bouteille de champagne', 4, '50'),
(4, 'Spa', 'Venez profiter de nos remous et bulles', 2, '12');

-- --------------------------------------------------------

--
-- Table structure for table `Service_Chambre`
--

CREATE TABLE `Service_Chambre` (
  `id_chambre_serv_chamb` int(255) NOT NULL,
  `id_service_serv_chamb` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Service_Chambre`
--

INSERT INTO `Service_Chambre` (`id_chambre_serv_chamb`, `id_service_serv_chamb`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(2, 1),
(4, 1),
(4, 4);

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
