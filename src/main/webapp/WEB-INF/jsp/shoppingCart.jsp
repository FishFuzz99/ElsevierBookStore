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

<!--------------------Shopping Cart------------>

<form>
    <section>
        <h1 class="title">Book Bag</h1>
        <div class="cart">

            <table>
                <thead>
                <tr class="shopHeaders">
                    <th>Book</th>
                    <th>Description</th>
                    <th style="text-align:center">Price</th>
                    <th style="text-align:center">Options</th>

                </tr>
                </thead>
                <tbody table frame="box">
                <tr>
                    <td colspan="4"> <hr /> </td>
                </tr>
                <!----------------First Book------------->
                <tr class="shopBook">
                    <td class="books">
                        <img src="<c:url value="images/book2.jpg"/>">
                    </td>
                    <td class="des">
                        This is what a description will look like.
                    </td>
                    <td class="price">
                        $19.99
                    </td>
                    <td class="option">
                        <input type="submit" value="Remove" />
                        <p></p>
                        <p></p>
                        <input type="submit" value="Add to Wishlist" />
                    </td>
                </tr>
                <!----------------Second Book------------->
                <tr class="shopBook">
                    <td class="books">
                        <img src="<c:url value="images/book2.jpg"/>">
                    </td>
                    <td class="des">
                        This is what a description will look like.
                    </td>
                    <td class="price">
                        $19.99
                    </td>
                    <td class="option">
                        <input type="submit" value="Remove" />
                        <p></p>
                        <p></p>
                        <input type="submit" value="Add to Wishlist" />
                    </td>
                </tr>
                <!----------------Third Book------------->
                <tr class="shopBook">
                    <td class="books">
                        <img src="<c:url value="images/book2.jpg"/>">
                    </td>
                    <td class="des">
                        This is what a description will look like.
                    </td>
                    <td class="price">
                        $19.99
                    </td>
                    <td class="option">
                        <input type="submit" value="Remove" />
                        <p></p>
                        <p></p>
                        <input type="submit" value="Add to Wishlist" />
                    </td>
                </tr>

                </tbody>
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
                <tr>
                    <td class="item">book 1</td>
                    <td>$0.00</td>
                </tr>
                <tr>
                    <td class="item">book 2</td>
                    <td>$0.00</td>
                </tr>
                <tr>
                    <td class="item">book 3</td>
                    <td>$0.00</td>
                </tr>
                <tr>
                    <td class="defMoney">Shipping:</td>
                    <td class="money">$0.00</td>
                </tr>

                <tr>
                    <td class="defMoney">Tax:</td>
                    <td class="money">$0.00</td>
                </tr>
            </table>

            <hr />
            <table >
                <tr>
                    <td class="defMoney">Total:</td>
                    <td class="money">$0.00</td>
                </tr>
            </table>
            <p></p>

            <input type="button" value="Checkout" class="btn btn-info glyphicon glyphicon-user navbar-links" onClick="location='checkout'" >

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
