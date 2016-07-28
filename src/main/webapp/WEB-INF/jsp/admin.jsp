<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="app">

<head>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="css/shop-homepage.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="css/account.css"/>" rel="stylesheet">


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


<div class="container tabs-menu">
    <h2>Administrative Options</h2>
    <ul class="nav nav-pills pills-menu">
        <li class="active"><a data-toggle="tab" href="#menu1">Add</a></li>
        <li><a data-toggle="tab" href="#menu2">Delete</a></li>
        <li><a data-toggle="tab" href="#menu3">Edit</a></li>
    </ul>

    <div class="tab-content">
        <div id="menu1" class="tab-pane fade in active ">
 <!---this--->
            <ul class="info" style="align-content: center">
                <li>
                    <div class="addBook">
                        <form action="insert" method="get">

                            <fieldset>
                                <legend>Add Book</legend>
                                <ul class="edit">
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
                                        <input type="text" id="publishDate" name="publishDate">
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
                                        <button class="btn btn-success login-button" type="submit" value="Login">Submit</button>
                                    </li>
                                </ul>
                            </fieldset>
                        </form>
                    </div>
                </li>
            </ul>
     </div>




<!--this-->


        <div id="menu2" class="tab-pane fade">
            <div class="deleteBook">
                <form action="delete" method="get">
                    <fieldset>
                        <legend>Delete Book</legend>
                        <ul class="edit">
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
                                <button class="btn btn-success login-button" type="submit" value="Login">Delete</button>
                            </li>
                        </ul>
                    </fieldset>
                </form>
            </div>
        </div>
        <div id="menu3" class="tab-pane fade">
            <div class="editBook">
                <form action="insert" method="get">
                    <fieldset>
                        <legend>Edit Book Info</legend>
                        <ul class="edit" >

                                <label for="bookTitle">Title:</label>
                                <input type="text" id="bookTitle" name="bookTitle">
                            </li>
                            <li>
                                <p class="formDesc">
                                    <label for="message2">
                                        Description: </label>
                                    <textarea rows="5" cols="20" name="message" id="message2"></textarea>
                                </p>
                            </li>
                            <li>
                                <label for="isbn2">ISBN:</label>
                                <input type="text" id="isbn2" name="isbn">
                            </li>
                            <li>
                                <label for="publisher2">Publisher:</label>
                                <input type="text" id="publisher2" name="publisher">
                            </li>


                            <li>
                                <label for="format2">Format:</label>
                                <select name="format" id="format2">
                                    <option value="QAJAVSC">EBook</option>
                                    <option value="QAWEBUI">Print Book</option>
                                </select>
                            </li>

                            <li>
                                <label for="publishDate2">Date Published:</label>
                                <input type="text" id="publishDate2" name="publishDate">
                            </li>

                            <li>
                                <label for="edition2">Edition:</label>
                                <input type="text" id="edition2" name="edition">
                            </li>
                            <li>
                                <label for="pages2">Number of pages:</label>
                                <input type="text" id="pages2" name="pages">
                            </li>

                            <li>
                                <label for="author2">Author:</label>
                                <input type="text" id="author2" name="author">
                            </li>
                            <li>
                                <label for="genre2">Genre:</label>
                                <input type="text" id="genre2" name="genre">
                            </li>

                            <li>
                                <label for="price2">Price:</label>
                                <input type="text" placeholder="0.00" id="price2" name="price">
                            </li>

                            <li>
                                <label for="imageUrl2">Image URL:</label>
                                <input type="text" placeholder=".jpg or .png" id="imageUrl2" name="imageUrl">
                            </li>
                            <li class="buttonShip">
                                <button class="btn btn-success login-button" type="submit" value="Login">Submit</button>
                            </li>
                        </ul>
                    </fieldset>
                </form>
            </div>
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