<?php
    include 'php/functions.php';
error_reporting(E_ALL & ~E_WARNING);
ini_set('display_errors', 1);

try {

	$conn=createPDO();

	$stmt = $conn->prepare("INSERT INTO request (reason,  hours,  description,  internet,  wordProcessing,  spreadsheets,  programming,  database,  sap,  statisticalPackages,  programmingLanguages,  writing,  editing,  english, grading, otherSkills, multipleGAs, multipleGAsNumber, gaComments)
									   VALUES  (:reason, :hours, :description, :internet, :wordProcessing, :spreadsheets, :programming, :database, :sap, :statisticalPackages, :programmingLanguages, :writing, :editing, :english, :grading, :otherSkills, :multipleGAs, :multipleGAsNumber, :gaComments");

	$stmt->bindParam(':reason', $_POST['reason']);
	$stmt->bindParam(':hours', $_POST['hours']);
	$stmt->bindParam(':description', $_POST['description']);
	$stmt->bindParam(':internet', $_POST['internet']);
	$stmt->bindParam(':wordProcessing', $_POST['wordProcessing']);
	$stmt->bindParam(':spreadsheets', $_POST['spreadsheets']);
	$stmt->bindParam(':programming', $_POST['programming']);
	$stmt->bindParam(':database', $_POST['database']);
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
	$stmt->bindParam(':gaComments', $_POST['gaComments']);
	$stmt->execute();

} catch(Exception $e) {
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
}



print_r($_POST);

?>