-- DROP DATABASE Statements
DROP DATABASE IF EXISTS `uark`;

-- CREATE DATABASE Statements
CREATE DATABASE `uark` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci;

-- USE Database Statements
USE `uark`;

-- DROP TABLE Statements
DROP TABLE IF EXISTS `user_comment`;
DROP TABLE IF EXISTS `student_class`;
DROP TABLE IF EXISTS `class_instructor`;
DROP TABLE IF EXISTS `instructor`;
DROP TABLE IF EXISTS `class`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `room`;
DROP TABLE IF EXISTS `college`;
DROP TABLE IF EXISTS `attachment`;
DROP TABLE IF EXISTS `application`;
DROP TABLE IF EXISTS `student_address`;
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `state`;
DROP TABLE IF EXISTS `country`;
DROP TABLE IF EXISTS `user`;

-- CREATE TABLE Statements
CREATE TABLE `user` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `username` VARCHAR(15) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`userID`)
);

CREATE TABLE `country` (
  `countryID` CHAR(2) NOT NULL,
  `country` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`countryID`)
);

CREATE TABLE `state` (
  `stateID` CHAR(2) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`stateID`)
);

CREATE TABLE `address` (
  `addressID` INT(11) NOT NULL AUTO_INCREMENT,
  `street1` VARCHAR(50) NOT NULL,
  `street2` VARCHAR(50) DEFAULT NULL,
  `city` VARCHAR(50) NOT NULL,
  `stateID` CHAR(2) NOT NULL,
  `zipCode` VARCHAR(5) NOT NULL,
  `countryID` CHAR(2) NOT NULL,
  PRIMARY KEY (`addressID`),
  FOREIGN KEY (`stateID`) REFERENCES `state`(`stateID`),
  FOREIGN KEY (`countryID`) REFERENCES `country`(`countryID`)
);

CREATE TABLE `student` (
  `studentID` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(30) NOT NULL,
  `middleName` VARCHAR(30) DEFAULT NULL,
  `lastName` VARCHAR(30) NOT NULL,
  `preferredName` VARCHAR(90) DEFAULT NULL,
  `primaryEmail` VARCHAR(100) NOT NULL,
  `secondaryEmail` VARCHAR(100) DEFAULT NULL,
  `primaryPhone` VARCHAR(15) NOT NULL,
  `secondaryPhone` VARCHAR(15) DEFAULT NULL,
  `socialSecurityNumber` VARCHAR(11) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `countryOfBirth` CHAR(2) NOT NULL,
  `ethnicity` VARCHAR(50) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `citizenship` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`studentID`),
  FOREIGN KEY (`countryOfBirth`) REFERENCES `country`(`countryID`)
);

CREATE TABLE `student_address` (
  `studentID` INT(11) NOT NULL,
  `addressID` INT(11) NOT NULL,
  `type` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`studentID`, `addressID`, `type`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`),
  FOREIGN KEY (`addressID`) REFERENCES `address`(`addressID`)
);

CREATE TABLE `application` (
  `applicationID` INT(11) NOT NULL AUTO_INCREMENT,
  `studentID` INT(11) NOT NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4) NOT NULL,
  `program` VARCHAR(25) NOT NULL,
  `concentration` VARCHAR(50) NOT NULL,
  `reqScholarship` BOOLEAN NOT NULL DEFAULT 0,
  `previousApp` BOOLEAN NOT NULL DEFAULT 0,
  `previousAppDate` VARCHAR(25) DEFAULT NULL,
  `previousEnrollment` BOOLEAN NOT NULL DEFAULT 0,
  `previousEnrollmentDate` VARCHAR(25) DEFAULT NULL,
  `previousEnrollmentStatus` VARCHAR(25) DEFAULT NULL,
  `undergradGPA` DECIMAL(3,2) NOT NULL,
  `juniorseniorGPA` DECIMAL(3,2) NOT NULL,
  `currentEmployer` VARCHAR(50) DEFAULT NULL,
  `timeAtCurrentEmployer` DATE DEFAULT NULL,
  `gmat` BOOLEAN NOT NULL DEFAULT 0,
  `gmatTestDate` DATE DEFAULT NULL,
  `gmatQScore` SMALLINT DEFAULT NULL,
  `gmatVScore` SMALLINT DEFAULT NULL,
  `gmatTScore` SMALLINT DEFAULT NULL,
  `gre` BOOLEAN NOT NULL DEFAULT 0,
  `greTestDate` DATE DEFAULT NULL,
  `greQScore` SMALLINT DEFAULT NULL,
  `greVScore` SMALLINT DEFAULT NULL,
  `greTScore` SMALLINT DEFAULT NULL,
  `toeflOnline` BOOLEAN NOT NULL DEFAULT 0,
  `toeflPaper` BOOLEAN NOT NULL DEFAULT 0,
  `toeflTestDate` DATE DEFAULT NULL,
  `toeflOnlineScore` SMALLINT DEFAULT NULL,
  `toeflPaperScore` SMALLINT DEFAULT NULL,
  `tse` BOOLEAN NOT NULL DEFAULT 0,
  `tseTestDate` DATE DEFAULT NULL,
  `tseScore` SMALLINT DEFAULT NULL,
  `offerStatus` VARCHAR(25) NOT NULL DEFAULT 'Undecided',
  `assistantshipStatus` VARCHAR(25) DEFAULT NULL,
  `applicantResponse` VARCHAR(25) DEFAULT NULL,
  `applicationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicationID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`)
);

CREATE TABLE `attachment` (
  `attachmentID` INT(11) NOT NULL AUTO_INCREMENT,
  `applicationID` INT(11) NOT NULL,
  `documentType` VARCHAR(20) NOT NULL,
  `filename` CHAR(32) NOT NULL UNIQUE,
  PRIMARY KEY (`attachmentID`),
  FOREIGN KEY (`applicationID`) REFERENCES `application`(`applicationID`)
);

CREATE TABLE `college` (
  `collegeID` INT(11) NOT NULL AUTO_INCREMENT,
  `applicationID` INT(11) NOT NULL,
  `collegeName` VARCHAR(50) NOT NULL,
  `dateStarted` DATE NOT NULL,
  `dateEnded` DATE NOT NULL,
  `gpa` DECIMAL(3,2) NOT NULL,
  `hoursEarned` SMALLINT NOT NULL,
  `hoursEnrolled` SMALLINT NOT NULL,
  `degree` VARCHAR(50) NOT NULL,
  `major` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`collegeID`),
  FOREIGN KEY (`applicationID`) REFERENCES `application`(`applicationID`)
);

CREATE TABLE `room` (
  `roomID` INT(11) NOT NULL AUTO_INCREMENT,
  `building` CHAR(4) NOT NULL,
  `roomNumber` CHAR(4) NOT NULL,
  PRIMARY KEY (`roomID`)
);

CREATE TABLE `course` (
  `courseID` VARCHAR(10) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `hours` SMALLINT NOT NULL,
  `offered` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`courseID`)
);

CREATE TABLE `class` (
  `classID` INT(11) NOT NULL AUTO_INCREMENT,
  `section` SMALLINT NOT NULL DEFAULT 1,
  `day` VARCHAR(7) NOT NULL,
  `startTime` TIME NOT NULL,
  `endTime` TIME NOT NULL,
  `roomID` INT(11) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `instructionMode` CHAR(2) NOT NULL DEFAULT 'P',
  `status` VARCHAR(10) NOT NULL DEFAULT 'Open',
  `courseID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`classID`),
  FOREIGN KEY (`roomID`) REFERENCES `room`(`roomID`),
  FOREIGN KEY (`courseID`) REFERENCES `course`(`courseID`)
);

CREATE TABLE `instructor` (
  `instructorID` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(30) NOT NULL,
  `lastName` VARCHAR(30) NOT NULL,
  `title` VARCHAR(50) NULL,
  `department` VARCHAR(25) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NULL,
  `roomID` INT(11) NOT NULL,
  PRIMARY KEY (`instructorID`),
  FOREIGN KEY (`roomID`) REFERENCES `room`(`roomID`)
);

CREATE TABLE `class_instructor` (
  `classID` INT(11) NOT NULL,
  `instructorID` INT(11) NOT NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4) NOT NULL,
  PRIMARY KEY (`classID`, `instructorID`),
  FOREIGN KEY (`classID`) REFERENCES `class`(`classID`),
  FOREIGN KEY (`instructorID`) REFERENCES `instructor`(`instructorID`)
);

CREATE TABLE `student_class` (
  `studentID` INT(11) NOT NULL,
  `classID` INT(11) NOT NULL,
  `grade` DECIMAL(2,1) NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4) NOT NULL,
  PRIMARY KEY (`studentID`, `classID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`),
  FOREIGN KEY (`classID`) REFERENCES `class`(`classID`)
);

CREATE TABLE `user_comment` (
  `commentID` INT(11) AUTO_INCREMENT,
  `userID` INT(11) NOT NULL,
  `applicationID` INT(11) NOT NULL,
  `commentText` TEXT,
  PRIMARY KEY (`commentID`),
  FOREIGN KEY (`applicationID`) REFERENCES `application`(`applicationID`),
  FOREIGN KEY (`userID`) REFERENCES `user`(`userID`)
);

CREATE TABLE `advising` (
  `studentID` INT(11) NOT NULL,
  `classID` INT(11) NOT NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4),
  `date` DATE NOT NULL,
  `comments` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`studentID`, `classID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`),
  FOREIGN KEY (`classID`) REFERENCES `class`(`classID`)
);

-- User Insert Statements
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Anne Tucker', 'atucker0@addtoany.com', 'atucker0', 'FcRwiE0zOxj');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Tina Owens', 'towens1@list-manage.com', 'towens1', '4PWkuryoFzp9');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Carol Jenkins', 'cjenkins2@oracle.com', 'cjenkins2', 'IX7RIMjYao');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Sandra Knight', 'sknight3@chicagotribune.com', 'sknight3', 'FeZQPkFAPG9X');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Nicholas Morales', 'nmorales4@furl.net', 'nmorales4', 'FBBKehpP');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Margaret Garrett', 'mgarrett5@house.gov', 'mgarrett5', 'JlSmXTlQh');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Earl Smith', 'esmith6@multiply.com', 'esmith6', 'cHOj4cH0l');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Larry Martinez', 'lmartinez7@nasa.gov', 'lmartinez7', 'z1R3qVyHwKOy');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Karen Mcdonald', 'kmcdonald8@example.com', 'kmcdonald8', 'ml6wKlXi0UQ');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Cheryl Alexander', 'calexander9@360.cn', 'calexander9', 'iV95lo4Ujk');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Nicole Daniels', 'ndanielsa@dropbox.com', 'ndanielsa', 'R2QDg0CNWQ');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Anthony Hayes', 'ahayesb@dot.gov', 'ahayesb', 's4UIfhUBsg4');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Todd Weaver', 'tweaverc@economist.com', 'tweaverc', 'zYnIzG');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Cynthia Hayes', 'chayesd@deliciousdays.com', 'chayesd', 'qyHL8wWtboYi');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Shawn Reynolds', 'sreynoldse@ocn.ne.jp', 'sreynoldse', 'mmOWc383qm5f');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Laura Johnson', 'ljohnsonf@alibaba.com', 'ljohnsonf', 'Me7SchwRyc');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Theresa Patterson', 'tpattersong@shinystat.com', 'tpattersong', 'eHoGUq');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Janet Bryant', 'jbryanth@home.pl', 'jbryanth', 'YlRgPbzV4LC');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Martin Montgomery', 'mmontgomeryi@gmpg.org', 'mmontgomeryi', 'ceHpN2Y1LS');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Benjamin Barnes', 'bbarnesj@hubpages.com', 'bbarnesj', 'HMWFK7R0V');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Ralph Gonzales', 'rgonzalesk@cafepress.com', 'rgonzalesk', '1vFIeCq');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Steven Cox', 'scoxl@gmpg.org', 'scoxl', 'rqDVW6');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Linda Black', 'lblackm@newsvine.com', 'lblackm', '42lIgHBig6wK');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Marilyn Foster', 'mfostern@ihg.com', 'mfostern', 'JrwaXZNVtVH');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Brenda Dixon', 'bdixono@ning.com', 'bdixono', 'Dhb4WXeoxshq');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Robert Ruiz', 'rruizp@google.it', 'rruizp', 'KVqYldDX');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Brenda Walker', 'bwalkerq@google.nl', 'bwalkerq', 'HGnOnk');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Tina Murray', 'tmurrayr@51.la', 'tmurrayr', '0jUtL4p');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Kathy Kim', 'kkims@auda.org.au', 'kkims', '90p3nhC');
INSERT INTO `user` (`name`, `email`, `username`, `password`) VALUES ('Judy Ellis', 'jellist@smugmug.com', 'jellist', 'ikaZqjdiLA');

-- Country Insert Statements
INSERT INTO `country` VALUES ('AF', 'Afghanistan');
INSERT INTO `country` VALUES ('AL', 'Albania');
INSERT INTO `country` VALUES ('DZ', 'Algeria');
INSERT INTO `country` VALUES ('AS', 'American Samoa');
INSERT INTO `country` VALUES ('AD', 'Andorra');
INSERT INTO `country` VALUES ('AO', 'Angola');
INSERT INTO `country` VALUES ('AI', 'Anguilla');
INSERT INTO `country` VALUES ('AQ', 'Antarctica');
INSERT INTO `country` VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `country` VALUES ('AR', 'Argentina');
INSERT INTO `country` VALUES ('AM', 'Armenia');
INSERT INTO `country` VALUES ('AW', 'Aruba');
INSERT INTO `country` VALUES ('AU', 'Australia');
INSERT INTO `country` VALUES ('AT', 'Austria');
INSERT INTO `country` VALUES ('AZ', 'Azerbaijan');
INSERT INTO `country` VALUES ('BS', 'Bahamas');
INSERT INTO `country` VALUES ('BH', 'Bahrain');
INSERT INTO `country` VALUES ('BD', 'Bangladesh');
INSERT INTO `country` VALUES ('BB', 'Barbados');
INSERT INTO `country` VALUES ('BY', 'Belarus');
INSERT INTO `country` VALUES ('BE', 'Belgium');
INSERT INTO `country` VALUES ('BZ', 'Belize');
INSERT INTO `country` VALUES ('BJ', 'Benin');
INSERT INTO `country` VALUES ('BM', 'Bermuda');
INSERT INTO `country` VALUES ('BT', 'Bhutan');
INSERT INTO `country` VALUES ('BO', 'Bolivia');
INSERT INTO `country` VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO `country` VALUES ('BW', 'Botswana');
INSERT INTO `country` VALUES ('BV', 'Bouvet Island');
INSERT INTO `country` VALUES ('BR', 'Brazil');
INSERT INTO `country` VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO `country` VALUES ('BN', 'Brunei Darussalam');
INSERT INTO `country` VALUES ('BG', 'Bulgaria');
INSERT INTO `country` VALUES ('BF', 'Burkina Faso');
INSERT INTO `country` VALUES ('BI', 'Burundi');
INSERT INTO `country` VALUES ('KH', 'Cambodia');
INSERT INTO `country` VALUES ('CM', 'Cameroon');
INSERT INTO `country` VALUES ('CA', 'Canada');
INSERT INTO `country` VALUES ('CV', 'Cape Verde');
INSERT INTO `country` VALUES ('KY', 'Cayman Islands');
INSERT INTO `country` VALUES ('CF', 'Central African Republic');
INSERT INTO `country` VALUES ('TD', 'Chad');
INSERT INTO `country` VALUES ('CL', 'Chile');
INSERT INTO `country` VALUES ('CN', 'China');
INSERT INTO `country` VALUES ('CX', 'Christmas Island');
INSERT INTO `country` VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO `country` VALUES ('CO', 'Colombia');
INSERT INTO `country` VALUES ('KM', 'Comoros');
INSERT INTO `country` VALUES ('CG', 'Congo');
INSERT INTO `country` VALUES ('CK', 'Cook Islands');
INSERT INTO `country` VALUES ('CR', 'Costa Rica');
INSERT INTO `country` VALUES ('HR', 'Croatia (Hrvatska)');
INSERT INTO `country` VALUES ('CU', 'Cuba');
INSERT INTO `country` VALUES ('CY', 'Cyprus');
INSERT INTO `country` VALUES ('CZ', 'Czech Republic');
INSERT INTO `country` VALUES ('DK', 'Denmark');
INSERT INTO `country` VALUES ('DJ', 'Djibouti');
INSERT INTO `country` VALUES ('DM', 'Dominica');
INSERT INTO `country` VALUES ('DO', 'Dominican Republic');
INSERT INTO `country` VALUES ('TP', 'East Timor');
INSERT INTO `country` VALUES ('EC', 'Ecuador');
INSERT INTO `country` VALUES ('EG', 'Egypt');
INSERT INTO `country` VALUES ('SV', 'El Salvador');
INSERT INTO `country` VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `country` VALUES ('ER', 'Eritrea');
INSERT INTO `country` VALUES ('EE', 'Estonia');
INSERT INTO `country` VALUES ('ET', 'Ethiopia');
INSERT INTO `country` VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO `country` VALUES ('FO', 'Faroe Islands');
INSERT INTO `country` VALUES ('FJ', 'Fiji');
INSERT INTO `country` VALUES ('FI', 'Finland');
INSERT INTO `country` VALUES ('FR', 'France');
INSERT INTO `country` VALUES ('FX', 'France, Metropolitan');
INSERT INTO `country` VALUES ('GF', 'French Guiana');
INSERT INTO `country` VALUES ('PF', 'French Polynesia');
INSERT INTO `country` VALUES ('TF', 'French Southern Territories');
INSERT INTO `country` VALUES ('GA', 'Gabon');
INSERT INTO `country` VALUES ('GM', 'Gambia');
INSERT INTO `country` VALUES ('GE', 'Georgia');
INSERT INTO `country` VALUES ('DE', 'Germany');
INSERT INTO `country` VALUES ('GH', 'Ghana');
INSERT INTO `country` VALUES ('GI', 'Gibraltar');
INSERT INTO `country` VALUES ('GK', 'Guernsey');
INSERT INTO `country` VALUES ('GR', 'Greece');
INSERT INTO `country` VALUES ('GL', 'Greenland');
INSERT INTO `country` VALUES ('GD', 'Grenada');
INSERT INTO `country` VALUES ('GP', 'Guadeloupe');
INSERT INTO `country` VALUES ('GU', 'Guam');
INSERT INTO `country` VALUES ('GT', 'Guatemala');
INSERT INTO `country` VALUES ('GN', 'Guinea');
INSERT INTO `country` VALUES ('GW', 'Guinea-Bissau');
INSERT INTO `country` VALUES ('GY', 'Guyana');
INSERT INTO `country` VALUES ('HT', 'Haiti');
INSERT INTO `country` VALUES ('HM', 'Heard and McDonald Islands');
INSERT INTO `country` VALUES ('HN', 'Honduras');
INSERT INTO `country` VALUES ('HK', 'Hong Kong');
INSERT INTO `country` VALUES ('HU', 'Hungary');
INSERT INTO `country` VALUES ('IS', 'Iceland');
INSERT INTO `country` VALUES ('IN', 'India');
INSERT INTO `country` VALUES ('IM', 'Isle of Man');
INSERT INTO `country` VALUES ('ID', 'Indonesia');
INSERT INTO `country` VALUES ('IR', 'Iran');
INSERT INTO `country` VALUES ('IQ', 'Iraq');
INSERT INTO `country` VALUES ('IE', 'Ireland');
INSERT INTO `country` VALUES ('IL', 'Israel');
INSERT INTO `country` VALUES ('IT', 'Italy');
INSERT INTO `country` VALUES ('CI', 'Ivory Coast');
INSERT INTO `country` VALUES ('JE', 'Jersey');
INSERT INTO `country` VALUES ('JM', 'Jamaica');
INSERT INTO `country` VALUES ('JP', 'Japan');
INSERT INTO `country` VALUES ('JO', 'Jordan');
INSERT INTO `country` VALUES ('KZ', 'Kazakhstan');
INSERT INTO `country` VALUES ('KE', 'Kenya');
INSERT INTO `country` VALUES ('KI', 'Kiribati');
INSERT INTO `country` VALUES ('KP', 'North Korea');
INSERT INTO `country` VALUES ('KR', 'South Korea');
INSERT INTO `country` VALUES ('XK', 'Kosovo');
INSERT INTO `country` VALUES ('KW', 'Kuwait');
INSERT INTO `country` VALUES ('KG', 'Kyrgyzstan');
INSERT INTO `country` VALUES ('LA', 'Laos');
INSERT INTO `country` VALUES ('LV', 'Latvia');
INSERT INTO `country` VALUES ('LB', 'Lebanon');
INSERT INTO `country` VALUES ('LS', 'Lesotho');
INSERT INTO `country` VALUES ('LR', 'Liberia');
INSERT INTO `country` VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO `country` VALUES ('LI', 'Liechtenstein');
INSERT INTO `country` VALUES ('LT', 'Lithuania');
INSERT INTO `country` VALUES ('LU', 'Luxembourg');
INSERT INTO `country` VALUES ('MO', 'Macau');
INSERT INTO `country` VALUES ('MK', 'Macedonia');
INSERT INTO `country` VALUES ('MG', 'Madagascar');
INSERT INTO `country` VALUES ('MW', 'Malawi');
INSERT INTO `country` VALUES ('MY', 'Malaysia');
INSERT INTO `country` VALUES ('MV', 'Maldives');
INSERT INTO `country` VALUES ('ML', 'Mali');
INSERT INTO `country` VALUES ('MT', 'Malta');
INSERT INTO `country` VALUES ('MH', 'Marshall Islands');
INSERT INTO `country` VALUES ('MQ', 'Martinique');
INSERT INTO `country` VALUES ('MR', 'Mauritania');
INSERT INTO `country` VALUES ('MU', 'Mauritius');
INSERT INTO `country` VALUES ('TY', 'Mayotte');
INSERT INTO `country` VALUES ('MX', 'Mexico');
INSERT INTO `country` VALUES ('FM', 'Federated States of Micronesia');
INSERT INTO `country` VALUES ('MD', 'Republic of Moldova');
INSERT INTO `country` VALUES ('MC', 'Monaco');
INSERT INTO `country` VALUES ('MN', 'Mongolia');
INSERT INTO `country` VALUES ('ME', 'Montenegro');
INSERT INTO `country` VALUES ('MS', 'Montserrat');
INSERT INTO `country` VALUES ('MA', 'Morocco');
INSERT INTO `country` VALUES ('MZ', 'Mozambique');
INSERT INTO `country` VALUES ('MM', 'Myanmar');
INSERT INTO `country` VALUES ('NA', 'Namibia');
INSERT INTO `country` VALUES ('NR', 'Nauru');
INSERT INTO `country` VALUES ('NP', 'Nepal');
INSERT INTO `country` VALUES ('NL', 'Netherlands');
INSERT INTO `country` VALUES ('AN', 'Netherlands Antilles');
INSERT INTO `country` VALUES ('NC', 'New Caledonia');
INSERT INTO `country` VALUES ('NZ', 'New Zealand');
INSERT INTO `country` VALUES ('NI', 'Nicaragua');
INSERT INTO `country` VALUES ('NE', 'Niger');
INSERT INTO `country` VALUES ('NG', 'Nigeria');
INSERT INTO `country` VALUES ('NU', 'Niue');
INSERT INTO `country` VALUES ('NF', 'Norfolk Island');
INSERT INTO `country` VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO `country` VALUES ('NO', 'Norway');
INSERT INTO `country` VALUES ('OM', 'Oman');
INSERT INTO `country` VALUES ('PK', 'Pakistan');
INSERT INTO `country` VALUES ('PW', 'Palau');
INSERT INTO `country` VALUES ('PS', 'Palestine');
INSERT INTO `country` VALUES ('PA', 'Panama');
INSERT INTO `country` VALUES ('PG', 'Papua New Guinea');
INSERT INTO `country` VALUES ('PY', 'Paraguay');
INSERT INTO `country` VALUES ('PE', 'Peru');
INSERT INTO `country` VALUES ('PH', 'Philippines');
INSERT INTO `country` VALUES ('PN', 'Pitcairn');
INSERT INTO `country` VALUES ('PL', 'Poland');
INSERT INTO `country` VALUES ('PT', 'Portugal');
INSERT INTO `country` VALUES ('PR', 'Puerto Rico');
INSERT INTO `country` VALUES ('QA', 'Qatar');
INSERT INTO `country` VALUES ('RE', 'Reunion');
INSERT INTO `country` VALUES ('RO', 'Romania');
INSERT INTO `country` VALUES ('RU', 'Russia');
INSERT INTO `country` VALUES ('RW', 'Rwanda');
INSERT INTO `country` VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO `country` VALUES ('LC', 'Saint Lucia');
INSERT INTO `country` VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO `country` VALUES ('WS', 'Samoa');
INSERT INTO `country` VALUES ('SM', 'San Marino');
INSERT INTO `country` VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO `country` VALUES ('SA', 'Saudi Arabia');
INSERT INTO `country` VALUES ('SN', 'Senegal');
INSERT INTO `country` VALUES ('RS', 'Serbia');
INSERT INTO `country` VALUES ('SC', 'Seychelles');
INSERT INTO `country` VALUES ('SL', 'Sierra Leone');
INSERT INTO `country` VALUES ('SG', 'Singapore');
INSERT INTO `country` VALUES ('SK', 'Slovakia');
INSERT INTO `country` VALUES ('SI', 'Slovenia');
INSERT INTO `country` VALUES ('SB', 'Solomon Islands');
INSERT INTO `country` VALUES ('SO', 'Somalia');
INSERT INTO `country` VALUES ('ZA', 'South Africa');
INSERT INTO `country` VALUES ('GS', 'South Georgia South Sandwich Islands');
INSERT INTO `country` VALUES ('ES', 'Spain');
INSERT INTO `country` VALUES ('LK', 'Sri Lanka');
INSERT INTO `country` VALUES ('SH', 'St. Helena');
INSERT INTO `country` VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO `country` VALUES ('SD', 'Sudan');
INSERT INTO `country` VALUES ('SR', 'Suriname');
INSERT INTO `country` VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `country` VALUES ('SZ', 'Swaziland');
INSERT INTO `country` VALUES ('SE', 'Sweden');
INSERT INTO `country` VALUES ('CH', 'Switzerland');
INSERT INTO `country` VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO `country` VALUES ('TW', 'Taiwan');
INSERT INTO `country` VALUES ('TJ', 'Tajikistan');
INSERT INTO `country` VALUES ('TZ', 'Tanzania');
INSERT INTO `country` VALUES ('TH', 'Thailand');
INSERT INTO `country` VALUES ('TG', 'Togo');
INSERT INTO `country` VALUES ('TK', 'Tokelau');
INSERT INTO `country` VALUES ('TO', 'Tonga');
INSERT INTO `country` VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO `country` VALUES ('TN', 'Tunisia');
INSERT INTO `country` VALUES ('TR', 'Turkey');
INSERT INTO `country` VALUES ('TM', 'Turkmenistan');
INSERT INTO `country` VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO `country` VALUES ('TV', 'Tuvalu');
INSERT INTO `country` VALUES ('UG', 'Uganda');
INSERT INTO `country` VALUES ('UA', 'Ukraine');
INSERT INTO `country` VALUES ('AE', 'United Arab Emirates');
INSERT INTO `country` VALUES ('GB', 'United Kingdom');
INSERT INTO `country` VALUES ('US', 'United States');
INSERT INTO `country` VALUES ('UM', 'United States Minor Outlying Islands');
INSERT INTO `country` VALUES ('UY', 'Uruguay');
INSERT INTO `country` VALUES ('UZ', 'Uzbekistan');
INSERT INTO `country` VALUES ('VU', 'Vanuatu');
INSERT INTO `country` VALUES ('VA', 'Vatican City');
INSERT INTO `country` VALUES ('VE', 'Venezuela');
INSERT INTO `country` VALUES ('VN', 'Vietnam');
INSERT INTO `country` VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO `country` VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO `country` VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO `country` VALUES ('EH', 'Western Sahara');
INSERT INTO `country` VALUES ('YE', 'Yemen');
INSERT INTO `country` VALUES ('ZR', 'Zaire');
INSERT INTO `country` VALUES ('ZM', 'Zambia');
INSERT INTO `country` VALUES ('ZW', 'Zimbabwe');

