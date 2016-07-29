<%--
  Created by IntelliJ IDEA.
  User: DUNAWATL
  Date: 7/25/2016
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="w" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Book Bag</title>
    <link href="<c:url value="css/bootstrap.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">
    <link href="<c:url value="css/shoppingCart.css"/>" rel="stylesheet">
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

<!--------------------Shopping Cart------------>

<form>
    <section>
        <h1 class="title">Book Bag</h1>
        <div class="cart">

            <table border ="2" class="table">
                <tr>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Format</th>
                    <th style="text-align:center">Options</th>

                </tr>
                <w:forEach var="book" items="${shoppingList}">
                    <tr>
                        <td>
                            <w:out value="${book.title}"/>
                        </td>
                        <td>
                            <w:out value="${book.price}"/>
                        </td>
                        <td>
                            <w:out value="${book.format}"/>
                        </td>
                        <td class="option">
                            <button type="button" class="btn book-buttons ">Remove</button>
                            <p></p>
                            <p></p>
                            <button type="button" class="btn book-buttons wish-list-button" onclick="addToWishlist(<w:out value="${value.ID}"/>)">Add to Wish List</button>
                        </td>
                    </tr>
                </w:forEach>
            </table>
        </div>
        <!----------------Checkout------------->
        <div class="checkout">
            <h1 style="text-align:center">Checkout</h1>
            <h3>&nbsp;Order Summary</h3>
            <p></p>
            <table>
                <tr>
                    <td class="defMoney">Items:</td>
                </tr>
                <w:set var="total" value="${0}"/>
                <w:forEach var="book" items="${shoppingList}">
                <tr>
                        <td class="item"><w:out value="${book.title}"/></td>
                        <td><w:out value="${book.price}"/></td>
                        <w:set var="total" value="${total + book.price}"/>
                </tr>
                </w:forEach>

            </table>

            <hr />
            <div>
            <table >
                <tr>
                    <td class="defMoney">Total:</td>
                    <td class="money">$<fmt:formatNumber  type="number" minFractionDigits="2" maxFractionDigits="2" value="${total}"/></td>
                </tr>
            </table>
            </div>
            <p></p>

            <input type="button" value="Checkout" class=" btn btn-primary book-buttons cart-button" onClick="location='checkout'" >

        </div>
    </section>



</form>





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
