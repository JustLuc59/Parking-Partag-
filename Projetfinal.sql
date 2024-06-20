-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 11 juin 2024 à 14:30
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
-- Structure de la table `chaine`
--

CREATE TABLE `chaine` (
  `id` int(11) NOT NULL,
  `valeur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chaine`
--

INSERT INTO `chaine` (`id`, `valeur`) VALUES
(1, 'gdxnxjd2'),
(2, '5a4glYzcWh'),
(3, '5a4glYzcWh'),
(4, 'YxLYRHB3ip'),
(5, 'YxLYRHB3ip'),
(6, 'eMd33SNnQe'),
(7, 'yWyrThGLNo'),
(8, 'nL2HjNNyeL'),
(9, 'FSSgSn5iM6'),
(10, 'lUp1X3dl9m'),
(11, 'L6aubb6Y8o'),
(12, '4NHpk4T4CE'),
(13, '7rRQhLszUf'),
(14, 'ai77J8nYF5'),
(15, 'TX011leD00'),
(16, 'M2vGJKH5fD'),
(17, '95iqQZGu6S'),
(18, '1JmZ0JhSRt'),
(19, 'Cke7V0s2PL'),
(20, 'aCiLOIUFvH'),
(21, 'YAMngm45KC'),
(22, 'Rz7UfhsSdV'),
(23, 'CTxxmC3msJ'),
(24, '8qBiUCNLiy'),
(25, '4a4AR9zexv'),
(26, 'aHnAURrUgA'),
(27, 'tiYNYt3ZWy'),
(28, 'a00s1VrBzK');

-- --------------------------------------------------------

--
-- Structure de la table `codes_qr`
--

CREATE TABLE `codes_qr` (
  `id` int(11) NOT NULL,
  `cle` varchar(255) DEFAULT NULL,
  `nom_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Ecoute`
--

CREATE TABLE `Ecoute` (
  `id` int(11) NOT NULL,
  `En_Attente` tinyint(1) DEFAULT 0,
  `Nouveau_Colonne` int(11) DEFAULT 0,
  `barriere` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Ecoute`
--

INSERT INTO `Ecoute` (`id`, `En_Attente`, `Nouveau_Colonne`, `barriere`) VALUES
(1, 1, 1, b'0');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `creation` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `creation`) VALUES
(1, 1);

--
-- Déclencheurs `inscription`
--
DELIMITER $$
CREATE TRIGGER `update_renomage_creation` AFTER UPDATE ON `inscription` FOR EACH ROW BEGIN
    IF NEW.creation = 1 AND NEW.id = 1 THEN
        UPDATE renomage SET creation = 1 WHERE id = 1;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `lasersensor`
--

CREATE TABLE `lasersensor` (
  `id` int(11) NOT NULL,
  `VILLE` text NOT NULL,
  `PLACE` text NOT NULL,
  `distance_mm` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lasersensor`
--

INSERT INTO `lasersensor` (`id`, `VILLE`, `PLACE`, `distance_mm`, `timestamp`) VALUES
(7, 'TOURCOING', 'A1', 0, '2024-06-05 09:41:16'),
(8, 'TOURCOING', 'A2', 0, '2024-06-05 09:41:16'),
(9, 'TOURCOING', 'A3', 0, '2024-06-05 09:41:55'),
(10, 'TOURCOING', 'A4', 2223, '2024-06-05 09:41:55'),
(11, 'TOURCOING', 'A5', 0, '2024-06-05 09:42:17'),
(12, 'TOURCOING', 'B1', 0, '2024-06-05 09:42:17'),
(13, 'TOURCOING', 'B2', 0, '2024-06-05 09:42:47'),
(14, 'TOURCOING', 'B3', 0, '2024-06-05 09:42:47'),
(15, 'TOURCOING', 'B4', 0, '2024-06-05 09:43:11'),
(16, 'TOURCOING', 'B5', 0, '2024-06-05 09:43:11');

--
-- Déclencheurs `lasersensor`
--
DELIMITER $$
CREATE TRIGGER `update_parking_state_trigger` AFTER UPDATE ON `lasersensor` FOR EACH ROW BEGIN
    IF (NEW.distance_mm < 150 AND NEW.PLACE = 'A4') THEN
        UPDATE PARKING
        SET STATE = 2
        WHERE PLACE = 'A4' AND STATE = 1;
    END IF;
END
$$
DELIMITER ;

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
(1, 'ADMIN', '2024-05-23', 'ADMIN@mail.com', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `Mesures`
--

CREATE TABLE `Mesures` (
  `id` int(11) NOT NULL,
  `distance_cm` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Mesures`
--

INSERT INTO `Mesures` (`id`, `distance_cm`) VALUES
(336, 2.618),
(337, 2.618),
(338, 2.618),
(339, 2.635),
(340, 2.618),
(341, 2.618),
(342, 2.635),
(343, 2.635),
(344, 2.618),
(345, 2.618),
(346, 2.618),
(347, 2.941),
(348, 2.635),
(349, 2.618),
(350, 2.618),
(351, 2.618),
(352, 1.972),
(353, 1.972),
(354, 1.649),
(355, 1.649),
(356, 1.972),
(357, 1.972),
(358, 2.941),
(359, 2.618),
(360, 2.618),
(361, 2.941),
(362, 2.295),
(363, 2.618),
(364, 1.649),
(365, 1.649),
(366, 2.618),
(367, 2.295),
(368, 2.295),
(369, 2.941),
(370, 2.958),
(371, 2.635),
(372, 2.941),
(373, 2.618),
(374, 1.989),
(375, 2.941),
(376, 2.958),
(377, 1.649),
(378, 1.666),
(379, 1.666),
(380, 1.972),
(381, 1.972),
(382, 2.295),
(383, 2.635),
(384, 1.989),
(385, 2.941),
(386, 2.941),
(387, 2.941),
(388, 2.941),
(389, 2.295),
(390, 1.649),
(391, 2.295),
(392, 2.312),
(393, 2.295),
(394, 2.295),
(395, 2.295),
(396, 1.649),
(397, 1.972),
(398, 1.989),
(399, 1.972),
(400, 2.295),
(401, 1.649),
(402, 1.972),
(403, 1.972),
(404, 1.989),
(405, 1.666),
(406, 2.941),
(407, 1.649),
(408, 2.295),
(409, 1.666),
(410, 2.295),
(411, 1.666),
(412, 1.972),
(413, 1.972),
(414, 1.989),
(415, 1.972),
(416, 1.989),
(417, 1.972),
(418, 1.972),
(419, 1.972),
(420, 1.972),
(421, 1.972),
(422, 1.989),
(423, 1.972),
(424, 1.972),
(425, 1.989),
(426, 2.618),
(427, 2.941),
(428, 2.618),
(429, 2.618),
(430, 2.618),
(431, 2.618),
(432, 1.649),
(433, 2.941),
(434, 2.618),
(435, 2.618),
(436, 2.618),
(437, 2.618),
(438, 2.635),
(439, 2.618),
(440, 2.941),
(441, 2.618),
(442, 1.649),
(443, 1.989),
(444, 2.295),
(445, 1.666),
(446, 1.972),
(447, 1.649),
(448, 1.649),
(449, 1.649),
(450, 1.989),
(451, 2.618),
(452, 2.635),
(453, 2.941),
(454, 2.618),
(455, 2.618),
(456, 2.295),
(457, 2.295),
(458, 2.618),
(459, 2.618),
(460, 1.666),
(461, 1.666),
(462, 1.972),
(463, 2.618),
(464, 1.666),
(465, 1.649),
(466, 2.618),
(467, 2.635),
(468, 2.618),
(469, 2.295),
(470, 2.295),
(471, 2.618),
(472, 1.666),
(473, 1.666),
(474, 2.295),
(475, 2.618),
(476, 1.666),
(477, 2.312),
(478, 2.635),
(479, 2.635),
(480, 2.635),
(481, 2.295),
(482, 2.618),
(483, 2.618),
(484, 2.618),
(485, 2.618),
(486, 2.618),
(487, 2.618),
(488, 2.618),
(489, 2.295),
(490, 2.941),
(491, 2.941),
(492, 2.941),
(493, 2.941),
(494, 2.941),
(495, 2.618),
(496, 1.649),
(497, 2.635),
(498, 2.312),
(499, 2.295),
(500, 2.295),
(501, 2.312),
(502, 2.295),
(503, 2.295),
(504, 2.295),
(505, 2.618),
(506, 2.635),
(507, 2.618),
(508, 2.618),
(509, 2.618),
(510, 2.295),
(511, 1.972),
(512, 1.666),
(513, 1.649),
(514, 2.295),
(515, 1.649),
(516, 1.666),
(517, 1.989),
(518, 2.941),
(519, 2.618),
(520, 2.941),
(521, 1.649),
(522, 2.295),
(523, 2.635),
(524, 1.649),
(525, 2.618),
(526, 1.649),
(527, 1.972),
(528, 2.618),
(529, 2.295),
(530, 2.941),
(531, 1.649),
(532, 2.295),
(533, 2.312),
(534, 2.941),
(535, 2.958),
(536, 2.295),
(537, 2.941),
(538, 2.941),
(539, 2.941),
(540, 2.941),
(541, 2.635),
(542, 2.618),
(543, 2.618),
(544, 2.618),
(545, 2.618),
(546, 2.618),
(547, 2.618),
(548, 2.295),
(549, 2.312),
(550, 2.295),
(551, 2.941),
(552, 2.941),
(553, 2.295),
(554, 2.295),
(555, 1.666),
(556, 2.295),
(557, 2.618),
(558, 2.295),
(559, 2.941),
(560, 2.958),
(561, 2.958),
(562, 2.958),
(563, 2.941),
(564, 2.958),
(565, 2.941),
(566, 2.941),
(567, 2.941),
(568, 2.941),
(569, 1.972),
(570, 1.972),
(571, 1.666),
(572, 1.972),
(573, 1.666),
(574, 2.312),
(575, 2.941),
(576, 2.635),
(577, 2.312),
(578, 2.635),
(579, 2.941),
(580, 2.618),
(581, 2.941),
(582, 1.972),
(583, 2.618),
(584, 2.941),
(585, 2.958),
(586, 2.941),
(587, 2.958),
(588, 2.941),
(589, 2.941),
(590, 2.958),
(591, 2.941),
(592, 2.958),
(593, 2.958),
(594, 2.941),
(595, 2.941),
(596, 2.941),
(597, 2.941),
(598, 2.958),
(599, 2.958),
(600, 2.958),
(601, 2.941),
(602, 2.941),
(603, 2.958),
(604, 2.941),
(605, 2.958),
(606, 2.941),
(607, 2.958),
(608, 2.958),
(609, 2.958),
(610, 2.958),
(611, 2.941),
(612, 2.958),
(613, 2.958),
(614, 2.958),
(615, 2.958),
(616, 2.958),
(617, 2.958),
(618, 2.958),
(619, 2.958),
(620, 2.941),
(621, 2.941),
(622, 2.958),
(623, 2.958),
(624, 2.958),
(625, 2.958),
(626, 2.941),
(627, 2.941),
(628, 2.958),
(629, 2.958),
(630, 2.941),
(631, 2.958),
(632, 2.958),
(633, 2.958),
(634, 2.958),
(635, 2.941),
(636, 2.958),
(637, 2.941),
(638, 2.958),
(639, 2.941),
(640, 2.958),
(641, 2.941),
(642, 2.958),
(643, 2.941),
(644, 2.958),
(645, 2.958),
(646, 2.958),
(647, 2.958),
(648, 2.941),
(649, 2.941),
(650, 2.941),
(651, 2.958),
(652, 2.958),
(653, 2.958),
(654, 2.958),
(655, 2.958),
(656, 2.958),
(657, 2.941),
(658, 2.958),
(659, 2.941),
(660, 2.958),
(661, 2.958),
(662, 2.958),
(663, 2.941),
(664, 2.941),
(665, 2.958),
(666, 2.941),
(667, 2.958),
(668, 2.941),
(669, 2.958),
(670, 2.958),
(671, 2.958),
(672, 2.941),
(673, 2.941),
(674, 2.295),
(675, 2.618),
(676, 2.618),
(677, 2.618),
(678, 2.618),
(679, 2.635),
(680, 2.635),
(681, 2.618),
(682, 2.618),
(683, 2.618),
(684, 2.618),
(685, 2.635),
(686, 2.635),
(687, 2.635),
(688, 2.618),
(689, 2.618),
(690, 2.635),
(691, 2.635),
(692, 2.618),
(693, 2.618),
(694, 2.635),
(695, 2.635),
(696, 2.618),
(697, 2.635),
(698, 2.635),
(699, 2.635),
(700, 2.635),
(701, 2.618),
(702, 2.635),
(703, 2.618),
(704, 2.635),
(705, 2.618),
(706, 2.635),
(707, 2.618),
(708, 2.618),
(709, 2.618),
(710, 2.618),
(711, 2.635),
(712, 2.635),
(713, 2.618),
(714, 2.635),
(715, 2.635),
(716, 2.635),
(717, 2.635),
(718, 2.635),
(719, 2.635),
(720, 2.618),
(721, 2.618),
(722, 2.618),
(723, 2.635),
(724, 2.618),
(725, 2.635),
(726, 2.618),
(727, 2.635),
(728, 2.618),
(729, 2.635),
(730, 2.635),
(731, 2.618),
(732, 2.635),
(733, 2.635),
(734, 2.635),
(735, 2.618),
(736, 2.618),
(737, 2.618),
(738, 2.635),
(739, 2.618),
(740, 2.618),
(741, 2.618),
(742, 2.618),
(743, 2.635),
(744, 2.635),
(745, 2.635),
(746, 2.635),
(747, 2.618),
(748, 2.618),
(749, 2.635),
(750, 2.635),
(751, 2.618),
(752, 2.618),
(753, 2.635),
(754, 2.635);

-- --------------------------------------------------------

--
-- Structure de la table `ouverture`
--

CREATE TABLE `ouverture` (
  `id` int(11) NOT NULL,
  `barriere` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ouverture`
--

INSERT INTO `ouverture` (`id`, `barriere`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `PARKING`
--

CREATE TABLE `PARKING` (
  `ID` int(11) NOT NULL,
  `VILLE` text NOT NULL,
  `PLACE` text NOT NULL,
  `STATE` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `PARKING`
--

INSERT INTO `PARKING` (`ID`, `VILLE`, `PLACE`, `STATE`) VALUES
(1, 'TOURCOING', 'A1', 0),
(2, 'TOURCOING', 'A2', 0),
(3, 'TOURCOING', 'A3', 0),
(4, 'TOURCOING', 'A4', 1),
(5, 'TOURCOING', 'A5', 0),
(7, 'TOURCOING', 'B1', 1),
(8, 'TOURCOING', 'B2', 0),
(9, 'TOURCOING', 'B3', 0),
(10, 'TOURCOING', 'B4', 0),
(11, 'TOURCOING', 'B5', 0);

-- --------------------------------------------------------

--
-- Structure de la table `PLACE`
--

CREATE TABLE `PLACE` (
  `ID` int(11) NOT NULL,
  `NUMPLACE` text NOT NULL,
  `USER` text NOT NULL,
  `DATE` text NOT NULL,
  `VILLE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `PLACE`
--

INSERT INTO `PLACE` (`ID`, `NUMPLACE`, `USER`, `DATE`, `VILLE`) VALUES
(75, 'A4', 'Yanis', '2024-06-11', 'TOURCOING'),
(76, 'B3', 'Lucas', '2024-06-11', 'TOURCOING');

--
-- Déclencheurs `PLACE`
--
DELIMITER $$
CREATE TRIGGER `after_insert_on_place` AFTER INSERT ON `PLACE` FOR EACH ROW BEGIN
    -- Mise à jour de la table PARKING
    UPDATE PARKING
    SET STATE = 1
    WHERE PLACE = NEW.NUMPLACE;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `PlaquesImmatriculation`
--

CREATE TABLE `PlaquesImmatriculation` (
  `id` int(11) NOT NULL,
  `plaque` varchar(255) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `PlaquesImmatriculation`
--

INSERT INTO `PlaquesImmatriculation` (`id`, `plaque`, `nom`, `prenom`) VALUES
(1, 'DW737CS', 'VANOVERBERGHE', 'Lucas');

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
  `ADMIN` tinyint(1) NOT NULL DEFAULT 0,
  `valeur` text DEFAULT NULL,
  `reservation` tinyint(1) NOT NULL DEFAULT 0,
  `entree` tinyint(1) NOT NULL DEFAULT 0,
  `sortie` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Projet`
--

INSERT INTO `Projet` (`ID`, `username`, `mail`, `telephone`, `ville`, `IMAT`, `password`, `ADMIN`, `valeur`, `reservation`, `entree`, `sortie`) VALUES
(1234577, 'ADMIN', 'ADMIN@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'ADMN', 1, 'Jv0kablyPp', 0, 0, 0),
(1234578, 'coca', 'mail', 'tel', 'ville', 'plaque', 'coca', 0, 'URUYQOARmt', 0, 0, 0),
(1234579, 'benoit', 'beubeumail', 'beutel', 'beubeuville', 'beunoiplaque', 'bougnoule', 0, 'hQlKLZ0fRn', 0, 0, 0),
(1234580, 'Lucas', 'lucas@mail.com', '0621666247', 'Wattrelos', 'DW737CS', 'lucas', 0, 'R7WodcypMa', 1, 0, 0),
(1234581, 'jack', 'jack@etmichel.com', '06696969', 'lavanville', 'EL865TP', 'jack', 0, 'kkFKQOcIdq', 0, 0, 0),
(1234582, 'moi', 'moi', 'moi', 'moi', 'moi', 'moi', 0, '3qofbynOGp', 0, 0, 0),
(1234583, 'test', 'test', 'test', 'test', 'test', 'test', 0, 'Rm5X7D7tf2', 0, 0, 0),
(1234584, 'billy', 'billy@mail.com', '0612345678', 'Watt', 'DW737CS', 'Billy', 1, 'QQZlRZnoXK', 0, 0, 0),
(1234585, 'arthur', 'arthur@gmail.com', '0682225625', 'tourcoing', 'AA229AA', 'arthur', 0, 'kSnLcMNKrh', 0, 0, 0),
(1234587, 'Yanis', 'yanis@mail.com', '33 56 73 65 78', 'Tourcoing', 'AA123AA', 'Yanis', 0, 'mYpus5tyfz', 1, 0, 0);

--
-- Déclencheurs `Projet`
--
DELIMITER $$
CREATE TRIGGER `copy_to_projet2` AFTER INSERT ON `Projet` FOR EACH ROW INSERT INTO Projet2 (ID, username, mail, telephone, ville, IMAT, password, ADMIN)
VALUES (NEW.ID, NEW.username, NEW.mail, NEW.telephone, NEW.ville, NEW.IMAT, NEW.password, NEW.ADMIN)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `Projet2`
--

CREATE TABLE `Projet2` (
  `ID` int(11) NOT NULL,
  `username` text NOT NULL,
  `mail` text NOT NULL,
  `telephone` text NOT NULL,
  `ville` text NOT NULL,
  `IMAT` text NOT NULL,
  `password` text NOT NULL,
  `ADMIN` tinyint(1) NOT NULL DEFAULT 0,
  `cle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Projet2`
--

INSERT INTO `Projet2` (`ID`, `username`, `mail`, `telephone`, `ville`, `IMAT`, `password`, `ADMIN`, `cle`) VALUES
(1, 'Test1', 'Test1@mail.com', '0612345678', 'TEST', 'AA229AA', 'TEST', 0, 'qr_Test1.png'),
(2, 'LucasVano', 'lucas@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'lucas', 0, 'qr_LucasVano.png'),
(3, 'ADMIN', 'ADMIN@mail.com', '0612345678', 'ADMIN', 'AA229AA', 'ADMIN', 0, 'qr_ADMIN.png'),
(4, 'TEST2', 'Test1@mail.com', '0612345678', 'test', 'AA229AA', 'test', 0, 'qr_TEST2.png'),
(5, 'lucas', 'lucas@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'luc', 0, NULL),
(6, 'luctest', 'lucas@mail.com', '0682225625', 'W', 'DW737CS', 'test', 0, NULL),
(7, '1', '1@mail', '0612345678', '1', 'AA111AA', '1', 0, NULL),
(8, 'root', 'root@mail.com', '0612345678', 'ROOT', 'RO000OT', 'root', 0, NULL),
(9, 'arthur', 'arthur.lecoutre59@gmail.com', '0682225625', 'Tourcoing', 'AA229AA', 'arthur', 0, NULL),
(10, 'ADMIN', 'ADMIN@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'ADMIN', 0, NULL),
(34, 'testeur', 'non', 'non', 'non', 'non', 'testeur', 0, NULL),
(35, 'test2', 'test@gmail.com', '065847587', 'tourcoing', 'AA-00-AA', 'test2', 0, NULL),
(36, 'testeur1', 'testeur@gmail.com', '06 33 33 33 33', 'Tourcoing', 'AA - 24 -BB', 'testeur1', 0, NULL),
(37, 'petit', 'petit', 'petitnum', 'petit', 'petit', 'petit', 0, NULL),
(38, 'Lucas', 'lucas@mail.com', '0601020304', 'Wattrelos', 'AA229AA', 'lucas', 0, NULL),
(39, 'letsgo', 'letsgo@mail.com', '0612345678', 'letsgo', 'AA229AA', 'letsgo', 0, NULL),
(50, 'ADMIN', 'ADMIN@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'ADMIN', 0, NULL),
(1234567, 'ADMIN', 'ADMIN@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'ADMIN', 0, NULL),
(1234568, 'Arthur', 'arthur.lecoutre59@gmail.com', '0682225625', 'Tourcoing', 'AA229AA', 'arthur', 0, NULL),
(1234569, 'Lucas', 'lucas@mail.com', '0621666247', 'Wattrelos', 'DW737CS', 'lucas', 0, NULL),
(1234570, 'Arthur', 'arthur.lecoutre59@gmail.com', '0682225625', 'Wattrelos', 'AA229AA', 'arthur', 0, NULL),
(1234571, 'proute', 'prouteville', 'prouteimat', 'proutel', 'proute', 'priytemail', 0, NULL),
(1234572, 'final', 'fianl@feoij.co', '0612345678', 'NICK', 'AA229AA', 'final', 0, NULL),
(1234573, 'zaza', 'zazamail', 'zazanum', 'zazaville', 'zazaimat', 'zaza', 0, NULL),
(1234574, 'Yanis', 'yanis@mail.com', '0612345678', 'Neville', 'AA229AA', 'yanis', 0, NULL),
(1234575, 'wesh', 'a@ftg.com', '06jmenbranle', 'ville', 'PDFDP69', 'wesh', 0, NULL),
(1234576, 'TF2', 'TF2@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'TF2', 0, NULL),
(1234577, 'ADMIN', 'ADMIN@mail.com', '0612345678', 'Wattrelos', 'AA229AA', 'ADMN', 0, NULL),
(1234578, 'coca', 'mail', 'tel', 'ville', 'plaque', 'coca', 0, NULL),
(1234579, 'benoit', 'beubeumail', 'beutel', 'beubeuville', 'beunoiplaque', 'bougnoule', 0, NULL),
(1234580, 'Lucas', 'lucas@mail.com', '0621666247', 'Wattrelos', 'DW737CS', 'lucas', 0, NULL),
(1234581, 'jack', 'jack@etmichel.com', '06696969', 'lavanville', 'EL865TP', 'jack', 0, NULL),
(1234582, 'moi', 'moi', 'moi', 'moi', 'moi', 'moi', 0, NULL),
(1234583, 'test', 'test', 'test', 'test', 'test', 'test', 0, NULL),
(1234584, 'billy', 'billy@mail.com', '0612345678', 'Watt', 'DW737CS', 'Billy', 0, NULL),
(1234585, 'arthur', 'arthur@gmail.com', '0682225625', 'tourcoing', 'AA229AA', 'arthur', 0, NULL),
(1234586, 'Testproj', 'testproj@mail.ccom', '0612345678', 'Wattrelos', 'DW737CS', 'test', 0, NULL),
(1234587, 'Yanis', 'yanis@mail.com', '33 56 73 65 78', 'Tourcoing', 'AA123AA', 'Yanis', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `qrcodes`
--

CREATE TABLE `qrcodes` (
  `id` int(11) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `qrcodes`
--

INSERT INTO `qrcodes` (`id`, `data`) VALUES
(34, 'PahhITw61k'),
(35, 'hQlKLZ0fRn'),
(36, 'hQlKLZ0fRn'),
(37, 'hQlKLZ0fRn'),
(38, 'hQlKLZ0fRn'),
(39, 'w7njZ0C0LB'),
(40, 'R7WodcypMa'),
(41, 'w7njZ0C0LB'),
(42, 'hQlKLZ0fRn'),
(43, 'R7WodcypMa'),
(44, 'R7WodcypMa'),
(45, 'w7njZ0C0LB'),
(46, 'w7njZ0C0LB'),
(47, 'QQZlRZnoXK'),
(48, 'QQZlRZnoXK'),
(49, 'URUYQOARmt'),
(50, 'kSnLcMNKrh'),
(51, 'kSnLcMNKrh'),
(52, 'veXqTr000W');

--
-- Déclencheurs `qrcodes`
--
DELIMITER $$
CREATE TRIGGER `check_and_update_trigger` AFTER INSERT ON `qrcodes` FOR EACH ROW BEGIN
  DECLARE project_id INT;
  DECLARE reservation_status INT;
  DECLARE entree_status INT;

  -- Vérifier si la nouvelle valeur de `data` existe dans la table `Projet` et obtenir l'ID, le statut de réservation et le statut d'entrée
  SELECT id, reservation, entree INTO project_id, reservation_status, entree_status
  FROM Projet 
  WHERE valeur = NEW.data
  LIMIT 1;
  
  -- Si une correspondance est trouvée et que `reservation` est à 1
  IF project_id IS NOT NULL AND reservation_status = 1 THEN
    -- Si `entree` est 0, mettre `entree` à 1
    IF entree_status = 0 THEN
      UPDATE Projet 
      SET entree = 1 
      WHERE id = project_id;
    ELSE
      -- Si `entree` est déjà à 1, mettre `sortie` à 1
      UPDATE Projet 
      SET sortie = 1 
      WHERE id = project_id;
    END IF;

    -- Mettre à jour la colonne `barriere` à 1 pour l'entrée avec l'ID 1 dans la table `Ecoute`
    UPDATE Ecoute 
    SET barriere = 1 
    WHERE ID = 1;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `renomage`
--

CREATE TABLE `renomage` (
  `id` int(11) NOT NULL,
  `creation` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `renomage`
--

INSERT INTO `renomage` (`id`, `creation`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `resultats_plaques`
--

CREATE TABLE `resultats_plaques` (
  `id` int(11) NOT NULL,
  `plaque` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `resultats_plaques`
--

INSERT INTO `resultats_plaques` (`id`, `plaque`) VALUES
(100, 'No license plates found.\n'),
(101, 'No license plates found.\n'),
(102, 'plate0: 1 results\n    - D737CS	 confidence: 83.9638\n'),
(103, 'No license plates found.\n'),
(104, 'No license plates found.\n'),
(105, 'plate0: 1 results\n    - D737CS	 confidence: 82.8754\n'),
(106, 'No license plates found.\n'),
(107, 'No license plates found.\n'),
(108, 'No license plates found.\n'),
(109, 'plate0: 1 results\n    - D737CS	 confidence: 82.8255\n'),
(110, 'plate0: 1 results\n    - DW737C	 confidence: 86.5639\n'),
(111, 'plate0: 1 results\n    - DW737CS	 confidence: 86.6791\n'),
(112, 'No license plates found.\n'),
(113, 'No license plates found.\n'),
(114, 'No license plates found.\n'),
(115, 'No license plates found.\n'),
(116, 'plate0: 1 results\n    - DW737	 confidence: 79.8063\n'),
(117, 'plate0: 1 results\n    - DW737C	 confidence: 80.4705\n'),
(118, 'plate0: 1 results\n    - IDW737	 confidence: 83.5371\n'),
(119, 'No license plates found.\n'),
(120, 'plate0: 1 results\n    - DW737	 confidence: 80.4583\n'),
(121, 'plate0: 1 results\n    - DW737CS	 confidence: 81.8618\n'),
(122, 'plate0: 1 results\n    - DW77S	 confidence: 78.8925\n'),
(123, 'No license plates found.\n'),
(124, 'No license plates found.\n'),
(125, 'No license plates found.\n'),
(126, 'plate0: 1 results\n    - D77CS	 confidence: 82.4225\n'),
(127, 'plate0: 1 results\n    - 737CS	 confidence: 82.4987\n'),
(128, 'plate0: 1 results\n    - DW737CS	 confidence: 86.5274\n'),
(129, 'No license plates found.\n'),
(130, 'No license plates found.\n'),
(131, 'No license plates found.\n'),
(132, 'No license plates found.\n'),
(133, 'No license plates found.\n'),
(134, 'plate0: 1 results\n    - DW737CS	 confidence: 82.6031\n'),
(135, 'No license plates found.\n'),
(136, 'No license plates found.\n'),
(137, 'No license plates found.\n'),
(138, 'No license plates found.\n'),
(139, 'No license plates found.\n'),
(140, 'plate0: 1 results\n    - DW737CS	 confidence: 86.7189\n'),
(141, 'plate0: 1 results\n    - DW737CS	 confidence: 85.0233\n'),
(142, 'No license plates found.\n'),
(143, 'No license plates found.\n'),
(144, 'No license plates found.\n'),
(145, 'plate0: 1 results\n    - DW737CS	 confidence: 85.9193\n'),
(146, 'No license plates found.\n'),
(147, 'plate0: 1 results\n    - IW37C	 confidence: 79.2453\n'),
(148, 'plate0: 1 results\n    - DW737CS	 confidence: 82.85\n'),
(149, 'No license plates found.\n'),
(150, 'No license plates found.\n'),
(151, 'No license plates found.\n'),
(152, 'No license plates found.\n'),
(153, 'No license plates found.\n'),
(154, 'No license plates found.\n'),
(155, 'plate0: 1 results\n    - DW737	 confidence: 81.588\n'),
(156, 'No license plates found.\n'),
(157, 'No license plates found.\n'),
(158, 'No license plates found.\n'),
(159, 'plate0: 1 results\n    - DW737CS	 confidence: 86.1556\n'),
(160, 'No license plates found.\n'),
(161, 'No license plates found.\n'),
(162, 'No license plates found.\n'),
(163, 'No license plates found.\n'),
(164, 'No license plates found.\n'),
(165, 'No license plates found.\n'),
(166, 'No license plates found.\n'),
(167, 'plate0: 1 results\n    - DW737CS	 confidence: 87.1238\n'),
(168, 'No license plates found.\n'),
(169, 'No license plates found.\n'),
(170, 'plate0: 1 results\n    - DW737CS	 confidence: 88.05\n'),
(171, 'No license plates found.\n'),
(172, 'No license plates found.\n'),
(173, 'No license plates found.\n'),
(174, 'plate0: 1 results\n    - DW737CS	 confidence: 83.853\n'),
(175, 'No license plates found.\n'),
(176, 'No license plates found.\n'),
(177, 'No license plates found.\n'),
(178, 'No license plates found.\n'),
(179, 'No license plates found.\n'),
(180, 'No license plates found.\n'),
(181, 'No license plates found.\n'),
(182, 'plate0: 1 results\n    - EL865TP	 confidence: 90.0294\n'),
(183, 'No license plates found.\n'),
(184, 'No license plates found.\n'),
(185, 'No license plates found.\n'),
(186, 'No license plates found.\n'),
(187, 'plate0: 1 results\n    - DW737CS	 confidence: 87.533\n'),
(188, 'No license plates found.\n'),
(189, 'No license plates found.\n'),
(190, 'plate0: 1 results\n    - DW737CS	 confidence: 86.3596\n'),
(191, 'No license plates found.\n'),
(192, 'No license plates found.\n'),
(193, 'No license plates found.\n'),
(194, 'No license plates found.\n'),
(195, 'No license plates found.\n'),
(196, 'plate0: 1 results\n    - D737CS	 confidence: 83.0548\n'),
(197, 'plate0: 1 results\n    - DW737CS	 confidence: 84.8835\n'),
(198, 'No license plates found.\n'),
(199, 'No license plates found.\n'),
(200, 'No license plates found.\n'),
(201, 'No license plates found.\n'),
(202, 'plate0: 1 results\n    - DW737CS	 confidence: 88.223\n'),
(203, 'No license plates found.\n'),
(204, 'No license plates found.\n'),
(205, 'plate0: 1 results\n    - DW737CS	 confidence: 84.9946\n'),
(206, 'plate0: 1 results\n    - D737CS	 confidence: 84.2893\n'),
(207, 'No license plates found.\n'),
(208, 'No license plates found.\n'),
(209, 'No license plates found.\n'),
(210, 'No license plates found.\n'),
(211, 'No license plates found.\n'),
(212, 'plate0: 1 results\n    - IDW737C	 confidence: 86.1511\n'),
(213, 'No license plates found.\n'),
(214, 'No license plates found.\n'),
(215, 'No license plates found.\n'),
(216, 'plate0: 1 results\n    - D737E	 confidence: 83.6957\n'),
(218, 'No license plates found.\n'),
(219, 'No license plates found.\n');

--
-- Déclencheurs `resultats_plaques`
--
DELIMITER $$
CREATE TRIGGER `copier_valeurs_plaques` AFTER INSERT ON `resultats_plaques` FOR EACH ROW BEGIN
    IF NEW.plaque != 'No license plates found.\n'
 THEN
        INSERT INTO table_clean_plaque (plaque) VALUES (NEW.plaque);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `SourceYanis`
--

CREATE TABLE `SourceYanis` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `ville` text NOT NULL,
  `mail` text NOT NULL,
  `telephone` text NOT NULL,
  `IMAT` text NOT NULL,
  `ADMIN` tinyint(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `SourceYanis`
--

INSERT INTO `SourceYanis` (`id`, `username`, `password`, `ville`, `mail`, `telephone`, `IMAT`, `ADMIN`) VALUES
(1, 'caca', 'caca', 'caca', 'caca', 'caca', 'caca', 0),
(5, 'baba', 'baba', 'bibou', 'bobubou', 'babibou', 'bebe', 0),
(3, 'test1', 'test1', 'pop', 'bed', 'prout', 'rout', 0),
(4, 'saddamhussein', 'saddamhussein', 'kabul', 'saddahussein.com', 'talibanpohone', 'oui', 0),
(2, 'test', 'test', 'pop', 'bed', 'prout', 'rout', 0);

-- --------------------------------------------------------

--
-- Structure de la table `table_clean_plaque`
--

CREATE TABLE `table_clean_plaque` (
  `id` int(11) NOT NULL,
  `plaque` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `table_clean_plaque`
--

INSERT INTO `table_clean_plaque` (`id`, `plaque`) VALUES
(15, 'plate0: 1 results\n    - D737CS	 confidence: 83.9638\n'),
(16, 'plate0: 1 results\n    - D737CS	 confidence: 82.8754\n'),
(17, 'plate0: 1 results\n    - D737CS	 confidence: 82.8255\n'),
(18, 'plate0: 1 results\n    - DW737C	 confidence: 86.5639\n'),
(19, 'plate0: 1 results\n    - DW737CS	 confidence: 86.6791\n'),
(20, 'plate0: 1 results\n    - DW737	 confidence: 79.8063\n'),
(21, 'plate0: 1 results\n    - DW737C	 confidence: 80.4705\n'),
(22, 'plate0: 1 results\n    - IDW737	 confidence: 83.5371\n'),
(23, 'plate0: 1 results\n    - DW737	 confidence: 80.4583\n'),
(24, 'plate0: 1 results\n    - DW737CS	 confidence: 81.8618\n'),
(25, 'plate0: 1 results\n    - DW77S	 confidence: 78.8925\n'),
(26, 'plate0: 1 results\n    - D77CS	 confidence: 82.4225\n'),
(27, 'plate0: 1 results\n    - 737CS	 confidence: 82.4987\n'),
(28, 'plate0: 1 results\n    - DW737CS	 confidence: 86.5274\n'),
(29, 'plate0: 1 results\n    - DW737CS	 confidence: 82.6031\n'),
(30, 'plate0: 1 results\n    - DW737CS	 confidence: 86.7189\n'),
(31, 'plate0: 1 results\n    - DW737CS	 confidence: 85.0233\n'),
(32, 'plate0: 1 results\n    - DW737CS	 confidence: 85.9193\n'),
(33, 'plate0: 1 results\n    - IW37C	 confidence: 79.2453\n'),
(34, 'plate0: 1 results\n    - DW737CS	 confidence: 82.85\n'),
(35, 'plate0: 1 results\n    - DW737	 confidence: 81.588\n'),
(36, 'plate0: 1 results\n    - DW737CS	 confidence: 86.1556\n'),
(37, 'plate0: 1 results\n    - DW737CS	 confidence: 87.1238\n'),
(38, 'plate0: 1 results\n    - DW737CS	 confidence: 88.05\n'),
(39, 'plate0: 1 results\n    - DW737CS	 confidence: 83.853\n'),
(40, 'plate0: 1 results\n    - EL865TP	 confidence: 90.0294\n'),
(41, 'plate0: 1 results\n    - DW737CS	 confidence: 87.533\n'),
(42, 'plate0: 1 results\n    - DW737CS	 confidence: 86.3596\n'),
(43, 'plate0: 1 results\n    - D737CS	 confidence: 83.0548\n'),
(44, 'plate0: 1 results\n    - DW737CS	 confidence: 84.8835\n'),
(45, 'plate0: 1 results\n    - DW737CS	 confidence: 88.223\n'),
(46, 'plate0: 1 results\n    - DW737CS	 confidence: 84.9946\n'),
(47, 'plate0: 1 results\n    - D737CS	 confidence: 84.2893\n'),
(48, 'plate0: 1 results\n    - IDW737C	 confidence: 86.1511\n'),
(49, 'plate0: 1 results\n    - D737E	 confidence: 83.6957\n');

--
-- Déclencheurs `table_clean_plaque`
--
DELIMITER $$
CREATE TRIGGER `verifier_plaque_avant_insertion` BEFORE INSERT ON `table_clean_plaque` FOR EACH ROW BEGIN
    DECLARE plaque_value VARCHAR(250);
    DECLARE plaque_exist INT DEFAULT 0;

    -- Extraire la plaque d'immatriculation de la phrase
    SET plaque_value = (SELECT REGEXP_SUBSTR(NEW.plaque, '[A-Z]{2}[0-9]{3}[A-Z]{2}'));

    -- Vérifier si la plaque existe dans la table Projet
    SELECT COUNT(*)
    INTO plaque_exist
    FROM Projet
    WHERE IMAT = plaque_value;

    -- Si la plaque existe, mettre à jour les colonnes correspondantes
    IF plaque_exist > 0 THEN
        -- Vérifier si la réservation est égale à 1
        IF (SELECT reservation FROM Projet WHERE IMAT = plaque_value) = 1 THEN
            -- Mettre à jour la colonne barriere de la table Ecoute
            UPDATE Ecoute
            SET barriere = 1
            WHERE id = 1;

            -- Mettre à jour la colonne entree de la table Projet
            UPDATE Projet
            SET entree = 1
            WHERE IMAT = plaque_value;
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `temp_qrcodes`
--

CREATE TABLE `temp_qrcodes` (
  `id` int(11) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_projet`
--

CREATE TABLE `test_projet` (
  `ID` int(11) NOT NULL,
  `username` text NOT NULL,
  `mail` text NOT NULL,
  `telephone` text NOT NULL,
  `ville` text NOT NULL,
  `IMAT` text NOT NULL,
  `password` text NOT NULL,
  `ADMIN` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Ultrason`
--

CREATE TABLE `Ultrason` (
  `id` int(11) NOT NULL,
  `test` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_pourlucas`
--

CREATE TABLE `user_pourlucas` (
  `id` int(11) NOT NULL DEFAULT 0,
  `usercity` text NOT NULL,
  `usermail` text NOT NULL,
  `username` text NOT NULL,
  `usernumberplate` text NOT NULL,
  `userpassword` text NOT NULL,
  `userphone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chaine`
--
ALTER TABLE `chaine`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `codes_qr`
--
ALTER TABLE `codes_qr`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Ecoute`
--
ALTER TABLE `Ecoute`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lasersensor`
--
ALTER TABLE `lasersensor`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Mesures`
--
ALTER TABLE `Mesures`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ouverture`
--
ALTER TABLE `ouverture`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `PlaquesImmatriculation`
--
ALTER TABLE `PlaquesImmatriculation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plaque` (`plaque`);

--
-- Index pour la table `Projet`
--
ALTER TABLE `Projet`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Projet2`
--
ALTER TABLE `Projet2`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `qrcodes`
--
ALTER TABLE `qrcodes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `renomage`
--
ALTER TABLE `renomage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `resultats_plaques`
--
ALTER TABLE `resultats_plaques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `SourceYanis`
--
ALTER TABLE `SourceYanis`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `table_clean_plaque`
--
ALTER TABLE `table_clean_plaque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `temp_qrcodes`
--
ALTER TABLE `temp_qrcodes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `test_projet`
--
ALTER TABLE `test_projet`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Ultrason`
--
ALTER TABLE `Ultrason`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chaine`
--
ALTER TABLE `chaine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `codes_qr`
--
ALTER TABLE `codes_qr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `Ecoute`
--
ALTER TABLE `Ecoute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `lasersensor`
--
ALTER TABLE `lasersensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Mesures`
--
ALTER TABLE `Mesures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=755;

--
-- AUTO_INCREMENT pour la table `ouverture`
--
ALTER TABLE `ouverture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `PARKING`
--
ALTER TABLE `PARKING`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `PLACE`
--
ALTER TABLE `PLACE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `PlaquesImmatriculation`
--
ALTER TABLE `PlaquesImmatriculation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Projet`
--
ALTER TABLE `Projet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234588;

--
-- AUTO_INCREMENT pour la table `Projet2`
--
ALTER TABLE `Projet2`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234588;

--
-- AUTO_INCREMENT pour la table `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `renomage`
--
ALTER TABLE `renomage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `resultats_plaques`
--
ALTER TABLE `resultats_plaques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT pour la table `SourceYanis`
--
ALTER TABLE `SourceYanis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `table_clean_plaque`
--
ALTER TABLE `table_clean_plaque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `temp_qrcodes`
--
ALTER TABLE `temp_qrcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_projet`
--
ALTER TABLE `test_projet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Ultrason`
--
ALTER TABLE `Ultrason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
