<?php
    include "functions.php";
    ini_set('max_execution_time', 180);

    $conn=createPDOWithLocation('../../private/credentials.ini');

    $select = $conn->prepare("SELECT * FROM student WHERE userID IS NULL");
    $select->execute();

    $insert = $conn->prepare("INSERT INTO user (name,  email,  username,  password, gaRole) 
									   VALUES (:name, :email, :username, :password, 1)");

    $update = $conn->prepare("UPDATE student SET userID=:userID WHERE studentID=:studentID");

    while ($row = $select->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
        if(empty($row->preferredName) || $row->preferredName==NULL)
            $name=$row->firstName . " " . $row->lastName;
        else
            $name=$row->preferredName;

            

        $insert->bindValue(':name', $name);
        $insert->bindValue(':email', $row->primaryEmail);
        $insert->bindValue(':username', $row->firstName . $row->lastName);
        $insert->bindValue(':password', password_hash("1234",PASSWORD_DEFAULT));
        $insert->execute();

        $userid=$conn->lastInsertId();

        $update->bindValue(':userID',$userid);
        $update->bindValue(':studentID',$row->studentID);
        $update->execute();
    }

?>
