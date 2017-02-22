USE `uark`;

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

CREATE TABLE `zip_code` (
  `zipCode` VARCHAR(5) NOT NULL,
  `zipCodeExt` VARCHAR(4) DEFAULT NULL,
  PRIMARY KEY (`zipCode`)
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
  FOREIGN KEY (`zipCode`) REFERENCES `zip_code`(`zipCode`),
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
  `dateOfBirth` date NOT NULL,
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
  `building` VARCHAR(50) NOT NULL,
  `roomNumber` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`roomID`)
);

CREATE TABLE `course` (
  `courseID` VARCHAR(10) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `section` SMALLINT NOT NULL DEFAULT 1,
  `day` VARCHAR(25) NOT NULL,
  `startTime` TIME NOT NULL,
  `endTime` TIME NOT NULL,
  `roomID` INT(11) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `instructionMode` CHAR(2) NOT NULL DEFAULT 'P',
  `status` VARCHAR(10) NOT NULL DEFAULT 'Open',
  `offered` VARCHAR(10) NOT NULL DEFAULT 'All',
  PRIMARY KEY (`courseID`),
  FOREIGN KEY (`roomID`) REFERENCES `room`(`roomID`)
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

CREATE TABLE `course_instructor` (
  `courseID` VARCHAR(10) NOT NULL,
  `instructorID` INT(11) NOT NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4) NOT NULL,
  PRIMARY KEY (`courseID`, `instructorID`),
  FOREIGN KEY (`courseID`) REFERENCES `course`(`courseID`),
  FOREIGN KEY (`instructorID`) REFERENCES `instructor`(`instructorID`)
);

CREATE TABLE `student_course` (
  `studentID` INT(11) NOT NULL,
  `courseID` VARCHAR(10) NOT NULL,
  `grade` DECIMAL(2,1) NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4) NOT NULL,
  PRIMARY KEY (`studentID`, `courseID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`),
  FOREIGN KEY (`courseID`) REFERENCES `course`(`courseID`)
);