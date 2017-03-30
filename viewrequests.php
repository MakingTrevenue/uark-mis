<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Droppable - Default functionality</title>
  <link rel="stylesheet" href="jquery-ui.css">
  <link rel="stylesheet" href="style.css">
  <style>
  #requests { width: 200px; height: 350px; float: left; border-style: groove; }
  #students { width: 200px; height: 350px; float: left; border-style: groove;} 
  .wrapper { float: left;}
  .formclass { float: left; border-style: groove;} 
  .request { margin: auto; width: 175px; height: 100px; border-style: groove; background-color: white;}
  .student { margin: auto; width: 150px; height: 75px; border-style: groove; background-color: white;}  
  .dropped { background-color: yellow;}
  </style>
  <script src="jquery-1.12.4.js"></script>
  <script src="jquery-ui.js"></script>
  <script>
  pairs={};
  pairs['r1']='i1';
  pairs['r2']='i2';
  pairs['r3']='i3';
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
	  <div id="r1" class="request">
		request 1
	  </div>
	  <div id="r2" class="request">
		request 2
	  </div>
	  <div id="r3" class="request">
		request 3
	  </div>  
	</div>
	 
	<div id="students">
	  <div id="s1" class="student">student 1</div>
	  <div id="s2" class="student">student 2</div>
	  <div id="s3" class="student">student 3</div> 
	</div>
	<br>
	GA Request Form (to be hidden):
	<form id="garequestform">
		Request 1: <input id="i1" value=""><br>
		Request 2: <input id="i2" value=""><br>
		Request 3: <input id="i3" value=""><br>
		<input type="submit" value="Submit (Won't be hidden)">
	</form>
	
<div>

 
</body>
</html>