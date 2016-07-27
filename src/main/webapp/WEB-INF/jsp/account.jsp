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
<!-----------------------PUT ON EVERY PAGE END---------------------------------------------------------------->


<div class="container tabs-menu">
    <h2>Account</h2>
    <ul class="nav nav-pills pills-menu">
        <li class="active"><a data-toggle="tab" href="#menu1">Edit Account Info</a></li>
        <li><a data-toggle="tab" href="#menu2">Order History</a></li>
        <li><a data-toggle="tab" href="#menu3">Wish List</a></li>
        <li><a data-toggle="tab" href="#menu4">Edit Library</a></li>
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
        <div id="menu4" class="tab-pane fade">
             <ul class="info" style="list-style-type:none">
                 <li>
                <div class="addBook">
                            <form>
    
                                <fieldset>
                                    <legend>Add Book</legend>
                                    <ul class="ship">
                                        <li>
                                            <label for="bookId">Book ID:</label>
                                            <input type="text" id="bookId" name="bookId">
                                        </li>
                                        <li>
                                            <label for="bookTitle">Title:</label>
                                            <input type="text" id="bookTitle1" name="bookTitle">
                                        </li>
                                        <li>
                                            <p class="formDesc">
                                                <label for="message1">
                                                    Description: </label>
                                                <textarea rows="5" cols="20" name="message" id="message1"></textarea>
                                            </p>
                                        </li>
                                        <li>
                                            <label for="isbn">ISBN:</label>
                                            <input type="text" id="isbn" name="isbn">
                                        </li>
                                        <li>
                                            <label for="publisher">Publisher:</label>
                                            <input type="text" id="publisher" name="publisher">
                                        </li>






                                        <li>
                                            <label for="format">Format:</label>
                                            <select name="format" id="format">
                                                <option value="QAJAVSC">EBook</option>
                                                <option value="QAWEBUI">Print Book</option>
                                            </select>
                                        </li>

                                        <li>
                                            <label for="publishDate">Date Published:</label>
                                            <input type="text" id="publishDate" name="publishDate" placeholder="MM/DD/YYYY">
                                        </li>

                                        <li>
                                            <label for="edition">Edition:</label>
                                            <input type="text" id="edition" name="edition">
                                        </li>
                                        <li>
                                            <label for="pages">Number of pages:</label>
                                            <input type="text" id="pages" name="pages">
                                        </li>

                                        <li>
                                            <label for="author1">Author:</label>
                                            <input type="text" id="author1" name="author">
                                        </li>
                                        <li>
                                            <label for="genre">Genre:</label>
                                            <input type="text" id="genre" name="genre">
                                        </li>

                                        <li>
                                            <label for="price1">Price:</label>
                                            <input type="text" placeholder="0.00" id="price1" name="price">
                                        </li>

                                        <li>
                                            <label for="imageUrl1">Image URL:</label>
                                            <input type="text" placeholder=".jpg or .png" id="imageUrl1" name="imageUrl">
                                        </li>
                                        <li class="buttonShip">
                                            <input class="btn btn-success login-button" type="submit" value="Submit"/>
                                        </li>
                                    </ul>
                                </fieldset>
                            </form>
                        </div>   
                 </li>
                 <li>
            <div class="deleteBook">
                            <form>
                                <fieldset>
                                    <legend>Delete Book</legend>
                                    <ul class="ship">
                                        <li>
                                            <select name="delete" id="delete">
                                            <option value="QAJAVSC">Catching Fire</option>
                                            <option value="QAWEBUI">Divergent</option>
                                            <option value="QAWEBCSS">The Rainbow Fish</option>
                                            <option value="QAJQUERY">The Lord of the Rings</option>
                                            <option value="QAJAVSC">Water for Elephants</option>
                                            <option value="QAWEBUI">Harry Potter and the Sorceror's Stone</option>
                                            <option value="QAWEBCSS">Harry Potter and the Prisoner of Azkaban</option>
                                            <option value="QAJQUERY">Harry Potter and the Half Blood Prince</option>
                                        </select>
                                        </li>
                                        <li class="buttonShip">
                                            <input class="btn btn-success login-button" type="submit" value="Delete"/>
                                        </li>
                                    </ul>
                                </fieldset>
                            </form>
                        </div>  
                 </li>
                 <li>
                 <div class="editBook">
                            <form>
                                <fieldset>
                                    <legend>Edit Book Info</legend>
                                    <ul class="ship">
                                        <li>
                                            <label for="delete">Book:</label>
                                            <select name="delete" id="delete1">
                                            <option value="QAJAVSC">Catching Fire</option>
                                            <option value="QAWEBUI">Divergent</option>
                                            <option value="QAWEBCSS">The Rainbow Fish</option>
                                            <option value="QAJQUERY">The Lord of the Rings</option>
                                            <option value="QAJAVSC">Water for Elephants</option>
                                            <option value="QAWEBUI">Harry Potter and the Sorceror's Stone</option>
                                            <option value="QAWEBCSS">Harry Potter and the Prisoner of Azkaban</option>
                                            <option value="QAJQUERY">Harry Potter and the Half Blood Prince</option>
                                        </select>
                                        </li>
                                        <li>
                                            <label for="bookId1">Book ID:</label>
                                            <input type="text" id="bookId1" name="bookId1">
                                        </li>
                                        <li>
                                            <label for="bookTitle">Title:</label>
                                            <input type="text" id="bookTitle" name="bookTitle">
                                        </li>
                                        <li>
                                            <p class="formDesc">
                                                <label for="message2">
                                                    Description: </label>
                                                <textarea rows="5" cols="20" name="message2" id="message2"></textarea>
                                            </p>
                                        </li>
                                        <li>
                                            <label for="isbn2">ISBN:</label>
                                            <input type="text" id="isbn2" name="isbn2">
                                        </li>
                                        <li>
                                            <label for="publisher2">Publisher:</label>
                                            <input type="text" id="publisher2" name="publisher2">
                                        </li>


                                        <li>
                                            <label for="format2">Format:</label>
                                            <select name="format2" id="format2">
                                                <option value="QAJAVSC">EBook</option>
                                                <option value="QAWEBUI">Print Book</option>
                                            </select>
                                        </li>

                                        <li>
                                            <label for="publishDate2">Date Published:</label>
                                            <input type="text" id="publishDate2" name="publishDate2" placeholder="MM/DD/YYYY">
                                        </li>

                                        <li>
                                            <label for="edition2">Edition:</label>
                                            <input type="text" id="edition2" name="edition2">
                                        </li>
                                        <li>
                                            <label for="pages2">Number of pages:</label>
                                            <input type="text" id="pages2" name="pages2">
                                        </li>

                                        <li>
                                            <label for="author2">Author:</label>
                                            <input type="text" id="author2" name="author2">
                                        </li>
                                        <li>
                                            <label for="genre2">Genre:</label>
                                            <input type="text" id="genre2" name="genre2">
                                        </li>

                                        <li>
                                            <label for="price2">Price:</label>
                                            <input type="text" placeholder="0.00" id="price2" name="price2">
                                        </li>

                                        <li>
                                            <label for="imageUrl2">Image URL:</label>
                                            <input type="text" placeholder=".jpg or .png" id="imageUrl2" name="imageUrl2">
                                        </li>
                                        <li class="buttonShip">
                                            <input class="btn btn-success login-button" type="submit" value="Submit"/>
                                        </li>
                                    </ul>
                                </fieldset>
                            </form>
                        </div>
                 </li>
            </ul>
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