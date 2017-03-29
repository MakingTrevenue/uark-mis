<?php
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
                    <h2 class="panel-title">Faculty Information & Graduate Assistant Request</h2>
                </div>

                <div class="panel-body">

                    <!-- Faculty Information Left Column -->
                    <div class="col-md-6 col-sm-6">

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
                            <label for="department">Department</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                <select name="department" id="department" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>ACCT</option>
                                    <option>ECON</option>
                                    <option>FINN</option>
                                    <option>ISYS</option>
                                    <option>MGMT</option>
                                    <option>MKTG</option>
                                    <option>SCMT</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input type="email" class="form-control" name="email"  id="email" placeholder="example@domain.com">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                <input type="tel" class="form-control" name="phone" id="phone" placeholder="(800) 555-1234">
                            </div>
                        </div>

                    </div>

                    <!-- GA Duties Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="gaHelp">Please describe how a GA would be helpful to you in your professional endeavors (e.g. teaching, research, service, etc.).</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                                <textarea class="form-control custom-control" rows="5" name="gaHelp" id="gaHelp"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="hoursRequired">On average, how many hours of work is needed each week?</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="hoursRequired"  id="hoursRequired" placeholder="20">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="gaDescription">Please provide a brief job description (e.g. duties to be performed.</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                                <textarea class="form-control custom-control" rows="5" name="gaDescription" id="gaDescription"></textarea>
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

                        <table class="table">
                            <!-- Table Header -->
                            <thead>
                                <tr>
                                    <th>Computer Skills</th>
                                    <th>High</th>
                                    <th>Medium</th>
                                    <th>Low</th>
                                    <th>None</th>
                                </tr>
                            </thead>

                            <!-- Table Body -->
                            <tbody>
                            <form>
                                <tr>
                                    <td><label>Internet</label></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                </tr>
                                <tr>
                                    <td><label>Word Processing</label></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                </tr>
                                <tr>
                                    <td><label>Spreadsheets</label></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                </tr>
                                <tr>
                                    <td><label>Database</label></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                </tr>
                            </form>
                            </tbody>
                        </table>

                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <table class="table">
                            <!-- Table Header -->
                            <thead>
                                <tr>
                                    <th>Communication Skills</th>
                                    <th>High</th>
                                    <th>Medium</th>
                                    <th>Low</th>
                                    <th>None</th>
                                </tr>
                            </thead>

                            <!-- Table Body -->
                            <tbody>
                            <form>
                                <tr>
                                    <td><label>Writing Skills</label></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                </tr>
                                <tr>
                                    <td><label>Editing Skills</label></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                </tr>
                                <tr>
                                    <td><label>English-Speaking Skills</label></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                    <td><input type="radio" id='internet1' name="internet1"></td>
                                </tr>
                            </form>
                            </tbody>
                        </table>

                    </div>

                </div>

            </div>

        </div>       

    </div>

    <!-- Specific Request -->
    <div class="row">        

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Specific Request</h2>
                </div>

                <div class="panel-body">

                    <!-- Admission Request Left Column-->
                    <div class="col-md-6 col-sm-6">

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

                    </div>

                    <!-- Admission Request Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="gaComments">Comments:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                                <textarea class="form-control custom-control" rows="5" name="gaComments" id="gaComments"></textarea>
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

<?php
    include 'footer.php';
?>