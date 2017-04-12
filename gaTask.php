<?php
    session_start();
    if (!isset($_SESSION['gaRole']) && !isset($_SESSION['adminRole']))
        header('Location: invalidpermission.php?e=Graduate Assistant'); 
    include 'header.php';
?>

<!-- Page Content Container -->
<div class="container-fluid">
    
    <form id="gaTaskForm" action="/gaTaskSubmit.php" method="post" enctype="multipart/form-data">
        
    <!-- -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Create GA Task</h2>
                </div>

                <div class="panel-body">

                    <!-- -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="type">Type</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="type" id="type" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>Research</option>
                                    <option>Teaching</option>
                                    <option>Service</option>
                                    <option>Administrative</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="priority">Priority</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="priority" id="priority" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>Low</option>
                                    <option>Medium</option>
                                    <option>High</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="timeEstimate">Time Estimate (hours)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="timeEstimate"  id="timeEstimate" placeholder="3">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="dueDate">Due Date</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" name="dueDate" id="dueDate" placeholder="">
                            </div>
                        </div>

                    </div>

                    <!-- -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="instructions">Please describe the instructions for this specific task.</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                <textarea class="form-control custom-control" rows="3" name="instructions" id="instructions"></textarea>
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

<script type="text/javascript" src="./js/gaTaskFormValidation.js"></script>

<?php
    include 'footer.php';
?>