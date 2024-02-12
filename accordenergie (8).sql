-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 12 fév. 2024 à 12:49
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `accordenergie`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nomCategorie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `created_at`, `update_at`, `nomCategorie`) VALUES
(2, '2024-02-12 11:08:33', '2024-02-12 11:08:33', 'Informatique'),
(1, '2024-02-12 11:08:58', '2024-02-12 11:08:58', 'Plomberie');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id_commentaire` int NOT NULL AUTO_INCREMENT,
  `id_service` int NOT NULL,
  `id_user` int NOT NULL,
  `contenu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_commentaire`),
  KEY `id_service` (`id_service`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

DROP TABLE IF EXISTS `intervenant`;
CREATE TABLE IF NOT EXISTS `intervenant` (
  `id_intervenant` int NOT NULL AUTO_INCREMENT,
  `nomIntervenant` int NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_intervenant`),
  KEY `nomIntervenant` (`nomIntervenant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_statut` int NOT NULL,
  `id_urgence` int NOT NULL,
  `id_categorie` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateIntervention` date NOT NULL,
  `nomClient` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nomService` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `heureFin` time NOT NULL,
  `heureDebut` time NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_service`),
  KEY `id_user` (`id_user`),
  KEY `id_statut` (`id_statut`),
  KEY `id_urgence` (`id_urgence`),
  KEY `id_categorie` (`id_categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id_service`, `id_user`, `id_statut`, `id_urgence`, `id_categorie`, `created_at`, `dateIntervention`, `nomClient`, `nomService`, `heureFin`, `heureDebut`, `update_at`) VALUES
(1, 2, 2, 3, 2, '2024-02-12 11:27:59', '2024-01-15', 'Mbappe', 'Informatique', '17:00:00', '13:00:00', '2024-02-12 11:27:59'),
(5, 3, 2, 3, 1, '2024-02-12 12:49:30', '2024-01-17', 'Boris', 'Plomberie', '14:00:00', '09:00:00', '2024-02-12 12:49:30');

-- --------------------------------------------------------

--
-- Structure de la table `service_intervenant`
--

DROP TABLE IF EXISTS `service_intervenant`;
CREATE TABLE IF NOT EXISTS `service_intervenant` (
  `id_service_intervenant` int NOT NULL AUTO_INCREMENT,
  `id_service` int NOT NULL,
  `id_intervenant` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_service_intervenant`),
  UNIQUE KEY `id_service` (`id_service`,`id_intervenant`) USING BTREE,
  KEY `ID_intervenant` (`id_intervenant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `statutservice`
--

DROP TABLE IF EXISTS `statutservice`;
CREATE TABLE IF NOT EXISTS `statutservice` (
  `id_statut` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `degresStatut` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_statut`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `statutservice`
--

INSERT INTO `statutservice` (`id_statut`, `created_at`, `degresStatut`, `update_at`) VALUES
(2, '2024-02-12 11:15:29', '2', '2024-02-12 11:15:29'),
(1, '2024-02-12 11:15:12', '1', '2024-02-12 11:15:12'),
(3, '2024-02-12 11:15:43', '3', '2024-02-12 11:15:43');

-- --------------------------------------------------------

--
-- Structure de la table `urgence`
--

DROP TABLE IF EXISTS `urgence`;
CREATE TABLE IF NOT EXISTS `urgence` (
  `id_urgence` int NOT NULL AUTO_INCREMENT,
  `degresUrgence` int NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_urgence`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `urgence`
--

INSERT INTO `urgence` (`id_urgence`, `degresUrgence`, `update_at`) VALUES
(1, 1, '2024-02-12 11:18:54'),
(2, 2, '2024-02-12 11:19:12'),
(3, 3, '2024-02-12 11:19:25');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Client',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `created_at`, `nom`, `prenom`, `email`, `password`, `update_at`, `role`) VALUES
(1, '2024-02-12 10:54:46', 'Mbappe', 'Kylian', 'Kyks@gmail.com', 'azerty', '2024-02-12 10:54:46', 'Client'),
(2, '2024-02-12 10:57:34', 'Mobutu', 'kiki', 'Mobutu@gmail.com', 'qwerty', '2024-02-12 10:57:34', 'admin'),
(3, '2024-02-12 11:02:23', 'Rabz', 'Benni', 'rabz@gmail.com', 'projecteur', '2024-02-12 11:02:23', 'intervenant');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
