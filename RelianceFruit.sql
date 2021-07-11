-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2021 at 07:40 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Fruit`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_proof_documents`
--

CREATE TABLE IF NOT EXISTS `address_proof_documents` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Document_Name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Sort_Order` int(2) NOT NULL,
  `Active` int(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Document_Name` (`Document_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_data`
--

CREATE TABLE IF NOT EXISTS `admin_login_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `Role` int(11) NOT NULL,
  `StaffID` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL DEFAULT 'logo.png',
  `PhoneNo` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `loginDate` date NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `isStaff` tinyint(1) NOT NULL DEFAULT '0',
  `isOffice` tinyint(1) NOT NULL DEFAULT '0',
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `D_Date` date NOT NULL,
  `D_Time` time NOT NULL,
  `D_User` varchar(200) NOT NULL,
  `D_IP` varchar(200) NOT NULL,
  `Reference_Code` varchar(200) DEFAULT NULL,
  `AppInstallation_Date` date NOT NULL,
  `AppInstallation_Time` time NOT NULL,
  `FirebaseToken` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `User` varchar(200) NOT NULL,
  `Time` time NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `admin_login_data`
--

INSERT INTO `admin_login_data` (`ID`, `FirstName`, `LastName`, `Role`, `StaffID`, `Email`, `Photo`, `PhoneNo`, `Password`, `loginDate`, `isAdmin`, `isStaff`, `isOffice`, `isVerified`, `isDeleted`, `D_Date`, `D_Time`, `D_User`, `D_IP`, `Reference_Code`, `AppInstallation_Date`, `AppInstallation_Time`, `FirebaseToken`, `Date`, `User`, `Time`, `IP`) VALUES
(2, 'Admin', '123', 0, 'ADMIN123', 'admin@hmail.com', 'logo.png', '9999999999', '123456', '2019-10-26', 1, 0, 0, 1, 0, '0000-00-00', '00:00:00', '', '', NULL, '0000-00-00', '00:00:00', '', '0000-00-00', '', '00:00:00', ''),
(7, 'Parag', 'Deka', 2, 'Parag241', 'parag.moni44@gmsil.com', 'artboard.png', '7002608241', '123456', '0000-00-00', 0, 0, 1, 0, 0, '0000-00-00', '00:00:00', '', '', NULL, '0000-00-00', '00:00:00', '', '2020-02-18', 'ADMIN123', '17:11:41', '47.29.140.135');

-- --------------------------------------------------------

--
-- Table structure for table `app_importance_type`
--

CREATE TABLE IF NOT EXISTS `app_importance_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Importance_Type` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Importance_Type` (`Importance_Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_importance_type_driver`
--

CREATE TABLE IF NOT EXISTS `app_importance_type_driver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Importance_Type` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Importance_Type` (`Importance_Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_version`
--

CREATE TABLE IF NOT EXISTS `app_version` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `Version` varchar(255) NOT NULL,
  `Importance` tinyint(4) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_version`
--

INSERT INTO `app_version` (`ID`, `Version`, `Importance`, `Date`, `Time`, `User`, `IP`) VALUES
(1, '3', 1, '2018-03-14', '15:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_version_driver`
--

CREATE TABLE IF NOT EXISTS `app_version_driver` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `Version` varchar(255) NOT NULL,
  `Importance` tinyint(4) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `back_office_users`
--

CREATE TABLE IF NOT EXISTS `back_office_users` (
  `User_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Phone` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `User_Level` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Created_By` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE IF NOT EXISTS `banks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Bank` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Sort_Order` int(3) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Bank` (`Bank`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
  `Bill_No` int(11) NOT NULL AUTO_INCREMENT,
  `Bill_Date` date NOT NULL,
  `Payment_Mode` int(11) NOT NULL,
  `Transaction_Number` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Ride` int(11) NOT NULL,
  `Minimum_Fare` int(11) NOT NULL,
  `Ride_Fare` int(11) NOT NULL,
  `Total_Fare` int(11) NOT NULL,
  `Promo_Code` varchar(6) COLLATE latin1_general_ci DEFAULT NULL,
  `Discount_Amount` int(11) DEFAULT NULL,
  `Total_After_Discount` int(11) NOT NULL,
  `Tax_IDs` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Total_Tax_Amount` int(11) NOT NULL,
  `Gross_Amount` int(11) NOT NULL,
  `Hellocab_Share_On_Ride` int(11) NOT NULL,
  `Owner_Share_On_Ride` int(11) NOT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`Bill_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_payment_mode`
--

CREATE TABLE IF NOT EXISTS `bill_payment_mode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mode` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Mode` (`Mode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `book_platters`
--

CREATE TABLE IF NOT EXISTS `book_platters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Occasion` varchar(200) NOT NULL,
  `UserID` int(11) NOT NULL,
  `PlatterID` int(11) NOT NULL,
  `Booking_date` date NOT NULL,
  `Booking_time` time NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Price` float(10,2) NOT NULL,
  `Message` varchar(200) NOT NULL,
  `FinalMessage` varchar(200) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `book_platters`
--

INSERT INTO `book_platters` (`ID`, `Occasion`, `UserID`, `PlatterID`, `Booking_date`, `Booking_time`, `Description`, `Address`, `Price`, `Message`, `FinalMessage`, `Status`, `Date`, `Time`, `IP`) VALUES
(1, 'Anniversary', 24, 3, '2021-01-12', '10:33:00', 'test', 'Bishnu Path, à¤—à¤£à¥‡à¤¶ à¤¨à¤—à¤°, à¤²à¤Ÿà¤•à¤¤à¤¾, Guwahati, à¤®à¥‡à¤˜à¤¾à¤²à¤¯ 781029, India', 0.00, '', '', 0, '2021-01-02', '20:03:11', ''),
(2, 'Others', 24, 3, '2021-01-21', '03:04:00', 'tcyubububuub', '29C Troupant Ave, Magaliessig, Sandton, 2191, South Africa', 0.00, '', '', 0, '2021-01-11', '14:05:18', ''),
(3, 'Party', 24, 1012, '2021-01-19', '11:28:00', 'test ios', 'Basisthachal Path', 0.00, '', '', 0, '2021-01-19', '20:07:36', ''),
(4, 'Party', 24, 1012, '2021-01-19', '11:28:00', 'test ios', 'Basisthachal Path', 0.00, '', '', 0, '2021-01-19', '20:08:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `book_ride`
--

CREATE TABLE IF NOT EXISTS `book_ride` (
  `ID` int(200) NOT NULL AUTO_INCREMENT,
  `Is_Running` tinyint(1) NOT NULL DEFAULT '0',
  `No_of_Seats` int(11) NOT NULL DEFAULT '0',
  `OTP` int(11) NOT NULL COMMENT 'Auto Generated',
  `IDDelivery` int(11) NOT NULL,
  `Unique_Ride_Code` varchar(255) NOT NULL COMMENT 'Auto Generated',
  `User_ID` int(11) NOT NULL,
  `Driver_ID` varchar(110) DEFAULT NULL,
  `Vehicle_ID` varchar(110) DEFAULT NULL,
  `uMobile` varchar(200) DEFAULT NULL,
  `From_Address` varchar(200) NOT NULL,
  `From_area` varchar(200) NOT NULL,
  `To_Address` varchar(500) NOT NULL,
  `From_Latitude` float(10,6) NOT NULL,
  `From_Longitude` float(10,6) NOT NULL,
  `To_Latitude` float(10,6) NOT NULL,
  `To_Longitude` float(10,6) NOT NULL,
  `Booking_Date` date DEFAULT NULL,
  `Booking_Time` time DEFAULT NULL,
  `Driver_Accepted_Date` date DEFAULT NULL,
  `Driver_Accepted_Time` time DEFAULT NULL,
  `ETR` varchar(200) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `Start_time` time DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `End_time` time DEFAULT NULL,
  `Map_Snapshot` varchar(255) DEFAULT NULL,
  `Distance_Travel` float(10,2) DEFAULT NULL,
  `Cost` float(10,2) DEFAULT NULL,
  `pCost` float(10,2) NOT NULL DEFAULT '0.00',
  `User_Rating_By_Driver` float(10,1) DEFAULT '0.0',
  `Driver_Rating_By_User` float(10,1) DEFAULT '0.0',
  `User_Review` varchar(255) DEFAULT NULL,
  `Driver_Review` varchar(255) DEFAULT NULL,
  `is_Ride_Later` tinyint(1) NOT NULL DEFAULT '0',
  `Is_Roudtrip` tinyint(1) NOT NULL DEFAULT '0',
  `Return_date` date DEFAULT NULL,
  `Return_time` time DEFAULT NULL,
  `PaymentMode` int(11) NOT NULL,
  `PaymentVerified` int(11) NOT NULL DEFAULT '0',
  `Amount` float(10,2) NOT NULL,
  `ChangePaid` int(11) NOT NULL,
  `Is_Paid` tinyint(1) NOT NULL DEFAULT '0',
  `Ride_Cancelled_by` tinyint(1) DEFAULT '0',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `book_ride`
--

INSERT INTO `book_ride` (`ID`, `Is_Running`, `No_of_Seats`, `OTP`, `IDDelivery`, `Unique_Ride_Code`, `User_ID`, `Driver_ID`, `Vehicle_ID`, `uMobile`, `From_Address`, `From_area`, `To_Address`, `From_Latitude`, `From_Longitude`, `To_Latitude`, `To_Longitude`, `Booking_Date`, `Booking_Time`, `Driver_Accepted_Date`, `Driver_Accepted_Time`, `ETR`, `Start_Date`, `Start_time`, `End_Date`, `End_time`, `Map_Snapshot`, `Distance_Travel`, `Cost`, `pCost`, `User_Rating_By_Driver`, `Driver_Rating_By_User`, `User_Review`, `Driver_Review`, `is_Ride_Later`, `Is_Roudtrip`, `Return_date`, `Return_time`, `PaymentMode`, `PaymentVerified`, `Amount`, `ChangePaid`, `Is_Paid`, `Ride_Cancelled_by`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 0, 0, 138697, 1, '56729546760238ee197b590.73137768', 42, NULL, NULL, NULL, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-10', '09:44:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 325.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 300.00, 1, 1, 0, '2021-02-10', '09:44:00', '3', '1'),
(2, 0, 0, 362537, 2, '191150807760238ee22819c1.91999851', 42, NULL, NULL, NULL, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-10', '09:44:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 325.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 300.00, 1, 1, 0, '2021-02-10', '09:44:00', '3', '1'),
(3, 0, 0, 778575, 3, '1363533802602394892317e5.44282660', 40, NULL, NULL, NULL, '75 Hugo road4190', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-10', '10:08:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 80.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 200.00, 1, 1, 0, '2021-02-10', '10:08:00', '3', '1'),
(4, 0, 0, 677141, 4, '16071110256023948a49e7b4.95338419', 40, NULL, NULL, NULL, '75 Hugo road4190', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-10', '10:08:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 80.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 200.00, 1, 1, 0, '2021-02-10', '10:08:00', '3', '1'),
(5, 0, 0, 427565, 5, '4013242036023a04dc3f003.01574514', 42, NULL, NULL, NULL, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-10', '10:58:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 2020.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 3000.00, 1, 1, 0, '2021-02-10', '10:58:00', '3', '1'),
(6, 0, 0, 596283, 6, '851302136023a04ea7b9e0.69167464', 42, NULL, NULL, NULL, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-10', '10:58:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 2020.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 3000.00, 1, 1, 0, '2021-02-10', '10:58:00', '3', '1'),
(8, 0, 0, 315420, 8, '1563642606024f2d643edd5.71952794', 40, NULL, NULL, NULL, 'usha3201', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-11', '11:03:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 80.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 500.00, 1, 1, 0, '2021-02-11', '11:03:00', '3', '1'),
(9, 0, 0, 885056, 9, '10141725696024f2d71c37f6.38781723', 40, NULL, NULL, NULL, 'usha3201', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-11', '11:03:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 80.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 500.00, 1, 1, 0, '2021-02-11', '11:03:00', '3', '1'),
(10, 0, 0, 782228, 10, '8413525496024f3d6261e32.96797105', 42, NULL, NULL, NULL, 'NANA', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-11', '11:07:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 550.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 699.00, 1, 1, 0, '2021-02-11', '11:07:00', '3', '1'),
(11, 0, 0, 679026, 11, '31603300602672e13801e1.29216157', 42, NULL, NULL, NULL, 'NANA', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-02-12', '14:21:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 705.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 0.00, 1, 1, 0, '2021-02-12', '14:21:00', '3', '1'),
(12, 0, 0, 524472, 12, '115092316603e0c105fab67.38518780', 45, NULL, NULL, NULL, '75 HUGO ROAD3201', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-03-02', '11:57:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 90.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 200.00, 1, 1, 0, '2021-03-02', '11:57:00', '3', '1'),
(13, 0, 0, 697850, 13, '926399600603e0c2171a813.68875665', 45, NULL, NULL, NULL, '75 HUGO ROAD3201', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-03-02', '11:57:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 200.00, 0, 1, 0, '2021-03-02', '11:57:00', '3', '1'),
(14, 0, 0, 439703, 14, '739140674603e7c55d0e477.43514734', 24, NULL, NULL, NULL, 'O', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-03-02', '19:56:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 60.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 200.00, 0, 1, 0, '2021-03-02', '19:56:00', '3', '1'),
(15, 0, 0, 5500, 0, '373528411604bd9c67d0e49.20674095', 16, NULL, NULL, NULL, 'House No: | 29C Troupant Ave, Magaliessig, Sandton, 2191, South Africa| | Troupant Avenue| 2191', 'Sandton', '', -26.035564, 28.019857, 0.000000, 0.000000, '2021-03-12', '23:14:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 60.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0.00, 0, 0, 0, '2021-03-12', '23:14:00', '16', 'fe80::32e7:ae04:1dee:d1e5%wlan0'),
(16, 0, 0, 632158, 16, '208726449660618fa6681499.79002173', 42, NULL, NULL, NULL, 'NANA', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-03-29', '10:28:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 80.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 500.00, 1, 1, 0, '2021-03-29', '10:28:00', '3', '1'),
(17, 0, 0, 995691, 17, '1554141768606190579d12f7.37527497', 42, NULL, NULL, NULL, 'NANA', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-03-29', '10:31:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 160.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 200.00, 1, 1, 0, '2021-03-29', '10:31:00', '3', '1'),
(18, 0, 0, 634070, 18, '157679162560619285176ca5.70802637', 35, NULL, NULL, NULL, 'Optional(&quot;75 Hugo road |75 |Berea|4091&quot;)', '', '', -29.832321, 30.981937, 0.000000, 0.000000, '2021-03-29', '10:40:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 1140.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0.00, 0, 0, 0, '2021-03-29', '10:40:00', '35', '1'),
(19, 0, 0, 486323, 19, '110603546760619288ecc980.05174424', 35, NULL, NULL, NULL, 'Optional(&quot;75 Hugo road |75 |Berea|4091&quot;)', '', '', -29.832321, 30.981937, 0.000000, 0.000000, '2021-03-29', '10:40:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 1140.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0.00, 0, 0, 0, '2021-03-29', '10:40:00', '35', '1'),
(20, 0, 0, 627627, 20, '1110039812606196f387c4b5.53741206', 35, NULL, NULL, NULL, '75 HUGO ROZD3201', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-03-29', '10:59:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 240.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 0.00, 0, 1, 0, '2021-03-29', '10:59:00', '18', '1'),
(21, 0, 0, 922431, 21, '49952184606360af19f262.36227114', 42, NULL, NULL, NULL, 'NANA', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-03-30', '19:32:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 185.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 190.00, 1, 1, 0, '2021-03-30', '19:32:00', '3', '1'),
(22, 0, 0, 520569, 22, '9097819966063614f3ce4f8.04594274', 24, NULL, NULL, NULL, 'Optional(&quot;Basisthachal Path||Basisthachal Path|781028&quot;)', '', '', 26.096649, 91.794540, 0.000000, 0.000000, '2021-03-30', '19:35:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 430.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0.00, 0, 0, 0, '2021-03-30', '19:35:00', '24', '1'),
(23, 0, 0, 856258, 23, '607816846082cf0a740713.64511548', 59, NULL, NULL, NULL, 'Optional(&quot;Maharashtra|ward no.2 Durgapur near Anganwadi Kendra |Chandrapur|442402&quot;)', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-04-23', '15:43:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 45.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0.00, 0, 0, 0, '2021-04-23', '15:43:00', '59', '1'),
(24, 0, 0, 800780, 24, '1867219378608d3ffbcd9fd1.10992490', 62, NULL, NULL, NULL, 'Optional(&quot;Delhi|b1/371 janakpuri ffloor|New Delhi|110058&quot;)', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-05-01', '13:48:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 270.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0.00, 0, 0, 0, '2021-05-01', '13:48:00', '62', '1'),
(25, 0, 0, 347908, 25, '204854270608d3ffd25b647.47135050', 62, NULL, NULL, NULL, 'Optional(&quot;Delhi|b1/371 janakpuri ffloor|New Delhi|110058&quot;)', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-05-01', '13:48:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 270.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0.00, 0, 0, 0, '2021-05-01', '13:48:00', '62', '1'),
(26, 0, 0, 386324, 26, '29621134960911a27c61b72.92292674', 64, NULL, NULL, NULL, '95 SPEARMAN ROAD4004', '', '', 0.000000, 0.000000, 0.000000, 0.000000, '2021-05-04', '11:55:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 0.00, 0, 1, 0, '2021-05-04', '11:55:00', '18', '1');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `canteen_AD`
--

CREATE TABLE IF NOT EXISTS `canteen_AD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `User` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `canteen_AD`
--

INSERT INTO `canteen_AD` (`ID`, `Title`, `Description`, `Photo`, `isActive`, `User`, `Date`, `Time`) VALUES
(4, '', '', '502.png', 1, 'ADMIN123', '2020-11-25', '20:28:15'),
(5, '', '', '749.png', 1, 'ADMIN123', '2020-11-25', '21:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `canteen_review`
--

CREATE TABLE IF NOT EXISTS `canteen_review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CanteenID` int(11) NOT NULL,
  `Review` varchar(200) NOT NULL,
  `Rating` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `checks`
--

CREATE TABLE IF NOT EXISTS `checks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `Filepath` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `clusters`
--

CREATE TABLE IF NOT EXISTS `clusters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE IF NOT EXISTS `contactus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDUser` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Messages` mediumtext NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`ID`, `IDUser`, `Email`, `Messages`, `Date`, `Time`) VALUES
(1, '0', 'inow.ani@gmail.com', 'pppppp', '2020-11-25', '18:27:00'),
(2, '0', 'inow.ani@gmail.com', 'pppppp', '2020-11-25', '18:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `current_locations`
--

CREATE TABLE IF NOT EXISTS `current_locations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mobile` varchar(255) NOT NULL,
  `Lattitude` varchar(255) NOT NULL,
  `Longitude` varchar(255) NOT NULL,
  `Tracking_Type` varchar(11) DEFAULT NULL COMMENT 'OnRide, NoRide, Offline',
  `Date_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `current_locations_user_on_ride`
--

CREATE TABLE IF NOT EXISTS `current_locations_user_on_ride` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Latitude` float(10,6) NOT NULL,
  `Longitude` float(10,6) NOT NULL,
  `SOS` tinyint(1) NOT NULL DEFAULT '0',
  `Tracking_Type` varchar(200) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `delievered`
--

CREATE TABLE IF NOT EXISTS `delievered` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `DriverID` int(11) NOT NULL DEFAULT '0',
  `Delivered` int(11) NOT NULL,
  `Acceptmessage` mediumtext NOT NULL,
  `Acceptdate` date NOT NULL,
  `Accepttime` time NOT NULL,
  `Confirmmessage` mediumtext NOT NULL,
  `Confirmdate` date NOT NULL,
  `Confirmtime` time NOT NULL,
  `Driveradddate` date NOT NULL,
  `Driveraddtime` time NOT NULL,
  `onthewaymessage` mediumtext NOT NULL,
  `onthewaydate` date NOT NULL,
  `onthewaytime` time NOT NULL,
  `Reason` mediumtext NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `delievered`
--

INSERT INTO `delievered` (`ID`, `OrderID`, `DriverID`, `Delivered`, `Acceptmessage`, `Acceptdate`, `Accepttime`, `Confirmmessage`, `Confirmdate`, `Confirmtime`, `Driveradddate`, `Driveraddtime`, `onthewaymessage`, `onthewaydate`, `onthewaytime`, `Reason`, `Date`, `Time`) VALUES
(1, 138697, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-10', '09:44:00'),
(2, 362537, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-10', '09:44:00'),
(3, 778575, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-10', '10:08:00'),
(4, 677141, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-10', '10:08:00'),
(5, 427565, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-10', '10:58:00'),
(6, 596283, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-10', '10:58:00'),
(7, 738808, 0, 6, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-10', '12:16:00'),
(8, 315420, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-11', '11:03:00'),
(9, 885056, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-11', '11:03:00'),
(10, 782228, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-11', '11:07:00'),
(11, 679026, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-02-12', '14:21:00'),
(12, 524472, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-02', '11:57:00'),
(13, 697850, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-02', '11:57:00'),
(14, 439703, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-02', '19:56:00'),
(15, 5500, 0, 0, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-12', '23:14:00'),
(16, 632158, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-29', '10:28:00'),
(17, 995691, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-29', '10:31:00'),
(18, 634070, 0, 1, 'Done', '2021-04-20', '22:05:56', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-29', '10:40:00'),
(19, 486323, 0, 2, 'delivery will be done today', '2021-03-29', '10:43:21', '', '2021-03-29', '11:10:13', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-29', '10:40:00'),
(20, 627627, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-29', '10:59:00'),
(21, 922431, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-30', '19:32:00'),
(22, 520569, 0, 0, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-03-30', '19:35:00'),
(23, 856258, 0, 0, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-04-23', '15:43:00'),
(24, 800780, 0, 0, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-05-01', '13:48:00'),
(25, 347908, 0, 0, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-05-01', '13:48:00'),
(26, 386324, 0, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-05-04', '11:55:00'),
(27, 867964, 0, 6, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-05-29', '11:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `dinner_booking`
--

CREATE TABLE IF NOT EXISTS `dinner_booking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CanteenID` int(11) NOT NULL,
  `No_of_persons` int(11) NOT NULL,
  `Booking_Date` date NOT NULL,
  `Booking_time` time NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `driver_details`
--

CREATE TABLE IF NOT EXISTS `driver_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Driver_OTP` int(11) DEFAULT NULL,
  `Owner_ID` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Phone_No` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Identification_Mark` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT 'profile_image.png',
  `Address` varchar(500) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Pin` varchar(255) DEFAULT NULL,
  `Pancard_No` varchar(255) DEFAULT NULL,
  `Pancard_Photo` varchar(255) DEFAULT NULL,
  `Addressproof_Document` int(11) NOT NULL,
  `Addressproof_No` varchar(50) DEFAULT NULL,
  `Addressproof_Photo` varchar(255) DEFAULT NULL,
  `Driving_License_No` varchar(255) DEFAULT NULL,
  `Driving_License_Photo` varchar(255) DEFAULT NULL,
  `Valid_month` varchar(20) NOT NULL,
  `Valid_year` varchar(20) NOT NULL,
  `Aadhar_Card_No` varchar(255) DEFAULT NULL,
  `Aadhar_Card_Photo` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_No` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_Photo` varchar(255) DEFAULT NULL,
  `Bank_Name` int(11) DEFAULT NULL,
  `Branch_Name` varchar(255) DEFAULT NULL,
  `Bank_Account_Number` varchar(255) DEFAULT NULL,
  `IFSC_Code` varchar(50) DEFAULT NULL,
  `Verified_By` varchar(255) NOT NULL,
  `Verified_Date` date NOT NULL,
  `Verified_Remarks` varchar(255) DEFAULT NULL,
  `Rating` float(10,1) DEFAULT '0.0',
  `Is_Blocked` tinyint(1) NOT NULL DEFAULT '0',
  `App_Install_Date` date NOT NULL,
  `App_Install_Time` time NOT NULL,
  `Firebase_Token` varchar(255) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Phone_No` (`Phone_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eTez_AD`
--

CREATE TABLE IF NOT EXISTS `eTez_AD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Photo` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` int(11) NOT NULL,
  `FAQ_Topic_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Description` longtext COLLATE latin1_general_ci,
  `Sort_Order` int(2) NOT NULL,
  `Title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Meta_Tag_Keywords` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Meta_Tag_Description` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Facebook_OG_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Twitter_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Google_Analytics` longtext COLLATE latin1_general_ci,
  `Custom_Code` longtext COLLATE latin1_general_ci,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `publish` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(30) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

CREATE TABLE IF NOT EXISTS `faq_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Parent` int(11) DEFAULT NULL,
  `FAQ_Category` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Description` text COLLATE latin1_general_ci,
  `Sort_Order` int(4) NOT NULL,
  `Publish` int(1) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FAQ_Category` (`FAQ_Category`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE IF NOT EXISTS `foods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDMenu` int(11) NOT NULL,
  `IDSubmenu` int(11) NOT NULL,
  `IDSubsubmenu` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Weight` float(10,2) NOT NULL,
  `Unit` int(11) NOT NULL,
  `Description` mediumtext NOT NULL,
  `MRP` float(10,2) NOT NULL,
  `JalpanPrice` float(10,2) NOT NULL,
  `Discount` float(10,2) NOT NULL,
  `Photo` varchar(200) NOT NULL DEFAULT 'logo.png',
  `Qrcode` varchar(200) NOT NULL,
  `isOutOfStock` tinyint(4) NOT NULL DEFAULT '0',
  `Recomended` tinyint(1) NOT NULL DEFAULT '0',
  `Popular` tinyint(1) NOT NULL DEFAULT '0',
  `Rating` float(10,2) NOT NULL DEFAULT '0.00',
  `Available` tinyint(1) NOT NULL DEFAULT '1',
  `User` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1032 ;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`ID`, `IDMenu`, `IDSubmenu`, `IDSubsubmenu`, `Name`, `Weight`, `Unit`, `Description`, `MRP`, `JalpanPrice`, `Discount`, `Photo`, `Qrcode`, `isOutOfStock`, `Recomended`, `Popular`, `Rating`, `Available`, `User`, `Date`, `Time`) VALUES
(1016, 1, 1, 4, 'Valencia Orange', 7.00, 100, 'Sack Orange', 20.00, 45.00, 0.00, 'Valencia Orange_p.jpeg', '1016_Qr.png', 0, 0, 0, 0.00, 1, 'admin123', '2020-09-09', '20:45:14'),
(1020, 1, 1, 1, 'KOU-GOU Tommy Atkings Mangos', 9.00, 20, 'KOU-GOU Tommy Atkings Mangos 6 to  count', 63.00, 80.00, 0.00, 'KOU-GOU Tommy Atkings Mangos_p.jpeg', '1018_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-23', '13:03:55'),
(1021, 1, 1, 1, 'Tommy Atkins Mango', 9.00, 20, 'BERGSIG Tommy Atkings Mangos 6 to  count', 63.00, 80.00, 0.00, 'Tommy Atkins Mango _p.jpeg', '1021_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-27', '09:02:40'),
(1022, 1, 1, 1, 'Mango Long Green', 12.00, 50, 'Mango Long Green', 40.00, 60.00, 0.00, 'Mango Long Green _p.jpeg', '1022_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-27', '09:04:18'),
(1023, 1, 1, 1, 'Mango Zill', 6.00, 50, 'KOU-GOU Zill Mango 6 count', 60.00, 80.00, 0.00, 'Mango Zill _p.jpeg', '1023_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-27', '09:05:20'),
(1024, 1, 1, 5, 'CHERRYTIME Cherries', 2.00, 100, 'CHERRYTIME Cherries 2kg', 400.00, 550.00, 0.00, 'CHERRYTIME Cherries _p.jpeg', '1024_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-27', '09:07:28'),
(1025, 1, 1, 5, 'MARTLET Cherries', 2.00, 10, 'MARTLET Cherries 2kg 30-32 size', 220.00, 300.00, 0.00, 'MARTLET Cherries _p.jpeg', '1025_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-27', '09:13:31'),
(1026, 1, 1, 6, 'Yellow cling  peaches', 15.00, 49, 'Yellow cling Peaches box 15 count', 65.00, 80.00, 0.00, 'Yellow cling  peaches _p.jpeg', '1026_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-27', '09:16:44'),
(1027, 1, 1, 7, 'White Necterines', 18.00, 10, 'Dutiot White Nectariens', 100.00, 120.00, 0.00, 'White Necterines _p.jpeg', '1027_Qr.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2020-12-27', '09:19:34'),
(1028, 1, 1, 1, 'Heidi  Mango', 7.00, 30, 'Very Sweet Heidi Mango', 160.00, 200.00, 0.00, 'Heidi  Mango_p.jpeg', '1028_Qr.png', 0, 1, 1, 0.00, 1, 'Admin123', '2021-01-23', '08:56:52'),
(1029, 1, 1, 8, 'Seedless Cotton Candy Grapes', 0.00, 150, 'Very Sweet Seedless Cotton Candy Grapes 500g tubs', 16.00, 30.00, 0.00, 'Seedless Cotton Candy Grapes_p.jpeg', '1029_Qr.png', 0, 1, 1, 0.00, 1, 'Admin123', '2021-01-23', '09:08:45'),
(1030, 1, 1, 1, 'Rosa Mango', 8.00, 30, 'Roza Mango Very little fiber', 40.00, 60.00, 0.00, 'Rosa Mango_p.jpeg', '1030_Qr.png', 0, 1, 1, 0.00, 1, 'Admin123', '2021-01-23', '09:15:07'),
(1031, 1, 1, 1, 'Shelly Mango', 8.00, 30, 'Kou-gou Shelly Mango', 70.00, 130.00, 0.00, 'Shelly Mango_p.jpeg', '1031_Qr.png', 0, 0, 0, 0.00, 1, 'Admin123', '2021-02-02', '10:28:40');

-- --------------------------------------------------------

--
-- Table structure for table `food_review`
--

CREATE TABLE IF NOT EXISTS `food_review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `Review` varchar(200) NOT NULL,
  `Rating` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hellocab_elite_plans`
--

CREATE TABLE IF NOT EXISTS `hellocab_elite_plans` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Plan_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Amount` int(4) NOT NULL,
  `Validity_in_Days` int(3) NOT NULL,
  `Description` longtext COLLATE latin1_general_ci,
  `Sort_Order` int(2) NOT NULL,
  `Title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Meta_Tag_Keywords` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Meta_Tag_Description` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Facebook_OG_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Twitter_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Google_Analytics` longtext COLLATE latin1_general_ci,
  `Custom_Code` longtext COLLATE latin1_general_ci,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `publish` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(30) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Parent` int(11) DEFAULT NULL,
  `Link_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Page_Content` longtext COLLATE latin1_general_ci,
  `Sort_Order` int(2) NOT NULL,
  `Title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Meta_Tag_Keywords` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Meta_Tag_Description` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Facebook_OG_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Twitter_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Google_Analytics` longtext COLLATE latin1_general_ci,
  `Custom_Code` longtext COLLATE latin1_general_ci,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `publish` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(30) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE IF NOT EXISTS `menu_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Specification` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL,
  `Colors` varchar(200) NOT NULL DEFAULT '000000',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `User` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`ID`, `Name`, `Photo`, `Specification`, `Description`, `Colors`, `isActive`, `User`, `Date`, `Time`) VALUES
(1, 'Fruit', 'http://139.59.38.160/Fruit/Dashboard/Menu/How-to-store-fruit-to-keep-it-fresh-resized.jpg', 'Fresh', 'Good', '#00c853', 1, 'AXOM654', '2020-12-02', '12:19:24'),
(2, 'Vegetables', 'http://139.59.38.160/Fruit/Dashboard/Menu/vegetables.jpg', 'Fresh', 'Fresh', '#ff5722', 1, 'AXOM654', '2020-12-02', '12:20:02'),
(3, 'Display and platters', 'http://139.59.38.160/Fruit/Dashboard/Menu/335cb84c2f4e64d7d477107804143270.jpg', 'Fresh', 'Fresh', '#9c27b0', 1, 'AXOM654', '2020-12-02', '12:21:37'),
(4, 'Bulk', 'http://139.59.38.160/Fruit/Dashboard/Menu/images.jpeg', 'from fruits', 'from fruits', '#e91e63', 1, 'AXOM654', '2020-12-02', '12:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subject` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Email_Description` text COLLATE latin1_general_ci NOT NULL,
  `Send_SMS` int(1) NOT NULL,
  `SMS_Text` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Send_To` int(11) NOT NULL,
  `Place_Filter` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `owner_details`
--

CREATE TABLE IF NOT EXISTS `owner_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_OTP` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Phone_No` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Pin` varchar(255) DEFAULT NULL,
  `Pancard_No` varchar(255) DEFAULT NULL,
  `Pancard_Photo` varchar(255) DEFAULT NULL,
  `Addressproof_Document` int(11) NOT NULL,
  `Addressproof_No` varchar(50) DEFAULT NULL,
  `Addressproof_Photo` varchar(255) DEFAULT NULL,
  `Aadhar_Card_No` varchar(255) DEFAULT NULL,
  `Aadhar_Card_Photo` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_No` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_Photo` varchar(255) DEFAULT NULL,
  `Bank_Name` int(11) NOT NULL,
  `Branch_Name` varchar(255) NOT NULL,
  `Bank_Account_Number` varchar(255) NOT NULL,
  `IFSC_Code` varchar(50) NOT NULL,
  `Verified_By` varchar(200) NOT NULL,
  `Verified_Date` date NOT NULL,
  `Verified_Remarks` varchar(255) DEFAULT NULL,
  `App_Install_Date` date DEFAULT NULL,
  `App_Install_Time` time DEFAULT NULL,
  `Firebase_Token` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PackagingType`
--

CREATE TABLE IF NOT EXISTS `PackagingType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `platters`
--

CREATE TABLE IF NOT EXISTS `platters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `platters`
--

INSERT INTO `platters` (`ID`, `Name`, `Date`, `Time`) VALUES
(1, 'Birthday', '0000-00-00', '00:00:00'),
(2, 'Anniversary', '0000-00-00', '00:00:00'),
(3, 'Party', '0000-00-00', '00:00:00'),
(4, 'Others', '0000-00-00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `platter_type`
--

CREATE TABLE IF NOT EXISTS `platter_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `User` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `platter_type`
--

INSERT INTO `platter_type` (`ID`, `Name`, `Photo`, `Description`, `isActive`, `User`, `Date`, `Time`) VALUES
(1, 'Birthday', 'http://139.59.38.160/Fruit/Dashboard/Menu/How-to-Build-Grazing-Platter-FF2.jpg', 'Because these life events occur only once a year, there is a certain amount of pressure on the host to deliver a memorable event.', 1, 'ADMIN123', '2021-01-02', '08:32:42'),
(2, 'Anniversary', 'http://139.59.38.160/Fruit/Dashboard/Menu/Grazing.jpg', 'Anniversary events are powerful', 1, 'ADMIN123', '2021-01-02', '08:32:52'),
(3, 'Vegan Cheese and Fruit Platter', 'http://139.59.38.160/Fruit/Dashboard/Menu/vegan_cheese_and_fruit_platter-1.jpg', 'What better way to bring in NYE than with friends and food? This Vegan Cheese and Fruit Platter is the perfect platter board to please your guests and your stomach!', 1, 'ADMIN123', '2021-01-02', '08:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE IF NOT EXISTS `promo_codes` (
  `Promo_Code` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `Promo_Type` int(11) NOT NULL,
  `Discount_Type` int(11) NOT NULL,
  `Discount_Value` int(3) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Drop_Location` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `App_Invitation` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `Applicable_Place` int(11) DEFAULT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`Promo_Code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes_type`
--

CREATE TABLE IF NOT EXISTS `promo_codes_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `promo_discount_type`
--

CREATE TABLE IF NOT EXISTS `promo_discount_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `push_message`
--

CREATE TABLE IF NOT EXISTS `push_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffID` int(11) NOT NULL,
  `Message` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `push_message`
--

INSERT INTO `push_message` (`ID`, `StaffID`, `Message`, `Photo`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 0, 'FRESH SHELLY MANGO NOW IN', '', '2021-01-21', '16:42:07', 'Admin123', '41.13.170.207');

-- --------------------------------------------------------

--
-- Table structure for table `rating_remarks`
--

CREATE TABLE IF NOT EXISTS `rating_remarks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rating_limit` int(11) NOT NULL COMMENT '1 for low rating,2 for high rating',
  `Rating_comments` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reason_cancel`
--

CREATE TABLE IF NOT EXISTS `reason_cancel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `first` varchar(200) NOT NULL,
  `second` varchar(200) NOT NULL,
  `third` varchar(200) NOT NULL,
  `fourth` varchar(200) NOT NULL,
  `fifth` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recharge_point`
--

CREATE TABLE IF NOT EXISTS `recharge_point` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Phone_No` varchar(20) NOT NULL,
  `Latitude` float(10,6) NOT NULL,
  `Longitude` float(10,6) NOT NULL,
  `Verified_by` varchar(200) NOT NULL,
  `Verified_remarks` varchar(200) NOT NULL,
  `Verified_date` date NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting_defaults`
--

CREATE TABLE IF NOT EXISTS `setting_defaults` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Discounts` float(10,2) NOT NULL,
  `MinimumOrderPrice` int(11) NOT NULL COMMENT 'Service shutdown',
  `MinimumOrderWeight` int(11) NOT NULL COMMENT 'on ride track driver and user',
  `MinimumDistance` int(11) NOT NULL,
  `MaximumDistance` int(11) NOT NULL COMMENT 'on ride track the user',
  `StartTime` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `EndTime` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `FreeDistance` int(11) NOT NULL,
  `PricePerKM` int(11) NOT NULL,
  `CancellationCharge` float(10,2) NOT NULL,
  `FacebookPage` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `InstagramPage` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `YoutubePlaylis` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `WhatsApp` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(200) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `setting_defaults`
--

INSERT INTO `setting_defaults` (`ID`, `Discounts`, `MinimumOrderPrice`, `MinimumOrderWeight`, `MinimumDistance`, `MaximumDistance`, `StartTime`, `EndTime`, `FreeDistance`, `PricePerKM`, `CancellationCharge`, `FacebookPage`, `InstagramPage`, `YoutubePlaylis`, `WhatsApp`, `Date`, `Time`, `User`, `IP`) VALUES
(10, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/visitsouthafrica/', 'https://www.instagram.com/cricket_south_africa/?hl=en', '', '0712689151', '2020-12-05', '17:38:26', 'Admin123', '102.249.3.65'),
(9, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/visitsouthafrica/', 'https://www.instagram.com/cricket_south_africa/?hl=en', '', '1233455667', '2020-12-01', '08:59:41', 'ADMIN123', '47.29.157.121');

-- --------------------------------------------------------

--
-- Table structure for table `setting_operational_places`
--

CREATE TABLE IF NOT EXISTS `setting_operational_places` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Place` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Lattitude` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Longitude` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Remark` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_codes_driver`
--

CREATE TABLE IF NOT EXISTS `sms_codes_driver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Driver_Name` varchar(200) NOT NULL,
  `Phone_No` varchar(100) NOT NULL,
  `Driver_OTP` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_codes_owner`
--

CREATE TABLE IF NOT EXISTS `sms_codes_owner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_Name` varchar(200) NOT NULL,
  `Phone_No` varchar(100) NOT NULL,
  `Owner_OTP` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_codes_user`
--

CREATE TABLE IF NOT EXISTS `sms_codes_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Phone_no` varchar(100) NOT NULL,
  `User_OTP` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `User_Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `splashtext`
--

CREATE TABLE IF NOT EXISTS `splashtext` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MainText` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `splashtext`
--

INSERT INTO `splashtext` (`ID`, `MainText`) VALUES
(1, 'Welcome to Fruit King'),
(2, 'Wholesalers of fruit and veg\n'),
(3, 'Delivery to your Door'),
(4, 'Stay healthy, stay safe');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store_order`
--

CREATE TABLE IF NOT EXISTS `store_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `CanteenID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `NoofItems` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `store_order`
--

INSERT INTO `store_order` (`ID`, `UserID`, `OrderID`, `CanteenID`, `FoodID`, `NoofItems`, `Date`, `Time`) VALUES
(1, 42, 138697, 1, 1016, 1, '2021-02-10', '09:44:00'),
(2, 42, 138697, 1, 1022, 2, '2021-02-10', '09:44:00'),
(3, 42, 138697, 1, 1021, 2, '2021-02-10', '09:44:00'),
(4, 42, 362537, 1, 1016, 1, '2021-02-10', '09:44:00'),
(5, 42, 362537, 1, 1022, 2, '2021-02-10', '09:44:00'),
(6, 42, 362537, 1, 1021, 2, '2021-02-10', '09:44:00'),
(7, 40, 778575, 1, 1021, 1, '2021-02-10', '10:08:00'),
(8, 40, 677141, 1, 1021, 1, '2021-02-10', '10:08:00'),
(9, 42, 427565, 1, 1022, 1, '2021-02-10', '10:58:00'),
(10, 42, 427565, 1, 1021, 1, '2021-02-10', '10:58:00'),
(11, 42, 427565, 1, 1031, 2, '2021-02-10', '10:58:00'),
(12, 42, 427565, 1, 1027, 1, '2021-02-10', '10:58:00'),
(13, 42, 427565, 1, 1025, 2, '2021-02-10', '10:58:00'),
(14, 42, 427565, 1, 1023, 4, '2021-02-10', '10:58:00'),
(15, 42, 596283, 1, 1022, 1, '2021-02-10', '10:58:00'),
(16, 42, 596283, 1, 1021, 1, '2021-02-10', '10:58:00'),
(17, 42, 596283, 1, 1031, 2, '2021-02-10', '10:58:00'),
(18, 42, 596283, 1, 1027, 1, '2021-02-10', '10:58:00'),
(19, 42, 596283, 1, 1025, 2, '2021-02-10', '10:58:00'),
(20, 42, 596283, 1, 1023, 4, '2021-02-10', '10:58:00'),
(22, 40, 315420, 1, 1021, 1, '2021-02-11', '11:03:00'),
(23, 40, 885056, 1, 1021, 1, '2021-02-11', '11:03:00'),
(24, 42, 782228, 1, 1024, 1, '2021-02-11', '11:07:00'),
(25, 42, 679026, 1, 1016, 1, '2021-02-12', '14:21:00'),
(26, 42, 679026, 1, 1021, 1, '2021-02-12', '14:21:00'),
(27, 42, 679026, 1, 1025, 1, '2021-02-12', '14:21:00'),
(28, 42, 679026, 1, 1020, 1, '2021-02-12', '14:21:00'),
(29, 42, 679026, 1, 1026, 1, '2021-02-12', '14:21:00'),
(30, 42, 679026, 1, 1027, 1, '2021-02-12', '14:21:00'),
(31, 45, 524472, 1, 1016, 1, '2021-03-02', '11:57:00'),
(32, 24, 439703, 1, 1022, 1, '2021-03-02', '19:56:00'),
(33, 16, 5500, 1, 1030, 1, '2021-03-12', '23:14:00'),
(34, 42, 632158, 1, 1021, 1, '2021-03-29', '10:28:00'),
(35, 42, 995691, 1, 1021, 2, '2021-03-29', '10:31:00'),
(36, 35, 634070, 1, 1029, 2, '2021-03-29', '10:40:00'),
(37, 35, 634070, 1, 1028, 2, '2021-03-29', '10:40:00'),
(38, 35, 634070, 1, 1031, 1, '2021-03-29', '10:40:00'),
(39, 35, 634070, 1, 1024, 1, '2021-03-29', '10:40:00'),
(40, 35, 486323, 1, 1029, 2, '2021-03-29', '10:40:00'),
(41, 35, 486323, 1, 1028, 2, '2021-03-29', '10:40:00'),
(42, 35, 486323, 1, 1031, 1, '2021-03-29', '10:40:00'),
(43, 35, 486323, 1, 1024, 1, '2021-03-29', '10:40:00'),
(44, 35, 627627, 1, 1022, 1, '2021-03-29', '10:59:00'),
(45, 35, 627627, 1, 1029, 4, '2021-03-29', '10:59:00'),
(46, 35, 627627, 1, 1030, 1, '2021-03-29', '10:59:00'),
(47, 42, 922431, 1, 1021, 1, '2021-03-30', '19:32:00'),
(48, 42, 922431, 1, 1016, 1, '2021-03-30', '19:32:00'),
(49, 42, 922431, 1, 1022, 1, '2021-03-30', '19:32:00'),
(50, 24, 520569, 1, 1028, 2, '2021-03-30', '19:35:00'),
(51, 24, 520569, 1, 1029, 1, '2021-03-30', '19:35:00'),
(52, 59, 856258, 1, 1016, 1, '2021-04-23', '15:43:00'),
(53, 62, 800780, 1, 1016, 6, '2021-05-01', '13:48:00'),
(54, 62, 347908, 1, 1016, 6, '2021-05-01', '13:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE IF NOT EXISTS `submenu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Specification` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`ID`, `Category`, `Photo`, `Specification`, `Description`, `isActive`, `Date`, `Time`) VALUES
(1, 'Mango', 'organic-yellow-mango-1547805781-4656334.jpeg', 'Fresh', 'Good', 1, '2020-09-06', '13:14:05'),
(2, 'Apple', 'Apple-icon.png', 'Fresh', 'Fresh', 1, '2020-09-06', '13:14:49'),
(3, 'FRESH', '', 'FRESH', 'FRESH', 0, '2020-09-06', '13:17:25'),
(4, 'Oranges', '', 'Specification of an orange', 'Some description will go here', 1, '2020-09-06', '18:18:15'),
(5, 'Cherries', 'cherries.jpg', 'Fresh', 'Fresh', 1, '2020-12-27', '09:06:24'),
(6, 'Peaches', 'p322.jpg', 'Fresh', 'Peaches are widely eaten fresh and are also baked in pies and cobblers', 1, '2020-12-27', '09:15:15'),
(7, 'Nectraines', 'Nectarine-Nutrition-Facts-Health-Benefits-.JPG', 'Fresh', 'The nectarine is very similar to the peach; actually, it is a variety of peach.', 1, '2020-12-27', '09:18:51'),
(8, 'Grapes', '', 'Seedless Grapes', '', 1, '2021-01-23', '09:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `subsubmenu`
--

CREATE TABLE IF NOT EXISTS `subsubmenu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `subsubmenu`
--

INSERT INTO `subsubmenu` (`ID`, `Name`, `Photo`, `isActive`, `Date`, `Time`) VALUES
(1, 'FRESH', 'Fruit-Baskets-Purely-Fruit-Gift-Basket_large_1200be9c-a569-4a4d-88af-ed534c80cb92.jpg', 1, '2020-09-07', '06:35:26'),
(2, 'Citrus', '61flp1do4XL._CR203,0,1225,1225_UX256.jpg', 1, '2020-09-07', '06:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `tax_definations`
--

CREATE TABLE IF NOT EXISTS `tax_definations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tax_Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Tax_Percentage` float NOT NULL,
  `Applicable` int(1) NOT NULL,
  `Sort_Order` int(3) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tez_Canteen`
--

CREATE TABLE IF NOT EXISTS `tez_Canteen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Phone_No` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Aboutus` mediumtext NOT NULL,
  `Address` varchar(200) NOT NULL,
  `State` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Pin_No` int(11) NOT NULL,
  `Latitude` float(10,6) NOT NULL,
  `Longitude` float(10,6) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tez_Canteen`
--

INSERT INTO `tez_Canteen` (`ID`, `Name`, `Phone_No`, `Email`, `Aboutus`, `Address`, `State`, `City`, `Pin_No`, `Latitude`, `Longitude`, `isActive`, `Date`, `Time`) VALUES
(1, 'FRUIT KING', '89898989', 'test@gmail.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1265  Church St,Wingate Park,Gauteng', 'Test', 'Test', 153, 26.093214, 91.796654, 1, '2020-06-05', '20:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `update_user_order`
--

CREATE TABLE IF NOT EXISTS `update_user_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Gross` float(10,2) NOT NULL,
  `Discount` float(10,2) NOT NULL,
  `Packaging` float(10,2) NOT NULL,
  `Delievery` float(10,2) NOT NULL,
  `Total` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `update_user_order`
--

INSERT INTO `update_user_order` (`ID`, `UserID`, `OrderID`, `Gross`, `Discount`, `Packaging`, `Delievery`, `Total`, `Date`, `Time`) VALUES
(1, 42, 138697, 325.00, 0.00, 0.00, 0.00, 325.00, '2021-02-10', '09:44:00'),
(2, 42, 362537, 325.00, 0.00, 0.00, 0.00, 325.00, '2021-02-10', '09:44:00'),
(3, 40, 778575, 80.00, 0.00, 0.00, 0.00, 80.00, '2021-02-10', '10:08:00'),
(4, 40, 677141, 80.00, 0.00, 0.00, 0.00, 80.00, '2021-02-10', '10:08:00'),
(5, 42, 427565, 2020.00, 0.00, 0.00, 0.00, 2020.00, '2021-02-10', '10:58:00'),
(6, 42, 596283, 2020.00, 0.00, 0.00, 0.00, 2020.00, '2021-02-10', '10:58:00'),
(8, 40, 315420, 80.00, 0.00, 0.00, 0.00, 80.00, '2021-02-11', '11:03:00'),
(9, 40, 885056, 80.00, 0.00, 0.00, 0.00, 80.00, '2021-02-11', '11:03:00'),
(10, 42, 782228, 550.00, 0.00, 0.00, 0.00, 550.00, '2021-02-11', '11:07:00'),
(11, 42, 679026, 705.00, 0.00, 0.00, 0.00, 705.00, '2021-02-12', '14:21:00'),
(12, 45, 524472, 90.00, 0.00, 0.00, 0.00, 90.00, '2021-03-02', '11:57:00'),
(13, 45, 697850, 0.00, 0.00, 0.00, 0.00, 0.00, '2021-03-02', '11:57:00'),
(14, 24, 439703, 60.00, 0.00, 0.00, 0.00, 60.00, '2021-03-02', '19:56:00'),
(15, 16, 5500, 0.00, 0.00, 0.00, 0.00, 60.00, '2021-03-12', '23:14:00'),
(16, 42, 632158, 80.00, 0.00, 0.00, 0.00, 80.00, '2021-03-29', '10:28:00'),
(17, 42, 995691, 160.00, 0.00, 0.00, 0.00, 160.00, '2021-03-29', '10:31:00'),
(18, 35, 634070, 1140.00, 0.00, 0.00, 0.00, 1140.00, '2021-03-29', '10:40:00'),
(19, 35, 486323, 1140.00, 0.00, 0.00, 0.00, 1140.00, '2021-03-29', '10:40:00'),
(20, 35, 627627, 240.00, 0.00, 0.00, 0.00, 240.00, '2021-03-29', '10:59:00'),
(21, 42, 922431, 185.00, 0.00, 0.00, 0.00, 185.00, '2021-03-30', '19:32:00'),
(22, 24, 520569, 430.00, 0.00, 0.00, 0.00, 430.00, '2021-03-30', '19:35:00'),
(23, 59, 856258, 45.00, 0.00, 0.00, 0.00, 45.00, '2021-04-23', '15:43:00'),
(24, 62, 800780, 270.00, 0.00, 0.00, 0.00, 270.00, '2021-05-01', '13:48:00'),
(25, 62, 347908, 270.00, 0.00, 0.00, 0.00, 270.00, '2021-05-01', '13:48:00'),
(26, 64, 386324, 0.00, 0.00, 0.00, 0.00, 0.00, '2021-05-04', '11:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `userlevelpermissions`
--

CREATE TABLE IF NOT EXISTS `userlevelpermissions` (
  `userlevelid` int(11) NOT NULL,
  `tablename` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`userlevelid`,`tablename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlevels`
--

CREATE TABLE IF NOT EXISTS `userlevels` (
  `userlevelid` int(11) NOT NULL,
  `userlevelname` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`userlevelid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_emergency_contacts`
--

CREATE TABLE IF NOT EXISTS `users_emergency_contacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Contact_Name` varchar(255) NOT NULL,
  `Contact_Phone_No` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(200) NOT NULL,
  `Photo` varchar(255) DEFAULT 'profile_image.png',
  `Phone_No` varchar(20) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `Address` varchar(500) DEFAULT NULL,
  `Country` varchar(200) DEFAULT 'South Africa',
  `State` varchar(200) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Pin` varchar(255) DEFAULT NULL,
  `Latitude` float(10,6) DEFAULT NULL,
  `Longitude` float(10,6) DEFAULT NULL,
  `Favorite_Home_Address` varchar(255) DEFAULT NULL,
  `Favourite_Work_Address` varchar(255) DEFAULT NULL,
  `Favourite_Other_Address` varchar(255) DEFAULT NULL,
  `isHome` int(11) NOT NULL DEFAULT '0',
  `HomeAddress` varchar(200) NOT NULL,
  `HomeHouseNo` varchar(200) NOT NULL,
  `HomeLandMark` varchar(200) NOT NULL,
  `HomeZip` varchar(200) NOT NULL,
  `isWork` tinyint(4) NOT NULL DEFAULT '0',
  `WorkAddress` varchar(200) NOT NULL,
  `WorkHouseNo` varchar(20) NOT NULL,
  `WorkLandMark` varchar(200) NOT NULL,
  `WorkZip` varchar(200) NOT NULL,
  `Rating` float(10,1) DEFAULT '0.0',
  `Is_Blocked` tinyint(1) NOT NULL DEFAULT '0',
  `Charge` int(11) NOT NULL DEFAULT '0',
  `Reference_Code` varchar(255) DEFAULT NULL,
  `User_Referrence_Code` varchar(20) DEFAULT NULL,
  `Firebase_Token` varchar(255) DEFAULT NULL,
  `Logout` tinyint(4) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`ID`, `Name`, `Email`, `Password`, `Photo`, `Phone_No`, `role`, `Address`, `Country`, `State`, `City`, `Pin`, `Latitude`, `Longitude`, `Favorite_Home_Address`, `Favourite_Work_Address`, `Favourite_Other_Address`, `isHome`, `HomeAddress`, `HomeHouseNo`, `HomeLandMark`, `HomeZip`, `isWork`, `WorkAddress`, `WorkHouseNo`, `WorkLandMark`, `WorkZip`, `Rating`, `Is_Blocked`, `Charge`, `Reference_Code`, `User_Referrence_Code`, `Firebase_Token`, `Logout`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 'TEST PERSON1', 'test@gmail.com', '', 'profile_image.png', 'XXXXXXXXXXX', 1, NULL, 'Assam', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(16, 'MOE', '', '23264aa6268488c2909ef81ead49e09e248d5d91', 'IMG_20200709_204004.jpg', '0827865662', 1, '', 'South Africa', 'Gauteng', 'Johannesburg', '', 0.000000, 0.000000, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'eTfUUT3cTWaUtlr0K9HzMg:APA91bF5ppPwnCCS9eshI4FOe5zT0amsbZaM_E2ZtImhRbU6WoNqpAXEjcEfQGaSIpSpou5ZxB56bamI2Hbfw_aJZs59UwjuPgoBfcoK_QgLJD61uyGdQdU6LWVdGUpmn1G7l1ONBwoO', 0, '2020-07-10', '00:10:00', NULL, NULL),
(22, 'NABEELA1', NULL, '0ba1bb4c0fa2d00df98b2e475f2581b7b236cec3', 'Profile.png', '0737869821', 1, NULL, 'South Africa', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, 'House No: | 29C Troupant Ave, Magaliessig, Sandton, 2191, South Africa| | | 2191', '', '', '2191', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-06-14', '22:40:00', NULL, NULL),
(14, 'TEST2', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Driver.png', '9999999999', 2, 'Test1', 'South Africa', 'Test1', 'Test1', '781029', NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'eTfUUT3cTWaUtlr0K9HzMg:APA91bF5ppPwnCCS9eshI4FOe5zT0amsbZaM_E2ZtImhRbU6WoNqpAXEjcEfQGaSIpSpou5ZxB56bamI2Hbfw_aJZs59UwjuPgoBfcoK_QgLJD61uyGdQdU6LWVdGUpmn1G7l1ONBwoO', 0, '2020-06-13', '11:56:00', 'ADMIN123', '47.29.202.35'),
(3, 'PARAG', '', '7c222fb2927d828af22f592134e8932480637c0d', 'IMG_20200612_181119.jpg', '7002986817', 3, 'Ganesh nagar', 'South Africa', 'India', 'Guwahati', '781029', 0.000000, 0.000000, 'Optional(&quot;KwaZulu-Natal|75|Berea|4091&quot;)', NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'cABoNps_Qr6X8xvfXXjPnB:APA91bFADU7cTrtM9Xbof7UwyQjyMrlzxrt4xX43QIlY4whHmpmCsiBYOQXQygrVhfver1zfOOp6RMckmK_mBu5bA7kAnq_c64jkk4JA_f3DNBCNlMZumj5k_YPCRco08BgfbstaeOTC', 0, '2020-06-12', '18:11:00', NULL, NULL),
(24, 'Parag', '', '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '7002608241', 1, 'Ganesh nagar', 'South Africa', 'Kamrup', 'guwahati', '7810', 0.000000, 0.000000, 'Optional(&quot;Basisthachal Path||Basisthachal Path|781028&quot;)', NULL, NULL, 0, '', '', '', '', 0, 'House No: 19| Bishnu Path, à¤—à¤£à¥‡à¤¶ à¤¨à¤—à¤°, à¤²à¤Ÿà¤•à¤¤à¤¾, Guwahati, à¤®à¥‡à¤˜à¤¾à¤²à¤¯ 781029, India| | Bishnu Path| 781029', 'null', 'Bishnu Path', '781029', 0.0, 0, 0, NULL, NULL, 'cABoNps_Qr6X8xvfXXjPnB:APA91bFADU7cTrtM9Xbof7UwyQjyMrlzxrt4xX43QIlY4whHmpmCsiBYOQXQygrVhfver1zfOOp6RMckmK_mBu5bA7kAnq_c64jkk4JA_f3DNBCNlMZumj5k_YPCRco08BgfbstaeOTC', 1, '2021-03-30', '19:34:00', NULL, NULL),
(23, 'MPATEL', NULL, '52f578d11e955d355a8968a1ca4f3babc1280219', 'Profile.png', '0798715465', 1, NULL, 'South Africa', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, 'House No: | 8 Chestnut Cres, Marlboro Gardens, Sandton, 2063, South Africa| | | 2063', '', '', '2063', 0.0, 0, 0, NULL, NULL, 'fgHciCBWQP-1RP68zE8QJy:APA91bHCquOuuddfLv_G-C5OHjJV64TytUDgy420_JjUO5jXE_phz2ZQq9VIseBkPJvh1B1sj8UbKKHHNN0DFcZ3mlJpO_h4xU0ZD4S0Ed6KtCGGc5i-V0g9gj5TepEDvNegfvqPYCoo', 0, '2020-06-15', '11:08:00', NULL, NULL),
(25, 'Optional(&quot;test&quot;)', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', 'Optional(&quot;98640', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-27', '22:20:00', NULL, NULL),
(26, 'Optional(&quot;test&quot;)', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', 'Optional(&quot;98640', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-27', '22:22:00', NULL, NULL),
(27, 'Optional(&quot;test&quot;)', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', 'Optional(&quot;86377', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-27', '22:24:00', NULL, NULL),
(28, 'uhd', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '78837747', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-27', '22:30:00', NULL, NULL),
(29, 'PPPP', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '9996666668', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-30', '20:34:00', NULL, NULL),
(30, 'OPOPP', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '6666666666', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-30', '20:39:00', NULL, NULL),
(31, 'YUGH', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '8888556696', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-30', '20:45:00', NULL, NULL),
(32, 'GGG', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '5555555555', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-30', '20:46:00', NULL, NULL),
(33, 'JJH', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '8999999999', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-30', '20:52:00', NULL, NULL),
(34, 'HHHH', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '7810296655', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-30', '20:58:00', NULL, NULL),
(35, 'yusuf', NULL, 'b9ebc329e50b86fa45c4f3a820e12316f5db2b86', 'Profile.png', '0662510696', 3, '88 spearman road sydeham overport', 'South Africa', 'KwaZulu-Natal', 'durban', '4190', NULL, NULL, 'Optional(&quot;75 Hugo road |75 |Berea|4091&quot;)', NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-04-20', '22:04:00', 'Admin123', '41.13.136.27'),
(36, 'Nabeelah', NULL, '37e738a8c4e3722af46406e48993aa84c4746dc7', 'Profile.png', '0614244265', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-21', '15:30:00', NULL, NULL),
(37, 'Aadila Osman', NULL, '6c6f70ce6d01ae2ffa99b8387e8bacf9413a1cb7', 'Profile.png', '0680132459', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-12-01', '20:50:00', NULL, NULL),
(44, 'Ibrahim Baig', NULL, '38c2a616aedcdc533d05af7ccea6265cfe164de4', 'Profile.png', '(073) 3600864', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, 'Optional(&quot;KwaZulu-Natal||Berea|4001&quot;)', NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-21', '16:29:00', NULL, NULL),
(55, 'Test1', NULL, '', 'Driver.png', '123456789', 2, '1', 'South Africa', 'a', 'b', '1', NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-03-29', '11:16:00', 'admin123', '102.182.167.98'),
(39, 'RAYMOND', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '0661956786', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-03', '10:47:00', NULL, NULL),
(40, 'Aadila', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '0712689151', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-02-11', '11:03:00', NULL, NULL),
(42, '', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-03-30', '19:32:00', NULL, NULL),
(43, 'Zahraa Reddy', NULL, '000db9409339da03ce4bf78d5d27a14b9f02d630', 'Profile.png', '27840703842', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-07', '19:03:00', NULL, NULL),
(45, 'RAADIYA', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '0827212872', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, 'House No: 1 Francolin Avenue | 24 Century Cir, Century City, Cape Town, 7441, South Africa| | Century Circle| 7441', '24', 'Century Circle', '7441', 0.0, 0, 0, NULL, NULL, 'f2TqbLpwSRy2qwQtqQ7yG8:APA91bGACxS4WVrGeDr8v0rgUGJINqupWsqVNr0gj_6e5DBPSfa8qWU_ee0gac578LDyZPXZAr3Oi04pcyYVtww30urPSdSDYmEE6Bf6bLWyEGImPFPnTLH4xKW_JrpiOHFkUERvahTQ', 0, '2021-03-02', '11:57:00', NULL, NULL),
(46, 'aamnah', NULL, 'd74a3fd3f4b7cd78a74d8e91a5c8122d02180b2b', 'Profile.png', '0614147347', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-21', '21:11:00', NULL, NULL),
(47, 'Shanique', NULL, '933d6704c1a015a769b6d7df4ddfb469c164cb3d', 'Profile.png', '7164958343', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-21', '21:36:00', NULL, NULL),
(48, 'Rajesh', NULL, '383028ab55003083b53fb4c8d50243cdfff872f0', 'Profile.png', '91 97-17-394007', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-26', '04:47:00', NULL, NULL),
(49, 'Irshaad Cassimjee', NULL, '6406c629df1c680029725e7371a7c8e7470821ad', 'Profile.png', '0726274784', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-01-27', '12:32:00', NULL, NULL),
(50, 'PARAG', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '9508453444', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-02-05', '09:13:00', NULL, NULL),
(51, 'PARAG', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '9864019857', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-02-05', '10:47:00', NULL, NULL),
(52, 'Parag', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '9864019768', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-02-08', '16:48:00', NULL, NULL),
(53, 'Rajveer Singh', NULL, '9e92bcbdcb305b0dc7a09f859c52cf6f9193b90d', 'Profile.png', '9990221796', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-03-03', '12:36:00', NULL, NULL),
(54, 'Bharat', NULL, '4c694ade8322c3831f8c8a1887a2b99f39811ca2', 'Profile.png', '8792124788', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-03-10', '18:19:00', NULL, NULL),
(56, 'Mukesh Pawar', NULL, '9459cc1b77f27742998ffd036c3b06c3f77de1e8', 'Profile.png', '9637660110', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-04-06', '16:26:00', NULL, NULL),
(57, 'deepa Baxi', NULL, '792a6680f633f83b0f32e2752dfa6c926dde99bd', 'Profile.png', '7600751365', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-04-19', '11:03:00', NULL, NULL),
(58, 'S K GUPTA', NULL, 'd7f068d895684435d93e8d0d5851387e704ac4b2', 'Profile.png', '9935528470', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-04-21', '08:22:00', NULL, NULL),
(59, 'Aradhana', NULL, '3b0e9e25d90e64039241fe3c1b111ea23551985b', 'Profile.png', '7709493473', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, 'Optional(&quot;Maharashtra|ward no.2 Durgapur near Anganwadi Kendra |Chandrapur|442402&quot;)', NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-04-23', '15:38:00', NULL, NULL),
(60, 'jigar', NULL, 'f517319749c05fb61b4e23b081e8147609aa991b', 'Profile.png', '9974759791', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-04-27', '09:00:00', NULL, NULL),
(61, 'Shalin', NULL, '858a008baaceba52f2c1234673d75c6f7d010ab2', 'Profile.png', '9601370097', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-04-30', '20:52:00', NULL, NULL),
(62, 'gagan khalsa', NULL, 'e174913c908f138483258cdca8e9788877ddcb39', 'Profile.png', '9711412144', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, 'Optional(&quot;Delhi|b1/371 janakpuri ffloor|New Delhi|110058&quot;)', NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-05-01', '13:47:00', NULL, NULL),
(63, 'arty', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '9977500727', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-05-02', '07:05:00', NULL, NULL),
(64, 'ZAIDA', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'profile_image.png', '0731208718', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-05-04', '11:55:00', NULL, NULL),
(65, 'aaditya', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '8528537304', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-05-23', '09:17:00', NULL, NULL),
(66, 'L siva', NULL, 'c60f24c37485346b806e049795c1bb14a2658f66', 'Profile.png', '9786507190', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, 'Optional(&quot;Thirumalai nagar|Basthi,thottakiri road|government school opp|635109&quot;)', NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-05-29', '11:48:00', NULL, NULL),
(67, 'pankaj', NULL, '34bc9437f14040d79c8bb9f95fa19b4fab2fe291', 'Profile.png', '9999675849', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-05-30', '14:03:00', NULL, NULL),
(68, 'Praveen', NULL, 'ecedfb93efbbf2b3ccbc82bfd64adef82556e03e', 'Profile.png', '9848907700', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-06-13', '10:50:00', NULL, NULL),
(69, 'amrinder singh', NULL, 'e541765ff92d58008f7c0a2370d19884e3756854', 'Profile.png', '9876682233', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-06-22', '14:29:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_daily_rates`
--

CREATE TABLE IF NOT EXISTS `vehicle_daily_rates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date_of_Rate` date NOT NULL,
  `Vehicle_Type` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `Minimum_Fare` int(11) NOT NULL,
  `00-01_hr` int(11) NOT NULL,
  `01-02_hr` int(11) NOT NULL,
  `02-03_hr` int(11) NOT NULL,
  `03-04_hr` int(11) NOT NULL,
  `04-05_hr` int(11) NOT NULL,
  `05-06_hr` int(11) NOT NULL,
  `06-07_hr` int(11) NOT NULL,
  `07-08_hr` int(11) NOT NULL,
  `08-09_hr` int(11) NOT NULL,
  `09-10_hr` int(11) NOT NULL,
  `10-11_hr` int(11) NOT NULL,
  `11-12_hr` int(11) NOT NULL,
  `12-13_hr` int(11) NOT NULL,
  `13-14_hr` int(11) NOT NULL,
  `14-15_hr` int(11) NOT NULL,
  `15-16_hr` int(11) NOT NULL,
  `16-17_hr` int(11) NOT NULL,
  `17-18_hr` int(11) NOT NULL,
  `18-19_hr` int(11) NOT NULL,
  `19-20_hr` int(11) NOT NULL,
  `20-21_hr` int(11) NOT NULL,
  `21-22_hr` int(11) NOT NULL,
  `22-23_hr` int(11) NOT NULL,
  `23-00_hr` int(11) NOT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_detail`
--

CREATE TABLE IF NOT EXISTS `vehicle_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Minimum_Balance_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Total_balance` float(10,2) NOT NULL DEFAULT '500.00',
  `Type` tinyint(4) NOT NULL DEFAULT '0',
  `Driver_ID` int(11) DEFAULT NULL,
  `Vehicle_No` varchar(255) NOT NULL,
  `Vehicle_Photo_1` varchar(255) DEFAULT 'vehicle.png',
  `Vehicle_Photo_2` varchar(255) DEFAULT NULL,
  `Registration_Certificate_No` varchar(255) DEFAULT NULL,
  `Registration_Certificate_Photo` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vehicle_detail`
--

INSERT INTO `vehicle_detail` (`ID`, `Minimum_Balance_Status`, `Total_balance`, `Type`, `Driver_ID`, `Vehicle_No`, `Vehicle_Photo_1`, `Vehicle_Photo_2`, `Registration_Certificate_No`, `Registration_Certificate_Photo`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 0, 500.00, 0, NULL, 'AS01BA9564', 'vehicle.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_manufacturer`
--

CREATE TABLE IF NOT EXISTS `vehicle_manufacturer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_Company` varchar(255) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Vehicle_Company` (`Vehicle_Company`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_models`
--

CREATE TABLE IF NOT EXISTS `vehicle_models` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_Company` int(11) NOT NULL,
  `Vehicle_Model` varchar(200) NOT NULL,
  `Vehicle_Type` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Vehicle_Model` (`Vehicle_Model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle_Percentage_Master`
--

CREATE TABLE IF NOT EXISTS `Vehicle_Percentage_Master` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_ID` int(11) NOT NULL,
  `Hellocab_Percentage_On_Ride` int(11) NOT NULL,
  `Owner_Percentage_On_Ride` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_recharged`
--

CREATE TABLE IF NOT EXISTS `vehicle_recharged` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_ID` int(11) NOT NULL,
  `Rechargepoint_ID` int(11) NOT NULL,
  `Ammount` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type_rate_master`
--

CREATE TABLE IF NOT EXISTS `vehicle_type_rate_master` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_Type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Vehicle_Security_Deposit` int(11) NOT NULL,
  `Vehicle_Minimum_Balance` int(11) NOT NULL,
  `Minimum_Fare` int(11) NOT NULL,
  `00-01_hr` int(11) NOT NULL,
  `01-02_hr` int(11) NOT NULL,
  `02-03_hr` int(11) NOT NULL,
  `03-04_hr` int(11) NOT NULL,
  `04-05_hr` int(11) NOT NULL,
  `05-06_hr` int(11) NOT NULL,
  `06-07_hr` int(11) NOT NULL,
  `07-08_hr` int(11) NOT NULL,
  `08-09_hr` int(11) NOT NULL,
  `09-10_hr` int(11) NOT NULL,
  `10-11_hr` int(11) NOT NULL,
  `11-12_hr` int(11) NOT NULL,
  `12-13_hr` int(11) NOT NULL,
  `13-14_hr` int(11) NOT NULL,
  `14-15_hr` int(11) NOT NULL,
  `15-16_hr` int(11) NOT NULL,
  `16-17_hr` int(11) NOT NULL,
  `17-18_hr` int(11) NOT NULL,
  `18-19_hr` int(11) NOT NULL,
  `19-20_hr` int(11) NOT NULL,
  `20-21_hr` int(11) NOT NULL,
  `21-22_hr` int(11) NOT NULL,
  `22-23_hr` int(11) NOT NULL,
  `23-00_hr` int(11) NOT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Vehicle_Type` (`Vehicle_Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visited_Canteen`
--

CREATE TABLE IF NOT EXISTS `visited_Canteen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Canteen_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
