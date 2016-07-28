<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <title>Checkout</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/Checkout.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">
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
            <a class="navbar-brand" href="#">Cover to Cover</a>
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
<form action="checkout" method="post">
    <div class="billing">
        <fieldset>
            <legend>Billing Information</legend>
            <ul class="bill">
                <li>
                    <label for="firstName1">First Name:</label>
                    <input type="text" id="firstName1" name="firstName1" autofocus>
                </li>

                <li>
                    <label for="surname1">Last Name:</label>
                    <input type="text" id="surname1" name="surname1">
                </li>


                <li>
                    <label for="StBillAddress">Street Address:</label>
                    <input type="text" id="StBillAddress" name="StBillAddress">
                </li>

                <li>
                    <label for="StBillAddress2"></label>
                    <input type="text" id="StBillAddress2" name="StBillAddress2">
                </li>

                <li>
                    <label for="CityBillAddress">City/Town:</label>
                    <input type="text" id="CityBillAddress" name="CityBillAddress">
                </li>

                <li>
                    <label for="StateBillAddress">State:</label>
                    <input type="text" id="StateBillAddress" name="StateBillAddress" placeholder="XX">
                </li>
                <li>
                    <label for="zipCode">Zip Code:</label>
                    <input type="text" id="zipCode" name="zipCode">
                </li>

                <li>
                    <label for="email1">Email:</label>
                    <input type="email1" id="email1" name="email1" placeholder="you@domain.com" required>
                </li>
                <li>
                    <label for="phone1">Phone Number:</label>
                    <input type="tel" id="phone1" name="phone1" placeholder="(555)555-5555" required>
                </li>
            </ul>
        </fieldset>
    </div>
    <div class="shipping">
        <fieldset>
            <legend>Shipping Information</legend>
            <ul class="ship">
                <li>

                        <input type="checkbox" onClick=flood() id="floodInfo">Shipping information is same as billing<br>

                </li>
                <li>
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" autofocus>
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
                    <input type="text" id="StateShipAddress" name="StateShipAddress" placeholder="XX">
                </li>
                <li>
                    <label for="ZipCodeShipAddress">Zip Code:</label>
                    <input type="text" id="ZipCodeShipAddress" name="ZipCodeShipAddress">
                </li>
                <li>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="you@domain.com" required>
                </li>
                <li>
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" placeholder="(555)555-5555" required>
                </li>
            </ul>
        </fieldset>
    </div>
    <div class="pay">
        <fieldset>
            <legend>Payment</legend>
            <ul class="payment">
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
                    <input type="text" id="expdate" name="expdate" placeholder="MM/YY">
                </li>
            </ul>
        </fieldset>
    </div>
    <div class="click">
        <fieldset>
            <legend>Place Order</legend>
            <input type="submit" value="Submit" class="btn btn-info"/>
        </fieldset>
    </div>
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
<!-- jQuery -->
<script src="<c:url value="js/jquery.js"/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="js/bootstrap.min.js"/>"></script>
<script src="<c:url value="js/infoFlood.js"/>"></script>
<script src="<c:url value="js/orderConfirm.js"/>"></script>
</body>
</html>