-- State Insert Statements
INSERT INTO `state` VALUES ('AA','U.S. Military');
INSERT INTO `state` VALUES ('AE','U.S. Military');
INSERT INTO `state` VALUES ('AL','Alabama');
INSERT INTO `state` VALUES ('AP','U.S. Military');
INSERT INTO `state` VALUES ('AK','Alaska');
INSERT INTO `state` VALUES ('AS','American Samoa');
INSERT INTO `state` VALUES ('AZ','Arizona');
INSERT INTO `state` VALUES ('AR','Arkansas');
INSERT INTO `state` VALUES ('CA','California');
INSERT INTO `state` VALUES ('CO','Colorado');
INSERT INTO `state` VALUES ('CT','Connecticut');
INSERT INTO `state` VALUES ('DE','Delaware');
INSERT INTO `state` VALUES ('DC','District of Columbia');
INSERT INTO `state` VALUES ('FM','Federated States of Micronesia');
INSERT INTO `state` VALUES ('FL','Florida');
INSERT INTO `state` VALUES ('GA','Georgia');
INSERT INTO `state` VALUES ('GU','Guam');
INSERT INTO `state` VALUES ('HI','Hawaii');
INSERT INTO `state` VALUES ('ID','Idaho');
INSERT INTO `state` VALUES ('IL','Illinois');
INSERT INTO `state` VALUES ('IN','Indiana');
INSERT INTO `state` VALUES ('IA','Iowa');
INSERT INTO `state` VALUES ('KS','Kansas');
INSERT INTO `state` VALUES ('KY','Kentucky');
INSERT INTO `state` VALUES ('LA','Louisiana');
INSERT INTO `state` VALUES ('ME','Maine');
INSERT INTO `state` VALUES ('MH','Marshall Islands');
INSERT INTO `state` VALUES ('MD','Maryland');
INSERT INTO `state` VALUES ('MA','Massachusetts');
INSERT INTO `state` VALUES ('MI','Michigan');
INSERT INTO `state` VALUES ('MN','Minnesota');
INSERT INTO `state` VALUES ('MS','Mississippi');
INSERT INTO `state` VALUES ('MO','Missouri');
INSERT INTO `state` VALUES ('MT','Montana');
INSERT INTO `state` VALUES ('NE','Nebraska');
INSERT INTO `state` VALUES ('NV','Nevada');
INSERT INTO `state` VALUES ('NH','New Hampshire');
INSERT INTO `state` VALUES ('NJ','New Jersey');
INSERT INTO `state` VALUES ('NM','New Mexico');
INSERT INTO `state` VALUES ('NY','New York');
INSERT INTO `state` VALUES ('NC','North Carolina');
INSERT INTO `state` VALUES ('ND','North Dakota');
INSERT INTO `state` VALUES ('MP','Northern Mariana Islands');
INSERT INTO `state` VALUES ('OH','Ohio');
INSERT INTO `state` VALUES ('OK','Oklahoma');
INSERT INTO `state` VALUES ('OR','Oregon');
INSERT INTO `state` VALUES ('PW','Palau');
INSERT INTO `state` VALUES ('PA','Pennsylvania');
INSERT INTO `state` VALUES ('PR','Puerto Rico');
INSERT INTO `state` VALUES ('RI','Rhode Island');
INSERT INTO `state` VALUES ('SC','South Carolina');
INSERT INTO `state` VALUES ('SD','South Dakota');
INSERT INTO `state` VALUES ('TN','Tennessee');
INSERT INTO `state` VALUES ('TX','Texas');
INSERT INTO `state` VALUES ('UT','Utah');
INSERT INTO `state` VALUES ('VT','Vermont');
INSERT INTO `state` VALUES ('VI','Virgin Islands');
INSERT INTO `state` VALUES ('VA','Virginia');
INSERT INTO `state` VALUES ('WA','Washington');
INSERT INTO `state` VALUES ('WV','West Virginia');
INSERT INTO `state` VALUES ('WI','Wisconsin');
INSERT INTO `state` VALUES ('WY','Wyoming');

