CREATE DATABASE `uark` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci;

CREATE TABLE `user` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(30) NOT NULL,
  `middleName` VARCHAR(30) DEFAULT NULL,
  `lastName` VARCHAR(30) NOT NULL,
  `preferredName` VARCHAR(90) DEFAULT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `username` VARCHAR(15) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `adminRole` BOOLEAN NOT NULL DEFAULT 0,
  `supervisorRole` BOOLEAN NOT NULL DEFAULT 0,
  `committeeRole` BOOLEAN NOT NULL DEFAULT 0,
  `advisorRole` BOOLEAN NOT NULL DEFAULT 0,
  `gaRole` BOOLEAN NOT NULL DEFAULT 0,
);


CREATE TABLE `user` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `username` VARCHAR(15) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `adminRole` BOOLEAN NOT NULL DEFAULT 0,
  `supervisorRole` BOOLEAN NOT NULL DEFAULT 0,
  `committeeRole` BOOLEAN NOT NULL DEFAULT 0,
  `advisorRole` BOOLEAN NOT NULL DEFAULT 0,
  `gaRole` BOOLEAN NOT NULL DEFAULT 0,
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

CREATE TABLE `faculty` (
  `facultyID` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(30) NOT NULL,
  `lastName` VARCHAR(30) NOT NULL,
  `title` VARCHAR(50) NULL,
  `department` VARCHAR(25) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NULL,
  `roomID` INT(11) NOT NULL,
  PRIMARY KEY (`facultyID`),
  FOREIGN KEY (`roomID`) REFERENCES `room`(`roomID`)
);

CREATE TABLE `class_faculty` (
  `classID` INT(11) NOT NULL,
  `facultyID` INT(11) NOT NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4) NOT NULL,
  PRIMARY KEY (`classID`, `facultyID`),
  FOREIGN KEY (`classID`) REFERENCES `class`(`classID`),
  FOREIGN KEY (`facultyID`) REFERENCES `faculty`(`facultyID`)
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

CREATE TABLE `interview_file` (
  `fileID` INT(11) AUTO_INCREMENT,
  `fileName` CHAR(32) NOT NULL,
  `applicationID` INT(11) NOT NULL,
  FOREIGN KEY (`applicationID`) REFERENCES `application`(`applicationID`),
  PRIMARY KEY (`fileID`)
)

CREATE TABLE `advising` (
  `studentID` INT(11) NOT NULL,
  `classID` INT(11) NOT NULL,
  `term` VARCHAR(25) NOT NULL,
  `year` YEAR(4) NOT NULL,
  `date` DATE NOT NULL,
  `comments` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`studentID`, `classID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`),
  FOREIGN KEY (`classID`) REFERENCES `class`(`classID`)
);

CREATE TABLE `request` (
  `requestID` INT(11) NOT NULL AUTO_INCREMENT,
  `facultyID` INT(11) NOT NULL,
  `reason` TEXT NOT NULL,
  `hours` TINYINT NOT NULL,
  `description` TEXT NOT NULL,
  `research` TINYINT NOT NULL,
  `wordProcessing` TINYINT NOT NULL,
  `dataAnalysis` TINYINT NOT NULL,
  `programming` TINYINT NOT NULL,
  `databaseSkill` TINYINT NOT NULL,
  `sap` TINYINT NOT NULL,
  `statisticalPackages` VARCHAR(255) DEFAULT NULL,
  `programmingLanguages` VARCHAR(255) DEFAULT NULL,
  `writing` TINYINT NOT NULL,
  `editing` TINYINT NOT NULL,
  `english` TINYINT NOT NULL,
  `grading` TINYINT NOT NULL,
  `otherSkills` TEXT DEFAULT NULL,
  `multipleGAs` BOOLEAN NOT NULL DEFAULT 0,
  `multipleGAsNumber` TINYINT DEFAULT 1,
  `requested_studentID` INT(11) DEFAULT NULL,
  `comments` TEXT DEFAULT NULL,
  PRIMARY KEY (`requestID`),
  FOREIGN KEY (`requested_studentID`) REFERENCES `student`(`studentID`),
  FOREIGN KEY (`facultyID`) REFERENCES `faculty`(`facultyID`)
);

CREATE TABLE `skill` (
  `requestID` INT(11) NOT NULL AUTO_INCREMENT,
  `studentID` INT(11) DEFAULT NULL,
  `research` TINYINT NOT NULL,
  `wordProcessing` TINYINT NOT NULL,
  `dataAnalysis` TINYINT NOT NULL,
  `programming` TINYINT NOT NULL,
  `databaseSkill` TINYINT NOT NULL,
  `sap` TINYINT NOT NULL,
  `statisticalPackages` VARCHAR(255) DEFAULT NULL,
  `programmingLanguages` VARCHAR(255) DEFAULT NULL,
  `writing` TINYINT NOT NULL,
  `editing` TINYINT NOT NULL,
  `english` TINYINT NOT NULL,
  `grading` TINYINT NOT NULL,
  `otherSkills` TEXT DEFAULT NULL,
  PRIMARY KEY (`requestID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`)
);

CREATE TABLE `evaluation` (
  `evaluationID` INT(11) NOT NULL AUTO_INCREMENT,
  `facultyID` INT(11) DEFAULT NULL,
  `studentID` INT(11) DEFAULT NULL,
  `duties` TEXT NOT NULL,
  `skillMatch` TEXT NOT NULL,
  `quality` TINYINT NOT NULL,
  `qualityComments` TEXT NOT NULL,
  `timeliness` TINYINT NOT NULL,
  `timelinessComments` TEXT NOT NULL,
  `amount` TINYINT NOT NULL,
  `amountComments` TEXT NOT NULL,
  `overall` TINYINT NOT NULL,
  `overallComments` TEXT NOT NULL,
  `reassigned` TINYINT NOT NULL,
  `reassignedComments` TEXT NOT NULL,
  PRIMARY KEY (`evaluationID`),
  FOREIGN KEY (`facultyID`) REFERENCES `faculty`(`facultyID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`)
);

CREATE TABLE `task` (
  `taskID` INT(11) NOT NULL AUTO_INCREMENT,
  `facultyID` INT(11) DEFAULT NULL,
  `studentID` INT(11) DEFAULT NULL,
  `title` VARCHAR(100) NOT NULL,
  `type` VARCHAR(25) NOT NULL,
  `priority` VARCHAR(10) NOT NULL DEFAULT 'Medium',
  `status` VARCHAR(25) NOT NULL DEFAULT 'Not Started',
  `dueDate` DATE NOT NULL,
  `timeEstimate` TINYINT NOT NULL DEFAULT 1,
  `instructions` TEXT DEFAULT NULL,
  PRIMARY KEY (`taskID`),
  FOREIGN KEY (`facultyID`) REFERENCES `faculty`(`facultyID`),
  FOREIGN KEY (`studentID`) REFERENCES `student`(`studentID`)
);
