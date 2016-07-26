<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8" />
    <title>Registration</title>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="css/bootstrap.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/registration.css"/>" rel="stylesheet">
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
            <a href="front"><img class="logo" src="<c:url value="images/Logo.png"/>" alt=""></a>
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
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-----------------------PUT ON EVERY PAGE END---------------------------------------------------------------->

<!--------------------Registration Form------------>
<div class="containerReg">
    <form id="signup">
        <div class="header">
            <h3>Register</h3>
            <p>Cover To Cover Registered User</p>
        </div>
        <div class="sep"></div>
        <div class="inputs">

            <input type="text" name="first" required="required" placeholder="First Name" autofocus style="font-size:12px" />

            <input type="text" name="last" required="required" placeholder="Last Name" style="font-size:12px" />


            <input type="email" name="email" required="required" placeholder="Email" style="font-size:12px" />
            <input type="email" name="conEmail" required="required" placeholder="Confirm Email" style="font-size:12px" />

            <input type="password" name="password" required="required" placeholder="Password" style="font-size:12px" />

            <input type="password" name="conPassword" required="required" placeholder="Confirm Password" style="font-size:12px" />

        </div>
        <div class="checkboxy">
            <input name="cecky" id="checky" value="1" type="checkbox" /><label class="terms">&nbsp;I accept the terms of use</label>
        </div>
        <p>
            <input type="submit" value="Create Account" class="btn btn-info glyphicon glyphicon-user navbar-links">
        </p>


    </form>
</div>


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
</body>
</html>