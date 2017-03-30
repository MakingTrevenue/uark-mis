<?php
include 'php/functions.php';
try{
    $conn=createPDO();
    $stmt = $conn->prepare("SELECT * FROM ga_request JOIN instructor ON ga_request.facultyID=instructor.instructorID");
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
  #requests { width: 200px; display:inline-block; float: left; border-style: groove; }
  #students { width: 200px; display:inline-block; float: left; border-style: groove;} 
  .wrapper { float: left;}
  .formclass { float: left; border-style: groove;} 
  .request { margin: auto; width: 175px; height: 100px; border-style: groove; background-color: white;}
  .student { margin: auto; width: 150px; height: 75px; border-style: groove; background-color: white;}  
  .dropped { background-color: yellow;}
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
            <div id='r".$i."' class='request'>
		        ".$row->firstName . " " . $row->lastName
                 ."<br>". $row->dept
                 ."<br>Hours: ".$row->hours."
	        </div> ";
            $i++;
        }
        ?>
 
	</div>
	 
	<div id="students">
	  <div id="s0" class="student">student 1</div>
	  <div id="s1" class="student">student 2</div>
	  <div id="s2" class="student">student 3</div> 
	</div>
	<br>
	
    <div class='wrapper'>
        GA Request Form (to be hidden):
        <form id="garequestform">
            <?php
            $stmt->execute(); 
            $i=0;
            while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
                echo
                    "Request ".$row->requestID.": <input id='i".$i."' value=''><br>";
                $i++;
            }
            ?>        
            <input type="submit" value="Submit (Won't be hidden)">
        </form>
    </div>
</div>

 
</body>
</html>