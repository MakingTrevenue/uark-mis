<?php

error_reporting(E_ALL & ~E_WARNING);
ini_set('display_errors', 1);

$fileFormName=array('resumeFile','essayQuestionsFile','transcriptFile','recLetter1','recLetter2','recLetter3');
try{
	foreach($fileFormName as $fn){
		if(isset($_FILES[$fn])){
			$file_name=$_FILES[$fn]['name'];
			$file_size=$_FILES[$fn]['size'];
			$file_tmp=$_FILES[$fn]['tmp_name'];
			$file_type=$_FILES[$fn]['type'];
			move_uploaded_file($file_tmp,"../docs/".md5_file($_FILES[$fn]['tmp_name']));
		}else{

		}
	}
}catch(Exception $e){
}

try {
	$config = parse_ini_file('../private/credentials.ini');
	$servername = $config["servername"];
	$username = $config["username"];
	$password = $config["password"];
	$dbname = $config["dbname"];

	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$stmt = $conn->prepare("INSERT INTO student (firstName,  middleName,  lastName,  preferredName,  primaryEmail,  secondaryEmail,  primaryPhone,  secondaryPhone,  socialSecurityNumber,  dateOfBirth,  ethnicity,  gender,  citizenship,  countryOfBirth) 
										VALUES (:firstName, :middleName, :lastName, :preferredName, :primaryEmail, :secondaryEmail, :primaryPhone, :secondaryPhone, :socialSecurityNumber, :dateOfBirth, :ethnicity, :gender, :citizenship, :countryofBirth);");

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
	echo $stmt->columnCount();
	$stmt->execute();

	echo "Student record created successfully";

	$stmt = $conn->prepare("INSERT INTO application (studentID,  term,  year,  program, reqScholarship,  previousApp,  previousAppDate,  previousEnrollment,  previousEnrollmentDate,  previousEnrollmentStatus,  undergradGPA,  juniorseniorGPA,  
													 currentEmployer,  timeAtCurrentEmployer, gmat, gmatTestDate,gmatQScore, gmatVScore, gmatTScore, gre, greTestDate, greQScore, greVScore, greTScore, toeflOnline, toeflPaper, toeflTestDate, toeflOnlineScore,
													 toeflPaperScore, tse, tseTestDate, tseScore) 
										VALUES (LAST_INSERT_ID(), :term,  :year,  :program, :reqScholarship,  :previousApp,  :previousAppDate,  :previousEnrollment,  :previousEnrollmentDate,  :previousEnrollmentStatus,  :undergradGPA,  :juniorseniorGPA,  
													 :currentEmployer,  :timeAtCurrentEmployer, :gmat, :gmatTestDate, :gmatQScore, :gmatVScore, :gmatTScore, :gre, :greTestDate, :greQScore, :greVScore, :greTScore, :toeflOnline, :toeflPaper, :toeflTestDate, :toeflOnlineScore,
													 :toeflPaperScore, :tse, :tseTestDate, :tseScore )");

	$stmt->bindParam(':studentID', $studentID);
	$stmt->bindParam(':term', $term);
	$stmt->bindParam(':year', $year);
	$stmt->bindParam(':program', $program);
	$stmt->bindParam(':reqScholarship', $reqScholarship);
	$stmt->bindParam(':previousApp', $previousApp);
	$stmt->bindParam(':previousAppDate', $previousAppDate);
	$stmt->bindParam(':previousEnrollment', $previousEnrollment);
	$stmt->bindParam(':previousEnrollmentDate', $previousEnrollmentDate);
	$stmt->bindParam(':previousEnrollmentStatus', $previousEnrollmentStatus);
	$stmt->bindParam(':undergradGPA', $undergradGPA);
	$stmt->bindParam(':juniorseniorGPA', $juniorseniorGPA);
	$stmt->bindParam(':currentEmployer', $currentEmployer);
	$stmt->bindParam(':timeAtCurrentEmployer', $timeAtCurrentEmployer);
	$stmt->bindParam(':gmat', $gmat);
	$stmt->bindParam(':gmatTestDate', $gmatTestDate);
	$stmt->bindParam(':gmatQScore', $gmatQScore);
	$stmt->bindParam(':gmatVScore', $gmatVScore);
	$stmt->bindParam(':gmatTScore', $gmatTScore);
	$stmt->bindParam(':gre', $gre);
	$stmt->bindParam(':greTestDate', $greTestDate);
	$stmt->bindParam(':greQScore', $greQScore);
	$stmt->bindParam(':greVScore', $greVScore);
	$stmt->bindParam(':greTScore', $greTScore);
	$stmt->bindParam(':toeflOnline', $toeflOnline);
	$stmt->bindParam(':toeflPaper', $toeflPaper);
	$stmt->bindParam(':toeflTestDate', $toeflTestDate);
	$stmt->bindParam(':toeflOnlineScore', $toeflOnlineScore);
	$stmt->bindParam(':toeflPaperScore', $toeflPaperScore);
	$stmt->bindParam(':tse', $tse);
	$stmt->bindParam(':tseTestDate', $tseTestDate);
	$stmt->bindParam(':tseScore', $tseScore	);

	$studentID = $_POST['studentID'];
	$term= $_POST['term'];
	$year= $_POST['year'];
	$program = $_POST['program'];
	$reqScholarship = $_POST['reqScholarship'];
	$previousApp = $_POST['previousApp'];
	$previousAppDate = $_POST['previousAppDate'];
	$previousEnrollment = $_POST['previousEnrollment'];
	$previousEnrollmentDate = $_POST['previousEnrollmentDate'];
	$previousEnrollmentStatus = $_POST['previousEnrollmentStatus'];
	$undergradGPA = $_POST['undergradGPA'];
	$juniorseniorGPA = $_POST['juniorseniorGPA'];
	$currentEmployer = $_POST['currentEmployer'];
	$timeAtCurrentEmployer = $_POST['timeAtCurrentEmployer'];
	$gmat = $_POST['gmat'];
	$gmatTestDate = $_POST['gmatTestDate'];
	$gmatQScore = $_POST['gmatQScore'];
	$gmatVScore = $_POST['gmatVScore'];
	$gmatTScore = $_POST['gmatTScore'];
	$gre = $_POST['gre'];
	$greTestDate = $_POST['greTestDate'];
	$greQScore = $_POST['greQScore'];
	$greVScore = $_POST['greVScore'];
	$greTScore = $_POST['greTScore'];
	$toeflOnline = $_POST['toeflOnline'];
	$toeflPaper = $_POST['toeflPaper'];
	$toeflTestDate = $_POST['toeflTestDate'];
	$toeflOnlineScore = $_POST['toeflOnlineScore'];
	$toeflPaperScore = $_POST['toeflPaperScore'];
	$tse = $_POST['tse'];
	$tseTestDate = $_POST['tseTestDate'];
	$tseScore = $_POST['tseScore'];

	$stmt->execute();

	echo "Application record created successfully";	
}
catch(Exception $e){
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
}
$conn = null;

		

?>
