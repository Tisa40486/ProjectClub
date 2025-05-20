-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2025 at 09:07 AM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Project_Club_Web`
--

-- --------------------------------------------------------

--
-- Table structure for table `Effectif`
--

CREATE TABLE `Effectif` (
  `taille_effectif` int(11) NOT NULL,
  `moyen_Âge` double(3,1) NOT NULL,
  `idJoueur` int(11) NOT NULL,
  `idPost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Joueurs`
--

CREATE TABLE `Joueurs` (
  `idJoueur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `dateNaissnace` date NOT NULL,
  `age` int(11) NOT NULL,
  `taille` int(11) NOT NULL,
  `numéro` int(11) NOT NULL,
  `idPost` int(11) NOT NULL,
  `poides` double(3,2) NOT NULL,
  `Lieu_Naissance` varchar(100) NOT NULL,
  `matchs_Jouer` int(11) NOT NULL,
  `Buts` int(11) NOT NULL,
  `passe_décisive` int(11) NOT NULL,
  `club` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Matchs`
--

CREATE TABLE `Matchs` (
  `id_match` int(11) NOT NULL,
  `équipe_1` varchar(100) NOT NULL,
  `équipe_2` varchar(100) NOT NULL,
  `Stade_lieu` varchar(200) NOT NULL,
  `date_heurs` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `idPost` int(11) NOT NULL,
  `post` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Sélectionneur`
--

CREATE TABLE `Sélectionneur` (
  `idSelectionneure` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `dateNaissnace` date NOT NULL,
  `age` int(11) NOT NULL,
  `nombre_Match_Officiel` int(11) NOT NULL,
  `nombre_Victoires` int(11) NOT NULL,
  `nombre_Nuls` int(11) NOT NULL,
  `nombre_Défaites` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `idUser` int(11) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `user_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Effectif`
--
ALTER TABLE `Effectif`
  ADD KEY `idJoueur` (`idJoueur`),
  ADD KEY `idPost` (`idPost`);

--
-- Indexes for table `Joueurs`
--
ALTER TABLE `Joueurs`
  ADD PRIMARY KEY (`idJoueur`),
  ADD KEY `idPost` (`idPost`);

--
-- Indexes for table `Matchs`
--
ALTER TABLE `Matchs`
  ADD PRIMARY KEY (`id_match`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idPost`);

--
-- Indexes for table `Sélectionneur`
--
ALTER TABLE `Sélectionneur`
  ADD PRIMARY KEY (`idSelectionneure`);

--
-- Indexes for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Joueurs`
--
ALTER TABLE `Joueurs`
  MODIFY `idJoueur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `idPost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Sélectionneur`
--
ALTER TABLE `Sélectionneur`
  MODIFY `idSelectionneure` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Effectif`
--
ALTER TABLE `Effectif`
  ADD CONSTRAINT `Effectif_ibfk_1` FOREIGN KEY (`idJoueur`) REFERENCES `Joueurs` (`idJoueur`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Effectif_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`);

--
-- Constraints for table `Joueurs`
--
ALTER TABLE `Joueurs`
  ADD CONSTRAINT `Joueurs_ibfk_1` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
