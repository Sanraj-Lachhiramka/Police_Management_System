-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 03:52 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `police`
--

-- --------------------------------------------------------

--
-- Table structure for table `arrest`
--

CREATE TABLE `arrest` (
  `ArrestId` varchar(20) NOT NULL,
  `DOC` date DEFAULT NULL,
  `Location` text DEFAULT NULL,
  `CellNo` text DEFAULT NULL,
  `OfficerId` varchar(20) DEFAULT NULL,
  `CriminalId` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arrest`
--

INSERT INTO `arrest` (`ArrestId`, `DOC`, `Location`, `CellNo`, `OfficerId`, `CriminalId`) VALUES
('AR111', '2023-04-01', 'Mysuru Road', 'CJ101', 'CI101', '4041'),
('AR222', '2023-04-03', 'UB city', 'CJ202', 'CI200', '4042'),
('AR333', '2023-04-05', 'Orion mall', 'CJ144', 'CI340', '4043');

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `CaseId` varchar(20) NOT NULL,
  `Name` text DEFAULT NULL,
  `DOC` date DEFAULT NULL,
  `TOC` time DEFAULT NULL,
  `Location` text DEFAULT NULL,
  `CRIME` text DEFAULT NULL,
  `OfficerId` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`CaseId`, `Name`, `DOC`, `TOC`, `Location`, `CRIME`, `OfficerId`) VALUES
('20124545', 'Theft', '0000-00-00', '11:25:00', 'Reserve bank of India', 'Stolen 5 Cr', 'CI340'),
('27123232', 'Murder', '0000-00-00', '12:33:00', 'Bangalore  Palace', 'Murder of 2', 'CI101'),
('30033451', 'Extortion', '0000-00-00', '21:40:00', 'Church street', 'Extorted 1 Cr', 'CI200'),
('31456781', 'Rape', '0000-00-00', '20:20:00', 'Nation Resort', 'Gang rape', 'CI217'),
('41232316', 'Murder', '0000-00-00', '22:40:00', 'Mantri residency', 'Murder of a businessman', 'CI340');

-- --------------------------------------------------------

--
-- Table structure for table `complainant`
--

CREATE TABLE `complainant` (
  `ComplainantId` varchar(20) NOT NULL,
  `Name` text DEFAULT NULL,
  `Phone` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `ComplaintId` varchar(20) DEFAULT NULL,
  `RelationToVictim` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complainant`
--

INSERT INTO `complainant` (`ComplainantId`, `Name`, `Phone`, `Address`, `ComplaintId`, `RelationToVictim`) VALUES
('20344', 'Manish M', '6666666622', 'Jayanagar', '1033', 'Friend'),
('20347', 'Dhanush M', '7474747488', 'KR Road', '1045', 'Son'),
('20351', 'Rajesh Verma', '7898765432', 'Jayanagar', '2033', 'Brother'),
('20355', 'Vaishnavi S', '9876543210', 'Yeshwanthpur', '1011', 'Sister'),
('20370', 'Vijay Narayan', '8884371232', 'Lalbagh', '1011', 'Father');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `ComplaintId` varchar(20) NOT NULL,
  `Type` text DEFAULT NULL,
  `Complainant` text DEFAULT NULL,
  `DOC` date DEFAULT NULL,
  `Solved` text DEFAULT NULL,
  `CaseId` varchar(20) DEFAULT NULL,
  `OfficerId` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`ComplaintId`, `Type`, `Complainant`, `DOC`, `Solved`, `CaseId`, `OfficerId`) VALUES
('1011', 'Criminal', 'Rajesh Verma', '2023-02-28', 'Yes', '27123232', 'CI101'),
('1033', 'Criminal', 'Vijay Narayan', '2023-03-03', 'No', '31456781', 'CI101'),
('1045', 'Criminal', 'Vaishnavi S', '2023-04-01', 'No', '41232316', 'CI340'),
('2033', 'Criminal', 'Manish M', '2023-01-01', 'No', '41232316', 'CI217');

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE `criminal` (
  `CriminalId` varchar(20) NOT NULL,
  `Name` text DEFAULT NULL,
  `JailTerm` text DEFAULT NULL,
  `CaseId` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`CriminalId`, `Name`, `JailTerm`, `CaseId`) VALUES
('4041', 'Rocky', 'life', '27123232'),
('4042', 'Vicky', '10 yrs', '30033451'),
('4043', 'Michael', '5 yrs', '20124545');

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE `officer` (
  `OfficerId` varchar(20) NOT NULL,
  `FirstName` text DEFAULT NULL,
  `LastName` text DEFAULT NULL,
  `Ranking` text DEFAULT NULL,
  `Department` text DEFAULT NULL,
  `Phone` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `BloodGrp` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `officer`
--

INSERT INTO `officer` (`OfficerId`, `FirstName`, `LastName`, `Ranking`, `Department`, `Phone`, `Address`, `BloodGrp`) VALUES
('CI101', 'Ashok', 'Kumar', 'SI', 'Crime Investigation', '8872314512', 'Rajajinagar', 'Bpositive'),
('CI200', 'Rakesh', 'Karthik', 'Inspector', 'Crime Investigation', '9901234522', 'Majestic', 'Opositive'),
('CI217', 'Chandru', 'Rajkumar', 'Inspector', 'Crime Investigation', '8800044422', 'Banashankari', 'Opositive'),
('CI340', 'Sunil', 'Vadeyar', 'Inspector', 'Crime Investigation', '7700345621', 'Jayanagar', 'Apositive'),
('PA400', 'Vinod', 'Bhatt', 'Inspector', 'Patrol', '7878787894', 'Nagasandra', 'Apositive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arrest`
--
ALTER TABLE `arrest`
  ADD PRIMARY KEY (`ArrestId`),
  ADD KEY `OfficerId` (`OfficerId`),
  ADD KEY `CriminalId` (`CriminalId`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`CaseId`),
  ADD KEY `OfficerId` (`OfficerId`);

--
-- Indexes for table `complainant`
--
ALTER TABLE `complainant`
  ADD PRIMARY KEY (`ComplainantId`),
  ADD KEY `ComplaintId` (`ComplaintId`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`ComplaintId`),
  ADD KEY `CaseId` (`CaseId`),
  ADD KEY `OfficerId` (`OfficerId`);

--
-- Indexes for table `criminal`
--
ALTER TABLE `criminal`
  ADD PRIMARY KEY (`CriminalId`),
  ADD KEY `CaseId` (`CaseId`);

--
-- Indexes for table `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`OfficerId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrest`
--
ALTER TABLE `arrest`
  ADD CONSTRAINT `arrest_ibfk_1` FOREIGN KEY (`OfficerId`) REFERENCES `officer` (`OfficerId`),
  ADD CONSTRAINT `arrest_ibfk_2` FOREIGN KEY (`CriminalId`) REFERENCES `criminal` (`CriminalId`);

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`OfficerId`) REFERENCES `officer` (`OfficerId`);

--
-- Constraints for table `complainant`
--
ALTER TABLE `complainant`
  ADD CONSTRAINT `complainant_ibfk_1` FOREIGN KEY (`ComplaintId`) REFERENCES `complaint` (`ComplaintId`);

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`CaseId`) REFERENCES `cases` (`CaseId`),
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`OfficerId`) REFERENCES `officer` (`OfficerId`);

--
-- Constraints for table `criminal`
--
ALTER TABLE `criminal`
  ADD CONSTRAINT `criminal_ibfk_1` FOREIGN KEY (`CaseId`) REFERENCES `cases` (`CaseId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
