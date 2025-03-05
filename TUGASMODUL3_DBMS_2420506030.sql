-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2025 at 04:55 AM
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
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `datadiri_mahasiswa`
--

CREATE TABLE `datadiri_mahasiswa` (
  `NPM` char(5) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `Tempat_Lahir` varchar(30) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` enum('L','P') NOT NULL,
  `No_Hp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datadiri_mahasiswa`
--

INSERT INTO `datadiri_mahasiswa` (`NPM`, `Nama`, `Tempat_Lahir`, `Tanggal_Lahir`, `Jenis_Kelamin`, `No_Hp`) VALUES
('TIF01', 'Figo', 'Bekasi', '2006-07-25', 'L', '088245700893'),
('TIF02', 'Rayfal', 'Brebes', '2006-05-05', 'L', '088475839211'),
('TIF03', 'Yasabuana', 'Magelang', '2005-12-31', 'L', '088542394823'),
('TIF05', 'Biyu', 'Magelang', '2006-04-24', 'L', '0884262382424'),
('TIF06', 'David', 'Wonosobo', '2006-09-12', 'L', '033124331246'),
('TIF07', 'Abdi', 'Magelang', '2006-01-01', 'L', '092727562318'),
('TIF08', 'Hanif', 'Wonosobo', '2005-12-09', 'L', '037463948761'),
('TIF09', 'Hammam', 'Surakarta', '2006-09-02', 'L', '097846253912'),
('TIF10', 'Nabila', 'Wonosobo', '0000-00-00', 'P', '088467392813');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datadiri_mahasiswa`
--
ALTER TABLE `datadiri_mahasiswa`
  ADD PRIMARY KEY (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
