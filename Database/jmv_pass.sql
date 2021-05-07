-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: mai 07, 2021 la 12:27 PM
-- Versiune server: 10.4.18-MariaDB
-- Versiune PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `jmv_pass`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orders`
--

CREATE TABLE `orders` (
  `name` varchar(50) NOT NULL,
  `phone_number` int(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `weight` varchar(30) NOT NULL,
  `content` varchar(100) NOT NULL,
  `standard/express` varchar(10) NOT NULL,
  `cash/account_reimbursement` varchar(25) NOT NULL,
  `area` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `orders`
--

INSERT INTO `orders` (`name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `area`, `status`, `id`) VALUES
('Ioana Ursachi', 765798937, 'Strada Nicolina 6, bloc B2, scara B, etaj 5, apartament 3', '3kg', 'toys', 'standard', 'cash', 'Podu-ros', 'deposited', 7),
('Gabriel Florescu', 754977629, 'Street Vasile Lupu, bloc G1, floor 3, apartment 2', '2,3kg', 'bike parts', 'express', 'account reimbursemen', 'Tatarasi', 'deposited', NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` varchar(10) NOT NULL,
  `phone_number` int(30) NOT NULL,
  `cnp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `username`, `last_name`, `first_name`, `email`, `password`, `role`, `phone_number`, `cnp`) VALUES
(1, 'alin.vezeteu', 'Vezeteu', 'Alexandru-Alin', 'alin.vezeteu@yahoo.ro', '12345678', 'admin', 742395715, 1234567890),
(2, 'andreea.manea', 'Manea', 'Andreea Beatrice', 'andreeamanea66@gmail.com', '87654321', 'admin', 732395842, 9876543210),
(3, 'costin_pelescu', 'Pelescu', 'Costin', 'costin43@gmail.com', '12345678', 'client', 748496715, NULL),
(4, 'maria.pelaru', 'Pelaru', 'Maria Georgiana', 'maria.pelaru@yahoo.com', '12345678', 'operator', 765758746, 1465309278),
(5, 'horia.mihai', 'Horia', 'Mihai', 'mihai.horia@yahoo.com', '12345678', 'operator', 775937029, 6789123453),
(6, 'silviu.manolache66', 'Manolache', 'Silviu Constantin', 'silviu.manolache@yahoo.com', '12345678', 'courier', 776745847, 987654321),
(7, 'ursachi.ioana45', 'Ursachi', 'Ioana', 'ioana.ursachi@yahoo.com', '12345678', 'client', 765798937, NULL);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD KEY `id_client` (`id`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `id_client` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
