-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2025 at 01:28 AM
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
-- Database: `management_olshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_pesanan` (IN `p_id_user` INT, IN `p_tanggal` DATE, IN `p_total` DECIMAL(10,2), IN `p_status` ENUM('Dikirim','Dikemas','Selesai'))   BEGIN
insert into orders (ID_user, Tanggal_pemesanan, Total_harga, Status_pemesanan)
values (p_id_user, p_tanggal, p_total, p_status);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID_pesanan` int(11) NOT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `Tanggal_pemesanan` date DEFAULT NULL,
  `Total_harga` decimal(10,2) DEFAULT NULL,
  `Status_pemesanan` enum('Dikirim','Dikemas','Selesai') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID_pesanan`, `ID_user`, `Tanggal_pemesanan`, `Total_harga`, `Status_pemesanan`) VALUES
(1, 4, '2025-05-07', 96000.00, 'Dikirim'),
(2, 3, '2025-04-09', 11000000.00, 'Selesai'),
(3, 1, '2025-06-01', 7850000.00, 'Selesai'),
(4, 3, '2025-06-02', 30000.00, 'Dikirim'),
(5, 1, '2025-05-29', 64000.00, 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `ID_detail` int(11) NOT NULL,
  `ID_pesanan` int(11) DEFAULT NULL,
  `ID_product` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`ID_detail`, `ID_pesanan`, `ID_product`, `Jumlah`, `Subtotal`) VALUES
(1, 1, 1, 3, 96000.00),
(2, 3, 2, 1, 7850000.00),
(3, 2, 5, 1, 11000000.00),
(4, 4, 3, 4, 30000.00),
(5, 5, 4, 2, 64000.00);

--
-- Triggers `order_detail`
--
DELIMITER $$
CREATE TRIGGER `kurangi_stok` AFTER INSERT ON `order_detail` FOR EACH ROW BEGIN 
update product
set Stok = Stok - new.Jumlah
where ID_product = new.ID_product;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `ID_pembayaran` int(11) NOT NULL,
  `ID_pesanan` int(11) DEFAULT NULL,
  `Metode_pembayaran` enum('Transfer Bank','COD','QRIS') DEFAULT NULL,
  `Status_pembayaran` enum('Pembayaran Berhasil','Menunggu Pembayaran') DEFAULT NULL,
  `Tanggal_pembayaran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`ID_pembayaran`, `ID_pesanan`, `Metode_pembayaran`, `Status_pembayaran`, `Tanggal_pembayaran`) VALUES
(1, 1, 'QRIS', 'Pembayaran Berhasil', '2025-05-07'),
(2, 3, 'COD', 'Pembayaran Berhasil', '2025-06-01'),
(3, 2, 'QRIS', 'Pembayaran Berhasil', '2025-05-09'),
(4, 5, 'Transfer Bank', 'Pembayaran Berhasil', '2025-05-29'),
(5, 4, 'COD', 'Menunggu Pembayaran', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID_product` int(11) NOT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `Kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID_product`, `ID_user`, `Nama`, `Deskripsi`, `Stok`, `Harga`, `Kategori`) VALUES
(1, 2, 'Shampoo anti ketombe', 'Shampoo ini dapat menghilangkan ketombe sampai ke akar akarnya, hingga ke keturunan selanjutnya ', 54, 59000.00, 'Perawatan'),
(2, 5, 'Jam tangan roleng seri RTX 4090', 'Jam tangan canggih ini dilengkapi dengan berbagai fitur unik, seperti dilengkapi dengan proyektor mini serta dapat digunakan sebagai console dalam bermain playstation', 66, 7850000.00, 'Aksesoris'),
(3, 2, 'Indomie Mie Goreng Brebes', 'Mie instan goreng yang terinspirasi dari masakan khas Brebes yaitu Telur Asin, perpaduan Mie yang kenyal dan Telur Asin yang Gurih membuat rasa umami makin kuat', 5542, 7500.00, 'Makanan'),
(4, 5, 'Tissue Handiman', 'Tissue ini terbuat dari bahan yang kokoh sehingga anti sobek dan tidak mudah basah', 44, 32000.00, 'Tisu dan tisu kertas'),
(5, 2, 'Laptop ICherry I3 ', 'Laptop spek dewa ini dapat digunakan untuk menginput data yang penting serta dapat digunakan untuk main zuma', 3, 11000000.00, 'Elektronik');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `ID_pengiriman` int(11) NOT NULL,
  `ID_pesanan` int(11) DEFAULT NULL,
  `Kurir` varchar(25) DEFAULT NULL,
  `No_resi` varchar(30) DEFAULT NULL,
  `Biaya_pengiriman` decimal(10,2) DEFAULT NULL,
  `Alamat_pengiriman` text DEFAULT NULL,
  `Status_pengiriman` enum('Diproses','Dikirim','Dalam Perjalanan','Terkirim','Gagal') DEFAULT NULL,
  `Tanggal_pengiriman` datetime DEFAULT NULL,
  `Tanggal_diterima` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`ID_pengiriman`, `ID_pesanan`, `Kurir`, `No_resi`, `Biaya_pengiriman`, `Alamat_pengiriman`, `Status_pengiriman`, `Tanggal_pengiriman`, `Tanggal_diterima`) VALUES
