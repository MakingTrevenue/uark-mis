<?php
    session_start();
    if (!isset($_SESSION['supervisorRole']) && !isset($_SESSION['adminRole']))
        header('Location: invalidpermission.php?e=Supervisor'); 
    include 'header.php';
    include 'php/functions.php';

    $conn=createPDO();
    $stmt = $conn->prepare("SELECT * FROM evaluation JOIN student ON evaluation.studentID = student.studentID");
    $stmt->bindParam(':userid', $_SESSION["userID"]);
    $stmt->execute(); 

?>
    <style>
        .clickable {
            cursor:pointer;
        }
    </style>
    <script src="/js/jquery.ui.touch-punch.min.js"></script>

    <table id="applicantTable" class="tablesorter">
    <thead>
      <tr>
        <th>Student ID</th>
        <th>Name</th>
        <th>Overall Satisfaction</th>
        <th>Quality of Work</th>
        <th>Timeliness of Work</th>
        <th>Amount of Work</th>
      </tr>
    </thead>
    <tbody>
<?php
    $i=0;
    while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
        $i++;
        echo "<tr href='#' data-toggle='modal' data-target='#evalModal".$i."'>
                <td>" . $row->studentID . "</td>
                <td>" . $row->firstName . " " . $row->lastName . "</td>
                <td>" . $row->overall . "</td>                
                <td>" . $row->quality . "</td>
                <td>" . $row->timeliness . "</td>
                <td>" . $row->amount . "</td>
            </tr>";
?>
    <div class="modal" id="evalModal<?php echo $i;?>" role="dialog">
        <div class="modal-dialog">
        
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h2 class="modal-title"><?php echo $row->firstName . " " . $row->lastName; ?></h2>
            </div>
            <div class="modal-body">
                <p>
                    <h3>Duties:</h3>
                    <?php echo $row->duties;?>
                    <h3>How background and skills matched duties:</h3> <br>
                    <?php echo $row->skillMatch;?>

                    <h3>Overall Satisfaction: <?php echo $row->overall;?>/4</h3> <br>     
                    <?php echo $row->overallComments;?> <br>

                    <h3>Quality of Work: <?php echo $row->quality;?>/4</h3> <br>     
                    <?php echo $row->qualityComments;?> <br>

                    <h3>Timeliness of Work: <?php echo $row->timeliness;?>/4</h3> <br>     
                    <?php echo $row->timelinessComments;?> <br>

                    <h3>Amount of Work: <?php echo $row->amount;?>/4</h3> <br>     
                    <?php echo $row->amountComments;?> <br>                                                                              
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        
        </div>
    </div>
<?php
    }
    echo "</table>";
?>