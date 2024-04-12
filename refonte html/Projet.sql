-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 12 avr. 2024 à 16:50
-- Version du serveur : 10.5.23-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `ID` int(11) NOT NULL,
  `USER` text NOT NULL,
  `DATE` date NOT NULL DEFAULT current_timestamp(),
  `MAIL` text NOT NULL,
  `MSG` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`ID`, `USER`, `DATE`, `MAIL`, `MSG`) VALUES
(1, 'Lucas', '2024-03-25', 'lucas@mail.com', 'Test de message N°1 !'),
(2, 'oui', '2024-03-26', 'oui@gmail.com', 'il y a des toillettes dans vos parkings ?'),
(3, 'Poule', '2024-03-26', 'poule@poule', 'Wesh'),
(4, 'poule', '2024-03-26', 'poule@poule', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquam, nulla sed accumsan efficitur, massa odio elementum eros, a aliquam lorem risus eu nunc. Ut pulvinar magna vitae diam pharetra, et maximus velit euismod. Praesent pretium ac purus ut blandit. Fusce tristique turpis magna, vel dapibus justo suscipit quis. Vestibulum enim nulla, lacinia a lacus sit amet, finibus tempor enim. Nullam lobortis dolor id interdum convallis. Vestibulum maximus eros at felis consectetur, at tempus dui suscipit. Nam et molestie tellus, in semper enim. Maecenas tempor posuere ultrices. Donec a scelerisque ex, nec sodales tellus. Quisque vestibulum congue eros, sed fringilla massa dictum at. Donec bibendum faucibus tellus at faucibus. Suspendisse placerat viverra est a molestie. Donec vel sem odio. Fusce leo leo, volutpat ut condimentum eget, tempor eget nisi. Curabitur eros sem, lacinia vitae risus id, venenatis convallis arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut tempor enim dictum justo rutrum malesuada. Nullam eget sem at leo ultricies malesuada. Nam dictum aliquam luctus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam ut enim laoreet metus pulvinar vestibulum eget eu augue. Fusce at malesuada risus. Donec ut sagittis mi. Nam ullamcorper ultrices accumsan. Praesent lorem lectus, venenatis in imperdiet at, maximus ut lacus. Vivamus posuere, ex vitae convallis lacinia, mi urna cursus augue, et commodo sem enim in libero. Sed vel hendrerit lectus. Ut sem dolor, ultricies et facilisis ac, lacinia non risus. Suspendisse eu tincidunt ex. Nulla condimentum laoreet tempor. Praesent dui nisi, pharetra at commodo eu, vehicula sit amet sem. Sed a dignissim elit. Sed aliquam volutpat lacinia. Phasellus non lorem non dolor fringilla egestas. Sed fringilla diam sem, vitae semper enim lacinia eu. Nunc aliquet at orci nec ultrices. Vestibulum lacinia vestibulum odio in congue. Ut eget tincidunt dui. Aliquam accumsan orci ac mauris congue porttitor. Nullam cursus ligula ultrices gravida viverra. Sed semper euismod diam quis pellentesque. In hac habitasse platea dictumst. Quisque eu consequat diam. Donec sodales, nisl vitae aliquet viverra, nisl urna pellentesque erat, ac finibus libero nisl in libero. Fusce eu cursus orci. Maecenas ultricies molestie libero, sodales eleifend nibh rutrum congue. In maximus luctus varius. Mauris est augue, feugiat sit amet velit non, varius lobortis massa. Aenean sagittis facilisis turpis ac interdum. Vivamus luctus tortor at ante posuere imperdiet. Suspendisse potenti. Sed nec nunc nec dolor maximus tristique sit amet ultricies nunc. Quisque sed purus tristique, semper lectus sit amet, dictum lorem. Ut augue arcu, pretium eu enim sit amet, pulvinar finibus justo. In in aliquet purus. Aliquam mollis nisl nec eleifend sollicitudin. Praesent ut urna tincidunt, eleifend ipsum et, lobortis libero. Integer nec enim id ex pulvinar gravida. Duis suscipit sem eget dolor convallis gravida. Donec finibus sagittis posuere. Pellentesque volutpat justo bibendum, rutrum arcu et, faucibus dolor. Morbi molestie ullamcorper odio.');

-- --------------------------------------------------------

--
-- Structure de la table `PARKING`
--

CREATE TABLE `PARKING` (
  `ID` int(11) NOT NULL,
  `VILLE` text NOT NULL,
  `PLACE` text NOT NULL,
  `STATE` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `PARKING`
--

INSERT INTO `PARKING` (`ID`, `VILLE`, `PLACE`, `STATE`) VALUES
(1, 'TOURCOING', 'A1', 2),
(2, 'TOURCOING', 'A2', 1),
(3, 'TOURCOING', 'A3', 1),
(4, 'TOURCOING', 'A4', 0),
(5, 'TOURCOING', 'A5', 1),
(6, 'WATTRELOS', 'A1', 0),
(7, 'TOURCOING', 'B1', 1),
(8, 'TOURCOING', 'B2', 0),
(9, 'TOURCOING', 'B3', 0),
(10, 'TOURCOING', 'B4', 0),
(11, 'TOURCOING', 'B5', 0),
(12, 'TOURCOING', 'C1', 1),
(13, 'TOURCOING', 'C2', 0),
(14, 'TOURCOING', 'C3', 0),
(15, 'TOURCOING', 'C4', 0),
(16, 'TOURCOING', 'C5', 1),
(17, 'TOURCOING', 'D1', 1),
(18, 'TOURCOING', 'D2', 0),
(19, 'TOURCOING', 'D3', 0),
(20, 'TOURCOING', 'D4', 0),
(21, 'TOURCOING', 'D5', 0),
(42, 'WATTRELOS', 'A2', 0),
(43, 'WATTRELOS', 'A3', 0),
(44, 'WATTRELOS', 'A4', 0),
(45, 'WATTRELOS', 'A5', 0),
(46, 'WATTRELOS', 'B1', 0),
(47, 'WATTRELOS', 'B2', 0),
(48, 'WATTRELOS', 'B3', 0),
(49, 'WATTRELOS', 'B4', 0),
(50, 'WATTRELOS', 'B5', 0),
(51, 'WATTRELOS', 'C1', 0),
(52, 'WATTRELOS', 'C2', 0),
(53, 'WATTRELOS', 'C3', 0),
(54, 'WATTRELOS', 'C4', 1),
(55, 'WATTRELOS', 'C5', 1),
(56, 'WATTRELOS', 'D1', 1),
(57, 'WATTRELOS', 'D2', 0),
(58, 'WATTRELOS', 'D3', 0),
(59, 'WATTRELOS', 'D4', 0),
(60, 'WATTRELOS', 'D5', 0);

-- --------------------------------------------------------

--
-- Structure de la table `PLACE`
--

CREATE TABLE `PLACE` (
  `ID` int(11) NOT NULL,
  `NUMPLACE` text NOT NULL,
  `USER` text NOT NULL,
  `DATE` date NOT NULL DEFAULT current_timestamp(),
  `VILLE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `PLACE`
--

INSERT INTO `PLACE` (`ID`, `NUMPLACE`, `USER`, `DATE`, `VILLE`) VALUES
(54, 'C4', 'Lucas', '2024-03-28', 'WATTRELOS'),
(56, 'C5', 'ADMIN', '2024-03-28', 'WATTRELOS'),
(60, 'A2', 'ADMIN', '2024-03-29', 'TOURCOING'),
(61, 'A3', 'ADMIN', '2024-03-29', 'TOURCOING'),
(62, 'C1', 'ADMIN', '2024-03-29', 'TOURCOING'),
(64, 'D1', 'ADMIN', '2024-03-29', 'TOURCOING'),
(66, 'C5', 'poule', '2024-04-02', 'TOURCOING'),
(70, 'D1', 'ADMIN', '2024-04-04', 'WATTRELOS'),
(71, 'B1', 'ADMIN', '2024-04-04', 'TOURCOING'),
(74, 'A5', 'ADMIN', '2024-04-08', 'TOURCOING'),
(81, 'A1', 'ADMIN', '2024-04-10', 'TOURCOING');

-- --------------------------------------------------------

--
-- Structure de la table `Projet`
--

CREATE TABLE `Projet` (
  `ID` int(11) NOT NULL,
  `username` text NOT NULL,
  `mail` text NOT NULL,
  `telephone` text NOT NULL,
  `ville` text NOT NULL,
  `IMAT` text NOT NULL,
  `password` text NOT NULL,
  `ADMIN` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Projet`
--

INSERT INTO `Projet` (`ID`, `username`, `mail`, `telephone`, `ville`, `IMAT`, `password`, `ADMIN`) VALUES
(1, 'LucasVano', 'lucas@mail.com', '0601020304', 'Tourcoing', '0', 'lucas', 0),
(2, 'penisto59', 'arthur.lecoutre59@gmail.com', '0682225625', 'moncuq', '0', 'trucalacon', 0),
(3, 'poule', 'poule@poule', '16', 'Tourcoing', '0', 'poupoule', 0),
(4, 'TEST', 'nodejs de c grand mort', '4651489', 'ta mere', '0', 'test123', 0),
(5, 'ADMIN', 'ADMIN@ADMIN.com', '062666247', 'WATTRELOS', '0', 'ADMIN', 1),
(6, 'lucas', 'lucas@gmail.com', '0621666247', 'Wattrelos', '0', 'luc', 0),
(7, 'oui', 'oui@gmail.com', '0682225625', 'oui', '0', 'oui', 1),
(8, 'niketamerepid', 'test@pidedecmort.com', '0606060606', 'villedemort', '0', '1234', 0),
(9, 'root', 'root@rootmail.coù', '7000000001', 'rootmania', '0', 'rootestque', 0),
(12, 'Lucas', 'lucas@gmail.com', '0612345678', 'Wattrelos', 'AA229AA', 'lucas59150', 0),
(13, 'tata', 'tata@gmail.fou', '0606060606', 'mars', 'TA101TA', 'TA101TA', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `PARKING`
--
ALTER TABLE `PARKING`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `PLACE`
--
ALTER TABLE `PLACE`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Projet`
--
ALTER TABLE `Projet`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `PARKING`
--
ALTER TABLE `PARKING`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `PLACE`
--
ALTER TABLE `PLACE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT pour la table `Projet`
--
ALTER TABLE `Projet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
