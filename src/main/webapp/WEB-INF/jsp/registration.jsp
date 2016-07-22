<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8" />
    <title><spring:message code="label.form.title"></spring:message></title>
    <!-- Bootstrap Core CSS -->
   <link href="../../css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../css/registration.css" rel="stylesheet">
    <link href="../../css/shop-homepage.css" rel="stylesheet">
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
                    <img class="logo" src="../../images/Logo.png" alt="">
                     <a class="navbar-brand " href="index.html">Cover to Cover</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li >
                            <a href="account.html">Account</a>
                        </li>
                        <li >
                             <a href="shoppingCart.html">Book Bag</a>
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
            <spring:message code="label.form.title"></spring:message>
            <div class="header">
                <h3>Register</h3>
                <p>Cover To Cover Registered User</p>
            </div>
            <div class="sep"></div>
            <form:form modelAttribute="user" method="post" enctype="utf8">
                <div class="inputs">

                    <form:input path="firstName" type="text" name="first" required="required" placeholder="First Name" autofocus="true" style="font-size:12px" />
                    <form:errors path="firstName" element="div"/>

                    <form:input path="lastName" type="text" name="last" required="required" placeholder="Last Name" style="font-size:12px" />
                    <form:errors path="lastName" element="div"/>

                    <form:input path="email" type="email" name="email" required="required" placeholder="Email" style="font-size:12px" />
                    <form:errors path="eail" element="div"/>

                    <form:input path="matchingEmail" type="email" name="matchingEmail" required="required" placeholder="Confirm Email" style="font-size:12px" />
                    <form:errors path="matchingEmail" element="div"/>

                    <form:input path="password" type="password" name="password" required="required" placeholder="Password" style="font-size:12px" />
                    <form:errors path="password" element="div"/>

                    <form:input path="matchingPassword" type="password" name="matchingPassword" required="required" placeholder="Confirm Password" style="font-size:12px" />
                    <form:errors path="matchingPassword" element="div"/>

                </div>
                <form:errors element="div" />
            </form:form>
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