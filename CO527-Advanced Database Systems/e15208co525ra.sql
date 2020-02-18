-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 17, 2020 at 02:47 PM
-- Server version: 8.0.19
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DNAME` varchar(20) NOT NULL,
  `DNUMBER` int NOT NULL,
  `MGRSSN` int NOT NULL,
  `MGRSTARTDATE` date NOT NULL,
  PRIMARY KEY (`DNUMBER`),
  KEY `MGRSSN` (`MGRSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DNAME`, `DNUMBER`, `MGRSSN`, `MGRSTARTDATE`) VALUES
('Headquaters', 1, 888665555, '1981-06-19'),
('Administration', 4, 987654321, '1995-01-01'),
('Research', 5, 333445555, '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
CREATE TABLE IF NOT EXISTS `dependent` (
  `ESSN` int NOT NULL,
  `DEPENDENT_NAME` varchar(45) NOT NULL,
  `SEX` varchar(5) NOT NULL,
  `BDATE` date NOT NULL,
  `RELATIOSHIP` varchar(45) NOT NULL,
  PRIMARY KEY (`ESSN`,`DEPENDENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`ESSN`, `DEPENDENT_NAME`, `SEX`, `BDATE`, `RELATIOSHIP`) VALUES
(123456789, 'Alice', 'F', '1988-12-30', 'DAUGHTER\r'),
(123456789, 'Elizabeth', 'F', '1967-05-05', 'SPOUSE'),
(123456789, 'Michael', 'M', '1988-01-04', 'SON\r'),
(333445555, 'Alice', 'F', '1986-04-05', 'DAUGHTER\r'),
(333445555, 'Joy', 'F', '1958-05-03', 'SPOUSE\r'),
(333445555, 'Theodore', 'M', '1983-10-25', 'SON\r'),
(987654321, 'Abner', 'M', '1942-02-28', 'SPOUSE\r');

-- --------------------------------------------------------

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
CREATE TABLE IF NOT EXISTS `dept_locations` (
  `DNUMBER` int NOT NULL,
  `DLOCATION` varchar(20) NOT NULL,
  PRIMARY KEY (`DNUMBER`,`DLOCATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dept_locations`
--

INSERT INTO `dept_locations` (`DNUMBER`, `DLOCATION`) VALUES
(1, 'Houston\r'),
(4, 'Stafford\r'),
(5, 'Bellaire\r'),
(5, 'Houston'),
(5, 'Sugarland\r');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `FNAME` varchar(20) NOT NULL,
  `MINIT` varchar(5) NOT NULL,
  `LNAME` varchar(20) NOT NULL,
  `SSN` int NOT NULL,
  `BDAY` date NOT NULL,
  `ADDRESS` varchar(45) NOT NULL,
  `SEX` varchar(5) NOT NULL,
  `SALARY` int NOT NULL,
  `SUPERSSN` int DEFAULT NULL,
  `DNO` int NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `DNO` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`FNAME`, `MINIT`, `LNAME`, `SSN`, `BDAY`, `ADDRESS`, `SEX`, `SALARY`, `SUPERSSN`, `DNO`) VALUES
('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren,Houston,Tx', 'M', 30000, 333445555, 5),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss,Houston,TX', 'M', 40000, 888665555, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice,Houston,TX', 'F', 25000, 333445555, 5),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak,Humble,TX', 'M', 38000, 333445555, 5),
('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stonr,Houston,TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry,Bellaire,TX', 'F', 43000, 888665555, 4),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas,Houston,TX', 'M', 25000, 987654321, 4),
('Alicia', 'J', 'Zelaya', 999887777, '1968-07-19', '3321 Castle,Spring,TX', 'F', 25000, 987654321, 4);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `PNAME` varchar(20) NOT NULL,
  `PNUMBER` int NOT NULL,
  `PLOCATION` varchar(45) NOT NULL,
  `DNUM` int NOT NULL,
  PRIMARY KEY (`PNUMBER`),
  KEY `DNUM` (`DNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PNAME`, `PNUMBER`, `PLOCATION`, `DNUM`) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
CREATE TABLE IF NOT EXISTS `works_on` (
  `ESSN` int NOT NULL,
  `PNO` int NOT NULL,
  `HOURS` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`PNO`),
  KEY `PNO` (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`ESSN`, `PNO`, `HOURS`) VALUES
(123456789, 1, '32.5'),
(123456789, 2, '7.5'),
(333445555, 2, '10.0'),
(333445555, 3, '10.0'),
(333445555, 10, '10.0'),
(333445555, 20, '10.0'),
(453453453, 1, '20.0'),
(453453453, 2, '20.0'),
(666884444, 3, '40.0'),
(888665555, 20, '0.0'),
(987654321, 20, '15.0'),
(987654321, 30, '20.0'),
(987987987, 10, '35.0'),
(987987987, 30, '5.0'),
(999887777, 10, '10.0'),
(999887777, 30, '30.0');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGRSSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`DNUMBER`) REFERENCES `department` (`DNUMBER`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNUMBER`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNUM`) REFERENCES `department` (`DNUMBER`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNO`) REFERENCES `project` (`PNUMBER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
