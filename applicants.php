<?php
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    include 'header.php';
?>

<?php
    // Update statement for updating application statuses.
    if((!empty($_POST['appID']) && !empty($_POST['offerStatus']) && !empty($_POST['assistantshipStatus']) && !empty($_POST['applicantResponse']) )){
        try{
            $config = parse_ini_file('../private/credentials.ini');
            $servername = $config["servername"];
            $username = $config["username"];
            $password = $config["password"];
            $dbname = $config["dbname"];
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $conn->prepare("UPDATE application SET offerStatus=:offerStatus, assistantshipStatus=:assistantshipStatus, applicantResponse=:applicantResponse 
                                    WHERE applicationID=:appID");
            $stmt->bindParam(':offerStatus', $_POST['offerStatus']);
            $stmt->bindParam(':assistantshipStatus', $_POST['assistantshipStatus']);
            $stmt->bindParam(':applicantResponse', $_POST['applicantResponse']);
            $stmt->bindParam(':appID', $_POST['appID']);
            $stmt->execute();
        }catch(Exception $e){
            echo "Error: " . $e->getMessage();
            echo "<br> Stack trace: " . $e->getTraceAsString();            
        }
    }

    // Select statement for selecting all of the application info.
    if(!empty($_GET['appID']) || (!empty($_POST['appID']) && !empty($_POST['offerStatus']) && !empty($_POST['assistantshipStatus']) && !empty($_POST['applicantResponse']) )){
        try{
            $config = parse_ini_file('../private/credentials.ini');
            $servername = $config["servername"];
            $username = $config["username"];
            $password = $config["password"];
            $dbname = $config["dbname"];
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $conn->prepare("SELECT * FROM application JOIN student on student.studentID = application.studentID JOIN college ON college.applicationID = application.applicationID WHERE application.applicationID=:appid");
            
            if(!empty($_GET['appID']))
                $appID=$_GET['appID'];
            else
                $appID=$_POST['appID'];
            $stmt->bindValue(':appid', $appID);
            
            $stmt->execute();
            if ($stmt->rowCount() > 0){
                $check = $stmt->fetch(PDO::FETCH_ASSOC);
            }else{
                exit();
            }
            
            $stmt = $conn->prepare("SELECT * FROM address JOIN student_address on address.addressID = student_address.addressID JOIN student ON student.studentID = student_address.studentID JOIN application on application.studentID = student.studentID WHERE student_address.type='permanent' AND application.applicationID=:appid;");
            if(!empty($_GET['appID']))
                $appID=$_GET['appID'];
            else
                $appID=$_POST['appID'];
            $stmt->bindValue(':appid', $appID);
            
            $stmt->execute();
            if ($stmt->rowCount() > 0){
                $perm = $stmt->fetch(PDO::FETCH_ASSOC);
            }else{
                exit();
            }

            $stmt = $conn->prepare("SELECT * FROM address JOIN student_address on address.addressID = student_address.addressID JOIN student ON student.studentID = student_address.studentID JOIN application on application.studentID = student.studentID WHERE student_address.type='mailing' AND application.applicationID=:appid;");
            if(!empty($_GET['appID']))
                $appID=$_GET['appID'];
            else
                $appID=$_POST['appID'];
            $stmt->bindValue(':appid', $appID);
            
            $stmt->execute();
            if ($stmt->rowCount() > 0){
                $mail = $stmt->fetch(PDO::FETCH_ASSOC);
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
    
    <form id="applicantUpdate" action="/applicants.php" method='post' enctype="multipart/form-data">
        
    <!-- Contact, Personal, & Application Information -->
    <div class="row">

        <h2 class="text-center text-danger"> <?php echo $check['firstName'] . " " . $check['middleName'] . " " . $check['lastName'];?></h2><br>

        <div class="col-md-4 col-sm-12">

            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h2 class="panel-title">Application Status</h2>
                </div>

                <div class="panel-body">

                    <h4>
                        <input type="hidden" name="applicationDate">
                        <b>Application Date & Time: </b> <?php echo $check['applicationDate']; ?>     
                    </h4>
                    
                    <h4>
                        <input type="hidden" name="appID" value="<?php echo $check['applicationID'];?>" />
                        <b>Offer Status: </b>
                        <select name="offerStatus" id="offerStatus" class="selectpicker form-control" data-live-search="true">
                            <option value="Undecided"<?=$check['offerStatus'] == 'Undecided' ? ' selected="selected"' : '';?> >Undecided</option>
                            <option value="Accepted"<?=$check['offerStatus'] == 'Accepted' ? ' selected="selected"' : '';?> >Accepted</option>
                            <option value="Rejected"<?=$check['offerStatus'] == 'Rejected' ? ' selected="selected"' : '';?> >Rejected</option>
                            <option value="Waitlist"<?=$check['offerStatus'] == 'Waitlist' ? ' selected="selected"' : '';?> >Waitlist</option>
                        </select>
                    </h4>

                    <h4>
                        <b>Assistantship Status: </b>
                        <select name="assistantshipStatus" id="assistantshipStatus" value="<?php echo $check['assisstantshipStatus'];?>" class="selectpicker form-control" data-live-search="true">
                            <option value="Silver"<?=$check['assistantshipStatus'] == 'Silver' ? ' selected="selected"' : '';?> >Silver</option>
                            <option value="Gold"<?=$check['assistantshipStatus'] == 'Gold' ? ' selected="selected"' : '';?> >Gold</option>
                        </select>
                    </h4>

                    <h4>
                        <b>Applicant Response: </b>
                        <select name="applicantResponse" id="applicantResponse" value="<?php echo $check['applicantResponse'];?>" class="selectpicker form-control" data-live-search="true">
                            <option value="Decision Pending"<?=$check['applicantResponse'] == 'Decision Pending' ? ' selected="selected"' : '';?> >Decision Pending</option>
                            <option value="Accept Offer"<?=$check['applicantResponse'] == 'Accept Offer' ? ' selected="selected"' : '';?> >Accept Offer</option>
                            <option value="Reject Offer"<?=$check['applicantResponse'] == 'Reject Offer' ? ' selected="selected"' : '';?> >Reject Offer</option>
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
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Contact Information</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <b>Primary Email: </b> <?php echo $check['primaryEmail']; ?>
                    </h4>
                    <h4>
                        <b>Secondary Email: </b> <?php echo $check['secondaryEmail']; ?>
                    </h4>
                    <h4>
                        <b>Primary Phone: </b> <?php echo $check['primaryPhone']; ?>
                    </h4>
                    <h4>
                        <b>Secondary Phone: </b> <?php echo $check['secondaryPhone']; ?>
                    </h4>
                    <h4>
                        <b>Permanent Address: </b> <?php echo $perm['street1'] . " " . $perm['street2'] . ", " . $perm['city'] . ", " . $perm['stateID'] . " " . $perm['zipCode'] . " " . $perm['countryID'] ;?>
                    </h4>
                    <h4>
                        <b>Mailing Address: </b> <?php echo $mail['street1'] . " " . $mail['street2'] . ", " . $mail['city'] . ", " . $mail['stateID'] . " " . $mail['zipCode'] . " " . $mail['countryID'];?>
                    </h4> 
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Personal Information</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <b>Social Security Number: </b> <?php echo $check['socialSecurityNumber']; ?>
                    </h4>
                    <h4>
                        <b>Date of Birth: </b>
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['dateOfBirth'])); 
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                    <h4>
                        <b>Race: </b><?php echo $check['ethnicity']; ?>
                    </h4>
                    <h4>
                        <b>Gender: </b><?php echo $check['gender']; ?>
                    </h4>
                    <h4>
                        <b>Citizenship: </b><?php echo $check['citizenship']; ?>
                    </h4>
                    <h4>
                        <b>Employer: </b>
                        <?php
                            error_reporting(0);
                            echo $check['currentEmployer'] . " since " . date('m/d/Y', strtotime($check['timeAtCurrentEmployer']));
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                </div>
            </div>
        </div>    
    </div>
    <!-- College & Testing -->
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Admission Request</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <b>Term: </b> <?php echo $check['term'] . " " . $check['year']; ?>
                    </h4>
                    <h4>
                        <b>Program: </b> <?php echo $check['program']; ?>
                    </h4>
                    <h4>
                        <b>Concentration: </b> <?php echo $check['concentration']; ?>
                    </h4>
                    <h4>
                        <b>Requested Assistantship: </b> 
                        <?php 
                        if($check['reqScholarship']==1)
                            echo "Yes";
                         else
                            echo "No"; 
                        ?>
                    </h4>
                    <h4>
                        <b>Previous Application: </b> <?php echo $check['previousAppDate']; ?>
                    </h4>
                    <h4>
                        <b>Previous Enrollment: </b> <?php echo $check['previousEnrollmentDate']; ?>
                    </h4>                    
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Colleges Attended</h2>
                </div>
                
                <?php
                    $check2=$check;
                    $rc=$stmt->rowCount();
                    for($i=0; $i<$rc; $i++){
                ?>
                <div class="panel-body">
                    <h4>
                        <b>College Name: </b> <?php echo $check2['collegeName']; ?>
                    </h4>
                    <h4>
                        <b>Dates Attended: </b>
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['dateStarted'])); 
                            error_reporting(E_ALL);
                        ?>
                        -
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['dateEnded'])); 
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                    <h4>
                        <b>GPA: </b> <?php echo $check2['gpa']; ?>
                    </h4>
                    <h4>
                        <b>Hours Completed: </b><?php echo $check2['hoursEarned']; ?>
                    </h4>
                    <h4>
                        <b>Hours Enrolled: </b> <?php echo $check['hoursEnrolled']; ?>
                    </h4>
                    <h4>
                        <b>Degree & Major(s): </b> <?php echo $check2['degree'] . " in " . $check2['major']; ?>
                    </h4>                  
                </div>
                <?php
                    $check2 = $stmt->fetch(PDO::FETCH_BOTH);
                    }
                ?>
            </div>
        </div>     
    </div>
    <!-- Documents & Interviews -->
    <div class="row">
        <div class="col-md-3 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Test Scores</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <b>GMAT Test Date: </b>
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['gmatTestDate'])); 
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                    <h4>
                        <b>GMAT Quantitative Score: </b> <?php echo $check['gmatQScore']; ?>
                    </h4>
                    <h4>
                        <b>GMAT Verbal Score: </b> <?php echo $check['gmatVScore']; ?>
                    </h4>
                    <h4>
                        <b>GMAT Total Score: </b> <?php echo $check['gmatTScore']; ?>
                    </h4>
                    <h4>
                        <b>GRE Test Date: </b>
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['greTestDate'])); 
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                    <h4>
                        <b>GRE Quantitative Score: </b> <?php echo $check['greQScore']; ?>
                    </h4>
                    <h4>
                        <b>GRE Verbal Score: </b> <?php echo $check['greVScore']; ?>
                    </h4>
                    <h4>
                        <b>GRE Total Score: </b> <?php echo $check['greTScore']; ?>
                    </h4>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">International Test Scores</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <b>TOEFL Test Date: </b>
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['toeflTestDate'])); 
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                    <h4>
                        <b>TOEFL Score: </b> <?php echo $check['toeflOnlineScore']; ?>
                    </h4>
                    <h4>
                        <b>TSE Test Date: </b>
                        <?php 
                            error_reporting(0);
                            echo date('m/d/Y', strtotime($check['tseTestDate'])); 
                            error_reporting(E_ALL);
                        ?>
                    </h4>
                    <h4>
                        <b>TSE Score: </b> <?php echo $check['tseScore']; ?>
                    </h4>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Documents</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <?php  
                            $stmt = $conn->prepare("SELECT * FROM attachment JOIN application ON attachment.applicationID=application.applicationID WHERE application.applicationID=:appid");
                            
                            if(!empty($_GET['appID']))
                                $appID=$_GET['appID'];
                            else
                                $appID=$_POST['appID'];
                            $stmt->bindValue(':appid', $appID);                            
                            $stmt->execute();
                            while ($docs = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
                                <a href="/document.php?id=<?php echo $docs['filename']; ?>" target="_blank" rel="noopener noreferrer"><?php echo $docs['documentType']; ?></a><br>
                        <?php } ?>
                    </h4>                 
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Interviews</h2>
                </div>
                <div class="panel-body">
                    <h4>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Standard Interview Guide</a><br><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #1 Notes - Paul Cronan</a><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #1 Notes - Jeff Mullins</a><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #1 Notes - Christina Serrano</a><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #1 Transcript</a><br>
                        <a href="../docs/test.mp3" target="_blank" rel="noopener noreferrer">Interview #1 Audio File</a><br><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #2 Notes - Paul Cronan</a><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #2 Notes - Jeff Mullins</a><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #2 Notes - Christina Serrano</a><br>
                        <a href="../docs/test.pdf" target="_blank" rel="noopener noreferrer">Interview #2 Transcript</a><br>
                        <a href="../docs/test.mp3" target="_blank" rel="noopener noreferrer">Interview #2 Audio File</a><br>
                    </h4>
                </div>
            </div>
        </div>
    </div>

    <!-- Comments -->
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">Comments</h2>
                </div>
                <div class="panel-body">

                    <div>
                        <p>Pull comments from database here.</p>
                    </div>   

                    <div class="form-group">
                        <label for="comments">Add Your Comments</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                            <input type="text" class="form-control" name="comments" id="comments" placeholder="">
                        </div>
                    </div>

                    <div class="col-md-2 col-sm-4 col-md-offset-5 col-sm-offset-4 text-center">
                        <input type="submit" class="btn btn-success btn-md" id="submitComment" value="Submit Comment">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>

