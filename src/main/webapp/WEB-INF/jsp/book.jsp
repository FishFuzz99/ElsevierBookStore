<%@ page import="Models.Book" %>

<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Book bookybook = (Book)request.getAttribute("testbook");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <link href="../../css/shop-homepage.css" rel="stylesheet">
</head>
<body>
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
                    <% if (session.getAttribute("user") == null) { %>
                    <li class="login-button pull-right">
                        <a href="signOn">Login / Register</a>
                    </li>
                    <% } %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="images">
                    <img src= <%= bookybook.image%> alt="" style="display:block; margin:auto;" name="image">
                </div>
                <div style="padding: 0% 20%">
                    <button type="button" class="btn btn-primary book-buttons cart-button">Add to Cart</button>
                    <button type="button" class="btn book-buttons wish-list-button">Add to Wish List</button>
                </div>
            </div>
            <div class="col-lg-8 col-md-8">
                <!-- this is where the book information such as title, author, date, publisher, short summary will go -->
                <div style="margin-left:12px">
                    <h1 style="text-align:left" name="title"><%= bookybook.title%></h1>
                    <h3 style="text-align:left" name="author"><%= bookybook.author%></h3>
                    <p name="datePublished">Publication Date: <%= bookybook.datePublished%></p>
                    <p name="ISBN">ISBN: <%= bookybook.getISBN()%></p>
                    <p class="book-descrip" style="text-align:left" name="description"><%= bookybook.getDescription()%></p>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>

</body>
</html>