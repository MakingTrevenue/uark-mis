<?php



    $file="../docs/" . $_GET['id'];
    header('Content-type: application/pdf');
    header('Content-disposition: inline; filename="' . $file . '"');
    header('Content-Transfer-Encoding: binary');
    header('Accept-Ranges: bytes');
    @readfile($file);




?>