-- Address Insert Statements
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('803 Glacier Hill Alley', null, 'Lubbock', 'TX', '79491', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('86 Prentice Hill', null, 'Saint Paul', 'MN', '55188', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('7 Hovde Lane', null, 'Detroit', 'MI', '48232', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('624 Miller Way', null, 'Dallas', 'TX', '75260', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9 Bunting Point', null, 'Indianapolis', 'IN', '46216', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('4688 Erie Trail', null, 'Montgomery', 'AL', '36125', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('7 Vahlen Center', null, 'Norcross', 'GA', '30092', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9 Northwestern Lane', null, 'Huntington', 'WV', '25721', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('26261 Delaware Trail', null, 'El Paso', 'TX', '79945', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('00 Esker Point', null, 'Lake Worth', 'FL', '33462', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('8 Bobwhite Drive', null, 'Chicago', 'IL', '60636', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('006 Carberry Trail', null, 'Albany', 'GA', '31704', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('14 Florence Road', null, 'Washington', 'DC', '20260', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9040 Mesta Hill', '213', 'Worcester', 'MA', '01605', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('3931 Bobwhite Road', null, 'Grand Rapids', 'MI', '49505', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('8053 Pennsylvania Parkway', '13', 'San Diego', 'CA', '92145', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('3 Comanche Center', null, 'Reno', 'NV', '89595', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('8776 Bowman Court', '3982', 'Denver', 'CO', '80204', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('79 2nd Pass', null, 'Minneapolis', 'MN', '55407', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('30584 Roxbury Parkway', null, 'Honolulu', 'HI', '96840', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('450 Elmside Alley', null, 'Lexington', 'KY', '40515', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6 Loomis Plaza', null, 'Lubbock', 'TX', '79452', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('59 Barby Point', '43227', 'Washington', 'DC', '20046', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('5 Everett Crossing', null, 'Des Moines', 'IA', '50305', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('75333 Welch Terrace', null, 'San Francisco', 'CA', '94142', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('5023 Mallard Alley', null, 'Houston', 'TX', '77060', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('424 Myrtle Circle', null, 'Colorado Springs', 'CO', '80945', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('30 Blue Bill Park Pass', '63', 'Amarillo', 'TX', '79159', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('442 Rockefeller Alley', null, 'San Bernardino', 'CA', '92424', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('523 Maple Wood Place', null, 'Des Moines', 'IA', '50393', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9464 Corry Circle', null, 'San Antonio', 'TX', '78210', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('407 Upham Hill', null, 'Hartford', 'CT', '06152', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('5213 Ruskin Road', null, 'Irvine', 'CA', '92612', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('4 Sunfield Circle', null, 'El Paso', 'TX', '88553', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('0334 Dahle Park', '39', 'Los Angeles', 'CA', '90035', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('67 Wayridge Pass', null, 'New York City', 'NY', '10079', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6 Waubesa Street', null, 'Santa Fe', 'NM', '87592', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('427 Schmedeman Pass', '381', 'Lexington', 'KY', '40546', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('1307 West Point', null, 'Louisville', 'KY', '40205', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('77 5th Trail', null, 'Toledo', 'OH', '43635', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('03139 Michigan Lane', null, 'Toledo', 'OH', '43635', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('71 Elgar Drive', null, 'Sacramento', 'CA', '94297', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('924 Arizona Road', null, 'Reston', 'VA', '22096', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6685 Stephen Street', null, 'San Francisco', 'CA', '94177', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('694 Golf Course Court', null, 'New Orleans', 'LA', '70160', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('7257 Golf Parkway', null, 'San Antonio', 'TX', '78291', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('288 Arrowood Center', null, 'Salt Lake City', 'UT', '84110', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('56974 Hoepker Lane', '780', 'Abilene', 'TX', '79699', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('18987 Schiller Parkway', null, 'Pittsburgh', 'PA', '15215', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9844 Toban Road', null, 'Huntington Beach', 'CA', '92648', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('03 Colorado Court', '06151', 'Rochester', 'NY', '14683', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('3 Ruskin Court', null, 'Spokane', 'WA', '99215', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('0122 Ryan Trail', null, 'Santa Monica', 'CA', '90410', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6501 Ilene Junction', '40219', 'Shawnee Mission', 'KS', '66215', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('50785 American Ash Avenue', null, 'Lincoln', 'NE', '68583', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('92 Hollow Ridge Crossing', null, 'Madison', 'WI', '53710', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('03 Marquette Crossing', null, 'Miami', 'FL', '33153', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('62126 Dixon Plaza', '989', 'Austin', 'TX', '78732', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('0901 Raven Park', null, 'Dallas', 'TX', '75342', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('69 3rd Park', null, 'Glendale', 'CA', '91205', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('259 2nd Drive', null, 'Fullerton', 'CA', '92835', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('5 Evergreen Drive', null, 'Omaha', 'NE', '68110', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6 Northfield Trail', null, 'Santa Fe', 'NM', '87505', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('2444 Waubesa Circle', null, 'Frederick', 'MD', '21705', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9 International Court', null, 'Sacramento', 'CA', '95818', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('213 Grover Center', null, 'Tulsa', 'OK', '74126', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('810 Haas Plaza', null, 'College Station', 'TX', '77844', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('89055 Valley Edge Junction', null, 'Pittsburgh', 'PA', '15261', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('45 Messerschmidt Place', null, 'Great Neck', 'NY', '11024', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('68 Commercial Street', null, 'Dallas', 'TX', '75397', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('2083 Dawn Court', null, 'Spartanburg', 'SC', '29305', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('5251 Red Cloud Terrace', null, 'Savannah', 'GA', '31410', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('39527 Almo Junction', null, 'Bakersfield', 'CA', '93305', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('34 Pearson Center', null, 'Charlotte', 'NC', '28247', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('767 Thackeray Place', null, 'Milwaukee', 'WI', '53234', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('682 Katie Street', '988', 'Ocala', 'FL', '34479', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9060 Claremont Pass', null, 'Minneapolis', 'MN', '55417', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('87 Ruskin Drive', null, 'Philadelphia', 'PA', '19178', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('8 Hanson Hill', null, 'Atlanta', 'GA', '30340', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('81 Merrick Terrace', null, 'New Haven', 'CT', '06510', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('817 Mayer Road', null, 'Evansville', 'IN', '47719', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('3234 Hayes Trail', null, 'Galveston', 'TX', '77554', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('196 Artisan Drive', '76198', 'Indianapolis', 'IN', '46202', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6 Sunnyside Lane', null, 'Tallahassee', 'FL', '32399', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('965 3rd Parkway', null, 'Jacksonville', 'FL', '32277', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('80059 Bultman Court', null, 'Dearborn', 'MI', '48126', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('36 Ridge Oak Court', '13', 'Panama City', 'FL', '32405', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('719 Forest Way', null, 'San Bernardino', 'CA', '92424', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('85 Grim Trail', null, 'Midland', 'MI', '48670', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('363 Karstens Plaza', null, 'Springfield', 'MA', '01105', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('1 Algoma Lane', null, 'Saint Louis', 'MO', '63126', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('8 Pankratz Circle', null, 'Albuquerque', 'NM', '87190', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('94 Old Gate Hill', null, 'Harrisburg', 'PA', '17105', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6783 Transport Park', null, 'Sioux Falls', 'SD', '57188', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('4698 Warbler Street', null, 'Louisville', 'KY', '40210', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6 Fordem Court', null, 'Brooklyn', 'NY', '11236', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('2602 Grim Way', null, 'Reno', 'NV', '89510', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6234 Glacier Hill Road', null, 'Fort Smith', 'AR', '72916', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('212 Bowman Park', '09560', 'Sacramento', 'CA', '95838', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('1 International Avenue', null, 'New Haven', 'CT', '06505', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('0837 Merrick Plaza', null, 'Waterbury', 'CT', '06721', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('69796 Boyd Avenue', null, 'San Jose', 'CA', '95113', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9 Stephen Place', null, 'Atlanta', 'GA', '30328', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9 Crescent Oaks Center', null, 'New York City', 'NY', '10131', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('8121 Vermont Road', null, 'Pueblo', 'CO', '81015', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('1 Rieder Alley', null, 'Tampa', 'FL', '33605', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('56 Columbus Alley', null, 'Allentown', 'PA', '18105', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('8420 Hauk Hill', null, 'Houston', 'TX', '77050', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('0 South Hill', null, 'Honolulu', 'HI', '96820', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('48 Magdeline Avenue', null, 'San Antonio', 'TX', '78215', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('71 Susan Circle', null, 'Naperville', 'IL', '60567', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('49 Sheridan Alley', null, 'Huntsville', 'AL', '35805', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('74 Esch Junction', '81', 'Miami', 'FL', '33142', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('30 Dottie Alley', null, 'Amarillo', 'TX', '79182', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('39 Grasskamp Street', null, 'Charleston', 'WV', '25336', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('88357 Elgar Hill', null, 'Boulder', 'CO', '80310', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('916 Columbus Road', null, 'Colorado Springs', 'CO', '80935', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9150 Bay Point', '14', 'Sacramento', 'CA', '95828', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('44309 Crest Line Road', null, 'Montgomery', 'AL', '36114', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('96195 Randy Lane', '3', 'Tulsa', 'OK', '74116', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('9 Hazelcrest Alley', null, 'Washington', 'DC', '20057', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('1 Service Avenue', null, 'Washington', 'DC', '20557', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('35 Anderson Circle', null, 'Denver', 'CO', '80291', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('365 Vidon Avenue', null, 'Silver Spring', 'MD', '20904', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6 Sutherland Circle', null, 'Arlington', 'VA', '22212', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('475 Schlimgen Point', null, 'Odessa', 'TX', '79769', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('297 Bunting Circle', '4', 'Hialeah', 'FL', '33018', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('729 Sunnyside Road', null, 'Washington', 'DC', '20414', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('4 Thackeray Street', '71', 'Atlanta', 'GA', '30358', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('313 Oxford Court', null, 'Shreveport', 'LA', '71137', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('71695 Elka Park', null, 'Boca Raton', 'FL', '33487', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('394 Vernon Hill', null, 'Round Rock', 'TX', '78682', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('1 Farragut Park', null, 'Little Rock', 'AR', '72215', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('1741 Browning Place', null, 'Detroit', 'MI', '48232', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('33 Cherokee Alley', null, 'Cincinnati', 'OH', '45264', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('5715 Onsgard Plaza', null, 'Mount Vernon', 'NY', '10557', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('92 Lukken Court', null, 'Ocala', 'FL', '34479', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('2008 Johnson Court', null, 'Buffalo', 'NY', '14215', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('7 Kingsford Drive', null, 'Arlington', 'VA', '22217', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('82 North Plaza', null, 'Winston Salem', 'NC', '27110', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('4987 Spohn Pass', null, 'San Diego', 'CA', '92105', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('757 Anderson Trail', null, 'Sioux Falls', 'SD', '57188', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('49526 Lillian Pass', null, 'Portland', 'OR', '97201', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('76 Twin Pines Street', null, 'San Antonio', 'TX', '78278', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('6 Hanson Lane', null, 'Naples', 'FL', '34108', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('986 Portage Court', null, 'Houston', 'TX', '77293', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('51140 Cambridge Way', null, 'Santa Barbara', 'CA', '93150', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('52431 Comanche Lane', null, 'Los Angeles', 'CA', '90025', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('04619 Manitowish Crossing', null, 'Evansville', 'IN', '47712', 'US');
INSERT INTO `address` (`street1`, `street2`, `city`, `stateID`, `zipCode`, `countryID`) VALUES ('447 Corben Way', null, 'Jersey City', 'NJ', '07305', 'US');

-- Student Insert Statements
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Dennis', 'Wallace', 'Dennis Wallace', 'dwallace0@noaa.gov', null, 1510613882, 3581859232, 455399359, '1981-12-03', 'PT', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jessica', 'Williamson', 'Jessica Williamson', 'jwilliamson1@sphinn.com', 'jwilliamson1@artisteer.com', 1098038047, 9695095264, 742888449, '1982-03-27', 'UA', 'Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Cynthia', 'Walker', 'Cynthia Walker', 'cwalker2@unesco.org', null, 4019201100, 8367375177, 222738861, '1993-08-18', 'AR', 'White Non-Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Joshua', 'Gilbert', 'Joshua Gilbert', 'jgilbert3@businessinsider.com', null, 7311564399, 4616930211, 556141263, '1983-01-06', 'RU', 'Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('William', 'Robinson', 'William Robinson', 'wrobinson4@webs.com', null, 9795915521, 8399914622, 313145418, '1988-12-15', 'AL', 'White Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Kathy', 'Adams', 'Kathy Adams', 'kadams5@cbsnews.com', null, 5174942348, 7479827137, 154602151, '1982-02-06', 'TH', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Phyllis', 'Moreno', 'Phyllis Moreno', 'pmoreno6@acquirethisname.com', null, 5480870417, 8692690515, 711812129, '1989-08-19', 'MY', 'Black Non-Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jonathan', 'Walker', 'Jonathan Walker', 'jwalker7@usnews.com', null, 7216819302, 1279488300, 882529858, '1986-05-18', 'PL', 'White Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Dennis', 'Morrison', 'Dennis Morrison', 'dmorrison8@sciencedaily.com', null, 8008070970, 1228483682, 377003220, '1988-08-08', 'ID', 'White Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jerry', 'Banks', 'Jerry Banks', 'jbanks9@blog.com', null, 6682106060, 7302188725, 587251526, '1989-08-05', 'ID', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Stephanie', 'Moore', 'Stephanie Moore', 'smoorea@51.la', null, 6694179607, 5412850698, 216349272, '1980-07-27', 'TH', 'White Non-Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Alan', 'Taylor', 'Alan Taylor', 'ataylorb@nifty.com', null, 6320891242, 7525861209, 220583214, '1986-12-08', 'US', 'White Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Kathryn', 'Alvarez', 'Kathryn Alvarez', 'kalvarezc@cpanel.net', null, 3959099397, 2092609827, 662972879, '1984-10-11', 'ID', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Judith', 'Perry', 'Judith Perry', 'jperryd@whitehouse.gov', null, 1847775991, 5495270800, 297025620, '1982-09-05', 'CN', 'Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Rachel', 'Stanley', 'Rachel Stanley', 'rstanleye@patch.com', null, 1141218150, 5336313043, 711139715, '1993-11-04', 'JP', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Kimberly', 'Hicks', 'Kimberly Hicks', 'khicksf@gnu.org', null, 1425059283, 9830722453, 807455569, '1993-01-24', 'AM', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Doris', 'Mitchell', 'Doris Mitchell', 'dmitchellg@ed.gov', null, 2896000811, 6425000466, 945250576, '1992-07-21', 'RU', 'Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Dennis', 'Stephens', null, 'dstephensh@washington.edu', null, 6219173396, null, 441076858, '1980-06-06', 'TN', 'Black Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Paula', 'Wagner', null, 'pwagneri@businesswire.com', null, 8963642224, null, 777616977, '1985-12-25', 'IL', 'Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Daniel', 'Ortiz', null, 'dortizj@tuttocitta.it', null, 7881603208, null, 496653264, '1984-04-24', 'CN', 'Alaskan Native or American Indian', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Carlos', 'Fisher', 'Carlos Fisher', 'cfisherk@sfgate.com', null, 6548152307, 7021209882, 923992268, '1989-09-07', 'US', 'Asian or Pacific Islander', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Alice', 'Ray', 'Alice Ray', 'arayl@unc.edu', null, 6582563694, 1410537735, 332327404, '1994-09-04', 'PT', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Shirley', 'Ray', 'Shirley Ray', 'sraym@auda.org.au', null, 9081215544, 3230433435, 339827326, '1988-04-26', 'GR', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Henry', 'Medina', 'Henry Medina', 'hmedinan@army.mil', 'hmedinan@sphinn.com', 2963947662, 3824480817, 720466299, '1990-04-19', 'CO', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Kevin', 'Porter', null, 'kportero@bizjournals.com', null, 6665790814, null, 240662205, '1990-12-22', 'ZA', 'Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Roger', 'Chavez', null, 'rchavezp@seattletimes.com', null, 6849451083, null, 247456238, '1989-10-16', 'CZ', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Aaron', 'Fuller', 'Aaron Fuller', 'afullerq@epa.gov', null, 9527134394, 7542513116, 258900644, '1994-07-19', 'JP', 'Black Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jesse', 'Arnold', 'Jesse Arnold', 'jarnoldr@linkedin.com', null, 2309663992, 2276586892, 978760012, '1980-01-14', 'ID', 'Alaskan Native or American Indian', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Harold', 'Peterson', null, 'hpetersons@hud.gov', null, 7325266966, null, 458617252, '1990-03-03', 'CN', 'Black Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Alan', 'Mendoza', 'Alan Mendoza', 'amendozat@discovery.com', null, 9610393994, 9700524504, 108058044, '1991-10-29', 'PH', 'Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Julia', 'Rogers', 'Julia Rogers', 'jrogersu@nyu.edu', null, 8867553329, 8387732769, 828077389, '1985-01-11', 'CN', 'Black Non-Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Susan', 'Owens', null, 'sowensv@digg.com', null, 2168882349, null, 805939729, '1994-10-13', 'AT', 'Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Willie', 'Graham', null, 'wgrahamw@php.net', null, 9451220509, null, 265985358, '1992-09-04', 'ID', 'Asian or Pacific Islander', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Lawrence', 'Ryan', 'Lawrence Ryan', 'lryanx@arstechnica.com', null, 3783710331, 8084502345, 917741745, '1991-06-17', 'UZ', 'Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jason', 'Reyes', 'Jason Reyes', 'jreyesy@senate.gov', null, 9457522113, 7297479982, 936870444, '1991-11-08', 'RU', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Ann', 'Taylor', null, 'ataylorz@bloglines.com', 'ataylorz@cyberchimps.com', 5518564355, null, 756084915, '1983-09-14', 'CN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Matthew', 'Brooks', 'Matthew Brooks', 'mbrooks10@de.vu', null, 1057433616, 9543206378, 225728216, '1992-07-12', 'KN', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Donald', 'Dean', 'Donald Dean', 'ddean11@sbwire.com', null, 5215472828, 3968729306, 208400503, '1987-02-26', 'TH', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Paula', 'Hansen', null, 'phansen12@harvard.edu', null, 6503234542, null, 596178839, '1988-11-20', 'BR', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Shirley', 'Olson', 'Shirley Olson', 'solson13@buzzfeed.com', null, 7388708009, 9222083257, 638019704, '1984-02-25', 'PT', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Justin', 'Jenkins', 'Justin Jenkins', 'jjenkins14@theglobeandmail.com', null, 4236992164, 9807855682, 112585595, '1993-01-29', 'CN', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Louis', 'Hill', 'Louis Hill', 'lhill15@hubpages.com', 'lhill15@biglobe.ne.jp', 8786002834, 1142465306, 747967033, '1990-03-12', 'VN', 'Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Julia', 'Freeman', 'Julia Freeman', 'jfreeman16@list-manage.com', null, 9329272191, 3905077172, 482742277, '1980-10-11', 'PH', 'White Non-Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Emily', 'Pierce', 'Emily Pierce', 'epierce17@shop-pro.jp', null, 4891121683, 5524361927, 312745059, '1994-01-12', 'ZA', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Larry', 'Taylor', 'Larry Taylor', 'ltaylor18@salon.com', null, 7793648780, 4299715470, 191048196, '1990-04-24', 'BR', 'Asian or Pacific Islander', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Aaron', 'Powell', null, 'apowell19@uiuc.edu', 'apowell19@webmd.com', 3043329054, null, 780843209, '1986-10-24', 'BY', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Dorothy', 'Green', 'Dorothy Green', 'dgreen1a@biblegateway.com', null, 7243998678, 5717607909, 160833465, '1990-04-19', 'RU', 'Alaskan Native or American Indian', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Daniel', 'Cruz', null, 'dcruz1b@imdb.com', null, 4184390404, null, 180480982, '1987-04-26', 'CN', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Kenneth', 'Cook', 'Kenneth Cook', 'kcook1c@cam.ac.uk', null, 5865694715, 7869576819, 656883394, '1982-06-09', 'DK', 'Black Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Betty', 'Gibson', 'Betty Gibson', 'bgibson1d@fc2.com', null, 9992373477, 3690577282, 658637935, '1982-01-03', 'ID', 'Alaskan Native or American Indian', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Janice', 'Reyes', null, 'jreyes1e@webs.com', null, 7532882316, null, 152526595, '1982-04-25', 'CN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Janice', 'Lane', 'Janice Lane', 'jlane1f@usa.gov', 'jlane1f@google.com.au', 1910454377, 1524174237, 338127280, '1982-11-10', 'PH', 'Alaskan Native or American Indian', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Keith', 'Fields', 'Keith Fields', 'kfields1g@blinklist.com', null, 3738451044, 3789921286, 920428930, '1994-12-01', 'PL', 'Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Cheryl', 'Gray', 'Cheryl Gray', 'cgray1h@sina.com.cn', null, 9874409491, 2636317379, 986283741, '1987-06-28', 'MM', 'Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Joseph', 'Freeman', null, 'jfreeman1i@dot.gov', null, 4789043235, null, 928851292, '1984-09-14', 'CN', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Marilyn', 'Lopez', 'Marilyn Lopez', 'mlopez1j@cbsnews.com', null, 2638083922, 3395596688, 119758631, '1991-07-03', 'UA', 'Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Phyllis', 'Ferguson', null, 'pferguson1k@phoca.cz', null, 4858654553, null, 971150015, '1988-04-29', 'CN', 'Black Non-Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Joe', 'Andrews', 'Joe Andrews', 'jandrews1l@reverbnation.com', null, 4795443053, 4658674910, 575615563, '1983-04-19', 'BR', 'Black Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Lawrence', 'Smith', null, 'lsmith1m@hugedomains.com', null, 7570269402, null, 541251481, '1991-10-01', 'AR', 'Asian or Pacific Islander', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Louis', 'Nichols', null, 'lnichols1n@163.com', null, 8545393980, null, 444655731, '1983-03-27', 'NO', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Denise', 'Crawford', 'Denise Crawford', 'dcrawford1o@berkeley.edu', null, 7155376610, 5899032206, 113627232, '1984-07-26', 'CN', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Joan', 'Campbell', 'Joan Campbell', 'jcampbell1p@buzzfeed.com', null, 4673971576, 3070680176, 401229725, '1984-02-21', 'PT', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Marie', 'Elliott', 'Marie Elliott', 'melliott1q@mozilla.org', null, 6582217519, 6611294966, 193695582, '1992-02-13', 'CN', 'Black Non-Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Rachel', 'Little', 'Rachel Little', 'rlittle1r@slideshare.net', null, 1442846817, 5571353831, 731937021, '1994-06-21', 'CN', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('David', 'Larson', 'David Larson', 'dlarson1s@economist.com', null, 7647733573, 6950894082, 726633180, '1985-03-13', 'TH', 'White Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Julia', 'Gordon', null, 'jgordon1t@state.tx.us', null, 8181946366, null, 645741705, '1980-09-26', 'ID', 'White Non-Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jimmy', 'Fuller', 'Jimmy Fuller', 'jfuller1u@patch.com', null, 9486379805, 1050878250, 574078803, '1981-11-16', 'SE', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Billy', 'Carroll', 'Billy Carroll', 'bcarroll1v@dagondesign.com', null, 7996899292, 8696904807, 550493204, '1990-01-19', 'GR', 'Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Steven', 'Berry', 'Steven Berry', 'sberry1w@printfriendly.com', null, 1861423535, 1850902373, 118424916, '1988-09-11', 'CN', 'White Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Stephen', 'Peterson', null, 'speterson1x@trellian.com', null, 5417560908, null, 890720105, '1986-05-18', 'CU', 'White Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Laura', 'Wheeler', 'Laura Wheeler', 'lwheeler1y@about.com', null, 1971815000, 9287619042, 547097974, '1980-06-12', 'MX', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Judith', 'Fowler', 'Judith Fowler', 'jfowler1z@lulu.com', 'jfowler1z@state.gov', 3118817426, 8203574111, 580496147, '1986-06-18', 'SE', 'Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Joseph', 'Wright', null, 'jwright20@icq.com', null, 7108991909, null, 428087786, '1988-07-19', 'CN', 'Black Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Denise', 'Ruiz', null, 'druiz21@techcrunch.com', null, 7010746054, null, 588267329, '1991-01-26', 'CN', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Debra', 'Gonzalez', 'Debra Gonzalez', 'dgonzalez22@soundcloud.com', null, 9158631756, 5760845458, 796279405, '1990-07-01', 'CN', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Brandon', 'Kennedy', 'Brandon Kennedy', 'bkennedy23@amazon.de', 'bkennedy23@berkeley.edu', 3110287490, 7920970671, 224234942, '1983-04-29', 'CN', 'White Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Marilyn', 'Martinez', 'Marilyn Martinez', 'mmartinez24@google.ca', null, 5914646607, 8393671326, 824742185, '1981-04-24', 'FR', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Christina', 'Rivera', null, 'crivera25@jigsy.com', null, 2977685500, null, 251502390, '1990-05-04', 'PL', 'Alaskan Native or American Indian', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Martha', 'Bailey', 'Martha Bailey', 'mbailey26@unc.edu', null, 4221154076, 2380172210, 152815839, '1991-05-02', 'NG', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Steven', 'Baker', 'Steven Baker', 'sbaker27@taobao.com', null, 5076205026, 1846980511, 376919705, '1984-04-03', 'UZ', 'Alaskan Native or American Indian', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jacqueline', 'Hansen', 'Jacqueline Hansen', 'jhansen28@ft.com', 'jhansen28@redcross.org', 4796321360, 3777743168, 770410353, '1987-03-24', 'US', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Willie', 'Hicks', 'Willie Hicks', 'whicks29@sciencedaily.com', null, 1098662367, 5375956180, 117312627, '1986-08-17', 'CN', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Doris', 'Harper', 'Doris Harper', 'dharper2a@gmpg.org', null, 4113446451, 5874953658, 141925975, '1989-07-11', 'CN', 'Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jane', 'Sanchez', 'Jane Sanchez', 'jsanchez2b@zimbio.com', null, 4525303270, 4110124615, 196230576, '1994-03-18', 'MA', 'Black Non-Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Wanda', 'Howard', null, 'whoward2c@addthis.com', null, 6366418403, null, 372691663, '1990-08-17', 'PH', 'Black Non-Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Susan', 'Lewis', 'Susan Lewis', 'slewis2d@cpanel.net', null, 2980682055, 1703690445, 110676538, '1983-03-24', 'CU', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Willie', 'Harris', 'Willie Harris', 'wharris2e@360.cn', null, 6286926691, 5872076671, 529477728, '1987-01-31', 'JP', 'White Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Paula', 'George', null, 'pgeorge2f@miibeian.gov.cn', 'pgeorge2f@wufoo.com', 7841938596, null, 931653208, '1984-02-16', 'CN', 'White Non-Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Ralph', 'Diaz', 'Ralph Diaz', 'rdiaz2g@imageshack.us', null, 4198422622, 8763259259, 206322288, '1985-04-22', 'ID', 'White Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Steve', 'Fuller', null, 'sfuller2h@omniture.com', null, 8966401321, null, 234976303, '1986-01-01', 'BR', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Sean', 'Robertson', 'Sean Robertson', 'srobertson2i@squarespace.com', null, 2861191258, 8751081860, 470366745, '1994-03-19', 'UG', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Keith', 'Barnes', 'Keith Barnes', 'kbarnes2j@de.vu', null, 1169856319, 1011445454, 435417034, '1986-10-17', 'MX', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jeremy', 'Diaz', 'Jeremy Diaz', 'jdiaz2k@hp.com', null, 3453570152, 6974179149, 869803138, '1993-12-21', 'CN', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Ashley', 'Hughes', null, 'ahughes2l@amazon.co.uk', null, 5226190600, null, 994073595, '1980-01-17', 'CY', 'Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Elizabeth', 'Bryant', 'Elizabeth Bryant', 'ebryant2m@google.co.jp', null, 9930056182, 5574275625, 399542011, '1987-10-19', 'RU', 'Black Non-Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Clarence', 'Jones', null, 'cjones2n@addthis.com', 'cjones2n@usgs.gov', 7309181556, null, 174139835, '1991-07-25', 'FI', 'White Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Keith', 'Reyes', null, 'kreyes2o@altervista.org', null, 3706883546, null, 963283892, '1981-09-20', 'CZ', 'Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Harold', 'Young', 'Harold Young', 'hyoung2p@reuters.com', null, 2765362860, 4604340598, 824407053, '1981-03-10', 'CN', 'Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jane', 'Wallace', 'Jane Wallace', 'jwallace2q@multiply.com', null, 1598258233, 7496336944, 920954529, '1992-06-12', 'ID', 'White Non-Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Karen', 'Foster', 'Karen Foster', 'kfoster2r@tmall.com', null, 4526119619, 9651897879, 433212882, '1991-03-03', 'MA', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Anne', 'Dixon', 'Anne Dixon', 'adixon2s@huffingtonpost.com', null, 6366856294, 3168048529, 153969325, '1992-10-13', 'TH', 'Asian or Pacific Islander', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Ronald', 'Powell', null, 'rpowell2t@cargocollective.com', null, 5069999462, null, 593129125, '1988-10-03', 'CN', 'Black Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jeremy', 'Hill', 'Jeremy Hill', 'jhill2u@etsy.com', null, 2484277889, 7587125389, 644598325, '1990-02-21', 'RU', 'Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Joyce', 'Ray', 'Joyce Ray', 'jray2v@facebook.com', null, 1306068824, 8374544736, 702141346, '1988-12-11', 'VN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Aaron', 'Murray', null, 'amurray2w@bigcartel.com', null, 3024366744, null, 852456446, '1994-01-23', 'MK', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Brian', 'Porter', 'Brian Porter', 'bporter2x@dailymotion.com', 'bporter2x@tinyurl.com', 9270597395, 3336091088, 652644304, '1993-11-05', 'ZA', 'White Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('William', 'Howard', 'William Howard', 'whoward2y@behance.net', 'whoward2y@pagesperso-orange.fr', 2601891295, 3820879263, 792547600, '1987-02-04', 'ID', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('William', 'Morales', 'William Morales', 'wmorales2z@nyu.edu', null, 1862402558, 6976923293, 874172523, '1993-10-19', 'LT', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Charles', 'Daniels', null, 'cdaniels30@themeforest.net', null, 6697323124, null, 346250469, '1986-07-04', 'CA', 'Black Non-Hispanic', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Maria', 'Mitchell', 'Maria Mitchell', 'mmitchell31@goo.ne.jp', null, 5992005481, 8040339807, 908048110, '1985-08-25', 'AR', 'Black Non-Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Kelly', 'Sims', 'Kelly Sims', 'ksims32@marriott.com', null, 4825904219, 6622695477, 319307270, '1982-03-29', 'CA', 'Black Non-Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Theresa', 'Price', 'Theresa Price', 'tprice33@miibeian.gov.cn', null, 5665374712, 5550749874, 787493198, '1992-09-22', 'SE', 'Alaskan Native or American Indian', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Rebecca', 'Robinson', 'Rebecca Robinson', 'rrobinson34@economist.com', null, 1315257006, 7261001199, 566553761, '1990-10-18', 'FR', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Cynthia', 'Evans', 'Cynthia Evans', 'cevans35@fastcompany.com', 'cevans35@yellowbook.com', 1231168821, 9671509451, 804673332, '1987-07-20', 'HN', 'Hispanic', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Stephanie', 'Rose', 'Stephanie Rose', 'srose36@edublogs.org', null, 3877710654, 2811747124, 479708892, '1989-12-27', 'VE', 'Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Anne', 'Fox', 'Anne Fox', 'afox37@networkadvertising.org', null, 5144599181, 7781623409, 382368726, '1984-12-30', 'CN', 'Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Carl', 'Wilson', 'Carl Wilson', 'cwilson38@theguardian.com', null, 4646952590, 5114371841, 472165665, '1984-03-02', 'RU', 'Asian or Pacific Islander', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Martin', 'Ray', null, 'mray39@zdnet.com', null, 6159667353, null, 557867373, '1982-10-13', 'CZ', 'Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Robin', 'Fisher', null, 'rfisher3a@toplist.cz', null, 1609161880, null, 614690795, '1988-01-19', 'KZ', 'White Non-Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jessica', 'Myers', null, 'jmyers3b@drupal.org', null, 8456523804, null, 165713968, '1980-09-06', 'RS', 'Alaskan Native or American Indian', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Randy', 'Thomas', 'Randy Thomas', 'rthomas3c@youtube.com', null, 8547676517, 2632180670, 943652139, '1986-05-04', 'CU', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Diana', 'Romero', null, 'dromero3d@techcrunch.com', null, 4537778682, null, 550012260, '1980-04-28', 'ID', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Matthew', 'Palmer', 'Matthew Palmer', 'mpalmer3e@economist.com', 'mpalmer3e@marketwatch.com', 9547004558, 7949814539, 800406990, '1981-05-23', 'PT', 'Asian or Pacific Islander', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Melissa', 'Ortiz', 'Melissa Ortiz', 'mortiz3f@gnu.org', null, 4751998984, 2017997875, 435124701, '1986-11-09', 'ID', 'Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jean', 'Bailey', 'Jean Bailey', 'jbailey3g@hexun.com', null, 9301993500, 9190038610, 753462925, '1984-05-25', 'GR', 'White Non-Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Nicole', 'Davis', null, 'ndavis3h@buzzfeed.com', null, 2690004636, null, 610093863, '1987-05-27', 'CN', 'Alaskan Native or American Indian', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Christopher', 'Baker', null, 'cbaker3i@slashdot.org', null, 3598569825, null, 341033754, '1994-08-18', 'PL', 'Alaskan Native or American Indian', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Norma', 'Stone', null, 'nstone3j@storify.com', null, 5249944644, null, 139846624, '1992-04-19', 'TH', 'Black Non-Hispanic', 'Female', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Diane', 'Torres', 'Diane Torres', 'dtorres3k@w3.org', null, 2347073459, 7039405087, 386258318, '1992-12-08', 'ID', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Douglas', 'Holmes', 'Douglas Holmes', 'dholmes3l@webnode.com', null, 9898627608, 5530477871, 982779238, '1984-08-28', 'CN', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Henry', 'Vasquez', 'Henry Vasquez', 'hvasquez3m@bloomberg.com', null, 3952558974, 5269053404, 478146270, '1981-07-22', 'FR', 'White Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Joshua', 'Green', null, 'jgreen3n@alexa.com', null, 1585574457, null, 398623610, '1983-02-15', 'ID', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Anthony', 'Hill', 'Anthony Hill', 'ahill3o@elegantthemes.com', 'ahill3o@paypal.com', 2788724244, 6410956198, 192644207, '1982-04-24', 'SE', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Kathryn', 'Castillo', 'Kathryn Castillo', 'kcastillo3p@plala.or.jp', 'kcastillo3p@live.com', 4411828648, 4711139709, 653495870, '1983-03-11', 'HR', 'Asian or Pacific Islander', 'Female', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Anthony', 'Fuller', 'Anthony Fuller', 'afuller3q@oracle.com', null, 9210294931, 7733481058, 370483820, '1982-04-02', 'PE', 'Asian or Pacific Islander', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Phillip', 'Edwards', 'Phillip Edwards', 'pedwards3r@irs.gov', 'pedwards3r@europa.eu', 3925300788, 1587281702, 106588164, '1987-07-27', 'ID', 'Alaskan Native or American Indian', 'Male', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Patrick', 'Gutierrez', null, 'pgutierrez3s@wordpress.com', null, 7238461108, null, 586747827, '1994-06-06', 'ID', 'Alaskan Native or American Indian', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Patricia', 'Hawkins', 'Patricia Hawkins', 'phawkins3t@flickr.com', null, 9852149423, 2774716104, 573961180, '1984-12-08', 'PH', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Billy', 'Sims', 'Billy Sims', 'bsims3u@is.gd', 'bsims3u@tumblr.com', 6103920953, 9671760463, 512013924, '1986-11-19', 'PA', 'Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jose', 'Gibson', 'Jose Gibson', 'jgibson3v@paginegialle.it', null, 4316656107, 4859150751, 691750973, '1994-09-26', 'NG', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Martha', 'Miller', 'Martha Miller', 'mmiller3w@jiathis.com', null, 7434155844, 6336259772, 628128662, '1985-09-26', 'BO', 'Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jane', 'Carr', 'Jane Carr', 'jcarr3x@bandcamp.com', null, 9006567219, 7234237469, 933159660, '1981-12-29', 'PH', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Eugene', 'Fernandez', 'Eugene Fernandez', 'efernandez3y@toplist.cz', null, 5931757194, 9002875180, 484781041, '1984-03-02', 'YE', 'Asian or Pacific Islander', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Wayne', 'Kelly', 'Wayne Kelly', 'wkelly3z@wisc.edu', null, 7080714374, 6306444009, 850812240, '1992-02-02', 'FR', 'Black Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Ernest', 'Olson', 'Ernest Olson', 'eolson40@paypal.com', null, 6179247531, 9255671061, 100546556, '1985-05-16', 'KM', 'Black Non-Hispanic', 'Male', 'Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Jean', 'Turner', 'Jean Turner', 'jturner41@google.fr', 'jturner41@ovh.net', 5166673455, 2712001050, 832807144, '1982-12-15', 'ID', 'Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Elizabeth', 'Thompson', null, 'ethompson42@icq.com', null, 6185017721, null, 744228960, '1989-07-11', 'SV', 'Asian or Pacific Islander', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Roger', 'Wood', null, 'rwood43@utexas.edu', null, 9391302640, null, 905311829, '1991-04-08', 'NG', 'White Non-Hispanic', 'Male', 'Non-Resident Alien');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Sarah', 'Day', 'Sarah Day', 'sday44@psu.edu', null, 9740375044, 6519396926, 420055822, '1986-02-20', 'ID', 'Hispanic', 'Female', 'U.S. Citizen');
INSERT INTO `student` (`firstName`, `lastName`, `preferredName`, `primaryEmail`, `secondaryEmail`, `primaryPhone`, `secondaryPhone`, `socialSecurityNumber`, `dateOfBirth`, `countryOfBirth`, `ethnicity`, `gender`, `citizenship`) VALUES ('Janet', 'Young', 'Janet Young', 'jyoung45@hc360.com', null, 2808314993, 8299070957, 283542904, '1983-12-17', 'CN', 'Alaskan Native or American Indian', 'Female', 'Resident Alien');

-- Student Address Insert Statements
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (1, 1, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (2, 2, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (3, 3, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (4, 4, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (5, 5, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (6, 6, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (7, 7, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (8, 8, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (9, 9, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (10, 10, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (11, 11, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (12, 12, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (13, 13, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (14, 14, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (15, 15, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (16, 16, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (17, 17, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (18, 18, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (19, 19, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (20, 20, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (21, 21, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (22, 22, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (23, 23, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (24, 24, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (25, 25, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (26, 26, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (27, 27, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (28, 28, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (29, 29, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (30, 30, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (31, 31, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (32, 32, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (33, 33, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (34, 34, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (35, 35, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (36, 36, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (37, 37, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (38, 38, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (39, 39, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (40, 40, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (41, 41, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (42, 42, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (43, 43, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (44, 44, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (45, 45, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (46, 46, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (47, 47, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (48, 48, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (49, 49, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (50, 50, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (51, 51, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (52, 52, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (53, 53, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (54, 54, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (55, 55, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (56, 56, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (57, 57, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (58, 58, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (59, 59, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (60, 60, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (61, 61, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (62, 62, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (63, 63, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (64, 64, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (65, 65, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (66, 66, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (67, 67, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (68, 68, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (69, 69, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (70, 70, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (71, 71, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (72, 72, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (73, 73, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (74, 74, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (75, 75, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (76, 76, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (77, 77, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (78, 78, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (79, 79, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (80, 80, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (81, 81, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (82, 82, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (83, 83, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (84, 84, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (85, 85, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (86, 86, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (87, 87, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (88, 88, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (89, 89, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (90, 90, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (91, 91, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (92, 92, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (93, 93, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (94, 94, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (95, 95, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (96, 96, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (97, 97, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (98, 98, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (99, 99, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (100, 100, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (101, 101, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (102, 102, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (103, 103, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (104, 104, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (105, 105, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (106, 106, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (107, 107, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (108, 108, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (109, 109, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (110, 110, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (111, 111, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (112, 112, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (113, 113, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (114, 114, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (115, 115, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (116, 116, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (117, 117, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (118, 118, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (119, 119, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (120, 120, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (121, 121, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (122, 122, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (123, 123, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (124, 124, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (125, 125, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (126, 126, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (127, 127, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (128, 128, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (129, 129, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (130, 130, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (131, 131, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (132, 132, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (133, 133, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (134, 134, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (135, 135, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (136, 136, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (137, 137, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (138, 138, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (139, 139, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (140, 140, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (141, 141, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (142, 142, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (143, 143, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (144, 144, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (145, 145, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (146, 146, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (147, 147, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (148, 148, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (149, 149, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (150, 150, 'mailing');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (1, 1, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (2, 2, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (3, 3, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (4, 4, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (5, 5, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (6, 6, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (7, 7, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (8, 8, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (9, 9, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (10, 10, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (11, 11, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (12, 12, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (13, 13, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (14, 14, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (15, 15, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (16, 16, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (17, 17, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (18, 18, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (19, 19, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (20, 20, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (21, 21, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (22, 22, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (23, 23, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (24, 24, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (25, 25, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (26, 26, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (27, 27, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (28, 28, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (29, 29, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (30, 30, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (31, 31, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (32, 32, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (33, 33, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (34, 34, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (35, 35, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (36, 36, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (37, 37, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (38, 38, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (39, 39, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (40, 40, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (41, 41, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (42, 42, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (43, 43, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (44, 44, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (45, 45, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (46, 46, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (47, 47, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (48, 48, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (49, 49, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (50, 50, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (51, 51, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (52, 52, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (53, 53, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (54, 54, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (55, 55, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (56, 56, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (57, 57, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (58, 58, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (59, 59, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (60, 60, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (61, 61, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (62, 62, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (63, 63, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (64, 64, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (65, 65, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (66, 66, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (67, 67, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (68, 68, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (69, 69, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (70, 70, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (71, 71, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (72, 72, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (73, 73, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (74, 74, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (75, 75, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (76, 76, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (77, 77, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (78, 78, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (79, 79, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (80, 80, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (81, 81, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (82, 82, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (83, 83, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (84, 84, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (85, 85, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (86, 86, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (87, 87, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (88, 88, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (89, 89, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (90, 90, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (91, 91, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (92, 92, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (93, 93, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (94, 94, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (95, 95, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (96, 96, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (97, 97, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (98, 98, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (99, 99, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (100, 100, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (101, 101, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (102, 102, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (103, 103, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (104, 104, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (105, 105, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (106, 106, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (107, 107, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (108, 108, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (109, 109, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (110, 110, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (111, 111, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (112, 112, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (113, 113, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (114, 114, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (115, 115, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (116, 116, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (117, 117, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (118, 118, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (119, 119, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (120, 120, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (121, 121, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (122, 122, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (123, 123, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (124, 124, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (125, 125, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (126, 126, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (127, 127, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (128, 128, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (129, 129, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (130, 130, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (131, 131, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (132, 132, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (133, 133, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (134, 134, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (135, 135, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (136, 136, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (137, 137, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (138, 138, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (139, 139, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (140, 140, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (141, 141, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (142, 142, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (143, 143, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (144, 144, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (145, 145, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (146, 146, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (147, 147, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (148, 148, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (149, 149, 'permanent');
INSERT INTO `student_address` (`studentID`, `addressID`, `type`) VALUES (150, 150, 'permanent');

-- Application Insert Statements
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (1, 'Spring', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, false, 'Fall 2010', true, 'Fall 2011', 'Undergraduate', 3.44, 2.73, 'Heller and Sons', '2009-10-26', false, '2015-02-17', 46, 16, 307, true, '2015-09-12', 139, 169, 282, false, false, '2014-04-04', 113, 488, false, '2015-07-26', 43);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (2, 'Fall', 2019, 'Professional MIS', 'Software Engineering Management', false, false, 'Spring 2013', false, 'Spring 2011', 'Other', 2.81, 2.87, 'Beahan, Stark and Goyette', '2014-05-23', true, '2013-08-09', 14, 46, 761, true, '2014-04-12', 139, 150, 310, false, true, '2014-08-04', 88, 347, true, '2016-07-03', 44);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (3, 'Spring', 2020, 'Professional MIS', 'Enterprise Systems (ES) Management', true, true, 'Fall 2015', false, 'Fall 2010', 'Graduate', 3.41, 3.21, 'Koss-Boyle', '2014-06-24', false, '2017-01-30', 36, 14, 724, true, '2016-10-02', 140, 136, 272, true, true, '2012-03-23', 31, 511, true, '2012-12-30', 29);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (4, 'Spring', 2018, 'Professional MIS', 'Software Engineering Management', false, false, 'Fall 2013', false, 'Fall 2013', 'Undergraduate', 3.04, 3.19, 'Hermann-Hagenes', '2011-12-30', true, '2016-10-23', 49, 17, 405, true, '2013-10-17', 154, 135, 273, true, false, '2013-02-13', 77, 374, true, '2011-08-24', 22);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (5, 'Summer', 2018, 'Professional MIS', 'Information Technology Management', false, true, 'Spring 2015', false, 'Fall 2010', 'Other', 3.0, 3.36, 'Walter, Ward and Kerluke', '2013-02-17', true, '2017-07-09', 50, 44, 264, true, '2011-05-13', 170, 151, 294, true, false, '2016-05-21', 64, 496, true, '2015-04-25', 54);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (6, 'Summer', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, false, 'Spring 2012', false, 'Spring 2012', 'Graduate', 2.77, 3.39, 'Carroll-Berge', '2009-09-18', false, '2016-08-22', 43, 38, 223, false, '2017-11-06', 139, 135, 290, false, false, '2011-02-07', 116, 467, false, '2015-06-09', 42);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (7, 'Spring', 2019, 'Professional MIS', 'Software Engineering Management', true, false, 'Fall 2010', true, 'Fall 2013', 'Undergraduate', 2.94, 2.62, 'Dooley-Jacobi', '2009-10-22', true, '2014-10-03', 27, 51, 703, true, '2017-09-22', 152, 149, 334, false, true, '2013-06-10', 3, 516, true, '2017-05-09', 42);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (8, 'Summer', 2019, 'Full-Time MIS', 'Software Engineering Management', true, false, 'Fall 2011', true, 'Spring 2012', 'Graduate', 3.83, 3.54, 'Schmeler-Howell', '2007-05-27', true, '2012-03-03', 43, 47, 650, true, '2017-03-02', 137, 169, 313, true, false, '2013-10-07', 4, 464, false, '2013-09-26', 32);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (9, 'Fall', 2016, 'Professional MIS', 'Information Technology Management', false, false, 'Spring 2015', false, 'Fall 2014', 'Other', 2.76, 2.76, 'Daniel Inc', '2013-05-20', false, '2017-03-23', 51, 14, 261, true, '2016-01-15', 154, 154, 294, false, false, '2011-06-10', 117, 490, false, '2013-11-19', 52);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (10, 'Fall', 2016, 'Full-Time MIS', 'Information Technology Management', true, false, 'Fall 2011', false, 'Fall 2012', 'Graduate', 3.95, 3.41, 'Kovacek and Sons', '2009-02-22', false, '2012-08-20', 20, 29, 539, true, '2015-09-28', 167, 135, 310, true, true, '2014-12-19', 24, 387, false, '2015-02-03', 36);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (11, 'Summer', 2020, 'Full-Time MIS', 'Software Engineering Management', false, false, 'Fall 2015', false, 'Spring 2015', 'Graduate', 3.42, 3.44, 'Lindgren Inc', '2008-03-12', false, '2015-08-26', 21, 35, 788, true, '2012-09-17', 166, 133, 327, true, true, '2017-08-16', 78, 604, false, '2011-02-20', 28);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (12, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', true, true, 'Fall 2010', false, 'Fall 2011', 'Graduate', 2.52, 3.96, 'Treutel, Stracke and Ruecker', '2008-02-13', false, '2014-08-13', 26, 25, 679, false, '2014-06-01', 170, 161, 263, true, false, '2011-03-15', 46, 586, false, '2011-06-12', 48);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (13, 'Fall', 2020, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, false, 'Fall 2013', true, 'Spring 2013', 'Other', 3.32, 2.87, 'Russel, Veum and Jacobs', '2009-05-26', true, '2011-11-11', 27, 21, 359, false, '2013-05-09', 134, 155, 273, true, false, '2017-06-23', 101, 486, false, '2016-10-22', 31);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (14, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Spring 2010', true, 'Fall 2012', 'Undergraduate', 3.69, 2.74, 'Gerlach, Steuber and Lesch', '2012-07-19', true, '2015-01-15', 26, 22, 474, true, '2016-08-05', 141, 167, 331, true, false, '2013-05-23', 95, 348, true, '2012-02-21', 43);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (15, 'Spring', 2020, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Spring 2014', false, 'Fall 2014', 'Undergraduate', 2.93, 3.0, 'Beer-Schowalter', '2013-02-22', true, '2015-01-03', 27, 35, 303, false, '2017-10-06', 153, 147, 339, false, true, '2014-04-23', 36, 677, false, '2016-12-13', 24);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (16, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2013', false, 'Spring 2010', 'Other', 3.98, 3.39, 'Lindgren LLC', '2007-10-15', false, '2015-08-05', 12, 17, 217, true, '2016-11-24', 145, 165, 325, true, true, '2017-06-21', 8, 447, true, '2016-05-05', 29);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (17, 'Fall', 2016, 'Professional MIS', 'Software Engineering Management', false, true, 'Spring 2010', true, 'Fall 2012', 'Undergraduate', 3.23, 2.66, 'Davis Inc', '2010-11-14', false, '2016-09-30', 37, 49, 219, false, '2016-06-18', 168, 155, 303, true, false, '2012-09-16', 17, 510, true, '2015-11-17', 54);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (18, 'Fall', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, true, 'Fall 2013', true, 'Spring 2014', 'Graduate', 3.79, 3.25, 'Kassulke-Haley', '2012-07-25', false, '2012-10-01', 42, 10, 366, false, '2017-07-19', 163, 156, 277, true, false, '2016-05-12', 28, 482, false, '2017-05-02', 22);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (19, 'Spring', 2017, 'Professional MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2012', true, 'Spring 2012', 'Other', 3.9, 2.91, 'Torp Group', '2010-05-05', false, '2012-06-08', 44, 25, 722, true, '2013-05-06', 134, 158, 311, false, true, '2013-06-05', 92, 566, false, '2013-06-07', 46);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (20, 'Fall', 2016, 'Full-Time MIS', 'Information Technology Management', true, true, 'Spring 2011', false, 'Fall 2012', 'Graduate', 2.56, 2.54, 'Predovic, Heidenreich and Jacobson', '2012-11-21', false, '2017-03-25', 22, 22, 599, true, '2013-09-08', 149, 170, 311, true, false, '2017-03-24', 85, 476, false, '2016-04-09', 58);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (21, 'Summer', 2020, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, false, 'Fall 2012', false, 'Fall 2011', 'Graduate', 3.44, 3.38, 'Waelchi-Lynch', '2007-12-31', false, '2011-05-26', 33, 20, 772, true, '2014-12-16', 149, 149, 319, false, false, '2014-09-21', 42, 665, false, '2017-06-03', 38);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (22, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', false, false, 'Spring 2015', true, 'Fall 2011', 'Other', 3.69, 2.73, 'Dooley-Jacobs', '2008-02-09', false, '2014-07-11', 23, 45, 776, true, '2016-04-15', 139, 147, 292, true, false, '2013-06-12', 113, 394, false, '2016-10-20', 32);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (23, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Spring 2013', false, 'Spring 2014', 'Other', 3.69, 2.82, 'Kuhn, Dare and McDermott', '2013-01-31', true, '2017-03-30', 33, 46, 225, false, '2014-10-12', 130, 158, 293, true, true, '2016-07-14', 93, 418, true, '2013-02-15', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (24, 'Fall', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Spring 2012', true, 'Fall 2014', 'Undergraduate', 3.94, 3.95, 'Durgan, Greenholt and Bartell', '2007-03-09', false, '2012-11-10', 8, 6, 669, false, '2012-05-03', 143, 151, 260, false, true, '2012-12-14', 105, 443, true, '2011-09-05', 23);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (25, 'Fall', 2018, 'Professional MIS', 'Software Engineering Management', true, true, 'Spring 2015', false, 'Spring 2015', 'Graduate', 2.9, 3.64, 'Sporer, Hilll and Lehner', '2008-05-29', true, '2017-03-06', 43, 42, 703, true, '2017-07-31', 161, 160, 318, true, false, '2015-03-27', 40, 638, true, '2014-06-25', 57);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (26, 'Fall', 2019, 'Full-Time MIS', 'Software Engineering Management', true, true, 'Fall 2014', true, 'Spring 2014', 'Other', 3.25, 2.85, 'Wiegand-Cassin', '2014-05-22', false, '2012-08-04', 30, 49, 669, true, '2013-01-20', 135, 143, 301, false, false, '2013-09-13', 72, 462, true, '2015-07-16', 34);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (27, 'Summer', 2016, 'Professional MIS', 'Software Engineering Management', true, false, 'Spring 2015', false, 'Fall 2012', 'Graduate', 3.1, 3.42, 'Hoeger, Bogisich and Hahn', '2010-12-06', false, '2016-11-13', 14, 11, 417, true, '2017-09-24', 157, 144, 278, false, true, '2016-07-02', 105, 659, false, '2015-01-24', 55);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (28, 'Spring', 2019, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, true, 'Fall 2012', true, 'Spring 2013', 'Undergraduate', 3.25, 3.38, 'Dietrich-Predovic', '2014-12-10', true, '2013-05-11', 12, 20, 309, false, '2016-10-23', 143, 133, 296, true, false, '2017-03-17', 43, 318, false, '2011-07-29', 46);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (29, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', true, true, 'Fall 2015', true, 'Spring 2014', 'Other', 3.68, 2.63, 'Blick-Parker', '2012-05-17', false, '2013-11-04', 51, 19, 787, true, '2015-05-25', 153, 133, 283, true, true, '2016-09-02', 102, 559, true, '2013-04-18', 21);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (30, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, true, 'Spring 2015', true, 'Spring 2010', 'Graduate', 3.68, 3.0, 'Armstrong and Sons', '2010-02-18', true, '2013-11-20', 19, 42, 591, true, '2013-11-24', 146, 164, 276, true, true, '2016-08-29', 11, 426, false, '2015-02-28', 37);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (31, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', true, false, 'Spring 2010', true, 'Fall 2014', 'Undergraduate', 3.8, 2.59, 'Wyman, Spinka and Hermiston', '2008-10-25', true, '2017-01-25', 17, 21, 378, false, '2013-11-04', 168, 169, 276, false, false, '2013-06-19', 108, 587, false, '2017-04-17', 35);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (32, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Fall 2014', false, 'Fall 2015', 'Other', 3.61, 3.63, 'Haley, Kessler and Gutkowski', '2015-11-01', false, '2012-06-05', 23, 51, 431, false, '2016-03-26', 144, 146, 262, false, true, '2017-05-23', 68, 433, false, '2013-04-11', 58);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (33, 'Fall', 2017, 'Professional MIS', 'Information Technology Management', false, false, 'Spring 2011', false, 'Fall 2011', 'Other', 2.56, 2.59, 'VonRueden, Schmeler and Quigley', '2010-10-08', true, '2017-12-04', 13, 38, 727, false, '2014-03-27', 147, 161, 275, true, true, '2012-11-02', 30, 671, false, '2016-10-09', 42);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (34, 'Spring', 2016, 'Professional MIS', 'Information Technology Management', false, false, 'Spring 2013', false, 'Spring 2013', 'Undergraduate', 3.99, 3.18, 'Sporer Inc', '2010-03-17', true, '2017-03-10', 9, 20, 780, true, '2016-12-11', 131, 154, 313, true, true, '2013-08-08', 4, 412, true, '2016-07-03', 54);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (35, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', true, false, 'Fall 2014', false, 'Fall 2010', 'Other', 2.76, 2.86, 'Orn LLC', '2014-05-14', true, '2017-04-24', 16, 32, 733, false, '2015-02-10', 139, 163, 315, false, true, '2012-07-07', 112, 520, true, '2012-08-04', 40);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (36, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2013', true, 'Spring 2012', 'Graduate', 2.53, 3.17, 'Hoeger LLC', '2007-03-24', true, '2013-06-09', 12, 47, 640, true, '2014-10-30', 132, 170, 262, false, true, '2013-06-22', 36, 519, false, '2017-07-15', 31);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (37, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, false, 'Spring 2015', true, 'Spring 2015', 'Undergraduate', 2.64, 3.02, 'Wehner Inc', '2016-04-23', true, '2015-09-28', 21, 40, 749, true, '2017-04-30', 136, 146, 310, true, true, '2011-01-14', 12, 472, true, '2016-09-01', 28);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (38, 'Fall', 2018, 'Full-Time MIS', 'Software Engineering Management', false, true, 'Fall 2012', false, 'Spring 2015', 'Other', 3.82, 2.58, 'Littel LLC', '2011-04-22', true, '2016-07-16', 10, 41, 273, false, '2014-01-29', 170, 136, 272, false, false, '2014-07-02', 92, 353, false, '2012-12-01', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (39, 'Summer', 2018, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Spring 2015', true, 'Spring 2012', 'Undergraduate', 2.7, 3.75, 'Moen, Ernser and Crist', '2008-07-09', false, '2012-11-08', 16, 8, 577, false, '2011-02-14', 152, 161, 276, false, true, '2013-08-08', 72, 561, true, '2012-06-01', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (40, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Spring 2010', true, 'Spring 2011', 'Other', 2.81, 3.4, 'Carter LLC', '2009-06-26', true, '2015-04-15', 41, 47, 386, true, '2015-02-28', 148, 148, 319, false, false, '2011-12-24', 16, 677, true, '2015-08-04', 42);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (41, 'Summer', 2018, 'Professional MIS', 'Information Technology Management', true, false, 'Fall 2013', false, 'Fall 2013', 'Other', 3.17, 3.67, 'Will-Oberbrunner', '2010-04-27', true, '2011-01-17', 24, 20, 239, true, '2017-03-20', 130, 159, 275, true, false, '2011-04-09', 37, 501, true, '2013-11-26', 40);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (42, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', false, true, 'Fall 2013', true, 'Spring 2010', 'Graduate', 3.63, 3.49, 'Predovic-Mraz', '2014-02-20', false, '2016-10-11', 43, 30, 254, false, '2017-09-21', 161, 141, 268, true, false, '2012-01-14', 76, 612, false, '2013-10-04', 38);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (43, 'Fall', 2020, 'Professional MIS', 'Software Engineering Management', false, false, 'Fall 2012', false, 'Fall 2015', 'Undergraduate', 3.58, 2.74, 'Wiegand, Hintz and Jaskolski', '2012-01-24', false, '2011-09-25', 27, 29, 763, true, '2013-03-29', 163, 139, 269, false, true, '2017-06-07', 25, 334, false, '2012-07-15', 30);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (44, 'Summer', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, true, 'Fall 2015', true, 'Spring 2015', 'Undergraduate', 3.94, 3.9, 'Schmitt-Welch', '2014-08-02', false, '2014-06-09', 18, 40, 649, false, '2016-01-22', 168, 168, 318, false, false, '2015-01-23', 76, 379, true, '2017-12-17', 29);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (45, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, false, 'Spring 2014', true, 'Fall 2014', 'Undergraduate', 2.72, 3.43, 'Beahan-Wunsch', '2008-06-26', false, '2017-04-09', 44, 26, 296, true, '2013-06-19', 167, 138, 287, false, true, '2013-10-04', 57, 502, false, '2012-03-14', 31);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (46, 'Summer', 2017, 'Professional MIS', 'Information Technology Management', false, true, 'Spring 2011', false, 'Spring 2010', 'Graduate', 3.93, 3.76, 'Kreiger-Zemlak', '2008-10-21', false, '2015-02-05', 35, 15, 544, true, '2011-03-18', 163, 165, 335, true, false, '2014-03-12', 88, 423, false, '2014-08-10', 41);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (47, 'Fall', 2020, 'Professional MIS', 'Enterprise Systems (ES) Management', false, false, 'Fall 2010', true, 'Fall 2013', 'Graduate', 3.71, 3.6, 'Grimes, Satterfield and Hoeger', '2011-02-15', false, '2014-07-30', 48, 9, 638, false, '2015-07-22', 163, 168, 335, true, true, '2016-01-26', 117, 545, true, '2017-03-13', 32);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (48, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2012', true, 'Spring 2012', 'Other', 3.02, 2.72, 'Bernhard Group', '2015-07-12', false, '2011-09-07', 24, 42, 721, true, '2015-12-02', 139, 135, 268, true, true, '2011-02-27', 17, 532, false, '2013-04-30', 43);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (49, 'Summer', 2016, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2012', true, 'Fall 2011', 'Undergraduate', 3.32, 3.84, 'Huels-Stark', '2012-12-16', true, '2016-10-12', 18, 36, 661, true, '2011-05-27', 160, 166, 282, false, true, '2015-10-29', 69, 625, false, '2014-10-08', 29);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (50, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Spring 2010', true, 'Fall 2012', 'Undergraduate', 3.27, 2.61, 'Kris Group', '2009-04-06', true, '2011-09-03', 14, 28, 503, false, '2011-09-09', 142, 166, 276, true, true, '2011-07-22', 7, 312, true, '2012-10-10', 46);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (51, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2011', true, 'Spring 2013', 'Graduate', 2.81, 3.52, 'Jaskolski-Beer', '2014-04-14', false, '2016-05-14', 32, 50, 443, true, '2014-09-10', 169, 151, 312, true, true, '2013-07-26', 19, 608, false, '2013-01-02', 54);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (52, 'Summer', 2018, 'Full-Time MIS', 'Software Engineering Management', false, false, 'Fall 2013', true, 'Fall 2015', 'Other', 2.73, 3.5, 'Bartell Inc', '2009-06-27', false, '2014-06-28', 36, 47, 694, true, '2015-05-17', 169, 150, 313, true, true, '2012-05-18', 112, 437, false, '2015-09-17', 43);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (53, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2015', false, 'Spring 2013', 'Undergraduate', 2.84, 3.49, 'Ruecker LLC', '2007-04-13', true, '2017-02-18', 10, 9, 551, false, '2016-09-12', 162, 148, 271, false, true, '2012-09-11', 21, 426, true, '2011-04-26', 44);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (54, 'Summer', 2019, 'Professional MIS', 'Information Technology Management', true, true, 'Spring 2012', true, 'Spring 2014', 'Graduate', 3.71, 3.93, 'McKenzie, Collins and Casper', '2016-03-29', false, '2012-07-04', 24, 14, 665, false, '2011-05-05', 148, 159, 276, false, true, '2014-04-13', 91, 596, true, '2016-10-20', 34);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (55, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, true, 'Fall 2011', false, 'Spring 2012', 'Undergraduate', 3.34, 3.62, 'Kreiger, Jerde and Batz', '2008-01-31', true, '2016-05-03', 10, 13, 453, false, '2011-08-25', 160, 133, 282, true, true, '2011-03-23', 96, 482, false, '2016-04-12', 31);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (56, 'Summer', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Spring 2010', true, 'Spring 2014', 'Graduate', 3.28, 3.77, 'Sanford-Halvorson', '2016-01-24', false, '2013-12-09', 48, 29, 556, true, '2015-08-03', 155, 137, 298, false, true, '2011-04-22', 9, 379, true, '2012-06-26', 24);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (57, 'Spring', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2013', false, 'Fall 2011', 'Other', 3.51, 3.32, 'Stroman-Nader', '2012-10-17', true, '2013-07-28', 36, 36, 792, true, '2014-06-19', 170, 165, 261, true, true, '2015-06-21', 46, 554, true, '2017-06-03', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (58, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2010', true, 'Spring 2014', 'Undergraduate', 3.28, 2.58, 'Gutkowski-Goodwin', '2013-04-09', true, '2015-11-04', 17, 50, 241, true, '2011-05-06', 158, 149, 267, false, true, '2015-06-04', 95, 438, false, '2014-02-14', 29);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (59, 'Fall', 2019, 'Professional MIS', 'Enterprise Systems (ES) Management', false, true, 'Fall 2014', false, 'Fall 2015', 'Graduate', 3.46, 2.69, 'Hilpert, Bogan and Will', '2008-08-08', false, '2017-10-05', 31, 30, 451, false, '2012-08-11', 161, 170, 292, true, true, '2017-03-09', 78, 503, true, '2015-03-30', 32);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (60, 'Fall', 2017, 'Professional MIS', 'Information Technology Management', true, false, 'Fall 2013', false, 'Spring 2013', 'Graduate', 3.63, 2.96, 'Keeling and Sons', '2013-08-11', false, '2014-02-13', 46, 9, 703, false, '2017-01-26', 168, 156, 295, true, true, '2017-09-12', 53, 528, true, '2015-03-02', 52);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (61, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2015', false, 'Fall 2011', 'Undergraduate', 3.17, 3.15, 'Gerlach, Davis and Fritsch', '2008-08-01', false, '2016-11-20', 22, 26, 249, false, '2011-10-25', 169, 151, 284, true, false, '2014-04-21', 94, 367, false, '2011-01-22', 38);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (62, 'Spring', 2019, 'Professional MIS', 'Software Engineering Management', true, true, 'Spring 2011', false, 'Spring 2010', 'Undergraduate', 2.83, 3.9, 'Christiansen, Ernser and Roberts', '2009-09-14', true, '2015-09-10', 9, 10, 478, true, '2014-07-31', 159, 150, 313, true, true, '2016-07-25', 94, 543, false, '2017-06-14', 21);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (63, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', false, true, 'Fall 2010', false, 'Spring 2013', 'Graduate', 3.92, 3.79, 'Raynor LLC', '2013-01-17', false, '2011-11-01', 19, 8, 371, true, '2013-03-13', 141, 157, 288, true, true, '2017-07-29', 72, 339, true, '2015-04-05', 45);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (64, 'Spring', 2018, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Spring 2012', false, 'Spring 2013', 'Undergraduate', 3.97, 2.81, 'Kling, Boyer and Wyman', '2013-04-11', true, '2013-09-11', 13, 33, 542, true, '2014-05-13', 154, 134, 330, true, true, '2011-02-21', 61, 415, true, '2011-04-19', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (65, 'Summer', 2017, 'Full-Time MIS', 'Information Technology Management', false, false, 'Spring 2010', true, 'Fall 2011', 'Graduate', 3.94, 3.69, 'Pouros LLC', '2009-12-23', true, '2013-10-24', 10, 50, 333, false, '2013-03-21', 153, 150, 303, true, false, '2016-12-10', 59, 443, false, '2016-08-29', 58);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (66, 'Spring', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Spring 2011', false, 'Spring 2014', 'Undergraduate', 3.78, 3.23, 'Gleichner-Ebert', '2014-05-21', true, '2012-02-11', 21, 16, 207, false, '2014-04-16', 143, 140, 323, false, false, '2013-01-15', 76, 345, false, '2012-09-01', 35);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (67, 'Summer', 2016, 'Professional MIS', 'Information Technology Management', true, false, 'Spring 2010', false, 'Spring 2014', 'Graduate', 2.57, 3.95, 'O''Keefe, Mante and Moen', '2014-02-17', false, '2013-04-10', 38, 47, 608, true, '2011-05-11', 146, 156, 338, false, true, '2015-11-16', 110, 652, false, '2013-05-25', 31);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (68, 'Spring', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, true, 'Spring 2015', true, 'Fall 2013', 'Graduate', 2.83, 2.88, 'Lynch-MacGyver', '2012-09-12', false, '2017-10-12', 14, 30, 714, true, '2013-12-08', 158, 130, 268, false, true, '2011-06-24', 5, 658, false, '2016-01-02', 24);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (69, 'Spring', 2016, 'Full-Time MIS', 'Information Technology Management', true, false, 'Fall 2014', true, 'Spring 2013', 'Graduate', 3.0, 2.55, 'Rolfson, Klocko and Carroll', '2013-08-05', true, '2011-11-30', 51, 27, 468, true, '2014-11-09', 136, 156, 317, true, true, '2016-07-16', 71, 374, false, '2015-01-28', 23);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (70, 'Spring', 2016, 'Full-Time MIS', 'Software Engineering Management', true, false, 'Fall 2013', true, 'Fall 2010', 'Graduate', 2.72, 2.73, 'Hudson-Hickle', '2012-08-31', false, '2013-05-05', 31, 51, 267, true, '2013-10-02', 158, 160, 331, true, true, '2013-04-22', 64, 585, true, '2016-09-10', 21);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (71, 'Spring', 2020, 'Professional MIS', 'Information Technology Management', false, false, 'Fall 2015', true, 'Spring 2012', 'Graduate', 2.65, 2.89, 'Bergstrom Group', '2008-08-21', false, '2013-12-12', 32, 31, 239, false, '2011-11-16', 134, 131, 295, true, true, '2015-03-24', 83, 345, true, '2012-01-22', 34);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (72, 'Fall', 2019, 'Full-Time MIS', 'Information Technology Management', true, false, 'Spring 2011', false, 'Fall 2012', 'Other', 3.33, 2.75, 'Hamill, Gusikowski and Olson', '2009-06-18', false, '2014-10-25', 29, 50, 479, true, '2016-12-03', 132, 169, 335, false, true, '2012-10-14', 8, 402, false, '2011-07-02', 56);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (73, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Fall 2012', false, 'Fall 2014', 'Undergraduate', 2.56, 3.82, 'Smitham Inc', '2011-12-08', false, '2017-06-10', 47, 22, 388, false, '2017-09-26', 149, 151, 307, false, true, '2011-10-11', 73, 416, false, '2013-05-22', 58);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (74, 'Spring', 2020, 'Full-Time MIS', 'Information Technology Management', false, false, 'Spring 2014', false, 'Fall 2010', 'Undergraduate', 2.72, 3.28, 'Harber, Stracke and Mann', '2011-02-07', true, '2013-05-20', 22, 27, 721, false, '2015-12-13', 155, 154, 281, false, true, '2012-03-01', 94, 545, true, '2017-06-28', 32);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (75, 'Spring', 2019, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Fall 2010', true, 'Fall 2010', 'Other', 2.57, 3.32, 'Herman, Torp and Schmidt', '2008-06-13', true, '2015-07-09', 25, 42, 388, false, '2013-02-07', 162, 166, 317, true, true, '2012-02-20', 93, 384, false, '2012-09-03', 58);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (76, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, false, 'Fall 2012', false, 'Fall 2011', 'Graduate', 3.11, 3.87, 'Bins, Pfannerstill and Cassin', '2010-10-30', true, '2012-10-23', 16, 7, 248, false, '2012-01-12', 139, 149, 320, false, false, '2013-01-31', 48, 595, true, '2013-08-02', 35);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (77, 'Spring', 2017, 'Professional MIS', 'Information Technology Management', false, false, 'Spring 2012', true, 'Spring 2014', 'Other', 3.54, 3.78, 'Anderson, Kling and Kuphal', '2011-12-30', false, '2016-12-26', 34, 51, 551, false, '2016-09-03', 155, 148, 311, true, true, '2015-12-07', 43, 365, true, '2016-08-25', 54);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (78, 'Fall', 2019, 'Professional MIS', 'Enterprise Systems (ES) Management', false, true, 'Fall 2014', false, 'Spring 2010', 'Graduate', 3.55, 2.95, 'Weimann-Champlin', '2015-05-07', true, '2014-05-30', 19, 25, 284, true, '2017-12-13', 167, 130, 281, false, false, '2013-04-09', 37, 516, true, '2017-03-06', 34);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (79, 'Spring', 2017, 'Professional MIS', 'Software Engineering Management', true, false, 'Fall 2014', false, 'Fall 2014', 'Other', 2.66, 2.81, 'Johns, Treutel and Smith', '2014-07-23', true, '2013-08-17', 7, 49, 286, false, '2012-04-11', 147, 160, 282, false, false, '2014-02-25', 120, 560, false, '2017-08-29', 51);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (80, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2013', false, 'Fall 2012', 'Graduate', 3.15, 3.28, 'Becker, Jenkins and Kris', '2016-06-23', true, '2014-12-25', 28, 44, 702, false, '2013-06-03', 152, 166, 290, true, false, '2017-09-05', 21, 416, true, '2012-06-23', 44);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (81, 'Summer', 2020, 'Professional MIS', 'Information Technology Management', true, false, 'Spring 2015', true, 'Spring 2012', 'Graduate', 3.41, 2.66, 'Kiehn LLC', '2008-08-06', true, '2016-12-22', 41, 46, 539, false, '2011-01-24', 159, 137, 314, false, true, '2013-01-13', 38, 484, true, '2014-07-06', 23);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (82, 'Summer', 2016, 'Professional MIS', 'Information Technology Management', false, false, 'Fall 2012', true, 'Spring 2015', 'Other', 3.13, 2.87, 'O''Reilly-Dickens', '2014-01-06', true, '2012-04-30', 13, 41, 518, false, '2014-11-15', 153, 170, 306, false, true, '2015-09-01', 63, 614, true, '2013-05-26', 58);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (83, 'Fall', 2017, 'Full-Time MIS', 'Software Engineering Management', false, true, 'Fall 2011', true, 'Spring 2010', 'Undergraduate', 3.49, 3.84, 'Harris-Bode', '2013-09-09', false, '2012-12-22', 50, 43, 743, false, '2014-11-30', 163, 155, 337, false, false, '2012-03-12', 80, 582, true, '2012-10-25', 25);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (84, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Fall 2015', false, 'Spring 2012', 'Undergraduate', 2.74, 3.3, 'Kassulke Group', '2010-10-20', true, '2017-05-30', 7, 9, 730, true, '2014-02-08', 169, 167, 270, true, true, '2017-07-03', 47, 554, true, '2011-06-25', 40);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (85, 'Summer', 2017, 'Professional MIS', 'Information Technology Management', true, false, 'Fall 2014', true, 'Spring 2014', 'Undergraduate', 2.63, 3.18, 'Herman-Ortiz', '2007-09-19', true, '2015-12-12', 44, 27, 563, false, '2017-07-01', 131, 134, 267, true, true, '2014-02-26', 88, 499, true, '2013-11-29', 21);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (86, 'Summer', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Spring 2013', true, 'Spring 2012', 'Other', 3.1, 2.99, 'Kuhic Inc', '2013-01-22', true, '2011-01-28', 43, 37, 765, false, '2016-11-07', 157, 133, 267, false, false, '2015-12-23', 109, 535, true, '2014-04-27', 44);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (87, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Fall 2011', true, 'Fall 2012', 'Graduate', 3.51, 2.67, 'Purdy, Boyle and Watsica', '2012-01-14', true, '2011-11-29', 36, 12, 273, false, '2016-12-18', 150, 138, 298, false, false, '2015-05-06', 69, 477, false, '2012-04-13', 26);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (88, 'Fall', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', false, false, 'Spring 2013', true, 'Fall 2012', 'Other', 3.68, 3.6, 'McDermott, Corkery and Williamson', '2007-11-03', true, '2015-06-04', 10, 17, 544, false, '2013-12-31', 160, 147, 301, false, false, '2013-03-23', 63, 543, false, '2012-04-08', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (89, 'Fall', 2020, 'Professional MIS', 'Software Engineering Management', true, true, 'Spring 2014', true, 'Spring 2013', 'Undergraduate', 3.79, 2.79, 'Crona, Ryan and Tillman', '2014-04-15', false, '2013-10-17', 39, 18, 206, false, '2011-03-24', 167, 145, 299, false, true, '2017-03-17', 81, 560, false, '2011-05-09', 59);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (90, 'Fall', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2011', false, 'Spring 2014', 'Other', 3.34, 2.56, 'Brekke, Marks and Mills', '2007-02-14', true, '2012-06-07', 40, 8, 608, false, '2017-02-21', 151, 166, 293, false, false, '2017-07-21', 17, 576, true, '2017-05-11', 37);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (91, 'Spring', 2019, 'Professional MIS', 'Information Technology Management', true, false, 'Spring 2010', false, 'Spring 2013', 'Other', 3.93, 3.82, 'Crooks-Bernier', '2007-11-01', false, '2015-03-08', 23, 34, 588, true, '2017-06-03', 135, 163, 309, true, true, '2016-05-29', 22, 562, false, '2016-11-07', 22);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (92, 'Fall', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2012', false, 'Fall 2010', 'Undergraduate', 3.9, 3.33, 'Orn, Mraz and Simonis', '2014-09-24', true, '2015-12-07', 51, 30, 205, true, '2016-05-22', 167, 166, 327, true, true, '2015-02-24', 12, 623, false, '2015-06-09', 22);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (93, 'Summer', 2020, 'Professional MIS', 'Software Engineering Management', true, false, 'Fall 2010', true, 'Fall 2015', 'Graduate', 2.98, 3.28, 'Swaniawski Inc', '2014-10-06', false, '2013-10-03', 36, 12, 650, false, '2013-05-01', 159, 170, 275, true, false, '2017-04-08', 85, 447, true, '2012-03-17', 34);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (94, 'Spring', 2017, 'Professional MIS', 'Software Engineering Management', false, true, 'Spring 2014', false, 'Spring 2012', 'Undergraduate', 3.91, 3.6, 'Wehner-Schaefer', '2015-01-24', true, '2014-04-14', 14, 45, 368, false, '2016-04-16', 136, 145, 327, true, false, '2011-02-17', 56, 387, false, '2013-07-18', 38);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (95, 'Spring', 2016, 'Professional MIS', 'Information Technology Management', true, true, 'Spring 2012', false, 'Spring 2012', 'Undergraduate', 3.01, 2.75, 'Nitzsche LLC', '2015-03-26', false, '2016-08-14', 47, 23, 385, true, '2011-03-09', 131, 138, 297, false, false, '2011-06-10', 93, 540, false, '2014-05-02', 28);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (96, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Fall 2012', true, 'Fall 2010', 'Graduate', 3.77, 3.79, 'Pouros and Sons', '2014-02-12', true, '2014-04-21', 30, 48, 204, false, '2011-11-15', 146, 161, 279, false, true, '2017-01-05', 91, 364, true, '2017-03-21', 41);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (97, 'Spring', 2016, 'Professional MIS', 'Information Technology Management', false, true, 'Fall 2014', true, 'Fall 2012', 'Graduate', 3.2, 3.43, 'Koelpin, Douglas and Quigley', '2008-12-06', false, '2015-09-15', 39, 40, 459, true, '2017-04-06', 165, 159, 280, false, true, '2015-01-31', 52, 533, true, '2014-02-07', 39);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (98, 'Fall', 2020, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2014', false, 'Spring 2015', 'Graduate', 3.39, 2.94, 'Schumm-Maggio', '2014-07-18', true, '2017-12-21', 36, 26, 617, true, '2016-01-24', 150, 149, 261, true, true, '2017-05-21', 91, 482, true, '2011-01-26', 35);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (99, 'Summer', 2020, 'Professional MIS', 'Enterprise Systems (ES) Management', true, false, 'Spring 2011', false, 'Spring 2015', 'Graduate', 3.79, 2.79, 'Goodwin, Bayer and Prosacco', '2013-01-01', false, '2016-03-22', 48, 24, 493, true, '2012-07-24', 139, 141, 332, true, false, '2017-01-04', 90, 334, true, '2012-12-07', 27);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (100, 'Summer', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2015', false, 'Spring 2012', 'Graduate', 3.2, 2.68, 'Feil-Conroy', '2010-11-22', true, '2012-05-03', 39, 13, 378, false, '2013-10-06', 148, 156, 271, true, true, '2011-05-05', 119, 417, true, '2014-02-07', 25);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (101, 'Fall', 2019, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, false, 'Spring 2011', true, 'Spring 2011', 'Graduate', 3.32, 3.94, 'Jast, Veum and Mills', '2007-05-26', false, '2014-07-22', 13, 13, 438, true, '2016-11-11', 132, 134, 283, true, true, '2011-11-16', 108, 459, true, '2011-07-16', 40);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (102, 'Summer', 2019, 'Full-Time MIS', 'Software Engineering Management', true, false, 'Fall 2013', true, 'Spring 2015', 'Undergraduate', 2.93, 2.93, 'Schaden, Connelly and Fritsch', '2016-03-11', true, '2017-03-30', 45, 37, 778, false, '2017-01-25', 157, 131, 264, false, true, '2015-11-09', 23, 554, true, '2012-08-27', 26);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (103, 'Spring', 2020, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Fall 2015', false, 'Spring 2014', 'Other', 3.78, 3.94, 'Ward Inc', '2011-09-16', false, '2015-07-18', 12, 21, 290, false, '2011-08-25', 154, 147, 280, true, false, '2012-09-29', 91, 495, false, '2011-05-03', 52);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (104, 'Fall', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2011', false, 'Spring 2013', 'Other', 3.59, 3.75, 'Larkin-Mertz', '2012-06-25', false, '2015-06-19', 17, 36, 493, false, '2013-07-22', 143, 166, 271, true, true, '2017-11-06', 78, 452, true, '2016-10-12', 50);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (105, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Spring 2010', true, 'Spring 2013', 'Undergraduate', 2.59, 2.95, 'Berge-Hilpert', '2009-09-04', false, '2013-05-22', 34, 44, 256, false, '2017-11-04', 137, 134, 307, false, true, '2015-07-19', 29, 604, true, '2015-09-13', 27);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (106, 'Summer', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2014', true, 'Spring 2012', 'Other', 3.67, 3.28, 'Schaefer Group', '2014-10-02', false, '2013-03-16', 36, 7, 236, false, '2014-02-13', 133, 159, 283, true, true, '2015-05-14', 20, 609, true, '2014-08-09', 48);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (107, 'Spring', 2017, 'Full-Time MIS', 'Software Engineering Management', true, true, 'Fall 2010', true, 'Spring 2015', 'Graduate', 3.85, 2.57, 'Bode-Shanahan', '2007-05-03', false, '2017-05-27', 47, 47, 405, false, '2016-09-08', 144, 151, 284, true, true, '2012-04-05', 35, 646, true, '2015-12-25', 29);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (108, 'Summer', 2016, 'Full-Time MIS', 'Software Engineering Management', false, false, 'Spring 2010', false, 'Fall 2013', 'Undergraduate', 2.68, 3.46, 'Wolf Group', '2007-09-04', true, '2011-02-22', 46, 50, 485, false, '2017-07-25', 158, 149, 296, false, true, '2013-11-07', 61, 619, false, '2015-08-05', 52);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (109, 'Fall', 2016, 'Full-Time MIS', 'Software Engineering Management', true, true, 'Spring 2010', true, 'Fall 2010', 'Undergraduate', 2.89, 3.64, 'Russel Inc', '2015-11-15', true, '2014-11-09', 8, 7, 745, true, '2016-09-12', 138, 140, 329, false, true, '2013-02-10', 83, 419, false, '2014-01-31', 35);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (110, 'Fall', 2020, 'Professional MIS', 'Information Technology Management', true, true, 'Fall 2011', true, 'Spring 2014', 'Undergraduate', 2.62, 3.46, 'Cormier LLC', '2010-10-14', false, '2015-10-06', 34, 37, 774, false, '2016-04-02', 154, 131, 321, false, false, '2017-11-15', 58, 342, true, '2015-12-22', 60);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (111, 'Fall', 2020, 'Full-Time MIS', 'Information Technology Management', true, false, 'Spring 2015', false, 'Fall 2012', 'Graduate', 3.38, 3.74, 'Leffler, Langosh and Schoen', '2014-04-06', false, '2014-11-22', 10, 40, 505, false, '2011-05-08', 153, 133, 286, true, true, '2012-08-08', 11, 462, true, '2015-10-08', 54);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (112, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', false, false, 'Spring 2015', true, 'Fall 2012', 'Other', 3.15, 3.52, 'Murray, Padberg and Kemmer', '2008-07-21', false, '2012-01-03', 39, 41, 405, false, '2016-07-21', 154, 132, 323, true, true, '2014-10-26', 88, 472, true, '2013-02-13', 41);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (113, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', false, false, 'Spring 2010', false, 'Spring 2012', 'Undergraduate', 2.78, 2.96, 'Mills Inc', '2011-03-21', true, '2013-09-29', 45, 8, 407, false, '2015-12-21', 170, 164, 295, false, false, '2014-02-16', 13, 548, false, '2012-11-29', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (114, 'Fall', 2019, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, true, 'Spring 2014', true, 'Fall 2011', 'Other', 3.18, 3.59, 'Murray-Flatley', '2013-03-13', false, '2016-12-05', 48, 21, 476, false, '2016-05-07', 168, 146, 300, false, true, '2016-09-29', 45, 527, true, '2014-09-24', 37);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (115, 'Summer', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2015', false, 'Spring 2015', 'Undergraduate', 2.54, 3.65, 'Balistreri-Bernier', '2007-09-09', false, '2011-01-09', 41, 29, 442, false, '2013-01-21', 130, 167, 277, true, true, '2011-10-11', 10, 351, false, '2014-10-18', 32);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (116, 'Spring', 2019, 'Professional MIS', 'Information Technology Management', true, true, 'Fall 2014', false, 'Fall 2015', 'Undergraduate', 2.7, 3.99, 'Sauer, Schamberger and Bins', '2013-08-17', true, '2014-04-14', 6, 29, 582, false, '2013-02-23', 161, 166, 306, false, true, '2013-06-29', 106, 575, true, '2012-06-01', 59);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (117, 'Spring', 2019, 'Full-Time MIS', 'Information Technology Management', false, true, 'Fall 2012', true, 'Fall 2013', 'Other', 2.8, 3.8, 'Swift Group', '2016-06-16', false, '2012-02-14', 29, 41, 432, false, '2013-08-11', 155, 147, 284, false, true, '2011-11-22', 10, 613, true, '2011-09-26', 52);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (118, 'Spring', 2017, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2012', false, 'Fall 2010', 'Other', 2.63, 3.75, 'Jacobson and Sons', '2013-12-06', true, '2013-12-01', 16, 45, 490, false, '2012-01-24', 150, 138, 270, false, false, '2016-04-24', 94, 442, true, '2011-08-03', 52);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (119, 'Spring', 2018, 'Professional MIS', 'Information Technology Management', true, true, 'Spring 2012', true, 'Spring 2013', 'Undergraduate', 2.75, 3.06, 'Vandervort-Green', '2015-05-28', false, '2014-07-23', 9, 20, 214, false, '2015-06-03', 154, 139, 267, false, true, '2011-09-05', 54, 545, false, '2015-12-28', 21);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (120, 'Summer', 2016, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2014', false, 'Fall 2012', 'Graduate', 3.35, 3.36, 'Rodriguez, Bartell and Howe', '2014-08-19', true, '2014-05-14', 41, 26, 441, false, '2012-10-23', 147, 137, 304, true, false, '2016-07-18', 117, 431, false, '2016-05-13', 37);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (121, 'Fall', 2019, 'Full-Time MIS', 'Information Technology Management', true, true, 'Fall 2014', true, 'Spring 2013', 'Graduate', 3.11, 2.93, 'Altenwerth, Murazik and Parisian', '2014-05-29', false, '2012-06-17', 12, 28, 689, false, '2012-08-30', 133, 149, 332, false, true, '2011-02-09', 24, 625, false, '2017-02-26', 20);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (122, 'Fall', 2020, 'Full-Time MIS', 'Software Engineering Management', false, false, 'Fall 2011', true, 'Spring 2012', 'Graduate', 2.71, 2.85, 'Wehner-O''Hara', '2009-03-13', false, '2011-08-14', 39, 28, 742, false, '2016-02-04', 152, 158, 316, false, true, '2013-09-06', 18, 581, false, '2017-02-13', 47);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (123, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2012', false, 'Spring 2010', 'Undergraduate', 3.43, 2.58, 'Corkery, Effertz and Wehner', '2013-02-23', false, '2011-03-11', 45, 42, 355, false, '2011-07-30', 154, 141, 334, true, true, '2012-01-08', 27, 536, true, '2015-09-06', 23);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (124, 'Fall', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2013', true, 'Spring 2010', 'Undergraduate', 3.97, 2.68, 'Stamm-Simonis', '2009-11-11', true, '2015-11-20', 38, 22, 437, false, '2014-11-10', 130, 167, 278, true, false, '2016-07-12', 31, 595, false, '2011-04-24', 23);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (125, 'Fall', 2018, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, false, 'Spring 2010', true, 'Fall 2014', 'Other', 2.72, 3.54, 'Goodwin, Mills and Connelly', '2011-08-07', false, '2015-03-01', 47, 18, 358, false, '2013-10-17', 137, 152, 335, false, true, '2012-10-22', 119, 623, false, '2015-05-09', 39);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (126, 'Spring', 2017, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, false, 'Fall 2014', false, 'Fall 2014', 'Graduate', 3.8, 3.79, 'Williamson, Bahringer and Schneider', '2011-07-09', true, '2011-05-03', 44, 7, 417, true, '2013-07-21', 142, 142, 327, false, false, '2011-09-13', 117, 567, true, '2013-04-14', 59);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (127, 'Summer', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', true, false, 'Fall 2013', true, 'Spring 2015', 'Other', 3.38, 2.95, 'Bode, Nader and White', '2016-05-12', false, '2011-03-26', 44, 22, 519, true, '2012-09-25', 149, 146, 312, false, true, '2011-12-29', 11, 428, true, '2012-01-14', 51);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (128, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, false, 'Spring 2015', false, 'Spring 2010', 'Other', 2.62, 2.98, 'Schaden, Ankunding and Bartoletti', '2010-09-15', true, '2017-12-24', 28, 19, 394, false, '2012-05-04', 169, 135, 319, false, false, '2017-02-01', 11, 560, true, '2014-05-08', 46);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (129, 'Summer', 2017, 'Full-Time MIS', 'Information Technology Management', true, false, 'Fall 2013', false, 'Fall 2010', 'Other', 2.59, 2.67, 'Denesik Inc', '2007-10-09', false, '2015-09-04', 32, 39, 237, true, '2013-11-03', 149, 139, 276, true, true, '2013-08-31', 73, 482, false, '2014-05-16', 49);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (130, 'Summer', 2017, 'Full-Time MIS', 'Information Technology Management', true, true, 'Spring 2015', false, 'Fall 2013', 'Undergraduate', 3.99, 3.16, 'Moore Group', '2009-08-28', true, '2013-07-14', 29, 30, 779, true, '2011-12-15', 150, 147, 318, true, false, '2016-08-01', 30, 568, true, '2013-05-05', 42);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (131, 'Summer', 2016, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Spring 2015', true, 'Spring 2015', 'Undergraduate', 2.79, 2.82, 'Botsford LLC', '2008-01-21', true, '2014-06-11', 13, 38, 580, true, '2016-01-05', 148, 149, 303, false, false, '2012-12-04', 22, 395, false, '2014-05-08', 53);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (132, 'Fall', 2018, 'Professional MIS', 'Software Engineering Management', false, false, 'Fall 2013', true, 'Spring 2015', 'Undergraduate', 3.63, 2.58, 'Purdy-Kiehn', '2009-02-12', true, '2017-07-16', 18, 40, 445, false, '2011-05-17', 156, 162, 336, true, true, '2016-05-26', 19, 323, false, '2017-01-10', 28);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (133, 'Summer', 2020, 'Full-Time MIS', 'Information Technology Management', true, false, 'Spring 2014', true, 'Spring 2015', 'Other', 2.75, 3.81, 'Bergnaum, Cartwright and Flatley', '2012-05-31', false, '2017-09-22', 50, 10, 436, false, '2017-01-11', 169, 170, 337, true, false, '2011-11-27', 112, 630, false, '2011-04-17', 60);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (134, 'Spring', 2020, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', false, false, 'Fall 2012', true, 'Spring 2012', 'Graduate', 3.01, 2.73, 'Von, Gorczany and Bednar', '2010-06-08', false, '2017-08-29', 39, 35, 456, false, '2016-11-06', 156, 153, 337, false, true, '2014-09-21', 12, 350, false, '2016-10-14', 43);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (135, 'Summer', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Fall 2015', true, 'Spring 2011', 'Graduate', 3.94, 3.0, 'Gislason, Fisher and Nikolaus', '2015-05-27', true, '2014-12-19', 34, 39, 218, false, '2012-02-17', 132, 154, 289, true, false, '2016-07-25', 21, 376, true, '2017-11-20', 41);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (136, 'Summer', 2018, 'Full-Time MIS', 'Information Technology Management', false, false, 'Spring 2015', true, 'Fall 2013', 'Graduate', 2.6, 2.5, 'Koepp, Weber and Heidenreich', '2010-05-25', true, '2014-03-26', 20, 29, 322, true, '2017-04-01', 169, 145, 322, false, true, '2015-04-25', 48, 478, false, '2011-04-02', 30);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (137, 'Spring', 2019, 'Full-Time MIS', 'Information Technology Management', false, false, 'Fall 2014', false, 'Fall 2013', 'Other', 3.64, 3.87, 'Padberg-Yundt', '2014-03-16', true, '2014-07-02', 24, 37, 664, false, '2011-06-14', 161, 130, 281, false, false, '2016-06-10', 101, 460, true, '2011-08-25', 43);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (138, 'Summer', 2020, 'Full-Time MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2014', true, 'Fall 2011', 'Other', 2.87, 3.03, 'Upton-Schuster', '2010-06-18', true, '2011-03-18', 39, 6, 396, false, '2016-01-31', 145, 150, 309, false, false, '2014-09-27', 12, 341, false, '2017-08-06', 26);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (139, 'Fall', 2019, 'Full-Time MIS', 'Information Technology Management', true, true, 'Fall 2015', true, 'Spring 2014', 'Other', 3.3, 3.33, 'Stehr and Sons', '2016-08-01', true, '2015-05-07', 11, 38, 366, true, '2014-05-06', 135, 147, 314, false, false, '2014-12-10', 38, 358, false, '2012-11-01', 32);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (140, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Fall 2010', true, 'Fall 2015', 'Undergraduate', 3.1, 3.39, 'Marvin-Heidenreich', '2011-10-30', true, '2012-08-19', 48, 39, 776, false, '2017-03-30', 150, 130, 310, true, false, '2017-01-04', 49, 505, true, '2013-10-25', 47);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (141, 'Summer', 2017, 'Professional MIS', 'Enterprise Systems (ES) Management', false, true, 'Spring 2013', true, 'Fall 2010', 'Graduate', 2.92, 3.89, 'Wisozk-Morissette', '2011-01-19', false, '2014-11-06', 39, 35, 380, false, '2017-09-11', 142, 159, 270, false, false, '2012-11-02', 76, 573, true, '2011-04-25', 20);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (142, 'Spring', 2019, 'Professional MIS', 'Enterprise Resource Planning (ERP) Management', false, true, 'Fall 2015', false, 'Fall 2015', 'Other', 3.55, 3.29, 'Strosin Inc', '2013-02-22', true, '2014-10-26', 22, 46, 313, false, '2014-03-18', 153, 151, 266, false, true, '2013-08-18', 62, 396, true, '2012-05-14', 45);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (143, 'Spring', 2019, 'Professional MIS', 'Information Technology Management', true, false, 'Fall 2014', false, 'Spring 2013', 'Undergraduate', 2.97, 3.04, 'Gaylord-Hayes', '2015-05-02', true, '2011-03-08', 23, 36, 518, false, '2014-08-28', 148, 142, 315, false, false, '2013-12-09', 64, 664, true, '2015-04-25', 23);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (144, 'Fall', 2018, 'Full-Time MIS', 'Software Engineering Management', true, false, 'Spring 2014', true, 'Fall 2010', 'Other', 3.7, 3.71, 'Schroeder-Jacobi', '2008-09-30', false, '2013-01-10', 10, 36, 220, false, '2012-07-25', 166, 131, 302, false, true, '2011-09-28', 88, 368, true, '2014-04-19', 25);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (145, 'Spring', 2017, 'Professional MIS', 'Software Engineering Management', false, true, 'Fall 2014', false, 'Fall 2011', 'Undergraduate', 3.31, 2.82, 'Eichmann, Prosacco and Rolfson', '2008-06-18', false, '2011-07-12', 47, 17, 375, false, '2011-05-05', 138, 161, 261, true, true, '2014-03-13', 80, 447, true, '2015-08-13', 44);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (146, 'Fall', 2016, 'Full-Time MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2013', true, 'Spring 2010', 'Graduate', 3.59, 3.37, 'Lemke Inc', '2009-12-14', false, '2017-08-13', 36, 29, 575, false, '2014-04-23', 154, 151, 284, true, true, '2016-04-30', 86, 339, false, '2012-01-11', 21);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (147, 'Spring', 2018, 'Professional MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2013', true, 'Spring 2010', 'Undergraduate', 2.97, 2.93, 'Torphy and Sons', '2012-08-16', true, '2011-10-05', 44, 33, 303, false, '2012-12-28', 150, 151, 329, true, false, '2015-05-02', 90, 517, false, '2016-09-26', 50);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (148, 'Fall', 2017, 'Professional MIS', 'Enterprise Systems (ES) Management', true, true, 'Spring 2013', false, 'Spring 2011', 'Undergraduate', 3.45, 3.25, 'Cummings and Sons', '2012-03-12', true, '2017-10-17', 17, 42, 297, false, '2012-10-01', 162, 149, 315, false, true, '2015-03-31', 63, 433, true, '2012-01-02', 25);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (149, 'Spring', 2018, 'Professional MIS', 'Software Engineering Management', true, false, 'Fall 2010', true, 'Fall 2012', 'Other', 3.34, 2.89, 'Olson-Reichert', '2015-10-30', true, '2014-04-22', 40, 17, 787, false, '2016-04-14', 159, 130, 313, false, false, '2016-11-19', 105, 606, false, '2014-06-09', 21);
INSERT INTO `application` (`studentID`, `term`, `year`, `program`, `concentration`, `reqScholarship`, `previousApp`, `previousAppDate`, `previousEnrollment`, `previousEnrollmentDate`, `previousEnrollmentStatus`, `undergradGPA`, `juniorseniorGPA`, `currentEmployer`, `timeAtCurrentEmployer`, `gmat`, `gmatTestDate`, `gmatQScore`, `gmatVScore`, `gmatTScore`, `gre`, `greTestDate`, `greQScore`, `greVScore`, `greTScore`, `toeflOnline`, `toeflPaper`, `toeflTestDate`, `toeflOnlineScore`, `toeflPaperScore`, `tse`, `tseTestDate`, `tseScore`) VALUES (150, 'Spring', 2016, 'Full-Time MIS', 'Enterprise Resource Planning (ERP) Management', true, false, 'Spring 2012', true, 'Fall 2010', 'Graduate', 3.07, 3.62, 'Roob Group', '2015-01-18', true, '2011-01-08', 15, 8, 443, true, '2011-10-18', 164, 169, 321, false, false, '2014-11-07', 72, 545, true, '2011-08-30', 59);

-- College Insert Statements
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (1, 'Memphis College of Art', '2014-12-13', '2015-03-26', 2.82, 111, 2, 'Bachelor''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (2, 'Rasmussen College, North Dakota Campuses', '2012-08-10', '2016-05-06', 2.07, 135, 16, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (3, 'The Southern Christian University', '2010-04-08', '2016-10-03', 2.9, 112, 6, 'Master''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (4, 'Bergen University College', '2011-03-04', '2016-12-26', 2.66, 112, 0, 'Associate''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (5, 'Aarhus School of Business', '2012-04-03', '2015-06-07', 3.58, 124, 8, 'Associate''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (6, 'Western University', '2011-04-11', '2015-02-20', 3.45, 116, 4, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (7, 'Donetsk National University', '2013-10-23', '2015-09-08', 2.47, 121, 2, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (8, 'Baltimore Hebrew University', '2012-02-01', '2015-10-22', 3.59, 90, 6, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (9, 'Antioch University Seattle', '2012-09-16', '2015-11-24', 3.13, 101, 16, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (10, 'Capital University', '2012-08-05', '2015-10-04', 3.75, 95, 16, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (11, 'Imam Khomeini International University', '2012-09-02', '2015-08-15', 3.81, 140, 7, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (12, 'Crichton College', '2013-03-20', '2016-07-14', 2.2, 117, 14, 'Associate''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (13, 'University of Petroleum (East China)', '2014-01-28', '2016-07-19', 3.53, 121, 18, 'Master''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (14, 'St Clements University - Higher Education School', '2014-04-01', '2016-01-28', 2.41, 70, 17, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (15, 'University of Pittsburgh at Greensburg', '2010-03-25', '2016-10-23', 3.74, 100, 1, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (16, 'Université Catholique de Bukavu', '2013-06-14', '2016-03-14', 2.65, 122, 8, 'Associate''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (17, 'Kanazawa Gakuin University', '2014-10-04', '2015-10-31', 2.4, 95, 0, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (18, 'Chittagong University of Engineering and Technology', '2013-12-23', '2016-11-04', 3.31, 63, 5, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (19, 'Ecole Supérieure de Commerce et des Affaires', '2014-10-26', '2016-08-29', 3.0, 112, 3, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (20, 'Mount St. Mary''s College California', '2013-07-14', '2015-05-15', 3.04, 118, 8, 'Associate''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (21, 'Sanford-Brown Institute', '2013-07-09', '2016-08-31', 3.19, 134, 3, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (22, 'Université Kofi Annan', '2012-10-02', '2016-11-13', 2.74, 78, 4, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (23, 'Universidad Catolica de La Santísima Concepción', '2011-12-03', '2016-05-12', 3.33, 135, 14, 'Master''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (24, 'University of Texas at El Paso', '2011-04-19', '2015-02-15', 2.64, 66, 10, 'Bachelor''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (25, 'University of Ontario Institute of Technology', '2010-07-05', '2016-02-17', 2.35, 150, 11, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (26, 'American Business & Technology University', '2014-01-29', '2016-04-21', 2.68, 60, 11, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (27, 'European Open University', '2012-09-26', '2015-05-15', 3.47, 142, 3, 'Associate''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (28, 'Reformed Theological Academy of Debrecen', '2011-03-11', '2016-11-09', 3.46, 67, 8, 'Master''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (29, 'La Salle University', '2014-03-02', '2016-08-14', 3.17, 78, 17, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (30, 'Urbana University', '2012-02-21', '2016-10-07', 3.87, 98, 0, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (31, 'Cornell University', '2012-05-16', '2016-03-22', 2.7, 74, 11, 'Master''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (32, 'Southern Illinois University at Carbondale', '2011-01-18', '2015-11-13', 2.05, 115, 6, 'Associate''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (33, 'Yerevan Haibusak University', '2014-04-19', '2015-06-21', 2.7, 144, 8, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (34, 'Umaru Musa Yar''Adua University ', '2013-02-06', '2016-05-18', 3.99, 92, 6, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (35, 'Semera University', '2011-04-26', '2016-05-12', 2.59, 87, 17, 'Associate''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (36, 'New Jersey City University', '2013-12-09', '2015-11-22', 2.61, 135, 12, 'Associate''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (37, 'Asa University Bangladesh', '2014-04-13', '2016-01-05', 2.36, 76, 9, 'Associate''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (38, 'Franklin W. Olin College of Engineering', '2012-04-01', '2016-08-25', 3.72, 76, 7, 'Master''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (39, 'Kilis 7 Aralık University', '2011-02-03', '2015-08-17', 2.44, 115, 1, 'Bachelor''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (40, 'Fine Arts Academy "Jan Matejko" in Cracow', '2014-12-22', '2015-02-03', 2.13, 99, 17, 'Associate''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (41, 'Denver Technical College', '2014-01-19', '2015-10-12', 2.49, 69, 12, 'Associate''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (42, 'Medical College of Ohio', '2013-01-02', '2016-05-30', 3.55, 124, 4, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (43, 'Azerbaijan National Conservatorie', '2014-09-25', '2015-04-26', 2.03, 100, 17, 'Bachelor''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (44, 'University of Northern Virginia, Prague Campus', '2014-09-16', '2015-07-08', 2.9, 146, 7, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (45, 'Universidad Interamericana de Educacion a Distancia de Panama', '2011-05-15', '2015-06-17', 2.76, 74, 3, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (46, 'Fachhochschule Burgenland', '2012-10-18', '2016-10-31', 2.42, 128, 18, 'Bachelor''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (47, 'St. Andrews Presbyterian College', '2011-08-23', '2016-02-03', 2.44, 61, 18, 'Master''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (48, 'St.Kliment Ohridski University', '2011-06-27', '2016-01-14', 2.69, 128, 10, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (49, 'Pabna University of Science and Technology', '2010-12-30', '2016-09-23', 3.06, 129, 5, 'Master''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (50, 'Hochschule für Technik und Wirtschaft des Saarlandes', '2010-03-14', '2016-08-04', 2.12, 80, 4, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (51, 'Universidade Cidade de São Paulo', '2011-01-05', '2015-05-16', 3.56, 93, 7, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (52, 'Texas A&M University - Commerce', '2014-10-24', '2015-03-21', 2.82, 134, 13, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (53, 'University "Titu Maiorescu"', '2014-07-28', '2015-05-03', 2.96, 108, 4, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (54, 'National American University, Roseville', '2010-12-17', '2015-05-24', 2.53, 85, 9, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (55, 'Kongju National University', '2010-05-17', '2016-02-23', 2.05, 138, 11, 'Bachelor''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (56, 'Canterbury Christ Church University', '2011-07-05', '2015-07-10', 3.56, 87, 11, 'Master''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (57, 'University of Maryland University College', '2014-05-13', '2016-07-16', 2.23, 116, 3, 'Bachelor''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (58, 'Kebbi State University of Science and Technology', '2014-07-25', '2016-01-28', 2.38, 123, 9, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (59, 'Odessa National Maritime Academy', '2010-07-02', '2015-11-30', 2.13, 134, 16, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (60, 'Iwate Prefectural University', '2012-11-08', '2015-07-16', 3.11, 99, 1, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (61, 'Technological University (Mawlamyaing)', '2013-01-19', '2015-05-25', 2.02, 85, 18, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (62, 'Islamic Azad University, Parand', '2010-03-20', '2016-11-23', 2.42, 144, 3, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (63, 'Ecole Supérieure de Commerce de Bordeaux', '2012-02-16', '2015-11-29', 3.41, 86, 4, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (64, 'Southern Connecticut State University', '2010-09-18', '2015-04-30', 3.96, 81, 17, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (65, 'Sultan Qaboos University', '2014-10-30', '2015-08-03', 2.79, 99, 11, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (66, 'Central University College', '2014-12-16', '2016-09-29', 2.22, 141, 0, 'Associate''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (67, 'Washington State University', '2010-06-18', '2015-04-28', 2.44, 68, 5, 'Associate''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (68, 'Pädagogische Hochschule Karlsruhe', '2014-04-13', '2016-06-10', 3.02, 88, 14, 'Master''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (69, 'University of Rajasthan', '2010-08-28', '2016-01-04', 3.91, 149, 12, 'Associate''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (70, 'Kyungpook National University', '2012-08-31', '2016-09-22', 2.13, 60, 15, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (71, 'Barton College', '2011-11-10', '2015-10-08', 2.32, 134, 1, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (72, 'University of Regina', '2014-10-28', '2016-05-16', 2.26, 146, 8, 'Associate''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (73, 'Centro Universitario Villanueva', '2013-04-24', '2016-11-11', 2.24, 108, 3, 'Associate''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (74, 'Capitol University', '2011-03-15', '2016-07-07', 3.29, 89, 2, 'Bachelor''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (75, 'Nagpur University', '2014-11-10', '2016-04-05', 2.9, 69, 4, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (76, 'University of Calabar', '2013-03-16', '2015-01-07', 3.32, 84, 5, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (77, 'Samara State Technical University', '2014-07-29', '2016-09-02', 2.69, 149, 3, 'Associate''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (78, 'DCT International Hotel & Business Management School', '2012-05-11', '2015-12-14', 2.19, 85, 8, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (79, 'La Sierra University', '2011-07-06', '2015-08-29', 3.5, 100, 15, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (80, 'Pusan National University', '2013-10-11', '2016-12-29', 2.77, 62, 0, 'Bachelor''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (81, 'Hesser College', '2011-07-23', '2015-02-27', 2.83, 112, 7, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (82, 'State University of New York at Stony Brook', '2014-03-31', '2016-07-05', 3.59, 95, 5, 'Associate''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (83, 'Japan College of Social Work', '2010-10-08', '2016-05-31', 3.82, 144, 11, 'Master''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (84, 'Australian Correspondence Schools', '2011-07-22', '2015-05-14', 3.91, 108, 17, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (85, 'Cedarville College', '2012-03-01', '2016-09-29', 2.7, 106, 18, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (86, 'Ural State Forestry Technical Academy', '2014-11-01', '2016-02-14', 3.16, 118, 12, 'Associate''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (87, 'Minamikyushu University', '2010-06-11', '2016-02-14', 3.65, 141, 11, 'Bachelor''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (88, 'Université Robert Schuman (Strasbourg III)', '2010-08-15', '2015-03-30', 3.99, 115, 14, 'Master''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (89, 'National Technical University (Kiev Politechnical Institute)', '2013-10-08', '2015-06-29', 3.56, 125, 10, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (90, 'Universidad El Bosque', '2014-05-11', '2016-05-31', 3.92, 144, 10, 'Associate''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (91, 'Chuo Gakuin University', '2012-01-06', '2015-01-06', 3.03, 121, 5, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (92, 'Katharine Gibbs School', '2010-11-09', '2015-08-15', 2.43, 106, 1, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (93, 'Police Academy of Latvia', '2013-03-14', '2015-04-29', 3.6, 144, 7, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (94, 'London Metropolitan University', '2014-01-12', '2015-08-13', 2.02, 132, 0, 'Bachelor''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (95, 'Westsächsische Hochschule Zwickau (FH)', '2011-08-06', '2016-03-19', 2.06, 71, 11, 'Bachelor''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (96, 'Rivers State University of Science and Technology', '2012-10-09', '2015-05-18', 3.68, 77, 16, 'Bachelor''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (97, 'Maryam Institute of Higher Education', '2014-09-29', '2015-01-06', 3.4, 99, 18, 'Master''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (98, 'Higher School o Business in Tarnow', '2011-07-31', '2016-04-16', 2.76, 124, 12, 'Associate''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (99, 'Université Mohammed V - Agdal', '2011-01-24', '2015-12-11', 3.55, 123, 7, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (100, 'Reformed Bible College', '2011-08-22', '2016-04-14', 3.07, 128, 16, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (101, 'École des Hautes Études Commerciales', '2010-10-02', '2016-01-16', 2.39, 123, 3, 'Master''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (102, 'Shikoku University', '2010-10-31', '2016-05-12', 2.3, 149, 4, 'Master''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (103, 'University of Elbasan "Aleksander Xhuvani"', '2010-12-12', '2016-08-03', 3.4, 103, 2, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (104, 'University of California, Merced', '2010-07-17', '2015-05-19', 3.49, 97, 6, 'Master''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (105, 'Shibaura Institute of Technology', '2014-12-05', '2016-09-27', 2.66, 133, 12, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (106, 'Annamalai University', '2012-07-02', '2015-02-28', 2.32, 71, 7, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (107, 'Doshisha University', '2013-02-27', '2015-04-08', 2.41, 110, 7, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (108, 'University Institute of Architecture Venice', '2013-01-06', '2016-09-04', 3.08, 122, 13, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (109, 'Universitas Gunadarma', '2010-05-13', '2016-08-13', 3.71, 134, 11, 'Bachelor''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (110, 'South Dakota School of Mines and Technology', '2013-08-19', '2016-06-25', 3.97, 150, 2, 'Bachelor''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (111, 'Universidad Adventista de Chile', '2013-08-21', '2015-02-15', 2.85, 134, 1, 'Associate''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (112, 'Universitas Dian Nuswantoro', '2010-09-17', '2015-09-20', 2.59, 67, 12, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (113, 'Technological University (Hmawbi)', '2013-02-27', '2016-10-13', 2.58, 83, 13, 'Master''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (114, 'International Business University of Beijing', '2012-07-21', '2015-03-06', 2.78, 65, 18, 'Bachelor''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (115, 'Atlanta Christian College', '2010-08-26', '2016-04-27', 2.69, 68, 13, 'Bachelor''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (116, 'Upper Nile University', '2012-03-08', '2015-01-22', 3.4, 103, 7, 'Associate''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (117, 'College of Technology at Dammam', '2014-06-07', '2015-09-06', 3.24, 147, 3, 'Associate''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (118, 'California State University, Monterey Bay', '2011-01-16', '2016-05-22', 2.66, 136, 13, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (119, 'Kumamoto University', '2012-12-20', '2016-05-08', 3.68, 73, 11, 'Bachelor''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (120, 'University of Pardubice', '2013-08-08', '2015-09-12', 3.18, 146, 11, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (121, 'University of Medicine and Dentistry of New Jersey', '2012-02-04', '2016-11-21', 3.52, 65, 7, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (122, 'Universität für Musik und darstellende Kunst Graz', '2010-10-11', '2015-06-26', 3.08, 70, 15, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (123, 'Universidad de Lambayeque', '2014-08-27', '2015-10-28', 2.18, 147, 1, 'Bachelor''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (124, 'Semyung University', '2013-11-08', '2015-01-19', 2.46, 119, 16, 'Bachelor''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (125, 'Yunnan University', '2014-12-05', '2015-02-27', 3.2, 136, 12, 'Associate''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (126, 'Bamiyan University', '2013-06-26', '2015-03-01', 3.57, 97, 13, 'Master''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (127, 'Universiti Pendidikan Sultan Idris', '2013-01-03', '2016-09-23', 2.46, 93, 14, 'Master''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (128, 'Thomas More College of Liberal Arts', '2011-09-17', '2015-07-04', 3.61, 85, 18, 'Associate''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (129, 'California State University, Bakersfield', '2013-11-16', '2015-03-17', 3.37, 137, 14, 'Associate''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (130, 'State University of New York College of Technology at Alfred', '2010-10-26', '2015-04-28', 2.83, 125, 7, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (131, 'Namik Kemal University', '2010-04-02', '2015-12-08', 3.36, 112, 16, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (132, 'Hochschule Bremen', '2014-03-12', '2016-10-18', 2.98, 106, 8, 'Bachelor''s Degree', 'Supply Chain Management');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (133, 'Pangasinan State University', '2011-07-18', '2016-01-12', 2.47, 128, 15, 'Associate''s Degree', 'Finance');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (134, 'Miami University of Ohio - Hamilton', '2010-03-02', '2016-12-04', 3.52, 69, 6, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (135, 'Komar University of Science and Technology', '2012-11-17', '2015-11-05', 3.46, 117, 14, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (136, 'Austin Community College', '2013-10-31', '2015-04-03', 2.28, 134, 2, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (137, 'Universidad del Turismo', '2013-03-04', '2016-03-01', 2.75, 102, 4, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (138, 'Baker College of Owosso', '2011-08-26', '2016-04-29', 2.29, 63, 13, 'Master''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (139, 'Universidad Nacional de Formosa', '2011-04-07', '2015-12-13', 3.3, 134, 16, 'Master''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (140, 'Mazandaran University of Medical Science', '2014-12-03', '2016-04-08', 2.78, 69, 14, 'Master''s Degree', 'Accounting');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (141, 'Universität Ulm', '2011-09-29', '2015-09-23', 2.16, 96, 5, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (142, 'Toyota Technological Institute', '2013-01-20', '2015-04-27', 2.8, 101, 9, 'Associate''s Degree', 'Marketing');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (143, 'Maritime University in Szczecin', '2013-01-03', '2016-03-08', 3.63, 91, 4, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (144, 'Ho Chi Minh City University of Medicine and Pharmacy', '2011-09-25', '2015-05-30', 2.11, 136, 11, 'Associate''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (145, 'Beni Suef University', '2012-11-07', '2015-10-31', 3.13, 138, 7, 'Associate''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (146, 'Universidad Católica de Córdoba', '2011-07-27', '2015-03-11', 3.26, 147, 0, 'Bachelor''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (147, 'Universitas Bunda Mulia Jakarta', '2010-08-03', '2015-07-01', 3.58, 112, 16, 'Associate''s Degree', 'Information Systems');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (148, 'Jawaharlal Nehru Centre for Advanced  Scientific Research', '2014-08-24', '2015-09-11', 3.97, 124, 8, 'Bachelor''s Degree', 'Economics');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (149, 'Ivanovo State Academy of Medicine', '2012-03-21', '2016-07-10', 2.01, 88, 13, 'Master''s Degree', 'Business Administration');
INSERT INTO `college` (`applicationID`, `collegeName`, `dateStarted`, `dateEnded`, `gpa`, `hoursEarned`, `hoursEnrolled`, `degree`, `major`) VALUES (150, 'Universidad de Navarra', '2014-08-30', '2015-08-21', 3.47, 102, 13, 'Bachelor''s Degree', 'Information Systems');

-- Room Insert Statements
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0144');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0216');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0217');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0218');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0220');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0222');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0224');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0230');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0235');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0116');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0230');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0234');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0240');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0244');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0250');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0320');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0430');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0431');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0432');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0210');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0212');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0218');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0220');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0318');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0144');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0216');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0217');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0218');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0220');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0222');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0224');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0230');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('JBHT', '0235');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0116');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0230');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0234');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0240');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0244');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0250');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0320');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0430');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0431');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WCOB', '0432');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0210');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0212');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0218');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0220');
INSERT INTO `room` (`building`, `roomNumber`) VALUES ('WJWH', '0318');

-- Course Insert Statements
INSERT INTO `course` VALUES ('ISYS 4243', 'Current Topics in Computer Information', "Intensive investigation of selected developments in computer information systems hardware, software, and organization having current impact on computer information systems design and application. Offering an extension of lower-level CIS courses through individual student research and faculty team-teaching of advanced topics. Topical selection made with each course offering. Prerequisite: Junior standing. May be repeated for up to 6 hours of degree credit.", 3, 'Irregular');
INSERT INTO `course` VALUES ('ISYS 4373', 'Application Development with Java', "This course covers object-oriented programming concepts and illustrates them via an appropriate object-oriented programming language. Students will be exposed to the design of software objects, creation of software objects, and the use of objects in constructing an information system. Prerequisite: ISYS 3293 with a grade of C or better.", 3, 'Fall');
INSERT INTO `course` VALUES ('ISYS 450V', 'Independent Study', "Permits students on individual basis to explore selected topics in data processing and/or Quantitative Analysis.", 3, 'Fall, Spring');
INSERT INTO `course` VALUES ('ISYS 511V', 'IT Toolkit & Skills Seminar', "Seminar in Information Systems solutions and concepts (such as applications development, VB.NET, analysis of problems and design of solutions via application systems, etc.) designed for students entering the MIS program--may not be used for MIS degree credit. Prerequisite: MIS Director approval. May be repeated for up to 3 hours of degree credit.", 3, 'Irregular');
INSERT INTO `course` VALUES ('ISYS 5133', 'E Business Development', "This course explores various e-business development technologies and then utilizes the technologies for developing a relatively realistic business-to-consumer (B2C) e-business site. Students will also learn about Business to Business (B2B) strategies, market exchanges, XML and XML Web services applications. Simple XML Web services will also be created.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 5203', 'Experimental Design', "ANOVA, experimental design, introduction to basis of statistics. Prerequisite: Graduate standing and WCOB 1033 or equivalent.", 3, 'Fall');
INSERT INTO `course` VALUES ('ISYS 5213', 'ERP Fundamentals', "An introduction to enterprise resource planning systems. Students should gain an understanding of the scope of these integrated systems that reach across organizational boundaries and can change how a company does business. Implementation issues are covered, including the importance of change management. Prerequisite: Graduate standing.", 3, 'Fall, Summer');
INSERT INTO `course` VALUES ('ISYS 5223', 'ERP Configuration and Implementation', "The process of configuring and implementing an enterprise resource planning system. Business process analysis and integration. Students will develop a company and set up several modules in SAP for use. Develop understanding of how the business processes work and integrate. Prerequisite: ISYS 5213 or equivalent.", 3, 'Fall');
INSERT INTO `course` VALUES ('ISYS 5233', 'Seminar in ERP Development', "ERP administration and system development practices. Advanced system support issues related to Enterprise Resource Planning systems that are used in global organizations. Basic ABAP programming. In addition, students will learn how to provide basic systems administration support of the operating system, database, and application systems software levels of ERP systems. Pre- or Corequisite: WCOB 5223. Prerequisite: WCOB 5213. May be repeated for up to 6 hours of degree credit.", 3, 'Irregular');
INSERT INTO `course` VALUES ('ISYS 535V', 'Internship Experience', "This course allows a student to experience an internship within a business and benefit from the work experience. The internship focuses on applications and business problems and is supervised by a faculty member as well as a member of the company/firm. Prerequisite: MIS Director approval is required. May be repeated for up to 6 hours of degree credit.", 6, 'Fall, Spring, Summer');
INSERT INTO `course` VALUES ('ISYS 5363', 'Business Analytics', "This course in managerial business analytics provides future managers with the key concepts of decision modeling and information technology management concepts. Students will learn to utilize real time operational business data, as well as quickly process and effectively leverage information. In addition, students will exercise strategic IT deployment skills for supply chain and marketing processes as well as develop strong decision modeling abilities.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 5403', 'Quantitative Methods and Decision Making', "Utilization of information, quantitative techniques, and computer application in decision making and problem solving for managers. This course is cross-listed with SCMT 5133.", 3, 'Irregular');
INSERT INTO `course` VALUES ('ISYS 5423', 'Seminar in Systems Development', "Advanced study of structured systems development. Emphasis on strategies and techniques of structured analysis and structured design for producing logical systems specifications and for deriving physical systems designs. Coverage of methodologies for dealing with complexity in the development of information systems. Prerequisite: ISYS 3293 (or equivalent).", 3, 'Fall');
INSERT INTO `course` VALUES ('ISYS 5433', 'Enterprise Systems', "Enterprise Systems comprises the entire class of information technology and systems that support the mission of the company including decision support and business processes. This managerial enterprise systems course focuses on strategic issues of information technology. Students study the various elements and integration of an organization's business processes; as a result, students gain an understanding and working knowledge of systems used to support these business processes and their use in decision making. In addition, students will study concepts and develop skills needed to utilize decision-centric business intelligence and knowledge management applications.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 5453', 'Introduction to Enterprise Servers', "The focus of this course is to expose students to working with large scale mainframe computer systems. Mainframe computers are the heart of large company's transaction processing systems. This course provides the opportunity for students to gain valuable insight into computing in a mainframe operating environment.", 3, 'Fall');
INSERT INTO `course` VALUES ('ISYS 5463', 'Enterprise Transaction Systems', "Being able to accurately capture and store business transactions is an important processing function in many businesses. For many large companies with high volume processing, the tools of choice for transaction processing are CICS/Cobol/DB2. This course provides students with the necessary understanding and skills to work in this type environment. Pre- or Corequisite:ISYS 5453 (or equivalent) or MIS Director approval.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 5503', 'Decision Support and Analytics', "Analysis of the highest level of information support for the manager-user. A study of systems providing analytics-based information derived from databases within and/or external to the organization and used to support management in the decision making. Application of tools in business analytics, problem solving, and decision making.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 5603', 'Analytics and Visualization', "This course focuses on how to discern and tell your story visually using data based on traditional graphical data representation as well as the latest data and information technologies. Coverage includes both visualization theory and hands-on exercises using appropriate computing tools. The course will also include visualization of predictive, clustering, and association models. The opportunities and challenges of Big Data visualization will be explored. Prerequisite: ISYS 5503 or MBAD 513V and departmental consent.", 3, 'Fall');
INSERT INTO `course` VALUES ('ISYS 5613', 'Business Applications of Nonparametric Techniques', "(First offered Summer 2002, Formerly CISQ 5613) Consideration of business and economic research related to sampling and experimental design, testing of hypothesis, and using nonparametric tests. Prerequisite: ISYS 5203 or equivalent.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 5623', 'Multivariate Analysis', "Principal component analysis, regression analyses. Prerequisite: ISYS 5203.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 5713', 'Seminar in IS Topics', "Intensive seminar in selected information systems topics. Topical selection made with each course offering. Prerequisite: ISYS 511V or MIS Director approval. May be repeated for up to 9 hours of degree credit.", 3, 'Irregular');
INSERT INTO `course` VALUES ('ISYS 5723', 'Advanced Multivariate Analysis', "Factor analysis and other advanced techniques. Prerequisite: ISYS 5623.", 3, 'Irregular');
INSERT INTO `course` VALUES ('ISYS 5833', 'Data Management Systems', "Investigation and application of advanced database concepts include database administration, database technology, and selection and acquisition of database management systems. Data modeling and system development in a database environment. Pre- or Corequisite: ISYS 5423. Prerequisite: ISYS 511V.", 3, 'Fall, Spring');
INSERT INTO `course` VALUES ('ISYS 5843', 'Seminar in Business Intelligence and Knowledge Management', "Business intelligence focuses on assessing and creating information and knowledge from internal and external sources to support business decision making process. In this seminar, data mining and information retrieval techniques will be used to extract useful knowledge from data, which could be used for business intelligence, and knowledge management. Prerequisite:ISYS 5503 or equivalent and ISYS 5833 or equivalent.", 3, 'Fall, Spring');
INSERT INTO `course` VALUES ('ISYS 5933', 'Global Technology and Analytics Seminar', "This course is designed to provide an updated, comprehensive, and rigorous treatment of emerging global topics. Includes, but is not limited to, global study experiences, business insights, and foundational perspectives; examines significant issues from global perspectives. Prerequisite: Graduate standing and MIS Director approval.", 3, 'Summer');
INSERT INTO `course` VALUES ('ISYS 5943', 'Management of Information Technology Seminar', "Presented in a way that allows you to play an active role in the design, use, and management of information technology. Using IT to transform the organization, as competitive strategy, and creating new relationship with other firms is included. Prerequisite: ISYS 5423 and ISYS 5833.", 3, 'Spring');
INSERT INTO `course` VALUES ('ISYS 599V', 'Practicum Seminar', "This course is designed to introduce and engage the student in the practice, application, and problem solving in the business environment. Hands-on application of a business problem. Students will gain experience working on, making decisions about, and developing solutions for business applications. Topics include but not limited to analytics, data, and information technology.Prerequisite: Graduate standing and MIS Director approval. May be repeated for up to 6 hours of degree credit.", 6, 'Fall, Spring, Summer');

-- Class Insert Statements
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '07:30:00', '08:20:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '08:35:00', '09:25:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (3, 'TR', '08:00:00', '09:15:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '09:40:00', '10:30:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '10:45:00', '11:35:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '11:50:00', '13:40:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '09:30:00', '10:45:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '12:55:00', '13:45:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '11:00:00', '12:15:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MW', '15:05:00', '16:20:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MW', '16:35:00', '17:50:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '14:00:00', '14:50:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '15:05:00', '15:55:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'TR', '12:30:00', '13:45:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '14:00:00', '15:15:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'TR', '15:30:00', '16:45:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '18:00:00', '19:15:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '17:15:00', '18:05:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '07:30:00', '8:20:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'TR', '08:00:00', '09:15:00', 20, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5843');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '07:30:00', '08:20:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '08:35:00', '09:25:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (3, 'TR', '08:00:00', '09:15:00', 1, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 4373');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '09:40:00', '10:30:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '10:45:00', '11:35:00', 3, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 450V');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '11:50:00', '13:40:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '09:30:00', '10:45:00', 5, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5203');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '12:55:00', '13:45:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '11:00:00', '12:15:00', 6, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5213');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MW', '15:05:00', '16:20:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MW', '16:35:00', '17:50:00', 8, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5223');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '14:00:00', '14:50:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '15:05:00', '15:55:00', 11, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5423');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'TR', '12:30:00', '13:45:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '14:00:00', '15:15:00', 13, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5453');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'TR', '15:30:00', '16:45:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '18:00:00', '19:15:00', 15, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5603');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'MWF', '17:15:00', '18:05:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'MWF', '07:30:00', '8:20:00', 16, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5833');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (1, 'TR', '08:00:00', '09:15:00', 20, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5843');
INSERT INTO `class` (`section`, `day`, `startTime`, `endTime`, `roomID`, `startDate`, `endDate`, `instructionMode`, `status`, `courseID`) VALUES (2, 'TR', '09:30:00', '10:45:00', 20, '2017-08-21', '2017-12-07', 'P', 'Open', 'ISYS 5843');

-- Instructor Insert Statements
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Cash', 'Acrey', 'Clinical Assistant Professor', 'ISYS', 'jacrey@uark.edu', '479-575-1223', 1);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Brittany', 'Bright', 'Instructor', 'ISYS', 'bbright@uark.edu', '479-575-6121', 2);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Susan', 'Bristow', 'Clinical Assistant Professor', 'ISYS', 'sbristow@uark.edu', '479-575-4057', 3);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Paul', 'Cronan', 'Professor', 'ISYS', 'tcronan@uark.edu', '479-575-6130', 4);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('David', 'Douglas', 'University Professor', 'ISYS', 'ddouglas@uark.edu', '479-575-6114', 5);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Joseph', 'Ehrhardt', 'Instructor', 'ISYS', 'jehrhardt@uark.edu', '479-575-1546', 6);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Ron', 'Freeze', 'Clinical Associate Professor', 'ISYS', 'rfreeze@uark.edu', '479-575-4564', 7);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Hartmut', 'Hoehle', 'Assistant Professor', 'ISYS', 'hhoehle@uark.edu', '479-575-5654', 8);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Phillip', 'Kindy', 'Instructor', 'ISYS', 'pkindy@uark.edu', '479-575-6563', 9);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Xiao', 'Ma', 'Assistant Professor', 'ISYS', 'xma@uark.edu', '479-575-1379', 10);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Andrew', 'Mackey', 'Instructor', 'ISYS', 'amackey@uark.edu', '479-575-7854', 11);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Suresh', 'Malladi', 'Assistant Professor', 'ISYS', 'smalladi@uark.edu', '479-575-7985', 12);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Beverly', 'McDaniel', 'Instructor', 'ISYS', 'bmcdaniel@uark.edu', '479-575-4554', 13);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Jeff', 'Mullins', 'Executive in Residence', 'ISYS', 'jmullins@uark.edu', '479-575-4113', 14);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Rajiv', 'Sabherwal', 'Professor', 'ISYS', 'rsabherwal@uark.edu', '479-575-7879', 15);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Christina', 'Serrano', 'Assistant Professor', 'ISYS', 'cserrano@uark.edu', '479-575-9423', 16);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Pankaj', 'Setia', 'Associate Professor', 'ISYS', 'psetia@uark.edu', '479-575-6454', 17);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Tracy', 'Sykes', 'Associate Professor', 'ISYS', 'tsykes@uark.edu', '479-575-7776', 18);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Viswanath', 'Venkatesh', 'Distinguished Professor', 'ISYS', 'vvenkatesh@uark.edu', '479-575-2332', 19);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Cash', 'Acrey', 'Clinical Assistant Professor', 'ISYS', 'jacrey@uark.edu', '479-575-1223', 1);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Brittany', 'Bright', 'Instructor', 'ISYS', 'bbright@uark.edu', '479-575-6121', 2);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Susan', 'Bristow', 'Clinical Assistant Professor', 'ISYS', 'sbristow@uark.edu', '479-575-4057', 3);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Paul', 'Cronan', 'Professor', 'ISYS', 'tcronan@uark.edu', '479-575-6130', 4);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('David', 'Douglas', 'University Professor', 'ISYS', 'ddouglas@uark.edu', '479-575-6114', 5);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Joseph', 'Ehrhardt', 'Instructor', 'ISYS', 'jehrhardt@uark.edu', '479-575-1546', 6);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Ron', 'Freeze', 'Clinical Associate Professor', 'ISYS', 'rfreeze@uark.edu', '479-575-4564', 7);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Hartmut', 'Hoehle', 'Assistant Professor', 'ISYS', 'hhoehle@uark.edu', '479-575-5654', 8);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Phillip', 'Kindy', 'Instructor', 'ISYS', 'pkindy@uark.edu', '479-575-6563', 9);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Xiao', 'Ma', 'Assistant Professor', 'ISYS', 'xma@uark.edu', '479-575-1379', 10);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Andrew', 'Mackey', 'Instructor', 'ISYS', 'amackey@uark.edu', '479-575-7854', 11);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Suresh', 'Malladi', 'Assistant Professor', 'ISYS', 'smalladi@uark.edu', '479-575-7985', 12);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Beverly', 'McDaniel', 'Instructor', 'ISYS', 'bmcdaniel@uark.edu', '479-575-4554', 13);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Jeff', 'Mullins', 'Executive in Residence', 'ISYS', 'jmullins@uark.edu', '479-575-4113', 14);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Rajiv', 'Sabherwal', 'Professor', 'ISYS', 'rsabherwal@uark.edu', '479-575-7879', 15);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Christina', 'Serrano', 'Assistant Professor', 'ISYS', 'cserrano@uark.edu', '479-575-9423', 16);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Pankaj', 'Setia', 'Associate Professor', 'ISYS', 'psetia@uark.edu', '479-575-6454', 17);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Tracy', 'Sykes', 'Associate Professor', 'ISYS', 'tsykes@uark.edu', '479-575-7776', 18);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Viswanath', 'Venkatesh', 'Distinguished Professor', 'ISYS', 'vvenkatesh@uark.edu', '479-575-2332', 19);
INSERT INTO `instructor` (`firstName`, `lastName`, `title`, `department`, `email`, `phone`, `roomID`) VALUES ('Adriana', 'Wilhelm', 'Instructor', 'ISYS', 'awilhelm@uark.edu', '479-575-9882', 20);

-- Class Instructor Insert Statements
INSERT INTO `class_instructor` VALUES (1, 3, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (2, 3, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (3, 3, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (4, 2, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (5, 2, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (6, 4, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (7, 4, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (8, 7, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (9, 7, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (10, 11, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (11, 11, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (12, 13, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (13, 13, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (14, 15, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (15, 15, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (16, 18, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (17, 18, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (18, 6, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (19, 6, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (20, 1, 'Fall', '2017');
INSERT INTO `class_instructor` VALUES (21, 1, 'Fall', '2017');

-- Student Class Insert Statements
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (1, 1, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (2, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (3, 2, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (4, 4, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (5, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (6, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (7, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (8, 1, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (9, 2, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (10, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (11, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (12, 4, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (13, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (14, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (15, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (16, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (17, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (18, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (19, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (20, 1, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (21, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (22, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (23, 4, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (24, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (25, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (26, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (27, 2, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (28, 3, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (29, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (30, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (31, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (32, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (33, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (34, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (35, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (36, 1, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (37, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (38, 5, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (39, 2, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (40, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (41, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (42, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (43, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (44, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (45, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (46, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (47, 3, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (48, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (49, 1, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (50, 2, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (51, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (52, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (53, 4, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (54, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (55, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (56, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (57, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (58, 1, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (59, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (60, 5, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (61, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (62, 1, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (63, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (64, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (65, 3, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (66, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (67, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (68, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (69, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (70, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (71, 3, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (72, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (73, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (74, 2, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (75, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (76, 2, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (77, 2, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (78, 5, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (79, 3, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (80, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (81, 4, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (82, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (83, 1, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (84, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (85, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (86, 4, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (87, 2, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (88, 1, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (89, 4, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (90, 4, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (91, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (92, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (93, 1, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (94, 1, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (95, 2, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (96, 5, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (97, 3, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (98, 5, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (99, 4, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (100, 1, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (1, 7, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (2, 8, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (3, 8, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (4, 7, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (5, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (6, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (7, 6, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (8, 6, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (9, 6, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (10, 10, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (11, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (12, 7, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (13, 8, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (14, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (15, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (16, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (17, 8, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (18, 7, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (19, 10, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (20, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (21, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (22, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (23, 6, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (24, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (25, 7, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (26, 7, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (27, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (28, 6, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (29, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (30, 8, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (31, 8, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (32, 9, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (33, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (34, 8, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (35, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (36, 10, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (37, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (38, 6, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (39, 9, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (40, 6, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (41, 6, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (42, 7, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (43, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (44, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (45, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (46, 6, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (47, 8, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (48, 9, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (49, 10, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (50, 7, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (51, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (52, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (53, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (54, 8, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (55, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (56, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (57, 7, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (58, 6, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (59, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (60, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (61, 9, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (62, 10, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (63, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (64, 7, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (65, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (66, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (67, 8, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (68, 8, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (69, 8, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (70, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (71, 10, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (72, 8, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (73, 8, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (74, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (75, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (76, 8, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (77, 7, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (78, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (79, 7, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (80, 10, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (81, 8, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (82, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (83, 6, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (84, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (85, 7, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (86, 8, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (87, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (88, 6, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (89, 6, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (90, 10, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (91, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (92, 9, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (93, 9, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (94, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (95, 6, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (96, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (97, 9, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (98, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (99, 6, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (100, 10, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (1, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (2, 13, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (3, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (4, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (5, 13, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (6, 13, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (7, 11, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (8, 12, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (9, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (10, 14, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (11, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (12, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (13, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (14, 11, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (15, 15, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (16, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (17, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (18, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (19, 12, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (20, 11, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (21, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (22, 15, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (23, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (24, 14, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (25, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (26, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (27, 13, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (28, 15, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (29, 13, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (30, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (31, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (32, 12, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (33, 15, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (34, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (35, 15, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (36, 15, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (37, 12, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (38, 12, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (39, 11, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (40, 11, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (41, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (42, 14, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (43, 13, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (44, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (45, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (46, 12, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (47, 13, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (48, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (49, 12, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (50, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (51, 11, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (52, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (53, 12, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (54, 15, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (55, 16, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (56, 13, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (57, 15, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (58, 11, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (59, 12, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (60, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (61, 11, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (62, 13, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (63, 12, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (64, 12, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (65, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (66, 11, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (67, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (68, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (69, 12, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (70, 11, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (71, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (72, 11, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (73, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (74, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (75, 14, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (76, 13, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (77, 15, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (78, 15, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (79, 15, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (80, 11, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (81, 12, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (82, 11, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (83, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (84, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (85, 14, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (86, 13, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (87, 13, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (88, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (89, 14, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (90, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (91, 11, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (92, 13, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (93, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (94, 16, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (95, 12, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (96, 15, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (97, 12, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (98, 15, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (99, 16, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (100, 14, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (1, 21, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (2, 20, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (3, 20, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (4, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (5, 17, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (6, 19, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (7, 21, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (8, 18, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (9, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (10, 19, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (11, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (12, 17, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (13, 19, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (14, 18, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (15, 20, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (16, 18, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (17, 18, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (18, 19, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (19, 17, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (20, 21, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (21, 18, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (22, 18, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (23, 18, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (24, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (25, 20, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (26, 18, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (27, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (28, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (29, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (30, 19, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (31, 19, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (32, 20, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (33, 17, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (34, 17, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (35, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (36, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (37, 20, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (38, 20, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (39, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (40, 19, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (41, 17, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (42, 17, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (43, 21, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (44, 18, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (45, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (46, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (47, 19, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (48, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (49, 18, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (50, 17, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (51, 18, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (52, 20, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (53, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (54, 18, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (55, 17, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (56, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (57, 19, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (58, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (59, 19, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (60, 21, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (61, 20, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (62, 20, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (63, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (64, 20, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (65, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (66, 18, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (67, 19, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (68, 18, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (69, 17, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (70, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (71, 19, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (72, 17, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (73, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (74, 17, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (75, 19, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (76, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (77, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (78, 20, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (79, 20, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (80, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (81, 19, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (82, 17, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (83, 17, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (84, 19, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (85, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (86, 20, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (87, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (88, 21, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (89, 19, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (90, 20, 4, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (91, 18, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (92, 20, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (93, 20, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (94, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (95, 17, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (96, 20, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (97, 21, 3, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (98, 21, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (99, 19, 2, 'Fall', 2017);
INSERT INTO `student_class` (`studentID`, `classID`, `grade`, `term`, `year`) VALUES (100, 19, 2, 'Fall', 2017);