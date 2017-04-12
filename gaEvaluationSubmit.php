<?php
    include 'php/functions.php';
	error_reporting(E_ALL & ~E_WARNING);
	ini_set('display_errors', 1);

try {

	$conn=createPDO();

	$stmt = $conn->prepare("INSERT INTO evaluation (duties, skillMatch, quality, qualityComments, timeliness, timelinessComments, amount, amountComments, overall, overallComments, reassigned, reassignedComments) VALUES (:duties, :skillMatch, :quality, :qualityComments, :timeliness, :timelinessComments, :amount, :amountComments, :overall, :overallComments, :reassigned, :reassignedComments)");

	$stmt->bindParam(':duties', $_POST['duties']);
	$stmt->bindParam(':skillMatch', $_POST['skillMatch']);
	$stmt->bindParam(':quality', $_POST['quality']);
	$stmt->bindParam(':qualityComments', $_POST['qualityComments']);
	$stmt->bindParam(':timeliness', $_POST['timeliness']);
	$stmt->bindParam(':timelinessComments', $_POST['timelinessComments']);
	$stmt->bindParam(':amount', $_POST['amount']);
	$stmt->bindParam(':amountComments', $_POST['amountComments']);
	$stmt->bindParam(':overall', $_POST['overall']);
	$stmt->bindParam(':overallComments', $_POST['overallComments']);
	$stmt->bindParam(':reassigned', $_POST['reassigned']);
	$stmt->bindParam(':reassignedComments', $_POST['reassignedComments']);
	$stmt->execute();

} catch(Exception $e) {
	$stmt->debugDumpParams();
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();
}

header('Location: gaEvaluationSuccess.php');

?>