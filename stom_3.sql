-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2023 at 10:39 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stom`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `specialization` varchar(30) NOT NULL,
  `start_work` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `name`, `specialization`, `start_work`, `active`) VALUES
(6, 'Иванов Иван Иванович', 'врач-стоматолог', '2015-10-31 21:00:00', 1),
(7, 'Петров Петр Петрович', 'врач-анестезиолог', '2013-03-09 21:00:00', 1),
(8, 'Павлов Павел Павлович', 'врач-стоматолог', '2019-06-30 21:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) UNSIGNED NOT NULL,
  `service_name` varchar(40) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `price`) VALUES
(1, 'удаление зуба', 1500),
(2, 'лечение зуба', 3000),
(3, 'первичный прием', 800);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `shift_id` int(11) UNSIGNED NOT NULL,
  `type` enum('primary','secondary') NOT NULL DEFAULT 'primary',
  `start` timestamp NULL DEFAULT NULL,
  `finish` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `shift_id`, `type`, `start`, `finish`) VALUES
(39, 12, 8, 'primary', '2021-12-28 09:00:00', '2021-12-28 09:45:00'),
(40, 14, 8, 'primary', '2021-12-28 10:30:00', '2021-12-28 11:15:00'),
(41, 14, 9, 'primary', '2021-12-28 11:00:00', '2021-12-28 11:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `session_services`
--

CREATE TABLE `session_services` (
  `ss_id` int(11) UNSIGNED NOT NULL,
  `session_id` int(11) UNSIGNED NOT NULL,
  `service_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_services`
--

INSERT INTO `session_services` (`ss_id`, `session_id`, `service_id`) VALUES
(1, 39, 3),
(2, 40, 1),
(3, 41, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `shift_id` int(11) UNSIGNED NOT NULL,
  `doctor_id` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `finish` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`shift_id`, `doctor_id`, `date`, `start`, `finish`) VALUES
(8, 6, '2021-12-28', '2021-12-28 07:00:00', '2021-12-28 15:00:00'),
(9, 6, '2021-12-29', '2021-12-29 08:00:00', '2021-12-29 14:00:00'),
(10, 8, '2021-12-20', '2021-12-20 06:00:00', '2021-12-20 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` bigint(15) UNSIGNED NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `password`, `phone`, `admin`, `birth_date`) VALUES
(15, 'Карпутушкин Илья Владимирович', '49218c4c586c85c3625070df968c9d44', 89106000784, 0, '2008-04-20'),
(16, 'admin', 'ee6946ff7a034cb02b1feae8abda711e', 12345678912, 1, '2001-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `session_services`
--
ALTER TABLE `session_services`
  ADD PRIMARY KEY (`ss_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `session_services`
--
ALTER TABLE `session_services`
  MODIFY `ss_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `shift_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`) ON UPDATE CASCADE;

--
-- Constraints for table `session_services`
--
ALTER TABLE `session_services`
  ADD CONSTRAINT `session_services_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `session_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON UPDATE CASCADE;

--
-- Constraints for table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
