-- phpMyAdmin SQL Dump
-- version 5.2.0-dev
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2026 at 09:23 AM
-- Server version: 8.0.45-0ubuntu0.22.04.1
-- PHP Version: 8.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db2458345`
--

-- --------------------------------------------------------

--
-- Table structure for table `check_ins`
--

CREATE TABLE `check_ins` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `check_in_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out_time` timestamp NULL DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `check_ins`
--

INSERT INTO `check_ins` (`id`, `user_id`, `check_in_time`, `check_out_time`, `duration_minutes`, `points`, `status`) VALUES
(1, 1, '2026-04-28 11:05:04', NULL, NULL, NULL, 'active'),
(2, 1, '2026-04-28 11:09:40', NULL, NULL, NULL, 'active'),
(3, 1, '2026-04-28 11:47:46', NULL, NULL, NULL, 'active'),
(4, 1, '2026-04-28 12:00:25', NULL, NULL, NULL, 'active'),
(5, 1, '2026-04-28 12:09:04', NULL, NULL, NULL, 'active'),
(6, 1, '2026-04-28 12:17:22', NULL, NULL, NULL, 'active'),
(7, 1, '2026-04-28 12:17:25', NULL, NULL, NULL, 'active'),
(8, 1, '2026-04-28 12:17:27', NULL, NULL, NULL, 'active'),
(9, 1, '2026-04-28 12:21:45', NULL, NULL, NULL, 'active'),
(10, 1, '2026-04-28 14:33:30', NULL, NULL, NULL, 'active'),
(11, 1, '2026-05-06 09:10:22', NULL, NULL, NULL, 'active'),
(12, 1, '2026-05-06 09:34:47', NULL, NULL, NULL, 'active'),
(13, 1, '2026-05-06 09:47:33', '2026-05-06 09:47:52', 0, 0, 'checked_out'),
(14, 1, '2026-05-06 09:51:48', '2026-05-06 10:05:53', 14, 1, 'checked_out'),
(15, 1, '2026-05-06 10:38:53', '2026-05-06 10:51:54', 13, 1, 'checked_out'),
(16, 1, '2026-05-06 11:03:50', NULL, NULL, NULL, 'active'),
(17, 1, '2026-05-06 11:08:19', '2026-05-06 12:03:00', 55, 5, 'checked_out'),
(18, 1, '2026-05-07 07:57:17', '2026-05-07 08:21:39', 24, 2, 'checked_out');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `check_ins`
--
ALTER TABLE `check_ins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `check_ins`
--
ALTER TABLE `check_ins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