</div>

<?php
    }else{
    $config = parse_ini_file('../private/credentials.ini');
    $servername = $config["servername"];
    $username = $config["username"];
    $password = $config["password"];
    $dbname = $config["dbname"];
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT * FROM application JOIN student on student.studentID = application.studentID");
    $stmt->execute();
?>

<div class="container-fluid">
    <h3 class="text-center">List of Applicants</h3>        
    <div style="height:500px;overflow:auto;">
    <table id="applicantTable" class="tablesorter">
    <thead>
      <tr>
        <th>Applicant Name</th>
        <th>Term</th>
        <th>Program</th>
        <th>GPA</th>
        <th>GMAT Total Score</th>
        <th>GRE Total Score</th>
      </tr>
    </thead>
    <tbody>

    <?php 
        while ($row = $stmt->fetch(PDO::FETCH_OBJ, PDO::FETCH_ORI_NEXT)) {
            echo "<tr>
                    <td> <a href='https://uark.us/applicants.php?appID=" . $row->applicationID . "'>" . $row->firstName . "  " . $row->lastName . "</a></td>
                    <td>" . $row->term . " " . $row->year . "</td>
                    <td>" . $row->program . "</td>
                    <td>" . $row->undergradGPA . "</td>
                    <td>" . $row->gmatTScore . "</td>
                    <td>" . $row->greTScore . "</td>
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