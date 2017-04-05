<?php
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    include 'header.php';
    include 'php/functions.php';
    try{
        $conn=createPDO();
        $stmt = $conn->prepare("SELECT * FROM request JOIN faculty ON faculty.facultyID = request.facultyID;");
        $stmt->execute();    
    }catch(Exception $e){
    echo $e; 
    }

?>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Droppable - Default functionality</title>
  <style>
  #requests { width: 50%; display:inline-block; float: left;}
  #students { width: 50%; display:inline-block; float: left;} 
  .wrapper { width: 100%; float: left;}
  .formclass { float: left; border-style: groove;} 
  .request { margin: auto; width: 33.3%; min-width: 175px;height: 100px; border-style: groove; background-color: #F9F9F9; float: left}
  .student { margin: auto; width: 25%;   min-width: 175px;height: 75px; border-style: groove; background-color: #F9F9F9; float: left}  
  .dropped { background-color: #EEBBBB;}
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="/js/jquery.ui.touch-punch.min.js"></script>
  <script>
  pairs={};
    <?php
    $i=0;
    while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
        echo "pairs['r".$i."']='i".$i."';";
        $i++;
    }
    ?>

  function updateInput(inputid,studentid){
	document.getElementById(pairs[inputid]).value=document.getElementById(studentid).innerHTML;
  }
  function clearInput(id){
	document.getElementById(pairs[id]).value="";
  }

  $( function() {
    $( ".student" ).draggable({	
        revert : function(event, ui) {
            $(this).data("uiDraggable").originalPosition = {
                top : 0,
                left : 0
            };
            return !event;
        }	
	});
    $( ".request" ).droppable({
      drop: function( event, ui ) {
		updateInput(this.id,ui.draggable.attr("id"));
		$(this).droppable('option', 'accept', ui.draggable);		
        $( this )
          .addClass( "dropped" );		 
      },
	  out: function( event, ui ) {;
		clearInput(this.id);
		$(this).droppable('option', 'accept', '.student');
		$( this )
          .removeClass( "dropped" )
	  }	  
    });
  } );
  </script>
</head>
<body>
<div class="wrapper">
	<div id="requests">
        <?php
        $stmt->execute(); 
        $i=0;       
        while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
            echo "
            <div id='r".$i."' class='request panel panel-default'>
                <div class='panel-heading'>
		            <h2 class='panel-title'>".$row->firstName . " " . $row->lastName."</h2>
                </div>"
                . "<br>Department: " . $row->department
                . "<br>Hours: " . $row->hours."
	        </div>";
            $i++;
        }
        ?>
	</div>
	 
	<div id="students">
	  <div id="s0" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 1</div>
        content
      </div>
	  <div id="s1" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 2</div>
         content
      </div>
	  <div id="s2" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 3</div>      
         content
      </div> 
	  <div id="s3" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 4</div>
         content
      </div>
	  <div id="s4" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 5</div>
         content
      </div>
	  <div id="s5" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 6</div>
         content
      </div>
	  <div id="s6" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 7</div>
         content
      </div>
	  <div id="s7" class='student panel panel-default'>
        <div class='panel-heading' style='background-color: #FFBCCF; color: #000000'>student 8</div>
         content
      </div>             
	</div>
	<br>
	
    <div class='wrapper'>
        <form id="garequestform">
            <?php
            $stmt->execute(); 
            $i=0;
            while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
                echo "<input id='i".$i."' value=''  type='hidden'>";
                $i++;
            }
            ?>
            <center>
            <input type="submit"  class="btn btn-success btn-lg" value="Submit">
            </center>
        </form>
    </div>
    
</div>


 
</body>
</html>