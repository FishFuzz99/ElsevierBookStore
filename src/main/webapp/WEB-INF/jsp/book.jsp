<%@ page import="Models.Book" %>

<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Book bookybook = (Book)request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book</title>

    <link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">

    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">
</head>
<body>
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
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="images">
                    <img src= "<c:url value="${book.image}"/>"  style="display:block; margin:auto;" name="image">
                </div>
                <div style="padding: 0% 20%">
                    <button type="button" class="btn btn-primary book-buttons cart-button" onclick="addToCart(<d:out value="${value.ID}"/>)">Add to Cart</button>
                    <button type="button" class="btn book-buttons wish-list-button" onclick="addToWishlist(<d:out value="${value.ID}"/>)">Add to Wish List</button>
                </div>
            </div>
            <div class="col-lg-8 col-md-8">
                <!-- this is where the book information such as title, author, date, publisher, short summary will go -->
                <div style="margin-left:12px">
                    <h1 style="text-align:left" name="title"><d:out value="${book.title}"/></h1>
                    <h3 style="text-align:left" name="author"><d:out value="${book.author}"/></h3>
                    <p name="format">Format: <d:out value="${book.format}"/></p>
                    <p name="datePublished">Publication Date: <d:out value="${book.datePublished}"/></p>
                    <p name="ISBN">ISBN: <d:out value="${book.ISBN}"/></p>
                    <p class="book-descrip" style="text-align:left" name="description"><d:out value="${book.description}"/></p>
                </div>
            </div>
        </div>
    </div>

<!-- jQuery -->
<script src="<c:url value="js/jquery.js"/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="js/bootstrap.min.js"/>"></script>


</body>
</html>