<?php
    function createPDO(){
        try{
            $config = parse_ini_file('../private/credentials.ini');
            $servername = $config["servername"];
            $username = $config["username"];
            $password = $config["password"];
            $dbname = $config["dbname"];
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password, 
                array(PDO::ATTR_TIMEOUT => 180,PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);            
            return($conn);
        }
        catch(Exception $e){
            return $e;
        }
    }

    function createPDOWithLocation($location){
        try{
            $config = parse_ini_file($location);
            $servername = $config["servername"];
            $username = $config["username"];
            $password = $config["password"];
            $dbname = $config["dbname"];
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password, 
                array(PDO::ATTR_TIMEOUT => 180,PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);            
            return($conn);
        }
        catch(Exception $e){
            return $e;
        }
    }    
?>