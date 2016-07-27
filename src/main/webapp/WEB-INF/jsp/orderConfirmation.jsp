<%--
  Created by IntelliJ IDEA.
  User: DUNAWATL
  Date: 7/27/2016
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/Checkout.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">

</head>
<!-- Navigation -->
<nav class="navbar navbar navbar-fixed-top" role="navigation">

    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <button type="button" class="navbar-toggle navbar-default" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="front"><img class="logo1" src="<c:url value="images/Logo.png"/>" alt=""></a>
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Confirmation</title>
</head>
<body>
<p>Thank you for your order!</p>
</body>
</html>
