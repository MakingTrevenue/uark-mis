<?php
    include 'php/functions.php';
	error_reporting(E_ALL & ~E_WARNING);
	ini_set('display_errors', 1);

try {

	$conn=createPDO();

	$stmt = $conn->prepare("INSERT INTO task (facultyID, studentID, type, priority, status, dueDate, timeEstimate, instructions) VALUES (:facultyID, :studentID, :type, :priority, :status, :dueDate, :timeEstimate, :instructions)");

	$stmt->bindParam(':facultyID', $_POST['facultyID']);
	$stmt->bindParam(':studentID', $_POST['studentID']);
	$stmt->bindParam(':type', $_POST['type']);
	$stmt->bindParam(':priority', $_POST['priority']);
	$stmt->bindParam(':status', $_POST['status']);
	$stmt->bindParam(':dueDate', $_POST['dueDate']);
	$stmt->bindParam(':timeEstimate', $_POST['timeEstimate']);
	$stmt->bindParam(':instructions', $_POST['instructions']);
	$stmt->execute();

} catch(Exception $e) {
	$stmt->debugDumpParams();
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
}

header('Location: gaTaskSuccess.php');

?>