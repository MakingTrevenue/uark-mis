<?php
    if (empty($_POST['username']) || empty($_POST['appid']) || empty($_POST['comment'])) 
        header('Location: index.php');
        try{
            $config = parse_ini_file('../private/credentials.ini');
            $servername = $config["servername"];
            $username = $config["username"];
            $password = $config["password"];
            $dbname = $config["dbname"];
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

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