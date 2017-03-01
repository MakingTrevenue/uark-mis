<?php



    $file="../docs/" . $_POST['filename'];
    header('Content-type: application/pdf');
    header('Content-disposition: inline; filename="' . $file . '"');
    header('Content-Transfer-Encoding: binary');
    header('Accept-Ranges: bytes');
    @readfile($file);




?>