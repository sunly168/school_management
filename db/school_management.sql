-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2017 at 03:27 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `levelid` int(11) NOT NULL,
  `levelname` varchar(255) NOT NULL,
  `pricepermonth` double NOT NULL,
  `priceperterm` double NOT NULL,
  `pricepersemester` double NOT NULL,
  `priceperyear` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` int(11) NOT NULL,
  `roomname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `roomname`) VALUES
(1, 'M1'),
(2, 'M2');

-- --------------------------------------------------------

--
-- Table structure for table `studentadmission`
--

CREATE TABLE `studentadmission` (
  `studentid` int(11) NOT NULL,
  `studentname` varchar(100) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dateofbirth` date NOT NULL,
  `placeofbirth` varchar(255) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `mobilephone` varchar(50) DEFAULT NULL,
  `emergencyphone` varchar(50) DEFAULT NULL,
  `fathername` varchar(100) DEFAULT NULL,
  `fatherjob` varchar(255) DEFAULT NULL,
  `mothername` varchar(100) DEFAULT NULL,
  `motherjob` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherid` int(11) NOT NULL,
  `teachername` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `roomid` int(11) NOT NULL,
  `levelid` int(11) NOT NULL,
  `phonenumber` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `photo` varchar(4000) NOT NULL,
  `biography` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `userid` smallint(6) NOT NULL,
  `username` varchar(25) NOT NULL,
  `userpassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`userid`, `username`, `userpassword`) VALUES
(1, 'ADMIN', '123456'),
(2, 'User1', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`levelid`),
  ADD UNIQUE KEY `levelid` (`levelid`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomid`),
  ADD UNIQUE KEY `roomid` (`roomid`),
  ADD KEY `roomid_2` (`roomid`);

--
-- Indexes for table `studentadmission`
--
ALTER TABLE `studentadmission`
  ADD PRIMARY KEY (`studentid`),
  ADD UNIQUE KEY `studentid` (`studentid`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherid`),
  ADD UNIQUE KEY `teacherid` (`teacherid`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `userid` (`userid`),
  ADD KEY `userid_2` (`userid`),
  ADD KEY `userid_3` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
