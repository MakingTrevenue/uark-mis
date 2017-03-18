<?php
	session_start();
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
    include 'php/functions.php';	
	
	if(isset($_POST)){
		try {
			$conn=createPDO();
            $stmt = $conn->prepare("SELECT userID,password,name FROM user WHERE username=:username");

            $stmt->execute(array(':username' => $_POST['loginUsername']));
            $row = $stmt->fetch();

			$userpassword = $_POST['loginPassword'];
            $check = password_verify($userpassword,$row[1]);
            
            if($check){
			    $_SESSION["userID"] = $row[0];
				$_SESSION["name"]=$row[2];
				header('Location: index.php');
			}
            else
                echo "Incorrect";
		}
		catch(Exception $e){
			echo "Error: " . $e->getMessage();
		}
		finally{
			$conn = null;
		}
	}
?>