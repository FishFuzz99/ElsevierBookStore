<%--
  Created by IntelliJ IDEA.
  User: DUNAWATL
  Date: 7/25/2016
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html ng-app lang="en">
<!-- Bootstrap Core CSS -->
<link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">
<!-- Custom CSS -->
<link href="<c:url value="css/sgnOnCSS.css"/>" rel="stylesheet">


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
            <a href="front"><img class="logo" src=<c:url value="images/Logo.png"/> alt=""> </a>
            <a class="navbar-brand " href="front">Cover to Cover</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li >
                    <a href="account">Account</a>
                </li>
                <li >
                    <a href="shoppingCart">Book Bag</a>
                </li>
                <li class="login-button pull-right">
                    <a href="signOn">Login / Register</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-----------------------PUT ON EVERY PAGE END---------------------------------------------------------------->



<div class="container-login">
    <div class="login">
        <h1>Login Form</h1>
        <form action="login" method="post">
            <p><input name="email" type="email" placeholder="Username or Email" required/></p>
            <p><input name="password" type="password" placeholder="Password" required/></p>
            <p class="remember">
                <label><label>
                    <input type="checkbox" name="remember" id="remember"/>
                    Remember me on this computer?
                </label>
                </label>
            </p>
            <button class="btn btn-success login-submit-button" type="submit" value="Login">Submit</button>
        </form>
        <br>
        <button class="btn btn-primary register-submit-button" type="submit" value="forgot" onClick="location='registration'">Sign Up!</button>
    </div>
</div>
</body>

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
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>


</html>
