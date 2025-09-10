-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2025 at 05:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diabetes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `Pregnancies` int(11) DEFAULT NULL,
  `Glucose` int(11) DEFAULT NULL,
  `BloodPressure` int(11) DEFAULT NULL,
  `SkinThickness` int(11) DEFAULT NULL,
  `Insulin` int(11) DEFAULT NULL,
  `BMI` float DEFAULT NULL,
  `DiabetesPedigreeFunction` float DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Outcome` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `Pregnancies`, `Glucose`, `BloodPressure`, `SkinThickness`, `Insulin`, `BMI`, `DiabetesPedigreeFunction`, `Age`, `Outcome`) VALUES
(1, 2, 120, 70, 20, 85, 25.5, 0.351, 29, NULL),
(2, 4, 150, 80, 25, 120, 30.1, 0.627, 35, NULL),
(3, 0, 95, 60, 15, 90, 22.4, 0.245, 23, NULL),
(4, 3, 180, 90, 40, 200, 33.8, 0.672, 50, NULL),
(5, 1, 130, 72, 18, 88, 28.6, 0.45, 31, NULL),
(6, 5, 165, 95, 35, 210, 37.2, 0.879, 45, NULL),
(7, 7, 140, 85, 29, 130, 31, 0.512, 38, NULL),
(8, 6, 175, 100, 32, 220, 36.5, 1.12, 52, NULL),
(9, 0, 110, 65, 12, 75, 23.5, 0.289, 22, NULL),
(10, 8, 190, 105, 41, 250, 39.1, 0.965, 60, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
