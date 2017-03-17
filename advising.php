<?php
    include 'header.php';
?>

<!-- Content -->
<div class="container-fluid">

        <!-- Student Information -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Information & Resources</h2>
                </div>

                <div class="panel-body">

                    <div class="col-md-2 col-sm-2">
                        <h4 class="text-danger text-center"><a href="http://gsb.uark.edu/master-of-information-systems/index.php" target="_blank">General MIS Info</a></h4>
                    </div>

                    <div class="col-md-2 col-sm-2">
                        <h4 class="text-danger text-center"><a href="http://gsb.uark.edu/master-of-information-systems/full-time.php" target="_blank">Full-Time MIS Info</a></h4>
                    </div>

                    <div class="col-md-2 col-sm-2">
                        <h4 class="text-danger text-center"><a href="http://gsb.uark.edu/master-of-information-systems/professional-mis.php" target="_blank">Professional MIS Info</a></h4>
                    </div>

                    <div class="col-md-2 col-sm-2">
                        <h4 class="text-danger text-center"><a href="http://catalog.uark.edu/graduatecatalog/business/informationsystemsisys/#masterofinformationsystems" target="_blank">Course Requirements</a></h4>
                    </div>

                    <div class="col-md-2 col-sm-2">
                        <h4 class="text-danger text-center"><a href="http://catalog.uark.edu/graduatecatalog/business/informationsystemsisys/#courseinventory" target="_blank">List of Courses</a></h4>
                    </div>

                    <div class="col-md-2 col-sm-2">
                        <h4 class="text-danger text-center"><a href="http://catalog.uark.edu/graduatecatalog/business/informationsystemsisys/#faculty" target="_blank">List of Faculty</a></h4>
                    </div>

                </div>

            </div>

        </div>       

    </div>

    <!-- Student Information -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Student Information</h2>
                </div>

                <div class="panel-body">

                    <!-- Student Information Left Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="studentName">Student Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="studentName" id="studentName" placeholder="John E. Doe">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="studentID">Student ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-id-card-o"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="studentID" id="studentID" placeholder="123456789">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="program">Program</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="program" id="program" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>Full-Time MIS</option>
                                    <option>Professional MIS</option>
                                </select>
                            </div>
                        </div>

                    </div>

                    <!-- Student Information Right Column -->
                    <div class="col-md-6 col-sm-6">

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

                        <div class="form-group">
                            <label for="concentration">Concentration</label>
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

                    </div>

                </div>

            </div>

        </div>       

    </div>

    <!-- Advising Information -->
    <div class="row">

        <div class="col-md-12 col-sm-12 col-xs-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Advising Form</h2>
                </div>

                <div class="panel-body">

                    <!-- Advising Information Far Left Column -->
                    <div class="col-md-2 col-sm-2">

                        <div class="form-group">
                            <label for="classID1">Class ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-star-o"></i></span>
                                <input type="text" class="form-control" name="classID1" id="classID1" placeholder="19">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Left Column -->
                    <div class="col-md-4 col-sm-4">

                        <div class="form-group">
                            <label for="course1">Course #1</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                <input type="text" class="form-control" name="course1" id="course1" placeholder="ISYS 5833">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Middle Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="section1">Section</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-th"></i></span>
                                <input type="text" class="form-control" name="section1" id="section1" placeholder="002">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Right Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="time1">Time</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="text" class="form-control" name="time1" id="time1" placeholder="MWF 7:30AM-8:20AM">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Far Left Column -->
                    <div class="col-md-2 col-sm-2">

                        <div class="form-group">
                            <label for="classID2">Class ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-star-o"></i></span>
                                <input type="text" class="form-control" name="classID2" id="classID2" placeholder="11">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Left Column -->
                    <div class="col-md-4 col-sm-4">

                        <div class="form-group">
                            <label for="course2">Course #2</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                <input type="text" class="form-control" name="course2" id="course2" placeholder="ISYS 5223">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Middle Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="section2">Section</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-th"></i></span>
                                <input type="text" class="form-control" name="section2" id="section2" placeholder="002">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Right Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="time2">Time</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="text" class="form-control" name="time2" id="time2" placeholder="MW 4:35PM-5:50PM">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Far Left Column -->
                    <div class="col-md-2 col-sm-2">

                        <div class="form-group">
                            <label for="classID3">Class ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-star-o"></i></span>
                                <input type="text" class="form-control" name="classID3" id="classID3" placeholder="12">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Left Column -->
                    <div class="col-md-4 col-sm-4">

                        <div class="form-group">
                            <label for="course3">Course #3</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                <input type="text" class="form-control" name="course3" id="course3" placeholder="ISYS 5423">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Middle Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="section3">Section</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-th"></i></span>
                                <input type="text" class="form-control" name="section3" id="section3" placeholder="002">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Right Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="time3">Time</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="text" class="form-control" name="time3" id="time3" placeholder="MWF 2:00PM-2:50PM">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Far Left Column -->
                    <div class="col-md-2 col-sm-2">

                        <div class="form-group">
                            <label for="classID4">Class ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-star-o"></i></span>
                                <input type="text" class="form-control" name="classID4" id="classID4" placeholder="3">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Left Column -->
                    <div class="col-md-4 col-sm-4">

                        <div class="form-group">
                            <label for="course4">Course #4</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                <input type="text" class="form-control" name="course4" id="course4" placeholder="ISYS 4373">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Middle Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="section4">Section</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-th"></i></span>
                                <input type="text" class="form-control" name="section4" id="section4" placeholder="003">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Right Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="time4">Time</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="text" class="form-control" name="time4" id="time4" placeholder="TR 8:00AM-9:15AM">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Far Left Column -->
                    <div class="col-md-2 col-sm-2">

                        <div class="form-group">
                            <label for="classID5">Class ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-star-o"></i></span>
                                <input type="text" class="form-control" name="classID5" id="classID5" placeholder="7">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Left Column -->
                    <div class="col-md-4 col-sm-4">

                        <div class="form-group">
                            <label for="course5">Course #5</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                <input type="text" class="form-control" name="course5" id="course5" placeholder="ISYS 5203">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Middle Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="section5">Section</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-th"></i></span>
                                <input type="text" class="form-control" name="section5" id="section5" placeholder="002">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Right Column -->
                    <div class="col-md-3 col-sm-3">

                        <div class="form-group">
                            <label for="time5">Time</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="text" class="form-control" name="time5" id="time5" placeholder="TR 9:30AM-10:45AM">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Comments -->
                    <div class="col-md-12 col-sm-12">

                        <div class="form-group">
                            <label for="comments">Comments</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                                <input type="text" class="form-control" name="comments" id="comments" placeholder="">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Advisor Signature -->
                    <div class="col-md-5 col-sm-5">

                        <div class="form-group">
                            <label for="advisorSignature">Advisor Signature</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                                <input type="text" class="form-control" name="advisorSignature" id="advisorSignature" placeholder="Adaline V. Isor">
                            </div>
                        </div>                        

                    </div>

                    <!-- Advising Information Student Signature -->
                    <div class="col-md-5 col-sm-5">

                        <div class="form-group">
                            <label for="studentSignature">Student Signature</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                                <input type="text" class="form-control" name="studentSignature" id="studentSignature" placeholder="John E. Doe">
                            </div>
                        </div> 

                    </div>

                    <!-- Advising Information Advising Date -->
                    <div class="col-md-2 col-sm-2">

                        <div class="form-group">
                            <label for="advisingDate">Date</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" name="advisingDate" id="advisingDate" placeholder="">
                            </div>
                        </div> 

                    </div>

                    <div class="col-md-2 col-sm-4 col-md-offset-5 col-sm-offset-4 text-center">   

                        <input type="submit" class="btn btn-success btn-lg" id="submitAdvising" value="Submit Advising Form">
                        <br>

                    </div>


                </div>

            </div>

        </div>       

    </div>

</div>

<?php
    include 'footer.php';
?>