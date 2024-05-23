-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2024 at 03:09 PM
-- Server version: 10.5.23-MariaDB-0+deb11u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Projet`
--

-- --------------------------------------------------------

--
-- Table structure for table `PARKING`
--

CREATE TABLE `PARKING` (
  `ID` int(11) NOT NULL,
  `VILLE` text NOT NULL,
  `PLACE` text NOT NULL,
  `STATE` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PARKING`
--

INSERT INTO `PARKING` (`ID`, `VILLE`, `PLACE`, `STATE`) VALUES
(1, 'TOURCOING', 'A1', 0),
(2, 'TOURCOING', 'A2', 0),
(3, 'TOURCOING', 'A3', 0),
(4, 'TOURCOING', 'A4', 1),
(5, 'TOURCOING', 'A5', 0),
(6, 'WATTRELOS', 'A1', 0),
(7, 'TOURCOING', 'B1', 0),
(8, 'TOURCOING', 'B2', 1),
(9, 'TOURCOING', 'B3', 0),
(10, 'TOURCOING', 'B4', 1),
(11, 'TOURCOING', 'B5', 0),
(12, 'TOURCOING', 'C1', 0),
(13, 'TOURCOING', 'C2', 0),
(14, 'TOURCOING', 'C3', 0),
(15, 'TOURCOING', 'C4', 0),
(16, 'TOURCOING', 'C5', 0),
(17, 'TOURCOING', 'D1', 0),
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
(54, 'WATTRELOS', 'C4', 0),
(55, 'WATTRELOS', 'C5', 0),
(56, 'WATTRELOS', 'D1', 0),
(57, 'WATTRELOS', 'D2', 0),
(58, 'WATTRELOS', 'D3', 0),
(59, 'WATTRELOS', 'D4', 0),
(60, 'WATTRELOS', 'D5', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `PARKING`
--
ALTER TABLE `PARKING`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `PARKING`
--
ALTER TABLE `PARKING`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
