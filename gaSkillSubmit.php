<?php
    include 'php/functions.php';
	error_reporting(E_ALL & ~E_WARNING);
	ini_set('display_errors', 1);
	session_start();
	print_r($_POST);

try {

	$conn=createPDO();

	$stmt = $conn->prepare("SELECT studentID FROM student WHERE userID= :userID");

	$stmt->bindParam(':userID',$_SESSION['userID']);
	echo $_SESSION['userID'] . "<br>";
	$stmt->execute();

	$check = $stmt->fetch(PDO::FETCH_ASSOC);
	$studentID=$check['studentID'];


	//
	$stmt = $conn->prepare("INSERT INTO skill (studentID, research,  wordProcessing,  dataAnalysis,  programming,  databaseSkill,  sap,  statisticalPackages,  programmingLanguages,  writing,  editing,  english,  grading,  otherSkills) VALUES  
											   (:studentID, :research, :wordProcessing, :dataAnalysis, :programming, :databaseSkill, :sap, :statisticalPackages, :programmingLanguages, :writing, :editing, :english, :grading, :otherSkills)");
	$stmt->bindParam(':studentID', $studentID);
	$stmt->bindParam(':research', $_POST['research']);
	$stmt->bindParam(':wordProcessing', $_POST['wordProcessing']);
	$stmt->bindParam(':dataAnalysis', $_POST['dataAnalysis']);
	$stmt->bindParam(':programming', $_POST['programming']);
	$stmt->bindParam(':databaseSkill', $_POST['databaseSkill']);
	$stmt->bindParam(':sap', $_POST['sap']);
	$stmt->bindParam(':statisticalPackages', $_POST['statisticalPackages']);
	$stmt->bindParam(':programmingLanguages', $_POST['programmingLanguages']);
	$stmt->bindParam(':writing', $_POST['writing']);
	$stmt->bindParam(':editing', $_POST['editing']);
	$stmt->bindParam(':english', $_POST['english']);
	$stmt->bindParam(':grading', $_POST['grading']);
	$stmt->bindParam(':otherSkills', $_POST['otherSkills']);
	$stmt->execute();

	header('Location: gaSkillSuccess.php');

} catch(Exception $e) {
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
	exit();
}

?>