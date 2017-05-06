<?php
	session_start();
    if (!isset($_POST['loginUsername']) && !isset($_POST['loginPassword']))
        exit();	
    include 'php/functions.php';	
	if(isset($_POST)){
		try {
			$conn=createPDO();
            $stmt = $conn->prepare("SELECT userID,password,name,gaRole,advisorRole,supervisorRole,committeeRole,adminRole FROM user WHERE username=:username");

            $stmt->execute(array(':username' => $_POST['loginUsername']));
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

			$userpassword = $_POST['loginPassword'];
            $check = password_verify($userpassword,$row['password']);
            
            if($check){
			    $_SESSION["userID"] = $row['userID'];
				$_SESSION["name"]=$row['name'];
				if($row['gaRole'])
					$_SESSION["gaRole"]=$row['gaRole'];
				if($row['advisorRole'])
					$_SESSION["advisorRole"]=$row['advisorRole'];
				if($row['supervisorRole'])
					$_SESSION["supervisorRole"]=$row['supervisorRole'];
				if($row['committeeRole'])
					$_SESSION["committeeRole"]=$row['committeeRole'];
				if($row['adminRole'])
					$_SESSION["adminRole"]=$row['adminRole'];																										
				echo json_encode($row['name']);
			}else{
				echo json_encode("incorrectcredentials");
			}
		}
		catch(Exception $e){
		}
		finally{
			$conn = null;
		}
	}
?>