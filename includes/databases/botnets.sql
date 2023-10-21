-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 27 juin 2023 à 22:03
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP :  7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `botnets`
--

-- --------------------------------------------------------

--
-- Structure de la table `victimes`
--

CREATE TABLE `victimes` (
  `id_victime` varchar(20) NOT NULL,
  `id_bot` varchar(20) DEFAULT NULL,
  `nom_machine` varchar(200) DEFAULT NULL,
  `ip_public` varchar(100) DEFAULT NULL,
  `ip_prive` varchar(100) DEFAULT NULL,
  `mac_adresse` varchar(100) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  `systeme_version` varchar(10) DEFAULT NULL,
  `systeme_arch` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `victimes`
--
ALTER TABLE `victimes`
  ADD PRIMARY KEY (`id_victime`),
  ADD UNIQUE KEY `id_bot` (`id_bot`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
