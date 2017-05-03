<?php
    session_start();
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    if (!isset($_SESSION['adminRole'])){
        header('Location: invalidpermission.php?e=Admin');     
    }
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
  .request { margin: auto; width: 33.3%; min-width: 175px;height: 150px; border-style: groove; background-color: #F9F9F9; float: left}
  .student { margin: auto; width: 25%;   min-width: 175px;height: 200px; border-style: groove; background-color: #F9F9F9; float: left}  
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
        echo "pairs['r".$row->requestID."']='i".$row->requestID."';";
        $i++;
    }
    ?>

  function updateInput(inputid,studentid){
	document.getElementById(pairs[inputid]).value= document.getElementById(studentid).id;
  }
  function clearInput(id){
	document.getElementById(pairs[id]).value="";
  }
  function clearButton(e){
    clearInput(e.id);
    $(e).droppable('option', 'accept', '.student');
    $(e).removeClass("dropped");
    $(e).find("b").text("");
  }

  $( function() {
    $( ".student" ).draggable({	
        helper: function(e) {
            var original = $(e.target).hasClass("ui-draggable") ? $(e.target) :  $(e.target).closest(".ui-draggable");
            return original.clone().css({
                width: original.width()
            });                
        },
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
        $(this)
          .addClass( "dropped" );
        $(this).find("b").text("Added: " + ui.draggable.find("h2").text());
      },
      /* handled by Clear button now
	  out: function( event, ui ) {
		clearInput(this.id);
		$(this).droppable('option', 'accept', '.student');
		$(this).removeClass("dropped");
        $(this).find("b").text("");
	  }	
      */  
    });
  } );
  </script>
</head>
<body>
<div class="wrapper">
	<div id="requests">
        <?php
            $stmt = $conn->prepare("SELECT * FROM request JOIN faculty ON faculty.facultyID = request.facultyID WHERE filled!=1;");          
            $stmt->execute(); 
            $i=0;       
            while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
                $rid='r'.$row->requestID;
                echo "
                <div id='r".$row->requestID."' class='request panel panel-default'>
                    <div class='panel-heading'>
                        <h2 class='panel-title'>".$row->firstName . " " . $row->lastName."</h2>
                    </div>"
                    . "<br>Hours: " . $row->hours
                    . "<br>Research: " . $row2->research
                    . "<br>Word Processing: " . $row2->wordProcessing
                    . "<br>Data Analysis: " . $row2->dataAnalysis
                    . "<br>Programming: " . $row2->programming
                    . "<br>Database: " . $row2->databaseSkill
                    . "<br>SAP: " . $row2->sap . "                 
                    <b></b><br>
                    <button onclick='clearButton(".$rid.")'>Clear</button>
                </div>";
                $i++;
            }
        ?>
	</div>
	 
	<div id="students">
        <?php
            $stmt = $conn->prepare("SELECT * FROM student LIMIT 9;");          
            $stmt->execute(); 
            $i=0;       
            while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
                $stmt2 = $conn->prepare("SELECT * FROM skill WHERE studentID=$row->studentID;");          
                $stmt2->execute();
                $row2 = $stmt2->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT);
                echo "
                <div id='" . $row->studentID ."' class='student panel panel-default'>
                    <div class='panel-heading' style='background-color: #FF9E9E; color: #000000'>
                        <h2 class='panel-title'>".$row->firstName . " " . $row->lastName."</h2>
                    </div>"
                    . "<br>Research: " . $row2->research
                    . "<br>Word Processing: " . $row2->wordProcessing
                    . "<br>Data Analysis: " . $row2->dataAnalysis
                    . "<br>Programming: " . $row2->programming
                    . "<br>Database: " . $row2->databaseSkill
                    . "<br>SAP: " . $row2->sap
                . "</div>";
                $i++;
            }
        ?>
	          
	</div>
	<br>
	
    <div class='wrapper'>
        <form id="garequestform" action="/assign.php" method="post">
            <?php
            $stmt = $conn->prepare("SELECT * FROM request JOIN faculty ON faculty.facultyID = request.facultyID;");
            $stmt->execute(); 
            $i=0;
            while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
                echo "<input name='".$row->requestID."' id='i".$row->requestID."' value=''  type='hidden'>";
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