(1, 1, 'JNT', '224OKT55', 22500.00, 'Jl.Ngalor Ngidul Enten, Sukatani, Lampung', 'Dikirim', '2025-05-08 22:40:34', NULL),
(2, 3, 'JNE', '3350TFGI9', 12000.00, 'Jl.Jenaka Indah I, Pondok Gede, Giwangan\r\n', 'Diproses', NULL, NULL),
(3, 2, 'SPX', '55IUFFW411', 175000.00, 'Jl.Baskara Musik, Mertoyudan, Solo', 'Terkirim', '2025-06-01 11:40:34', '2025-06-05 10:20:34'),
(4, 4, 'JNT', '44FAJCU34', 10000.00, ' Jl.Gatotkaca 5, Temanggung', 'Dikirim', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 5, 'SPX', 'SPX003TFJ4', 24000.00, 'Gg.Kawulo, Prambanan', 'Terkirim', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_user` int(11) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `No_HP` varchar(13) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(25) DEFAULT NULL,
  `Tipe_User` enum('Seller','Costumer') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID_user`, `Nama`, `No_HP`, `Alamat`, `Email`, `Password`, `Tipe_User`) VALUES
(1, 'Yasabuganteng', '088244785592', 'Jl.Jenaka Indah I, Pondok Gede, Giwangan', 'yasaaaaa77@gmail.com', 'auuuu0933', 'Costumer'),
(2, 'Luthfig', '088242599432', 'Jl.Kunto Aji, Meteseh, Jakarta', 'lululutfiggg@gmail.com', 'delapan_8x', 'Seller'),
(3, 'Aldeyann', '083239932741', 'Jl.Baskara Musik, Mertoyudan, Solo', 'alalaldiyannn@gmail.com', '1-8nya2x_ya', 'Costumer'),
(4, 'Luluuuuu', '088678842123', 'Jl.Ngalor Ngidul Enten, Sukatani, Lampung', 'luuuuluuu@gmail.com', 'passwordnyaapaya', 'Costumer'),
(5, 'Sukijan', '0885423485932', 'Jl.Kucing Bakekok, Seturan, Brebes', 'rayrayauro@gmail.com', 'vandraakbar', 'Seller');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID_pesanan`),
  ADD KEY `ID_user` (`ID_user`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`ID_detail`),
  ADD KEY `ID_pesanan` (`ID_pesanan`),
  ADD KEY `ID_product` (`ID_product`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID_pembayaran`),
  ADD KEY `ID_pesanan` (`ID_pesanan`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID_product`),
  ADD KEY `ID_user` (`ID_user`),
  ADD KEY `idx_nama_produk` (`Nama`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`ID_pengiriman`),
  ADD KEY `ID_pesanan` (`ID_pesanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `ID_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `ID_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `ID_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID_user`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`ID_pesanan`) REFERENCES `orders` (`ID_pesanan`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`ID_product`) REFERENCES `product` (`ID_product`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ID_pesanan`) REFERENCES `orders` (`ID_pesanan`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID_user`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`ID_pesanan`) REFERENCES `orders` (`ID_pesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
