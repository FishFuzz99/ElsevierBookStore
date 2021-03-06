<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">

</head>

<body>

<!-----------------------PUT ON EVERY PAGE START---------------------------------------------------------------->



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

<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-md-12">
            <div class="row">

                <div class=" col-md-12 col-lg-12 filters">

                    <p class="lead">Cover to Cover Library</p>
                </div>
            </div>


            <div class="row">
                <d:if test="${not empty list}">
                    <d:forEach items= "${list}" var="value" >
                        <div class=" col-sm-6 col-lg-3 col-md-4 book">
                            <div class="thumbnail">
                                <img src="<c:url value="${value.image}"/>" alt="">
                                <div class="caption">
                                    <h4 class="book-title">
                                        <a href= <d:out value="book?id=${value.ID}"/>><d:out value="${value.title}"/></a>
                                    </h4>
                                    <h4><d:out value="${value.price}"/></h4>
                                    <p class="book-author"><d:out value="${value.author}"/></p>
                                    <p class="book-descrip"></p><d:out value="${value.description}"/>
                                </div>
                                <a href="shoppingCart"><button type="button" class="btn btn-primary book-buttons cart-button" onclick="addToCart(<d:out value="${value.ID}"/>)">Add to Cart</button></a>

                                <% if (session.getAttribute("user") != null) { %>
                                    <button type="button" class="btn book-buttons wish-list-button" onclick="addToWishlist(<d:out value="${value.ID}"/>)">Add to Wish List</button>
                                <% } %>
                            </div>
                        </div>
                    </d:forEach>
                </d:if>
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
<script src="<c:url value="js/ajaxToController.js"/>"></script>

</body>

</html>