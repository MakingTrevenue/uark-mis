<?php
echo "<script>alert(" . isset($_SESSION) . ")</script>";
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>UARK MIS</title>
    <link rel="icon" href="./img/favicon.png">

    <!-- Latest Bootstrap compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <style> .navbar { margin-bottom: 0px; } </style>

    <!-- Latest Bootstrap & jQuery compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Font Awesome JavaScript -->
    <script src="https://use.fontawesome.com/2fe8cd2f19.js"></script> 

    <!-- Custom JavaScript -->
    <script type="text/javascript" src="./js/scripts.js"></script>
    <script type="text/javascript" src="./js/bootstrap-filestyle.min.js"></script>

</head>

<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./index.html"><img src="./img/ualogowhite.png"></a>
        </div>

        <div class="collapse navbar-collapse" id="myNavbar">

            <ul class="nav navbar-nav">
                <li><a href="./application.html">Application</a></li>
				<li><a href="./applicants.php">Applicants</a></li>
                <li><a href="./advising.html">Advising</a></li>
                <li><a href="./enrollment.html">Enrollment</a></li>
                <li><a href="./graduation.html">Graduation</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#signUpModal" data-toggle="modal"><span class="fa fa-user-plus"></span>&nbsp; Sign Up</a></li>
                <li><a href="#loginModal" data-toggle="modal"><span class="fa fa-sign-in"></span>&nbsp; Login</a></li>
            </ul>

        </div>

    </div>
</nav>

<form id="loginsignup" action="/login.php" method="post" enctype="multipart/form-data">
<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <!-- Login Modal Header -->
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <h3 class="modal-title text-info text-center" id="loginModalHeaderLabel">Login</h3>
            </div>

            <!-- Login Modal Body -->
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                    <input id="loginUsername" type="text" class="form-control" name="loginUsername" placeholder="Username">
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-fw"></i></span>
                    <input id="loginPassword" type="password" class="form-control" name="loginPassword" placeholder="Password">
                </div>
            </div>

            <!-- Login Modal Footer -->
            <div class="modal-footer">
                <input type="submit" value="Login" class="btn btn-primary btn-block">
                <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
</form>

<!-- Sign Up Modal -->
<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <!-- Sign Up Modal Header -->
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <h3 class="modal-title text-info text-center" id="signUpModalHeaderLabel">Sign Up</h3>
            </div>
            <form id="accountsignup" action="/signup.php" method="post" enctype="multipart/form-data">
            <!-- Sign Up Modal Body -->
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                    <input id="signUpName" type="text" class="form-control" name="signUpName" placeholder="Full Name">
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span>
                    <input id="signUpEmail" type="email" class="form-control" name="signUpEmail" placeholder="Email Address">
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user-plus fa-fw"></i></span>
                    <input id="signUpUsername" type="text" class="form-control" name="signUpUsername" placeholder="Username">
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-fw"></i></span>
                    <input id="signUpPassword" type="password" class="form-control" name="signUpPassword" placeholder="Password">
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-fw"></i></span>
                    <input id="signUpPasswordConfirm" type="password" class="form-control" name="signUpPasswordConfirm" placeholder="Confirm Password">
                </div>
            </div>

            <!-- Sign Up Modal Footer -->
            <div class="modal-footer">
                <input type="submit" value="Create Account" class="btn btn-primary btn-block">
                <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Close</button>
            </div>

        </div>
        </form>
    </div>
</div>


<div class="container-fluid">

    <div class="row">

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="./img/banner1.jpg" alt="PIC1">
                    <div class="carousel-caption">
                        Old Main
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner2.jpg" alt="PIC2">
                    <div class="carousel-caption">
                        Willard J. Walker Hall
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner3.jpg" alt="PIC3">
                    <div class="carousel-caption">
                        Sam M. Walton College of Business
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner4.jpg" alt="PIC4">
                    <div class="carousel-caption">
                        Bud Walton Arena
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner5.jpg" alt="PIC5">
                    <div class="carousel-caption">
                        Donald W. Reynolds Razorback Stadium
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="col-md-12 col-sm-12">

            <h2 class="text-danger text-center">DISCLAIMER: This is a student project. This is NOT the official website for the University of Arkansas. Do not enter any personal information. To apply to the University of Arkansas, please visit <a href="https://application.uark.edu/">here</a>.</h2><br>

            <h2 class="text-danger text-center">Welcome to the Master of Information Systems Portal!</h2>

        </div>
    </div>

</div>

</body>
</html>