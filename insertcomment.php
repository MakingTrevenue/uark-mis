<?php
    include 'php/functions.php';
    if (empty($_POST['username']) || empty($_POST['appid']) || empty($_POST['comment'])) 
        header('Location: index.php');
        try{
            $conn=createPDO();
            $stmt = $conn->prepare("INSERT INTO user_comment (userID,  applicationID,  commentText)
                                                     VALUES (:userID, :applicationID, :commentText)");

            $stmt->bindParam(':applicationID', $_POST['appid']);
            $stmt->bindParam(':userID', $_POST['username']);
            $stmt->bindParam(':commentText', $_POST['comment']);
            $stmt->execute();
        }catch(Exception $e){
         
        }    
        header('Location: /applicants.php?appID='.$_POST['appid']);
?>