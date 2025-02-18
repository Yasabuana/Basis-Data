-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 03:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jadwal_sholat`
--

-- --------------------------------------------------------

--
-- Table structure for table `waktu_sholat`
--

CREATE TABLE `waktu_sholat` (
  `Subuh` varchar(10) NOT NULL,
  `Dzuhur` varchar(10) NOT NULL,
  `Ashar` varchar(10) NOT NULL,
  `Maghrib` varchar(10) NOT NULL,
  `Isya` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waktu_sholat`
--

INSERT INTO `waktu_sholat` (`Subuh`, `Dzuhur`, `Ashar`, `Maghrib`, `Isya`) VALUES
('04.26', '11.57', '15.05', '18.06', '19.17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `waktu_sholat`
--
ALTER TABLE `waktu_sholat`
  ADD PRIMARY KEY (`Subuh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
