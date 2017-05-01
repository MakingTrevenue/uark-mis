<?php
    include 'php/functions.php';
error_reporting(E_ALL & ~E_WARNING);
ini_set('display_errors', 1);
try {
	$conn=createPDO();
	$conn->beginTransaction();

	$stmt = $conn->prepare("INSERT INTO student (firstName,  middleName,  lastName,  preferredName,  primaryEmail,  secondaryEmail,  primaryPhone,  secondaryPhone,  socialSecurityNumber,  dateOfBirth,  countryOfBirth,  ethnicity,  gender,  citizenship)
									   VALUES  (:firstName, :middleName, :lastName, :preferredName, :primaryEmail, :secondaryEmail, :primaryPhone, :secondaryPhone, :socialSecurityNumber, :dateOfBirth, :countryOfBirth, :ethnicity, :gender, :citizenship);");

	
	$stmt->bindParam(':firstName', $firstName);
	$stmt->bindParam(':middleName', $middleName);
	$stmt->bindParam(':lastName', $lastName);
	$stmt->bindParam(':preferredName', $preferredName);
	$stmt->bindParam(':primaryEmail', $primaryEmail);
	$stmt->bindParam(':secondaryEmail', $secondaryEmail);
	$stmt->bindParam(':primaryPhone', $primaryPhone);
	$stmt->bindParam(':secondaryPhone', $secondaryPhone);
	$stmt->bindParam(':socialSecurityNumber', $socialSecurityNumber);
	$stmt->bindParam(':dateOfBirth', $dateOfBirth);
	$stmt->bindParam(':ethnicity', $ethnicity);	
	$stmt->bindParam(':gender', $gender);
	$stmt->bindParam(':citizenship', $citizenship);		
	$stmt->bindParam(':countryOfBirth', $countryOfBirth);		

	$firstName = $_POST['firstName'];
	$middleName = $_POST['middleName'];
	$lastName = $_POST['lastName'];
	$preferredName = $_POST['preferredName'];
	$primaryEmail = $_POST['primaryEmail'];
	$secondaryEmail = $_POST['secondaryEmail'];
	$primaryPhone = $_POST['primaryPhone'];
	$secondaryPhone = $_POST['secondaryPhone'];
	$socialSecurityNumber = $_POST['socialSecurityNumber'];
	$dateOfBirth = $_POST['dateOfBirth'];
	$ethnicity = $_POST['ethnicity'];
	$gender = $_POST['gender'];
	$citizenship = $_POST['citizenship'];
	$countryOfBirth = 'US';
	$stmt->execute();
	$studentID = $conn->lastInsertId();

	//echo "Student record created successfully";

	$stmt = $conn->prepare("INSERT INTO application (studentID,  term,  year,  program, reqScholarship,  previousApp,  previousAppDate,  previousEnrollment,  previousEnrollmentDate,  previousEnrollmentStatus,  undergradGPA,  juniorseniorGPA,  
													 currentEmployer,  timeAtCurrentEmployer, gmat, gmatTestDate,gmatQScore, gmatVScore, gmatTScore, gre, greTestDate, greQScore, greVScore, greTScore, toeflOnline, toeflPaper, toeflTestDate, toeflOnlineScore,
													 toeflPaperScore, tse, tseTestDate, tseScore) 
										VALUES (LAST_INSERT_ID(), :term,  :year,  :program, :reqScholarship,  :previousApp,  :previousAppDate,  :previousEnrollment,  :previousEnrollmentDate,  :previousEnrollmentStatus,  :undergradGPA,  :juniorseniorGPA,  
													 :currentEmployer,  :timeAtCurrentEmployer, :gmat, :gmatTestDate, :gmatQScore, :gmatVScore, :gmatTScore, :gre, :greTestDate, :greQScore, :greVScore, :greTScore, :toeflOnline, :toeflPaper, :toeflTestDate, :toeflOnlineScore,
													 :toeflPaperScore, :tse, :tseTestDate, :tseScore )");

	$stmt->bindParam(':term', $_POST['term']);
	$stmt->bindParam(':year', $_POST['year']);
	$stmt->bindParam(':program', $_POST['program']);
	$stmt->bindParam(':reqScholarship', $reqScholarship);
	$stmt->bindParam(':previousApp', $previousApp);
	$stmt->bindParam(':previousAppDate', $previousAppDate);
	$stmt->bindParam(':previousEnrollment', $previousEnrollment);
	$stmt->bindParam(':previousEnrollmentDate', $_POST['previousEnrollmentDate']);
	$stmt->bindParam(':previousEnrollmentStatus', $_POST['previousEnrollmentStatus']);
	$stmt->bindParam(':undergradGPA', $_POST['undergradGPA']);
	$stmt->bindParam(':juniorseniorGPA', $_POST['juniorseniorGPA']);
	$stmt->bindParam(':currentEmployer', $_POST['currentEmployer']);
	$stmt->bindParam(':timeAtCurrentEmployer', $_POST['timeAtCurrentEmployer']);
	$stmt->bindParam(':gmat', $gmat);
	$stmt->bindParam(':gmatTestDate', $_POST['gmatTestDate']);
	$stmt->bindParam(':gmatQScore', $_POST['gmatQScore']);
	$stmt->bindParam(':gmatVScore', $_POST['gmatVScore']);
	$stmt->bindParam(':gmatTScore', $_POST['gmatTScore']);
	$stmt->bindParam(':gre', $gre);
	$stmt->bindParam(':greTestDate', $_POST['greTestDate']);
	$stmt->bindParam(':greQScore', $_POST['greQScore']);
	$stmt->bindParam(':greVScore', $_POST['greVScore']);
	$stmt->bindParam(':greTScore', $_POST['greTScore']);
	$stmt->bindParam(':toeflOnline', $toeflOnline);
	$stmt->bindParam(':toeflPaper', $toeflPaper);
	$stmt->bindParam(':toeflTestDate', $_POST['toeflTestDate']);
	$stmt->bindParam(':toeflOnlineScore', $_POST['toeflOnlineScore']);
	$stmt->bindParam(':toeflPaperScore', $_POST['toeflPaperScore']);
	$stmt->bindParam(':tse', $tse);
	$stmt->bindParam(':tseTestDate', $_POST['tseTestDate']);
	$stmt->bindParam(':tseScore', $_POST['tseScore']);

	if(isset($_POST['reqScholarship']))
		$reqScholarship = $_POST['reqScholarship'];
	else
		$reqScholarship = 0;
	if(isset($_POST['previousApp']))
		$previousApp = $_POST['previousApp'];
	else
		$previoiusApp = 0;
	$previousAppDate = $_POST['previousAppDate'];
	if(isset($_POST['previousEnrollment']))
		$previousEnrollment = $_POST['previousEnrollment'];
	else
		$previousEnrollment=0;
	if(isset($_POST['gmat']))
		$gmat = $_POST['gmat'];
	else
		$gmat=0;
	if(isset($_POST['gre']))
		$gre = $_POST['gre'];
	else
		$gre=0;
	if(isset($_POST['toeflOnline']))
		$toeflOnline = $_POST['toeflOnline'];
	else
		$toeflOnline = 0;
	if(isset($_POST['toeflPaper']))		
		$toeflPaper = $_POST['toeflPaper'];
	else
		$toeflPaper = 0;
	if(isset($_POST['tse']))
		$tse = $_POST['tse'];
	else
		$tse=0;
	$stmt->execute();
	//echo "<br>";
	//echo "Application record created successfully";	
	
	$appid = $conn->lastInsertId();
	$fileFormName=array('resumeFile','essayQuestionsFile','transcriptFile','recLetter1','recLetter2','recLetter3', 'educationalExperienceFile', 'supplementalFormFile');

	foreach($fileFormName as $fn){
		if($fn=='resumeFile')
			$type='Resume';
		if($fn=='essayQuestionsFile')
			$type='Essay Questions';
		if($fn=='transcriptFile')
			$type='Transcript';
		if($fn=='recLetter1' || $fn=='recLetter2' || $fn=='recLetter3')
			$type='Recommendation Letter';
		if($fn=='educationalExperienceFile')
			$type='Educational Experience';
		if($fn=='supplementalFormFile')
			$type='Supplemental Form';																								
		if(isset($_FILES[$fn])){
			$file_name=$_FILES[$fn]['name'];
			$file_size=$_FILES[$fn]['size'];
			$file_tmp=$_FILES[$fn]['tmp_name'];
			$file_type=$_FILES[$fn]['type'];
			$fn=md5_file($_FILES[$fn]['tmp_name']);
			if(strlen($fn)<5)
				continue;
			move_uploaded_file($file_tmp,"../docs/".$fn);
			$stmt = $conn->prepare("INSERT INTO attachment (applicationID,documentType,filename)
				VALUES  (:appID,:docType,:filename);");

			$stmt->bindParam(':appID', $applicationID);
			$stmt->bindParam(':docType', $docType);
			$stmt->bindParam(':filename', $filename);			
			$docType= $type;
			$filename = $fn;	
			$applicationID=$appid;			
			$stmt->execute();
			//echo "<br>";
			//echo "Attachment record created successfully";
		}else{

		}
	}

	$stmt = $conn->prepare("INSERT INTO college (applicationID,  collegeName,  dateStarted,  dateEnded,  gpa,  hoursEarned,  hoursEnrolled,  degree,  major)
									   VALUES  (:applicationID, :collegeName, :dateStarted, :dateEnded, :gpa, :hoursEarned, :hoursEnrolled, :degree, :major);");

	$stmt->bindParam(':applicationID', $appid);
	$stmt->bindParam(':collegeName', $_POST['collegeName']);
	$stmt->bindParam(':dateStarted', $_POST['dateStarted']);
	$stmt->bindParam(':dateEnded', $_POST['dateEnded']);
	$stmt->bindParam(':gpa', $_POST['collegeGPA']);
	$stmt->bindParam(':hoursEarned', $_POST['hoursEarned']);		
	$stmt->bindParam(':hoursEnrolled', $_POST['hoursEnrolled']);
	$stmt->bindParam(':degree', $_POST['degree']);
	$stmt->bindParam(':major', $_POST['major']);		

	$stmt->execute();	
	//
	$stmt = $conn->prepare("INSERT INTO address (street1,  street2,  city,  stateID,  zipCode,  countryID)
									   VALUES  (:street1, :street2, :city, :stateID, :zipCode, :countryID);");

	$stmt->bindParam(':street1', $_POST['streetAddress']);
	$stmt->bindParam(':street2', $_POST['streetAddress2']);
	$stmt->bindParam(':city', $_POST['city']);
	$stmt->bindParam(':stateID', $_POST['state']);
	$stmt->bindParam(':zipCode', $_POST['zipCode']);
	$stmt->bindParam(':countryID', $_POST['country']);

	$stmt->execute();	
	$addressPid = $conn->lastInsertId();
	//
	$stmt = $conn->prepare("INSERT INTO address (street1,  street2,  city,  stateID,  zipCode,  countryID)
									   VALUES  (:street1, :street2, :city, :stateID, :zipCode, :countryID);");

	$stmt->bindParam(':street1', $_POST['streetAddressM']);
	$stmt->bindParam(':street2', $_POST['streetAddress2M']);
	$stmt->bindParam(':city', $_POST['cityM']);
	$stmt->bindParam(':stateID', $_POST['stateM']);
	$stmt->bindParam(':zipCode', $_POST['zipCodeM']);
	$stmt->bindParam(':countryID', $_POST['countryM']);				

	$stmt->execute();	
	$addressMid = $conn->lastInsertId();	
	//
	$stmt = $conn->prepare("INSERT INTO student_address (studentID,  addressID, type)
									   VALUES  (:studentID, :addressID, 'permanent');");

	$stmt->bindParam(':studentID', $sid);
	$stmt->bindParam(':addressID', $apid);	

	$sid=$studentID;
	$apid=$addressPid;

	$stmt->execute();
	//
	$stmt = $conn->prepare("INSERT INTO student_address (studentID,  addressID, type)
									   VALUES  (:studentID, :addressID, 'mailing');");

	$stmt->bindParam(':studentID', $sid);
	$stmt->bindParam(':addressID', $amid);	

	$sid=$studentID;
	$amid=$addressMid;

	$stmt->execute();	


	$conn->commit();	
	header('Location: applicationSuccess.php');
}
catch(Exception $e){
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
	$conn->rollBack();
}
$conn = null;

?>