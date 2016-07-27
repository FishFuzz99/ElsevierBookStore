<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="w" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html ng-app="app">

<head>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/account.css"/>" rel="stylesheet">

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
                <% if (session.getAttribute("user") != null) { %>
                <li >
                    <a href="account">Account</a>
                </li>
                <% } %>
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
<!-----------------------PUT ON EVERY PAGE END---------------------------------------------------------------->


<div class="container tabs-menu">
    <h2>Account</h2>
    <ul class="nav nav-pills pills-menu">
        <li class="active"><a data-toggle="tab" href="#menu1">Edit Account Info</a></li>
        <li><a data-toggle="tab" href="#menu2">Order History</a></li>
        <li><a data-toggle="tab" href="#menu3">Wish List</a></li>

    </ul>

    <div class="tab-content">
        <div id="menu1" class="tab-pane fade in active ">
            <form>
                <ul class="info" style="list-style-type:none">
                    <li>
                        <div class="login">
                            <form>
                                <legend>Update Password</legend>
                                <p><input type="email" placeholder="Username or Email" required/></p>
                                <p><input type="password" placeholder="Old Password" required/></p>
                                <p><input type="password" placeholder="New Password" required/></p>
                                <p><input type="password" placeholder="Confirm New Password" required/></p>
                                <input class="btn btn-success login-button" type="submit" value="Submit"/>
                            </form>
                        </div>
                    </li>
                    <li>
                        <div class="payment">
                            <form>
                                <legend>Update Payment Information</legend>
                                <ul class="pay">
                                    <li>
                                        <label for="card">Credit Card Type:</label>
                                        <select name="card" id="card">
                                            <option value="QAJAVSC">Visa</option>
                                            <option value="QAWEBUI">Mastercard</option>
                                            <option value="QAWEBCSS">American Express</option>
                                            <option value="QAJQUERY">Discover</option>
                                        </select>
                                    </li>
                                    <li>
                                        <label for="Number">Credit Card Number:</label>
                                        <input type="text" id="number" name="number">
                                    </li>
                                    <li>
                                        <label for="expdate">Expiration Date:</label>
                                        <input type="text" id="expdate" name="expdate">
                                    </li>
                                    <li class="buttonBill">
                                        <input class="btn btn-success login-button" type="submit" value="Submit"/>
                                    </li>
                                </ul>
                            </form>
                        </div>
                    </li>
                    <li>
                        <div class="shipping">
                            <form>
                                <fieldset>
                                    <legend>Update Shipping Information</legend>
                                    <ul class="ship">
                                        <li>
                                            <label for="firstName">First Name:</label>
                                            <input type="text" id="firstName" name="firstName">
                                        </li>

                                        <li>
                                            <label for="surname">Last Name:</label>
                                            <input type="text" id="surname" name="surname">
                                        </li>


                                        <li>
                                            <label for="StShipAddress">Street Address:</label>
                                            <input type="text" id="StShipAddress" name="StShipAddress">
                                        </li>

                                        <li>
                                            <label for="StShipAddress2"></label>
                                            <input type="text" id="StShipAddress2" name="StShipAddress2">
                                        </li>

                                        <li>
                                            <label for="CityShipAddress">City/Town:</label>
                                            <input type="text" id="CityShipAddress" name="CityShipAddress">
                                        </li>

                                        <li>
                                            <label for="StateShipAddress">State:</label>
                                            <input type="text" id="StateShipAddress" name="StateShipAddress">
                                        </li>

                                        <li>
                                            <label for="ZipCode">Zip Code:</label>
                                            <input type="text" id="ZipCode" name="ZipCode">
                                        </li>

                                        <li>
                                            <label for="email">Email:</label>
                                            <input type="email" id="email" name="email" placeholder="you@domain.com" required>
                                        </li>
                                        <li>
                                            <label for="phone">Phone Number:</label>
                                            <input type="tel" id="phone" name="phone" placeholder="(555)555-5555" required>
                                        </li>
                                        <li class="buttonShip">
                                            <input class="btn btn-success login-button" type="submit" value="Submit"/><a href="account.jsp#menu4"></a>
                                        </li>
                                    </ul>
                                </fieldset>
                            </form>
                        </div>
                    </li>
                </ul>
            </form>
        </div>

        <div id="menu2" class="tab-pane fade">
            <form action="test" method="get">
            <table border="2" class="table">
                        <caption><h2>Order History</h2></caption>
                        <tr>
                            <th>Book</th>
                            <th>Price</th>
                            <th>Order ID</th>
                            <th>Order Date</th>
                        </tr>
                        <w:forEach var="order" items="${orders}">
                            <tr>
                                <td><w:out value="${order.title}" /></td>
                                <td><w:out value="${order.price}" /></td>
                                <td><w:out value="${order.orderID}" /></td>
                                <td><w:out value="${order.orderDate}" /></td>
                            </tr>
                        </w:forEach>
            </table>
            <div>
                <input type="submit" onClick=confirmOrder() value="View Your Order History"/>
            </div>
                </form>
        </div>
        <div id="menu3" class="tab-pane fade">
            Wish List goes here
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
                    <input type="submit" value="Add to Shopping Cart" />
                </td>
            </tr>
        </div>

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
<script src="<c:url value="js/jquery.js"/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="js/bootstrap.min.js"/>"></script>




</html>