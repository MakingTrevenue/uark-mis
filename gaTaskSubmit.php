<?php
    session_start();
    include 'php/functions.php';
	error_reporting(E_ALL & ~E_WARNING);
	ini_set('display_errors', 1);

try {

	$conn=createPDO();

	$stmt = $conn->prepare("SELECT facultyID FROM faculty WHERE userID= :userID");

	$stmt->bindParam(':userID',$_SESSION['userID']);
	echo $_SESSION['userID'] . "<br>";
	$stmt->execute();

	$check = $stmt->fetch(PDO::FETCH_ASSOC);
	$facultyID=$check['facultyID'];

	$stmt = $conn->prepare("INSERT INTO task (facultyID, studentID, title, type, priority, dueDate, timeEstimate, instructions) VALUES (:facultyID, :studentID, :title, :type, :priority, :dueDate, :timeEstimate, :instructions)");

	$stmt->bindParam(':facultyID', $facultyID);
	$stmt->bindParam(':studentID', $_POST['studentID']);
	$stmt->bindParam(':title', $_POST['title']);
	$stmt->bindParam(':type', $_POST['type']);
	$stmt->bindParam(':priority', $_POST['priority']);
	$stmt->bindParam(':dueDate', $_POST['dueDate']);
	$stmt->bindParam(':timeEstimate', $_POST['timeEstimate']);
	$stmt->bindParam(':instructions', $_POST['instructions']);
	$stmt->execute();
	header('Location: gaTaskSuccess.php');
} catch(Exception $e) {
	$stmt->debugDumpParams();
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
}



?>