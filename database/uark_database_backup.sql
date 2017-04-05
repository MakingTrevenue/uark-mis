-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2017 at 03:11 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uark`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressID` int(11) NOT NULL,
  `street1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `street2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stateID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `zipCode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `countryID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressID`, `street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES
(1, '803 Glacier Hill Alley', NULL, 'Lubbock', 'TX', '79491', 'US'),
(2, '86 Prentice Hill', NULL, 'Saint Paul', 'MN', '55188', 'US'),
(3, '7 Hovde Lane', NULL, 'Detroit', 'MI', '48232', 'US'),
(4, '624 Miller Way', NULL, 'Dallas', 'TX', '75260', 'US'),
(5, '9 Bunting Point', NULL, 'Indianapolis', 'IN', '46216', 'US'),
(6, '4688 Erie Trail', NULL, 'Montgomery', 'AL', '36125', 'US'),
(7, '7 Vahlen Center', NULL, 'Norcross', 'GA', '30092', 'US'),
(8, '9 Northwestern Lane', NULL, 'Huntington', 'WV', '25721', 'US'),
(9, '26261 Delaware Trail', NULL, 'El Paso', 'TX', '79945', 'US'),
(10, '00 Esker Point', NULL, 'Lake Worth', 'FL', '33462', 'US'),
(11, '8 Bobwhite Drive', NULL, 'Chicago', 'IL', '60636', 'US'),
(12, '006 Carberry Trail', NULL, 'Albany', 'GA', '31704', 'US'),
(13, '14 Florence Road', NULL, 'Washington', 'DC', '20260', 'US'),
(14, '9040 Mesta Hill', '213', 'Worcester', 'MA', '01605', 'US'),
(15, '3931 Bobwhite Road', NULL, 'Grand Rapids', 'MI', '49505', 'US'),
(16, '8053 Pennsylvania Parkway', '13', 'San Diego', 'CA', '92145', 'US'),
(17, '3 Comanche Center', NULL, 'Reno', 'NV', '89595', 'US'),
(18, '8776 Bowman Court', '3982', 'Denver', 'CO', '80204', 'US'),
(19, '79 2nd Pass', NULL, 'Minneapolis', 'MN', '55407', 'US'),
(20, '30584 Roxbury Parkway', NULL, 'Honolulu', 'HI', '96840', 'US'),
(21, '450 Elmside Alley', NULL, 'Lexington', 'KY', '40515', 'US'),
(22, '6 Loomis Plaza', NULL, 'Lubbock', 'TX', '79452', 'US'),
(23, '59 Barby Point', '43227', 'Washington', 'DC', '20046', 'US'),
(24, '5 Everett Crossing', NULL, 'Des Moines', 'IA', '50305', 'US'),
(25, '75333 Welch Terrace', NULL, 'San Francisco', 'CA', '94142', 'US'),
(26, '5023 Mallard Alley', NULL, 'Houston', 'TX', '77060', 'US'),
(27, '424 Myrtle Circle', NULL, 'Colorado Springs', 'CO', '80945', 'US'),
(28, '30 Blue Bill Park Pass', '63', 'Amarillo', 'TX', '79159', 'US'),
(29, '442 Rockefeller Alley', NULL, 'San Bernardino', 'CA', '92424', 'US'),
(30, '523 Maple Wood Place', NULL, 'Des Moines', 'IA', '50393', 'US'),
(31, '9464 Corry Circle', NULL, 'San Antonio', 'TX', '78210', 'US'),
(32, '407 Upham Hill', NULL, 'Hartford', 'CT', '06152', 'US'),
(33, '5213 Ruskin Road', NULL, 'Irvine', 'CA', '92612', 'US'),
(34, '4 Sunfield Circle', NULL, 'El Paso', 'TX', '88553', 'US'),
(35, '0334 Dahle Park', '39', 'Los Angeles', 'CA', '90035', 'US'),
(36, '67 Wayridge Pass', NULL, 'New York City', 'NY', '10079', 'US'),
(37, '6 Waubesa Street', NULL, 'Santa Fe', 'NM', '87592', 'US'),
(38, '427 Schmedeman Pass', '381', 'Lexington', 'KY', '40546', 'US'),
(39, '1307 West Point', NULL, 'Louisville', 'KY', '40205', 'US'),
(40, '77 5th Trail', NULL, 'Toledo', 'OH', '43635', 'US'),
(41, '03139 Michigan Lane', NULL, 'Toledo', 'OH', '43635', 'US'),
(42, '71 Elgar Drive', NULL, 'Sacramento', 'CA', '94297', 'US'),
(43, '924 Arizona Road', NULL, 'Reston', 'VA', '22096', 'US'),
(44, '6685 Stephen Street', NULL, 'San Francisco', 'CA', '94177', 'US'),
(45, '694 Golf Course Court', NULL, 'New Orleans', 'LA', '70160', 'US'),
(46, '7257 Golf Parkway', NULL, 'San Antonio', 'TX', '78291', 'US'),
(47, '288 Arrowood Center', NULL, 'Salt Lake City', 'UT', '84110', 'US'),
(48, '56974 Hoepker Lane', '780', 'Abilene', 'TX', '79699', 'US'),
(49, '18987 Schiller Parkway', NULL, 'Pittsburgh', 'PA', '15215', 'US'),
(50, '9844 Toban Road', NULL, 'Huntington Beach', 'CA', '92648', 'US'),
(51, '03 Colorado Court', '06151', 'Rochester', 'NY', '14683', 'US'),
(52, '3 Ruskin Court', NULL, 'Spokane', 'WA', '99215', 'US'),
(53, '0122 Ryan Trail', NULL, 'Santa Monica', 'CA', '90410', 'US'),
(54, '6501 Ilene Junction', '40219', 'Shawnee Mission', 'KS', '66215', 'US'),
(55, '50785 American Ash Avenue', NULL, 'Lincoln', 'NE', '68583', 'US'),
(56, '92 Hollow Ridge Crossing', NULL, 'Madison', 'WI', '53710', 'US'),
(57, '03 Marquette Crossing', NULL, 'Miami', 'FL', '33153', 'US'),
(58, '62126 Dixon Plaza', '989', 'Austin', 'TX', '78732', 'US'),
(59, '0901 Raven Park', NULL, 'Dallas', 'TX', '75342', 'US'),
(60, '69 3rd Park', NULL, 'Glendale', 'CA', '91205', 'US'),
(61, '259 2nd Drive', NULL, 'Fullerton', 'CA', '92835', 'US'),
(62, '5 Evergreen Drive', NULL, 'Omaha', 'NE', '68110', 'US'),
(63, '6 Northfield Trail', NULL, 'Santa Fe', 'NM', '87505', 'US'),
(64, '2444 Waubesa Circle', NULL, 'Frederick', 'MD', '21705', 'US'),
(65, '9 International Court', NULL, 'Sacramento', 'CA', '95818', 'US'),
(66, '213 Grover Center', NULL, 'Tulsa', 'OK', '74126', 'US'),
(67, '810 Haas Plaza', NULL, 'College Station', 'TX', '77844', 'US'),
(68, '89055 Valley Edge Junction', NULL, 'Pittsburgh', 'PA', '15261', 'US'),
(69, '45 Messerschmidt Place', NULL, 'Great Neck', 'NY', '11024', 'US'),
(70, '68 Commercial Street', NULL, 'Dallas', 'TX', '75397', 'US'),
(71, '2083 Dawn Court', NULL, 'Spartanburg', 'SC', '29305', 'US'),
(72, '5251 Red Cloud Terrace', NULL, 'Savannah', 'GA', '31410', 'US'),
(73, '39527 Almo Junction', NULL, 'Bakersfield', 'CA', '93305', 'US'),
(74, '34 Pearson Center', NULL, 'Charlotte', 'NC', '28247', 'US'),
(75, '767 Thackeray Place', NULL, 'Milwaukee', 'WI', '53234', 'US'),
(76, '682 Katie Street', '988', 'Ocala', 'FL', '34479', 'US'),
(77, '9060 Claremont Pass', NULL, 'Minneapolis', 'MN', '55417', 'US'),
(78, '87 Ruskin Drive', NULL, 'Philadelphia', 'PA', '19178', 'US'),
(79, '8 Hanson Hill', NULL, 'Atlanta', 'GA', '30340', 'US'),
(80, '81 Merrick Terrace', NULL, 'New Haven', 'CT', '06510', 'US'),
(81, '817 Mayer Road', NULL, 'Evansville', 'IN', '47719', 'US'),
(82, '3234 Hayes Trail', NULL, 'Galveston', 'TX', '77554', 'US'),
(83, '196 Artisan Drive', '76198', 'Indianapolis', 'IN', '46202', 'US'),
(84, '6 Sunnyside Lane', NULL, 'Tallahassee', 'FL', '32399', 'US'),
(85, '965 3rd Parkway', NULL, 'Jacksonville', 'FL', '32277', 'US'),
(86, '80059 Bultman Court', NULL, 'Dearborn', 'MI', '48126', 'US'),
(87, '36 Ridge Oak Court', '13', 'Panama City', 'FL', '32405', 'US'),
(88, '719 Forest Way', NULL, 'San Bernardino', 'CA', '92424', 'US'),
(89, '85 Grim Trail', NULL, 'Midland', 'MI', '48670', 'US'),
(90, '363 Karstens Plaza', NULL, 'Springfield', 'MA', '01105', 'US'),
(91, '1 Algoma Lane', NULL, 'Saint Louis', 'MO', '63126', 'US'),
(92, '8 Pankratz Circle', NULL, 'Albuquerque', 'NM', '87190', 'US'),
(93, '94 Old Gate Hill', NULL, 'Harrisburg', 'PA', '17105', 'US'),
(94, '6783 Transport Park', NULL, 'Sioux Falls', 'SD', '57188', 'US'),
(95, '4698 Warbler Street', NULL, 'Louisville', 'KY', '40210', 'US'),
(96, '6 Fordem Court', NULL, 'Brooklyn', 'NY', '11236', 'US'),
(97, '2602 Grim Way', NULL, 'Reno', 'NV', '89510', 'US'),
(98, '6234 Glacier Hill Road', NULL, 'Fort Smith', 'AR', '72916', 'US'),
(99, '212 Bowman Park', '09560', 'Sacramento', 'CA', '95838', 'US'),
(100, '1 International Avenue', NULL, 'New Haven', 'CT', '06505', 'US'),
(101, '0837 Merrick Plaza', NULL, 'Waterbury', 'CT', '06721', 'US'),
(102, '69796 Boyd Avenue', NULL, 'San Jose', 'CA', '95113', 'US'),
(103, '9 Stephen Place', NULL, 'Atlanta', 'GA', '30328', 'US'),
(104, '9 Crescent Oaks Center', NULL, 'New York City', 'NY', '10131', 'US'),
(105, '8121 Vermont Road', NULL, 'Pueblo', 'CO', '81015', 'US'),
(106, '1 Rieder Alley', NULL, 'Tampa', 'FL', '33605', 'US'),
(107, '56 Columbus Alley', NULL, 'Allentown', 'PA', '18105', 'US'),
(108, '8420 Hauk Hill', NULL, 'Houston', 'TX', '77050', 'US'),
(109, '0 South Hill', NULL, 'Honolulu', 'HI', '96820', 'US'),
(110, '48 Magdeline Avenue', NULL, 'San Antonio', 'TX', '78215', 'US'),
(111, '71 Susan Circle', NULL, 'Naperville', 'IL', '60567', 'US'),
(112, '49 Sheridan Alley', NULL, 'Huntsville', 'AL', '35805', 'US'),
(113, '74 Esch Junction', '81', 'Miami', 'FL', '33142', 'US'),
(114, '30 Dottie Alley', NULL, 'Amarillo', 'TX', '79182', 'US'),
(115, '39 Grasskamp Street', NULL, 'Charleston', 'WV', '25336', 'US'),
(116, '88357 Elgar Hill', NULL, 'Boulder', 'CO', '80310', 'US'),
(117, '916 Columbus Road', NULL, 'Colorado Springs', 'CO', '80935', 'US'),
(118, '9150 Bay Point', '14', 'Sacramento', 'CA', '95828', 'US'),
(119, '44309 Crest Line Road', NULL, 'Montgomery', 'AL', '36114', 'US'),
(120, '96195 Randy Lane', '3', 'Tulsa', 'OK', '74116', 'US'),
(121, '9 Hazelcrest Alley', NULL, 'Washington', 'DC', '20057', 'US'),
(122, '1 Service Avenue', NULL, 'Washington', 'DC', '20557', 'US'),
(123, '35 Anderson Circle', NULL, 'Denver', 'CO', '80291', 'US'),
(124, '365 Vidon Avenue', NULL, 'Silver Spring', 'MD', '20904', 'US'),
(125, '6 Sutherland Circle', NULL, 'Arlington', 'VA', '22212', 'US'),
(126, '475 Schlimgen Point', NULL, 'Odessa', 'TX', '79769', 'US'),
(127, '297 Bunting Circle', '4', 'Hialeah', 'FL', '33018', 'US'),
(128, '729 Sunnyside Road', NULL, 'Washington', 'DC', '20414', 'US'),
(129, '4 Thackeray Street', '71', 'Atlanta', 'GA', '30358', 'US'),
(130, '313 Oxford Court', NULL, 'Shreveport', 'LA', '71137', 'US'),
(131, '71695 Elka Park', NULL, 'Boca Raton', 'FL', '33487', 'US'),
(132, '394 Vernon Hill', NULL, 'Round Rock', 'TX', '78682', 'US'),
(133, '1 Farragut Park', NULL, 'Little Rock', 'AR', '72215', 'US'),
(134, '1741 Browning Place', NULL, 'Detroit', 'MI', '48232', 'US'),
(135, '33 Cherokee Alley', NULL, 'Cincinnati', 'OH', '45264', 'US'),
(136, '5715 Onsgard Plaza', NULL, 'Mount Vernon', 'NY', '10557', 'US'),
(137, '92 Lukken Court', NULL, 'Ocala', 'FL', '34479', 'US'),
(138, '2008 Johnson Court', NULL, 'Buffalo', 'NY', '14215', 'US'),
(139, '7 Kingsford Drive', NULL, 'Arlington', 'VA', '22217', 'US'),
(140, '82 North Plaza', NULL, 'Winston Salem', 'NC', '27110', 'US'),
(141, '4987 Spohn Pass', NULL, 'San Diego', 'CA', '92105', 'US'),
(142, '757 Anderson Trail', NULL, 'Sioux Falls', 'SD', '57188', 'US'),
(143, '49526 Lillian Pass', NULL, 'Portland', 'OR', '97201', 'US'),
(144, '76 Twin Pines Street', NULL, 'San Antonio', 'TX', '78278', 'US'),
(145, '6 Hanson Lane', NULL, 'Naples', 'FL', '34108', 'US'),
(146, '986 Portage Court', NULL, 'Houston', 'TX', '77293', 'US'),
(147, '51140 Cambridge Way', NULL, 'Santa Barbara', 'CA', '93150', 'US'),
(148, '52431 Comanche Lane', NULL, 'Los Angeles', 'CA', '90025', 'US'),
(149, '04619 Manitowish Crossing', NULL, 'Evansville', 'IN', '47712', 'US'),
(150, '447 Corben Way', NULL, 'Jersey City', 'NJ', '07305', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `advising`
--

CREATE TABLE `advising` (
  `studentID` int(11) NOT NULL,
  `classID` int(11) NOT NULL,
  `term` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `date` date NOT NULL,
  `comments` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `applicationID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `term` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `program` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `concentration` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `reqScholarship` tinyint(1) NOT NULL DEFAULT '0',
  `previousApp` tinyint(1) NOT NULL DEFAULT '0',
  `previousAppDate` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previousEnrollment` tinyint(1) NOT NULL DEFAULT '0',
  `previousEnrollmentDate` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previousEnrollmentStatus` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `undergradGPA` decimal(3,2) NOT NULL,
  `juniorseniorGPA` decimal(3,2) NOT NULL,
  `currentEmployer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeAtCurrentEmployer` date DEFAULT NULL,
  `gmat` tinyint(1) NOT NULL DEFAULT '0',
  `gmatTestDate` date DEFAULT NULL,
  `gmatQScore` smallint(6) DEFAULT NULL,
  `gmatVScore` smallint(6) DEFAULT NULL,
  `gmatTScore` smallint(6) DEFAULT NULL,
  `gre` tinyint(1) NOT NULL DEFAULT '0',
  `greTestDate` date DEFAULT NULL,
  `greQScore` smallint(6) DEFAULT NULL,
  `greVScore` smallint(6) DEFAULT NULL,
  `greTScore` smallint(6) DEFAULT NULL,
  `toeflOnline` tinyint(1) NOT NULL DEFAULT '0',
  `toeflPaper` tinyint(1) NOT NULL DEFAULT '0',
  `toeflTestDate` date DEFAULT NULL,
  `toeflOnlineScore` smallint(6) DEFAULT NULL,
  `toeflPaperScore` smallint(6) DEFAULT NULL,
  `tse` tinyint(1) NOT NULL DEFAULT '0',
  `tseTestDate` date DEFAULT NULL,
  `tseScore` smallint(6) DEFAULT NULL,
  `offerStatus` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Undecided',
  `assistantshipStatus` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicantResponse` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`applicationID`, `studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`, `offerStatus`, `assistantshipStatus`, `applicantResponse`, `applicationDate`) VALUES
(1, 1, 'Spring', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 0, 'Fall 2010', 1, 'Fall 2011', 'Undergraduate', '3.44', '2.73', 'Heller and Sons', '2009-10-26', 0, '2015-02-17', 46, 16, 307, 1, '2015-09-12', 139, 169, 282, 0, 0, '2014-04-04', 113, 488, 0, '2015-07-26', 43, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(2, 2, 'Fall', 2019, 'Professional MIS', 'Software Engineering Management', 0, 0, 'Spring 2013', 0, 'Spring 2011', 'Other', '2.81', '2.87', 'Beahan, Stark and Goyette', '2014-05-23', 1, '2013-08-09', 14, 46, 761, 1, '2014-04-12', 139, 150, 310, 0, 1, '2014-08-04', 88, 347, 1, '2016-07-03', 44, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(3, 3, 'Spring', 2020, 'Professional MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Fall 2015', 0, 'Fall 2010', 'Graduate', '3.41', '3.21', 'Koss-Boyle', '2014-06-24', 0, '2017-01-30', 36, 14, 724, 1, '2016-10-02', 140, 136, 272, 1, 1, '2012-03-23', 31, 511, 1, '2012-12-30', 29, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(4, 4, 'Spring', 2018, 'Professional MIS', 'Software Engineering Management', 0, 0, 'Fall 2013', 0, 'Fall 2013', 'Undergraduate', '3.04', '3.19', 'Hermann-Hagenes', '2011-12-30', 1, '2016-10-23', 49, 17, 405, 1, '2013-10-17', 154, 135, 273, 1, 0, '2013-02-13', 77, 374, 1, '2011-08-24', 22, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(5, 5, 'Summer', 2018, 'Professional MIS', 'Information Technology Management', 0, 1, 'Spring 2015', 0, 'Fall 2010', 'Other', '3.00', '3.36', 'Walter, Ward and Kerluke', '2013-02-17', 1, '2017-07-09', 50, 44, 264, 1, '2011-05-13', 170, 151, 294, 1, 0, '2016-05-21', 64, 496, 1, '2015-04-25', 54, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(6, 6, 'Summer', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Spring 2012', 0, 'Spring 2012', 'Graduate', '2.77', '3.39', 'Carroll-Berge', '2009-09-18', 0, '2016-08-22', 43, 38, 223, 0, '2017-11-06', 139, 135, 290, 0, 0, '2011-02-07', 116, 467, 0, '2015-06-09', 42, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(7, 7, 'Spring', 2019, 'Professional MIS', 'Software Engineering Management', 1, 0, 'Fall 2010', 1, 'Fall 2013', 'Undergraduate', '2.94', '2.62', 'Dooley-Jacobi', '2009-10-22', 1, '2014-10-03', 27, 51, 703, 1, '2017-09-22', 152, 149, 334, 0, 1, '2013-06-10', 3, 516, 1, '2017-05-09', 42, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(8, 8, 'Summer', 2019, 'Full-Time MIS', 'Software Engineering Management', 1, 0, 'Fall 2011', 1, 'Spring 2012', 'Graduate', '3.83', '3.54', 'Schmeler-Howell', '2007-05-27', 1, '2012-03-03', 43, 47, 650, 1, '2017-03-02', 137, 169, 313, 1, 0, '2013-10-07', 4, 464, 0, '2013-09-26', 32, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(9, 9, 'Fall', 2016, 'Professional MIS', 'Information Technology Management', 0, 0, 'Spring 2015', 0, 'Fall 2014', 'Other', '2.76', '2.76', 'Daniel Inc', '2013-05-20', 0, '2017-03-23', 51, 14, 261, 1, '2016-01-15', 154, 154, 294, 0, 0, '2011-06-10', 117, 490, 0, '2013-11-19', 52, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(10, 10, 'Fall', 2016, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Fall 2011', 0, 'Fall 2012', 'Graduate', '3.95', '3.41', 'Kovacek and Sons', '2009-02-22', 0, '2012-08-20', 20, 29, 539, 1, '2015-09-28', 167, 135, 310, 1, 1, '2014-12-19', 24, 387, 0, '2015-02-03', 36, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(11, 11, 'Summer', 2020, 'Full-Time MIS', 'Software Engineering Management', 0, 0, 'Fall 2015', 0, 'Spring 2015', 'Graduate', '3.42', '3.44', 'Lindgren Inc', '2008-03-12', 0, '2015-08-26', 21, 35, 788, 1, '2012-09-17', 166, 133, 327, 1, 1, '2017-08-16', 78, 604, 0, '2011-02-20', 28, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(12, 12, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', 1, 1, 'Fall 2010', 0, 'Fall 2011', 'Graduate', '2.52', '3.96', 'Treutel, Stracke and Ruecker', '2008-02-13', 0, '2014-08-13', 26, 25, 679, 0, '2014-06-01', 170, 161, 263, 1, 0, '2011-03-15', 46, 586, 0, '2011-06-12', 48, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(13, 13, 'Fall', 2020, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Fall 2013', 1, 'Spring 2013', 'Other', '3.32', '2.87', 'Russel, Veum and Jacobs', '2009-05-26', 1, '2011-11-11', 27, 21, 359, 0, '2013-05-09', 134, 155, 273, 1, 0, '2017-06-23', 101, 486, 0, '2016-10-22', 31, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(14, 14, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Spring 2010', 1, 'Fall 2012', 'Undergraduate', '3.69', '2.74', 'Gerlach, Steuber and Lesch', '2012-07-19', 1, '2015-01-15', 26, 22, 474, 1, '2016-08-05', 141, 167, 331, 1, 0, '2013-05-23', 95, 348, 1, '2012-02-21', 43, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(15, 15, 'Spring', 2020, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Spring 2014', 0, 'Fall 2014', 'Undergraduate', '2.93', '3.00', 'Beer-Schowalter', '2013-02-22', 1, '2015-01-03', 27, 35, 303, 0, '2017-10-06', 153, 147, 339, 0, 1, '2014-04-23', 36, 677, 0, '2016-12-13', 24, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(16, 16, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2013', 0, 'Spring 2010', 'Other', '3.98', '3.39', 'Lindgren LLC', '2007-10-15', 0, '2015-08-05', 12, 17, 217, 1, '2016-11-24', 145, 165, 325, 1, 1, '2017-06-21', 8, 447, 1, '2016-05-05', 29, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(17, 17, 'Fall', 2016, 'Professional MIS', 'Software Engineering Management', 0, 1, 'Spring 2010', 1, 'Fall 2012', 'Undergraduate', '3.23', '2.66', 'Davis Inc', '2010-11-14', 0, '2016-09-30', 37, 49, 219, 0, '2016-06-18', 168, 155, 303, 1, 0, '2012-09-16', 17, 510, 1, '2015-11-17', 54, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(18, 18, 'Fall', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 1, 'Fall 2013', 1, 'Spring 2014', 'Graduate', '3.79', '3.25', 'Kassulke-Haley', '2012-07-25', 0, '2012-10-01', 42, 10, 366, 0, '2017-07-19', 163, 156, 277, 1, 0, '2016-05-12', 28, 482, 0, '2017-05-02', 22, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(19, 19, 'Spring', 2017, 'Professional MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2012', 1, 'Spring 2012', 'Other', '3.90', '2.91', 'Torp Group', '2010-05-05', 0, '2012-06-08', 44, 25, 722, 1, '2013-05-06', 134, 158, 311, 0, 1, '2013-06-05', 92, 566, 0, '2013-06-07', 46, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(20, 20, 'Fall', 2016, 'Full-Time MIS', 'Information Technology Management', 1, 1, 'Spring 2011', 0, 'Fall 2012', 'Graduate', '2.56', '2.54', 'Predovic, Heidenreich and Jacobson', '2012-11-21', 0, '2017-03-25', 22, 22, 599, 1, '2013-09-08', 149, 170, 311, 1, 0, '2017-03-24', 85, 476, 0, '2016-04-09', 58, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(21, 21, 'Summer', 2020, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Fall 2012', 0, 'Fall 2011', 'Graduate', '3.44', '3.38', 'Waelchi-Lynch', '2007-12-31', 0, '2011-05-26', 33, 20, 772, 1, '2014-12-16', 149, 149, 319, 0, 0, '2014-09-21', 42, 665, 0, '2017-06-03', 38, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(22, 22, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', 0, 0, 'Spring 2015', 1, 'Fall 2011', 'Other', '3.69', '2.73', 'Dooley-Jacobs', '2008-02-09', 0, '2014-07-11', 23, 45, 776, 1, '2016-04-15', 139, 147, 292, 1, 0, '2013-06-12', 113, 394, 0, '2016-10-20', 32, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(23, 23, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Spring 2013', 0, 'Spring 2014', 'Other', '3.69', '2.82', 'Kuhn, Dare and McDermott', '2013-01-31', 1, '2017-03-30', 33, 46, 225, 0, '2014-10-12', 130, 158, 293, 1, 1, '2016-07-14', 93, 418, 1, '2013-02-15', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(24, 24, 'Fall', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Spring 2012', 1, 'Fall 2014', 'Undergraduate', '3.94', '3.95', 'Durgan, Greenholt and Bartell', '2007-03-09', 0, '2012-11-10', 8, 6, 669, 0, '2012-05-03', 143, 151, 260, 0, 1, '2012-12-14', 105, 443, 1, '2011-09-05', 23, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(25, 25, 'Fall', 2018, 'Professional MIS', 'Software Engineering Management', 1, 1, 'Spring 2015', 0, 'Spring 2015', 'Graduate', '2.90', '3.64', 'Sporer, Hilll and Lehner', '2008-05-29', 1, '2017-03-06', 43, 42, 703, 1, '2017-07-31', 161, 160, 318, 1, 0, '2015-03-27', 40, 638, 1, '2014-06-25', 57, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(26, 26, 'Fall', 2019, 'Full-Time MIS', 'Software Engineering Management', 1, 1, 'Fall 2014', 1, 'Spring 2014', 'Other', '3.25', '2.85', 'Wiegand-Cassin', '2014-05-22', 0, '2012-08-04', 30, 49, 669, 1, '2013-01-20', 135, 143, 301, 0, 0, '2013-09-13', 72, 462, 1, '2015-07-16', 34, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(27, 27, 'Summer', 2016, 'Professional MIS', 'Software Engineering Management', 1, 0, 'Spring 2015', 0, 'Fall 2012', 'Graduate', '3.10', '3.42', 'Hoeger, Bogisich and Hahn', '2010-12-06', 0, '2016-11-13', 14, 11, 417, 1, '2017-09-24', 157, 144, 278, 0, 1, '2016-07-02', 105, 659, 0, '2015-01-24', 55, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(28, 28, 'Spring', 2019, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 1, 'Fall 2012', 1, 'Spring 2013', 'Undergraduate', '3.25', '3.38', 'Dietrich-Predovic', '2014-12-10', 1, '2013-05-11', 12, 20, 309, 0, '2016-10-23', 143, 133, 296, 1, 0, '2017-03-17', 43, 318, 0, '2011-07-29', 46, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(29, 29, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', 1, 1, 'Fall 2015', 1, 'Spring 2014', 'Other', '3.68', '2.63', 'Blick-Parker', '2012-05-17', 0, '2013-11-04', 51, 19, 787, 1, '2015-05-25', 153, 133, 283, 1, 1, '2016-09-02', 102, 559, 1, '2013-04-18', 21, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(30, 30, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 1, 'Spring 2015', 1, 'Spring 2010', 'Graduate', '3.68', '3.00', 'Armstrong and Sons', '2010-02-18', 1, '2013-11-20', 19, 42, 591, 1, '2013-11-24', 146, 164, 276, 1, 1, '2016-08-29', 11, 426, 0, '2015-02-28', 37, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(31, 31, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Spring 2010', 1, 'Fall 2014', 'Undergraduate', '3.80', '2.59', 'Wyman, Spinka and Hermiston', '2008-10-25', 1, '2017-01-25', 17, 21, 378, 0, '2013-11-04', 168, 169, 276, 0, 0, '2013-06-19', 108, 587, 0, '2017-04-17', 35, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(32, 32, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Fall 2014', 0, 'Fall 2015', 'Other', '3.61', '3.63', 'Haley, Kessler and Gutkowski', '2015-11-01', 0, '2012-06-05', 23, 51, 431, 0, '2016-03-26', 144, 146, 262, 0, 1, '2017-05-23', 68, 433, 0, '2013-04-11', 58, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(33, 33, 'Fall', 2017, 'Professional MIS', 'Information Technology Management', 0, 0, 'Spring 2011', 0, 'Fall 2011', 'Other', '2.56', '2.59', 'VonRueden, Schmeler and Quigley', '2010-10-08', 1, '2017-12-04', 13, 38, 727, 0, '2014-03-27', 147, 161, 275, 1, 1, '2012-11-02', 30, 671, 0, '2016-10-09', 42, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(34, 34, 'Spring', 2016, 'Professional MIS', 'Information Technology Management', 0, 0, 'Spring 2013', 0, 'Spring 2013', 'Undergraduate', '3.99', '3.18', 'Sporer Inc', '2010-03-17', 1, '2017-03-10', 9, 20, 780, 1, '2016-12-11', 131, 154, 313, 1, 1, '2013-08-08', 4, 412, 1, '2016-07-03', 54, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(35, 35, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Fall 2014', 0, 'Fall 2010', 'Other', '2.76', '2.86', 'Orn LLC', '2014-05-14', 1, '2017-04-24', 16, 32, 733, 0, '2015-02-10', 139, 163, 315, 0, 1, '2012-07-07', 112, 520, 1, '2012-08-04', 40, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(36, 36, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2013', 1, 'Spring 2012', 'Graduate', '2.53', '3.17', 'Hoeger LLC', '2007-03-24', 1, '2013-06-09', 12, 47, 640, 1, '2014-10-30', 132, 170, 262, 0, 1, '2013-06-22', 36, 519, 0, '2017-07-15', 31, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(37, 37, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Spring 2015', 1, 'Spring 2015', 'Undergraduate', '2.64', '3.02', 'Wehner Inc', '2016-04-23', 1, '2015-09-28', 21, 40, 749, 1, '2017-04-30', 136, 146, 310, 1, 1, '2011-01-14', 12, 472, 1, '2016-09-01', 28, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(38, 38, 'Fall', 2018, 'Full-Time MIS', 'Software Engineering Management', 0, 1, 'Fall 2012', 0, 'Spring 2015', 'Other', '3.82', '2.58', 'Littel LLC', '2011-04-22', 1, '2016-07-16', 10, 41, 273, 0, '2014-01-29', 170, 136, 272, 0, 0, '2014-07-02', 92, 353, 0, '2012-12-01', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(39, 39, 'Summer', 2018, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Spring 2015', 1, 'Spring 2012', 'Undergraduate', '2.70', '3.75', 'Moen, Ernser and Crist', '2008-07-09', 0, '2012-11-08', 16, 8, 577, 0, '2011-02-14', 152, 161, 276, 0, 1, '2013-08-08', 72, 561, 1, '2012-06-01', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(40, 40, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Spring 2010', 1, 'Spring 2011', 'Other', '2.81', '3.40', 'Carter LLC', '2009-06-26', 1, '2015-04-15', 41, 47, 386, 1, '2015-02-28', 148, 148, 319, 0, 0, '2011-12-24', 16, 677, 1, '2015-08-04', 42, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(41, 41, 'Summer', 2018, 'Professional MIS', 'Information Technology Management', 1, 0, 'Fall 2013', 0, 'Fall 2013', 'Other', '3.17', '3.67', 'Will-Oberbrunner', '2010-04-27', 1, '2011-01-17', 24, 20, 239, 1, '2017-03-20', 130, 159, 275, 1, 0, '2011-04-09', 37, 501, 1, '2013-11-26', 40, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(42, 42, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', 0, 1, 'Fall 2013', 1, 'Spring 2010', 'Graduate', '3.63', '3.49', 'Predovic-Mraz', '2014-02-20', 0, '2016-10-11', 43, 30, 254, 0, '2017-09-21', 161, 141, 268, 1, 0, '2012-01-14', 76, 612, 0, '2013-10-04', 38, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(43, 43, 'Fall', 2020, 'Professional MIS', 'Software Engineering Management', 0, 0, 'Fall 2012', 0, 'Fall 2015', 'Undergraduate', '3.58', '2.74', 'Wiegand, Hintz and Jaskolski', '2012-01-24', 0, '2011-09-25', 27, 29, 763, 1, '2013-03-29', 163, 139, 269, 0, 1, '2017-06-07', 25, 334, 0, '2012-07-15', 30, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(44, 44, 'Summer', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 1, 'Fall 2015', 1, 'Spring 2015', 'Undergraduate', '3.94', '3.90', 'Schmitt-Welch', '2014-08-02', 0, '2014-06-09', 18, 40, 649, 0, '2016-01-22', 168, 168, 318, 0, 0, '2015-01-23', 76, 379, 1, '2017-12-17', 29, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(45, 45, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Spring 2014', 1, 'Fall 2014', 'Undergraduate', '2.72', '3.43', 'Beahan-Wunsch', '2008-06-26', 0, '2017-04-09', 44, 26, 296, 1, '2013-06-19', 167, 138, 287, 0, 1, '2013-10-04', 57, 502, 0, '2012-03-14', 31, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(46, 46, 'Summer', 2017, 'Professional MIS', 'Information Technology Management', 0, 1, 'Spring 2011', 0, 'Spring 2010', 'Graduate', '3.93', '3.76', 'Kreiger-Zemlak', '2008-10-21', 0, '2015-02-05', 35, 15, 544, 1, '2011-03-18', 163, 165, 335, 1, 0, '2014-03-12', 88, 423, 0, '2014-08-10', 41, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(47, 47, 'Fall', 2020, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Fall 2010', 1, 'Fall 2013', 'Graduate', '3.71', '3.60', 'Grimes, Satterfield and Hoeger', '2011-02-15', 0, '2014-07-30', 48, 9, 638, 0, '2015-07-22', 163, 168, 335, 1, 1, '2016-01-26', 117, 545, 1, '2017-03-13', 32, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(48, 48, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2012', 1, 'Spring 2012', 'Other', '3.02', '2.72', 'Bernhard Group', '2015-07-12', 0, '2011-09-07', 24, 42, 721, 1, '2015-12-02', 139, 135, 268, 1, 1, '2011-02-27', 17, 532, 0, '2013-04-30', 43, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(49, 49, 'Summer', 2016, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2012', 1, 'Fall 2011', 'Undergraduate', '3.32', '3.84', 'Huels-Stark', '2012-12-16', 1, '2016-10-12', 18, 36, 661, 1, '2011-05-27', 160, 166, 282, 0, 1, '2015-10-29', 69, 625, 0, '2014-10-08', 29, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(50, 50, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Spring 2010', 1, 'Fall 2012', 'Undergraduate', '3.27', '2.61', 'Kris Group', '2009-04-06', 1, '2011-09-03', 14, 28, 503, 0, '2011-09-09', 142, 166, 276, 1, 1, '2011-07-22', 7, 312, 1, '2012-10-10', 46, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(51, 51, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2011', 1, 'Spring 2013', 'Graduate', '2.81', '3.52', 'Jaskolski-Beer', '2014-04-14', 0, '2016-05-14', 32, 50, 443, 1, '2014-09-10', 169, 151, 312, 1, 1, '2013-07-26', 19, 608, 0, '2013-01-02', 54, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(52, 52, 'Summer', 2018, 'Full-Time MIS', 'Software Engineering Management', 0, 0, 'Fall 2013', 1, 'Fall 2015', 'Other', '2.73', '3.50', 'Bartell Inc', '2009-06-27', 0, '2014-06-28', 36, 47, 694, 1, '2015-05-17', 169, 150, 313, 1, 1, '2012-05-18', 112, 437, 0, '2015-09-17', 43, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(53, 53, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2015', 0, 'Spring 2013', 'Undergraduate', '2.84', '3.49', 'Ruecker LLC', '2007-04-13', 1, '2017-02-18', 10, 9, 551, 0, '2016-09-12', 162, 148, 271, 0, 1, '2012-09-11', 21, 426, 1, '2011-04-26', 44, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(54, 54, 'Summer', 2019, 'Professional MIS', 'Information Technology Management', 1, 1, 'Spring 2012', 1, 'Spring 2014', 'Graduate', '3.71', '3.93', 'McKenzie, Collins and Casper', '2016-03-29', 0, '2012-07-04', 24, 14, 665, 0, '2011-05-05', 148, 159, 276, 0, 1, '2014-04-13', 91, 596, 1, '2016-10-20', 34, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(55, 55, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 1, 'Fall 2011', 0, 'Spring 2012', 'Undergraduate', '3.34', '3.62', 'Kreiger, Jerde and Batz', '2008-01-31', 1, '2016-05-03', 10, 13, 453, 0, '2011-08-25', 160, 133, 282, 1, 1, '2011-03-23', 96, 482, 0, '2016-04-12', 31, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(56, 56, 'Summer', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Spring 2010', 1, 'Spring 2014', 'Graduate', '3.28', '3.77', 'Sanford-Halvorson', '2016-01-24', 0, '2013-12-09', 48, 29, 556, 1, '2015-08-03', 155, 137, 298, 0, 1, '2011-04-22', 9, 379, 1, '2012-06-26', 24, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(57, 57, 'Spring', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2013', 0, 'Fall 2011', 'Other', '3.51', '3.32', 'Stroman-Nader', '2012-10-17', 1, '2013-07-28', 36, 36, 792, 1, '2014-06-19', 170, 165, 261, 1, 1, '2015-06-21', 46, 554, 1, '2017-06-03', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(58, 58, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2010', 1, 'Spring 2014', 'Undergraduate', '3.28', '2.58', 'Gutkowski-Goodwin', '2013-04-09', 1, '2015-11-04', 17, 50, 241, 1, '2011-05-06', 158, 149, 267, 0, 1, '2015-06-04', 95, 438, 0, '2014-02-14', 29, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(59, 59, 'Fall', 2019, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Fall 2014', 0, 'Fall 2015', 'Graduate', '3.46', '2.69', 'Hilpert, Bogan and Will', '2008-08-08', 0, '2017-10-05', 31, 30, 451, 0, '2012-08-11', 161, 170, 292, 1, 1, '2017-03-09', 78, 503, 1, '2015-03-30', 32, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(60, 60, 'Fall', 2017, 'Professional MIS', 'Information Technology Management', 1, 0, 'Fall 2013', 0, 'Spring 2013', 'Graduate', '3.63', '2.96', 'Keeling and Sons', '2013-08-11', 0, '2014-02-13', 46, 9, 703, 0, '2017-01-26', 168, 156, 295, 1, 1, '2017-09-12', 53, 528, 1, '2015-03-02', 52, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(61, 61, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2015', 0, 'Fall 2011', 'Undergraduate', '3.17', '3.15', 'Gerlach, Davis and Fritsch', '2008-08-01', 0, '2016-11-20', 22, 26, 249, 0, '2011-10-25', 169, 151, 284, 1, 0, '2014-04-21', 94, 367, 0, '2011-01-22', 38, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(62, 62, 'Spring', 2019, 'Professional MIS', 'Software Engineering Management', 1, 1, 'Spring 2011', 0, 'Spring 2010', 'Undergraduate', '2.83', '3.90', 'Christiansen, Ernser and Roberts', '2009-09-14', 1, '2015-09-10', 9, 10, 478, 1, '2014-07-31', 159, 150, 313, 1, 1, '2016-07-25', 94, 543, 0, '2017-06-14', 21, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(63, 63, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', 0, 1, 'Fall 2010', 0, 'Spring 2013', 'Graduate', '3.92', '3.79', 'Raynor LLC', '2013-01-17', 0, '2011-11-01', 19, 8, 371, 1, '2013-03-13', 141, 157, 288, 1, 1, '2017-07-29', 72, 339, 1, '2015-04-05', 45, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(64, 64, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Spring 2012', 0, 'Spring 2013', 'Undergraduate', '3.97', '2.81', 'Kling, Boyer and Wyman', '2013-04-11', 1, '2013-09-11', 13, 33, 542, 1, '2014-05-13', 154, 134, 330, 1, 1, '2011-02-21', 61, 415, 1, '2011-04-19', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(65, 65, 'Summer', 2017, 'Full-Time MIS', 'Information Technology Management', 0, 0, 'Spring 2010', 1, 'Fall 2011', 'Graduate', '3.94', '3.69', 'Pouros LLC', '2009-12-23', 1, '2013-10-24', 10, 50, 333, 0, '2013-03-21', 153, 150, 303, 1, 0, '2016-12-10', 59, 443, 0, '2016-08-29', 58, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(66, 66, 'Spring', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Spring 2011', 0, 'Spring 2014', 'Undergraduate', '3.78', '3.23', 'Gleichner-Ebert', '2014-05-21', 1, '2012-02-11', 21, 16, 207, 0, '2014-04-16', 143, 140, 323, 0, 0, '2013-01-15', 76, 345, 0, '2012-09-01', 35, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(67, 67, 'Summer', 2016, 'Professional MIS', 'Information Technology Management', 1, 0, 'Spring 2010', 0, 'Spring 2014', 'Graduate', '2.57', '3.95', 'O\'Keefe, Mante and Moen', '2014-02-17', 0, '2013-04-10', 38, 47, 608, 1, '2011-05-11', 146, 156, 338, 0, 1, '2015-11-16', 110, 652, 0, '2013-05-25', 31, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(68, 68, 'Spring', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 1, 'Spring 2015', 1, 'Fall 2013', 'Graduate', '2.83', '2.88', 'Lynch-MacGyver', '2012-09-12', 0, '2017-10-12', 14, 30, 714, 1, '2013-12-08', 158, 130, 268, 0, 1, '2011-06-24', 5, 658, 0, '2016-01-02', 24, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(69, 69, 'Spring', 2016, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Fall 2014', 1, 'Spring 2013', 'Graduate', '3.00', '2.55', 'Rolfson, Klocko and Carroll', '2013-08-05', 1, '2011-11-30', 51, 27, 468, 1, '2014-11-09', 136, 156, 317, 1, 1, '2016-07-16', 71, 374, 0, '2015-01-28', 23, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(70, 70, 'Spring', 2016, 'Full-Time MIS', 'Software Engineering Management', 1, 0, 'Fall 2013', 1, 'Fall 2010', 'Graduate', '2.72', '2.73', 'Hudson-Hickle', '2012-08-31', 0, '2013-05-05', 31, 51, 267, 1, '2013-10-02', 158, 160, 331, 1, 1, '2013-04-22', 64, 585, 1, '2016-09-10', 21, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(71, 71, 'Spring', 2020, 'Professional MIS', 'Information Technology Management', 0, 0, 'Fall 2015', 1, 'Spring 2012', 'Graduate', '2.65', '2.89', 'Bergstrom Group', '2008-08-21', 0, '2013-12-12', 32, 31, 239, 0, '2011-11-16', 134, 131, 295, 1, 1, '2015-03-24', 83, 345, 1, '2012-01-22', 34, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(72, 72, 'Fall', 2019, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Spring 2011', 0, 'Fall 2012', 'Other', '3.33', '2.75', 'Hamill, Gusikowski and Olson', '2009-06-18', 0, '2014-10-25', 29, 50, 479, 1, '2016-12-03', 132, 169, 335, 0, 1, '2012-10-14', 8, 402, 0, '2011-07-02', 56, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(73, 73, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Fall 2012', 0, 'Fall 2014', 'Undergraduate', '2.56', '3.82', 'Smitham Inc', '2011-12-08', 0, '2017-06-10', 47, 22, 388, 0, '2017-09-26', 149, 151, 307, 0, 1, '2011-10-11', 73, 416, 0, '2013-05-22', 58, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(74, 74, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', 0, 0, 'Spring 2014', 0, 'Fall 2010', 'Undergraduate', '2.72', '3.28', 'Harber, Stracke and Mann', '2011-02-07', 1, '2013-05-20', 22, 27, 721, 0, '2015-12-13', 155, 154, 281, 0, 1, '2012-03-01', 94, 545, 1, '2017-06-28', 32, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(75, 75, 'Spring', 2019, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Fall 2010', 1, 'Fall 2010', 'Other', '2.57', '3.32', 'Herman, Torp and Schmidt', '2008-06-13', 1, '2015-07-09', 25, 42, 388, 0, '2013-02-07', 162, 166, 317, 1, 1, '2012-02-20', 93, 384, 0, '2012-09-03', 58, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(76, 76, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 0, 'Fall 2012', 0, 'Fall 2011', 'Graduate', '3.11', '3.87', 'Bins, Pfannerstill and Cassin', '2010-10-30', 1, '2012-10-23', 16, 7, 248, 0, '2012-01-12', 139, 149, 320, 0, 0, '2013-01-31', 48, 595, 1, '2013-08-02', 35, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(77, 77, 'Spring', 2017, 'Professional MIS', 'Information Technology Management', 0, 0, 'Spring 2012', 1, 'Spring 2014', 'Other', '3.54', '3.78', 'Anderson, Kling and Kuphal', '2011-12-30', 0, '2016-12-26', 34, 51, 551, 0, '2016-09-03', 155, 148, 311, 1, 1, '2015-12-07', 43, 365, 1, '2016-08-25', 54, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(78, 78, 'Fall', 2019, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Fall 2014', 0, 'Spring 2010', 'Graduate', '3.55', '2.95', 'Weimann-Champlin', '2015-05-07', 1, '2014-05-30', 19, 25, 284, 1, '2017-12-13', 167, 130, 281, 0, 0, '2013-04-09', 37, 516, 1, '2017-03-06', 34, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(79, 79, 'Spring', 2017, 'Professional MIS', 'Software Engineering Management', 1, 0, 'Fall 2014', 0, 'Fall 2014', 'Other', '2.66', '2.81', 'Johns, Treutel and Smith', '2014-07-23', 1, '2013-08-17', 7, 49, 286, 0, '2012-04-11', 147, 160, 282, 0, 0, '2014-02-25', 120, 560, 0, '2017-08-29', 51, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(80, 80, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2013', 0, 'Fall 2012', 'Graduate', '3.15', '3.28', 'Becker, Jenkins and Kris', '2016-06-23', 1, '2014-12-25', 28, 44, 702, 0, '2013-06-03', 152, 166, 290, 1, 0, '2017-09-05', 21, 416, 1, '2012-06-23', 44, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(81, 81, 'Summer', 2020, 'Professional MIS', 'Information Technology Management', 1, 0, 'Spring 2015', 1, 'Spring 2012', 'Graduate', '3.41', '2.66', 'Kiehn LLC', '2008-08-06', 1, '2016-12-22', 41, 46, 539, 0, '2011-01-24', 159, 137, 314, 0, 1, '2013-01-13', 38, 484, 1, '2014-07-06', 23, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(82, 82, 'Summer', 2016, 'Professional MIS', 'Information Technology Management', 0, 0, 'Fall 2012', 1, 'Spring 2015', 'Other', '3.13', '2.87', 'O\'Reilly-Dickens', '2014-01-06', 1, '2012-04-30', 13, 41, 518, 0, '2014-11-15', 153, 170, 306, 0, 1, '2015-09-01', 63, 614, 1, '2013-05-26', 58, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(83, 83, 'Fall', 2017, 'Full-Time MIS', 'Software Engineering Management', 0, 1, 'Fall 2011', 1, 'Spring 2010', 'Undergraduate', '3.49', '3.84', 'Harris-Bode', '2013-09-09', 0, '2012-12-22', 50, 43, 743, 0, '2014-11-30', 163, 155, 337, 0, 0, '2012-03-12', 80, 582, 1, '2012-10-25', 25, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(84, 84, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Fall 2015', 0, 'Spring 2012', 'Undergraduate', '2.74', '3.30', 'Kassulke Group', '2010-10-20', 1, '2017-05-30', 7, 9, 730, 1, '2014-02-08', 169, 167, 270, 1, 1, '2017-07-03', 47, 554, 1, '2011-06-25', 40, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(85, 85, 'Summer', 2017, 'Professional MIS', 'Information Technology Management', 1, 0, 'Fall 2014', 1, 'Spring 2014', 'Undergraduate', '2.63', '3.18', 'Herman-Ortiz', '2007-09-19', 1, '2015-12-12', 44, 27, 563, 0, '2017-07-01', 131, 134, 267, 1, 1, '2014-02-26', 88, 499, 1, '2013-11-29', 21, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(86, 86, 'Summer', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Spring 2013', 1, 'Spring 2012', 'Other', '3.10', '2.99', 'Kuhic Inc', '2013-01-22', 1, '2011-01-28', 43, 37, 765, 0, '2016-11-07', 157, 133, 267, 0, 0, '2015-12-23', 109, 535, 1, '2014-04-27', 44, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(87, 87, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Fall 2011', 1, 'Fall 2012', 'Graduate', '3.51', '2.67', 'Purdy, Boyle and Watsica', '2012-01-14', 1, '2011-11-29', 36, 12, 273, 0, '2016-12-18', 150, 138, 298, 0, 0, '2015-05-06', 69, 477, 0, '2012-04-13', 26, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(88, 88, 'Fall', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Spring 2013', 1, 'Fall 2012', 'Other', '3.68', '3.60', 'McDermott, Corkery and Williamson', '2007-11-03', 1, '2015-06-04', 10, 17, 544, 0, '2013-12-31', 160, 147, 301, 0, 0, '2013-03-23', 63, 543, 0, '2012-04-08', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(89, 89, 'Fall', 2020, 'Professional MIS', 'Software Engineering Management', 1, 1, 'Spring 2014', 1, 'Spring 2013', 'Undergraduate', '3.79', '2.79', 'Crona, Ryan and Tillman', '2014-04-15', 0, '2013-10-17', 39, 18, 206, 0, '2011-03-24', 167, 145, 299, 0, 1, '2017-03-17', 81, 560, 0, '2011-05-09', 59, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(90, 90, 'Fall', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2011', 0, 'Spring 2014', 'Other', '3.34', '2.56', 'Brekke, Marks and Mills', '2007-02-14', 1, '2012-06-07', 40, 8, 608, 0, '2017-02-21', 151, 166, 293, 0, 0, '2017-07-21', 17, 576, 1, '2017-05-11', 37, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(91, 91, 'Spring', 2019, 'Professional MIS', 'Information Technology Management', 1, 0, 'Spring 2010', 0, 'Spring 2013', 'Other', '3.93', '3.82', 'Crooks-Bernier', '2007-11-01', 0, '2015-03-08', 23, 34, 588, 1, '2017-06-03', 135, 163, 309, 1, 1, '2016-05-29', 22, 562, 0, '2016-11-07', 22, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(92, 92, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2012', 0, 'Fall 2010', 'Undergraduate', '3.90', '3.33', 'Orn, Mraz and Simonis', '2014-09-24', 1, '2015-12-07', 51, 30, 205, 1, '2016-05-22', 167, 166, 327, 1, 1, '2015-02-24', 12, 623, 0, '2015-06-09', 22, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(93, 93, 'Summer', 2020, 'Professional MIS', 'Software Engineering Management', 1, 0, 'Fall 2010', 1, 'Fall 2015', 'Graduate', '2.98', '3.28', 'Swaniawski Inc', '2014-10-06', 0, '2013-10-03', 36, 12, 650, 0, '2013-05-01', 159, 170, 275, 1, 0, '2017-04-08', 85, 447, 1, '2012-03-17', 34, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(94, 94, 'Spring', 2017, 'Professional MIS', 'Software Engineering Management', 0, 1, 'Spring 2014', 0, 'Spring 2012', 'Undergraduate', '3.91', '3.60', 'Wehner-Schaefer', '2015-01-24', 1, '2014-04-14', 14, 45, 368, 0, '2016-04-16', 136, 145, 327, 1, 0, '2011-02-17', 56, 387, 0, '2013-07-18', 38, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(95, 95, 'Spring', 2016, 'Professional MIS', 'Information Technology Management', 1, 1, 'Spring 2012', 0, 'Spring 2012', 'Undergraduate', '3.01', '2.75', 'Nitzsche LLC', '2015-03-26', 0, '2016-08-14', 47, 23, 385, 1, '2011-03-09', 131, 138, 297, 0, 0, '2011-06-10', 93, 540, 0, '2014-05-02', 28, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(96, 96, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Fall 2012', 1, 'Fall 2010', 'Graduate', '3.77', '3.79', 'Pouros and Sons', '2014-02-12', 1, '2014-04-21', 30, 48, 204, 0, '2011-11-15', 146, 161, 279, 0, 1, '2017-01-05', 91, 364, 1, '2017-03-21', 41, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(97, 97, 'Spring', 2016, 'Professional MIS', 'Information Technology Management', 0, 1, 'Fall 2014', 1, 'Fall 2012', 'Graduate', '3.20', '3.43', 'Koelpin, Douglas and Quigley', '2008-12-06', 0, '2015-09-15', 39, 40, 459, 1, '2017-04-06', 165, 159, 280, 0, 1, '2015-01-31', 52, 533, 1, '2014-02-07', 39, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(98, 98, 'Fall', 2020, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2014', 0, 'Spring 2015', 'Graduate', '3.39', '2.94', 'Schumm-Maggio', '2014-07-18', 1, '2017-12-21', 36, 26, 617, 1, '2016-01-24', 150, 149, 261, 1, 1, '2017-05-21', 91, 482, 1, '2011-01-26', 35, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(99, 99, 'Summer', 2020, 'Professional MIS', 'Enterprise Systems (ES) Management', 1, 0, 'Spring 2011', 0, 'Spring 2015', 'Graduate', '3.79', '2.79', 'Goodwin, Bayer and Prosacco', '2013-01-01', 0, '2016-03-22', 48, 24, 493, 1, '2012-07-24', 139, 141, 332, 1, 0, '2017-01-04', 90, 334, 1, '2012-12-07', 27, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(100, 100, 'Summer', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2015', 0, 'Spring 2012', 'Graduate', '3.20', '2.68', 'Feil-Conroy', '2010-11-22', 1, '2012-05-03', 39, 13, 378, 0, '2013-10-06', 148, 156, 271, 1, 1, '2011-05-05', 119, 417, 1, '2014-02-07', 25, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(101, 101, 'Fall', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 0, 'Spring 2011', 1, 'Spring 2011', 'Graduate', '3.32', '3.94', 'Jast, Veum and Mills', '2007-05-26', 0, '2014-07-22', 13, 13, 438, 1, '2016-11-11', 132, 134, 283, 1, 1, '2011-11-16', 108, 459, 1, '2011-07-16', 40, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(102, 102, 'Summer', 2019, 'Full-Time MIS', 'Software Engineering Management', 1, 0, 'Fall 2013', 1, 'Spring 2015', 'Undergraduate', '2.93', '2.93', 'Schaden, Connelly and Fritsch', '2016-03-11', 1, '2017-03-30', 45, 37, 778, 0, '2017-01-25', 157, 131, 264, 0, 1, '2015-11-09', 23, 554, 1, '2012-08-27', 26, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(103, 103, 'Spring', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Fall 2015', 0, 'Spring 2014', 'Other', '3.78', '3.94', 'Ward Inc', '2011-09-16', 0, '2015-07-18', 12, 21, 290, 0, '2011-08-25', 154, 147, 280, 1, 0, '2012-09-29', 91, 495, 0, '2011-05-03', 52, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(104, 104, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2011', 0, 'Spring 2013', 'Other', '3.59', '3.75', 'Larkin-Mertz', '2012-06-25', 0, '2015-06-19', 17, 36, 493, 0, '2013-07-22', 143, 166, 271, 1, 1, '2017-11-06', 78, 452, 1, '2016-10-12', 50, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(105, 105, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Spring 2010', 1, 'Spring 2013', 'Undergraduate', '2.59', '2.95', 'Berge-Hilpert', '2009-09-04', 0, '2013-05-22', 34, 44, 256, 0, '2017-11-04', 137, 134, 307, 0, 1, '2015-07-19', 29, 604, 1, '2015-09-13', 27, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(106, 106, 'Summer', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2014', 1, 'Spring 2012', 'Other', '3.67', '3.28', 'Schaefer Group', '2014-10-02', 0, '2013-03-16', 36, 7, 236, 0, '2014-02-13', 133, 159, 283, 1, 1, '2015-05-14', 20, 609, 1, '2014-08-09', 48, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(107, 107, 'Spring', 2017, 'Full-Time MIS', 'Software Engineering Management', 1, 1, 'Fall 2010', 1, 'Spring 2015', 'Graduate', '3.85', '2.57', 'Bode-Shanahan', '2007-05-03', 0, '2017-05-27', 47, 47, 405, 0, '2016-09-08', 144, 151, 284, 1, 1, '2012-04-05', 35, 646, 1, '2015-12-25', 29, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(108, 108, 'Summer', 2016, 'Full-Time MIS', 'Software Engineering Management', 0, 0, 'Spring 2010', 0, 'Fall 2013', 'Undergraduate', '2.68', '3.46', 'Wolf Group', '2007-09-04', 1, '2011-02-22', 46, 50, 485, 0, '2017-07-25', 158, 149, 296, 0, 1, '2013-11-07', 61, 619, 0, '2015-08-05', 52, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(109, 109, 'Fall', 2016, 'Full-Time MIS', 'Software Engineering Management', 1, 1, 'Spring 2010', 1, 'Fall 2010', 'Undergraduate', '2.89', '3.64', 'Russel Inc', '2015-11-15', 1, '2014-11-09', 8, 7, 745, 1, '2016-09-12', 138, 140, 329, 0, 1, '2013-02-10', 83, 419, 0, '2014-01-31', 35, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(110, 110, 'Fall', 2020, 'Professional MIS', 'Information Technology Management', 1, 1, 'Fall 2011', 1, 'Spring 2014', 'Undergraduate', '2.62', '3.46', 'Cormier LLC', '2010-10-14', 0, '2015-10-06', 34, 37, 774, 0, '2016-04-02', 154, 131, 321, 0, 0, '2017-11-15', 58, 342, 1, '2015-12-22', 60, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(111, 111, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Spring 2015', 0, 'Fall 2012', 'Graduate', '3.38', '3.74', 'Leffler, Langosh and Schoen', '2014-04-06', 0, '2014-11-22', 10, 40, 505, 0, '2011-05-08', 153, 133, 286, 1, 1, '2012-08-08', 11, 462, 1, '2015-10-08', 54, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(112, 112, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Spring 2015', 1, 'Fall 2012', 'Other', '3.15', '3.52', 'Murray, Padberg and Kemmer', '2008-07-21', 0, '2012-01-03', 39, 41, 405, 0, '2016-07-21', 154, 132, 323, 1, 1, '2014-10-26', 88, 472, 1, '2013-02-13', 41, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(113, 113, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Spring 2010', 0, 'Spring 2012', 'Undergraduate', '2.78', '2.96', 'Mills Inc', '2011-03-21', 1, '2013-09-29', 45, 8, 407, 0, '2015-12-21', 170, 164, 295, 0, 0, '2014-02-16', 13, 548, 0, '2012-11-29', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(114, 114, 'Fall', 2019, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 1, 'Spring 2014', 1, 'Fall 2011', 'Other', '3.18', '3.59', 'Murray-Flatley', '2013-03-13', 0, '2016-12-05', 48, 21, 476, 0, '2016-05-07', 168, 146, 300, 0, 1, '2016-09-29', 45, 527, 1, '2014-09-24', 37, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(115, 115, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2015', 0, 'Spring 2015', 'Undergraduate', '2.54', '3.65', 'Balistreri-Bernier', '2007-09-09', 0, '2011-01-09', 41, 29, 442, 0, '2013-01-21', 130, 167, 277, 1, 1, '2011-10-11', 10, 351, 0, '2014-10-18', 32, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(116, 116, 'Spring', 2019, 'Professional MIS', 'Information Technology Management', 1, 1, 'Fall 2014', 0, 'Fall 2015', 'Undergraduate', '2.70', '3.99', 'Sauer, Schamberger and Bins', '2013-08-17', 1, '2014-04-14', 6, 29, 582, 0, '2013-02-23', 161, 166, 306, 0, 1, '2013-06-29', 106, 575, 1, '2012-06-01', 59, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(117, 117, 'Spring', 2019, 'Full-Time MIS', 'Information Technology Management', 0, 1, 'Fall 2012', 1, 'Fall 2013', 'Other', '2.80', '3.80', 'Swift Group', '2016-06-16', 0, '2012-02-14', 29, 41, 432, 0, '2013-08-11', 155, 147, 284, 0, 1, '2011-11-22', 10, 613, 1, '2011-09-26', 52, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(118, 118, 'Spring', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2012', 0, 'Fall 2010', 'Other', '2.63', '3.75', 'Jacobson and Sons', '2013-12-06', 1, '2013-12-01', 16, 45, 490, 0, '2012-01-24', 150, 138, 270, 0, 0, '2016-04-24', 94, 442, 1, '2011-08-03', 52, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(119, 119, 'Spring', 2018, 'Professional MIS', 'Information Technology Management', 1, 1, 'Spring 2012', 1, 'Spring 2013', 'Undergraduate', '2.75', '3.06', 'Vandervort-Green', '2015-05-28', 0, '2014-07-23', 9, 20, 214, 0, '2015-06-03', 154, 139, 267, 0, 1, '2011-09-05', 54, 545, 0, '2015-12-28', 21, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(120, 120, 'Summer', 2016, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2014', 0, 'Fall 2012', 'Graduate', '3.35', '3.36', 'Rodriguez, Bartell and Howe', '2014-08-19', 1, '2014-05-14', 41, 26, 441, 0, '2012-10-23', 147, 137, 304, 1, 0, '2016-07-18', 117, 431, 0, '2016-05-13', 37, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(121, 121, 'Fall', 2019, 'Full-Time MIS', 'Information Technology Management', 1, 1, 'Fall 2014', 1, 'Spring 2013', 'Graduate', '3.11', '2.93', 'Altenwerth, Murazik and Parisian', '2014-05-29', 0, '2012-06-17', 12, 28, 689, 0, '2012-08-30', 133, 149, 332, 0, 1, '2011-02-09', 24, 625, 0, '2017-02-26', 20, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(122, 122, 'Fall', 2020, 'Full-Time MIS', 'Software Engineering Management', 0, 0, 'Fall 2011', 1, 'Spring 2012', 'Graduate', '2.71', '2.85', 'Wehner-O\'Hara', '2009-03-13', 0, '2011-08-14', 39, 28, 742, 0, '2016-02-04', 152, 158, 316, 0, 1, '2013-09-06', 18, 581, 0, '2017-02-13', 47, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(123, 123, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2012', 0, 'Spring 2010', 'Undergraduate', '3.43', '2.58', 'Corkery, Effertz and Wehner', '2013-02-23', 0, '2011-03-11', 45, 42, 355, 0, '2011-07-30', 154, 141, 334, 1, 1, '2012-01-08', 27, 536, 1, '2015-09-06', 23, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(124, 124, 'Fall', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2013', 1, 'Spring 2010', 'Undergraduate', '3.97', '2.68', 'Stamm-Simonis', '2009-11-11', 1, '2015-11-20', 38, 22, 437, 0, '2014-11-10', 130, 167, 278, 1, 0, '2016-07-12', 31, 595, 0, '2011-04-24', 23, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(125, 125, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Spring 2010', 1, 'Fall 2014', 'Other', '2.72', '3.54', 'Goodwin, Mills and Connelly', '2011-08-07', 0, '2015-03-01', 47, 18, 358, 0, '2013-10-17', 137, 152, 335, 0, 1, '2012-10-22', 119, 623, 0, '2015-05-09', 39, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(126, 126, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 0, 'Fall 2014', 0, 'Fall 2014', 'Graduate', '3.80', '3.79', 'Williamson, Bahringer and Schneider', '2011-07-09', 1, '2011-05-03', 44, 7, 417, 1, '2013-07-21', 142, 142, 327, 0, 0, '2011-09-13', 117, 567, 1, '2013-04-14', 59, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(127, 127, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', 1, 0, 'Fall 2013', 1, 'Spring 2015', 'Other', '3.38', '2.95', 'Bode, Nader and White', '2016-05-12', 0, '2011-03-26', 44, 22, 519, 1, '2012-09-25', 149, 146, 312, 0, 1, '2011-12-29', 11, 428, 1, '2012-01-14', 51, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(128, 128, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 0, 'Spring 2015', 0, 'Spring 2010', 'Other', '2.62', '2.98', 'Schaden, Ankunding and Bartoletti', '2010-09-15', 1, '2017-12-24', 28, 19, 394, 0, '2012-05-04', 169, 135, 319, 0, 0, '2017-02-01', 11, 560, 1, '2014-05-08', 46, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(129, 129, 'Summer', 2017, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Fall 2013', 0, 'Fall 2010', 'Other', '2.59', '2.67', 'Denesik Inc', '2007-10-09', 0, '2015-09-04', 32, 39, 237, 1, '2013-11-03', 149, 139, 276, 1, 1, '2013-08-31', 73, 482, 0, '2014-05-16', 49, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(130, 130, 'Summer', 2017, 'Full-Time MIS', 'Information Technology Management', 1, 1, 'Spring 2015', 0, 'Fall 2013', 'Undergraduate', '3.99', '3.16', 'Moore Group', '2009-08-28', 1, '2013-07-14', 29, 30, 779, 1, '2011-12-15', 150, 147, 318, 1, 0, '2016-08-01', 30, 568, 1, '2013-05-05', 42, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(131, 131, 'Summer', 2016, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Spring 2015', 1, 'Spring 2015', 'Undergraduate', '2.79', '2.82', 'Botsford LLC', '2008-01-21', 1, '2014-06-11', 13, 38, 580, 1, '2016-01-05', 148, 149, 303, 0, 0, '2012-12-04', 22, 395, 0, '2014-05-08', 53, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(132, 132, 'Fall', 2018, 'Professional MIS', 'Software Engineering Management', 0, 0, 'Fall 2013', 1, 'Spring 2015', 'Undergraduate', '3.63', '2.58', 'Purdy-Kiehn', '2009-02-12', 1, '2017-07-16', 18, 40, 445, 0, '2011-05-17', 156, 162, 336, 1, 1, '2016-05-26', 19, 323, 0, '2017-01-10', 28, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(133, 133, 'Summer', 2020, 'Full-Time MIS', 'Information Technology Management', 1, 0, 'Spring 2014', 1, 'Spring 2015', 'Other', '2.75', '3.81', 'Bergnaum, Cartwright and Flatley', '2012-05-31', 0, '2017-09-22', 50, 10, 436, 0, '2017-01-11', 169, 170, 337, 1, 0, '2011-11-27', 112, 630, 0, '2011-04-17', 60, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(134, 134, 'Spring', 2020, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 0, 0, 'Fall 2012', 1, 'Spring 2012', 'Graduate', '3.01', '2.73', 'Von, Gorczany and Bednar', '2010-06-08', 0, '2017-08-29', 39, 35, 456, 0, '2016-11-06', 156, 153, 337, 0, 1, '2014-09-21', 12, 350, 0, '2016-10-14', 43, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(135, 135, 'Summer', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Fall 2015', 1, 'Spring 2011', 'Graduate', '3.94', '3.00', 'Gislason, Fisher and Nikolaus', '2015-05-27', 1, '2014-12-19', 34, 39, 218, 0, '2012-02-17', 132, 154, 289, 1, 0, '2016-07-25', 21, 376, 1, '2017-11-20', 41, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(136, 136, 'Summer', 2018, 'Full-Time MIS', 'Information Technology Management', 0, 0, 'Spring 2015', 1, 'Fall 2013', 'Graduate', '2.60', '2.50', 'Koepp, Weber and Heidenreich', '2010-05-25', 1, '2014-03-26', 20, 29, 322, 1, '2017-04-01', 169, 145, 322, 0, 1, '2015-04-25', 48, 478, 0, '2011-04-02', 30, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(137, 137, 'Spring', 2019, 'Full-Time MIS', 'Information Technology Management', 0, 0, 'Fall 2014', 0, 'Fall 2013', 'Other', '3.64', '3.87', 'Padberg-Yundt', '2014-03-16', 1, '2014-07-02', 24, 37, 664, 0, '2011-06-14', 161, 130, 281, 0, 0, '2016-06-10', 101, 460, 1, '2011-08-25', 43, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(138, 138, 'Summer', 2020, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2014', 1, 'Fall 2011', 'Other', '2.87', '3.03', 'Upton-Schuster', '2010-06-18', 1, '2011-03-18', 39, 6, 396, 0, '2016-01-31', 145, 150, 309, 0, 0, '2014-09-27', 12, 341, 0, '2017-08-06', 26, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(139, 139, 'Fall', 2019, 'Full-Time MIS', 'Information Technology Management', 1, 1, 'Fall 2015', 1, 'Spring 2014', 'Other', '3.30', '3.33', 'Stehr and Sons', '2016-08-01', 1, '2015-05-07', 11, 38, 366, 1, '2014-05-06', 135, 147, 314, 0, 0, '2014-12-10', 38, 358, 0, '2012-11-01', 32, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(140, 140, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Fall 2010', 1, 'Fall 2015', 'Undergraduate', '3.10', '3.39', 'Marvin-Heidenreich', '2011-10-30', 1, '2012-08-19', 48, 39, 776, 0, '2017-03-30', 150, 130, 310, 1, 0, '2017-01-04', 49, 505, 1, '2013-10-25', 47, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(141, 141, 'Summer', 2017, 'Professional MIS', 'Enterprise Systems (ES) Management', 0, 1, 'Spring 2013', 1, 'Fall 2010', 'Graduate', '2.92', '3.89', 'Wisozk-Morissette', '2011-01-19', 0, '2014-11-06', 39, 35, 380, 0, '2017-09-11', 142, 159, 270, 0, 0, '2012-11-02', 76, 573, 1, '2011-04-25', 20, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(142, 142, 'Spring', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', 0, 1, 'Fall 2015', 0, 'Fall 2015', 'Other', '3.55', '3.29', 'Strosin Inc', '2013-02-22', 1, '2014-10-26', 22, 46, 313, 0, '2014-03-18', 153, 151, 266, 0, 1, '2013-08-18', 62, 396, 1, '2012-05-14', 45, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(143, 143, 'Spring', 2019, 'Professional MIS', 'Information Technology Management', 1, 0, 'Fall 2014', 0, 'Spring 2013', 'Undergraduate', '2.97', '3.04', 'Gaylord-Hayes', '2015-05-02', 1, '2011-03-08', 23, 36, 518, 0, '2014-08-28', 148, 142, 315, 0, 0, '2013-12-09', 64, 664, 1, '2015-04-25', 23, 'Undecided', NULL, NULL, '2017-03-17 04:20:02');
INSERT INTO `application` (`applicationID`, `studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`, `offerStatus`, `assistantshipStatus`, `applicantResponse`, `applicationDate`) VALUES
(144, 144, 'Fall', 2018, 'Full-Time MIS', 'Software Engineering Management', 1, 0, 'Spring 2014', 1, 'Fall 2010', 'Other', '3.70', '3.71', 'Schroeder-Jacobi', '2008-09-30', 0, '2013-01-10', 10, 36, 220, 0, '2012-07-25', 166, 131, 302, 0, 1, '2011-09-28', 88, 368, 1, '2014-04-19', 25, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(145, 145, 'Spring', 2017, 'Professional MIS', 'Software Engineering Management', 0, 1, 'Fall 2014', 0, 'Fall 2011', 'Undergraduate', '3.31', '2.82', 'Eichmann, Prosacco and Rolfson', '2008-06-18', 0, '2011-07-12', 47, 17, 375, 0, '2011-05-05', 138, 161, 261, 1, 1, '2014-03-13', 80, 447, 1, '2015-08-13', 44, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(146, 146, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2013', 1, 'Spring 2010', 'Graduate', '3.59', '3.37', 'Lemke Inc', '2009-12-14', 0, '2017-08-13', 36, 29, 575, 0, '2014-04-23', 154, 151, 284, 1, 1, '2016-04-30', 86, 339, 0, '2012-01-11', 21, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(147, 147, 'Spring', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2013', 1, 'Spring 2010', 'Undergraduate', '2.97', '2.93', 'Torphy and Sons', '2012-08-16', 1, '2011-10-05', 44, 33, 303, 0, '2012-12-28', 150, 151, 329, 1, 0, '2015-05-02', 90, 517, 0, '2016-09-26', 50, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(148, 148, 'Fall', 2017, 'Professional MIS', 'Enterprise Systems (ES) Management', 1, 1, 'Spring 2013', 0, 'Spring 2011', 'Undergraduate', '3.45', '3.25', 'Cummings and Sons', '2012-03-12', 1, '2017-10-17', 17, 42, 297, 0, '2012-10-01', 162, 149, 315, 0, 1, '2015-03-31', 63, 433, 1, '2012-01-02', 25, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(149, 149, 'Spring', 2018, 'Professional MIS', 'Software Engineering Management', 1, 0, 'Fall 2010', 1, 'Fall 2012', 'Other', '3.34', '2.89', 'Olson-Reichert', '2015-10-30', 1, '2014-04-22', 40, 17, 787, 0, '2016-04-14', 159, 130, 313, 0, 0, '2016-11-19', 105, 606, 0, '2014-06-09', 21, 'Undecided', NULL, NULL, '2017-03-17 04:20:02'),
(150, 150, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', 1, 0, 'Spring 2012', 1, 'Fall 2010', 'Graduate', '3.07', '3.62', 'Roob Group', '2015-01-18', 1, '2011-01-08', 15, 8, 443, 1, '2011-10-18', 164, 169, 321, 0, 0, '2014-11-07', 72, 545, 1, '2011-08-30', 59, 'Undecided', NULL, NULL, '2017-03-17 04:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `attachmentID` int(11) NOT NULL,
  `applicationID` int(11) NOT NULL,
  `documentType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `filename` char(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `classID` int(11) NOT NULL,
  `section` smallint(6) NOT NULL DEFAULT '1',
  `day` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `roomID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `instructionMode` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Open',
  `courseID` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classID`, `section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES
(1, 1, 'MWF', '07:30:00', '08:20:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373'),
(2, 2, 'MWF', '08:35:00', '09:25:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373'),
(3, 3, 'TR', '08:00:00', '09:15:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373'),
(4, 1, 'MWF', '09:40:00', '10:30:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V'),
(5, 2, 'MWF', '10:45:00', '11:35:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V'),
(6, 1, 'MWF', '11:50:00', '13:40:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203'),
(7, 2, 'TR', '09:30:00', '10:45:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203'),
(8, 1, 'MWF', '12:55:00', '13:45:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213'),
(9, 2, 'TR', '11:00:00', '12:15:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213'),
(10, 1, 'MW', '15:05:00', '16:20:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223'),
(11, 2, 'MW', '16:35:00', '17:50:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223'),
(12, 1, 'MWF', '14:00:00', '14:50:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423'),
(13, 2, 'MWF', '15:05:00', '15:55:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423'),
(14, 1, 'TR', '12:30:00', '13:45:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453'),
(15, 2, 'TR', '14:00:00', '15:15:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453'),
(16, 1, 'TR', '15:30:00', '16:45:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603'),
(17, 2, 'TR', '18:00:00', '19:15:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603'),
(18, 1, 'MWF', '17:15:00', '18:05:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833'),
(19, 2, 'MWF', '07:30:00', '08:20:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833'),
(20, 1, 'TR', '08:00:00', '09:15:00', 20, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5843'),
(21, 1, 'MWF', '07:30:00', '08:20:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373'),
(22, 2, 'MWF', '08:35:00', '09:25:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373'),
(23, 3, 'TR', '08:00:00', '09:15:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373'),
(24, 1, 'MWF', '09:40:00', '10:30:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V'),
(25, 2, 'MWF', '10:45:00', '11:35:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V'),
(26, 1, 'MWF', '11:50:00', '13:40:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203'),
(27, 2, 'TR', '09:30:00', '10:45:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203'),
(28, 1, 'MWF', '12:55:00', '13:45:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213'),
(29, 2, 'TR', '11:00:00', '12:15:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213'),
(30, 1, 'MW', '15:05:00', '16:20:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223'),
(31, 2, 'MW', '16:35:00', '17:50:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223'),
(32, 1, 'MWF', '14:00:00', '14:50:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423'),
(33, 2, 'MWF', '15:05:00', '15:55:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423'),
(34, 1, 'TR', '12:30:00', '13:45:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453'),
(35, 2, 'TR', '14:00:00', '15:15:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453'),
(36, 1, 'TR', '15:30:00', '16:45:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603'),
(37, 2, 'TR', '18:00:00', '19:15:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603'),
(38, 1, 'MWF', '17:15:00', '18:05:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833'),
(39, 2, 'MWF', '07:30:00', '08:20:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833'),
(40, 1, 'TR', '08:00:00', '09:15:00', 20, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5843'),
(41, 2, 'TR', '09:30:00', '10:45:00', 20, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5843');

-- --------------------------------------------------------

--
-- Table structure for table `class_faculty`
--

CREATE TABLE `class_faculty` (
  `classID` int(11) NOT NULL,
  `facultyID` int(11) NOT NULL,
  `term` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class_faculty`
--

INSERT INTO `class_faculty` (`classID`, `facultyID`, `term`, `year`) VALUES
(1, 3, 'Fall', 2017),
(2, 3, 'Fall', 2017),
(3, 3, 'Fall', 2017),
(4, 2, 'Fall', 2017),
(5, 2, 'Fall', 2017),
(6, 4, 'Fall', 2017),
(7, 4, 'Fall', 2017),
(8, 7, 'Fall', 2017),
(9, 7, 'Fall', 2017),
(10, 11, 'Fall', 2017),
(11, 11, 'Fall', 2017),
(12, 13, 'Fall', 2017),
(13, 13, 'Fall', 2017),
(14, 15, 'Fall', 2017),
(15, 15, 'Fall', 2017),
(16, 18, 'Fall', 2017),
(17, 18, 'Fall', 2017),
(18, 6, 'Fall', 2017),
(19, 6, 'Fall', 2017),
(20, 1, 'Fall', 2017),
(21, 1, 'Fall', 2017);

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `collegeID` int(11) NOT NULL,
  `applicationID` int(11) NOT NULL,
  `collegeName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dateStarted` date NOT NULL,
  `dateEnded` date NOT NULL,
  `gpa` decimal(3,2) NOT NULL,
  `hoursEarned` smallint(6) NOT NULL,
  `hoursEnrolled` smallint(6) NOT NULL,
  `degree` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `major` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`collegeID`, `applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES
(1, 1, 'Memphis College of Art', '2014-12-13', '2015-03-26', '2.82', 111, 2, 'Bachelor\'s Degree', 'Economics'),
(2, 2, 'Rasmussen College, North Dakota Campuses', '2012-08-10', '2016-05-06', '2.07', 135, 16, 'Bachelor\'s Degree', 'Accounting'),
(3, 3, 'The Southern Christian University', '2010-04-08', '2016-10-03', '2.90', 112, 6, 'Master\'s Degree', 'Accounting'),
(4, 4, 'Bergen University College', '2011-03-04', '2016-12-26', '2.66', 112, 0, 'Associate\'s Degree', 'Supply Chain Management'),
(5, 5, 'Aarhus School of Business', '2012-04-03', '2015-06-07', '3.58', 124, 8, 'Associate\'s Degree', 'Economics'),
(6, 6, 'Western University', '2011-04-11', '2015-02-20', '3.45', 116, 4, 'Master\'s Degree', 'Marketing'),
(7, 7, 'Donetsk National University', '2013-10-23', '2015-09-08', '2.47', 121, 2, 'Master\'s Degree', 'Information Systems'),
(8, 8, 'Baltimore Hebrew University', '2012-02-01', '2015-10-22', '3.59', 90, 6, 'Associate\'s Degree', 'Information Systems'),
(9, 9, 'Antioch University Seattle', '2012-09-16', '2015-11-24', '3.13', 101, 16, 'Master\'s Degree', 'Business Administration'),
(10, 10, 'Capital University', '2012-08-05', '2015-10-04', '3.75', 95, 16, 'Bachelor\'s Degree', 'Information Systems'),
(11, 11, 'Imam Khomeini International University', '2012-09-02', '2015-08-15', '3.81', 140, 7, 'Associate\'s Degree', 'Business Administration'),
(12, 12, 'Crichton College', '2013-03-20', '2016-07-14', '2.20', 117, 14, 'Associate\'s Degree', 'Supply Chain Management'),
(13, 13, 'University of Petroleum (East China)', '2014-01-28', '2016-07-19', '3.53', 121, 18, 'Master\'s Degree', 'Economics'),
(14, 14, 'St Clements University - Higher Education School', '2014-04-01', '2016-01-28', '2.41', 70, 17, 'Bachelor\'s Degree', 'Supply Chain Management'),
(15, 15, 'University of Pittsburgh at Greensburg', '2010-03-25', '2016-10-23', '3.74', 100, 1, 'Associate\'s Degree', 'Business Administration'),
(16, 16, 'Université Catholique de Bukavu', '2013-06-14', '2016-03-14', '2.65', 122, 8, 'Associate\'s Degree', 'Marketing'),
(17, 17, 'Kanazawa Gakuin University', '2014-10-04', '2015-10-31', '2.40', 95, 0, 'Bachelor\'s Degree', 'Information Systems'),
(18, 18, 'Chittagong University of Engineering and Technolog', '2013-12-23', '2016-11-04', '3.31', 63, 5, 'Master\'s Degree', 'Information Systems'),
(19, 19, 'Ecole Supérieure de Commerce et des Affaires', '2014-10-26', '2016-08-29', '3.00', 112, 3, 'Master\'s Degree', 'Business Administration'),
(20, 20, 'Mount St. Mary\'s College California', '2013-07-14', '2015-05-15', '3.04', 118, 8, 'Associate\'s Degree', 'Supply Chain Management'),
(21, 21, 'Sanford-Brown Institute', '2013-07-09', '2016-08-31', '3.19', 134, 3, 'Master\'s Degree', 'Marketing'),
(22, 22, 'Université Kofi Annan', '2012-10-02', '2016-11-13', '2.74', 78, 4, 'Bachelor\'s Degree', 'Supply Chain Management'),
(23, 23, 'Universidad Catolica de La Santísima Concepción', '2011-12-03', '2016-05-12', '3.33', 135, 14, 'Master\'s Degree', 'Finance'),
(24, 24, 'University of Texas at El Paso', '2011-04-19', '2015-02-15', '2.64', 66, 10, 'Bachelor\'s Degree', 'Business Administration'),
(25, 25, 'University of Ontario Institute of Technology', '2010-07-05', '2016-02-17', '2.35', 150, 11, 'Master\'s Degree', 'Information Systems'),
(26, 26, 'American Business & Technology University', '2014-01-29', '2016-04-21', '2.68', 60, 11, 'Bachelor\'s Degree', 'Information Systems'),
(27, 27, 'European Open University', '2012-09-26', '2015-05-15', '3.47', 142, 3, 'Associate\'s Degree', 'Economics'),
(28, 28, 'Reformed Theological Academy of Debrecen', '2011-03-11', '2016-11-09', '3.46', 67, 8, 'Master\'s Degree', 'Economics'),
(29, 29, 'La Salle University', '2014-03-02', '2016-08-14', '3.17', 78, 17, 'Master\'s Degree', 'Information Systems'),
(30, 30, 'Urbana University', '2012-02-21', '2016-10-07', '3.87', 98, 0, 'Associate\'s Degree', 'Business Administration'),
(31, 31, 'Cornell University', '2012-05-16', '2016-03-22', '2.70', 74, 11, 'Master\'s Degree', 'Finance'),
(32, 32, 'Southern Illinois University at Carbondale', '2011-01-18', '2015-11-13', '2.05', 115, 6, 'Associate\'s Degree', 'Supply Chain Management'),
(33, 33, 'Yerevan Haibusak University', '2014-04-19', '2015-06-21', '2.70', 144, 8, 'Bachelor\'s Degree', 'Information Systems'),
(34, 34, 'Umaru Musa Yar\'Adua University ', '2013-02-06', '2016-05-18', '3.99', 92, 6, 'Master\'s Degree', 'Business Administration'),
(35, 35, 'Semera University', '2011-04-26', '2016-05-12', '2.59', 87, 17, 'Associate\'s Degree', 'Marketing'),
(36, 36, 'New Jersey City University', '2013-12-09', '2015-11-22', '2.61', 135, 12, 'Associate\'s Degree', 'Accounting'),
(37, 37, 'Asa University Bangladesh', '2014-04-13', '2016-01-05', '2.36', 76, 9, 'Associate\'s Degree', 'Accounting'),
(38, 38, 'Franklin W. Olin College of Engineering', '2012-04-01', '2016-08-25', '3.72', 76, 7, 'Master\'s Degree', 'Supply Chain Management'),
(39, 39, 'Kilis 7 Aralık University', '2011-02-03', '2015-08-17', '2.44', 115, 1, 'Bachelor\'s Degree', 'Economics'),
(40, 40, 'Fine Arts Academy \"Jan Matejko\" in Cracow', '2014-12-22', '2015-02-03', '2.13', 99, 17, 'Associate\'s Degree', 'Supply Chain Management'),
(41, 41, 'Denver Technical College', '2014-01-19', '2015-10-12', '2.49', 69, 12, 'Associate\'s Degree', 'Economics'),
(42, 42, 'Medical College of Ohio', '2013-01-02', '2016-05-30', '3.55', 124, 4, 'Master\'s Degree', 'Information Systems'),
(43, 43, 'Azerbaijan National Conservatorie', '2014-09-25', '2015-04-26', '2.03', 100, 17, 'Bachelor\'s Degree', 'Marketing'),
(44, 44, 'University of Northern Virginia, Prague Campus', '2014-09-16', '2015-07-08', '2.90', 146, 7, 'Bachelor\'s Degree', 'Supply Chain Management'),
(45, 45, 'Universidad Interamericana de Educacion a Distanci', '2011-05-15', '2015-06-17', '2.76', 74, 3, 'Master\'s Degree', 'Marketing'),
(46, 46, 'Fachhochschule Burgenland', '2012-10-18', '2016-10-31', '2.42', 128, 18, 'Bachelor\'s Degree', 'Marketing'),
(47, 47, 'St. Andrews Presbyterian College', '2011-08-23', '2016-02-03', '2.44', 61, 18, 'Master\'s Degree', 'Supply Chain Management'),
(48, 48, 'St.Kliment Ohridski University', '2011-06-27', '2016-01-14', '2.69', 128, 10, 'Bachelor\'s Degree', 'Supply Chain Management'),
(49, 49, 'Pabna University of Science and Technology', '2010-12-30', '2016-09-23', '3.06', 129, 5, 'Master\'s Degree', 'Finance'),
(50, 50, 'Hochschule für Technik und Wirtschaft des Saarland', '2010-03-14', '2016-08-04', '2.12', 80, 4, 'Bachelor\'s Degree', 'Supply Chain Management'),
(51, 51, 'Universidade Cidade de São Paulo', '2011-01-05', '2015-05-16', '3.56', 93, 7, 'Bachelor\'s Degree', 'Accounting'),
(52, 52, 'Texas A&M University - Commerce', '2014-10-24', '2015-03-21', '2.82', 134, 13, 'Master\'s Degree', 'Information Systems'),
(53, 53, 'University \"Titu Maiorescu\"', '2014-07-28', '2015-05-03', '2.96', 108, 4, 'Associate\'s Degree', 'Information Systems'),
(54, 54, 'National American University, Roseville', '2010-12-17', '2015-05-24', '2.53', 85, 9, 'Associate\'s Degree', 'Business Administration'),
(55, 55, 'Kongju National University', '2010-05-17', '2016-02-23', '2.05', 138, 11, 'Bachelor\'s Degree', 'Marketing'),
(56, 56, 'Canterbury Christ Church University', '2011-07-05', '2015-07-10', '3.56', 87, 11, 'Master\'s Degree', 'Supply Chain Management'),
(57, 57, 'University of Maryland University College', '2014-05-13', '2016-07-16', '2.23', 116, 3, 'Bachelor\'s Degree', 'Economics'),
(58, 58, 'Kebbi State University of Science and Technology', '2014-07-25', '2016-01-28', '2.38', 123, 9, 'Associate\'s Degree', 'Information Systems'),
(59, 59, 'Odessa National Maritime Academy', '2010-07-02', '2015-11-30', '2.13', 134, 16, 'Master\'s Degree', 'Marketing'),
(60, 60, 'Iwate Prefectural University', '2012-11-08', '2015-07-16', '3.11', 99, 1, 'Bachelor\'s Degree', 'Accounting'),
(61, 61, 'Technological University (Mawlamyaing)', '2013-01-19', '2015-05-25', '2.02', 85, 18, 'Master\'s Degree', 'Information Systems'),
(62, 62, 'Islamic Azad University, Parand', '2010-03-20', '2016-11-23', '2.42', 144, 3, 'Master\'s Degree', 'Marketing'),
(63, 63, 'Ecole Supérieure de Commerce de Bordeaux', '2012-02-16', '2015-11-29', '3.41', 86, 4, 'Master\'s Degree', 'Business Administration'),
(64, 64, 'Southern Connecticut State University', '2010-09-18', '2015-04-30', '3.96', 81, 17, 'Associate\'s Degree', 'Business Administration'),
(65, 65, 'Sultan Qaboos University', '2014-10-30', '2015-08-03', '2.79', 99, 11, 'Bachelor\'s Degree', 'Accounting'),
(66, 66, 'Central University College', '2014-12-16', '2016-09-29', '2.22', 141, 0, 'Associate\'s Degree', 'Finance'),
(67, 67, 'Washington State University', '2010-06-18', '2015-04-28', '2.44', 68, 5, 'Associate\'s Degree', 'Economics'),
(68, 68, 'Pädagogische Hochschule Karlsruhe', '2014-04-13', '2016-06-10', '3.02', 88, 14, 'Master\'s Degree', 'Supply Chain Management'),
(69, 69, 'University of Rajasthan', '2010-08-28', '2016-01-04', '3.91', 149, 12, 'Associate\'s Degree', 'Finance'),
(70, 70, 'Kyungpook National University', '2012-08-31', '2016-09-22', '2.13', 60, 15, 'Associate\'s Degree', 'Information Systems'),
(71, 71, 'Barton College', '2011-11-10', '2015-10-08', '2.32', 134, 1, 'Master\'s Degree', 'Business Administration'),
(72, 72, 'University of Regina', '2014-10-28', '2016-05-16', '2.26', 146, 8, 'Associate\'s Degree', 'Marketing'),
(73, 73, 'Centro Universitario Villanueva', '2013-04-24', '2016-11-11', '2.24', 108, 3, 'Associate\'s Degree', 'Accounting'),
(74, 74, 'Capitol University', '2011-03-15', '2016-07-07', '3.29', 89, 2, 'Bachelor\'s Degree', 'Business Administration'),
(75, 75, 'Nagpur University', '2014-11-10', '2016-04-05', '2.90', 69, 4, 'Bachelor\'s Degree', 'Accounting'),
(76, 76, 'University of Calabar', '2013-03-16', '2015-01-07', '3.32', 84, 5, 'Master\'s Degree', 'Information Systems'),
(77, 77, 'Samara State Technical University', '2014-07-29', '2016-09-02', '2.69', 149, 3, 'Associate\'s Degree', 'Finance'),
(78, 78, 'DCT International Hotel & Business Management Scho', '2012-05-11', '2015-12-14', '2.19', 85, 8, 'Master\'s Degree', 'Marketing'),
(79, 79, 'La Sierra University', '2011-07-06', '2015-08-29', '3.50', 100, 15, 'Bachelor\'s Degree', 'Information Systems'),
(80, 80, 'Pusan National University', '2013-10-11', '2016-12-29', '2.77', 62, 0, 'Bachelor\'s Degree', 'Business Administration'),
(81, 81, 'Hesser College', '2011-07-23', '2015-02-27', '2.83', 112, 7, 'Master\'s Degree', 'Business Administration'),
(82, 82, 'State University of New York at Stony Brook', '2014-03-31', '2016-07-05', '3.59', 95, 5, 'Associate\'s Degree', 'Finance'),
(83, 83, 'Japan College of Social Work', '2010-10-08', '2016-05-31', '3.82', 144, 11, 'Master\'s Degree', 'Economics'),
(84, 84, 'Australian Correspondence Schools', '2011-07-22', '2015-05-14', '3.91', 108, 17, 'Associate\'s Degree', 'Information Systems'),
(85, 85, 'Cedarville College', '2012-03-01', '2016-09-29', '2.70', 106, 18, 'Bachelor\'s Degree', 'Supply Chain Management'),
(86, 86, 'Ural State Forestry Technical Academy', '2014-11-01', '2016-02-14', '3.16', 118, 12, 'Associate\'s Degree', 'Accounting'),
(87, 87, 'Minamikyushu University', '2010-06-11', '2016-02-14', '3.65', 141, 11, 'Bachelor\'s Degree', 'Economics'),
(88, 88, 'Université Robert Schuman (Strasbourg III)', '2010-08-15', '2015-03-30', '3.99', 115, 14, 'Master\'s Degree', 'Supply Chain Management'),
(89, 89, 'National Technical University (Kiev Politechnical ', '2013-10-08', '2015-06-29', '3.56', 125, 10, 'Bachelor\'s Degree', 'Supply Chain Management'),
(90, 90, 'Universidad El Bosque', '2014-05-11', '2016-05-31', '3.92', 144, 10, 'Associate\'s Degree', 'Marketing'),
(91, 91, 'Chuo Gakuin University', '2012-01-06', '2015-01-06', '3.03', 121, 5, 'Bachelor\'s Degree', 'Information Systems'),
(92, 92, 'Katharine Gibbs School', '2010-11-09', '2015-08-15', '2.43', 106, 1, 'Master\'s Degree', 'Information Systems'),
(93, 93, 'Police Academy of Latvia', '2013-03-14', '2015-04-29', '3.60', 144, 7, 'Bachelor\'s Degree', 'Accounting'),
(94, 94, 'London Metropolitan University', '2014-01-12', '2015-08-13', '2.02', 132, 0, 'Bachelor\'s Degree', 'Finance'),
(95, 95, 'Westsächsische Hochschule Zwickau (FH)', '2011-08-06', '2016-03-19', '2.06', 71, 11, 'Bachelor\'s Degree', 'Finance'),
(96, 96, 'Rivers State University of Science and Technology', '2012-10-09', '2015-05-18', '3.68', 77, 16, 'Bachelor\'s Degree', 'Business Administration'),
(97, 97, 'Maryam Institute of Higher Education', '2014-09-29', '2015-01-06', '3.40', 99, 18, 'Master\'s Degree', 'Economics'),
(98, 98, 'Higher School o Business in Tarnow', '2011-07-31', '2016-04-16', '2.76', 124, 12, 'Associate\'s Degree', 'Marketing'),
(99, 99, 'Université Mohammed V - Agdal', '2011-01-24', '2015-12-11', '3.55', 123, 7, 'Bachelor\'s Degree', 'Accounting'),
(100, 100, 'Reformed Bible College', '2011-08-22', '2016-04-14', '3.07', 128, 16, 'Associate\'s Degree', 'Business Administration'),
(101, 101, 'École des Hautes Études Commerciales', '2010-10-02', '2016-01-16', '2.39', 123, 3, 'Master\'s Degree', 'Supply Chain Management'),
(102, 102, 'Shikoku University', '2010-10-31', '2016-05-12', '2.30', 149, 4, 'Master\'s Degree', 'Accounting'),
(103, 103, 'University of Elbasan \"Aleksander Xhuvani\"', '2010-12-12', '2016-08-03', '3.40', 103, 2, 'Bachelor\'s Degree', 'Supply Chain Management'),
(104, 104, 'University of California, Merced', '2010-07-17', '2015-05-19', '3.49', 97, 6, 'Master\'s Degree', 'Finance'),
(105, 105, 'Shibaura Institute of Technology', '2014-12-05', '2016-09-27', '2.66', 133, 12, 'Bachelor\'s Degree', 'Supply Chain Management'),
(106, 106, 'Annamalai University', '2012-07-02', '2015-02-28', '2.32', 71, 7, 'Associate\'s Degree', 'Business Administration'),
(107, 107, 'Doshisha University', '2013-02-27', '2015-04-08', '2.41', 110, 7, 'Master\'s Degree', 'Information Systems'),
(108, 108, 'University Institute of Architecture Venice', '2013-01-06', '2016-09-04', '3.08', 122, 13, 'Master\'s Degree', 'Business Administration'),
(109, 109, 'Universitas Gunadarma', '2010-05-13', '2016-08-13', '3.71', 134, 11, 'Bachelor\'s Degree', 'Marketing'),
(110, 110, 'South Dakota School of Mines and Technology', '2013-08-19', '2016-06-25', '3.97', 150, 2, 'Bachelor\'s Degree', 'Business Administration'),
(111, 111, 'Universidad Adventista de Chile', '2013-08-21', '2015-02-15', '2.85', 134, 1, 'Associate\'s Degree', 'Accounting'),
(112, 112, 'Universitas Dian Nuswantoro', '2010-09-17', '2015-09-20', '2.59', 67, 12, 'Master\'s Degree', 'Information Systems'),
(113, 113, 'Technological University (Hmawbi)', '2013-02-27', '2016-10-13', '2.58', 83, 13, 'Master\'s Degree', 'Information Systems'),
(114, 114, 'International Business University of Beijing', '2012-07-21', '2015-03-06', '2.78', 65, 18, 'Bachelor\'s Degree', 'Economics'),
(115, 115, 'Atlanta Christian College', '2010-08-26', '2016-04-27', '2.69', 68, 13, 'Bachelor\'s Degree', 'Marketing'),
(116, 116, 'Upper Nile University', '2012-03-08', '2015-01-22', '3.40', 103, 7, 'Associate\'s Degree', 'Finance'),
(117, 117, 'College of Technology at Dammam', '2014-06-07', '2015-09-06', '3.24', 147, 3, 'Associate\'s Degree', 'Finance'),
(118, 118, 'California State University, Monterey Bay', '2011-01-16', '2016-05-22', '2.66', 136, 13, 'Bachelor\'s Degree', 'Information Systems'),
(119, 119, 'Kumamoto University', '2012-12-20', '2016-05-08', '3.68', 73, 11, 'Bachelor\'s Degree', 'Marketing'),
(120, 120, 'University of Pardubice', '2013-08-08', '2015-09-12', '3.18', 146, 11, 'Master\'s Degree', 'Marketing'),
(121, 121, 'University of Medicine and Dentistry of New Jersey', '2012-02-04', '2016-11-21', '3.52', 65, 7, 'Master\'s Degree', 'Marketing'),
(122, 122, 'Universität für Musik und darstellende Kunst Graz', '2010-10-11', '2015-06-26', '3.08', 70, 15, 'Master\'s Degree', 'Business Administration'),
(123, 123, 'Universidad de Lambayeque', '2014-08-27', '2015-10-28', '2.18', 147, 1, 'Bachelor\'s Degree', 'Information Systems'),
(124, 124, 'Semyung University', '2013-11-08', '2015-01-19', '2.46', 119, 16, 'Bachelor\'s Degree', 'Accounting'),
(125, 125, 'Yunnan University', '2014-12-05', '2015-02-27', '3.20', 136, 12, 'Associate\'s Degree', 'Accounting'),
(126, 126, 'Bamiyan University', '2013-06-26', '2015-03-01', '3.57', 97, 13, 'Master\'s Degree', 'Supply Chain Management'),
(127, 127, 'Universiti Pendidikan Sultan Idris', '2013-01-03', '2016-09-23', '2.46', 93, 14, 'Master\'s Degree', 'Finance'),
(128, 128, 'Thomas More College of Liberal Arts', '2011-09-17', '2015-07-04', '3.61', 85, 18, 'Associate\'s Degree', 'Economics'),
(129, 129, 'California State University, Bakersfield', '2013-11-16', '2015-03-17', '3.37', 137, 14, 'Associate\'s Degree', 'Marketing'),
(130, 130, 'State University of New York College of Technology', '2010-10-26', '2015-04-28', '2.83', 125, 7, 'Associate\'s Degree', 'Information Systems'),
(131, 131, 'Namik Kemal University', '2010-04-02', '2015-12-08', '3.36', 112, 16, 'Associate\'s Degree', 'Information Systems'),
(132, 132, 'Hochschule Bremen', '2014-03-12', '2016-10-18', '2.98', 106, 8, 'Bachelor\'s Degree', 'Supply Chain Management'),
(133, 133, 'Pangasinan State University', '2011-07-18', '2016-01-12', '2.47', 128, 15, 'Associate\'s Degree', 'Finance'),
(134, 134, 'Miami University of Ohio - Hamilton', '2010-03-02', '2016-12-04', '3.52', 69, 6, 'Associate\'s Degree', 'Business Administration'),
(135, 135, 'Komar University of Science and Technology', '2012-11-17', '2015-11-05', '3.46', 117, 14, 'Associate\'s Degree', 'Business Administration'),
(136, 136, 'Austin Community College', '2013-10-31', '2015-04-03', '2.28', 134, 2, 'Master\'s Degree', 'Business Administration'),
(137, 137, 'Universidad del Turismo', '2013-03-04', '2016-03-01', '2.75', 102, 4, 'Associate\'s Degree', 'Business Administration'),
(138, 138, 'Baker College of Owosso', '2011-08-26', '2016-04-29', '2.29', 63, 13, 'Master\'s Degree', 'Economics'),
(139, 139, 'Universidad Nacional de Formosa', '2011-04-07', '2015-12-13', '3.30', 134, 16, 'Master\'s Degree', 'Marketing'),
(140, 140, 'Mazandaran University of Medical Science', '2014-12-03', '2016-04-08', '2.78', 69, 14, 'Master\'s Degree', 'Accounting'),
(141, 141, 'Universität Ulm', '2011-09-29', '2015-09-23', '2.16', 96, 5, 'Associate\'s Degree', 'Business Administration'),
(142, 142, 'Toyota Technological Institute', '2013-01-20', '2015-04-27', '2.80', 101, 9, 'Associate\'s Degree', 'Marketing'),
(143, 143, 'Maritime University in Szczecin', '2013-01-03', '2016-03-08', '3.63', 91, 4, 'Associate\'s Degree', 'Business Administration'),
(144, 144, 'Ho Chi Minh City University of Medicine and Pharma', '2011-09-25', '2015-05-30', '2.11', 136, 11, 'Associate\'s Degree', 'Economics'),
(145, 145, 'Beni Suef University', '2012-11-07', '2015-10-31', '3.13', 138, 7, 'Associate\'s Degree', 'Business Administration'),
(146, 146, 'Universidad Católica de Córdoba', '2011-07-27', '2015-03-11', '3.26', 147, 0, 'Bachelor\'s Degree', 'Economics'),
(147, 147, 'Universitas Bunda Mulia Jakarta', '2010-08-03', '2015-07-01', '3.58', 112, 16, 'Associate\'s Degree', 'Information Systems'),
(148, 148, 'Jawaharlal Nehru Centre for Advanced  Scientific R', '2014-08-24', '2015-09-11', '3.97', 124, 8, 'Bachelor\'s Degree', 'Economics'),
(149, 149, 'Ivanovo State Academy of Medicine', '2012-03-21', '2016-07-10', '2.01', 88, 13, 'Master\'s Degree', 'Business Administration'),
(150, 150, 'Universidad de Navarra', '2014-08-30', '2015-08-21', '3.47', 102, 13, 'Bachelor\'s Degree', 'Information Systems');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryID`, `country`) VALUES
('AD', 'Andorra'),
('AE', 'United Arab Emirates'),
('AF', 'Afghanistan'),
('AG', 'Antigua and Barbuda'),
('AI', 'Anguilla'),
('AL', 'Albania'),
('AM', 'Armenia'),
('AN', 'Netherlands Antilles'),
('AO', 'Angola'),
('AQ', 'Antarctica'),
('AR', 'Argentina'),
('AS', 'American Samoa'),
('AT', 'Austria'),
('AU', 'Australia'),
('AW', 'Aruba'),
('AZ', 'Azerbaijan'),
('BA', 'Bosnia and Herzegovina'),
('BB', 'Barbados'),
('BD', 'Bangladesh'),
('BE', 'Belgium'),
('BF', 'Burkina Faso'),
('BG', 'Bulgaria'),
('BH', 'Bahrain'),
('BI', 'Burundi'),
('BJ', 'Benin'),
('BM', 'Bermuda'),
('BN', 'Brunei Darussalam'),
('BO', 'Bolivia'),
('BR', 'Brazil'),
('BS', 'Bahamas'),
('BT', 'Bhutan'),
('BV', 'Bouvet Island'),
('BW', 'Botswana'),
('BY', 'Belarus'),
('BZ', 'Belize'),
('CA', 'Canada'),
('CC', 'Cocos (Keeling) Islands'),
('CF', 'Central African Republic'),
('CG', 'Congo'),
('CH', 'Switzerland'),
('CI', 'Ivory Coast'),
('CK', 'Cook Islands'),
('CL', 'Chile'),
('CM', 'Cameroon'),
('CN', 'China'),
('CO', 'Colombia'),
('CR', 'Costa Rica'),
('CU', 'Cuba'),
('CV', 'Cape Verde'),
('CX', 'Christmas Island'),
('CY', 'Cyprus'),
('CZ', 'Czech Republic'),
('DE', 'Germany'),
('DJ', 'Djibouti'),
('DK', 'Denmark'),
('DM', 'Dominica'),
('DO', 'Dominican Republic'),
('DZ', 'Algeria'),
('EC', 'Ecuador'),
('EE', 'Estonia'),
('EG', 'Egypt'),
('EH', 'Western Sahara'),
('ER', 'Eritrea'),
('ES', 'Spain'),
('ET', 'Ethiopia'),
('FI', 'Finland'),
('FJ', 'Fiji'),
('FK', 'Falkland Islands (Malvinas)'),
('FM', 'Federated States of Micronesia'),
('FO', 'Faroe Islands'),
('FR', 'France'),
('FX', 'France, Metropolitan'),
('GA', 'Gabon'),
('GB', 'United Kingdom'),
('GD', 'Grenada'),
('GE', 'Georgia'),
('GF', 'French Guiana'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GK', 'Guernsey'),
('GL', 'Greenland'),
('GM', 'Gambia'),
('GN', 'Guinea'),
('GP', 'Guadeloupe'),
('GQ', 'Equatorial Guinea'),
('GR', 'Greece'),
('GS', 'South Georgia South Sandwich Islands'),
('GT', 'Guatemala'),
('GU', 'Guam'),
('GW', 'Guinea-Bissau'),
('GY', 'Guyana'),
('HK', 'Hong Kong'),
('HM', 'Heard and McDonald Islands'),
('HN', 'Honduras'),
('HR', 'Croatia (Hrvatska)'),
('HT', 'Haiti'),
('HU', 'Hungary'),
('ID', 'Indonesia'),
('IE', 'Ireland'),
('IL', 'Israel'),
('IM', 'Isle of Man'),
('IN', 'India'),
('IO', 'British Indian Ocean Territory'),
('IQ', 'Iraq'),
('IR', 'Iran'),
('IS', 'Iceland'),
('IT', 'Italy'),
('JE', 'Jersey'),
('JM', 'Jamaica'),
('JO', 'Jordan'),
('JP', 'Japan'),
('KE', 'Kenya'),
('KG', 'Kyrgyzstan'),
('KH', 'Cambodia'),
('KI', 'Kiribati'),
('KM', 'Comoros'),
('KN', 'Saint Kitts and Nevis'),
('KP', 'North Korea'),
('KR', 'South Korea'),
('KW', 'Kuwait'),
('KY', 'Cayman Islands'),
('KZ', 'Kazakhstan'),
('LA', 'Laos'),
('LB', 'Lebanon'),
('LC', 'Saint Lucia'),
('LI', 'Liechtenstein'),
('LK', 'Sri Lanka'),
('LR', 'Liberia'),
('LS', 'Lesotho'),
('LT', 'Lithuania'),
('LU', 'Luxembourg'),
('LV', 'Latvia'),
('LY', 'Libyan Arab Jamahiriya'),
('MA', 'Morocco'),
('MC', 'Monaco'),
('MD', 'Republic of Moldova'),
('ME', 'Montenegro'),
('MG', 'Madagascar'),
('MH', 'Marshall Islands'),
('MK', 'Macedonia'),
('ML', 'Mali'),
('MM', 'Myanmar'),
('MN', 'Mongolia'),
('MO', 'Macau'),
('MP', 'Northern Mariana Islands'),
('MQ', 'Martinique'),
('MR', 'Mauritania'),
('MS', 'Montserrat'),
('MT', 'Malta'),
('MU', 'Mauritius'),
('MV', 'Maldives'),
('MW', 'Malawi'),
('MX', 'Mexico'),
('MY', 'Malaysia'),
('MZ', 'Mozambique'),
('NA', 'Namibia'),
('NC', 'New Caledonia'),
('NE', 'Niger'),
('NF', 'Norfolk Island'),
('NG', 'Nigeria'),
('NI', 'Nicaragua'),
('NL', 'Netherlands'),
('NO', 'Norway'),
('NP', 'Nepal'),
('NR', 'Nauru'),
('NU', 'Niue'),
('NZ', 'New Zealand'),
('OM', 'Oman'),
('PA', 'Panama'),
('PE', 'Peru'),
('PF', 'French Polynesia'),
('PG', 'Papua New Guinea'),
('PH', 'Philippines'),
('PK', 'Pakistan'),
('PL', 'Poland'),
('PM', 'St. Pierre and Miquelon'),
('PN', 'Pitcairn'),
('PR', 'Puerto Rico'),
('PS', 'Palestine'),
('PT', 'Portugal'),
('PW', 'Palau'),
('PY', 'Paraguay'),
('QA', 'Qatar'),
('RE', 'Reunion'),
('RO', 'Romania'),
('RS', 'Serbia'),
('RU', 'Russia'),
('RW', 'Rwanda'),
('SA', 'Saudi Arabia'),
('SB', 'Solomon Islands'),
('SC', 'Seychelles'),
('SD', 'Sudan'),
('SE', 'Sweden'),
('SG', 'Singapore'),
('SH', 'St. Helena'),
('SI', 'Slovenia'),
('SJ', 'Svalbard and Jan Mayen Islands'),
('SK', 'Slovakia'),
('SL', 'Sierra Leone'),
('SM', 'San Marino'),
('SN', 'Senegal'),
('SO', 'Somalia'),
('SR', 'Suriname'),
('ST', 'Sao Tome and Principe'),
('SV', 'El Salvador'),
('SY', 'Syrian Arab Republic'),
('SZ', 'Swaziland'),
('TC', 'Turks and Caicos Islands'),
('TD', 'Chad'),
('TF', 'French Southern Territories'),
('TG', 'Togo'),
('TH', 'Thailand'),
('TJ', 'Tajikistan'),
('TK', 'Tokelau'),
('TM', 'Turkmenistan'),
('TN', 'Tunisia'),
('TO', 'Tonga'),
('TP', 'East Timor'),
('TR', 'Turkey'),
('TT', 'Trinidad and Tobago'),
('TV', 'Tuvalu'),
('TW', 'Taiwan'),
('TY', 'Mayotte'),
('TZ', 'Tanzania'),
('UA', 'Ukraine'),
('UG', 'Uganda'),
('UM', 'United States Minor Outlying Islands'),
('US', 'United States'),
('UY', 'Uruguay'),
('UZ', 'Uzbekistan'),
('VA', 'Vatican City'),
('VC', 'Saint Vincent and the Grenadines'),
('VE', 'Venezuela'),
('VG', 'Virgin Islands (British)'),
('VI', 'Virgin Islands (U.S.)'),
('VN', 'Vietnam'),
('VU', 'Vanuatu'),
('WF', 'Wallis and Futuna Islands'),
('WS', 'Samoa'),
('XK', 'Kosovo'),
('YE', 'Yemen'),
('ZA', 'South Africa'),
('ZM', 'Zambia'),
('ZR', 'Zaire'),
('ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `hours` smallint(6) NOT NULL,
  `offered` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `name`, `description`, `hours`, `offered`) VALUES
('ISYS 4243', 'Current Topics in Computer Information', 'Intensive investigation of selected developments in computer information systems hardware, software, and organization having current impact on computer information systems design and application. Offering an extension of lower-level CIS courses through individual student research and faculty team-teaching of advanced topics. Topical selection made with each course offering. Prerequisite: Junior standing. May be repeated for up to 6 hours of degree credit.', 3, 'Irregular'),
('ISYS 4373', 'Application Development with Java', 'This course covers object-oriented programming concepts and illustrates them via an appropriate object-oriented programming language. Students will be exposed to the design of software objects, creation of software objects, and the use of objects in constructing an information system. Prerequisite: ISYS 3293 with a grade of C or better.', 3, 'Fall'),
('ISYS 450V', 'Independent Study', 'Permits students on individual basis to explore selected topics in data processing and/or Quantitative Analysis.', 3, 'Fall, Spring'),
('ISYS 511V', 'IT Toolkit & Skills Seminar', 'Seminar in Information Systems solutions and concepts (such as applications development, VB.NET, analysis of problems and design of solutions via application systems, etc.) designed for students entering the MIS program--may not be used for MIS degree credit. Prerequisite: MIS Director approval. May be repeated for up to 3 hours of degree credit.', 3, 'Irregular'),
('ISYS 5133', 'E Business Development', 'This course explores various e-business development technologies and then utilizes the technologies for developing a relatively realistic business-to-consumer (B2C) e-business site. Students will also learn about Business to Business (B2B) strategies, market exchanges, XML and XML Web services applications. Simple XML Web services will also be created.', 3, 'Spring'),
('ISYS 5203', 'Experimental Design', 'ANOVA, experimental design, introduction to basis of statistics. Prerequisite: Graduate standing and WCOB 1033 or equivalent.', 3, 'Fall'),
('ISYS 5213', 'ERP Fundamentals', 'An introduction to enterprise resource planning systems. Students should gain an understanding of the scope of these integrated systems that reach across organizational boundaries and can change how a company does business. Implementation issues are covered, including the importance of change management. Prerequisite: Graduate standing.', 3, 'Fall, Summer'),
('ISYS 5223', 'ERP Configuration and Implementation', 'The process of configuring and implementing an enterprise resource planning system. Business process analysis and integration. Students will develop a company and set up several modules in SAP for use. Develop understanding of how the business processes work and integrate. Prerequisite: ISYS 5213 or equivalent.', 3, 'Fall'),
('ISYS 5233', 'Seminar in ERP Development', 'ERP administration and system development practices. Advanced system support issues related to Enterprise Resource Planning systems that are used in global organizations. Basic ABAP programming. In addition, students will learn how to provide basic systems administration support of the operating system, database, and application systems software levels of ERP systems. Pre- or Corequisite: WCOB 5223. Prerequisite: WCOB 5213. May be repeated for up to 6 hours of degree credit.', 3, 'Irregular'),
('ISYS 535V', 'Internship Experience', 'This course allows a student to experience an internship within a business and benefit from the work experience. The internship focuses on applications and business problems and is supervised by a faculty member as well as a member of the company/firm. Prerequisite: MIS Director approval is required. May be repeated for up to 6 hours of degree credit.', 6, 'Fall, Spring, Summer'),
('ISYS 5363', 'Business Analytics', 'This course in managerial business analytics provides future managers with the key concepts of decision modeling and information technology management concepts. Students will learn to utilize real time operational business data, as well as quickly process and effectively leverage information. In addition, students will exercise strategic IT deployment skills for supply chain and marketing processes as well as develop strong decision modeling abilities.', 3, 'Spring'),
('ISYS 5403', 'Quantitative Methods and Decision Making', 'Utilization of information, quantitative techniques, and computer application in decision making and problem solving for managers. This course is cross-listed with SCMT 5133.', 3, 'Irregular'),
('ISYS 5423', 'Seminar in Systems Development', 'Advanced study of structured systems development. Emphasis on strategies and techniques of structured analysis and structured design for producing logical systems specifications and for deriving physical systems designs. Coverage of methodologies for dealing with complexity in the development of information systems. Prerequisite: ISYS 3293 (or equivalent).', 3, 'Fall'),
('ISYS 5433', 'Enterprise Systems', 'Enterprise Systems comprises the entire class of information technology and systems that support the mission of the company including decision support and business processes. This managerial enterprise systems course focuses on strategic issues of information technology. Students study the various elements and integration of an organization\'s business processes; as a result, students gain an understanding and working knowledge of systems used to support these business processes and their use in decision making. In addition, students will study concepts and develop skills needed to utilize decision-centric business intelligence and knowledge management applications.', 3, 'Spring'),
('ISYS 5453', 'Introduction to Enterprise Servers', 'The focus of this course is to expose students to working with large scale mainframe computer systems. Mainframe computers are the heart of large company\'s transaction processing systems. This course provides the opportunity for students to gain valuable insight into computing in a mainframe operating environment.', 3, 'Fall'),
('ISYS 5463', 'Enterprise Transaction Systems', 'Being able to accurately capture and store business transactions is an important processing function in many businesses. For many large companies with high volume processing, the tools of choice for transaction processing are CICS/Cobol/DB2. This course provides students with the necessary understanding and skills to work in this type environment. Pre- or Corequisite:ISYS 5453 (or equivalent) or MIS Director approval.', 3, 'Spring'),
('ISYS 5503', 'Decision Support and Analytics', 'Analysis of the highest level of information support for the manager-user. A study of systems providing analytics-based information derived from databases within and/or external to the organization and used to support management in the decision making. Application of tools in business analytics, problem solving, and decision making.', 3, 'Spring'),
('ISYS 5603', 'Analytics and Visualization', 'This course focuses on how to discern and tell your story visually using data based on traditional graphical data representation as well as the latest data and information technologies. Coverage includes both visualization theory and hands-on exercises using appropriate computing tools. The course will also include visualization of predictive, clustering, and association models. The opportunities and challenges of Big Data visualization will be explored. Prerequisite: ISYS 5503 or MBAD 513V and departmental consent.', 3, 'Fall'),
('ISYS 5613', 'Business Applications of Nonparametric Techniques', '(First offered Summer 2002, Formerly CISQ 5613) Consideration of business and economic research related to sampling and experimental design, testing of hypothesis, and using nonparametric tests. Prerequisite: ISYS 5203 or equivalent.', 3, 'Spring'),
('ISYS 5623', 'Multivariate Analysis', 'Principal component analysis, regression analyses. Prerequisite: ISYS 5203.', 3, 'Spring'),
('ISYS 5713', 'Seminar in IS Topics', 'Intensive seminar in selected information systems topics. Topical selection made with each course offering. Prerequisite: ISYS 511V or MIS Director approval. May be repeated for up to 9 hours of degree credit.', 3, 'Irregular'),
('ISYS 5723', 'Advanced Multivariate Analysis', 'Factor analysis and other advanced techniques. Prerequisite: ISYS 5623.', 3, 'Irregular'),
('ISYS 5833', 'Data Management Systems', 'Investigation and application of advanced database concepts include database administration, database technology, and selection and acquisition of database management systems. Data modeling and system development in a database environment. Pre- or Corequisite: ISYS 5423. Prerequisite: ISYS 511V.', 3, 'Fall, Spring'),
('ISYS 5843', 'Seminar in Business Intelligence and Knowledge Management', 'Business intelligence focuses on assessing and creating information and knowledge from internal and external sources to support business decision making process. In this seminar, data mining and information retrieval techniques will be used to extract useful knowledge from data, which could be used for business intelligence, and knowledge management. Prerequisite:ISYS 5503 or equivalent and ISYS 5833 or equivalent.', 3, 'Fall, Spring'),
('ISYS 5933', 'Global Technology and Analytics Seminar', 'This course is designed to provide an updated, comprehensive, and rigorous treatment of emerging global topics. Includes, but is not limited to, global study experiences, business insights, and foundational perspectives; examines significant issues from global perspectives. Prerequisite: Graduate standing and MIS Director approval.', 3, 'Summer'),
('ISYS 5943', 'Management of Information Technology Seminar', 'Presented in a way that allows you to play an active role in the design, use, and management of information technology. Using IT to transform the organization, as competitive strategy, and creating new relationship with other firms is included. Prerequisite: ISYS 5423 and ISYS 5833.', 3, 'Spring'),
('ISYS 599V', 'Practicum Seminar', 'This course is designed to introduce and engage the student in the practice, application, and problem solving in the business environment. Hands-on application of a business problem. Students will gain experience working on, making decisions about, and developing solutions for business applications. Topics include but not limited to analytics, data, and information technology.Prerequisite: Graduate standing and MIS Director approval. May be repeated for up to 6 hours of degree credit.', 6, 'Fall, Spring, Summer');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `facultyID` int(11) NOT NULL,
  `firstName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyID`, `firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES
(1, 'Cash', 'Acrey', 'Clinical Assistant Professor', 'ISYS', 'jacrey@uark.edu', '479-575-1223', 1),
(2, 'Brittany', 'Bright', 'faculty', 'ISYS', 'bbright@uark.edu', '479-575-6121', 2),
(3, 'Susan', 'Bristow', 'Clinical Assistant Professor', 'ISYS', 'sbristow@uark.edu', '479-575-4057', 3),
(4, 'Paul', 'Cronan', 'Professor', 'ISYS', 'tcronan@uark.edu', '479-575-6130', 4),
(5, 'David', 'Douglas', 'University Professor', 'ISYS', 'ddouglas@uark.edu', '479-575-6114', 5),
(6, 'Joseph', 'Ehrhardt', 'faculty', 'ISYS', 'jehrhardt@uark.edu', '479-575-1546', 6),
(7, 'Ron', 'Freeze', 'Clinical Associate Professor', 'ISYS', 'rfreeze@uark.edu', '479-575-4564', 7),
(8, 'Hartmut', 'Hoehle', 'Assistant Professor', 'ISYS', 'hhoehle@uark.edu', '479-575-5654', 8),
(9, 'Phillip', 'Kindy', 'faculty', 'ISYS', 'pkindy@uark.edu', '479-575-6563', 9),
(10, 'Xiao', 'Ma', 'Assistant Professor', 'ISYS', 'xma@uark.edu', '479-575-1379', 10),
(11, 'Andrew', 'Mackey', 'faculty', 'ISYS', 'amackey@uark.edu', '479-575-7854', 11),
(12, 'Suresh', 'Malladi', 'Assistant Professor', 'ISYS', 'smalladi@uark.edu', '479-575-7985', 12),
(13, 'Beverly', 'McDaniel', 'faculty', 'ISYS', 'bmcdaniel@uark.edu', '479-575-4554', 13),
(14, 'Jeff', 'Mullins', 'Executive in Residence', 'ISYS', 'jmullins@uark.edu', '479-575-4113', 14),
(15, 'Rajiv', 'Sabherwal', 'Professor', 'ISYS', 'rsabherwal@uark.edu', '479-575-7879', 15),
(16, 'Christina', 'Serrano', 'Assistant Professor', 'ISYS', 'cserrano@uark.edu', '479-575-9423', 16),
(17, 'Pankaj', 'Setia', 'Associate Professor', 'ISYS', 'psetia@uark.edu', '479-575-6454', 17),
(18, 'Tracy', 'Sykes', 'Associate Professor', 'ISYS', 'tsykes@uark.edu', '479-575-7776', 18),
(19, 'Adriana', 'Wilhelm', 'faculty', 'ISYS', 'awilhelm@uark.edu', '479-575-9882', 20);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_request`
--

CREATE TABLE `faculty_request` (
  `requestID` int(11) NOT NULL,
  `facultyID` int(11) NOT NULL,
  `requestDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faculty_request`
--

INSERT INTO `faculty_request` (`requestID`, `facultyID`, `requestDate`) VALUES
(1, 1, '2017-04-05 01:05:00'),
(2, 2, '2017-04-05 01:05:00'),
(3, 3, '2017-04-05 01:05:00'),
(4, 4, '2017-04-05 01:05:00'),
(5, 5, '2017-04-05 01:05:00'),
(6, 6, '2017-04-05 01:05:00'),
(7, 7, '2017-04-05 01:05:00'),
(8, 8, '2017-04-05 01:05:00'),
(9, 9, '2017-04-05 01:05:00'),
(10, 10, '2017-04-05 01:05:00'),
(11, 11, '2017-04-05 01:05:00'),
(12, 12, '2017-04-05 01:05:00'),
(13, 13, '2017-04-05 01:05:00'),
(14, 14, '2017-04-05 01:05:00'),
(15, 15, '2017-04-05 01:05:00'),
(16, 16, '2017-04-05 01:05:00'),
(17, 17, '2017-04-05 01:05:00'),
(18, 18, '2017-04-05 01:05:00'),
(19, 19, '2017-04-05 01:05:00'),
(20, 1, '2017-04-05 01:05:00'),
(21, 2, '2017-04-05 01:05:00'),
(22, 3, '2017-04-05 01:05:00'),
(23, 4, '2017-04-05 01:05:00'),
(24, 5, '2017-04-05 01:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `interview_file`
--

CREATE TABLE `interview_file` (
  `fileID` int(11) NOT NULL,
  `fileName` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `applicationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `requestID` int(11) NOT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `hours` tinyint(4) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `internet` tinyint(4) NOT NULL,
  `wordProcessing` tinyint(4) NOT NULL,
  `spreadsheets` tinyint(4) NOT NULL,
  `programming` tinyint(4) NOT NULL,
  `database` tinyint(4) NOT NULL,
  `sap` tinyint(4) NOT NULL,
  `statisticalPackages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `programmingLanguages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `writing` tinyint(4) NOT NULL,
  `editing` tinyint(4) NOT NULL,
  `english` tinyint(4) NOT NULL,
  `grading` tinyint(4) NOT NULL,
  `otherSkills` text COLLATE utf8_unicode_ci,
  `multipleGAs` tinyint(1) NOT NULL DEFAULT '0',
  `multipleGAsNumber` tinyint(4) DEFAULT '1',
  `requested_studentID` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`requestID`, `reason`, `hours`, `description`, `internet`, `wordProcessing`, `spreadsheets`, `programming`, `database`, `sap`, `statisticalPackages`, `programmingLanguages`, `writing`, `editing`, `english`, `grading`, `otherSkills`, `multipleGAs`, `multipleGAsNumber`, `requested_studentID`, `comments`) VALUES
(1, 'I need a GA to conduct research.', 30, 'Their duty as GA is to do their duties.', 1, 2, 0, 3, 3, 0, 'Teradata', 'Python', 0, 2, 0, 1, NULL, 0, 3, 1, NULL),
(2, 'I need a GA to help out in the classroom.', 30, 'Their duty as GA is to do their duties.', 2, 1, 2, 2, 0, 1, NULL, NULL, 2, 1, 1, 1, NULL, 1, 1, NULL, NULL),
(3, 'I need a GA to help out in the classroom.', 30, 'Their duty as GA is to do their duties.', 1, 3, 3, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, NULL, 1, 1, NULL, NULL),
(4, 'I need a GA to help out in the classroom.', 30, 'Their duty as GA is to do their duties.', 0, 1, 1, 3, 1, 1, 'R', NULL, 1, 3, 1, 2, NULL, 1, 1, NULL, NULL),
(5, 'I need a GA to conduct research.', 20, 'Their duty as GA is to do their duties.', 0, 0, 0, 3, 0, 0, NULL, NULL, 2, 3, 0, 2, NULL, 1, 2, NULL, NULL),
(6, 'I need a GA to grade papers.', 20, 'Their duty as GA is to do their duties.', 0, 1, 0, 1, 2, 3, 'R', NULL, 3, 2, 1, 2, NULL, 1, 3, NULL, NULL),
(7, 'I need a GA to grade papers.', 10, 'Their duty as GA is to do their duties.', 1, 0, 2, 1, 3, 3, 'SAS', NULL, 3, 0, 2, 1, NULL, 0, 2, NULL, NULL),
(8, 'I need a GA to help out in the classroom.', 30, 'Their duty as GA is to do their duties.', 1, 1, 3, 1, 2, 3, 'R', NULL, 3, 3, 2, 1, NULL, 0, 3, NULL, NULL),
(9, 'I need a GA to conduct research.', 30, 'Their duty as GA is to do their duties.', 1, 3, 2, 0, 3, 3, NULL, NULL, 3, 1, 0, 3, NULL, 1, 2, NULL, NULL),
(10, 'I need a GA to grade papers.', 30, 'Their duty as GA is to do their duties.', 0, 3, 0, 3, 2, 1, 'Stata', 'SQL', 0, 0, 2, 1, NULL, 0, 3, 15, NULL),
(11, 'I need a GA to conduct research.', 10, 'Their duty as GA is to do their duties.', 1, 0, 3, 3, 1, 2, 'Stata', 'Python', 0, 0, 1, 2, NULL, 1, 1, 16, NULL),
(12, 'I need a GA to conduct research.', 10, 'Their duty as GA is to do their duties.', 2, 3, 2, 3, 0, 3, NULL, NULL, 2, 1, 1, 3, NULL, 1, 1, NULL, NULL),
(13, 'I need a GA to help out in the classroom.', 20, 'Their duty as GA is to do their duties.', 0, 2, 0, 3, 1, 3, 'SAS', 'Java', 1, 2, 2, 1, NULL, 0, 1, 9, NULL),
(14, 'I need a GA to help out in the classroom.', 10, 'Their duty as GA is to do their duties.', 0, 3, 3, 1, 3, 3, 'SPSS', NULL, 2, 1, 3, 0, NULL, 0, 2, NULL, NULL),
(15, 'I need a GA to help out in the classroom.', 20, 'Their duty as GA is to do their duties.', 0, 1, 1, 3, 1, 1, 'SPSS', 'Java', 2, 3, 0, 1, NULL, 1, 3, 26, NULL),
(16, 'I need a GA to conduct research.', 10, 'Their duty as GA is to do their duties.', 3, 3, 0, 3, 0, 3, 'Stata', 'Java', 3, 1, 3, 0, NULL, 0, 3, 5, NULL),
(17, 'I need a GA to conduct research.', 10, 'Their duty as GA is to do their duties.', 0, 1, 3, 0, 1, 2, 'Teradata', NULL, 1, 1, 2, 3, NULL, 1, 3, NULL, NULL),
(18, 'I need a GA to grade papers.', 20, 'Their duty as GA is to do their duties.', 1, 2, 0, 0, 3, 0, NULL, NULL, 2, 2, 0, 0, NULL, 1, 1, NULL, NULL),
(19, 'I need a GA to help out in the classroom.', 30, 'Their duty as GA is to do their duties.', 0, 3, 2, 2, 1, 0, NULL, NULL, 1, 2, 3, 0, NULL, 0, 1, NULL, NULL),
(20, 'I need a GA to conduct research.', 30, 'Their duty as GA is to do their duties.', 2, 3, 2, 2, 0, 1, 'Stata', NULL, 1, 0, 1, 1, NULL, 1, 2, NULL, NULL),
(21, 'I need a GA to grade papers.', 20, 'Their duty as GA is to do their duties.', 2, 1, 1, 3, 1, 3, 'R', NULL, 1, 3, 1, 1, NULL, 1, 2, NULL, NULL),
(22, 'I need a GA to conduct research.', 20, 'Their duty as GA is to do their duties.', 1, 2, 1, 0, 1, 3, NULL, NULL, 3, 2, 2, 2, NULL, 0, 2, NULL, NULL),
(23, 'I need a GA to help out in the classroom.', 10, 'Their duty as GA is to do their duties.', 3, 1, 3, 3, 2, 2, 'R', NULL, 0, 2, 2, 3, NULL, 0, 1, NULL, NULL),
(24, 'I need a GA to help out in the classroom.', 30, 'Their duty as GA is to do their duties.', 0, 3, 1, 3, 2, 3, 'Teradata', NULL, 3, 2, 2, 1, NULL, 0, 3, NULL, NULL),
(25, 'I need a GA to conduct research.', 30, 'Their duty as GA is to do their duties.', 3, 3, 2, 2, 3, 3, NULL, NULL, 3, 2, 2, 3, NULL, 1, 2, NULL, NULL),
(26, 'I need a GA to conduct research.', 20, 'Their duty as GA is to do their duties.', 3, 2, 2, 2, 1, 1, 'Stata', NULL, 0, 2, 1, 3, NULL, 0, 3, NULL, NULL),
(27, 'I need a GA to conduct research.', 10, 'Their duty as GA is to do their duties.', 3, 0, 1, 3, 0, 0, 'SAS', 'C#', 3, 1, 3, 2, NULL, 0, 1, 28, NULL),
(28, 'I need a GA to conduct research.', 30, 'Their duty as GA is to do their duties.', 3, 0, 0, 1, 3, 0, NULL, NULL, 2, 3, 2, 0, NULL, 1, 3, NULL, NULL),
(29, 'I need a GA to grade papers.', 30, 'Their duty as GA is to do their duties.', 1, 2, 0, 3, 1, 3, NULL, NULL, 1, 1, 3, 3, NULL, 0, 1, NULL, NULL),
(30, 'I need a GA to help out in the classroom.', 30, 'Their duty as GA is to do their duties.', 1, 2, 2, 3, 2, 3, NULL, 'Python', 2, 2, 0, 3, NULL, 1, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomID` int(11) NOT NULL,
  `building` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `roomNumber` char(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomID`, `building`, `roomNumber`) VALUES
(1, 'JBHT', '0144'),
(2, 'JBHT', '0216'),
(3, 'JBHT', '0217'),
(4, 'JBHT', '0218'),
(5, 'JBHT', '0220'),
(6, 'JBHT', '0222'),
(7, 'JBHT', '0224'),
(8, 'JBHT', '0230'),
(9, 'JBHT', '0235'),
(10, 'WCOB', '0116'),
(11, 'WCOB', '0230'),
(12, 'WCOB', '0234'),
(13, 'WCOB', '0240'),
(14, 'WCOB', '0244'),
(15, 'WCOB', '0250'),
(16, 'WCOB', '0320'),
(17, 'WCOB', '0430'),
(18, 'WCOB', '0431'),
(19, 'WCOB', '0432'),
(20, 'WJWH', '0210'),
(21, 'WJWH', '0212'),
(22, 'WJWH', '0218'),
(23, 'WJWH', '0220'),
(24, 'WJWH', '0318'),
(25, 'JBHT', '0144'),
(26, 'JBHT', '0216'),
(27, 'JBHT', '0217'),
(28, 'JBHT', '0218'),
(29, 'JBHT', '0220'),
(30, 'JBHT', '0222'),
(31, 'JBHT', '0224'),
(32, 'JBHT', '0230'),
(33, 'JBHT', '0235'),
(34, 'WCOB', '0116'),
(35, 'WCOB', '0230'),
(36, 'WCOB', '0234'),
(37, 'WCOB', '0240'),
(38, 'WCOB', '0244'),
(39, 'WCOB', '0250'),
(40, 'WCOB', '0320'),
(41, 'WCOB', '0430'),
(42, 'WCOB', '0431'),
(43, 'WCOB', '0432'),
(44, 'WJWH', '0210'),
(45, 'WJWH', '0212'),
(46, 'WJWH', '0218'),
(47, 'WJWH', '0220'),
(48, 'WJWH', '0318');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `stateID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`stateID`, `state`) VALUES
('AA', 'U.S. Military'),
('AE', 'U.S. Military'),
('AK', 'Alaska'),
('AL', 'Alabama'),
('AP', 'U.S. Military'),
('AR', 'Arkansas'),
('AS', 'American Samoa'),
('AZ', 'Arizona'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DC', 'District of Columbia'),
('DE', 'Delaware'),
('FL', 'Florida'),
('FM', 'Federated States of Micronesia'),
('GA', 'Georgia'),
('GU', 'Guam'),
('HI', 'Hawaii'),
('IA', 'Iowa'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('MA', 'Massachusetts'),
('MD', 'Maryland'),
('ME', 'Maine'),
('MH', 'Marshall Islands'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MO', 'Missouri'),
('MP', 'Northern Mariana Islands'),
('MS', 'Mississippi'),
('MT', 'Montana'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('NE', 'Nebraska'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NV', 'Nevada'),
('NY', 'New York'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('PR', 'Puerto Rico'),
('PW', 'Palau'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VA', 'Virginia'),
('VI', 'Virgin Islands'),
('VT', 'Vermont'),
('WA', 'Washington'),
('WI', 'Wisconsin'),
('WV', 'West Virginia'),
('WY', 'Wyoming');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `middleName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `preferredName` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primaryEmail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `secondaryEmail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primaryPhone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `secondaryPhone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `socialSecurityNumber` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `dateOfBirth` date NOT NULL,
  `countryOfBirth` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ethnicity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `citizenship` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `firstName`, `middleName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES
(1, 'Dennis', NULL, 'Wallace', 'Dennis Wallace', 'dwallace0@noaa.gov', NULL, '1510613882', '3581859232', '455399359', '1981-12-03', 'PT', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(2, 'Jessica', NULL, 'Williamson', 'Jessica Williamson', 'jwilliamson1@sphinn.com', 'jwilliamson1@artisteer.com', '1098038047', '9695095264', '742888449', '1982-03-27', 'UA', 'Hispanic', 'Female', 'Resident Alien'),
(3, 'Cynthia', NULL, 'Walker', 'Cynthia Walker', 'cwalker2@unesco.org', NULL, '4019201100', '8367375177', '222738861', '1993-08-18', 'AR', 'White Non-Hispanic', 'Female', 'Non-Resident Alien'),
(4, 'Joshua', NULL, 'Gilbert', 'Joshua Gilbert', 'jgilbert3@businessinsider.com', NULL, '7311564399', '4616930211', '556141263', '1983-01-06', 'RU', 'Hispanic', 'Male', 'U.S. Citizen'),
(5, 'William', NULL, 'Robinson', 'William Robinson', 'wrobinson4@webs.com', NULL, '9795915521', '8399914622', '313145418', '1988-12-15', 'AL', 'White Non-Hispanic', 'Male', 'Resident Alien'),
(6, 'Kathy', NULL, 'Adams', 'Kathy Adams', 'kadams5@cbsnews.com', NULL, '5174942348', '7479827137', '154602151', '1982-02-06', 'TH', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(7, 'Phyllis', NULL, 'Moreno', 'Phyllis Moreno', 'pmoreno6@acquirethisname.com', NULL, '5480870417', '8692690515', '711812129', '1989-08-19', 'MY', 'Black Non-Hispanic', 'Female', 'Non-Resident Alien'),
(8, 'Jonathan', NULL, 'Walker', 'Jonathan Walker', 'jwalker7@usnews.com', NULL, '7216819302', '1279488300', '882529858', '1986-05-18', 'PL', 'White Non-Hispanic', 'Male', 'Non-Resident Alien'),
(9, 'Dennis', NULL, 'Morrison', 'Dennis Morrison', 'dmorrison8@sciencedaily.com', NULL, '8008070970', '1228483682', '377003220', '1988-08-08', 'ID', 'White Non-Hispanic', 'Male', 'Non-Resident Alien'),
(10, 'Jerry', NULL, 'Banks', 'Jerry Banks', 'jbanks9@blog.com', NULL, '6682106060', '7302188725', '587251526', '1989-08-05', 'ID', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(11, 'Stephanie', NULL, 'Moore', 'Stephanie Moore', 'smoorea@51.la', NULL, '6694179607', '5412850698', '216349272', '1980-07-27', 'TH', 'White Non-Hispanic', 'Female', 'Non-Resident Alien'),
(12, 'Alan', NULL, 'Taylor', 'Alan Taylor', 'ataylorb@nifty.com', NULL, '6320891242', '7525861209', '220583214', '1986-12-08', 'US', 'White Non-Hispanic', 'Male', 'Non-Resident Alien'),
(13, 'Kathryn', NULL, 'Alvarez', 'Kathryn Alvarez', 'kalvarezc@cpanel.net', NULL, '3959099397', '2092609827', '662972879', '1984-10-11', 'ID', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(14, 'Judith', NULL, 'Perry', 'Judith Perry', 'jperryd@whitehouse.gov', NULL, '1847775991', '5495270800', '297025620', '1982-09-05', 'CN', 'Hispanic', 'Female', 'U.S. Citizen'),
(15, 'Rachel', NULL, 'Stanley', 'Rachel Stanley', 'rstanleye@patch.com', NULL, '1141218150', '5336313043', '711139715', '1993-11-04', 'JP', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(16, 'Kimberly', NULL, 'Hicks', 'Kimberly Hicks', 'khicksf@gnu.org', NULL, '1425059283', '9830722453', '807455569', '1993-01-24', 'AM', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(17, 'Doris', NULL, 'Mitchell', 'Doris Mitchell', 'dmitchellg@ed.gov', NULL, '2896000811', '6425000466', '945250576', '1992-07-21', 'RU', 'Hispanic', 'Female', 'U.S. Citizen'),
(18, 'Dennis', NULL, 'Stephens', NULL, 'dstephensh@washington.edu', NULL, '6219173396', NULL, '441076858', '1980-06-06', 'TN', 'Black Non-Hispanic', 'Male', 'Resident Alien'),
(19, 'Paula', NULL, 'Wagner', NULL, 'pwagneri@businesswire.com', NULL, '8963642224', NULL, '777616977', '1985-12-25', 'IL', 'Hispanic', 'Female', 'U.S. Citizen'),
(20, 'Daniel', NULL, 'Ortiz', NULL, 'dortizj@tuttocitta.it', NULL, '7881603208', NULL, '496653264', '1984-04-24', 'CN', 'Alaskan Native or American Indian', 'Male', 'Resident Alien'),
(21, 'Carlos', NULL, 'Fisher', 'Carlos Fisher', 'cfisherk@sfgate.com', NULL, '6548152307', '7021209882', '923992268', '1989-09-07', 'US', 'Asian or Pacific Islander', 'Male', 'Resident Alien'),
(22, 'Alice', NULL, 'Ray', 'Alice Ray', 'arayl@unc.edu', NULL, '6582563694', '1410537735', '332327404', '1994-09-04', 'PT', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(23, 'Shirley', NULL, 'Ray', 'Shirley Ray', 'sraym@auda.org.au', NULL, '9081215544', '3230433435', '339827326', '1988-04-26', 'GR', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen'),
(24, 'Henry', NULL, 'Medina', 'Henry Medina', 'hmedinan@army.mil', 'hmedinan@sphinn.com', '2963947662', '3824480817', '720466299', '1990-04-19', 'CO', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen'),
(25, 'Kevin', NULL, 'Porter', NULL, 'kportero@bizjournals.com', NULL, '6665790814', NULL, '240662205', '1990-12-22', 'ZA', 'Hispanic', 'Male', 'U.S. Citizen'),
(26, 'Roger', NULL, 'Chavez', NULL, 'rchavezp@seattletimes.com', NULL, '6849451083', NULL, '247456238', '1989-10-16', 'CZ', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(27, 'Aaron', NULL, 'Fuller', 'Aaron Fuller', 'afullerq@epa.gov', NULL, '9527134394', '7542513116', '258900644', '1994-07-19', 'JP', 'Black Non-Hispanic', 'Male', 'U.S. Citizen'),
(28, 'Jesse', NULL, 'Arnold', 'Jesse Arnold', 'jarnoldr@linkedin.com', NULL, '2309663992', '2276586892', '978760012', '1980-01-14', 'ID', 'Alaskan Native or American Indian', 'Male', 'Resident Alien'),
(29, 'Harold', NULL, 'Peterson', NULL, 'hpetersons@hud.gov', NULL, '7325266966', NULL, '458617252', '1990-03-03', 'CN', 'Black Non-Hispanic', 'Male', 'Resident Alien'),
(30, 'Alan', NULL, 'Mendoza', 'Alan Mendoza', 'amendozat@discovery.com', NULL, '9610393994', '9700524504', '108058044', '1991-10-29', 'PH', 'Hispanic', 'Male', 'Non-Resident Alien'),
(31, 'Julia', NULL, 'Rogers', 'Julia Rogers', 'jrogersu@nyu.edu', NULL, '8867553329', '8387732769', '828077389', '1985-01-11', 'CN', 'Black Non-Hispanic', 'Female', 'Resident Alien'),
(32, 'Susan', NULL, 'Owens', NULL, 'sowensv@digg.com', NULL, '2168882349', NULL, '805939729', '1994-10-13', 'AT', 'Hispanic', 'Female', 'Resident Alien'),
(33, 'Willie', NULL, 'Graham', NULL, 'wgrahamw@php.net', NULL, '9451220509', NULL, '265985358', '1992-09-04', 'ID', 'Asian or Pacific Islander', 'Male', 'Resident Alien'),
(34, 'Lawrence', NULL, 'Ryan', 'Lawrence Ryan', 'lryanx@arstechnica.com', NULL, '3783710331', '8084502345', '917741745', '1991-06-17', 'UZ', 'Hispanic', 'Male', 'U.S. Citizen'),
(35, 'Jason', NULL, 'Reyes', 'Jason Reyes', 'jreyesy@senate.gov', NULL, '9457522113', '7297479982', '936870444', '1991-11-08', 'RU', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(36, 'Ann', NULL, 'Taylor', NULL, 'ataylorz@bloglines.com', 'ataylorz@cyberchimps.com', '5518564355', NULL, '756084915', '1983-09-14', 'CN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(37, 'Matthew', NULL, 'Brooks', 'Matthew Brooks', 'mbrooks10@de.vu', NULL, '1057433616', '9543206378', '225728216', '1992-07-12', 'KN', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen'),
(38, 'Donald', NULL, 'Dean', 'Donald Dean', 'ddean11@sbwire.com', NULL, '5215472828', '3968729306', '208400503', '1987-02-26', 'TH', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(39, 'Paula', NULL, 'Hansen', NULL, 'phansen12@harvard.edu', NULL, '6503234542', NULL, '596178839', '1988-11-20', 'BR', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(40, 'Shirley', NULL, 'Olson', 'Shirley Olson', 'solson13@buzzfeed.com', NULL, '7388708009', '9222083257', '638019704', '1984-02-25', 'PT', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(41, 'Justin', NULL, 'Jenkins', 'Justin Jenkins', 'jjenkins14@theglobeandmail.com', NULL, '4236992164', '9807855682', '112585595', '1993-01-29', 'CN', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(42, 'Louis', NULL, 'Hill', 'Louis Hill', 'lhill15@hubpages.com', 'lhill15@biglobe.ne.jp', '8786002834', '1142465306', '747967033', '1990-03-12', 'VN', 'Hispanic', 'Male', 'Non-Resident Alien'),
(43, 'Julia', NULL, 'Freeman', 'Julia Freeman', 'jfreeman16@list-manage.com', NULL, '9329272191', '3905077172', '482742277', '1980-10-11', 'PH', 'White Non-Hispanic', 'Female', 'U.S. Citizen'),
(44, 'Emily', NULL, 'Pierce', 'Emily Pierce', 'epierce17@shop-pro.jp', NULL, '4891121683', '5524361927', '312745059', '1994-01-12', 'ZA', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(45, 'Larry', NULL, 'Taylor', 'Larry Taylor', 'ltaylor18@salon.com', NULL, '7793648780', '4299715470', '191048196', '1990-04-24', 'BR', 'Asian or Pacific Islander', 'Male', 'Resident Alien'),
(46, 'Aaron', NULL, 'Powell', NULL, 'apowell19@uiuc.edu', 'apowell19@webmd.com', '3043329054', NULL, '780843209', '1986-10-24', 'BY', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(47, 'Dorothy', NULL, 'Green', 'Dorothy Green', 'dgreen1a@biblegateway.com', NULL, '7243998678', '5717607909', '160833465', '1990-04-19', 'RU', 'Alaskan Native or American Indian', 'Female', 'Resident Alien'),
(48, 'Daniel', NULL, 'Cruz', NULL, 'dcruz1b@imdb.com', NULL, '4184390404', NULL, '180480982', '1987-04-26', 'CN', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(49, 'Kenneth', NULL, 'Cook', 'Kenneth Cook', 'kcook1c@cam.ac.uk', NULL, '5865694715', '7869576819', '656883394', '1982-06-09', 'DK', 'Black Non-Hispanic', 'Male', 'U.S. Citizen'),
(50, 'Betty', NULL, 'Gibson', 'Betty Gibson', 'bgibson1d@fc2.com', NULL, '9992373477', '3690577282', '658637935', '1982-01-03', 'ID', 'Alaskan Native or American Indian', 'Female', 'U.S. Citizen'),
(51, 'Janice', NULL, 'Reyes', NULL, 'jreyes1e@webs.com', NULL, '7532882316', NULL, '152526595', '1982-04-25', 'CN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(52, 'Janice', NULL, 'Lane', 'Janice Lane', 'jlane1f@usa.gov', 'jlane1f@google.com.au', '1910454377', '1524174237', '338127280', '1982-11-10', 'PH', 'Alaskan Native or American Indian', 'Female', 'Resident Alien'),
(53, 'Keith', NULL, 'Fields', 'Keith Fields', 'kfields1g@blinklist.com', NULL, '3738451044', '3789921286', '920428930', '1994-12-01', 'PL', 'Hispanic', 'Male', 'U.S. Citizen'),
(54, 'Cheryl', NULL, 'Gray', 'Cheryl Gray', 'cgray1h@sina.com.cn', NULL, '9874409491', '2636317379', '986283741', '1987-06-28', 'MM', 'Hispanic', 'Female', 'Resident Alien'),
(55, 'Joseph', NULL, 'Freeman', NULL, 'jfreeman1i@dot.gov', NULL, '4789043235', NULL, '928851292', '1984-09-14', 'CN', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien'),
(56, 'Marilyn', NULL, 'Lopez', 'Marilyn Lopez', 'mlopez1j@cbsnews.com', NULL, '2638083922', '3395596688', '119758631', '1991-07-03', 'UA', 'Hispanic', 'Female', 'Non-Resident Alien'),
(57, 'Phyllis', NULL, 'Ferguson', NULL, 'pferguson1k@phoca.cz', NULL, '4858654553', NULL, '971150015', '1988-04-29', 'CN', 'Black Non-Hispanic', 'Female', 'Resident Alien'),
(58, 'Joe', NULL, 'Andrews', 'Joe Andrews', 'jandrews1l@reverbnation.com', NULL, '4795443053', '4658674910', '575615563', '1983-04-19', 'BR', 'Black Non-Hispanic', 'Male', 'U.S. Citizen'),
(59, 'Lawrence', NULL, 'Smith', NULL, 'lsmith1m@hugedomains.com', NULL, '7570269402', NULL, '541251481', '1991-10-01', 'AR', 'Asian or Pacific Islander', 'Male', 'Resident Alien'),
(60, 'Louis', NULL, 'Nichols', NULL, 'lnichols1n@163.com', NULL, '8545393980', NULL, '444655731', '1983-03-27', 'NO', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(61, 'Denise', NULL, 'Crawford', 'Denise Crawford', 'dcrawford1o@berkeley.edu', NULL, '7155376610', '5899032206', '113627232', '1984-07-26', 'CN', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(62, 'Joan', NULL, 'Campbell', 'Joan Campbell', 'jcampbell1p@buzzfeed.com', NULL, '4673971576', '3070680176', '401229725', '1984-02-21', 'PT', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen'),
(63, 'Marie', NULL, 'Elliott', 'Marie Elliott', 'melliott1q@mozilla.org', NULL, '6582217519', '6611294966', '193695582', '1992-02-13', 'CN', 'Black Non-Hispanic', 'Female', 'U.S. Citizen'),
(64, 'Rachel', NULL, 'Little', 'Rachel Little', 'rlittle1r@slideshare.net', NULL, '1442846817', '5571353831', '731937021', '1994-06-21', 'CN', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(65, 'David', NULL, 'Larson', 'David Larson', 'dlarson1s@economist.com', NULL, '7647733573', '6950894082', '726633180', '1985-03-13', 'TH', 'White Non-Hispanic', 'Male', 'U.S. Citizen'),
(66, 'Julia', NULL, 'Gordon', NULL, 'jgordon1t@state.tx.us', NULL, '8181946366', NULL, '645741705', '1980-09-26', 'ID', 'White Non-Hispanic', 'Female', 'Resident Alien'),
(67, 'Jimmy', NULL, 'Fuller', 'Jimmy Fuller', 'jfuller1u@patch.com', NULL, '9486379805', '1050878250', '574078803', '1981-11-16', 'SE', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(68, 'Billy', NULL, 'Carroll', 'Billy Carroll', 'bcarroll1v@dagondesign.com', NULL, '7996899292', '8696904807', '550493204', '1990-01-19', 'GR', 'Hispanic', 'Male', 'Non-Resident Alien'),
(69, 'Steven', NULL, 'Berry', 'Steven Berry', 'sberry1w@printfriendly.com', NULL, '1861423535', '1850902373', '118424916', '1988-09-11', 'CN', 'White Non-Hispanic', 'Male', 'Resident Alien'),
(70, 'Stephen', NULL, 'Peterson', NULL, 'speterson1x@trellian.com', NULL, '5417560908', NULL, '890720105', '1986-05-18', 'CU', 'White Non-Hispanic', 'Male', 'Resident Alien'),
(71, 'Laura', NULL, 'Wheeler', 'Laura Wheeler', 'lwheeler1y@about.com', NULL, '1971815000', '9287619042', '547097974', '1980-06-12', 'MX', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(72, 'Judith', NULL, 'Fowler', 'Judith Fowler', 'jfowler1z@lulu.com', 'jfowler1z@state.gov', '3118817426', '8203574111', '580496147', '1986-06-18', 'SE', 'Hispanic', 'Female', 'Non-Resident Alien'),
(73, 'Joseph', NULL, 'Wright', NULL, 'jwright20@icq.com', NULL, '7108991909', NULL, '428087786', '1988-07-19', 'CN', 'Black Non-Hispanic', 'Male', 'Resident Alien'),
(74, 'Denise', NULL, 'Ruiz', NULL, 'druiz21@techcrunch.com', NULL, '7010746054', NULL, '588267329', '1991-01-26', 'CN', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(75, 'Debra', NULL, 'Gonzalez', 'Debra Gonzalez', 'dgonzalez22@soundcloud.com', NULL, '9158631756', '5760845458', '796279405', '1990-07-01', 'CN', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(76, 'Brandon', NULL, 'Kennedy', 'Brandon Kennedy', 'bkennedy23@amazon.de', 'bkennedy23@berkeley.edu', '3110287490', '7920970671', '224234942', '1983-04-29', 'CN', 'White Non-Hispanic', 'Male', 'U.S. Citizen'),
(77, 'Marilyn', NULL, 'Martinez', 'Marilyn Martinez', 'mmartinez24@google.ca', NULL, '5914646607', '8393671326', '824742185', '1981-04-24', 'FR', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(78, 'Christina', NULL, 'Rivera', NULL, 'crivera25@jigsy.com', NULL, '2977685500', NULL, '251502390', '1990-05-04', 'PL', 'Alaskan Native or American Indian', 'Female', 'Resident Alien'),
(79, 'Martha', NULL, 'Bailey', 'Martha Bailey', 'mbailey26@unc.edu', NULL, '4221154076', '2380172210', '152815839', '1991-05-02', 'NG', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(80, 'Steven', NULL, 'Baker', 'Steven Baker', 'sbaker27@taobao.com', NULL, '5076205026', '1846980511', '376919705', '1984-04-03', 'UZ', 'Alaskan Native or American Indian', 'Male', 'Resident Alien'),
(81, 'Jacqueline', NULL, 'Hansen', 'Jacqueline Hansen', 'jhansen28@ft.com', 'jhansen28@redcross.org', '4796321360', '3777743168', '770410353', '1987-03-24', 'US', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(82, 'Willie', NULL, 'Hicks', 'Willie Hicks', 'whicks29@sciencedaily.com', NULL, '1098662367', '5375956180', '117312627', '1986-08-17', 'CN', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(83, 'Doris', NULL, 'Harper', 'Doris Harper', 'dharper2a@gmpg.org', NULL, '4113446451', '5874953658', '141925975', '1989-07-11', 'CN', 'Hispanic', 'Female', 'U.S. Citizen'),
(84, 'Jane', NULL, 'Sanchez', 'Jane Sanchez', 'jsanchez2b@zimbio.com', NULL, '4525303270', '4110124615', '196230576', '1994-03-18', 'MA', 'Black Non-Hispanic', 'Female', 'U.S. Citizen'),
(85, 'Wanda', NULL, 'Howard', NULL, 'whoward2c@addthis.com', NULL, '6366418403', NULL, '372691663', '1990-08-17', 'PH', 'Black Non-Hispanic', 'Female', 'Resident Alien'),
(86, 'Susan', NULL, 'Lewis', 'Susan Lewis', 'slewis2d@cpanel.net', NULL, '2980682055', '1703690445', '110676538', '1983-03-24', 'CU', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(87, 'Willie', NULL, 'Harris', 'Willie Harris', 'wharris2e@360.cn', NULL, '6286926691', '5872076671', '529477728', '1987-01-31', 'JP', 'White Non-Hispanic', 'Male', 'U.S. Citizen'),
(88, 'Paula', NULL, 'George', NULL, 'pgeorge2f@miibeian.gov.cn', 'pgeorge2f@wufoo.com', '7841938596', NULL, '931653208', '1984-02-16', 'CN', 'White Non-Hispanic', 'Female', 'Non-Resident Alien'),
(89, 'Ralph', NULL, 'Diaz', 'Ralph Diaz', 'rdiaz2g@imageshack.us', NULL, '4198422622', '8763259259', '206322288', '1985-04-22', 'ID', 'White Non-Hispanic', 'Male', 'Resident Alien'),
(90, 'Steve', NULL, 'Fuller', NULL, 'sfuller2h@omniture.com', NULL, '8966401321', NULL, '234976303', '1986-01-01', 'BR', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(91, 'Sean', NULL, 'Robertson', 'Sean Robertson', 'srobertson2i@squarespace.com', NULL, '2861191258', '8751081860', '470366745', '1994-03-19', 'UG', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien'),
(92, 'Keith', NULL, 'Barnes', 'Keith Barnes', 'kbarnes2j@de.vu', NULL, '1169856319', '1011445454', '435417034', '1986-10-17', 'MX', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(93, 'Jeremy', NULL, 'Diaz', 'Jeremy Diaz', 'jdiaz2k@hp.com', NULL, '3453570152', '6974179149', '869803138', '1993-12-21', 'CN', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen'),
(94, 'Ashley', NULL, 'Hughes', NULL, 'ahughes2l@amazon.co.uk', NULL, '5226190600', NULL, '994073595', '1980-01-17', 'CY', 'Hispanic', 'Female', 'Resident Alien'),
(95, 'Elizabeth', NULL, 'Bryant', 'Elizabeth Bryant', 'ebryant2m@google.co.jp', NULL, '9930056182', '5574275625', '399542011', '1987-10-19', 'RU', 'Black Non-Hispanic', 'Female', 'Resident Alien'),
(96, 'Clarence', NULL, 'Jones', NULL, 'cjones2n@addthis.com', 'cjones2n@usgs.gov', '7309181556', NULL, '174139835', '1991-07-25', 'FI', 'White Non-Hispanic', 'Male', 'Non-Resident Alien'),
(97, 'Keith', NULL, 'Reyes', NULL, 'kreyes2o@altervista.org', NULL, '3706883546', NULL, '963283892', '1981-09-20', 'CZ', 'Hispanic', 'Male', 'U.S. Citizen'),
(98, 'Harold', NULL, 'Young', 'Harold Young', 'hyoung2p@reuters.com', NULL, '2765362860', '4604340598', '824407053', '1981-03-10', 'CN', 'Hispanic', 'Male', 'Resident Alien'),
(99, 'Jane', NULL, 'Wallace', 'Jane Wallace', 'jwallace2q@multiply.com', NULL, '1598258233', '7496336944', '920954529', '1992-06-12', 'ID', 'White Non-Hispanic', 'Female', 'Resident Alien'),
(100, 'Karen', NULL, 'Foster', 'Karen Foster', 'kfoster2r@tmall.com', NULL, '4526119619', '9651897879', '433212882', '1991-03-03', 'MA', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(101, 'Anne', NULL, 'Dixon', 'Anne Dixon', 'adixon2s@huffingtonpost.com', NULL, '6366856294', '3168048529', '153969325', '1992-10-13', 'TH', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien'),
(102, 'Ronald', NULL, 'Powell', NULL, 'rpowell2t@cargocollective.com', NULL, '5069999462', NULL, '593129125', '1988-10-03', 'CN', 'Black Non-Hispanic', 'Male', 'Resident Alien'),
(103, 'Jeremy', NULL, 'Hill', 'Jeremy Hill', 'jhill2u@etsy.com', NULL, '2484277889', '7587125389', '644598325', '1990-02-21', 'RU', 'Hispanic', 'Male', 'Resident Alien'),
(104, 'Joyce', NULL, 'Ray', 'Joyce Ray', 'jray2v@facebook.com', NULL, '1306068824', '8374544736', '702141346', '1988-12-11', 'VN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(105, 'Aaron', NULL, 'Murray', NULL, 'amurray2w@bigcartel.com', NULL, '3024366744', NULL, '852456446', '1994-01-23', 'MK', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien'),
(106, 'Brian', NULL, 'Porter', 'Brian Porter', 'bporter2x@dailymotion.com', 'bporter2x@tinyurl.com', '9270597395', '3336091088', '652644304', '1993-11-05', 'ZA', 'White Non-Hispanic', 'Male', 'U.S. Citizen'),
(107, 'William', NULL, 'Howard', 'William Howard', 'whoward2y@behance.net', 'whoward2y@pagesperso-orange.fr', '2601891295', '3820879263', '792547600', '1987-02-04', 'ID', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(108, 'William', NULL, 'Morales', 'William Morales', 'wmorales2z@nyu.edu', NULL, '1862402558', '6976923293', '874172523', '1993-10-19', 'LT', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien'),
(109, 'Charles', NULL, 'Daniels', NULL, 'cdaniels30@themeforest.net', NULL, '6697323124', NULL, '346250469', '1986-07-04', 'CA', 'Black Non-Hispanic', 'Male', 'U.S. Citizen'),
(110, 'Maria', NULL, 'Mitchell', 'Maria Mitchell', 'mmitchell31@goo.ne.jp', NULL, '5992005481', '8040339807', '908048110', '1985-08-25', 'AR', 'Black Non-Hispanic', 'Female', 'U.S. Citizen'),
(111, 'Kelly', NULL, 'Sims', 'Kelly Sims', 'ksims32@marriott.com', NULL, '4825904219', '6622695477', '319307270', '1982-03-29', 'CA', 'Black Non-Hispanic', 'Female', 'Resident Alien'),
(112, 'Theresa', NULL, 'Price', 'Theresa Price', 'tprice33@miibeian.gov.cn', NULL, '5665374712', '5550749874', '787493198', '1992-09-22', 'SE', 'Alaskan Native or American Indian', 'Female', 'U.S. Citizen'),
(113, 'Rebecca', NULL, 'Robinson', 'Rebecca Robinson', 'rrobinson34@economist.com', NULL, '1315257006', '7261001199', '566553761', '1990-10-18', 'FR', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen'),
(114, 'Cynthia', NULL, 'Evans', 'Cynthia Evans', 'cevans35@fastcompany.com', 'cevans35@yellowbook.com', '1231168821', '9671509451', '804673332', '1987-07-20', 'HN', 'Hispanic', 'Female', 'Resident Alien'),
(115, 'Stephanie', NULL, 'Rose', 'Stephanie Rose', 'srose36@edublogs.org', NULL, '3877710654', '2811747124', '479708892', '1989-12-27', 'VE', 'Hispanic', 'Female', 'Non-Resident Alien'),
(116, 'Anne', NULL, 'Fox', 'Anne Fox', 'afox37@networkadvertising.org', NULL, '5144599181', '7781623409', '382368726', '1984-12-30', 'CN', 'Hispanic', 'Female', 'Non-Resident Alien'),
(117, 'Carl', NULL, 'Wilson', 'Carl Wilson', 'cwilson38@theguardian.com', NULL, '4646952590', '5114371841', '472165665', '1984-03-02', 'RU', 'Asian or Pacific Islander', 'Male', 'Resident Alien'),
(118, 'Martin', NULL, 'Ray', NULL, 'mray39@zdnet.com', NULL, '6159667353', NULL, '557867373', '1982-10-13', 'CZ', 'Hispanic', 'Male', 'Non-Resident Alien'),
(119, 'Robin', NULL, 'Fisher', NULL, 'rfisher3a@toplist.cz', NULL, '1609161880', NULL, '614690795', '1988-01-19', 'KZ', 'White Non-Hispanic', 'Female', 'U.S. Citizen'),
(120, 'Jessica', NULL, 'Myers', NULL, 'jmyers3b@drupal.org', NULL, '8456523804', NULL, '165713968', '1980-09-06', 'RS', 'Alaskan Native or American Indian', 'Female', 'Resident Alien'),
(121, 'Randy', NULL, 'Thomas', 'Randy Thomas', 'rthomas3c@youtube.com', NULL, '8547676517', '2632180670', '943652139', '1986-05-04', 'CU', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(122, 'Diana', NULL, 'Romero', NULL, 'dromero3d@techcrunch.com', NULL, '4537778682', NULL, '550012260', '1980-04-28', 'ID', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(123, 'Matthew', NULL, 'Palmer', 'Matthew Palmer', 'mpalmer3e@economist.com', 'mpalmer3e@marketwatch.com', '9547004558', '7949814539', '800406990', '1981-05-23', 'PT', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen'),
(124, 'Melissa', NULL, 'Ortiz', 'Melissa Ortiz', 'mortiz3f@gnu.org', NULL, '4751998984', '2017997875', '435124701', '1986-11-09', 'ID', 'Hispanic', 'Female', 'Non-Resident Alien'),
(125, 'Jean', NULL, 'Bailey', 'Jean Bailey', 'jbailey3g@hexun.com', NULL, '9301993500', '9190038610', '753462925', '1984-05-25', 'GR', 'White Non-Hispanic', 'Female', 'Non-Resident Alien'),
(126, 'Nicole', NULL, 'Davis', NULL, 'ndavis3h@buzzfeed.com', NULL, '2690004636', NULL, '610093863', '1987-05-27', 'CN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien'),
(127, 'Christopher', NULL, 'Baker', NULL, 'cbaker3i@slashdot.org', NULL, '3598569825', NULL, '341033754', '1994-08-18', 'PL', 'Alaskan Native or American Indian', 'Male', 'Resident Alien'),
(128, 'Norma', NULL, 'Stone', NULL, 'nstone3j@storify.com', NULL, '5249944644', NULL, '139846624', '1992-04-19', 'TH', 'Black Non-Hispanic', 'Female', 'Non-Resident Alien'),
(129, 'Diane', NULL, 'Torres', 'Diane Torres', 'dtorres3k@w3.org', NULL, '2347073459', '7039405087', '386258318', '1992-12-08', 'ID', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen'),
(130, 'Douglas', NULL, 'Holmes', 'Douglas Holmes', 'dholmes3l@webnode.com', NULL, '9898627608', '5530477871', '982779238', '1984-08-28', 'CN', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien'),
(131, 'Henry', NULL, 'Vasquez', 'Henry Vasquez', 'hvasquez3m@bloomberg.com', NULL, '3952558974', '5269053404', '478146270', '1981-07-22', 'FR', 'White Non-Hispanic', 'Male', 'Resident Alien'),
(132, 'Joshua', NULL, 'Green', NULL, 'jgreen3n@alexa.com', NULL, '1585574457', NULL, '398623610', '1983-02-15', 'ID', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien'),
(133, 'Anthony', NULL, 'Hill', 'Anthony Hill', 'ahill3o@elegantthemes.com', 'ahill3o@paypal.com', '2788724244', '6410956198', '192644207', '1982-04-24', 'SE', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien'),
(134, 'Kathryn', NULL, 'Castillo', 'Kathryn Castillo', 'kcastillo3p@plala.or.jp', 'kcastillo3p@live.com', '4411828648', '4711139709', '653495870', '1983-03-11', 'HR', 'Asian or Pacific Islander', 'Female', 'Resident Alien'),
(135, 'Anthony', NULL, 'Fuller', 'Anthony Fuller', 'afuller3q@oracle.com', NULL, '9210294931', '7733481058', '370483820', '1982-04-02', 'PE', 'Asian or Pacific Islander', 'Male', 'Resident Alien'),
(136, 'Phillip', NULL, 'Edwards', 'Phillip Edwards', 'pedwards3r@irs.gov', 'pedwards3r@europa.eu', '3925300788', '1587281702', '106588164', '1987-07-27', 'ID', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen'),
(137, 'Patrick', NULL, 'Gutierrez', NULL, 'pgutierrez3s@wordpress.com', NULL, '7238461108', NULL, '586747827', '1994-06-06', 'ID', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien'),
(138, 'Patricia', NULL, 'Hawkins', 'Patricia Hawkins', 'phawkins3t@flickr.com', NULL, '9852149423', '2774716104', '573961180', '1984-12-08', 'PH', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen'),
(139, 'Billy', NULL, 'Sims', 'Billy Sims', 'bsims3u@is.gd', 'bsims3u@tumblr.com', '6103920953', '9671760463', '512013924', '1986-11-19', 'PA', 'Hispanic', 'Male', 'Resident Alien'),
(140, 'Jose', NULL, 'Gibson', 'Jose Gibson', 'jgibson3v@paginegialle.it', NULL, '4316656107', '4859150751', '691750973', '1994-09-26', 'NG', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien'),
(141, 'Martha', NULL, 'Miller', 'Martha Miller', 'mmiller3w@jiathis.com', NULL, '7434155844', '6336259772', '628128662', '1985-09-26', 'BO', 'Hispanic', 'Female', 'U.S. Citizen'),
(142, 'Jane', NULL, 'Carr', 'Jane Carr', 'jcarr3x@bandcamp.com', NULL, '9006567219', '7234237469', '933159660', '1981-12-29', 'PH', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen'),
(143, 'Eugene', NULL, 'Fernandez', 'Eugene Fernandez', 'efernandez3y@toplist.cz', NULL, '5931757194', '9002875180', '484781041', '1984-03-02', 'YE', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien'),
(144, 'Wayne', NULL, 'Kelly', 'Wayne Kelly', 'wkelly3z@wisc.edu', NULL, '7080714374', '6306444009', '850812240', '1992-02-02', 'FR', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien'),
(145, 'Ernest', NULL, 'Olson', 'Ernest Olson', 'eolson40@paypal.com', NULL, '6179247531', '9255671061', '100546556', '1985-05-16', 'KM', 'Black Non-Hispanic', 'Male', 'Resident Alien'),
(146, 'Jean', NULL, 'Turner', 'Jean Turner', 'jturner41@google.fr', 'jturner41@ovh.net', '5166673455', '2712001050', '832807144', '1982-12-15', 'ID', 'Hispanic', 'Female', 'U.S. Citizen'),
(147, 'Elizabeth', NULL, 'Thompson', NULL, 'ethompson42@icq.com', NULL, '6185017721', NULL, '744228960', '1989-07-11', 'SV', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen'),
(148, 'Roger', NULL, 'Wood', NULL, 'rwood43@utexas.edu', NULL, '9391302640', NULL, '905311829', '1991-04-08', 'NG', 'White Non-Hispanic', 'Male', 'Non-Resident Alien'),
(149, 'Sarah', NULL, 'Day', 'Sarah Day', 'sday44@psu.edu', NULL, '9740375044', '6519396926', '420055822', '1986-02-20', 'ID', 'Hispanic', 'Female', 'U.S. Citizen'),
(150, 'Janet', NULL, 'Young', 'Janet Young', 'jyoung45@hc360.com', NULL, '2808314993', '8299070957', '283542904', '1983-12-17', 'CN', 'Alaskan Native or American Indian', 'Female', 'Resident Alien');

-- --------------------------------------------------------

--
-- Table structure for table `student_address`
--

CREATE TABLE `student_address` (
  `studentID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_address`
--

INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES
(1, 1, 'mailing'),
(1, 1, 'permanent'),
(2, 2, 'mailing'),
(2, 2, 'permanent'),
(3, 3, 'mailing'),
(3, 3, 'permanent'),
(4, 4, 'mailing'),
(4, 4, 'permanent'),
(5, 5, 'mailing'),
(5, 5, 'permanent'),
(6, 6, 'mailing'),
(6, 6, 'permanent'),
(7, 7, 'mailing'),
(7, 7, 'permanent'),
(8, 8, 'mailing'),
(8, 8, 'permanent'),
(9, 9, 'mailing'),
(9, 9, 'permanent'),
(10, 10, 'mailing'),
(10, 10, 'permanent'),
(11, 11, 'mailing'),
(11, 11, 'permanent'),
(12, 12, 'mailing'),
(12, 12, 'permanent'),
(13, 13, 'mailing'),
(13, 13, 'permanent'),
(14, 14, 'mailing'),
(14, 14, 'permanent'),
(15, 15, 'mailing'),
(15, 15, 'permanent'),
(16, 16, 'mailing'),
(16, 16, 'permanent'),
(17, 17, 'mailing'),
(17, 17, 'permanent'),
(18, 18, 'mailing'),
(18, 18, 'permanent'),
(19, 19, 'mailing'),
(19, 19, 'permanent'),
(20, 20, 'mailing'),
(20, 20, 'permanent'),
(21, 21, 'mailing'),
(21, 21, 'permanent'),
(22, 22, 'mailing'),
(22, 22, 'permanent'),
(23, 23, 'mailing'),
(23, 23, 'permanent'),
(24, 24, 'mailing'),
(24, 24, 'permanent'),
(25, 25, 'mailing'),
(25, 25, 'permanent'),
(26, 26, 'mailing'),
(26, 26, 'permanent'),
(27, 27, 'mailing'),
(27, 27, 'permanent'),
(28, 28, 'mailing'),
(28, 28, 'permanent'),
(29, 29, 'mailing'),
(29, 29, 'permanent'),
(30, 30, 'mailing'),
(30, 30, 'permanent'),
(31, 31, 'mailing'),
(31, 31, 'permanent'),
(32, 32, 'mailing'),
(32, 32, 'permanent'),
(33, 33, 'mailing'),
(33, 33, 'permanent'),
(34, 34, 'mailing'),
(34, 34, 'permanent'),
(35, 35, 'mailing'),
(35, 35, 'permanent'),
(36, 36, 'mailing'),
(36, 36, 'permanent'),
(37, 37, 'mailing'),
(37, 37, 'permanent'),
(38, 38, 'mailing'),
(38, 38, 'permanent'),
(39, 39, 'mailing'),
(39, 39, 'permanent'),
(40, 40, 'mailing'),
(40, 40, 'permanent'),
(41, 41, 'mailing'),
(41, 41, 'permanent'),
(42, 42, 'mailing'),
(42, 42, 'permanent'),
(43, 43, 'mailing'),
(43, 43, 'permanent'),
(44, 44, 'mailing'),
(44, 44, 'permanent'),
(45, 45, 'mailing'),
(45, 45, 'permanent'),
(46, 46, 'mailing'),
(46, 46, 'permanent'),
(47, 47, 'mailing'),
(47, 47, 'permanent'),
(48, 48, 'mailing'),
(48, 48, 'permanent'),
(49, 49, 'mailing'),
(49, 49, 'permanent'),
(50, 50, 'mailing'),
(50, 50, 'permanent'),
(51, 51, 'mailing'),
(51, 51, 'permanent'),
(52, 52, 'mailing'),
(52, 52, 'permanent'),
(53, 53, 'mailing'),
(53, 53, 'permanent'),
(54, 54, 'mailing'),
(54, 54, 'permanent'),
(55, 55, 'mailing'),
(55, 55, 'permanent'),
(56, 56, 'mailing'),
(56, 56, 'permanent'),
(57, 57, 'mailing'),
(57, 57, 'permanent'),
(58, 58, 'mailing'),
(58, 58, 'permanent'),
(59, 59, 'mailing'),
(59, 59, 'permanent'),
(60, 60, 'mailing'),
(60, 60, 'permanent'),
(61, 61, 'mailing'),
(61, 61, 'permanent'),
(62, 62, 'mailing'),
(62, 62, 'permanent'),
(63, 63, 'mailing'),
(63, 63, 'permanent'),
(64, 64, 'mailing'),
(64, 64, 'permanent'),
(65, 65, 'mailing'),
(65, 65, 'permanent'),
(66, 66, 'mailing'),
(66, 66, 'permanent'),
(67, 67, 'mailing'),
(67, 67, 'permanent'),
(68, 68, 'mailing'),
(68, 68, 'permanent'),
(69, 69, 'mailing'),
(69, 69, 'permanent'),
(70, 70, 'mailing'),
(70, 70, 'permanent'),
(71, 71, 'mailing'),
(71, 71, 'permanent'),
(72, 72, 'mailing'),
(72, 72, 'permanent'),
(73, 73, 'mailing'),
(73, 73, 'permanent'),
(74, 74, 'mailing'),
(74, 74, 'permanent'),
(75, 75, 'mailing'),
(75, 75, 'permanent'),
(76, 76, 'mailing'),
(76, 76, 'permanent'),
(77, 77, 'mailing'),
(77, 77, 'permanent'),
(78, 78, 'mailing'),
(78, 78, 'permanent'),
(79, 79, 'mailing'),
(79, 79, 'permanent'),
(80, 80, 'mailing'),
(80, 80, 'permanent'),
(81, 81, 'mailing'),
(81, 81, 'permanent'),
(82, 82, 'mailing'),
(82, 82, 'permanent'),
(83, 83, 'mailing'),
(83, 83, 'permanent'),
(84, 84, 'mailing'),
(84, 84, 'permanent'),
(85, 85, 'mailing'),
(85, 85, 'permanent'),
(86, 86, 'mailing'),
(86, 86, 'permanent'),
(87, 87, 'mailing'),
(87, 87, 'permanent'),
(88, 88, 'mailing'),
(88, 88, 'permanent'),
(89, 89, 'mailing'),
(89, 89, 'permanent'),
(90, 90, 'mailing'),
(90, 90, 'permanent'),
(91, 91, 'mailing'),
(91, 91, 'permanent'),
(92, 92, 'mailing'),
(92, 92, 'permanent'),
(93, 93, 'mailing'),
(93, 93, 'permanent'),
(94, 94, 'mailing'),
(94, 94, 'permanent'),
(95, 95, 'mailing'),
(95, 95, 'permanent'),
(96, 96, 'mailing'),
(96, 96, 'permanent'),
(97, 97, 'mailing'),
(97, 97, 'permanent'),
(98, 98, 'mailing'),
(98, 98, 'permanent'),
(99, 99, 'mailing'),
(99, 99, 'permanent'),
(100, 100, 'mailing'),
(100, 100, 'permanent'),
(101, 101, 'mailing'),
(101, 101, 'permanent'),
(102, 102, 'mailing'),
(102, 102, 'permanent'),
(103, 103, 'mailing'),
(103, 103, 'permanent'),
(104, 104, 'mailing'),
(104, 104, 'permanent'),
(105, 105, 'mailing'),
(105, 105, 'permanent'),
(106, 106, 'mailing'),
(106, 106, 'permanent'),
(107, 107, 'mailing'),
(107, 107, 'permanent'),
(108, 108, 'mailing'),
(108, 108, 'permanent'),
(109, 109, 'mailing'),
(109, 109, 'permanent'),
(110, 110, 'mailing'),
(110, 110, 'permanent'),
(111, 111, 'mailing'),
(111, 111, 'permanent'),
(112, 112, 'mailing'),
(112, 112, 'permanent'),
(113, 113, 'mailing'),
(113, 113, 'permanent'),
(114, 114, 'mailing'),
(114, 114, 'permanent'),
(115, 115, 'mailing'),
(115, 115, 'permanent'),
(116, 116, 'mailing'),
(116, 116, 'permanent'),
(117, 117, 'mailing'),
(117, 117, 'permanent'),
(118, 118, 'mailing'),
(118, 118, 'permanent'),
(119, 119, 'mailing'),
(119, 119, 'permanent'),
(120, 120, 'mailing'),
(120, 120, 'permanent'),
(121, 121, 'mailing'),
(121, 121, 'permanent'),
(122, 122, 'mailing'),
(122, 122, 'permanent'),
(123, 123, 'mailing'),
(123, 123, 'permanent'),
(124, 124, 'mailing'),
(124, 124, 'permanent'),
(125, 125, 'mailing'),
(125, 125, 'permanent'),
(126, 126, 'mailing'),
(126, 126, 'permanent'),
(127, 127, 'mailing'),
(127, 127, 'permanent'),
(128, 128, 'mailing'),
(128, 128, 'permanent'),
(129, 129, 'mailing'),
(129, 129, 'permanent'),
(130, 130, 'mailing'),
(130, 130, 'permanent'),
(131, 131, 'mailing'),
(131, 131, 'permanent'),
(132, 132, 'mailing'),
(132, 132, 'permanent'),
(133, 133, 'mailing'),
(133, 133, 'permanent'),
(134, 134, 'mailing'),
(134, 134, 'permanent'),
(135, 135, 'mailing'),
(135, 135, 'permanent'),
(136, 136, 'mailing'),
(136, 136, 'permanent'),
(137, 137, 'mailing'),
(137, 137, 'permanent'),
(138, 138, 'mailing'),
(138, 138, 'permanent'),
(139, 139, 'mailing'),
(139, 139, 'permanent'),
(140, 140, 'mailing'),
(140, 140, 'permanent'),
(141, 141, 'mailing'),
(141, 141, 'permanent'),
(142, 142, 'mailing'),
(142, 142, 'permanent'),
(143, 143, 'mailing'),
(143, 143, 'permanent'),
(144, 144, 'mailing'),
(144, 144, 'permanent'),
(145, 145, 'mailing'),
(145, 145, 'permanent'),
(146, 146, 'mailing'),
(146, 146, 'permanent'),
(147, 147, 'mailing'),
(147, 147, 'permanent'),
(148, 148, 'mailing'),
(148, 148, 'permanent'),
(149, 149, 'mailing'),
(149, 149, 'permanent'),
(150, 150, 'mailing'),
(150, 150, 'permanent');

-- --------------------------------------------------------

--
-- Table structure for table `student_class`
--

CREATE TABLE `student_class` (
  `studentID` int(11) NOT NULL,
  `classID` int(11) NOT NULL,
  `grade` decimal(2,1) DEFAULT NULL,
  `term` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_class`
--

INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES
(1, 1, '4.0', 'Fall', 2017),
(1, 7, '2.0', 'Fall', 2017),
(1, 14, '2.0', 'Fall', 2017),
(1, 21, '4.0', 'Fall', 2017),
(2, 5, '4.0', 'Fall', 2017),
(2, 8, '2.0', 'Fall', 2017),
(2, 13, '2.0', 'Fall', 2017),
(2, 20, '3.0', 'Fall', 2017),
(3, 2, '2.0', 'Fall', 2017),
(3, 8, '4.0', 'Fall', 2017),
(3, 16, '2.0', 'Fall', 2017),
(3, 20, '2.0', 'Fall', 2017),
(4, 4, '2.0', 'Fall', 2017),
(4, 7, '4.0', 'Fall', 2017),
(4, 16, '2.0', 'Fall', 2017),
(4, 21, '2.0', 'Fall', 2017),
(5, 5, '4.0', 'Fall', 2017),
(5, 6, '2.0', 'Fall', 2017),
(5, 13, '3.0', 'Fall', 2017),
(5, 17, '2.0', 'Fall', 2017),
(6, 3, '4.0', 'Fall', 2017),
(6, 10, '3.0', 'Fall', 2017),
(6, 13, '3.0', 'Fall', 2017),
(6, 19, '3.0', 'Fall', 2017),
(7, 3, '2.0', 'Fall', 2017),
(7, 6, '3.0', 'Fall', 2017),
(7, 11, '2.0', 'Fall', 2017),
(7, 21, '4.0', 'Fall', 2017),
(8, 1, '4.0', 'Fall', 2017),
(8, 6, '4.0', 'Fall', 2017),
(8, 12, '3.0', 'Fall', 2017),
(8, 18, '2.0', 'Fall', 2017),
(9, 2, '3.0', 'Fall', 2017),
(9, 6, '4.0', 'Fall', 2017),
(9, 16, '2.0', 'Fall', 2017),
(9, 21, '2.0', 'Fall', 2017),
(10, 5, '4.0', 'Fall', 2017),
(10, 10, '2.0', 'Fall', 2017),
(10, 14, '4.0', 'Fall', 2017),
(10, 19, '4.0', 'Fall', 2017),
(11, 5, '2.0', 'Fall', 2017),
(11, 9, '2.0', 'Fall', 2017),
(11, 16, '3.0', 'Fall', 2017),
(11, 21, '2.0', 'Fall', 2017),
(12, 4, '2.0', 'Fall', 2017),
(12, 7, '4.0', 'Fall', 2017),
(12, 14, '3.0', 'Fall', 2017),
(12, 17, '3.0', 'Fall', 2017),
(13, 4, '3.0', 'Fall', 2017),
(13, 8, '3.0', 'Fall', 2017),
(13, 16, '3.0', 'Fall', 2017),
(13, 19, '3.0', 'Fall', 2017),
(14, 2, '4.0', 'Fall', 2017),
(14, 10, '3.0', 'Fall', 2017),
(14, 11, '2.0', 'Fall', 2017),
(14, 18, '3.0', 'Fall', 2017),
(15, 5, '2.0', 'Fall', 2017),
(15, 10, '4.0', 'Fall', 2017),
(15, 15, '4.0', 'Fall', 2017),
(15, 20, '3.0', 'Fall', 2017),
(16, 4, '4.0', 'Fall', 2017),
(16, 6, '2.0', 'Fall', 2017),
(16, 16, '3.0', 'Fall', 2017),
(16, 18, '3.0', 'Fall', 2017),
(17, 5, '2.0', 'Fall', 2017),
(17, 8, '2.0', 'Fall', 2017),
(17, 16, '2.0', 'Fall', 2017),
(17, 18, '4.0', 'Fall', 2017),
(18, 3, '2.0', 'Fall', 2017),
(18, 7, '3.0', 'Fall', 2017),
(18, 16, '3.0', 'Fall', 2017),
(18, 19, '4.0', 'Fall', 2017),
(19, 4, '4.0', 'Fall', 2017),
(19, 10, '2.0', 'Fall', 2017),
(19, 12, '3.0', 'Fall', 2017),
(19, 17, '2.0', 'Fall', 2017),
(20, 1, '2.0', 'Fall', 2017),
(20, 9, '3.0', 'Fall', 2017),
(20, 11, '3.0', 'Fall', 2017),
(20, 21, '4.0', 'Fall', 2017),
(21, 5, '4.0', 'Fall', 2017),
(21, 10, '4.0', 'Fall', 2017),
(21, 14, '2.0', 'Fall', 2017),
(21, 18, '2.0', 'Fall', 2017),
(22, 4, '4.0', 'Fall', 2017),
(22, 9, '3.0', 'Fall', 2017),
(22, 15, '4.0', 'Fall', 2017),
(22, 18, '2.0', 'Fall', 2017),
(23, 4, '2.0', 'Fall', 2017),
(23, 6, '4.0', 'Fall', 2017),
(23, 16, '2.0', 'Fall', 2017),
(23, 18, '3.0', 'Fall', 2017),
(24, 3, '4.0', 'Fall', 2017),
(24, 10, '3.0', 'Fall', 2017),
(24, 14, '4.0', 'Fall', 2017),
(24, 21, '2.0', 'Fall', 2017),
(25, 4, '4.0', 'Fall', 2017),
(25, 7, '2.0', 'Fall', 2017),
(25, 14, '3.0', 'Fall', 2017),
(25, 20, '2.0', 'Fall', 2017),
(26, 2, '4.0', 'Fall', 2017),
(26, 7, '2.0', 'Fall', 2017),
(26, 14, '3.0', 'Fall', 2017),
(26, 18, '3.0', 'Fall', 2017),
(27, 2, '3.0', 'Fall', 2017),
(27, 10, '3.0', 'Fall', 2017),
(27, 13, '4.0', 'Fall', 2017),
(27, 21, '3.0', 'Fall', 2017),
(28, 3, '3.0', 'Fall', 2017),
(28, 6, '3.0', 'Fall', 2017),
(28, 15, '2.0', 'Fall', 2017),
(28, 17, '4.0', 'Fall', 2017),
(29, 3, '4.0', 'Fall', 2017),
(29, 10, '4.0', 'Fall', 2017),
(29, 13, '2.0', 'Fall', 2017),
(29, 21, '3.0', 'Fall', 2017),
(30, 4, '3.0', 'Fall', 2017),
(30, 8, '4.0', 'Fall', 2017),
(30, 14, '3.0', 'Fall', 2017),
(30, 19, '4.0', 'Fall', 2017),
(31, 3, '2.0', 'Fall', 2017),
(31, 8, '4.0', 'Fall', 2017),
(31, 16, '3.0', 'Fall', 2017),
(31, 19, '3.0', 'Fall', 2017),
(32, 4, '3.0', 'Fall', 2017),
(32, 9, '4.0', 'Fall', 2017),
(32, 12, '4.0', 'Fall', 2017),
(32, 20, '2.0', 'Fall', 2017),
(33, 5, '2.0', 'Fall', 2017),
(33, 10, '4.0', 'Fall', 2017),
(33, 15, '3.0', 'Fall', 2017),
(33, 17, '3.0', 'Fall', 2017),
(34, 5, '4.0', 'Fall', 2017),
(34, 8, '2.0', 'Fall', 2017),
(34, 14, '2.0', 'Fall', 2017),
(34, 17, '3.0', 'Fall', 2017),
(35, 3, '2.0', 'Fall', 2017),
(35, 10, '4.0', 'Fall', 2017),
(35, 15, '3.0', 'Fall', 2017),
(35, 17, '4.0', 'Fall', 2017),
(36, 1, '2.0', 'Fall', 2017),
(36, 10, '2.0', 'Fall', 2017),
(36, 15, '3.0', 'Fall', 2017),
(36, 17, '4.0', 'Fall', 2017),
(37, 4, '3.0', 'Fall', 2017),
(37, 9, '2.0', 'Fall', 2017),
(37, 12, '4.0', 'Fall', 2017),
(37, 20, '2.0', 'Fall', 2017),
(38, 5, '3.0', 'Fall', 2017),
(38, 6, '3.0', 'Fall', 2017),
(38, 12, '4.0', 'Fall', 2017),
(38, 20, '2.0', 'Fall', 2017),
(39, 2, '2.0', 'Fall', 2017),
(39, 9, '4.0', 'Fall', 2017),
(39, 11, '4.0', 'Fall', 2017),
(39, 17, '4.0', 'Fall', 2017),
(40, 2, '4.0', 'Fall', 2017),
(40, 6, '3.0', 'Fall', 2017),
(40, 11, '3.0', 'Fall', 2017),
(40, 19, '3.0', 'Fall', 2017),
(41, 4, '4.0', 'Fall', 2017),
(41, 6, '3.0', 'Fall', 2017),
(41, 16, '2.0', 'Fall', 2017),
(41, 17, '3.0', 'Fall', 2017),
(42, 4, '3.0', 'Fall', 2017),
(42, 7, '4.0', 'Fall', 2017),
(42, 14, '4.0', 'Fall', 2017),
(42, 17, '3.0', 'Fall', 2017),
(43, 2, '4.0', 'Fall', 2017),
(43, 6, '2.0', 'Fall', 2017),
(43, 13, '4.0', 'Fall', 2017),
(43, 21, '4.0', 'Fall', 2017),
(44, 4, '3.0', 'Fall', 2017),
(44, 9, '2.0', 'Fall', 2017),
(44, 14, '2.0', 'Fall', 2017),
(44, 18, '4.0', 'Fall', 2017),
(45, 3, '2.0', 'Fall', 2017),
(45, 9, '3.0', 'Fall', 2017),
(45, 16, '4.0', 'Fall', 2017),
(45, 21, '2.0', 'Fall', 2017),
(46, 5, '4.0', 'Fall', 2017),
(46, 6, '4.0', 'Fall', 2017),
(46, 12, '3.0', 'Fall', 2017),
(46, 21, '2.0', 'Fall', 2017),
(47, 3, '3.0', 'Fall', 2017),
(47, 8, '2.0', 'Fall', 2017),
(47, 13, '4.0', 'Fall', 2017),
(47, 19, '4.0', 'Fall', 2017),
(48, 2, '4.0', 'Fall', 2017),
(48, 9, '4.0', 'Fall', 2017),
(48, 14, '3.0', 'Fall', 2017),
(48, 17, '4.0', 'Fall', 2017),
(49, 1, '3.0', 'Fall', 2017),
(49, 10, '2.0', 'Fall', 2017),
(49, 12, '2.0', 'Fall', 2017),
(49, 18, '2.0', 'Fall', 2017),
(50, 2, '2.0', 'Fall', 2017),
(50, 7, '3.0', 'Fall', 2017),
(50, 16, '3.0', 'Fall', 2017),
(50, 17, '2.0', 'Fall', 2017),
(51, 4, '4.0', 'Fall', 2017),
(51, 9, '2.0', 'Fall', 2017),
(51, 11, '4.0', 'Fall', 2017),
(51, 18, '3.0', 'Fall', 2017),
(52, 3, '4.0', 'Fall', 2017),
(52, 9, '3.0', 'Fall', 2017),
(52, 16, '3.0', 'Fall', 2017),
(52, 20, '3.0', 'Fall', 2017),
(53, 4, '2.0', 'Fall', 2017),
(53, 10, '4.0', 'Fall', 2017),
(53, 12, '2.0', 'Fall', 2017),
(53, 21, '3.0', 'Fall', 2017),
(54, 3, '2.0', 'Fall', 2017),
(54, 8, '4.0', 'Fall', 2017),
(54, 15, '4.0', 'Fall', 2017),
(54, 18, '3.0', 'Fall', 2017),
(55, 3, '2.0', 'Fall', 2017),
(55, 9, '3.0', 'Fall', 2017),
(55, 16, '3.0', 'Fall', 2017),
(55, 17, '3.0', 'Fall', 2017),
(56, 4, '3.0', 'Fall', 2017),
(56, 10, '4.0', 'Fall', 2017),
(56, 13, '4.0', 'Fall', 2017),
(56, 21, '2.0', 'Fall', 2017),
(57, 3, '2.0', 'Fall', 2017),
(57, 7, '4.0', 'Fall', 2017),
(57, 15, '4.0', 'Fall', 2017),
(57, 19, '3.0', 'Fall', 2017),
(58, 1, '3.0', 'Fall', 2017),
(58, 6, '3.0', 'Fall', 2017),
(58, 11, '2.0', 'Fall', 2017),
(58, 17, '4.0', 'Fall', 2017),
(59, 5, '4.0', 'Fall', 2017),
(59, 9, '2.0', 'Fall', 2017),
(59, 12, '2.0', 'Fall', 2017),
(59, 19, '2.0', 'Fall', 2017),
(60, 5, '3.0', 'Fall', 2017),
(60, 10, '3.0', 'Fall', 2017),
(60, 16, '4.0', 'Fall', 2017),
(60, 21, '4.0', 'Fall', 2017),
(61, 5, '2.0', 'Fall', 2017),
(61, 9, '4.0', 'Fall', 2017),
(61, 11, '4.0', 'Fall', 2017),
(61, 20, '4.0', 'Fall', 2017),
(62, 1, '2.0', 'Fall', 2017),
(62, 10, '2.0', 'Fall', 2017),
(62, 13, '4.0', 'Fall', 2017),
(62, 20, '4.0', 'Fall', 2017),
(63, 5, '2.0', 'Fall', 2017),
(63, 9, '2.0', 'Fall', 2017),
(63, 12, '3.0', 'Fall', 2017),
(63, 21, '3.0', 'Fall', 2017),
(64, 3, '4.0', 'Fall', 2017),
(64, 7, '4.0', 'Fall', 2017),
(64, 12, '2.0', 'Fall', 2017),
(64, 20, '4.0', 'Fall', 2017),
(65, 3, '3.0', 'Fall', 2017),
(65, 9, '3.0', 'Fall', 2017),
(65, 14, '3.0', 'Fall', 2017),
(65, 21, '3.0', 'Fall', 2017),
(66, 4, '4.0', 'Fall', 2017),
(66, 6, '2.0', 'Fall', 2017),
(66, 11, '4.0', 'Fall', 2017),
(66, 18, '4.0', 'Fall', 2017),
(67, 2, '4.0', 'Fall', 2017),
(67, 8, '3.0', 'Fall', 2017),
(67, 16, '4.0', 'Fall', 2017),
(67, 19, '4.0', 'Fall', 2017),
(68, 3, '2.0', 'Fall', 2017),
(68, 8, '3.0', 'Fall', 2017),
(68, 16, '2.0', 'Fall', 2017),
(68, 18, '2.0', 'Fall', 2017),
(69, 2, '4.0', 'Fall', 2017),
(69, 8, '2.0', 'Fall', 2017),
(69, 12, '2.0', 'Fall', 2017),
(69, 17, '2.0', 'Fall', 2017),
(70, 5, '2.0', 'Fall', 2017),
(70, 6, '2.0', 'Fall', 2017),
(70, 11, '2.0', 'Fall', 2017),
(70, 17, '4.0', 'Fall', 2017),
(71, 3, '3.0', 'Fall', 2017),
(71, 10, '2.0', 'Fall', 2017),
(71, 14, '2.0', 'Fall', 2017),
(71, 19, '3.0', 'Fall', 2017),
(72, 5, '4.0', 'Fall', 2017),
(72, 8, '2.0', 'Fall', 2017),
(72, 11, '4.0', 'Fall', 2017),
(72, 17, '3.0', 'Fall', 2017),
(73, 3, '4.0', 'Fall', 2017),
(73, 8, '3.0', 'Fall', 2017),
(73, 16, '4.0', 'Fall', 2017),
(73, 17, '4.0', 'Fall', 2017),
(74, 2, '3.0', 'Fall', 2017),
(74, 6, '2.0', 'Fall', 2017),
(74, 16, '4.0', 'Fall', 2017),
(74, 17, '4.0', 'Fall', 2017),
(75, 5, '2.0', 'Fall', 2017),
(75, 9, '2.0', 'Fall', 2017),
(75, 14, '4.0', 'Fall', 2017),
(75, 19, '2.0', 'Fall', 2017),
(76, 2, '2.0', 'Fall', 2017),
(76, 8, '4.0', 'Fall', 2017),
(76, 13, '2.0', 'Fall', 2017),
(76, 21, '3.0', 'Fall', 2017),
(77, 2, '2.0', 'Fall', 2017),
(77, 7, '2.0', 'Fall', 2017),
(77, 15, '4.0', 'Fall', 2017),
(77, 21, '3.0', 'Fall', 2017),
(78, 5, '2.0', 'Fall', 2017),
(78, 10, '3.0', 'Fall', 2017),
(78, 15, '4.0', 'Fall', 2017),
(78, 20, '3.0', 'Fall', 2017),
(79, 3, '2.0', 'Fall', 2017),
(79, 7, '4.0', 'Fall', 2017),
(79, 15, '2.0', 'Fall', 2017),
(79, 20, '4.0', 'Fall', 2017),
(80, 3, '4.0', 'Fall', 2017),
(80, 10, '4.0', 'Fall', 2017),
(80, 11, '4.0', 'Fall', 2017),
(80, 21, '2.0', 'Fall', 2017),
(81, 4, '2.0', 'Fall', 2017),
(81, 8, '2.0', 'Fall', 2017),
(81, 12, '2.0', 'Fall', 2017),
(81, 19, '2.0', 'Fall', 2017),
(82, 5, '4.0', 'Fall', 2017),
(82, 9, '3.0', 'Fall', 2017),
(82, 11, '3.0', 'Fall', 2017),
(82, 17, '2.0', 'Fall', 2017),
(83, 1, '3.0', 'Fall', 2017),
(83, 6, '4.0', 'Fall', 2017),
(83, 14, '2.0', 'Fall', 2017),
(83, 17, '2.0', 'Fall', 2017),
(84, 4, '3.0', 'Fall', 2017),
(84, 6, '2.0', 'Fall', 2017),
(84, 14, '3.0', 'Fall', 2017),
(84, 19, '4.0', 'Fall', 2017),
(85, 4, '4.0', 'Fall', 2017),
(85, 7, '3.0', 'Fall', 2017),
(85, 14, '3.0', 'Fall', 2017),
(85, 21, '3.0', 'Fall', 2017),
(86, 4, '3.0', 'Fall', 2017),
(86, 8, '3.0', 'Fall', 2017),
(86, 13, '2.0', 'Fall', 2017),
(86, 20, '2.0', 'Fall', 2017),
(87, 2, '2.0', 'Fall', 2017),
(87, 6, '2.0', 'Fall', 2017),
(87, 13, '2.0', 'Fall', 2017),
(87, 21, '3.0', 'Fall', 2017),
(88, 1, '4.0', 'Fall', 2017),
(88, 6, '4.0', 'Fall', 2017),
(88, 16, '4.0', 'Fall', 2017),
(88, 21, '4.0', 'Fall', 2017),
(89, 4, '2.0', 'Fall', 2017),
(89, 6, '3.0', 'Fall', 2017),
(89, 14, '4.0', 'Fall', 2017),
(89, 19, '3.0', 'Fall', 2017),
(90, 4, '2.0', 'Fall', 2017),
(90, 10, '2.0', 'Fall', 2017),
(90, 14, '2.0', 'Fall', 2017),
(90, 20, '4.0', 'Fall', 2017),
(91, 5, '4.0', 'Fall', 2017),
(91, 6, '2.0', 'Fall', 2017),
(91, 11, '3.0', 'Fall', 2017),
(91, 18, '2.0', 'Fall', 2017),
(92, 4, '4.0', 'Fall', 2017),
(92, 9, '3.0', 'Fall', 2017),
(92, 13, '4.0', 'Fall', 2017),
(92, 20, '3.0', 'Fall', 2017),
(93, 1, '4.0', 'Fall', 2017),
(93, 9, '4.0', 'Fall', 2017),
(93, 16, '4.0', 'Fall', 2017),
(93, 20, '3.0', 'Fall', 2017),
(94, 1, '2.0', 'Fall', 2017),
(94, 10, '3.0', 'Fall', 2017),
(94, 16, '4.0', 'Fall', 2017),
(94, 21, '3.0', 'Fall', 2017),
(95, 2, '4.0', 'Fall', 2017),
(95, 6, '4.0', 'Fall', 2017),
(95, 12, '4.0', 'Fall', 2017),
(95, 17, '2.0', 'Fall', 2017),
(96, 5, '4.0', 'Fall', 2017),
(96, 6, '2.0', 'Fall', 2017),
(96, 15, '4.0', 'Fall', 2017),
(96, 20, '2.0', 'Fall', 2017),
(97, 3, '4.0', 'Fall', 2017),
(97, 9, '2.0', 'Fall', 2017),
(97, 12, '2.0', 'Fall', 2017),
(97, 21, '3.0', 'Fall', 2017),
(98, 5, '3.0', 'Fall', 2017),
(98, 10, '3.0', 'Fall', 2017),
(98, 15, '2.0', 'Fall', 2017),
(98, 21, '2.0', 'Fall', 2017),
(99, 4, '4.0', 'Fall', 2017),
(99, 6, '2.0', 'Fall', 2017),
(99, 16, '2.0', 'Fall', 2017),
(99, 19, '2.0', 'Fall', 2017),
(100, 1, '4.0', 'Fall', 2017),
(100, 10, '3.0', 'Fall', 2017),
(100, 14, '2.0', 'Fall', 2017),
(100, 19, '2.0', 'Fall', 2017);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `adminRole` tinyint(1) NOT NULL DEFAULT '0',
  `supervisorRole` tinyint(1) NOT NULL DEFAULT '0',
  `committeeRole` tinyint(1) NOT NULL DEFAULT '0',
  `advisorRole` tinyint(1) NOT NULL DEFAULT '0',
  `gaRole` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `name`, `email`, `username`, `password`, `adminRole`, `supervisorRole`, `committeeRole`, `advisorRole`, `gaRole`) VALUES
(1, 'Administrator', 'admin@uark.edu', 'admin', '$2y$10$/NJamPGCJctYmrDIm/0.sO6cbfv5hp1ud1nBmqHw8ghtCa8R65VTu', 1, 1, 1, 1, 1),
(2, 'Jeff Mullins', 'jmullins@uark.edu', 'jmullins', '$2y$10$RRCjo9gOQiNOUUMVYTxaAOAJDSdCOY5hw5YlRc4QBghOW/uzXerkm', 1, 1, 1, 1, 1),
(3, 'Paul Cronan', 'pcronan@uark.edu', 'pcronan', '$2y$10$Ousgk54Ob3iGkUSzqfCMsOD4nTk5vGJRNbG3A3MDG38C/QW1LG35G', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_comment`
--

CREATE TABLE `user_comment` (
  `commentID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `applicationID` int(11) NOT NULL,
  `commentText` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`),
  ADD KEY `stateID` (`stateID`),
  ADD KEY `countryID` (`countryID`);

--
-- Indexes for table `advising`
--
ALTER TABLE `advising`
  ADD PRIMARY KEY (`studentID`,`classID`),
  ADD KEY `classID` (`classID`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`applicationID`),
  ADD KEY `studentID` (`studentID`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`attachmentID`),
  ADD UNIQUE KEY `filename` (`filename`),
  ADD KEY `applicationID` (`applicationID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classID`),
  ADD KEY `roomID` (`roomID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `class_faculty`
--
ALTER TABLE `class_faculty`
  ADD PRIMARY KEY (`classID`,`facultyID`),
  ADD KEY `facultyID` (`facultyID`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`collegeID`),
  ADD KEY `applicationID` (`applicationID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countryID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`facultyID`),
  ADD KEY `roomID` (`roomID`);

--
-- Indexes for table `faculty_request`
--
ALTER TABLE `faculty_request`
  ADD PRIMARY KEY (`requestID`,`facultyID`),
  ADD KEY `facultyID` (`facultyID`);

--
-- Indexes for table `interview_file`
--
ALTER TABLE `interview_file`
  ADD PRIMARY KEY (`fileID`),
  ADD KEY `applicationID` (`applicationID`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `requested_studentID` (`requested_studentID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomID`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`stateID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `countryOfBirth` (`countryOfBirth`);

--
-- Indexes for table `student_address`
--
ALTER TABLE `student_address`
  ADD PRIMARY KEY (`studentID`,`addressID`,`type`),
  ADD KEY `addressID` (`addressID`);

--
-- Indexes for table `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`studentID`,`classID`),
  ADD KEY `classID` (`classID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `user_comment`
--
ALTER TABLE `user_comment`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `applicationID` (`applicationID`),
  ADD KEY `userID` (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `applicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `attachmentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `college`
--
ALTER TABLE `college`
  MODIFY `collegeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `interview_file`
--
ALTER TABLE `interview_file`
  MODIFY `fileID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_comment`
--
ALTER TABLE `user_comment`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`stateID`) REFERENCES `state` (`stateID`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`countryID`) REFERENCES `country` (`countryID`);

--
-- Constraints for table `advising`
--
ALTER TABLE `advising`
  ADD CONSTRAINT `advising_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `advising_ibfk_2` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`);

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints for table `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`);

--
-- Constraints for table `class_faculty`
--
ALTER TABLE `class_faculty`
  ADD CONSTRAINT `class_faculty_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`),
  ADD CONSTRAINT `class_faculty_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `faculty` (`facultyID`);

--
-- Constraints for table `college`
--
ALTER TABLE `college`
  ADD CONSTRAINT `college_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`);

--
-- Constraints for table `faculty_request`
--
ALTER TABLE `faculty_request`
  ADD CONSTRAINT `faculty_request_ibfk_1` FOREIGN KEY (`requestID`) REFERENCES `request` (`requestID`),
  ADD CONSTRAINT `faculty_request_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `faculty` (`facultyID`);

--
-- Constraints for table `interview_file`
--
ALTER TABLE `interview_file`
  ADD CONSTRAINT `interview_file_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`requested_studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`countryOfBirth`) REFERENCES `country` (`countryID`);

--
-- Constraints for table `student_address`
--
ALTER TABLE `student_address`
  ADD CONSTRAINT `student_address_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `student_address_ibfk_2` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`);

--
-- Constraints for table `student_class`
--
ALTER TABLE `student_class`
  ADD CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`);

--
-- Constraints for table `user_comment`
--
ALTER TABLE `user_comment`
  ADD CONSTRAINT `user_comment_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`),
  ADD CONSTRAINT `user_comment_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
