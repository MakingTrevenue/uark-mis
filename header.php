<?php
    error_reporting(0);
	session_start();
    error_reporting(E_ALL);
    if(isset($_GET['logout'])){
        session_unset();
        session_destroy();
    }
    print_r($_SESSION);    
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

    <!-- Latest Bootstrap & jQuery compiled and minified JavaScript -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Font Awesome JavaScript -->
    <script type="text/javascript" src="https://use.fontawesome.com/2fe8cd2f19.js"></script>

    <!-- FileStyle JavaScript -->
    <script type="text/javascript" src="./js/bootstrap-filestyle.min.js"></script>

    <!-- Form Validation jQuery -->
    <script type="text/javascript" src="./js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="./js/additional-methods.min.js"></script>

    <!-- Masked Inputs jQuery -->
    <script type="text/javascript" src="./js/jquery.inputmask.bundle.min.js"></script>

    <!-- Table Sorter jQuery Plugin -->
    <script type="text/javascript" src="./js/jquery.tablesorter.js"></script>

</head>

<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Navigation Bar Header -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./index.php"><img src="./img/ualogowhite.png"></a>
        </div>

        <div class="collapse navbar-collapse" id="myNavbar">
            <!-- Navigation Bar Tabs -->
            <ul class="nav navbar-nav">
                <li><a href="./application.php">Application</a></li>
				<li><a href="./applicants.php">Applicants</a></li>
                <li><a href="./advising.php">Advising</a></li>
                <li><a href="./ga.php">GA</a></li>
            </ul>
            <!-- Navigation Bar Modals -->
            <ul class="nav navbar-nav navbar-right">
                <?php if(isset($_GET['logout']) || !isset($_SESSION['userID'])){ ?>
                    <li id="signupButton"><a href="#signUpModal" data-toggle="modal"><span class="fa fa-user-plus"></span>&nbsp; Sign Up</a></li>
                    <li id="loginButton"><a href="#loginModal" data-toggle="modal"><span class="fa fa-sign-in"></span>&nbsp; Login</a></li>
                <?php }else{ ?>
                    <li id="logoutButton"><a href="./logout.php"><span class="fa fa-sign-out"></span>&nbsp; Logout <?php echo $_SESSION['name']?></a></li>
                <?php } ?>
            </ul>
            <!-- Applicants Search Bar -->
            <?php if(basename($_SERVER['PHP_SELF'])=='applicants.php'){ ?>
            <div id="navbarSearch">
                <form class="navbar-form pull-right">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" id="filterInput" onkeyup="filterTable()" class="form-control" placeholder="Search all applicants">
                            <span class="input-group-addon">
                                <span class="fa fa-search"></span>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <?php } ?>
        </div>
    </div>
</nav>

<!-- Login Modal -->
<form id="loginsignup" action="/login.php" method="post" enctype="multipart/form-data">
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
                <input type="submit" value="Login" class="btn btn-primary btn-block"><br>
                <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
</form>

<!-- Sign Up Modal -->
<form id="accountsignup" action="/signup.php" method="post" enctype="multipart/form-data">
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
                <input type="submit" value="Create Account" class="btn btn-primary btn-block"><br>
                <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
</form>