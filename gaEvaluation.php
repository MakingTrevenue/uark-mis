<?php
    session_start();
    if (!isset($_SESSION['supervisorRole']) && !isset($_SESSION['adminRole']))
        header('Location: invalidpermission.php?e=Supervisor'); 
    include 'header.php';

    $conn=createPDO();
    $stmt = $conn->prepare("SELECT facultyID FROM faculty WHERE userid=:userid");
    $stmt->bindParam(':userid', $_SESSION["userID"]);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $facultyid=$result['facultyID'];  

    //Find GA Assignment

?>

<!-- Page Content Container -->
<div class="container-fluid">
    
    <form id="gaEvaluationForm" action="/gaEvaluationSubmit.php" method="post" enctype="multipart/form-data">
        
    <!-- -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Graduate Assistant Responsibilities</h2>
                </div>

                <div class="panel-body">

                    <!-- -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="concentration">GA Concentration</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="concentration" id="concentration" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>Enterprise Resource Planning (ERP) Management</option>
                                    <option>Enterprise Systems (ES) Management</option>
                                    <option>Information Technology Management</option>
                                    <option>Software Engineering Management</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="term">Term</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="term" id="term" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>Fall</option>
                                    <option>Spring</option>
                                    <option>Summer</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="year">Year</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="year" id="year" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>2017</option>
                                    <option>2018</option>
                                    <option>2019</option>
                                    <option>2020</option>
                                    <option>2021</option>
                                    <option>2022</option>
                                    <option>2023</option>
                                    <option>2024</option>
                                    <option>2025</option>
                                </select>
                            </div>
                        </div>

                    </div>

                    <!-- -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="duties">Please describe the duties the GA performed during this term's assignment.</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="3" name="duties" id="duties"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="skillMatch">Please describe how the GA's background and skills matched the assigned duties.</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="3" name="skillMatch" id="skillMatch"></textarea>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>       

    </div>

    <!-- GA Skills -->
    <div class="row">        

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Graduate Assistant Evaluation</h2>
                </div>

                <div class="panel-body">

                    <!-- Left Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-center"><b>Ratings</b></h4>

                        <table class="table">
                            <!-- Table Header -->
                            <thead>
                                <tr>
                                    <th width="30%" class="text-center"></th>
                                    <th width="14%" class="text-center">Very Poor</th>
                                    <th width="14%" class="text-center">Poor</th>
                                    <th width="14%" class="text-center">Average</th>
                                    <th width="14%" class="text-center">High</th>
                                    <th width="14%" class="text-center">Very High</th>
                                </tr>
                            </thead>

                            <!-- Table Body -->
                            <tbody>
                                <tr>
                                    <td><label>Quality of Work</label></td>
                                    <td class="text-center"><input type="radio" id="quality0" name="quality" value=0></td>
                                    <td class="text-center"><input type="radio" id="quality1" name="quality" value=1></td>
                                    <td class="text-center"><input type="radio" id="quality2" name="quality" value=2></td>
                                    <td class="text-center"><input type="radio" id="quality3" name="quality" value=3></td>
                                    <td class="text-center"><input type="radio" id="quality4" name="quality" value=4></td>
                                </tr>
                                <tr>
                                    <td><label>Timeliness of Work</label></td>
                                    <td class="text-center"><input type="radio" id="timeliness0" name="timeliness" value=0></td>
                                    <td class="text-center"><input type="radio" id="timeliness1" name="timeliness" value=1></td>
                                    <td class="text-center"><input type="radio" id="timeliness2" name="timeliness" value=2></td>
                                    <td class="text-center"><input type="radio" id="timeliness3" name="timeliness" value=3></td>
                                    <td class="text-center"><input type="radio" id="timeliness4" name="timeliness" value=4></td>
                                </tr>
                                <tr>
                                    <td><label>Amount of Work</label></td>
                                    <td class="text-center"><input type="radio" id="amount0" name="amount" value=0></td>
                                    <td class="text-center"><input type="radio" id="amount1" name="amount" value=1></td>
                                    <td class="text-center"><input type="radio" id="amount2" name="amount" value=2></td>
                                    <td class="text-center"><input type="radio" id="amount3" name="amount" value=3></td>
                                    <td class="text-center"><input type="radio" id="amount4" name="amount" value=4></td>
                                </tr>
                                <tr>
                                    <td><label>Overall Satisfaction</label></td>
                                    <td class="text-center"><input type="radio" id="overall0" name="overall" value=0></td>
                                    <td class="text-center"><input type="radio" id="overall1" name="overall" value=1></td>
                                    <td class="text-center"><input type="radio" id="overall2" name="overall" value=2></td>
                                    <td class="text-center"><input type="radio" id="overall3" name="overall" value=3></td>
                                    <td class="text-center"><input type="radio" id="overall4" name="overall" value=4></td>
                                </tr>
                            </tbody>

                        </table>

                        <div class="form-group">                
                            <label>Do you wish to be reassigned this GA next term?</label>&nbsp;&nbsp;
                            <label class="radio-inline">
                                <input type="radio" id="reassigned1" name="reassigned" value=1>Yes
                            </label>
                            <label class="radio-inline">
                                <input type="radio" id="reassigned0" name="reassigned" value=0>No
                            </label>
                        </div>

                        <div class="form-group">
                            <label for="reassignedComments">Explain why.</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="3" name="reassignedComments" id="reassignedComments"></textarea>
                            </div>
                        </div>

                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-center"><b>Comments</b></h4>

                        <div class="form-group">
                            <label for="qualityComments">Quality of Work</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="2" name="qualityComments" id="qualityComments"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="timelinessComments">Timeliness of Work</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="2" name="timelinessComments" id="timelinessComments"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="amountComments">Amount of Work</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="2" name="amountComments" id="amountComments"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="overallComments">Overall Satisfaction</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="2" name="overallComments" id="overallComments"></textarea>
                            </div>
                        </div>

                        
                    </div>

                </div>

            </div>

        </div>       

    </div>

    <div class="col-md-2 col-sm-4 col-md-offset-5 col-sm-offset-4 text-center">   
        <input type="submit" class="btn btn-success btn-lg" id="submitButton" value="Submit Evaluation"><br>
    </div>

    </form>
    
</div>

<script type="text/javascript" src="./js/gaEvaluationFormValidation.js"></script>

<?php
    include 'footer.php';
?>