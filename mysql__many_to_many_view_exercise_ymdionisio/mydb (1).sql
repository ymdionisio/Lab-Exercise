-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 11:28 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `depname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `depname`) VALUES
(1, 'dep1'),
(2, 'dep2'),
(3, 'dep3');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `mname` varchar(5) DEFAULT NULL,
  `address` varchar(35) NOT NULL,
  `salary` int(8) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `lname`, `fname`, `mname`, `address`, `salary`, `department_id`) VALUES
(1, 'Burdeos', 'John Erick', NULL, 'Taguig City', 10000, 0),
(2, 'Rosario', 'John Christian', NULL, 'Makati City', 50000, 0),
(3, 'Taborete', 'Lhoyd', NULL, 'Malabon City', 20000, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeedep`
-- (See below for the actual view)
--
CREATE TABLE `employeedep` (
`lname` varchar(45)
,`fname` varchar(45)
,`salary` int(8)
,`address` varchar(35)
,`depname` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeeticket`
-- (See below for the actual view)
--
CREATE TABLE `employeeticket` (
`lname` varchar(45)
,`fname` varchar(45)
,`salary` int(8)
,`type` varchar(45)
,`date` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_ticket`
--

CREATE TABLE `employee_has_ticket` (
  `employee_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_has_ticket`
--

INSERT INTO `employee_has_ticket` (`employee_id`, `ticket_id`) VALUES
(1, 1),
(2, 2),
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `type`, `date`, `description`) VALUES
(1, 'vip', 'january 9, 2000', NULL),
(2, 'vip', 'september 2, 2019', NULL),
(3, 'vip', 'january 9, 2000', NULL),
(4, 'vip', 'september 2, 2019', NULL);

-- --------------------------------------------------------

--
-- Structure for view `employeedep`
--
DROP TABLE IF EXISTS `employeedep`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employeedep`  AS  select `employee`.`lname` AS `lname`,`employee`.`fname` AS `fname`,`employee`.`salary` AS `salary`,`employee`.`address` AS `address`,`department`.`depname` AS `depname` from (`employee` join `department`) where `employee`.`id` = `department`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `employeeticket`
--
DROP TABLE IF EXISTS `employeeticket`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employeeticket`  AS  select `employee`.`lname` AS `lname`,`employee`.`fname` AS `fname`,`employee`.`salary` AS `salary`,`ticket`.`type` AS `type`,`ticket`.`date` AS `date` from ((`employee` join `ticket`) join `employee_has_ticket`) where `employee`.`id` = `employee_has_ticket`.`employee_id` and `ticket`.`id` = `employee_has_ticket`.`ticket_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
