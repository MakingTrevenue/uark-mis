<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	
	if(isset($_POST)){
		$config = parse_ini_file('../private/credentials.ini');
		$servername = $config["servername"];
		$username = $config["username"];
		$password = $config["password"];
		$dbname = $config["dbname"];
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $conn->prepare("SELECT password FROM users WHERE username=:username");

            $stmt->execute(array(':username' => $_POST['loginUsername']));
            $row = $stmt->fetch();


			$userpassword = $_POST['loginPassword'];
            $userpassword = password_hash($userpassword,PASSWORD_DEFAULT);            
            echo $userpassword . "<br>" . $row . "<br>";
            if($userpassword==$row)
			    echo "Logged In";
            else
                echo "Incorrect";
		}
		catch(Exception $e){
			echo "Error: " . $e->getMessage();
		}
		$conn = null;
	}
?>