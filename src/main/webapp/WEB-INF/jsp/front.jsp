<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta namre="author" content="">

    <title>Shop Homepage</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">

</head>

<body>

<!-----------------------PUT ON EVERY PAGE START---------------------------------------------------------------->
<!-- Navigation -->
<nav class="navbar navbar navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand " href="front">Cover to Cover</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li >
                    <a href="account">Account</a>
                </li>
                <li >
                    <a href="cart.html">Cart</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-----------------------PUT ON EVERY PAGE END---------------------------------------------------------------->

<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-md-12">
            <div class="row carousel-holder">
                <div class="col-md-8 col-md-offset-2 book">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="slide-image" src="<c:url value="images/harry-potter1.jpg"/>" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="<c:url value="images/harryPotter4.jpg"/>" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="<c:url value="images/harry-potter3.jpg"/>" alt="">
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-md-12 col-lg-12 filters">
                    <p class="lead">Filters</p>
                    <div class="list-group">
                        <button class="btn btn-primary">eBooks</button>
                        <button class="btn btn-primary">Print Books</button>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-sm-4 col-lg-4 col-md-4 book">
                    <div class="thumbnail">
                        <img src="<c:url value="images/catchingFire.jpg"/>" alt="">
                        <div class="caption">
                            <h4><a href="#">First Product</a></h4>
                            <h4 >$24.99</h4>
                            <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                            <button type="button" class="btn btn-primary book-buttons cart-button ">Add to Cart</button>
                            <button type="button" class="btn book-buttons">Add to Wish List</button>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4 book">
                    <div class="thumbnail">
                        <img src="<c:url value="images/divergent.jpg"/>" alt="">
                        <div class="caption">
                            <h4><a href="#">Second Product</a></h4>
                            <h4 >$64.99</h4>
                            <p class=" col-md-10 col-centered">This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <button type="button" class="btn btn-primary book-buttons cart-button">Add to Cart</button>
                            <button type="button" class="btn book-buttons">Add to Wish List</button>
                        </div>

                    </div>
                </div>



                <div class="col-sm-4 col-lg-4 col-md-4 book">
                    <div class="thumbnail">
                        <img src="<c:url value="images/theRainbowFish.jpg"/>" alt="">
                        <div class="caption">
                            <h4><a href="#">Third Product</a></h4>
                            <h4 >$74.99</h4>
                            <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <button type="button" class="btn btn-primary book-buttons cart-button">Add to Cart</button>
                            <button type="button" class="btn book-buttons">Add to Wish List</button>
                        </div>
                    </div>
                </div>


            </div>

            <div class="row">


                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<c:url value="images/lordOfTheRings.jpg"/>" alt="">
                        <div class="caption">
                            <h4><a href="#">Fourth Product</a></h4>
                            <h4 >$84.99</h4>
                            <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <button type="button" class="btn btn-primary book-buttons cart-button">Add to Cart</button>
                            <button type="button" class="btn book-buttons">Add to Wish List</button>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<c:url value="images/water-for-elephants.jpg"/>" alt="">
                        <div class="caption">
                            <h4><a href="#">Fifth Product</a></h4>
                            <h4 >$94.99</h4>
                            <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <button type="button" class="btn btn-primary book-buttons cart-button">Add to Cart</button>
                            <button type="button" class="btn book-buttons">Add to Wish List</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
<!-- /.container -->
<!-----------------------PUT ON EVERY PAGE START---------------------------------------------------------------->
<div class="container">

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy;</p>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->
<!-----------------------PUT ON EVERY PAGE END---------------------------------------------------------------->
<!-- jQuery -->
<script src="<c:url value="js/jquery.js"/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="js/bootstrap.min.js"/>"></script>

</body>

</html>
