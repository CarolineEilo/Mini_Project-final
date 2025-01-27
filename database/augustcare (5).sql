-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 04:27 PM
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
-- Database: `augustcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `Username`, `password`) VALUES
(1, 'Admin', 'admin2024');

-- --------------------------------------------------------

--
-- Table structure for table `cleaner`
--

CREATE TABLE `cleaner` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `Username` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Password` varchar(150) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` varchar(150) NOT NULL,
  `domesticWork` varchar(150) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cleaner`
--

INSERT INTO `cleaner` (`ID`, `FullName`, `Username`, `email`, `PhoneNumber`, `Password`, `Age`, `Gender`, `domesticWork`, `Price`) VALUES
(1, 'Rodney', 'Rodney', 'rodney@gmail.com', 812894546, '$2y$10$0TCnwViWYK6tp7fRJn3fjepPbyQpXLGEiNcpM8xMr3xl0sl/wD6SG', 21, 'Male', 'Ironing', 230);

-- --------------------------------------------------------

--
-- Table structure for table `messagetbl`
--

CREATE TABLE `messagetbl` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messagetbl`
--

INSERT INTO `messagetbl` (`ID`, `Name`, `Email`, `message`, `date`) VALUES
(1, 'Elia Paulus', 'pauluselia856@gmail.com', ' ykl;olkjha', '2024-11-15 16:18:04'),
(2, 'Elia Paulus', 'pauluselia856@gmail.com', ' call me', '2024-11-15 16:19:23'),
(3, 'auleria', 'auleria@gmail.com', ' hi there', '2024-11-15 16:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `nannytbl`
--

CREATE TABLE `nannytbl` (
  `ID` int(5) NOT NULL,
  `Fullname` varchar(150) NOT NULL,
  `Username` varchar(150) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` int(15) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Age` int(5) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DomesticWork` varchar(150) NOT NULL,
  `Price` int(11) NOT NULL,
  `GegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nannytbl`
--

INSERT INTO `nannytbl` (`ID`, `Fullname`, `Username`, `Email`, `PhoneNumber`, `Password`, `Age`, `Gender`, `DomesticWork`, `Price`, `GegDate`) VALUES
(6, 'Elia Paulus', 'Cj577', 'pauluselia856@gmail.com', 812894735, '0', 21, 'Male', 'Ironing', 322, '2024-11-15 05:35:16'),
(8, 'auleria', 'Ria', 'auleria@gmail.com', 812894735, '$2y$10$AkV6RMM/caLq2s/rAfzYDuHvajLr3nsbQgSahmdu9oN', 21, 'Female', 'Other', 322, '2024-11-15 08:38:15'),
(10, 'Rodney', 'Rodney', 'rodney@gmail.com', 812894546, '$2y$10$TWzaS20NlaE0W187ruMQne5nl6aI6qdxWn2AH7dfe0b', 21, 'Male', 'Washing', 32, '2024-11-15 13:41:35'),
(11, 'aguste', 'aguste11', 'aguste@gmail.com', 812894735, '$2y$10$ADfAJ9wD.o3D91Q1BxAoUu1qwQOokb9oMa60t/AOkg1', 25, 'Female', 'Cleaning', 450, '2024-11-15 16:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parent_id INT NOT NULL,
    nanny_id INT NOT NULL,
    parent_name VARCHAR(255),
    nanny_email VARCHAR(255),
    message TEXT,
    status ENUM('unread', 'read') DEFAULT 'unread',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parentstbl`
--

CREATE TABLE `parentstbl` (
  `ID` int(5) NOT NULL,
  `Fullname` varchar(150) NOT NULL,
  `Username` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentstbl`
--

INSERT INTO `parentstbl` (`ID`, `Fullname`, `Username`, `Email`, `PhoneNumber`, `Password`, `RegDate`) VALUES
(1, 'Elia Paulus', 'Cj577', 'pauluselia856@gmail.com', 812894735, '$2y$10$00HeQQReBOErCsJmC65/Kuy', '2024-11-14 23:37:11'),
(2, 'Elia Paulus', 'Cj577', 'pauluselia856@gmail.com', 812894735, '$2y$10$tI2BnSgyBEP4tW3Ajk3bXO7', '2024-11-14 23:37:15'),
(3, 'Elia Paulus', 'Cj577', 'pauluselia856@gmail.com', 812894735, '$2y$10$EWdUA6KzuKvrkPcP6JlD2ek', '2024-11-14 23:38:16'),
(4, 'Grace', 'Grace111', 'grace@gmail.com', 812894735, '$2y$10$yEuva.P1GguOZ6b3y5ubIer', '2024-11-15 06:59:23'),
(5, 'Grace', 'Grace111', 'grace@gmail.com', 812894735, '$2y$10$LdORtXaIkE0psgrQSqRwXek', '2024-11-15 07:09:32'),
(6, 'Grace', 'Grace111', 'grace@gmail.com', 812894735, '$2y$10$3KhfBH4sTse9hC9J0P0xNOJ', '2024-11-15 07:28:40'),
(7, 'eliza', 'eliza11', 'eliza@gmail.com', 816148855, '$2y$10$PH.eH6S/.sGtimKpypUEiu6', '2024-11-15 16:44:22'),
(8, 'Nali', 'nali', 'nali@gmail.com', 816430811, '$2y$10$.DP5YWVLQySt7C76vdWRre0', '2024-11-25 05:52:30');

-- --------------------------------------------------------
INSERT INTO notifications (parent_id, nanny_id, parent_name, nanny_email, message, status)
VALUES (1, 6, 'Grace', 'nanny@example.com', 'You have a new request!', 'unread');

--
-- Table structure for table `searchnanny`
--

CREATE TABLE `searchnanny` (
  `id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `numberOfchildren` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `ageCategory` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `domesticWork` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `searchnanny`
--
SELECT * FROM notifications WHERE nanny_id = 6 AND status = 'unread';

INSERT INTO `searchnanny` (`id`, `location`, `numberOfchildren`, `datetime`, `ageCategory`, `language`, `domesticWork`, `price`) VALUES
(1, 'Otjomuise', 2, '2024-11-23 12:29:00', 'Baby', 'Oshiwambo', 'Ironing', 555.00),
(2, 'Khomasdal', 3, '2024-11-21 15:25:00', 'Toddler', 'Herero', 'Others', 550.00),
(3, 'Khomasdal', 3, '2024-11-21 15:25:00', 'Toddler', 'Herero', 'Others', 550.00);

--
-- Indexes for dumped tables
--
UPDATE notifications
SET status = 'read'
WHERE id = 1;

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `messagetbl`
--
ALTER TABLE `messagetbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `nannytbl`
--
ALTER TABLE `nannytbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parentstbl`
--
ALTER TABLE `parentstbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `searchnanny`
--
ALTER TABLE `searchnanny`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cleaner`
--
ALTER TABLE `cleaner`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messagetbl`
--
ALTER TABLE `messagetbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nannytbl`
--
ALTER TABLE `nannytbl`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parentstbl`
--
ALTER TABLE `parentstbl`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `searchnanny`
--
ALTER TABLE `searchnanny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
