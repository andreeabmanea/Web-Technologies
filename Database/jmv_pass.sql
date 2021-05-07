-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2021 at 05:29 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jmv_pass`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id_courier` int(11) NOT NULL,
  `area` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id_courier`, `area`) VALUES
(6, 'Tatarasi'),
(8, 'Podu-Ros'),
(8, 'Nicolina'),
(6, 'Tudor_Vladimirescu');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `weight` varchar(30) NOT NULL,
  `content` varchar(100) NOT NULL,
  `standard/express` varchar(10) NOT NULL,
  `cash/account_reimbursement` varchar(25) NOT NULL,
  `area` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_hour` varchar(15) NOT NULL,
  `id_client` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `area`, `status`, `delivery_date`, `delivery_hour`, `id_client`) VALUES
(1, 'Ioana Ursachi', '0765798937', 'Street Nicolina 6, block B2, B, floor 5, apartment 3', '3kg', 'toys', 'standard', 'cash', 'Podu-Ros', 'deposited', '2021-05-08', '13:00-15:00', 7),
(2, 'Gabriel Florescu', '0765798937', 'Street Vasile Lupu, block G1, floor 3, apartment 2', '2,3kg', 'bike parts', 'express', 'account reimbursemen', 'Tatarasi', 'deposited', '2021-05-07', '09:00-11:00', NULL),
(3, 'Costin Pelescu', '0748496715', 'Boulevard Tudor Vladimirescu 105, block A7, floor 3, apartment 3', '5kg', 'rocks', 'standard', 'cash', 'Tudor_Vladimirescu', 'arrived', '2021-05-07', '11:00-13:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id_order` int(255) NOT NULL,
  `damage` varchar(5) NOT NULL,
  `other_content` varchar(5) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id_order`, `damage`, `other_content`, `comment`) VALUES
(3, 'no', 'yes', 'I found toys in my parcel!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` varchar(10) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `cnp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `last_name`, `first_name`, `email`, `password`, `role`, `phone_number`, `cnp`) VALUES
(1, 'alin.vezeteu', 'Vezeteu', 'Alexandru-Alin', 'alin.vezeteu@yahoo.ro', '12345678', 'admin', '0742395715', 1234567890),
(2, 'andreea.manea', 'Manea', 'Andreea Beatrice', 'andreeamanea66@gmail.com', '12345678', 'admin', '0732395842', 9876543210),
(3, 'costin_pelescu', 'Pelescu', 'Costin', 'costin43@gmail.com', '12345678', 'client', '0748496715', NULL),
(4, 'maria.pelaru', 'Pelaru', 'Maria Georgiana', 'maria.pelaru@yahoo.com', '12345678', 'operator', '0765758746', 1465309278),
(5, 'horia.mihai', 'Horia', 'Mihai', 'mihai.horia@yahoo.com', '12345678', 'operator', '0775937029', 6789123453),
(6, 'silviu.manolache66', 'Manolache', 'Silviu Constantin', 'silviu.manolache@yahoo.com', '12345678', 'courier', '0776745847', 987654321),
(7, 'ursachi.ioana45', 'Ursachi', 'Ioana', 'ioana.ursachi@yahoo.com', '12345678', 'client', '0765798937', NULL),
(8, 'tataru.paul', 'Tataru', 'Paul', 'tataru.paul98@gmail.com', '12345678', 'courier', '0765981031', 4567890123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD KEY `id_courier` (`id_courier`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `id_courier` FOREIGN KEY (`id_courier`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `id_client` FOREIGN KEY (`id_client`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `id_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
