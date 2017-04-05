<?php
    include 'php/functions.php';
error_reporting(E_ALL & ~E_WARNING);
ini_set('display_errors', 1);

try {

	$conn=createPDO();

	$stmt = $conn->prepare("INSERT INTO request (reason, hours, description, internet, wordProcessing, spreadsheets, programming, databaseSkill, sap, statisticalPackages,  programmingLanguages,  writing,  editing,  english, grading, otherSkills, multipleGAs, multipleGAsNumber, comments) VALUES  (:reason, :hours, :description, :internet, :wordProcessing, :spreadsheets, :programming, :database, :sap, :statisticalPackages, :programmingLanguages, :writing, :editing, :english, :grading, :otherSkills, :multipleGAs, :multipleGAsNumber, :comments)");

	$stmt->bindParam(':reason', $_POST['reason']);
	$stmt->bindParam(':hours', $_POST['hours']);
	$stmt->bindParam(':description', $_POST['description']);
	$stmt->bindParam(':internet', $_POST['internet']);
	$stmt->bindParam(':wordProcessing', $_POST['wordProcessing']);
	$stmt->bindParam(':spreadsheets', $_POST['spreadsheets']);
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
	$stmt->debugDumpParams();
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
}

header('Location: gaRequestSuccess.php');

?>