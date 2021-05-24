-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 10:52 PM
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
-- Table structure for table `courier_requests`
--

CREATE TABLE `courier_requests` (
  `id` int(50) NOT NULL,
  `courier_id` int(50) NOT NULL,
  `order_id` int(50) NOT NULL,
  `request` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courier_requests`
--

INSERT INTO `courier_requests` (`id`, `courier_id`, `order_id`, `request`) VALUES
(1, 6, 2, 'postpone delivery by one day'),
(18, 0, 0, 'ok'),
(26, 2147483647, 2147483647, '2233489997454'),
(27, 2147483647, 2147483647, '2233489997454'),
(28, 2147483647, 2147483647, '2233489997454'),
(29, 2147483647, 2147483647, '2233489997454');

-- --------------------------------------------------------

--
-- Table structure for table `hour_change`
--

CREATE TABLE `hour_change` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `initial_hour` varchar(15) NOT NULL,
  `new_hour` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hour_change`
--

INSERT INTO `hour_change` (`id`, `id_order`, `initial_hour`, `new_hour`) VALUES
(1, 1, '13:00-15:00', '11:00-13:00'),
(2, 1, '13:00-15:00', '09:00-11:00'),
(3, 2, '09:00-11:00', '11:00-13:00');

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
  `amount` float DEFAULT NULL,
  `area` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_hour` varchar(15) NOT NULL,
  `AWB` varchar(50) NOT NULL,
  `id_client` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `amount`, `area`, `status`, `delivery_date`, `delivery_hour`, `AWB`, `id_client`) VALUES
(1, 'Ioana Ursachi', '0765798937', 'Street Nicolina 6, block B2, B, floor 5, apartment 3', '3kg', 'toys', 'standard', 'cash', 49.99, 'Podu-Ros', 'processed', '2021-05-12', '13:00-15:00', '2233489997453', 7),
(2, 'Gabriel Florescu', '0765798937', 'Street Vasile Lupu, block G1, floor 3, apartment 2', '2,3kg', 'bike parts', 'express', 'account reimbursemen', NULL, 'Tatarasi', 'arrived', '2021-05-12', '09:00-11:00', '2233489997454', NULL),
(3, 'Costin Pelescu', '0748496715', 'Boulevard Tudor Vladimirescu 105, block A7, floor 3, apartment 3', '5kg', 'rocks', 'standard', 'cash', 62.5, 'Tudor_Vladimirescu', 'deposited', '2021-05-12', '11:00-13:00', '2233489997451', 3),
(4, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 15', '2kg', 'make-up', 'standard', 'cash', 50, 'Pacurari', 'deposited', '2021-10-24', '13:00-15:00', '2702929674883', 1),
(5, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 16', '2kg', 'make-up', 'standard', 'cash', 22, 'Pacurari', 'deposited', '2021-04-04', '13:00-15:00', '5516232457474', 1),
(6, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 17', '2kg', 'make-up', 'standard', 'cash', 35, 'Pacurari', 'deposited', '2021-10-04', '13:00-15:00', '5116045727476', 1),
(7, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 18', '2kg', 'make-up', 'standard', 'cash', 49, 'Pacurari', 'deposited', '2021-01-09', '13:00-15:00', '2429311315189', 1),
(8, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 19', '2kg', 'make-up', 'standard', 'cash', 38, 'Pacurari', 'deposited', '2021-11-03', '13:00-15:00', '6915235651015', 1),
(9, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 20', '2kg', 'make-up', 'standard', 'cash', 39, 'Pacurari', 'deposited', '2021-08-05', '13:00-15:00', '5296773926363', 1),
(10, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 21', '2kg', 'make-up', 'standard', 'cash', 21, 'Pacurari', 'deposited', '2021-08-06', '13:00-15:00', '4570871104515', 1),
(11, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 22', '2kg', 'make-up', 'standard', 'cash', 38, 'Pacurari', 'deposited', '2021-06-24', '13:00-15:00', '8481307620266', 1),
(12, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 23', '2kg', 'make-up', 'standard', 'cash', 48, 'Pacurari', 'deposited', '2021-01-17', '13:00-15:00', '5840549272338', 1),
(13, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 24', '2kg', 'make-up', 'standard', 'cash', 41, 'Pacurari', 'deposited', '2021-02-18', '13:00-15:00', '7157588507630', 1),
(14, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 25', '2kg', 'make-up', 'standard', 'cash', 34, 'Pacurari', 'deposited', '2021-08-27', '13:00-15:00', '5683489722955', 1),
(15, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 26', '2kg', 'make-up', 'standard', 'cash', 36, 'Pacurari', 'deposited', '2021-05-10', '13:00-15:00', '6605594328407', 1),
(16, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 27', '2kg', 'make-up', 'standard', 'cash', 28, 'Pacurari', 'deposited', '2021-11-15', '13:00-15:00', '3442366449035', 1),
(17, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 28', '2kg', 'make-up', 'standard', 'cash', 28, 'Pacurari', 'deposited', '2021-10-28', '13:00-15:00', '7495946701911', 1),
(18, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 29', '2kg', 'make-up', 'standard', 'cash', 24, 'Pacurari', 'deposited', '2021-02-07', '13:00-15:00', '6312710894045', 1),
(19, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 30', '2kg', 'make-up', 'standard', 'cash', 32, 'Pacurari', 'deposited', '2021-05-01', '13:00-15:00', '8336389889934', 1),
(20, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 31', '2kg', 'make-up', 'standard', 'cash', 35, 'Pacurari', 'deposited', '2021-08-20', '13:00-15:00', '6273113879035', 1),
(21, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 32', '2kg', 'make-up', 'standard', 'cash', 13, 'Pacurari', 'deposited', '2021-04-06', '13:00-15:00', '5227010443166', 1),
(22, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 33', '2kg', 'make-up', 'standard', 'cash', 46, 'Pacurari', 'deposited', '2021-09-10', '13:00-15:00', '3342761156625', 1),
(23, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 34', '2kg', 'make-up', 'standard', 'cash', 16, 'Pacurari', 'deposited', '2021-11-07', '13:00-15:00', '8742378576872', 1),
(24, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 35', '2kg', 'make-up', 'standard', 'cash', 48, 'Pacurari', 'deposited', '2021-02-12', '13:00-15:00', '2113051664796', 1),
(25, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 36', '2kg', 'make-up', 'standard', 'cash', 26, 'Pacurari', 'deposited', '2021-03-06', '13:00-15:00', '8522806167906', 1),
(26, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 37', '2kg', 'make-up', 'standard', 'cash', 48, 'Pacurari', 'deposited', '2021-08-03', '13:00-15:00', '3610712460203', 1),
(27, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 38', '2kg', 'make-up', 'standard', 'cash', 29, 'Pacurari', 'deposited', '2021-09-06', '13:00-15:00', '5087629075572', 1),
(28, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 39', '2kg', 'make-up', 'standard', 'cash', 23, 'Pacurari', 'deposited', '2021-11-20', '13:00-15:00', '4881381436582', 1),
(29, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 40', '2kg', 'make-up', 'standard', 'cash', 35, 'Pacurari', 'deposited', '2021-04-25', '13:00-15:00', '4975922750463', 1),
(30, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 41', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-22', '13:00-15:00', '8722373110298', 1),
(31, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 42', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-15', '13:00-15:00', '8241378998310', 1),
(32, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 43', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-07-09', '13:00-15:00', '4275459253730', 1),
(33, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 44', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-03', '13:00-15:00', '6167027138607', 1),
(34, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 45', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-28', '13:00-15:00', '4046036306381', 1),
(35, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 46', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-20', '13:00-15:00', '2082872244178', 1),
(36, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 47', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-10-06', '13:00-15:00', '6221948768804', 1),
(37, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 48', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-06', '13:00-15:00', '4047913413353', 1),
(38, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 49', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-09-11', '13:00-15:00', '3098293021814', 1),
(39, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 50', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-07-13', '13:00-15:00', '4751922908876', 1),
(40, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 51', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-05', '13:00-15:00', '4195422457078', 1),
(41, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 52', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-08-10', '13:00-15:00', '6078161789813', 1),
(42, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 53', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-03', '13:00-15:00', '5304662068777', 1),
(43, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 54', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-04', '13:00-15:00', '7794129410491', 1),
(44, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 55', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-10-23', '13:00-15:00', '4775354881575', 1),
(45, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 56', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-23', '13:00-15:00', '2673607076286', 1),
(46, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 57', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-18', '13:00-15:00', '3730104776652', 1),
(47, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 58', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-30', '13:00-15:00', '8041649169903', 1),
(48, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 59', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-12-03', '13:00-15:00', '2471627156418', 1),
(49, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 60', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-12-13', '13:00-15:00', '3238680141870', 1),
(50, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 61', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-15', '13:00-15:00', '5830536091349', 1),
(51, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 62', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-01', '13:00-15:00', '6456186439653', 1),
(52, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 63', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-10-12', '13:00-15:00', '3851593721089', 1),
(53, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 64', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-07', '13:00-15:00', '7862302795558', 1),
(54, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 65', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-29', '13:00-15:00', '6576258964423', 1),
(55, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 66', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-27', '13:00-15:00', '2140341523643', 1),
(56, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 67', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-13', '13:00-15:00', '6348442483240', 1),
(57, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 68', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-30', '13:00-15:00', '3658385943425', 1),
(58, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 69', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-17', '13:00-15:00', '7441792921319', 1),
(59, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 70', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-12', '13:00-15:00', '7296710222847', 1),
(60, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 71', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-10-26', '13:00-15:00', '5821005450647', 1),
(61, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 72', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-13', '13:00-15:00', '3727096185078', 1),
(62, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 73', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-05', '13:00-15:00', '2743882818098', 1),
(63, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 74', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-12-31', '13:00-15:00', '6081110695702', 1),
(64, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 75', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-22', '13:00-15:00', '8969364486856', 1),
(65, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 76', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-21', '13:00-15:00', '6801924124686', 1),
(66, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 77', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-03', '13:00-15:00', '7640519439786', 1),
(67, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 78', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-24', '13:00-15:00', '4057065326138', 1),
(68, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 79', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-16', '13:00-15:00', '5088514706256', 1),
(69, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 80', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-18', '13:00-15:00', '8830203703166', 1),
(70, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 81', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-17', '13:00-15:00', '7778615538625', 1),
(71, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 82', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-22', '13:00-15:00', '4313148232482', 1),
(72, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 83', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-08-22', '13:00-15:00', '4364041542602', 1),
(73, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 84', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-12-24', '13:00-15:00', '4011101543401', 1),
(74, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 85', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-09-03', '13:00-15:00', '2096529637911', 1),
(75, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 86', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-05-08', '13:00-15:00', '7253058835446', 1),
(76, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 87', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-12-28', '13:00-15:00', '2979184838965', 1),
(77, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 88', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-27', '13:00-15:00', '7185208626096', 1),
(78, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 89', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-14', '13:00-15:00', '2649939740435', 1),
(79, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 90', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-09-10', '13:00-15:00', '4610268183770', 1),
(80, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 91', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-06', '13:00-15:00', '5711850416960', 1),
(81, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 92', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-17', '13:00-15:00', '7933738183255', 1),
(82, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 93', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-11', '13:00-15:00', '5535619848466', 1),
(83, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 94', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-09-02', '13:00-15:00', '5374832754328', 1),
(84, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 95', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-23', '13:00-15:00', '2453057490851', 1),
(85, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 96', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-08-29', '13:00-15:00', '3302947028551', 1),
(86, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 97', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-26', '13:00-15:00', '2037478110535', 1),
(87, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 98', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-07-10', '13:00-15:00', '7049455687281', 1),
(88, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 99', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-14', '13:00-15:00', '8174989428953', 1),
(89, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 100', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-12-19', '13:00-15:00', '3720767555078', 1),
(90, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 101', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-23', '13:00-15:00', '3012772703979', 1),
(91, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 102', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-08-08', '13:00-15:00', '6975124693386', 1),
(92, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 103', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-08', '13:00-15:00', '5317244165642', 1),
(93, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 104', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-07-14', '13:00-15:00', '5417752951655', 1),
(94, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 105', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-09-07', '13:00-15:00', '5273721270665', 1),
(95, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 106', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-20', '13:00-15:00', '5383642372495', 1),
(96, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 107', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-15', '13:00-15:00', '7344062579082', 1),
(97, 'Ilinca Varlan', '748496715', 'Str. Pacurari nr. 108', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-03-20', '13:00-15:00', '8503306120462', 1),
(98, 'Paul Duruc', '748496715', 'Str. Pacurari nr. 109', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-09-25', '13:00-15:00', '4300778536055', 1),
(99, 'Paul Ioan', '748496715', 'Str. Pacurari nr. 110', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-01-14', '13:00-15:00', '2345111879172', 1),
(100, 'Paul Alexandru', '748496715', 'Str. Pacurari nr. 111', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-10-31', '13:00-15:00', '8353241487831', 1),
(101, 'Paul Oprea', '748496715', 'Str. Pacurari nr. 112', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-05-05', '13:00-15:00', '8780780817942', 1),
(102, 'Paul Stefan', '748496715', 'Str. Pacurari nr. 113', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-19', '13:00-15:00', '7048659951065', 1),
(103, 'Paul Liviu', '748496715', 'Str. Pacurari nr. 114', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-29', '13:00-15:00', '3882926232460', 1),
(104, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 115', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-28', '13:00-15:00', '4089117173593', 1),
(105, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 116', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-02-09', '13:00-15:00', '7411408349838', 1),
(106, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 117', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-04-09', '13:00-15:00', '4874742956454', 1),
(107, 'Paul Alexe', '748496715', 'Str. Pacurari nr. 118', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-07-23', '13:00-15:00', '7227061359718', 1),
(108, 'Andreea Simon', '748496715', 'Str. Pacurari nr. 119', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-11-11', '13:00-15:00', '3527436133264', 1),
(109, 'Ioana Blanaru', '748496715', 'Str. Pacurari nr. 120', '2kg', 'make-up', 'express', 'account reimb', 0, 'Pacurari', 'deposited', '2021-06-10', '13:00-15:00', '3657123908877', 1),
(110, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 1', '1kg', 'clothes', 'standard', 'cash', 34, 'Tatarasi', 'deposited', '2021-09-18', '13:00-15:00', '8731785014109', 1),
(111, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 2', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-01-24', '13:00-15:00', '6468454785675', 1),
(112, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 3', '1kg', 'clothes', 'standard', 'cash', 22, 'Tatarasi', 'deposited', '2021-10-29', '13:00-15:00', '5359108658888', 1),
(113, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 4', '1kg', 'clothes', 'standard', 'cash', 33, 'Tatarasi', 'deposited', '2021-07-04', '13:00-15:00', '5146229060014', 1),
(114, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 5', '1kg', 'clothes', 'standard', 'cash', 40, 'Tatarasi', 'deposited', '2021-10-01', '13:00-15:00', '8722948552220', 1),
(115, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 6', '1kg', 'clothes', 'standard', 'cash', 37, 'Tatarasi', 'deposited', '2021-02-03', '13:00-15:00', '2763002216894', 1),
(116, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 7', '1kg', 'clothes', 'standard', 'cash', 17, 'Tatarasi', 'deposited', '2021-04-21', '13:00-15:00', '3202770655669', 1),
(117, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 8', '1kg', 'clothes', 'standard', 'cash', 24, 'Tatarasi', 'deposited', '2021-02-05', '13:00-15:00', '6413449415533', 1),
(118, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 9', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-04-22', '13:00-15:00', '7916929531569', 1),
(119, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 10', '1kg', 'clothes', 'standard', 'cash', 24, 'Tatarasi', 'deposited', '2021-02-06', '13:00-15:00', '6713191523623', 1),
(120, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 11', '1kg', 'clothes', 'standard', 'cash', 27, 'Tatarasi', 'deposited', '2021-03-17', '13:00-15:00', '4222758896790', 1),
(121, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 12', '1kg', 'clothes', 'standard', 'cash', 10, 'Tatarasi', 'deposited', '2021-08-03', '13:00-15:00', '6867309486762', 1),
(122, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 13', '1kg', 'clothes', 'standard', 'cash', 23, 'Tatarasi', 'deposited', '2021-10-21', '13:00-15:00', '3964542721150', 1),
(123, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 14', '1kg', 'clothes', 'standard', 'cash', 30, 'Tatarasi', 'deposited', '2021-01-14', '13:00-15:00', '7628639064080', 1),
(124, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 15', '1kg', 'clothes', 'standard', 'cash', 11, 'Tatarasi', 'deposited', '2021-05-06', '13:00-15:00', '8019535931326', 1),
(125, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 16', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-07-09', '13:00-15:00', '8832865800914', 1),
(126, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 17', '1kg', 'clothes', 'standard', 'cash', 43, 'Tatarasi', 'deposited', '2021-08-13', '13:00-15:00', '8545417131779', 1),
(127, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 18', '1kg', 'clothes', 'standard', 'cash', 22, 'Tatarasi', 'deposited', '2021-09-18', '13:00-15:00', '2033782119169', 1),
(128, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 19', '1kg', 'clothes', 'standard', 'cash', 15, 'Tatarasi', 'deposited', '2021-11-07', '13:00-15:00', '8193776745175', 1),
(129, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 20', '1kg', 'clothes', 'standard', 'cash', 10, 'Tatarasi', 'deposited', '2021-09-11', '13:00-15:00', '2906706599125', 1),
(130, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 21', '1kg', 'clothes', 'standard', 'cash', 42, 'Tatarasi', 'deposited', '2021-11-07', '13:00-15:00', '8004514833859', 1),
(131, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 22', '1kg', 'clothes', 'standard', 'cash', 29, 'Tatarasi', 'deposited', '2021-11-17', '13:00-15:00', '2051726968135', 1),
(132, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 23', '1kg', 'clothes', 'standard', 'cash', 38, 'Tatarasi', 'deposited', '2021-10-23', '13:00-15:00', '4863263480365', 1),
(133, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 24', '1kg', 'clothes', 'standard', 'cash', 38, 'Tatarasi', 'deposited', '2021-04-02', '13:00-15:00', '8543743245338', 1),
(134, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 25', '1kg', 'clothes', 'standard', 'cash', 24, 'Tatarasi', 'deposited', '2021-01-31', '13:00-15:00', '4712987326138', 1),
(135, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 26', '1kg', 'clothes', 'standard', 'cash', 18, 'Tatarasi', 'deposited', '2021-09-02', '13:00-15:00', '8147741382311', 1),
(136, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 27', '1kg', 'clothes', 'standard', 'cash', 49, 'Tatarasi', 'deposited', '2021-04-22', '13:00-15:00', '4633411503449', 1),
(137, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 28', '1kg', 'clothes', 'standard', 'cash', 42, 'Tatarasi', 'deposited', '2021-06-04', '13:00-15:00', '5571684666604', 1),
(138, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 29', '1kg', 'clothes', 'standard', 'cash', 34, 'Tatarasi', 'deposited', '2021-10-30', '13:00-15:00', '6706437825833', 1),
(139, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 30', '1kg', 'clothes', 'standard', 'cash', 18, 'Tatarasi', 'deposited', '2021-07-22', '13:00-15:00', '6164124727231', 1),
(140, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 31', '1kg', 'clothes', 'standard', 'cash', 45, 'Tatarasi', 'deposited', '2021-09-03', '13:00-15:00', '7087680622754', 1),
(141, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 32', '1kg', 'clothes', 'standard', 'cash', 32, 'Tatarasi', 'deposited', '2021-07-08', '13:00-15:00', '5199206199060', 1),
(142, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 33', '1kg', 'clothes', 'standard', 'cash', 29, 'Tatarasi', 'deposited', '2021-07-31', '13:00-15:00', '5015968028933', 1),
(143, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 34', '1kg', 'clothes', 'standard', 'cash', 18, 'Tatarasi', 'deposited', '2021-05-26', '13:00-15:00', '2620178638017', 1),
(144, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 35', '1kg', 'clothes', 'standard', 'cash', 36, 'Tatarasi', 'deposited', '2021-08-28', '13:00-15:00', '5773304801681', 1),
(145, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 36', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-03-14', '13:00-15:00', '6047687386338', 1),
(146, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 37', '1kg', 'clothes', 'standard', 'cash', 39, 'Tatarasi', 'deposited', '2021-04-13', '13:00-15:00', '5813436101872', 1),
(147, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 38', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-02-17', '13:00-15:00', '7886746799989', 1),
(148, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 39', '1kg', 'clothes', 'standard', 'cash', 36, 'Tatarasi', 'deposited', '2021-05-22', '13:00-15:00', '3910702718325', 1),
(149, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 40', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-05-19', '13:00-15:00', '2794015006293', 1),
(150, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 41', '1kg', 'clothes', 'standard', 'cash', 22, 'Tatarasi', 'deposited', '2021-12-02', '13:00-15:00', '5042160086523', 1),
(151, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 42', '1kg', 'clothes', 'standard', 'cash', 49, 'Tatarasi', 'deposited', '2021-03-27', '13:00-15:00', '8074280374372', 1),
(152, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 43', '1kg', 'clothes', 'standard', 'cash', 26, 'Tatarasi', 'deposited', '2021-11-22', '13:00-15:00', '2651613318262', 1),
(153, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 44', '1kg', 'clothes', 'standard', 'cash', 33, 'Tatarasi', 'deposited', '2021-10-09', '13:00-15:00', '8163309737897', 1),
(154, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 45', '1kg', 'clothes', 'standard', 'cash', 37, 'Tatarasi', 'deposited', '2021-09-23', '13:00-15:00', '8597856473098', 1),
(155, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 46', '1kg', 'clothes', 'standard', 'cash', 27, 'Tatarasi', 'deposited', '2021-06-22', '13:00-15:00', '4296631495482', 1),
(156, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 47', '1kg', 'clothes', 'standard', 'cash', 49, 'Tatarasi', 'deposited', '2021-11-24', '13:00-15:00', '2651427587272', 1),
(157, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 48', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-10-05', '13:00-15:00', '4255557137287', 1),
(158, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 49', '1kg', 'clothes', 'standard', 'cash', 27, 'Tatarasi', 'deposited', '2021-03-13', '13:00-15:00', '6361907106950', 1),
(159, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 50', '1kg', 'clothes', 'standard', 'cash', 15, 'Tatarasi', 'deposited', '2021-04-28', '13:00-15:00', '2389768305103', 1),
(160, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 51', '1kg', 'clothes', 'standard', 'cash', 42, 'Tatarasi', 'deposited', '2021-04-09', '13:00-15:00', '2005368374292', 1),
(161, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 52', '1kg', 'clothes', 'standard', 'cash', 30, 'Tatarasi', 'deposited', '2021-05-04', '13:00-15:00', '3528987612038', 1),
(162, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 53', '1kg', 'clothes', 'standard', 'cash', 19, 'Tatarasi', 'deposited', '2021-08-25', '13:00-15:00', '8470102705055', 1),
(163, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 54', '1kg', 'clothes', 'standard', 'cash', 12, 'Tatarasi', 'deposited', '2021-01-19', '13:00-15:00', '2175344624329', 1),
(164, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 55', '1kg', 'clothes', 'standard', 'cash', 32, 'Tatarasi', 'deposited', '2021-04-17', '13:00-15:00', '6226102240293', 1),
(165, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 56', '1kg', 'clothes', 'standard', 'cash', 29, 'Tatarasi', 'deposited', '2021-08-29', '13:00-15:00', '7195666192170', 1),
(166, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 57', '1kg', 'clothes', 'standard', 'cash', 38, 'Tatarasi', 'deposited', '2021-09-26', '13:00-15:00', '7124815249547', 1),
(167, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 58', '1kg', 'clothes', 'standard', 'cash', 10, 'Tatarasi', 'deposited', '2021-11-03', '13:00-15:00', '2963553937353', 1),
(168, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 59', '1kg', 'clothes', 'standard', 'cash', 21, 'Tatarasi', 'deposited', '2021-05-17', '13:00-15:00', '6912041816781', 1),
(169, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 60', '1kg', 'clothes', 'standard', 'cash', 16, 'Tatarasi', 'deposited', '2021-04-09', '13:00-15:00', '6311125476286', 1),
(170, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 61', '1kg', 'clothes', 'standard', 'cash', 46, 'Tatarasi', 'deposited', '2021-06-18', '13:00-15:00', '3027108571712', 1),
(171, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 62', '1kg', 'clothes', 'standard', 'cash', 40, 'Tatarasi', 'deposited', '2021-01-09', '13:00-15:00', '7187937211339', 1),
(172, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 63', '1kg', 'clothes', 'standard', 'cash', 28, 'Tatarasi', 'deposited', '2021-06-28', '13:00-15:00', '8071031552176', 1),
(173, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 64', '1kg', 'clothes', 'standard', 'cash', 35, 'Tatarasi', 'deposited', '2021-03-04', '13:00-15:00', '4459986031801', 1),
(174, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 65', '1kg', 'clothes', 'standard', 'cash', 16, 'Tatarasi', 'deposited', '2021-11-01', '13:00-15:00', '3117595587620', 1),
(175, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 66', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-05-14', '13:00-15:00', '8856804607386', 1),
(176, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 67', '1kg', 'clothes', 'standard', 'cash', 26, 'Tatarasi', 'deposited', '2021-10-16', '13:00-15:00', '6723288150409', 1),
(177, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 68', '1kg', 'clothes', 'standard', 'cash', 33, 'Tatarasi', 'deposited', '2021-08-17', '13:00-15:00', '8653378819809', 1),
(178, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 69', '1kg', 'clothes', 'standard', 'cash', 23, 'Tatarasi', 'deposited', '2021-05-01', '13:00-15:00', '2770915157138', 1),
(179, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 70', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-03-20', '13:00-15:00', '4891677147956', 1),
(180, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 71', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-06-08', '13:00-15:00', '4410394470639', 1),
(181, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 72', '1kg', 'clothes', 'standard', 'cash', 44, 'Tatarasi', 'deposited', '2021-02-15', '13:00-15:00', '8861602006594', 1),
(182, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 73', '1kg', 'clothes', 'standard', 'cash', 20, 'Tatarasi', 'deposited', '2021-08-04', '13:00-15:00', '4888493651614', 1),
(183, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 74', '1kg', 'clothes', 'standard', 'cash', 18, 'Tatarasi', 'deposited', '2021-08-17', '13:00-15:00', '4402643483214', 1),
(184, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 75', '1kg', 'clothes', 'standard', 'cash', 42, 'Tatarasi', 'deposited', '2021-07-18', '13:00-15:00', '8583829357178', 1),
(185, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 76', '1kg', 'clothes', 'standard', 'cash', 49, 'Tatarasi', 'deposited', '2021-12-04', '13:00-15:00', '6506810858176', 1),
(186, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 77', '1kg', 'clothes', 'standard', 'cash', 29, 'Tatarasi', 'deposited', '2021-09-17', '13:00-15:00', '2477822136392', 1),
(187, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 78', '1kg', 'clothes', 'standard', 'cash', 39, 'Tatarasi', 'deposited', '2021-09-14', '13:00-15:00', '8523770829417', 1),
(188, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 79', '1kg', 'clothes', 'standard', 'cash', 17, 'Tatarasi', 'deposited', '2021-08-28', '13:00-15:00', '4536940784225', 1),
(189, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 80', '1kg', 'clothes', 'standard', 'cash', 28, 'Tatarasi', 'deposited', '2021-06-01', '13:00-15:00', '4235654395939', 1),
(190, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 81', '1kg', 'clothes', 'standard', 'cash', 20, 'Tatarasi', 'deposited', '2021-07-05', '13:00-15:00', '8293778817992', 1),
(191, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 82', '1kg', 'clothes', 'standard', 'cash', 24, 'Tatarasi', 'deposited', '2021-12-16', '13:00-15:00', '5598699800743', 1),
(192, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 83', '1kg', 'clothes', 'standard', 'cash', 27, 'Tatarasi', 'deposited', '2021-10-07', '13:00-15:00', '4578454397681', 1),
(193, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 84', '1kg', 'clothes', 'standard', 'cash', 37, 'Tatarasi', 'deposited', '2021-11-18', '13:00-15:00', '2380644256310', 1),
(194, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 85', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-12-11', '13:00-15:00', '3948581124354', 1),
(195, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 86', '1kg', 'clothes', 'standard', 'cash', 34, 'Tatarasi', 'deposited', '2021-01-23', '13:00-15:00', '5267297001786', 1),
(196, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 87', '1kg', 'clothes', 'standard', 'cash', 16, 'Tatarasi', 'deposited', '2021-03-16', '13:00-15:00', '7523534406132', 1),
(197, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 88', '1kg', 'clothes', 'standard', 'cash', 36, 'Tatarasi', 'deposited', '2021-05-18', '13:00-15:00', '6701655038249', 1),
(198, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 89', '1kg', 'clothes', 'standard', 'cash', 30, 'Tatarasi', 'deposited', '2021-09-04', '13:00-15:00', '4571760080935', 1),
(199, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 90', '1kg', 'clothes', 'standard', 'cash', 26, 'Tatarasi', 'deposited', '2021-02-15', '13:00-15:00', '6358729381120', 1),
(200, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 91', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-04-02', '13:00-15:00', '8300098216558', 1),
(201, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 92', '1kg', 'clothes', 'standard', 'cash', 11, 'Tatarasi', 'deposited', '2021-01-21', '13:00-15:00', '5275322499894', 1),
(202, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 93', '1kg', 'clothes', 'standard', 'cash', 30, 'Tatarasi', 'deposited', '2021-04-29', '13:00-15:00', '5620100354646', 1),
(203, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 94', '1kg', 'clothes', 'standard', 'cash', 37, 'Tatarasi', 'deposited', '2021-07-08', '13:00-15:00', '5444568290105', 1),
(204, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 95', '1kg', 'clothes', 'standard', 'cash', 18, 'Tatarasi', 'deposited', '2021-04-18', '13:00-15:00', '6533511347441', 1),
(205, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 96', '1kg', 'clothes', 'standard', 'cash', 48, 'Tatarasi', 'deposited', '2021-10-06', '13:00-15:00', '8770225967190', 1),
(206, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 97', '1kg', 'clothes', 'standard', 'cash', 50, 'Tatarasi', 'deposited', '2021-09-04', '13:00-15:00', '5799796543320', 1),
(207, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 98', '1kg', 'clothes', 'standard', 'cash', 14, 'Tatarasi', 'deposited', '2021-06-10', '13:00-15:00', '5447522791151', 1),
(208, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 99', '1kg', 'clothes', 'standard', 'cash', 36, 'Tatarasi', 'deposited', '2021-10-24', '13:00-15:00', '2381972402318', 1),
(209, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 100', '1kg', 'clothes', 'standard', 'cash', 15, 'Tatarasi', 'deposited', '2021-08-20', '13:00-15:00', '7809604333400', 1),
(210, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 101', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-06-04', '13:00-15:00', '2269129976898', 1),
(211, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 102', '1kg', 'clothes', 'standard', 'cash', 36, 'Tatarasi', 'deposited', '2021-07-12', '13:00-15:00', '8837142059106', 1),
(212, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 103', '1kg', 'clothes', 'standard', 'cash', 29, 'Tatarasi', 'deposited', '2021-03-09', '13:00-15:00', '6647824647312', 1),
(213, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 104', '1kg', 'clothes', 'standard', 'cash', 44, 'Tatarasi', 'deposited', '2021-03-12', '13:00-15:00', '7680977122582', 1),
(214, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 105', '1kg', 'clothes', 'standard', 'cash', 33, 'Tatarasi', 'deposited', '2021-07-21', '13:00-15:00', '7339774014392', 1),
(215, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 106', '1kg', 'clothes', 'standard', 'cash', 12, 'Tatarasi', 'deposited', '2021-04-13', '13:00-15:00', '2673322915565', 1),
(216, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 107', '1kg', 'clothes', 'standard', 'cash', 50, 'Tatarasi', 'deposited', '2021-08-20', '13:00-15:00', '4286714358121', 1),
(217, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 108', '1kg', 'clothes', 'standard', 'cash', 27, 'Tatarasi', 'deposited', '2021-10-15', '13:00-15:00', '6303405112705', 1),
(218, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 109', '1kg', 'clothes', 'standard', 'cash', 35, 'Tatarasi', 'deposited', '2021-08-16', '13:00-15:00', '4788395096213', 1),
(219, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 110', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-08-06', '13:00-15:00', '5081696860055', 1),
(220, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 111', '1kg', 'clothes', 'standard', 'cash', 29, 'Tatarasi', 'deposited', '2021-02-08', '13:00-15:00', '8876940417692', 1),
(221, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 112', '1kg', 'clothes', 'standard', 'cash', 26, 'Tatarasi', 'deposited', '2021-02-09', '13:00-15:00', '6108243672612', 1),
(222, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 113', '1kg', 'clothes', 'standard', 'cash', 23, 'Tatarasi', 'deposited', '2021-07-03', '13:00-15:00', '6627512764888', 1),
(223, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 114', '1kg', 'clothes', 'standard', 'cash', 39, 'Tatarasi', 'deposited', '2021-05-29', '13:00-15:00', '8661965600019', 1),
(224, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 115', '1kg', 'clothes', 'standard', 'cash', 17, 'Tatarasi', 'deposited', '2021-01-13', '13:00-15:00', '4395524578138', 1),
(225, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 116', '1kg', 'clothes', 'standard', 'cash', 26, 'Tatarasi', 'deposited', '2021-05-01', '13:00-15:00', '5328109794301', 1),
(226, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 117', '1kg', 'clothes', 'standard', 'cash', 26, 'Tatarasi', 'deposited', '2021-02-24', '13:00-15:00', '7765647251232', 1),
(227, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 118', '1kg', 'clothes', 'standard', 'cash', 38, 'Tatarasi', 'deposited', '2021-04-09', '13:00-15:00', '7840994602710', 1),
(228, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 119', '1kg', 'clothes', 'standard', 'cash', 43, 'Tatarasi', 'deposited', '2021-04-10', '13:00-15:00', '5775457843820', 1),
(229, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 120', '1kg', 'clothes', 'standard', 'cash', 21, 'Tatarasi', 'deposited', '2021-08-06', '13:00-15:00', '8121400902451', 1),
(230, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 121', '1kg', 'clothes', 'standard', 'cash', 16, 'Tatarasi', 'deposited', '2021-01-29', '13:00-15:00', '3411578505041', 1),
(231, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 122', '1kg', 'clothes', 'standard', 'cash', 42, 'Tatarasi', 'deposited', '2021-10-02', '13:00-15:00', '2286967897817', 1),
(232, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 123', '1kg', 'clothes', 'standard', 'cash', 44, 'Tatarasi', 'deposited', '2021-04-30', '13:00-15:00', '8190259877011', 1),
(233, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 124', '1kg', 'clothes', 'standard', 'cash', 11, 'Tatarasi', 'deposited', '2021-08-09', '13:00-15:00', '5986069270737', 1),
(234, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 125', '1kg', 'clothes', 'standard', 'cash', 25, 'Tatarasi', 'deposited', '2021-01-05', '13:00-15:00', '2346101298187', 1),
(235, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 126', '1kg', 'clothes', 'standard', 'cash', 50, 'Tatarasi', 'deposited', '2021-09-03', '13:00-15:00', '5199147783019', 1),
(236, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 127', '1kg', 'clothes', 'standard', 'cash', 20, 'Tatarasi', 'deposited', '2021-04-28', '13:00-15:00', '7827418601952', 1),
(237, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 128', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-08-31', '13:00-15:00', '7036474858993', 1),
(238, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 129', '1kg', 'clothes', 'standard', 'cash', 49, 'Tatarasi', 'deposited', '2021-02-03', '13:00-15:00', '6296963461609', 1),
(239, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 130', '1kg', 'clothes', 'standard', 'cash', 33, 'Tatarasi', 'deposited', '2021-07-17', '13:00-15:00', '2579778257231', 1),
(240, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 131', '1kg', 'clothes', 'standard', 'cash', 22, 'Tatarasi', 'deposited', '2021-09-08', '13:00-15:00', '3071452740721', 1),
(241, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 132', '1kg', 'clothes', 'standard', 'cash', 32, 'Tatarasi', 'deposited', '2021-11-05', '13:00-15:00', '6931005243712', 1),
(242, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 133', '1kg', 'clothes', 'standard', 'cash', 17, 'Tatarasi', 'deposited', '2021-09-09', '13:00-15:00', '7608727927982', 1),
(243, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 134', '1kg', 'clothes', 'standard', 'cash', 50, 'Tatarasi', 'deposited', '2021-01-07', '13:00-15:00', '4480408411258', 1),
(244, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 135', '1kg', 'clothes', 'standard', 'cash', 22, 'Tatarasi', 'deposited', '2021-09-01', '13:00-15:00', '2520277544611', 1),
(245, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 136', '1kg', 'clothes', 'standard', 'cash', 30, 'Tatarasi', 'deposited', '2021-10-19', '13:00-15:00', '5545769366665', 1),
(246, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 137', '1kg', 'clothes', 'standard', 'cash', 22, 'Tatarasi', 'deposited', '2021-07-17', '13:00-15:00', '2199107063791', 1),
(247, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 138', '1kg', 'clothes', 'standard', 'cash', 11, 'Tatarasi', 'deposited', '2021-11-29', '13:00-15:00', '3694409792371', 1),
(248, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 139', '1kg', 'clothes', 'standard', 'cash', 12, 'Tatarasi', 'deposited', '2021-03-20', '13:00-15:00', '8105223968406', 1),
(249, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 140', '1kg', 'clothes', 'standard', 'cash', 34, 'Tatarasi', 'deposited', '2021-06-08', '13:00-15:00', '6891038421520', 1),
(250, 'Andreea Simon', '748496715', 'Str. Tatarasi nr. 141', '1kg', 'clothes', 'standard', 'cash', 17, 'Tatarasi', 'deposited', '2021-06-11', '13:00-15:00', '4436869253039', 1),
(251, 'Ioana Blanaru', '748496715', 'Str. Tatarasi nr. 142', '1kg', 'clothes', 'standard', 'cash', 15, 'Tatarasi', 'deposited', '2021-12-04', '13:00-15:00', '8440699275063', 1),
(252, 'Ilinca Varlan', '748496715', 'Str. Tatarasi nr. 143', '1kg', 'clothes', 'standard', 'cash', 36, 'Tatarasi', 'deposited', '2021-08-15', '13:00-15:00', '8775500479909', 1),
(253, 'Paul Duruc', '748496715', 'Str. Tatarasi nr. 144', '1kg', 'clothes', 'standard', 'cash', 38, 'Tatarasi', 'deposited', '2021-11-05', '13:00-15:00', '5262225465720', 1),
(254, 'Paul Ioan', '748496715', 'Str. Tatarasi nr. 145', '1kg', 'clothes', 'standard', 'cash', 49, 'Tatarasi', 'deposited', '2021-02-28', '13:00-15:00', '8063724105130', 1),
(255, 'Paul Alexandru', '748496715', 'Str. Tatarasi nr. 146', '1kg', 'clothes', 'standard', 'cash', 18, 'Tatarasi', 'deposited', '2021-06-05', '13:00-15:00', '6250673842982', 1),
(256, 'Paul Oprea', '748496715', 'Str. Tatarasi nr. 147', '1kg', 'clothes', 'standard', 'cash', 13, 'Tatarasi', 'deposited', '2021-08-16', '13:00-15:00', '2742058616940', 1),
(257, 'Paul Stefan', '748496715', 'Str. Tatarasi nr. 148', '1kg', 'clothes', 'standard', 'cash', 23, 'Tatarasi', 'deposited', '2021-10-15', '13:00-15:00', '6206059964734', 1),
(258, 'Paul Liviu', '748496715', 'Str. Tatarasi nr. 149', '1kg', 'clothes', 'standard', 'cash', 43, 'Tatarasi', 'deposited', '2021-08-06', '13:00-15:00', '7613647534515', 1),
(259, 'Paul Alexe', '748496715', 'Str. Tatarasi nr. 150', '1kg', 'clothes', 'standard', 'cash', 43, 'Tatarasi', 'deposited', '2021-07-14', '13:00-15:00', '6531105485909', 1),
(260, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 7', '2kg', 'toys', 'standard', 'cash', 48, 'Bularga', 'deposited', '2021-04-19', '13:00-15:00', '6153759487065', 1),
(261, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 8', '2kg', 'toys', 'standard', 'cash', 26, 'Bularga', 'deposited', '2021-08-18', '13:00-15:00', '2565234774550', 1),
(262, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 9', '2kg', 'toys', 'standard', 'cash', 25, 'Bularga', 'deposited', '2021-07-05', '13:00-15:00', '3957910673564', 1),
(263, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 10', '2kg', 'toys', 'standard', 'cash', 41, 'Bularga', 'deposited', '2021-02-07', '13:00-15:00', '2130234496723', 1),
(264, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 11', '2kg', 'toys', 'standard', 'cash', 28, 'Bularga', 'deposited', '2021-03-14', '13:00-15:00', '8300413095846', 1),
(265, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 12', '2kg', 'toys', 'standard', 'cash', 24, 'Bularga', 'deposited', '2021-10-22', '13:00-15:00', '6641165295593', 1),
(266, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 13', '2kg', 'toys', 'standard', 'cash', 45, 'Bularga', 'deposited', '2021-03-12', '13:00-15:00', '2622634851701', 1),
(267, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 14', '2kg', 'toys', 'standard', 'cash', 26, 'Bularga', 'deposited', '2021-09-04', '13:00-15:00', '3682545743962', 1),
(268, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 15', '2kg', 'toys', 'standard', 'cash', 49, 'Bularga', 'deposited', '2021-08-24', '13:00-15:00', '3002694671759', 1),
(269, 'Paul Oprea', '748496715', 'Str. Atelierului nr. 16', '2kg', 'toys', 'standard', 'cash', 47, 'Bularga', 'deposited', '2021-10-22', '13:00-15:00', '8384623088237', 1),
(270, 'Paul Stefan', '748496715', 'Str. Atelierului nr. 17', '2kg', 'toys', 'standard', 'cash', 23, 'Bularga', 'deposited', '2021-08-30', '13:00-15:00', '3387994934402', 1),
(271, 'Paul Liviu', '748496715', 'Str. Atelierului nr. 18', '2kg', 'toys', 'standard', 'cash', 23, 'Bularga', 'deposited', '2021-11-16', '13:00-15:00', '2549700496992', 1),
(272, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 19', '2kg', 'toys', 'standard', 'cash', 30, 'Bularga', 'deposited', '2021-01-03', '13:00-15:00', '2758122746343', 1),
(273, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 20', '2kg', 'toys', 'standard', 'cash', 11, 'Bularga', 'deposited', '2021-02-11', '13:00-15:00', '3487868265276', 1),
(274, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 21', '2kg', 'toys', 'standard', 'cash', 44, 'Bularga', 'deposited', '2021-10-23', '13:00-15:00', '7384252688960', 1),
(275, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 22', '2kg', 'toys', 'standard', 'cash', 34, 'Bularga', 'deposited', '2021-09-03', '13:00-15:00', '5810840591842', 1),
(276, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 23', '2kg', 'toys', 'standard', 'cash', 19, 'Bularga', 'deposited', '2021-02-04', '13:00-15:00', '5465209830670', 1),
(277, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 24', '2kg', 'toys', 'standard', 'cash', 30, 'Bularga', 'deposited', '2021-11-04', '13:00-15:00', '6309525558391', 1),
(278, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 25', '2kg', 'toys', 'standard', 'cash', 49, 'Bularga', 'deposited', '2021-11-20', '13:00-15:00', '7449602589023', 1),
(279, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 26', '2kg', 'toys', 'standard', 'cash', 22, 'Bularga', 'deposited', '2021-08-20', '13:00-15:00', '4984975262009', 1),
(280, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 27', '2kg', 'toys', 'standard', 'cash', 31, 'Bularga', 'deposited', '2021-06-23', '13:00-15:00', '2144579160246', 1),
(281, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 28', '2kg', 'toys', 'standard', 'cash', 35, 'Bularga', 'deposited', '2021-07-16', '13:00-15:00', '7714815472568', 1),
(282, 'Paul Oprea', '748496715', 'Str. Atelierului nr. 29', '2kg', 'toys', 'standard', 'cash', 12, 'Bularga', 'deposited', '2021-07-01', '13:00-15:00', '2908370232954', 1),
(283, 'Paul Stefan', '748496715', 'Str. Atelierului nr. 30', '2kg', 'toys', 'standard', 'cash', 31, 'Bularga', 'deposited', '2021-06-17', '13:00-15:00', '8991398291754', 1);
INSERT INTO `orders` (`id`, `name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `amount`, `area`, `status`, `delivery_date`, `delivery_hour`, `AWB`, `id_client`) VALUES
(284, 'Paul Liviu', '748496715', 'Str. Atelierului nr. 31', '2kg', 'toys', 'standard', 'cash', 19, 'Bularga', 'deposited', '2021-09-08', '13:00-15:00', '8016271815440', 1),
(285, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 32', '2kg', 'toys', 'standard', 'cash', 43, 'Bularga', 'deposited', '2021-03-06', '13:00-15:00', '3158868671282', 1),
(286, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 33', '2kg', 'toys', 'standard', 'cash', 15, 'Bularga', 'deposited', '2021-11-28', '13:00-15:00', '4165405502209', 1),
(287, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 34', '2kg', 'toys', 'standard', 'cash', 14, 'Bularga', 'deposited', '2021-03-20', '13:00-15:00', '6271082742062', 1),
(288, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 35', '2kg', 'toys', 'standard', 'cash', 12, 'Bularga', 'deposited', '2021-10-18', '13:00-15:00', '6576643286847', 1),
(289, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 36', '2kg', 'toys', 'standard', 'cash', 38, 'Bularga', 'deposited', '2021-07-13', '13:00-15:00', '4679718154356', 1),
(290, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 37', '2kg', 'toys', 'standard', 'cash', 23, 'Bularga', 'deposited', '2021-02-12', '13:00-15:00', '3593570303365', 1),
(291, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 38', '2kg', 'toys', 'standard', 'cash', 17, 'Bularga', 'deposited', '2021-02-05', '13:00-15:00', '6002735335778', 1),
(292, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 39', '2kg', 'toys', 'standard', 'cash', 20, 'Bularga', 'deposited', '2021-09-10', '13:00-15:00', '8946182890831', 1),
(293, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 40', '2kg', 'toys', 'standard', 'cash', 14, 'Bularga', 'deposited', '2021-11-18', '13:00-15:00', '5900182611910', 1),
(294, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 41', '2kg', 'toys', 'standard', 'cash', 42, 'Bularga', 'deposited', '2021-08-30', '13:00-15:00', '8116022017086', 1),
(295, 'Paul Oprea', '748496715', 'Str. Atelierului nr. 42', '2kg', 'toys', 'standard', 'cash', 50, 'Bularga', 'deposited', '2021-01-03', '13:00-15:00', '2951688536803', 1),
(296, 'Paul Stefan', '748496715', 'Str. Atelierului nr. 43', '2kg', 'toys', 'standard', 'cash', 31, 'Bularga', 'deposited', '2021-11-05', '13:00-15:00', '7731267703618', 1),
(297, 'Paul Liviu', '748496715', 'Str. Atelierului nr. 44', '2kg', 'toys', 'standard', 'cash', 23, 'Bularga', 'deposited', '2021-06-29', '13:00-15:00', '2664221389342', 1),
(298, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 45', '2kg', 'toys', 'standard', 'cash', 48, 'Bularga', 'deposited', '2021-06-30', '13:00-15:00', '7653551657704', 1),
(299, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 46', '2kg', 'toys', 'standard', 'cash', 20, 'Bularga', 'deposited', '2021-12-15', '13:00-15:00', '4688052067313', 1),
(300, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 47', '2kg', 'toys', 'standard', 'cash', 24, 'Bularga', 'deposited', '2021-01-08', '13:00-15:00', '6958292070049', 1),
(301, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 48', '2kg', 'toys', 'standard', 'cash', 33, 'Bularga', 'deposited', '2021-06-16', '13:00-15:00', '5553456988413', 1),
(302, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 49', '2kg', 'toys', 'standard', 'cash', 36, 'Bularga', 'deposited', '2021-08-04', '13:00-15:00', '4219537919943', 1),
(303, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 50', '2kg', 'toys', 'standard', 'cash', 46, 'Bularga', 'deposited', '2021-01-26', '13:00-15:00', '5702533008548', 1),
(304, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 51', '2kg', 'toys', 'standard', 'cash', 19, 'Bularga', 'deposited', '2021-06-30', '13:00-15:00', '4297792064900', 1),
(305, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 52', '2kg', 'toys', 'standard', 'cash', 13, 'Bularga', 'deposited', '2021-03-18', '13:00-15:00', '4243429339255', 1),
(306, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 53', '2kg', 'toys', 'standard', 'cash', 44, 'Bularga', 'deposited', '2021-03-21', '13:00-15:00', '3901135393848', 1),
(307, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 54', '2kg', 'toys', 'standard', 'cash', 43, 'Bularga', 'deposited', '2021-01-16', '13:00-15:00', '5334080371290', 1),
(308, 'Paul Oprea', '748496715', 'Str. Atelierului nr. 55', '2kg', 'toys', 'standard', 'cash', 38, 'Bularga', 'deposited', '2021-01-05', '13:00-15:00', '6799118007714', 1),
(309, 'Paul Stefan', '748496715', 'Str. Atelierului nr. 56', '2kg', 'toys', 'standard', 'cash', 11, 'Bularga', 'deposited', '2021-07-14', '13:00-15:00', '8466764286780', 1),
(310, 'Paul Liviu', '748496715', 'Str. Atelierului nr. 57', '2kg', 'toys', 'standard', 'cash', 39, 'Bularga', 'deposited', '2021-11-20', '13:00-15:00', '4265116834696', 1),
(311, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 58', '2kg', 'toys', 'standard', 'cash', 18, 'Bularga', 'deposited', '2021-11-20', '13:00-15:00', '5402999099170', 1),
(312, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 59', '2kg', 'toys', 'standard', 'cash', 20, 'Bularga', 'deposited', '2021-07-18', '13:00-15:00', '8702883383320', 1),
(313, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 60', '2kg', 'toys', 'standard', 'cash', 21, 'Bularga', 'deposited', '2021-11-13', '13:00-15:00', '8251804130612', 1),
(314, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 61', '2kg', 'toys', 'standard', 'cash', 47, 'Bularga', 'deposited', '2021-01-01', '13:00-15:00', '2870346850799', 1),
(315, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 62', '2kg', 'toys', 'standard', 'cash', 14, 'Bularga', 'deposited', '2021-04-14', '13:00-15:00', '5016423650389', 1),
(316, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 63', '2kg', 'toys', 'standard', 'cash', 36, 'Bularga', 'deposited', '2021-05-12', '13:00-15:00', '7588849902844', 1),
(317, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 64', '2kg', 'toys', 'standard', 'cash', 40, 'Bularga', 'deposited', '2021-08-06', '13:00-15:00', '3100365542698', 1),
(318, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 65', '2kg', 'toys', 'standard', 'cash', 10, 'Bularga', 'deposited', '2021-04-20', '13:00-15:00', '6556168644176', 1),
(319, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 66', '2kg', 'toys', 'standard', 'cash', 16, 'Bularga', 'deposited', '2021-02-27', '13:00-15:00', '5180029343939', 1),
(320, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 67', '2kg', 'toys', 'standard', 'cash', 17, 'Bularga', 'deposited', '2021-09-02', '13:00-15:00', '2151090008409', 1),
(321, 'Paul Oprea', '748496715', 'Str. Atelierului nr. 68', '2kg', 'toys', 'standard', 'cash', 24, 'Bularga', 'deposited', '2021-04-22', '13:00-15:00', '4857159239663', 1),
(322, 'Paul Stefan', '748496715', 'Str. Atelierului nr. 69', '2kg', 'toys', 'standard', 'cash', 34, 'Bularga', 'deposited', '2021-11-12', '13:00-15:00', '6007037862796', 1),
(323, 'Paul Liviu', '748496715', 'Str. Atelierului nr. 70', '2kg', 'toys', 'standard', 'cash', 13, 'Bularga', 'deposited', '2021-10-03', '13:00-15:00', '7610606931504', 1),
(324, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 71', '2kg', 'toys', 'standard', 'cash', 20, 'Bularga', 'deposited', '2021-03-31', '13:00-15:00', '5270194559218', 1),
(325, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 72', '2kg', 'toys', 'standard', 'cash', 17, 'Bularga', 'deposited', '2021-01-22', '13:00-15:00', '4206019732082', 1),
(326, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 73', '2kg', 'toys', 'standard', 'cash', 40, 'Bularga', 'deposited', '2021-05-04', '13:00-15:00', '7768544978773', 1),
(327, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 74', '2kg', 'toys', 'standard', 'cash', 16, 'Bularga', 'deposited', '2021-04-21', '13:00-15:00', '3498613173103', 1),
(328, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 75', '2kg', 'toys', 'standard', 'cash', 48, 'Bularga', 'deposited', '2021-01-26', '13:00-15:00', '6773975168094', 1),
(329, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 76', '2kg', 'toys', 'standard', 'cash', 25, 'Bularga', 'deposited', '2021-07-22', '13:00-15:00', '5004464096916', 1),
(330, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 77', '2kg', 'toys', 'standard', 'cash', 39, 'Bularga', 'deposited', '2021-08-24', '13:00-15:00', '3408521653900', 1),
(331, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 78', '2kg', 'toys', 'standard', 'cash', 24, 'Bularga', 'deposited', '2021-02-26', '13:00-15:00', '5918056328753', 1),
(332, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 79', '2kg', 'toys', 'standard', 'cash', 45, 'Bularga', 'deposited', '2021-12-26', '13:00-15:00', '7343540279991', 1),
(333, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 80', '2kg', 'toys', 'standard', 'cash', 46, 'Bularga', 'deposited', '2021-04-04', '13:00-15:00', '3038213401068', 1),
(334, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 81', '2kg', 'toys', 'standard', 'cash', 46, 'Bularga', 'deposited', '2021-12-31', '13:00-15:00', '7879229691637', 1),
(335, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 82', '2kg', 'toys', 'standard', 'cash', 37, 'Bularga', 'deposited', '2021-07-10', '13:00-15:00', '4123063844899', 1),
(336, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 83', '2kg', 'toys', 'standard', 'cash', 21, 'Bularga', 'deposited', '2021-09-30', '13:00-15:00', '4430802536144', 1),
(337, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 84', '2kg', 'toys', 'standard', 'cash', 13, 'Bularga', 'deposited', '2021-10-05', '13:00-15:00', '7241178844203', 1),
(338, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 85', '2kg', 'toys', 'standard', 'cash', 48, 'Bularga', 'deposited', '2021-07-24', '13:00-15:00', '8342687575133', 1),
(339, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 86', '2kg', 'toys', 'standard', 'cash', 44, 'Bularga', 'deposited', '2021-01-02', '13:00-15:00', '2106226489593', 1),
(340, 'Paul Oprea', '748496715', 'Str. Atelierului nr. 87', '2kg', 'toys', 'standard', 'cash', 15, 'Bularga', 'deposited', '2021-09-20', '13:00-15:00', '3806405691747', 1),
(341, 'Paul Stefan', '748496715', 'Str. Atelierului nr. 88', '2kg', 'toys', 'standard', 'cash', 43, 'Bularga', 'deposited', '2021-03-18', '13:00-15:00', '3984031359047', 1),
(342, 'Paul Liviu', '748496715', 'Str. Atelierului nr. 89', '2kg', 'toys', 'standard', 'cash', 48, 'Bularga', 'deposited', '2021-05-28', '13:00-15:00', '6770994351867', 1),
(343, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 90', '2kg', 'toys', 'standard', 'cash', 48, 'Bularga', 'deposited', '2021-08-08', '13:00-15:00', '4523300520295', 1),
(344, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 91', '2kg', 'toys', 'standard', 'cash', 35, 'Bularga', 'deposited', '2021-07-25', '13:00-15:00', '7453739952020', 1),
(345, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 92', '2kg', 'toys', 'standard', 'cash', 36, 'Bularga', 'deposited', '2021-01-14', '13:00-15:00', '2685840498062', 1),
(346, 'Paul Alexe', '748496715', 'Str. Atelierului nr. 93', '2kg', 'toys', 'standard', 'cash', 21, 'Bularga', 'deposited', '2021-10-18', '13:00-15:00', '5527063851098', 1),
(347, 'Andreea Simon', '748496715', 'Str. Atelierului nr. 94', '2kg', 'toys', 'standard', 'cash', 18, 'Bularga', 'deposited', '2021-05-24', '13:00-15:00', '8412094572331', 1),
(348, 'Ioana Blanaru', '748496715', 'Str. Atelierului nr. 95', '2kg', 'toys', 'standard', 'cash', 35, 'Bularga', 'deposited', '2021-12-26', '13:00-15:00', '7965140889180', 1),
(349, 'Ilinca Varlan', '748496715', 'Str. Atelierului nr. 96', '2kg', 'toys', 'standard', 'cash', 48, 'Bularga', 'deposited', '2021-03-23', '13:00-15:00', '7748386467998', 1),
(350, 'Paul Duruc', '748496715', 'Str. Atelierului nr. 97', '2kg', 'toys', 'standard', 'cash', 40, 'Bularga', 'deposited', '2021-12-04', '13:00-15:00', '6868487144287', 1),
(351, 'Paul Ioan', '748496715', 'Str. Atelierului nr. 98', '2kg', 'toys', 'standard', 'cash', 16, 'Bularga', 'deposited', '2021-10-25', '13:00-15:00', '7050359151948', 1),
(352, 'Paul Alexandru', '748496715', 'Str. Atelierului nr. 99', '2kg', 'toys', 'standard', 'cash', 17, 'Bularga', 'deposited', '2021-07-27', '13:00-15:00', '7380551304977', 1),
(353, 'Paul Oprea', '748496715', 'Str. Atelierului nr. 100', '2kg', 'toys', 'standard', 'cash', 17, 'Bularga', 'deposited', '2021-12-01', '13:00-15:00', '8651615540868', 1),
(354, 'Paul Stefan', '748496715', 'Str. Atelierului nr. 101', '2kg', 'toys', 'standard', 'cash', 27, 'Bularga', 'deposited', '2021-05-22', '13:00-15:00', '6898298719573', 1),
(355, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 33', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-03-26', '13:00-15:00', '6808239746658', 1),
(356, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 34', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-03-03', '13:00-15:00', '2536851551112', 1),
(357, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 35', '1kg', 'toys', 'standard', 'cash', 37, 'Tudor_Vladimirescu', 'deposited', '2021-09-02', '13:00-15:00', '5981325857342', 1),
(358, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 36', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-09-04', '13:00-15:00', '2911221921542', 1),
(359, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 37', '1kg', 'toys', 'standard', 'cash', 28, 'Tudor_Vladimirescu', 'deposited', '2021-08-18', '13:00-15:00', '7955345455063', 1),
(360, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 38', '1kg', 'toys', 'standard', 'cash', 39, 'Tudor_Vladimirescu', 'deposited', '2021-03-06', '13:00-15:00', '5467744847165', 1),
(361, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 39', '1kg', 'toys', 'standard', 'cash', 14, 'Tudor_Vladimirescu', 'deposited', '2021-05-05', '13:00-15:00', '4186540037005', 1),
(362, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 40', '1kg', 'toys', 'standard', 'cash', 18, 'Tudor_Vladimirescu', 'deposited', '2021-11-10', '13:00-15:00', '4352527140069', 1),
(363, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 41', '1kg', 'toys', 'standard', 'cash', 19, 'Tudor_Vladimirescu', 'deposited', '2021-05-01', '13:00-15:00', '2080727234918', 1),
(364, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 42', '1kg', 'toys', 'standard', 'cash', 25, 'Tudor_Vladimirescu', 'deposited', '2021-03-08', '13:00-15:00', '6209514305682', 1),
(365, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 43', '1kg', 'toys', 'standard', 'cash', 42, 'Tudor_Vladimirescu', 'deposited', '2021-07-09', '13:00-15:00', '4984134466077', 1),
(366, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 44', '1kg', 'toys', 'standard', 'cash', 46, 'Tudor_Vladimirescu', 'deposited', '2021-06-27', '13:00-15:00', '4718940230194', 1),
(367, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 45', '1kg', 'toys', 'standard', 'cash', 11, 'Tudor_Vladimirescu', 'deposited', '2021-01-07', '13:00-15:00', '5076053997686', 1),
(368, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 46', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-03-23', '13:00-15:00', '8527146748060', 1),
(369, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 47', '1kg', 'toys', 'standard', 'cash', 21, 'Tudor_Vladimirescu', 'deposited', '2021-06-11', '13:00-15:00', '6542166311381', 1),
(370, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 48', '1kg', 'toys', 'standard', 'cash', 15, 'Tudor_Vladimirescu', 'deposited', '2021-05-18', '13:00-15:00', '2687092672547', 1),
(371, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 49', '1kg', 'toys', 'standard', 'cash', 35, 'Tudor_Vladimirescu', 'deposited', '2021-10-17', '13:00-15:00', '3518014268936', 1),
(372, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 50', '1kg', 'toys', 'standard', 'cash', 16, 'Tudor_Vladimirescu', 'deposited', '2021-11-25', '13:00-15:00', '8578250396775', 1),
(373, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 51', '1kg', 'toys', 'standard', 'cash', 33, 'Tudor_Vladimirescu', 'deposited', '2021-06-17', '13:00-15:00', '6880953919408', 1),
(374, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 52', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-09-23', '13:00-15:00', '7554810709622', 1),
(375, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 53', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-08-23', '13:00-15:00', '3765466834611', 1),
(376, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 54', '1kg', 'toys', 'standard', 'cash', 11, 'Tudor_Vladimirescu', 'deposited', '2021-12-26', '13:00-15:00', '8378868832940', 1),
(377, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 55', '1kg', 'toys', 'standard', 'cash', 39, 'Tudor_Vladimirescu', 'deposited', '2021-07-15', '13:00-15:00', '4332333376030', 1),
(378, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 56', '1kg', 'toys', 'standard', 'cash', 48, 'Tudor_Vladimirescu', 'deposited', '2021-05-19', '13:00-15:00', '2724093423357', 1),
(379, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 57', '1kg', 'toys', 'standard', 'cash', 41, 'Tudor_Vladimirescu', 'deposited', '2021-07-12', '13:00-15:00', '3160099431343', 1),
(380, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 58', '1kg', 'toys', 'standard', 'cash', 39, 'Tudor_Vladimirescu', 'deposited', '2021-02-28', '13:00-15:00', '6125729423831', 1),
(381, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 59', '1kg', 'toys', 'standard', 'cash', 33, 'Tudor_Vladimirescu', 'deposited', '2021-09-09', '13:00-15:00', '4392634147301', 1),
(382, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 60', '1kg', 'toys', 'standard', 'cash', 30, 'Tudor_Vladimirescu', 'deposited', '2021-08-01', '13:00-15:00', '8441937903110', 1),
(383, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 61', '1kg', 'toys', 'standard', 'cash', 36, 'Tudor_Vladimirescu', 'deposited', '2021-03-05', '13:00-15:00', '2386356400417', 1),
(384, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 62', '1kg', 'toys', 'standard', 'cash', 20, 'Tudor_Vladimirescu', 'deposited', '2021-08-27', '13:00-15:00', '6963638535465', 1),
(385, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 63', '1kg', 'toys', 'standard', 'cash', 37, 'Tudor_Vladimirescu', 'deposited', '2021-01-13', '13:00-15:00', '3893779881319', 1),
(386, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 64', '1kg', 'toys', 'standard', 'cash', 28, 'Tudor_Vladimirescu', 'deposited', '2021-12-19', '13:00-15:00', '2346219729888', 1),
(387, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 65', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-11-01', '13:00-15:00', '6307130305020', 1),
(388, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 66', '1kg', 'toys', 'standard', 'cash', 21, 'Tudor_Vladimirescu', 'deposited', '2021-05-10', '13:00-15:00', '2664668903291', 1),
(389, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 67', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-09-20', '13:00-15:00', '5099539142212', 1),
(390, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 68', '1kg', 'toys', 'standard', 'cash', 33, 'Tudor_Vladimirescu', 'deposited', '2021-08-20', '13:00-15:00', '7538646809607', 1),
(391, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 69', '1kg', 'toys', 'standard', 'cash', 47, 'Tudor_Vladimirescu', 'deposited', '2021-06-27', '13:00-15:00', '3446205720749', 1),
(392, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 70', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-11-28', '13:00-15:00', '3907461832441', 1),
(393, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 71', '1kg', 'toys', 'standard', 'cash', 42, 'Tudor_Vladimirescu', 'deposited', '2021-04-13', '13:00-15:00', '6110321210619', 1),
(394, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 72', '1kg', 'toys', 'standard', 'cash', 27, 'Tudor_Vladimirescu', 'deposited', '2021-06-25', '13:00-15:00', '7925353889180', 1),
(395, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 73', '1kg', 'toys', 'standard', 'cash', 37, 'Tudor_Vladimirescu', 'deposited', '2021-05-31', '13:00-15:00', '3736692620664', 1),
(396, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 74', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-12-19', '13:00-15:00', '7410400641465', 1),
(397, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 75', '1kg', 'toys', 'standard', 'cash', 19, 'Tudor_Vladimirescu', 'deposited', '2021-10-01', '13:00-15:00', '4830022646622', 1),
(398, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 76', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-11-27', '13:00-15:00', '5428014433237', 1),
(399, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 77', '1kg', 'toys', 'standard', 'cash', 39, 'Tudor_Vladimirescu', 'deposited', '2021-08-08', '13:00-15:00', '7196667893180', 1),
(400, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 78', '1kg', 'toys', 'standard', 'cash', 22, 'Tudor_Vladimirescu', 'deposited', '2021-07-07', '13:00-15:00', '5081584530978', 1),
(401, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 79', '1kg', 'toys', 'standard', 'cash', 11, 'Tudor_Vladimirescu', 'deposited', '2021-06-08', '13:00-15:00', '5712305166144', 1),
(402, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 80', '1kg', 'toys', 'standard', 'cash', 16, 'Tudor_Vladimirescu', 'deposited', '2021-01-24', '13:00-15:00', '8374399132565', 1),
(403, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 81', '1kg', 'toys', 'standard', 'cash', 18, 'Tudor_Vladimirescu', 'deposited', '2021-04-05', '13:00-15:00', '7828995773939', 1),
(404, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 82', '1kg', 'toys', 'standard', 'cash', 17, 'Tudor_Vladimirescu', 'deposited', '2021-07-19', '13:00-15:00', '2601471075259', 1),
(405, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 83', '1kg', 'toys', 'standard', 'cash', 33, 'Tudor_Vladimirescu', 'deposited', '2021-06-17', '13:00-15:00', '6561295219793', 1),
(406, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 84', '1kg', 'toys', 'standard', 'cash', 36, 'Tudor_Vladimirescu', 'deposited', '2021-09-02', '13:00-15:00', '8927113981050', 1),
(407, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 85', '1kg', 'toys', 'standard', 'cash', 41, 'Tudor_Vladimirescu', 'deposited', '2021-06-24', '13:00-15:00', '2271783581566', 1),
(408, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 86', '1kg', 'toys', 'standard', 'cash', 35, 'Tudor_Vladimirescu', 'deposited', '2021-02-21', '13:00-15:00', '7450724397204', 1),
(409, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 87', '1kg', 'toys', 'standard', 'cash', 35, 'Tudor_Vladimirescu', 'deposited', '2021-12-12', '13:00-15:00', '8813068751466', 1),
(410, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 88', '1kg', 'toys', 'standard', 'cash', 37, 'Tudor_Vladimirescu', 'deposited', '2021-02-25', '13:00-15:00', '5802808099453', 1),
(411, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 89', '1kg', 'toys', 'standard', 'cash', 21, 'Tudor_Vladimirescu', 'deposited', '2021-03-28', '13:00-15:00', '3549175138052', 1),
(412, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 90', '1kg', 'toys', 'standard', 'cash', 18, 'Tudor_Vladimirescu', 'deposited', '2021-12-14', '13:00-15:00', '8336246101179', 1),
(413, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 91', '1kg', 'toys', 'standard', 'cash', 46, 'Tudor_Vladimirescu', 'deposited', '2021-04-27', '13:00-15:00', '7969399048073', 1),
(414, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 92', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-09-09', '13:00-15:00', '3771444061316', 1),
(415, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 93', '1kg', 'toys', 'standard', 'cash', 10, 'Tudor_Vladimirescu', 'deposited', '2021-02-10', '13:00-15:00', '4689173624924', 1),
(416, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 94', '1kg', 'toys', 'standard', 'cash', 10, 'Tudor_Vladimirescu', 'deposited', '2021-10-22', '13:00-15:00', '8252539235979', 1),
(417, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 95', '1kg', 'toys', 'standard', 'cash', 36, 'Tudor_Vladimirescu', 'deposited', '2021-04-04', '13:00-15:00', '3194111906547', 1),
(418, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 96', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-03-02', '13:00-15:00', '2506278481723', 1),
(419, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 97', '1kg', 'toys', 'standard', 'cash', 47, 'Tudor_Vladimirescu', 'deposited', '2021-05-04', '13:00-15:00', '2985930580628', 1),
(420, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 98', '1kg', 'toys', 'standard', 'cash', 22, 'Tudor_Vladimirescu', 'deposited', '2021-12-03', '13:00-15:00', '3043486349459', 1),
(421, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 99', '1kg', 'toys', 'standard', 'cash', 26, 'Tudor_Vladimirescu', 'deposited', '2021-09-14', '13:00-15:00', '8515011687384', 1),
(422, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 100', '1kg', 'toys', 'standard', 'cash', 25, 'Tudor_Vladimirescu', 'deposited', '2021-09-22', '13:00-15:00', '8280007646249', 1),
(423, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 101', '1kg', 'toys', 'standard', 'cash', 28, 'Tudor_Vladimirescu', 'deposited', '2021-07-17', '13:00-15:00', '2288427225790', 1),
(424, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 102', '1kg', 'toys', 'standard', 'cash', 39, 'Tudor_Vladimirescu', 'deposited', '2021-08-18', '13:00-15:00', '4301303984471', 1),
(425, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 103', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-10-02', '13:00-15:00', '6600709084028', 1),
(426, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 104', '1kg', 'toys', 'standard', 'cash', 35, 'Tudor_Vladimirescu', 'deposited', '2021-11-09', '13:00-15:00', '6771083744880', 1),
(427, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 105', '1kg', 'toys', 'standard', 'cash', 24, 'Tudor_Vladimirescu', 'deposited', '2021-12-02', '13:00-15:00', '8895718950866', 1),
(428, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 106', '1kg', 'toys', 'standard', 'cash', 26, 'Tudor_Vladimirescu', 'deposited', '2021-03-29', '13:00-15:00', '5754865144859', 1),
(429, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 107', '1kg', 'toys', 'standard', 'cash', 19, 'Tudor_Vladimirescu', 'deposited', '2021-06-08', '13:00-15:00', '4701794945774', 1),
(430, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 108', '1kg', 'toys', 'standard', 'cash', 18, 'Tudor_Vladimirescu', 'deposited', '2021-06-01', '13:00-15:00', '8856514038054', 1),
(431, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 109', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-09-06', '13:00-15:00', '6430903392805', 1),
(432, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 110', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-10-23', '13:00-15:00', '4958760207932', 1),
(433, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 111', '1kg', 'toys', 'standard', 'cash', 20, 'Tudor_Vladimirescu', 'deposited', '2021-02-04', '13:00-15:00', '5059676973859', 1),
(434, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 112', '1kg', 'toys', 'standard', 'cash', 49, 'Tudor_Vladimirescu', 'deposited', '2021-01-28', '13:00-15:00', '2723511447784', 1),
(435, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 113', '1kg', 'toys', 'standard', 'cash', 20, 'Tudor_Vladimirescu', 'deposited', '2021-05-26', '13:00-15:00', '2451718641976', 1),
(436, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 114', '1kg', 'toys', 'standard', 'cash', 16, 'Tudor_Vladimirescu', 'deposited', '2021-02-04', '13:00-15:00', '5097395267423', 1),
(437, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 115', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-07-29', '13:00-15:00', '6894009416648', 1),
(438, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 116', '1kg', 'toys', 'standard', 'cash', 38, 'Tudor_Vladimirescu', 'deposited', '2021-12-07', '13:00-15:00', '6932167506976', 1),
(439, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 117', '1kg', 'toys', 'standard', 'cash', 14, 'Tudor_Vladimirescu', 'deposited', '2021-02-05', '13:00-15:00', '8535164381411', 1),
(440, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 118', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-01-15', '13:00-15:00', '7065112051490', 1),
(441, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 119', '1kg', 'toys', 'standard', 'cash', 37, 'Tudor_Vladimirescu', 'deposited', '2021-06-25', '13:00-15:00', '7981015144834', 1),
(442, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 120', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-12-14', '13:00-15:00', '6204872529707', 1),
(443, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 121', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-03-28', '13:00-15:00', '2146787384939', 1),
(444, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 122', '1kg', 'toys', 'standard', 'cash', 19, 'Tudor_Vladimirescu', 'deposited', '2021-05-15', '13:00-15:00', '2673734094870', 1),
(445, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 123', '1kg', 'toys', 'standard', 'cash', 47, 'Tudor_Vladimirescu', 'deposited', '2021-07-13', '13:00-15:00', '7830113426121', 1),
(446, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 124', '1kg', 'toys', 'standard', 'cash', 22, 'Tudor_Vladimirescu', 'deposited', '2021-12-21', '13:00-15:00', '2705516622558', 1),
(447, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 125', '1kg', 'toys', 'standard', 'cash', 34, 'Tudor_Vladimirescu', 'deposited', '2021-02-26', '13:00-15:00', '4772260737082', 1),
(448, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 126', '1kg', 'toys', 'standard', 'cash', 43, 'Tudor_Vladimirescu', 'deposited', '2021-09-24', '13:00-15:00', '7873133653046', 1),
(449, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 127', '1kg', 'toys', 'standard', 'cash', 30, 'Tudor_Vladimirescu', 'deposited', '2021-06-11', '13:00-15:00', '7555141613066', 1),
(450, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 128', '1kg', 'toys', 'standard', 'cash', 42, 'Tudor_Vladimirescu', 'deposited', '2021-09-09', '13:00-15:00', '8402554868827', 1),
(451, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 129', '1kg', 'toys', 'standard', 'cash', 11, 'Tudor_Vladimirescu', 'deposited', '2021-02-25', '13:00-15:00', '4549629135918', 1),
(452, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 130', '1kg', 'toys', 'standard', 'cash', 33, 'Tudor_Vladimirescu', 'deposited', '2021-12-25', '13:00-15:00', '6248335795508', 1),
(453, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 131', '1kg', 'toys', 'standard', 'cash', 42, 'Tudor_Vladimirescu', 'deposited', '2021-10-26', '13:00-15:00', '2719063723705', 1),
(454, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 132', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-12-28', '13:00-15:00', '8784828624755', 1),
(455, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 133', '1kg', 'toys', 'standard', 'cash', 43, 'Tudor_Vladimirescu', 'deposited', '2021-03-01', '13:00-15:00', '8995086215607', 1),
(456, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 134', '1kg', 'toys', 'standard', 'cash', 31, 'Tudor_Vladimirescu', 'deposited', '2021-10-06', '13:00-15:00', '7778358681105', 1),
(457, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 135', '1kg', 'toys', 'standard', 'cash', 48, 'Tudor_Vladimirescu', 'deposited', '2021-03-25', '13:00-15:00', '2707439845172', 1),
(458, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 136', '1kg', 'toys', 'standard', 'cash', 42, 'Tudor_Vladimirescu', 'deposited', '2021-06-28', '13:00-15:00', '2717587245085', 1),
(459, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 137', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-11-26', '13:00-15:00', '4363390639687', 1),
(460, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 138', '1kg', 'toys', 'standard', 'cash', 10, 'Tudor_Vladimirescu', 'deposited', '2021-07-17', '13:00-15:00', '5907420414046', 1),
(461, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 139', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-02-02', '13:00-15:00', '8556037670701', 1),
(462, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 140', '1kg', 'toys', 'standard', 'cash', 48, 'Tudor_Vladimirescu', 'deposited', '2021-10-11', '13:00-15:00', '6588460091974', 1),
(463, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 141', '1kg', 'toys', 'standard', 'cash', 48, 'Tudor_Vladimirescu', 'deposited', '2021-05-27', '13:00-15:00', '3726020463740', 1),
(464, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 142', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-09-03', '13:00-15:00', '5388319349540', 1),
(465, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 143', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-11-29', '13:00-15:00', '4621836337754', 1),
(466, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 144', '1kg', 'toys', 'standard', 'cash', 34, 'Tudor_Vladimirescu', 'deposited', '2021-05-16', '13:00-15:00', '5099183412887', 1),
(467, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 145', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-02-14', '13:00-15:00', '5985906504205', 1),
(468, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 146', '1kg', 'toys', 'standard', 'cash', 36, 'Tudor_Vladimirescu', 'deposited', '2021-11-03', '13:00-15:00', '3110726172316', 1),
(469, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 147', '1kg', 'toys', 'standard', 'cash', 31, 'Tudor_Vladimirescu', 'deposited', '2021-03-19', '13:00-15:00', '4044296602431', 1),
(470, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 148', '1kg', 'toys', 'standard', 'cash', 50, 'Tudor_Vladimirescu', 'deposited', '2021-09-17', '13:00-15:00', '5108691747015', 1),
(471, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 149', '1kg', 'toys', 'standard', 'cash', 10, 'Tudor_Vladimirescu', 'deposited', '2021-03-17', '13:00-15:00', '4777080290315', 1),
(472, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 150', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-06-09', '13:00-15:00', '3223805938204', 1),
(473, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 151', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-09-20', '13:00-15:00', '5595127314937', 1),
(474, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 152', '1kg', 'toys', 'standard', 'cash', 40, 'Tudor_Vladimirescu', 'deposited', '2021-10-18', '13:00-15:00', '7826735806575', 1),
(475, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 153', '1kg', 'toys', 'standard', 'cash', 14, 'Tudor_Vladimirescu', 'deposited', '2021-12-23', '13:00-15:00', '3520809978648', 1),
(476, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 154', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-01-23', '13:00-15:00', '3303016548347', 1),
(477, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 155', '1kg', 'toys', 'standard', 'cash', 26, 'Tudor_Vladimirescu', 'deposited', '2021-07-01', '13:00-15:00', '7259906624387', 1),
(478, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 156', '1kg', 'toys', 'standard', 'cash', 11, 'Tudor_Vladimirescu', 'deposited', '2021-05-12', '13:00-15:00', '6394497354112', 1),
(479, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 157', '1kg', 'toys', 'standard', 'cash', 22, 'Tudor_Vladimirescu', 'deposited', '2021-06-22', '13:00-15:00', '3826795481420', 1),
(480, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 158', '1kg', 'toys', 'standard', 'cash', 18, 'Tudor_Vladimirescu', 'deposited', '2021-05-03', '13:00-15:00', '2095112554616', 1),
(481, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 159', '1kg', 'toys', 'standard', 'cash', 26, 'Tudor_Vladimirescu', 'deposited', '2021-04-05', '13:00-15:00', '6733774780801', 1),
(482, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 160', '1kg', 'toys', 'standard', 'cash', 30, 'Tudor_Vladimirescu', 'deposited', '2021-06-04', '13:00-15:00', '4469724359697', 1),
(483, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 161', '1kg', 'toys', 'standard', 'cash', 25, 'Tudor_Vladimirescu', 'deposited', '2021-09-10', '13:00-15:00', '5938729678227', 1),
(484, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 162', '1kg', 'toys', 'standard', 'cash', 25, 'Tudor_Vladimirescu', 'deposited', '2021-09-05', '13:00-15:00', '3503308507934', 1),
(485, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 163', '1kg', 'toys', 'standard', 'cash', 15, 'Tudor_Vladimirescu', 'deposited', '2021-06-13', '13:00-15:00', '5946038239479', 1),
(486, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 164', '1kg', 'toys', 'standard', 'cash', 40, 'Tudor_Vladimirescu', 'deposited', '2021-03-30', '13:00-15:00', '5858712201115', 1),
(487, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 165', '1kg', 'toys', 'standard', 'cash', 47, 'Tudor_Vladimirescu', 'deposited', '2021-03-28', '13:00-15:00', '3028030980650', 1),
(488, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 166', '1kg', 'toys', 'standard', 'cash', 17, 'Tudor_Vladimirescu', 'deposited', '2021-06-25', '13:00-15:00', '5946240635020', 1),
(489, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 167', '1kg', 'toys', 'standard', 'cash', 50, 'Tudor_Vladimirescu', 'deposited', '2021-08-26', '13:00-15:00', '5754888851679', 1),
(490, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 168', '1kg', 'toys', 'standard', 'cash', 30, 'Tudor_Vladimirescu', 'deposited', '2021-06-04', '13:00-15:00', '8506015019929', 1),
(491, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 169', '1kg', 'toys', 'standard', 'cash', 46, 'Tudor_Vladimirescu', 'deposited', '2021-03-03', '13:00-15:00', '3837790751924', 1),
(492, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 170', '1kg', 'toys', 'standard', 'cash', 28, 'Tudor_Vladimirescu', 'deposited', '2021-05-20', '13:00-15:00', '8039792148331', 1),
(493, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 171', '1kg', 'toys', 'standard', 'cash', 47, 'Tudor_Vladimirescu', 'deposited', '2021-07-14', '13:00-15:00', '3073561327249', 1),
(494, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 172', '1kg', 'toys', 'standard', 'cash', 45, 'Tudor_Vladimirescu', 'deposited', '2021-11-21', '13:00-15:00', '3265074927281', 1),
(495, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 173', '1kg', 'toys', 'standard', 'cash', 41, 'Tudor_Vladimirescu', 'deposited', '2021-04-02', '13:00-15:00', '7470971753138', 1),
(496, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 174', '1kg', 'toys', 'standard', 'cash', 38, 'Tudor_Vladimirescu', 'deposited', '2021-01-07', '13:00-15:00', '4710026910971', 1),
(497, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 175', '1kg', 'toys', 'standard', 'cash', 46, 'Tudor_Vladimirescu', 'deposited', '2021-09-12', '13:00-15:00', '8903116031461', 1),
(498, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 176', '1kg', 'toys', 'standard', 'cash', 22, 'Tudor_Vladimirescu', 'deposited', '2021-02-10', '13:00-15:00', '3829009842030', 1),
(499, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 177', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-04-08', '13:00-15:00', '7002638598183', 1),
(500, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 178', '1kg', 'toys', 'standard', 'cash', 13, 'Tudor_Vladimirescu', 'deposited', '2021-08-03', '13:00-15:00', '2348409744968', 1),
(501, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 179', '1kg', 'toys', 'standard', 'cash', 45, 'Tudor_Vladimirescu', 'deposited', '2021-11-27', '13:00-15:00', '8054656402866', 1),
(502, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 180', '1kg', 'toys', 'standard', 'cash', 49, 'Tudor_Vladimirescu', 'deposited', '2021-07-19', '13:00-15:00', '2000606782536', 1),
(503, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 181', '1kg', 'toys', 'standard', 'cash', 50, 'Tudor_Vladimirescu', 'deposited', '2021-08-21', '13:00-15:00', '4075489703111', 1),
(504, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 182', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-02-24', '13:00-15:00', '2467165618659', 1),
(505, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 183', '1kg', 'toys', 'standard', 'cash', 35, 'Tudor_Vladimirescu', 'deposited', '2021-08-14', '13:00-15:00', '6745151971672', 1),
(506, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 184', '1kg', 'toys', 'standard', 'cash', 38, 'Tudor_Vladimirescu', 'deposited', '2021-11-26', '13:00-15:00', '5124123188569', 1),
(507, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 185', '1kg', 'toys', 'standard', 'cash', 20, 'Tudor_Vladimirescu', 'deposited', '2021-06-25', '13:00-15:00', '3711204511288', 1),
(508, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 186', '1kg', 'toys', 'standard', 'cash', 43, 'Tudor_Vladimirescu', 'deposited', '2021-04-24', '13:00-15:00', '5503064095731', 1),
(509, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 187', '1kg', 'toys', 'standard', 'cash', 49, 'Tudor_Vladimirescu', 'deposited', '2021-01-26', '13:00-15:00', '8746158937486', 1),
(510, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 188', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-03-04', '13:00-15:00', '3988799836053', 1),
(511, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 189', '1kg', 'toys', 'standard', 'cash', 25, 'Tudor_Vladimirescu', 'deposited', '2021-02-03', '13:00-15:00', '6237112666633', 1),
(512, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 190', '1kg', 'toys', 'standard', 'cash', 39, 'Tudor_Vladimirescu', 'deposited', '2021-05-12', '13:00-15:00', '5952094128380', 1),
(513, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 191', '1kg', 'toys', 'standard', 'cash', 48, 'Tudor_Vladimirescu', 'deposited', '2021-01-08', '13:00-15:00', '2353596971281', 1),
(514, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 192', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-10-16', '13:00-15:00', '8845049102175', 1),
(515, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 193', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-01-15', '13:00-15:00', '2488431415625', 1),
(516, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 194', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-06-15', '13:00-15:00', '8895422224026', 1),
(517, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 195', '1kg', 'toys', 'standard', 'cash', 19, 'Tudor_Vladimirescu', 'deposited', '2021-11-16', '13:00-15:00', '3129355842453', 1),
(518, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 196', '1kg', 'toys', 'standard', 'cash', 35, 'Tudor_Vladimirescu', 'deposited', '2021-07-15', '13:00-15:00', '2349081297109', 1),
(519, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 197', '1kg', 'toys', 'standard', 'cash', 27, 'Tudor_Vladimirescu', 'deposited', '2021-03-22', '13:00-15:00', '7300812502335', 1),
(520, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 198', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-08-15', '13:00-15:00', '2198709007172', 1),
(521, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 199', '1kg', 'toys', 'standard', 'cash', 33, 'Tudor_Vladimirescu', 'deposited', '2021-01-22', '13:00-15:00', '7141874896342', 1),
(522, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 200', '1kg', 'toys', 'standard', 'cash', 44, 'Tudor_Vladimirescu', 'deposited', '2021-11-13', '13:00-15:00', '2270290571801', 1),
(523, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 201', '1kg', 'toys', 'standard', 'cash', 43, 'Tudor_Vladimirescu', 'deposited', '2021-09-23', '13:00-15:00', '3756179539958', 1),
(524, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 202', '1kg', 'toys', 'standard', 'cash', 12, 'Tudor_Vladimirescu', 'deposited', '2021-11-08', '13:00-15:00', '2232287099319', 1),
(525, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 203', '1kg', 'toys', 'standard', 'cash', 39, 'Tudor_Vladimirescu', 'deposited', '2021-06-05', '13:00-15:00', '3302955227693', 1),
(526, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 204', '1kg', 'toys', 'standard', 'cash', 28, 'Tudor_Vladimirescu', 'deposited', '2021-08-05', '13:00-15:00', '3658024683741', 1),
(527, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 205', '1kg', 'toys', 'standard', 'cash', 49, 'Tudor_Vladimirescu', 'deposited', '2021-12-07', '13:00-15:00', '2686831728108', 1),
(528, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 206', '1kg', 'toys', 'standard', 'cash', 16, 'Tudor_Vladimirescu', 'deposited', '2021-05-17', '13:00-15:00', '4868883621758', 1),
(529, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 207', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-01-10', '13:00-15:00', '5361931114552', 1),
(530, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 208', '1kg', 'toys', 'standard', 'cash', 43, 'Tudor_Vladimirescu', 'deposited', '2021-08-12', '13:00-15:00', '3870418416633', 1),
(531, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 209', '1kg', 'toys', 'standard', 'cash', 26, 'Tudor_Vladimirescu', 'deposited', '2021-11-18', '13:00-15:00', '2578528989350', 1),
(532, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 210', '1kg', 'toys', 'standard', 'cash', 25, 'Tudor_Vladimirescu', 'deposited', '2021-07-23', '13:00-15:00', '2768502132529', 1),
(533, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 211', '1kg', 'toys', 'standard', 'cash', 15, 'Tudor_Vladimirescu', 'deposited', '2021-09-08', '13:00-15:00', '3175944207975', 1),
(534, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 212', '1kg', 'toys', 'standard', 'cash', 27, 'Tudor_Vladimirescu', 'deposited', '2021-06-11', '13:00-15:00', '8417774219866', 1),
(535, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 213', '1kg', 'toys', 'standard', 'cash', 41, 'Tudor_Vladimirescu', 'deposited', '2021-01-14', '13:00-15:00', '4242768073487', 1),
(536, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 214', '1kg', 'toys', 'standard', 'cash', 18, 'Tudor_Vladimirescu', 'deposited', '2021-08-05', '13:00-15:00', '5556753721097', 1),
(537, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 215', '1kg', 'toys', 'standard', 'cash', 34, 'Tudor_Vladimirescu', 'deposited', '2021-10-09', '13:00-15:00', '2026431741621', 1),
(538, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 216', '1kg', 'toys', 'standard', 'cash', 50, 'Tudor_Vladimirescu', 'deposited', '2021-12-15', '13:00-15:00', '4966529310565', 1),
(539, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 217', '1kg', 'toys', 'standard', 'cash', 48, 'Tudor_Vladimirescu', 'deposited', '2021-06-03', '13:00-15:00', '6451700162118', 1),
(540, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 218', '1kg', 'toys', 'standard', 'cash', 17, 'Tudor_Vladimirescu', 'deposited', '2021-03-21', '13:00-15:00', '5443361261419', 1),
(541, 'Paul Oprea', '748496715', 'Bulevardul Tudor Vladimirescu nr. 219', '1kg', 'toys', 'standard', 'cash', 29, 'Tudor_Vladimirescu', 'deposited', '2021-12-02', '13:00-15:00', '7997057066953', 1),
(542, 'Paul Stefan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 220', '1kg', 'toys', 'standard', 'cash', 30, 'Tudor_Vladimirescu', 'deposited', '2021-07-12', '13:00-15:00', '6087152831293', 1),
(543, 'Paul Liviu', '748496715', 'Bulevardul Tudor Vladimirescu nr. 221', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-05-31', '13:00-15:00', '7146134048763', 1),
(544, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 222', '1kg', 'toys', 'standard', 'cash', 47, 'Tudor_Vladimirescu', 'deposited', '2021-03-29', '13:00-15:00', '4111740906144', 1);
INSERT INTO `orders` (`id`, `name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `amount`, `area`, `status`, `delivery_date`, `delivery_hour`, `AWB`, `id_client`) VALUES
(545, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 223', '1kg', 'toys', 'standard', 'cash', 50, 'Tudor_Vladimirescu', 'deposited', '2021-09-26', '13:00-15:00', '4767178907909', 1),
(546, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 224', '1kg', 'toys', 'standard', 'cash', 32, 'Tudor_Vladimirescu', 'deposited', '2021-04-22', '13:00-15:00', '6410370618727', 1),
(547, 'Paul Alexe', '748496715', 'Bulevardul Tudor Vladimirescu nr. 225', '1kg', 'toys', 'standard', 'cash', 26, 'Tudor_Vladimirescu', 'deposited', '2021-11-02', '13:00-15:00', '4837808604352', 1),
(548, 'Andreea Simon', '748496715', 'Bulevardul Tudor Vladimirescu nr. 226', '1kg', 'toys', 'standard', 'cash', 23, 'Tudor_Vladimirescu', 'deposited', '2021-08-02', '13:00-15:00', '4338488288125', 1),
(549, 'Ioana Blanaru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 227', '1kg', 'toys', 'standard', 'cash', 43, 'Tudor_Vladimirescu', 'deposited', '2021-04-09', '13:00-15:00', '8607569752202', 1),
(550, 'Ilinca Varlan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 228', '1kg', 'toys', 'standard', 'cash', 47, 'Tudor_Vladimirescu', 'deposited', '2021-11-25', '13:00-15:00', '7780921633774', 1),
(551, 'Paul Duruc', '748496715', 'Bulevardul Tudor Vladimirescu nr. 229', '1kg', 'toys', 'standard', 'cash', 31, 'Tudor_Vladimirescu', 'deposited', '2021-06-05', '13:00-15:00', '4431613038886', 1),
(552, 'Paul Ioan', '748496715', 'Bulevardul Tudor Vladimirescu nr. 230', '1kg', 'toys', 'standard', 'cash', 28, 'Tudor_Vladimirescu', 'deposited', '2021-11-22', '13:00-15:00', '6773284024768', 1),
(553, 'Paul Alexandru', '748496715', 'Bulevardul Tudor Vladimirescu nr. 231', '1kg', 'toys', 'standard', 'cash', 38, 'Tudor_Vladimirescu', 'deposited', '2021-06-22', '13:00-15:00', '8891465437451', 1),
(554, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 45', '1kg', 'laptop', 'express', 'cash', 48, 'Podu-Ros', 'deposited', '2021-09-24', '13:00-15:00', '5587789116485', 1),
(555, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 46', '1kg', 'laptop', 'express', 'cash', 13, 'Podu-Ros', 'deposited', '2021-09-11', '13:00-15:00', '6880637282440', 1),
(556, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 47', '1kg', 'laptop', 'express', 'cash', 27, 'Podu-Ros', 'deposited', '2021-05-29', '13:00-15:00', '7854713327211', 1),
(557, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 48', '1kg', 'laptop', 'express', 'cash', 60, 'Podu-Ros', 'deposited', '2021-10-04', '13:00-15:00', '3809369808946', 1),
(558, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 49', '1kg', 'laptop', 'express', 'cash', 41, 'Podu-Ros', 'deposited', '2021-11-19', '13:00-15:00', '3490612919144', 1),
(559, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 50', '1kg', 'laptop', 'express', 'cash', 72, 'Podu-Ros', 'deposited', '2021-07-12', '13:00-15:00', '8991653021624', 1),
(560, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 51', '1kg', 'laptop', 'express', 'cash', 29, 'Podu-Ros', 'deposited', '2021-04-30', '13:00-15:00', '3436762142309', 1),
(561, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 52', '1kg', 'laptop', 'express', 'cash', 32, 'Podu-Ros', 'deposited', '2021-04-21', '13:00-15:00', '7445315554673', 1),
(562, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 53', '1kg', 'laptop', 'express', 'cash', 38, 'Podu-Ros', 'deposited', '2021-03-27', '13:00-15:00', '4561464898894', 1),
(563, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 54', '1kg', 'laptop', 'express', 'cash', 55, 'Podu-Ros', 'deposited', '2021-04-16', '13:00-15:00', '5431112489726', 1),
(564, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 55', '1kg', 'laptop', 'express', 'cash', 11, 'Podu-Ros', 'deposited', '2021-05-23', '13:00-15:00', '5695227945484', 1),
(565, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 56', '1kg', 'laptop', 'express', 'cash', 74, 'Podu-Ros', 'deposited', '2021-12-14', '13:00-15:00', '3469416395962', 1),
(566, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 57', '1kg', 'laptop', 'express', 'cash', 68, 'Podu-Ros', 'deposited', '2021-08-22', '13:00-15:00', '2849283902355', 1),
(567, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 58', '1kg', 'laptop', 'express', 'cash', 69, 'Podu-Ros', 'deposited', '2021-05-24', '13:00-15:00', '8020387700584', 1),
(568, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 59', '1kg', 'laptop', 'express', 'cash', 32, 'Podu-Ros', 'deposited', '2021-05-24', '13:00-15:00', '6886623115950', 1),
(569, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 60', '1kg', 'laptop', 'express', 'cash', 24, 'Podu-Ros', 'deposited', '2021-01-05', '13:00-15:00', '2628943200816', 1),
(570, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 61', '1kg', 'laptop', 'express', 'cash', 49, 'Podu-Ros', 'deposited', '2021-02-20', '13:00-15:00', '2662900069029', 1),
(571, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 62', '1kg', 'laptop', 'express', 'cash', 56, 'Podu-Ros', 'deposited', '2021-07-16', '13:00-15:00', '6317911127555', 1),
(572, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 63', '1kg', 'laptop', 'express', 'cash', 39, 'Podu-Ros', 'deposited', '2021-08-22', '13:00-15:00', '6863426072416', 1),
(573, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 64', '1kg', 'laptop', 'express', 'cash', 15, 'Podu-Ros', 'deposited', '2021-07-30', '13:00-15:00', '7579968972413', 1),
(574, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 65', '1kg', 'laptop', 'express', 'cash', 49, 'Podu-Ros', 'deposited', '2021-10-31', '13:00-15:00', '4380173700048', 1),
(575, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 66', '1kg', 'laptop', 'express', 'cash', 52, 'Podu-Ros', 'deposited', '2021-09-12', '13:00-15:00', '4536749163744', 1),
(576, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 67', '1kg', 'laptop', 'express', 'cash', 66, 'Podu-Ros', 'deposited', '2021-07-28', '13:00-15:00', '2469434658575', 1),
(577, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 68', '1kg', 'laptop', 'express', 'cash', 48, 'Podu-Ros', 'deposited', '2021-02-04', '13:00-15:00', '3064156157655', 1),
(578, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 69', '1kg', 'laptop', 'express', 'cash', 11, 'Podu-Ros', 'deposited', '2021-12-18', '13:00-15:00', '8648456411146', 1),
(579, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 70', '1kg', 'laptop', 'express', 'cash', 44, 'Podu-Ros', 'deposited', '2021-04-27', '13:00-15:00', '8335666745531', 1),
(580, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 71', '1kg', 'laptop', 'express', 'cash', 17, 'Podu-Ros', 'deposited', '2021-07-02', '13:00-15:00', '5791939580320', 1),
(581, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 72', '1kg', 'laptop', 'express', 'cash', 21, 'Podu-Ros', 'deposited', '2021-07-13', '13:00-15:00', '3516210251349', 1),
(582, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 73', '1kg', 'laptop', 'express', 'cash', 22, 'Podu-Ros', 'deposited', '2021-11-20', '13:00-15:00', '4312402445644', 1),
(583, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 74', '1kg', 'laptop', 'express', 'cash', 15, 'Podu-Ros', 'deposited', '2021-08-23', '13:00-15:00', '3001112050364', 1),
(584, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 75', '1kg', 'laptop', 'express', 'cash', 23, 'Podu-Ros', 'deposited', '2021-08-01', '13:00-15:00', '2209778299541', 1),
(585, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 76', '1kg', 'laptop', 'express', 'cash', 50, 'Podu-Ros', 'deposited', '2021-07-16', '13:00-15:00', '5687298652343', 1),
(586, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 77', '1kg', 'laptop', 'express', 'cash', 60, 'Podu-Ros', 'deposited', '2021-03-26', '13:00-15:00', '6884654662713', 1),
(587, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 78', '1kg', 'laptop', 'express', 'cash', 68, 'Podu-Ros', 'deposited', '2021-04-19', '13:00-15:00', '4384221728094', 1),
(588, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 79', '1kg', 'laptop', 'express', 'cash', 62, 'Podu-Ros', 'deposited', '2021-11-15', '13:00-15:00', '5577689187298', 1),
(589, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 80', '1kg', 'laptop', 'express', 'cash', 17, 'Podu-Ros', 'deposited', '2021-06-23', '13:00-15:00', '5513282077295', 1),
(590, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 81', '1kg', 'laptop', 'express', 'cash', 28, 'Podu-Ros', 'deposited', '2021-08-08', '13:00-15:00', '5448163894020', 1),
(591, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 82', '1kg', 'laptop', 'express', 'cash', 19, 'Podu-Ros', 'deposited', '2021-04-13', '13:00-15:00', '2147385757108', 1),
(592, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 83', '1kg', 'laptop', 'express', 'cash', 12, 'Podu-Ros', 'deposited', '2021-12-16', '13:00-15:00', '6382509117546', 1),
(593, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 84', '1kg', 'laptop', 'express', 'cash', 64, 'Podu-Ros', 'deposited', '2021-10-12', '13:00-15:00', '6943918715108', 1),
(594, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 85', '1kg', 'laptop', 'express', 'cash', 15, 'Podu-Ros', 'deposited', '2021-09-12', '13:00-15:00', '3545901388814', 1),
(595, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 86', '1kg', 'laptop', 'express', 'cash', 10, 'Podu-Ros', 'deposited', '2021-01-11', '13:00-15:00', '3409083875272', 1),
(596, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 87', '1kg', 'laptop', 'express', 'cash', 54, 'Podu-Ros', 'deposited', '2021-02-19', '13:00-15:00', '4295622511122', 1),
(597, 'Bianca Prodan', '732395842', 'Str. Sfantul Lazar nr. 88', '1kg', 'laptop', 'express', 'cash', 46, 'Podu-Ros', 'deposited', '2021-01-07', '13:00-15:00', '8780248878538', 1),
(598, 'Ioana Alexia', '732395842', 'Str. Sfantul Lazar nr. 89', '1kg', 'laptop', 'express', 'cash', 63, 'Podu-Ros', 'deposited', '2021-06-16', '13:00-15:00', '6874459816471', 1);

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
  `password` varchar(256) NOT NULL,
  `role` varchar(10) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `cnp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `last_name`, `first_name`, `email`, `password`, `role`, `phone_number`, `cnp`) VALUES
(1, 'alin.vezeteu', 'Vezeteu', 'Alexandru-Alin', 'alin.vezeteu@yahoo.ro', '25d55ad283aa400af464c76d713c07ad', 'admin', '0742395715', 1234567890),
(2, 'andreea.manea', 'Manea', 'Andreea Beatrice', 'andreeamanea66@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'admin', '0732395842', 9876543210),
(3, 'costin_pelescu', 'Pelescu', 'Costin', 'costin43@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'client', '0748496715', NULL),
(4, 'maria.pelaru', 'Pelaru', 'Maria Georgiana', 'maria.pelaru@yahoo.com', '25d55ad283aa400af464c76d713c07ad', 'operator', '0765758746', 1465309278),
(5, 'horia.mihai', 'Horia', 'Mihai', 'mihai.horia@yahoo.com', '25d55ad283aa400af464c76d713c07ad', 'operator', '0775937029', 6789123453),
(6, 'silviu.manolache66', 'Manolache', 'Silviu Constantin', 'silviu.manolache@yahoo.com', '25d55ad283aa400af464c76d713c07ad', 'courier', '0776745847', 987654321),
(7, 'ursachi.ioana45', 'Ursachi', 'Ioana', 'ioana.ursachi@yahoo.com', '25d55ad283aa400af464c76d713c07ad', 'client', '0765798937', NULL),
(8, 'tataru.paul', 'Tataru', 'Paul', 'tataru.paul98@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'courier', '0765981031', 4567890123),
(9, 'rares.junica', 'Junica', 'Rares', 'junicarares@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'admin', '0756153967', 1234567890);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD KEY `id_courier` (`id_courier`);

--
-- Indexes for table `courier_requests`
--
ALTER TABLE `courier_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hour_change`
--
ALTER TABLE `hour_change`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hour_order` (`id_order`);

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
-- AUTO_INCREMENT for table `courier_requests`
--
ALTER TABLE `courier_requests`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hour_change`
--
ALTER TABLE `hour_change`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=599;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `id_courier` FOREIGN KEY (`id_courier`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hour_change`
--
ALTER TABLE `hour_change`
  ADD CONSTRAINT `hour_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
