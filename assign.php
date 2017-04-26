<?php 
    session_start();
    if (!isset($_SESSION['adminRole']) || !isset($_POST))
        header('Location: invalidpermission.php?e=Admin'); 
    include 'php/functions.php';

    $arr = $_POST;
    foreach ($arr as $requestid => $studentid) {
        if(!empty($studentid)){
            echo $studentid . " assigned to " . $requestid . "<br>";

            $conn=createPDO();

	        $stmt = $conn->prepare("INSERT INTO ga_assignment (studentID, requestID) VALUES (:studentID, :requestID)");
            $stmt->bindParam(':studentID', $studentid);
            $stmt->bindParam(':requestID', $requestid);
            $stmt->execute(); 
            
            $stmt = $conn->prepare("UPDATE request SET filled=true WHERE requestID=:requestID");
            $stmt->bindParam(':requestID',$requestid);
            $stmt->execute();


        }
    }
?>