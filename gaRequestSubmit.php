<?php
    include 'php/functions.php';
	error_reporting(E_ALL & ~E_WARNING);
	ini_set('display_errors', 1);
	session_start();
	print_r($_POST);

try {

	$conn=createPDO();

	$stmt = $conn->prepare("SELECT facultyID FROM faculty WHERE userID= :userID");

	$stmt->bindParam(':userID',$_SESSION['userID']);
	echo $_SESSION['userID'] . "<br>";
	$stmt->execute();

	$check = $stmt->fetch(PDO::FETCH_ASSOC);
	$facultyID=$check['facultyID'];


	//
	$stmt = $conn->prepare("INSERT INTO request (facultyID,  reason,  hours,  description,  research,  wordProcessing,  dataAnalysis,  programming,  databaseSkill,  sap,  statisticalPackages,  programmingLanguages,  writing,  editing,  english,  grading,  otherSkills,  multipleGAs,  multipleGAsNumber,  comments) VALUES  
											   (:facultyID, :reason, :hours, :description, :research, :wordProcessing, :dataAnalysis, :programming, :databaseSkill, :sap, :statisticalPackages, :programmingLanguages, :writing, :editing, :english, :grading, :otherSkills, :multipleGAs, :multipleGAsNumber, :comments)");
	$stmt->bindParam(':facultyID', $facultyID);
	$stmt->bindParam(':reason', $_POST['reason']);
	$stmt->bindParam(':hours', $_POST['hours']);
	$stmt->bindParam(':description', $_POST['description']);
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
	$stmt->bindParam(':multipleGAs', $_POST['multipleGAs']);
	$stmt->bindParam(':multipleGAsNumber', $_POST['multipleGAsNumber']);
	$stmt->bindParam(':comments', $_POST['gaComments']);
	$stmt->execute();

} catch(Exception $e) {
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
	exit();
}

header('Location: gaRequestSuccess.php');
?>