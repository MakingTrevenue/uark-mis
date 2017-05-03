<?php
    session_start();
    if (!isset($_SESSION['gaRole']) && !isset($_SESSION['adminRole']))
        header("Location: invalidpermission.php?e=gaRole"); 
    include 'header.php';
    include 'php/functions.php';
?>

<?php
    // Update statement for updating task statuses.
    if((!empty($_POST['taskID']) && !empty($_POST['status']) )){
        try{
            $conn=createPDO();
            $stmt = $conn->prepare("UPDATE task SET status=:status WHERE taskID=:taskID");
            $stmt->bindParam(':status', $_POST['status']);
            $stmt->bindParam(':taskID', $_POST['taskID']);
            $stmt->execute();

        }catch(Exception $e){
            echo "Error: " . $e->getMessage();
            echo "<br> Stack trace: " . $e->getTraceAsString();            
        }
    }

    // Select statement for selecting all of the task info.
    if(!empty($_GET['taskID']) || (!empty($_POST['taskID']) && !empty($_POST['status']) )){
        try{
            $conn=createPDO();
            $stmt = $conn->prepare("SELECT * FROM task JOIN student on student.studentID = task.studentID WHERE task.studentID=:taskID");
            
            if(!empty($_GET['taskID']))
                $taskID=$_GET['taskID'];
            else
                $taskID=$_POST['taskID'];
            $stmt->bindValue(':taskID', $taskID);
            
            $stmt->execute();
            if ($stmt->rowCount() > 0){
                $check = $stmt->fetch(PDO::FETCH_ASSOC);
            }else{
                exit();
            }          

        }catch(Exception $e){
            echo "Error: " . $e->getMessage();
            echo "<br> Stack trace: " . $e->getTraceAsString();
        }
?>
<!-- Page Content Container -->
<div class="container-fluid">
    
    <form id="taskStatusUpdate" action="/viewTasks.php" method='post' enctype="multipart/form-data">
        
    <!-- Taskk Info -->
    <div class="row">

        <div class="col-md-4 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Task Status</h2>
                </div>

                <div class="panel-body">
                  
                    <h4>
                        <input type="hidden" name="taskID" value="<?php echo $check['taskID'];?>" />
                        <b>Task Status: </b><br>
                        <select name="status" id="status" class="selectpicker form-control" data-live-search="true">
                            <option value="Not Started"<?=$check['status'] == 'Not Started' ? ' selected="selected"' : '';?> >Not Started</option>
                            <option value="In Progress"<?=$check['status'] == 'In Progress' ? ' selected="selected"' : '';?> >In Progress</option>
                            <option value="Completed"<?=$check['status'] == 'Completed' ? ' selected="selected"' : '';?> >Completed</option>
                        </select>
                    </h4>

                    <div class="col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3 text-center">
                        <input type="submit"" id="" class="btn btn-success" submit="Update Status" value="Submit Status Update">
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Task Information</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <b>Title: </b> <?php echo $check['title']; ?>
                    </h4>
                    <h4>
                        <b>Instructions: </b> <?php echo $check['instructions']; ?>
                    </h4>
                    <h4>
                        <b>Priority: </b> <?php echo $check['priority']; ?>
                    </h4>
                    <h4>
                        <b>Due Date: </b>
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['dueDate']));                            
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                    <h4>
                        <b>Type: </b> <?php echo $check['type']; ?>
                    </h4>

                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Task Time</h2>
                </div>

                <div class="panel-body">

                    <h4>
                        <b>Time Estimate: </b> <?php echo $check['timeEstimate'] . " hour(s)"; ?>
                    </h4>

                    <div class="form-group">
                    <h4>
                        <b>Time Taken: </b>
                    </h4>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                            <input type="number" pattern="\d*" class="form-control" name="timeTaken"  id="timeTaken" placeholder="3">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3 text-center">
                        <input type="submit"" id="" class="btn btn-success" submit="Update Time" value="Submit Time Update">
                    </div>

                </div>
            </div>
        </div>

</div>

    <?php
    }else{
        $conn=createPDO();
        $stmt = $conn->prepare("SELECT * FROM task");
        $stmt->execute();
    ?>

<div class="container-fluid">
    <h3 class="text-center">Task Manager</h3>        
    <div style="height:500px;overflow:auto;">
    <table id="taskTable" class="tablesorter">
    <thead>
      <tr>
        <th>Task ID</th>
        <th>Priority</th>
        <th>Title</th>
        <th>Status</th>
        <th>Hours</th>
        <th>Due Date</th>
        <th>Type</th>
      </tr>
    </thead>
    <tbody>

    <?php 
        while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
            echo "<tr>
                    <td>" . $row->taskID . "</td>
                    <td>" . $row->priority . "</td>
                    <td>" . $row->title . "</td>
                    <td>" . $row->status . "</td>
                    <td>" . $row->timeEstimate . "</td>
                    <td>" . $row->dueDate . "</td>
                    <td>" . $row->type . "</td>
                </tr>";
        }
    }   
    ?>
    </tbody>
    </table>
    </div>
</div>

<?php
    include 'footer.php';
?>