<?php
    include 'php/functions.php';
    if (empty($_POST['username']) || empty($_POST['appid']) || empty($_POST['comment'])) 
        header('Location: index.php');
    try{
        $conn=createPDO();
        $stmt = $conn->prepare("INSERT INTO user_comment (userID,  applicationID,  commentText)
                                                    VALUES (:userID, :applicationID, :commentText)");
        echo $_POST['username'] . "<br>" . $_POST['appid'] . "<br>"  . $_POST['comment'] . "<br>";                                                   
        $stmt->execute(array(
                                ':userID'=>$_POST['username'],                
                                ':applicationID'=> $_POST['appid'],
                                ':commentText'=>$_POST['comment']
                                ));    
            header('Location: /applicants.php?appID='.$_POST['appid']);                                              

    }catch(Exception $e){
        echo $e->getMessage();
    }    
       
?>