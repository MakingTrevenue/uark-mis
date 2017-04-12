<?php
    session_start();
    if (!isset($_SESSION['supervisorRole']) && !isset($_SESSION['adminRole']))
        header('Location: invalidpermission.php?e=Graduate Assistant'); 
    include 'header.php';
?>

<!-- Page Content Container -->
<div class="container-fluid">
    
    <form id="gaRequestForm" action="/gaRequestSubmit.php" method="post" enctype="multipart/form-data">
        
    <!-- Faculty Information & GA Request -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Graduate Assistant Request</h2>
                </div>

                <div class="panel-body">

                    <!-- GA Duties Left Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="reason">Please describe how a GA would be helpful to you in your professional endeavors (e.g. teaching, research, service, etc.).</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="3" name="reason" id="reason"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="hours">On average, how many hours of work is needed each week?</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="hours"  id="hours" placeholder="20">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description">Please provide a brief job description (e.g. duties to be performed).</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="3" name="description" id="description"></textarea>
                            </div>
                        </div>

                    </div>

                    <!-- GA Specific Request Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-center"><b>Request a Specific GA (optional)</b></h4>

                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="John">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Doe">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="gaComments">Comments:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                                <textarea class="form-control custom-control" rows="4" name="gaComments" id="gaComments"></textarea>
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
                    <h2 class="panel-title">Graduate Assistant Skills</h2>
                </div>

                <div class="panel-body">

                    <!-- Left Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-center"><b>Technical Skills</b></h4>

                        <table class="table">
                            <!-- Table Header -->
                            <thead>
                                <tr>
                                    <th width="32%" class="text-center"></th>
                                    <th width="17%" class="text-center">None</th>
                                    <th width="17%" class="text-center">Low</th>
                                    <th width="17%" class="text-center">Medium</th>
                                    <th width="17%" class="text-center">High</th>
                                </tr>
                            </thead>

                            <!-- Table Body -->
                            <tbody>
                                <tr>
                                    <td><label>Research <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="research0" name="research" value=0></td>
                                    <td class="text-center"><input type="radio" id="research1" name="research" value=1></td>
                                    <td class="text-center"><input type="radio" id="research2" name="research" value=2></td>
                                    <td class="text-center"><input type="radio" id="research3" name="research" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>Word Processing <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="wordProcessing0" name="wordProcessing" value=0></td>
                                    <td class="text-center"><input type="radio" id="wordProcessing1" name="wordProcessing" value=1></td>
                                    <td class="text-center"><input type="radio" id="wordProcessing2" name="wordProcessing" value=2></td>
                                    <td class="text-center"><input type="radio" id="wordProcessing3" name="wordProcessing" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>Data Analysis <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="dataAnalysis0" name="dataAnalysis" value=0></td>
                                    <td class="text-center"><input type="radio" id="dataAnalysis1" name="dataAnalysis" value=1></td>
                                    <td class="text-center"><input type="radio" id="dataAnalysis2" name="dataAnalysis" value=2></td>
                                    <td class="text-center"><input type="radio" id="dataAnalysis3" name="dataAnalysis" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>Programming <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="programming0" name="programming" value=0></td>
                                    <td class="text-center"><input type="radio" id="programming1" name="programming" value=1></td>
                                    <td class="text-center"><input type="radio" id="programming2" name="programming" value=2></td>
                                    <td class="text-center"><input type="radio" id="programming3" name="programming" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>Database <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="databaseSkill0" name="databaseSkill" value=0></td>
                                    <td class="text-center"><input type="radio" id="databaseSkill1" name="databaseSkill" value=1></td>
                                    <td class="text-center"><input type="radio" id="databaseSkill2" name="databaseSkill" value=2></td>
                                    <td class="text-center"><input type="radio" id="databaseSkill3" name="databaseSkill" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>SAP <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="sap0" name="sap" value=0></td>
                                    <td class="text-center"><input type="radio" id="sap1" name="sap" value=1></td>
                                    <td class="text-center"><input type="radio" id="sap2" name="sap" value=2></td>
                                    <td class="text-center"><input type="radio" id="sap3" name="sap" value=3></td>
                                </tr>
                            </tbody>

                        </table>

                        <div class="form-group">
                            <label for="statisticalPackages">Statistical Packages (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-bar-chart"></i></span>
                                <input type="text" class="form-control" name="statisticalPackages" id="statisticalPackages" placeholder="SAS, R, SPSS, Teradata, Stata, etc.">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="programmingLanguages">Desired Programming Languages (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-code"></i></span>
                                <input type="text" class="form-control" name="programmingLanguages" id="programmingLanguages" placeholder="Java, Python, C#, SQL, Visual Basic, etc.">
                            </div>
                        </div>

                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-center"><b>Communication & Other Skills</b></h4>

                        <table class="table">
                            <!-- Table Header -->
                            <thead>
                                <tr>
                                    <th width="32%" class="text-center"></th>
                                    <th width="17%" class="text-center">None</th>
                                    <th width="17%" class="text-center">Low</th>
                                    <th width="17%" class="text-center">Medium</th>
                                    <th width="17%" class="text-center">High</th>
                                </tr>
                            </thead>

                            <!-- Table Body -->
                            <tbody>
                                <tr>
                                    <td><label>Writing <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="writing0" name="writing" value=0></td>
                                    <td class="text-center"><input type="radio" id="writing1" name="writing" value=1></td>
                                    <td class="text-center"><input type="radio" id="writing2" name="writing" value=2></td>
                                    <td class="text-center"><input type="radio" id="writing3" name="writing" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>Editing <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="editing0" name="editing" value=0></td>
                                    <td class="text-center"><input type="radio" id="editing1" name="editing" value=1></td>
                                    <td class="text-center"><input type="radio" id="editing2" name="editing" value=2></td>
                                    <td class="text-center"><input type="radio" id="editing3" name="editing" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>English-Speaking <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="english0" name="english" value=0></td>
                                    <td class="text-center"><input type="radio" id="english1" name="english" value=1></td>
                                    <td class="text-center"><input type="radio" id="english2" name="english" value=2></td>
                                    <td class="text-center"><input type="radio" id="english3" name="english" value=3></td>
                                </tr>
                                <tr>
                                    <td><label>Grading <i class="fa fa-info-circle" rel="tooltip" title="skills include..."></i></label></td>
                                    <td class="text-center"><input type="radio" id="grading0" name="grading" value=0></td>
                                    <td class="text-center"><input type="radio" id="grading1" name="grading" value=1></td>
                                    <td class="text-center"><input type="radio" id="grading2" name="grading" value=2></td>
                                    <td class="text-center"><input type="radio" id="grading3" name="grading" value=3></td>
                                </tr>
                            </tbody>

                        </table>

                        <div class="form-group">
                            <label for="otherSkills">Please list any other desired skills not menioned (optional).</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="2" name="otherSkills" id="otherSkills"></textarea>
                            </div>
                        </div>

                        <div class="form-group">                
                            <label>Would you like to request multiple GAs with the same skills and required duties?&nbsp;
                                <label class="checkbox-inline"><input name="multipleGAs" type="checkbox" value="multipleGAs">Yes</label>
                            </label>
                            <p class="help-block">Note: If you would like to request another GA with a different skill set or different duties, you will need to submit another GA request form.</p>
                        </div>

                        <div class="multipleGAs box">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">How many?</span>
                                    <input type="number" class="form-control" name="multipleGAsNumber" value="2">
                                </div>
                            </div>
                        </div>
                        
                    </div>

                </div>

            </div>

        </div>       

    </div>

    <div class="col-md-2 col-sm-4 col-md-offset-5 col-sm-offset-4 text-center">   
        <input type="submit" class="btn btn-success btn-lg" id="submitButton" value="Submit Request"><br>
    </div>

    </form>
    
</div>

<script>
    $(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
            var inputValue = $(this).attr("value");
            $("." + inputValue).toggle();
       });
    })

</script>

<script type="text/javascript" src="./js/gaRequestFormValidation.js"></script>

<?php
    include 'footer.php';
?>