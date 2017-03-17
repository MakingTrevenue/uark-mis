<?php
try{
    $config = parse_ini_file('../private/credentials.ini');
        $servername = $config["servername"];
        $username = $config["username"];
        $password = $config["password"];
        $dbname = $config["dbname"];

        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password); //
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $fn='interviewFile';																								
    if(isset($_FILES[$fn])){
        $file_name=$_FILES[$fn]['name'];
        $file_size=$_FILES[$fn]['size'];
        $file_tmp=$_FILES[$fn]['tmp_name'];
        $file_type=$_FILES[$fn]['type'];
        $fn=md5_file($_FILES[$fn]['tmp_name']);
        if(strlen($fn)<5)
            continue;
        move_uploaded_file($file_tmp,"../docs/".$fn);
        $stmt = $conn->prepare("INSERT INTO interviewFile (applicationID,  filename)
                                                VALUES   (:appID,        ,:filename);");

        $stmt->bindParam(':appID', $applicationID);
        $stmt->bindParam(':filename', $filename);

        $filename = $fn;	
        $applicationID=$_POST['appID'];			
        $stmt->execute();
        //echo "<br>";
        //echo "Attachment record created successfully";
    }else{

    }
}catch(Exception $e){
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();    
}
?>