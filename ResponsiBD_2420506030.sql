-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2025 at 06:41 PM
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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(20) DEFAULT 'Umum',
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `jurusan`, `tgl_daftar`) VALUES
('TIF1', 'Yasabuana', 'Teknologi Informasi', '2023-08-17'),
('TIF2', 'Zurich', 'Teknologi Informasi', '2024-01-01'),
('TIF3', 'Mayvandra', 'Teknologi Informasi', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `anggotaa`
--

CREATE TABLE `anggotaa` (
  `id_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jurusan_anggota` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggotaa`
--

INSERT INTO `anggotaa` (`id_anggota`, `nama_anggota`, `jurusan_anggota`) VALUES
(1, 'Rayfal', 'Matematika Murni'),
(2, 'Yasa', 'Teknik Informatika'),
(3, 'Hammam', 'Teknik Komputasi'),
(4, 'Sabil', 'Teknik Kelautan');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `id_penerbit` varchar(10) DEFAULT NULL
) ;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penerbit`, `tahun_terbit`, `id_penerbit`) VALUES
('Y001', 'Basis Data', 'Erlangga', 2016, '1'),
('Y002', 'Algoritma Pemrograman', 'Gramedia', 2020, '2'),
('Y003', 'Struktur Data', 'Rajawali Press', 2019, '3'),
('Y004', 'Big Data', 'Gramedia', 2022, '2'),
('Y005', 'Infrastruktur Jaringan', 'Rajawali Press', 2023, '3');

-- --------------------------------------------------------

--
-- Table structure for table `bukuu`
--

CREATE TABLE `bukuu` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `penerbit_buku` varchar(40) NOT NULL,
  `Status` enum('Tersedia','Dipinjam') DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bukuu`
--

INSERT INTO `bukuu` (`id_buku`, `judul_buku`, `penerbit_buku`, `Status`) VALUES
(1, 'Aku Cinta Matematika', 'Gramedia', 'Dipinjam'),
(2, 'Grammar & TOEFL', 'Erlangga', 'Dipinjam'),
(3, 'Basis Data', 'Rajawali Press', 'Dipinjam'),
(4, 'Ragam Ikan di Dunia', 'Gramedia', 'Dipinjam'),
(5, 'Hukum Perdata', 'Rajawali Press', 'Tersedia'),
(6, 'Algoritma Komputasi', 'Erlangga', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `dendaa`
--

CREATE TABLE `dendaa` (
  `id_denda` int(11) NOT NULL,
  `id_peminjaman` int(11) DEFAULT NULL,
  `jumlah_denda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dendaa`
--

INSERT INTO `dendaa` (`id_denda`, `id_peminjaman`, `jumlah_denda`) VALUES
(1, 1, 0.00),
(2, 2, 0.00),
(3, 3, 0.00),
(4, 4, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
(1, 'TIF1', 'Y005', '2025-01-28', '2025-02-10', 0),
(2, 'TIF2', 'Y003', '2025-01-30', '2025-02-12', 0),
(3, 'TIF3', 'Y002', '2025-01-25', '0000-00-00', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `peminjamann`
--

CREATE TABLE `peminjamann` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjamann`
--

INSERT INTO `peminjamann` (`id_peminjaman`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
(1, 1, 1, '2024-08-14', '2025-02-14', NULL),
(2, 2, 2, '2024-11-22', '2025-02-10', NULL),
(3, 3, 3, '2025-01-05', '2025-03-29', NULL),
(4, 4, 4, '2025-03-01', '2025-04-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(10) NOT NULL,
  `nama_penerbit` varchar(70) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`, `alamat`) VALUES
('1', 'Erlangga', 'Magelang'),
('2', 'Gramedia', 'Brebes'),
('3', 'Rajawali Press', 'Wonosobo');

-- --------------------------------------------------------

--
-- Table structure for table `transaksipeminjaman`
--

CREATE TABLE `transaksipeminjaman` (
  `id_transaksi` int(11) NOT NULL,
  `nama_anggota` varchar(70) NOT NULL,
  `jurusan_anggota` varchar(35) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `penerbit_buku` varchar(40) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksipeminjaman`
--

INSERT INTO `transaksipeminjaman` (`id_transaksi`, `nama_anggota`, `jurusan_anggota`, `judul_buku`, `penerbit_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
(1, 'Rayfal', 'Matematika Murni', 'Aku Cinta Matematika', 'Gramedia', '2024-08-14', '2025-02-14', 0.00),
(2, 'Yasa', 'Teknik Informatika', 'Grammar & TOEFL', 'Erlangga', '2024-11-22', '2025-02-10', 0.00),
(3, 'Hammam', 'Teknik Komputasi', 'Basis Data', 'Rajawali Press', '2025-01-05', '2025-03-29', 0.00),
(4, 'Sabil', 'Teknik Kelautan', 'Ragam Ikan di Dunia', 'Gramedia', '2025-03-01', '2025-04-02', 0.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `anggotaa`
--
ALTER TABLE `anggotaa`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_penerbit` (`id_penerbit`);

--
-- Indexes for table `bukuu`
--
ALTER TABLE `bukuu`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `dendaa`
--
ALTER TABLE `dendaa`
  ADD PRIMARY KEY (`id_denda`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `peminjamann`
--
ALTER TABLE `peminjamann`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `transaksipeminjaman`
--
ALTER TABLE `transaksipeminjaman`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggotaa`
--
ALTER TABLE `anggotaa`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bukuu`
--
ALTER TABLE `bukuu`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dendaa`
--
ALTER TABLE `dendaa`
  MODIFY `id_denda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjamann`
--
ALTER TABLE `peminjamann`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksipeminjaman`
--
ALTER TABLE `transaksipeminjaman`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_penerbit` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);

--
-- Constraints for table `dendaa`
--
ALTER TABLE `dendaa`
  ADD CONSTRAINT `dendaa_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjamann` (`id_peminjaman`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `peminjamann`
--
ALTER TABLE `peminjamann`
  ADD CONSTRAINT `peminjamann_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggotaa` (`id_anggota`),
  ADD CONSTRAINT `peminjamann_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `bukuu` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
