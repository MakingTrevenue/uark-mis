<?php
    session_start();
    if (!isset($_SESSION['userID']))
        header('Location: invalidpermission.php?e=User'); 
    include 'header.php';
?>

<!-- Page Content Container -->
<div class="container-fluid">
    
    <form id="applicationform" action="/applicationSubmit.php" method="post" enctype="multipart/form-data">
        
    <!-- Personal & Contact Information -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Personal & Contact Information</h2>
                </div>

                <div class="panel-body">

                    <!-- Personal & Contact Information Left Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="John">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="middleName">Middle Name (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="middleName" id="middleName" placeholder="Edward">
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
                            <label for="preferredName">Preferred Name (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="preferredName"  id="preferredName" placeholder="John E. Doe">
                            </div>
                        </div>

                    </div>

                    <!-- Personal & Contact Information Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="primaryEmail">Primary Email</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input type="email" class="form-control" name="primaryEmail"  id="primaryEmail" placeholder="example@domain.com">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="secondaryEmail">Secondary Email (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                                <input type="email" class="form-control" name="secondaryEmail"  id="secondaryEmail" placeholder="alternate@domain.com">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="primaryPhone">Primary Phone</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                <input type="tel" class="form-control" name="primaryPhone" id="primaryPhone" placeholder="(800) 555-1234">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="secondaryPhone">Secondary Phone (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                                <input type="tel" class="form-control" name="secondaryPhone"  id="secondaryPhone" placeholder="(800) 555-1234">
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>       

    </div>

    <!-- Address Information -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Address Information</h2>
                </div>

                <div class="panel-body">

                    <!-- Address Information Left Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-info">Permanent Address</h4>

                        <div class="form-group">
                            <label for="streetAddress">Street Address</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="streetAddress"  id="streetAddress" placeholder="1234 Main Street">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="streetAddress2">Street Address 2 (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="streetAddress2" id="streetAddress2" placeholder="Apartment 314B">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="city">City</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="city"  id="city" placeholder="Chicago">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="state">State</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="state"  id="state" placeholder="IL">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="zipCode">ZIP Code</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="zipCode"  id="zipCode" placeholder="60827">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="country">Country</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-globe"></i></span>
                                <input type="text" class="form-control" name="country" id="country" placeholder="US">
                            </div>
                        </div>

                    </div>

                    <!-- Address Information Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-info">Mailing Address</h4>

                        <div class="form-group">
                            <label for="streetAddress-M">Street Address</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="streetAddressM"  id="streetAddressM" placeholder="567 Oak Avenue">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="streetAddress2-M">Street Address 2 (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="streetAddress2M" id="streetAddress2M" placeholder="Suite 269">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="city-M">City</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="cityM" id="cityM" placeholder="Beverly Hills">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="state-M">State</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="text" class="form-control" name="stateM" id="stateM" placeholder="CA">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="zipCode-M">ZIP Code</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="zipCodeM" id="zipCodeM" placeholder="90210">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="country-M">Country</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-globe"></i></span>
                                <input type="text" class="form-control" name="countryM" id="countryM" placeholder="US">
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>    

    </div>

    <!-- Additional Personal Information -->
    <div class="row">        

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Additional Personal Information</h2>
                </div>

                <div class="panel-body">

                    <!-- Additional Personal Information Left Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="socialSecurityNumber">Social Security Number</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-id-card-o"></i></span>
                                <input type="text" class="form-control" name="socialSecurityNumber"  id="socialSecurityNumber" placeholder="123-45-6789">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="dateOfBirth">Date of Birth</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" name="dateOfBirth" id="dateOfBirth" placeholder="">
                            </div>
                        </div>

                    </div>

                    <!-- Additional Personal Information Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="ethnicity">Race / Ethnicity</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-group"></i></span>
                                <select name="ethnicity" id="ethnicity" class="selectpicker form-control" data-live-search="true">
                                    <option>Alaskan Native or American Indian</option>
                                    <option>Asian or Pacific Islander</option>
                                    <option>Black, Non-Hispanic</option>
                                    <option>Hispanic</option>
                                    <option>White, Non-Hispanic</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-venus-mars"></i></span>
                                <select name="gender" id="gender" class="selectpicker form-control" data-live-search="true">
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Other</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="citizenship">Citizenship</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-globe"></i></span>
                                <select name="citizenship" id="citizenship" class="selectpicker form-control" data-live-search="true">
                                    <option>U.S. Citizen</option>
                                    <option>Resident Alien</option>
                                    <option>Non-Resident Alien</option>
                                </select>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>       

    </div>

    <!-- Admission Request -->
    <div class="row">        

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Admission Request</h2>
                </div>

                <div class="panel-body">

                    <!-- Admission Request Left Column-->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="term">Term</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
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
                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
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
                            <label for="program">Program</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="program" id="program" class="selectpicker show-tick form-control" data-live-search="true">
                                    <option>Full-Time MIS</option>
                                    <option>Professional MIS</option>
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

                        <h4 class="text-info">Employment Information</h4>

                        <div class="form-group">
                            <label for="currentEmployer">Current Employer (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-building"></i></span>
                                <input type="text" class="form-control" name="currentEmployer"  id="currentEmployer" placeholder="Walmart Stores, Inc.">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="timeAtCurrentEmployer">Date Started at Current Employer (optional)</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" name="timeAtCurrentEmployer" id="timeAtCurrentEmployer" placeholder="">
                            </div>
                        </div>                                                

                    </div>

                    <!-- Admission Request Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">                
                            <label>Requested Scholarship or Assistantship?
                                <label class="checkbox-inline"><input name="reqScholarship" type="checkbox" value="reqScholarship">Yes</label>
                            </label>
                        </div>
                        
                        <div class="form-group">				
                            <label>Have you ever applied to the University of Arkansas?
                                <label class="checkbox-inline"><input name="previousApp" type="checkbox" value="previousApp">Yes</label>
                            </label>
                        </div>

                        <div class="previousApp box">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">When?</span>
                                    <input type="text" class="form-control" name="previousAppDate" value ="" placeholder="Fall 2017">
                                </div>
                            </div><br>
                        </div>

                        <div class="form-group">				
                            <label>Did you enroll?
                                <label class="checkbox-inline"><input name="previousEnrollment" type="checkbox" value="previousEnrollment">Yes</label>
                            </label>
                        </div>

                        <div class="previousEnrollment box">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">When?</span>
                                    <input type="text" class="form-control" name="previousEnrollmentDate" value="" placeholder="Fall 2013">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">If you enrolled, were you:</span>
                                    <select name="previousEnrollmentStatus" value="previousEnrollmentStatus" class="selectpicker show-tick form-control" data-live-search="true" title="">
                                        <option>Undergraduate</option>
                                        <option>Graduate</option>
                                        <option>Other</option>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <h4 class="text-info">Education Information</h4>
                        
                        <div class="form-group">
                            <label for="undergradGPA">Undergraduate GPA</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                <input type="number" step="0.01" class="form-control" name="undergradGPA" id="undergradGPA" placeholder="Range: 0.00-4.00">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="juniorseniorGPA">GPA in Junior/Senior Years</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                <input type="number" step="0.01" class="form-control" name="juniorseniorGPA" id="juniorseniorGPA" placeholder="Range: 0.00-4.00">
                            </div>                            
                        </div>

                    </div>

                </div>

            </div>

        </div>
        
    </div>

    <!-- Colleges Attended -->

    <div class="row">        

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Colleges Attended</h2>
                </div>

                <div class="panel-body">

                    <!-- Colleges Attended Left Column-->
                    <div id="collegeDuplicate">
                    <div class="col-md-6 col-sm-6">

                        <div class="form-group">
                            <label for="collegeName">College Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-university"></i></span>
                                <input type="text" class="form-control" name="collegeName"  id="collegeName" placeholder="University of Arkansas">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="dateStarted">Date Started</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" name="dateStarted" id="dateStarted" placeholder="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="dateEnded">Date Ended</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" name="dateEnded" id="dateEnded" placeholder="">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="collegeGPA">GPA</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                <input type="number" step="0.01" class="form-control" name="collegeGPA" id="collegeGPA" placeholder="Range: 0.00-4.00">
                            </div>
                        </div>                        

                    </div>

                    <!-- Colleges Attended Right Column -->
                    <div class="col-md-6 col-sm-6">                        
                        
                        <div class="form-group">
                            <label for="hoursEarned">Hours Earned To Date</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="hoursEarned"  id="hoursEarned" placeholder="120">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="hoursEnrolled">Hours of Current Enrollment</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                <input type="number" pattern="\d*" class="form-control" name="hoursEnrolled"  id="hoursEnrolled" placeholder="15">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="degree">Degree Earned</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <input type="text" class="form-control" name="degree"  id="degree" placeholder="Bachelor's Degree">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="major">Major</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <input type="text" class="form-control" name="major"  id="major" placeholder="Information Systems">
                            </div>
                        </div>
                        
                    </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3 text-center">
                        <button id="duplicateButton" class="btn btn-success" onlick="duplicate()">Add another college</button>
                    </div>  

                </div>                           
             
            </div>

        </div>
        
    </div>
	
    <!-- Credentials -->
    <div class="row">

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Credentials</h2>
                </div>

                <div class="panel-body">

                    <!-- Credentials Left Column-->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-info">Testing Information</h4>

                        <label class="checkbox-inline"><input name="gmat" type="checkbox" value="gmat">GMAT</label>
                        <label class="checkbox-inline"><input name="gre" type="checkbox" value="gre">GRE</label>
                        <p class="help-block">Check the exam(s) you have taken. At least one is required.</p>
                        
                        <div class="gmat box">
                            <div class="form-group">
                                <label for="gmatTestDate">GMAT Test Date</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="date" class="form-control" name="gmatTestDate" id="gmatTestDate" placeholder="">
                                </div>
                            </div>
                        
                            <div class="form-group">
                                <label for="gmatQScore">GMAT Quantitative Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="gmatQScore" id="gmatQScore" placeholder="Scaled: 6-51">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="gmatVScore">GMAT Verbal Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="gmatVScore" id="gmatVScore" placeholder="Scaled: 6-51">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="gmatTScore">GMAT Total Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="gmatTScore" id="gmatTScore" placeholder="Range: 200-800">
                                </div>
                            </div>
                        </div>

                        <div class="gre box">
                            <div class="form-group">
                                <label for="greTestDate">GRE Test Date</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="date" class="form-control" name="greTestDate" id="greTestDate" placeholder="">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="greQScore">GRE Quantitative Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="greQScore" id="greQScore" placeholder="Range: 130-170">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="greVScore">GRE Verbal Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="greVScore" id="greVScore" placeholder="Range: 130-170">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="greTScore">GRE Total Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="greTScore" id="greTScore" placeholder="Range: 260-340">
                                </div>
                            </div>
                        </div>                        
                       
                    </div>

                    <!-- Credentials Right Column -->
                    <div class="col-md-6 col-sm-6">

                        <h4 class="text-info">International Testing Information</h4>

                        <label class="checkbox-inline"><input name="toeflOnline" type="checkbox" value="toeflOnline">TOEFL Online</label>
                        <label class="checkbox-inline"><input name="toeflPaper" type="checkbox" value="toeflPaper">TOEFL Paper</label>
                        <label class="checkbox-inline"><input name="tse" type="checkbox" value="tse">TSE</label>
                        <p class="help-block">Check the exam(s) you have taken. At least one TOEFL exam is required if you are an international student.</p>
                        
                        <div class="toeflOnline box">
                            <div class="form-group">
                                <label for="toeflTestDate">TOEFL Test Date</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="date" class="form-control" name="toeflTestDate" id="toeflTestDate" placeholder="">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="toeflOnlineScore">TOEFL Online Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="toeflOnlineScore" id="toeflOnlineScore" placeholder="Range: 0-120">
                                </div>
                            </div>
                        </div>
                        
                        <div class="toeflPaper box">
                            <div class="form-group">
                                <label for="toeflTestDate">TOEFL Test Date</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="date" class="form-control" name="toeflTestDate" id="toeflTestDate" placeholder="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="toeflPaperScore">TOEFL Paper Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="toeflPaperScore" id="toeflPaperScore" placeholder="Range: 310-677">
                                </div>
                            </div>
                        </div>
                        
                        <div class="tse box">
                            <div class="form-group">
                                <label for="tseTestDate">TSE Test Date</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="date" class="form-control" name="tseTestDate" id="tseTestDate" placeholder="">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="tseScore">TSE Score</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                    <input type="number" pattern="\d*" class="form-control" name="tseScore" id="tseScore" placeholder="Range: 20-60">
                                </div>
                            </div>
                        </div>                          

                    </div>

                </div>

            </div>

        </div>        

    </div>
    
    <!-- Documents -->
    <div class="row">        

        <div class="col-md-12 col-sm-12">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title">Documents</h2>
                </div>

                <div class="panel-body">

                    <!-- Documents Left Column -->
                    <div class="col-md-6 col-sm-6">
                        
                        <label for="resume">Résumé</label>
                        <input type="file" class="filestyle" name='resumeFile' id="resumeFile" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file"><br>
                                                
                        <label for="essayQuestions">Essay Questions</label>
                        <input type="file" class="filestyle" name='essayQuestionsFile' id="essayQuestionsFile" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file"><br>
                        
                        <label for="transcript">Official Transcript</label>
                        <input type="file" class="filestyle" name='transcriptFile' id="transcriptFile" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file"><br>
                                                
                    </div>

                    <!-- Documents Right Column -->
                    <div class="col-md-6 col-sm-6">
                        
                        <label for="recLetter1">Recommendation Letter #1</label>
                        <input type="file" class="filestyle" id="recLetter1" name="recLetter1" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file"><br>
                                                
                        <label for="recLetter2">Recommendation Letter #2</label>
                        <input type="file" class="filestyle" id="recLetter2" name="recLetter2" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file"><br>
                        
                        <label for="recLetter3">Recommendation Letter #3</label>
                        <input type="file" class="filestyle" id="recLetter3" name="recLetter3" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file"><br>
                                                
                    </div>

                    <div class="col-md-6 col-sm-6">

                        <label for="educationalExperience">Summary of Educational Experience Form (optional)</label>
                        <input type="file" class="filestyle" name='educationalExperienceFile' id="educationalExperienceFile" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file">
                        <p class="help-block">Required for international students only.</p>

                    </div>

                    <div class="col-md-6 col-sm-6">
                    
                        <label for="supplementalForm">Supplemental & Financial Information Form (optional)</label>
                        <input type="file" class="filestyle" name='supplementalFormFile' id="supplementalFormFile" data-buttonName="btn-primary" data-buttonBefore="true" data-buttonText="&nbsp;Choose file">
                        <p class="help-block">Required for international students only.</p>

                    </div>

                </div>

            </div>

        </div>       

    </div>
    
    <!-- Terms & Services Agreement -->
    <div class="row">

        <div class="col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3 text-center">

            <label class="checkbox-inline">
                <input type="checkbox">
                I hereby affirm that all information supplied is complete and accurate. It is my understanding that I shall not be considered for admission until I 
                have submitted all necessary documents and paid the application fee. I further agree to inform the Graduate School of Business of any change in my plans 
                to attend the University of Arkansas. I understand that withholding information requested or giving false information may make me ineligible for admission, 
                enrollment, and may subject me to reclassification of residency status for tuition purposes and/or withdrawal from the University. 
                <b>I further agree that my electronic signature on this application verifies that "on my honor as a graduate student at the University of Arkansas, 
                I certify that I will neither give nor receive inappropriate assistance on the work I do for my degree."</b>
            </label>
            <br><br>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">Electronic Signature</span>
                    <input type="text" class="form-control" id="electronicSignature" placeholder="John E. Doe">
                </div>
            </div>

        <div class="col-md-2 col-sm-4 col-md-offset-5 col-sm-offset-4 text-center">   

            <br>
            <input type="submit" class="btn btn-success btn-lg" id="submitButton" value="Submit Application">
            <br>

        </div>

    </div>
        
    </form>
    
</div>

<script type="text/javascript" src="./js/applicationFormValidation.js"></script>

<?php
    include 'footer.php';
?>