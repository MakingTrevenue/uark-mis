<?php 
    session_start();
    if (!isset($_SESSION['adminRole']))
        header('Location: invalidpermission.php?e=Admin'); 
    if (empty($_POST))
        header('Location: index.php');         
    include 'php/functions.php';

    try{
        $arr = $_POST;
        foreach ($arr as $requestid => $studentid) {
            if(!empty($studentid)){
                $conn=createPDO();

                $stmt = $conn->prepare("SELECT facultyID FROM request WHERE requestID=:requestID");
                $stmt->bindParam(':requestID', $requestid);
                $stmt->execute();
                $row=$stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT);
                $facultyid=$row->facultyID;   

                $stmt = $conn->prepare("INSERT INTO ga_assignment (studentID,  requestID,  facultyID) 
                                                        VALUES (:studentID, :requestID, :facultyID)");
                $stmt->bindParam(':studentID', $studentid);
                $stmt->bindParam(':requestID', $requestid);
                $stmt->bindParam(':facultyID', $facultyid);
                $stmt->execute(); 
                
                $stmt = $conn->prepare("UPDATE request SET filled=true WHERE requestID=:requestID");
                $stmt->bindParam(':requestID',$requestid);
                $stmt->execute();


            }
        }
        header('Location: assignSuccess.php');
    }catch(Exception $e){
        echo $e;
    }
?>