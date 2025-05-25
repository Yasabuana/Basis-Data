-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2025 at 05:12 PM
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
-- Database: `db_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `bidang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `bidang`) VALUES
('2424205001', 'Sifugo', 'Data Manipulation'),
('2424205010', 'Viva Davida', 'Data Engineering'),
('2424205011', 'Cabiell', 'Data Network'),
('2424205022', 'Chanatip', 'Cyber Security'),
('2424205032', 'Lutva', 'Data Analyst');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jurusan`) VALUES
('2420505060', 'Rahman', 'Teknik Kimia'),
('2420506009', 'Rayfong', 'Matematika Murni'),
('2420506017', 'Abdiya', 'Teknik Kelautan'),
('2420506018', 'Humman', 'Teknik Mesin'),
('2420506028', 'Angsep', 'Sastra Indonesia'),
('2420506035', 'Ahbiyu', 'Biologi');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`) VALUES
('000001', 'Matematika Diskrit', 4),
('000002', 'Pemetaan Sel', 3),
('000003', 'Hukum Laut', 3),
('000004', 'Gambar Teknik', 2),
('000005', 'Kaidah Kebahasaan', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `nim` char(10) DEFAULT NULL,
  `jenis_tagihan` varchar(30) DEFAULT NULL,
  `jumlah_tagihan` decimal(10,2) DEFAULT NULL,
  `status` enum('Lunas','Belum Lunas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `nim`, `jenis_tagihan`, `jumlah_tagihan`, `status`) VALUES
(1, '2420506009', 'UKT', 10000000.00, 'Lunas'),
(2, '2420506017', 'UKT', 5500000.00, 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `temp_tabel`
--

CREATE TABLE `temp_tabel` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
