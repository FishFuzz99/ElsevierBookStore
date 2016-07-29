<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8" />
    <title>Registration</title>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/css/registration.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/shop-homepage.css"/>" rel="stylesheet">
</head>
<body>
<!-----------------------PUT ON EVERY PAGE START---------------------------------------------------------------->
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="front">Cover to Cover</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <form class="navbar-form navbar-left" action="search" method="post">
                <div class="form-group">
                    <input name="query" type="text" class="form-control" placeholder="Search">
                    <button type="submit" class="btn btn-default">Submit</button>
                    <select name="category" class="form-control" id="bookType">
                        <option <%if(request.getAttribute("category") == "title"){%> selected <%}%> value="title">Title</option>
                        <option <%if(request.getAttribute("category") == "author"){%> selected <%}%> value="author">Author</option>
                        <option <%if(request.getAttribute("category") == "genre"){%> selected <%}%> value="genre">Genre</option>
                        <option <%if(request.getAttribute("category") == "isbn"){%> selected <%}%> value="isbn">ISBN</option>
                    </select>
                </div>

            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><% if (session.getAttribute("user") != null) { %>
                    <% if (session.getAttribute("isAdmin") != null) { %>
                    <a class="nav-item nav-link login-button pull-right " href="admin">Admin</a>
                    <% } %>
                    <% } %></li>
                <li> <% if (session.getAttribute("user") != null) { %>
                    <a class="nav-item nav-link" href="account">Account</a>
                    <% } %></li>
                <li><% if (session.getAttribute("user") == null) { %>
                    <a class="nav-item nav-link login-button pull-right " href="signOn">Login / Register</a>
                    <% } %></li>
                <li> <a class="nav-item nav-link" href="shoppingCart">Book Bag</a></li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-----------------------PUT ON EVERY PAGE END---------------------------------------------------------------->

<!--------------------Registration Form------------>
<div class="containerReg">
    <form id="signup" action="registerUserAccount" method="post">
        <div class="header">
            <h3>Register</h3>
            <p>Cover To Cover Registered User</p>
        </div>
        <div class="sep"></div>
        <div class="inputs">

            <input type="text" name="firstName" required="required" placeholder="First Name" autofocus style="font-size:12px" />

            <input type="text" name="lastName" required="required" placeholder="Last Name" style="font-size:12px" />


            <input type="email" name="email" id="email1" required="required" placeholder="Email" style="font-size:12px" />
            <input type="email" name="matchingEmail" id="email2" required="required" placeholder="Confirm Email" style="font-size:12px" onkeyup="emailValidation(); return false;" />
            <span id="confirmMessage2" class="confirmMessage"></span>
            <input type="password" name="password" id="password1" required="required" placeholder="Password" style="font-size:12px" onkeyup="passwordValidationLength(); return false;"/>
            <span id="confirmMessage3" class="confirmMessage"></span>
            <input type="password" name="matchingPassword" id="password2" required="required" placeholder="Confirm Password" style="font-size:12px" onkeyup="passwordValidationMatch(); return false;"/>
            <span id="confirmMessage1" class="confirmMessage"></span>
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
<script src="<c:url value="js/registerValidation.js"/>"></script>
</body>
</html>