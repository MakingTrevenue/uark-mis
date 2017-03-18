<?php
    include 'php/functions.php';
try{
    $conn=createPDO();

    $fn='interviewFile';																								
    if(isset($_FILES[$fn])){
        $file_name=$_FILES[$fn]['name'];
        $file_size=$_FILES[$fn]['size'];
        $file_tmp=$_FILES[$fn]['tmp_name'];
        $file_type=$_FILES[$fn]['type'];
        $fn=md5_file($_FILES[$fn]['tmp_name']);
        if(strlen($fn)<5)
            return;
        move_uploaded_file($file_tmp,"../interviewdocs/".$fn);
        $stmt = $conn->prepare("INSERT INTO interview_file (applicationID,  filename)
                                                VALUES   (:appID,         :filename);");

        $stmt->bindParam(':appID', $applicationID);
        $stmt->bindParam(':filename', $filename);

        $filename = $fn;	
        $applicationID=$_POST['appID'];			
        $stmt->execute();
    }else{

    }
}catch(Exception $e){
	echo "Error: " . $e->getMessage();
	echo "<br> Stack trace: " . $e->getTraceAsString();    
}
?>