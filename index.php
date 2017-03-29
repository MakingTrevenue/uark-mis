<?php
    include 'header.php';
?>
<style> .navbar { margin-bottom: 0px; } </style>

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
                    <img src="./img/banner1.jpg" alt="UARK 1">
                    <div class="carousel-caption">
                        Old Main
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner2.jpg" alt="UARK 2">
                    <div class="carousel-caption">
                        Willard J. Walker Hall
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner3.jpg" alt="UARK 3">
                    <div class="carousel-caption">
                        Sam M. Walton College of Business
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner4.jpg" alt="UARK 4">
                    <div class="carousel-caption">
                        Bud Walton Arena
                    </div>
                </div>
                <div class="item">
                    <img src="./img/banner5.jpg" alt="UARK 5">
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

            <h2 class="text-danger text-center">Welcome to the University of Arkansas Master of Information Systems Portal!</h2>

        </div>
    </div>

</div>

<?php
    include 'footer.php';
?>