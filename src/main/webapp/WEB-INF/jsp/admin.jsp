<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <ul class="edit" style="align-content: center">
                <li>
                    <div class="addBook">
                        <form action="insert" method="get">

                            <fieldset>
                                <legend>Add Book</legend>
                                <ul class="ship">
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
                                        <input type="text" id="publishDate" name="publishDate" placeholder="mm/dd/yyy">
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
                        <ul class="ship">
                            <li>
                                <select name="selection" id="delete">
                                    <d:forEach items= "${list}" var="book" >
                                        <option ><d:out value="${book.title}"/></option>
                                    </d:forEach>
                                </select>

                                <p></p>
                            </li>
                        </ul>

                        <li class="ship">
                            <button class="btn btn-success login-button" type="submit" value="Login">Delete</button>
                        <!--</ul>-->
                    </fieldset>
                </form>
            </div>
        </div>
        <div id="menu3" class="tab-pane fade">
            <div class="editBook">
                <form action="update" method="get">
                    <fieldset>
                        <legend>Edit Book Info</legend>

                            <select name="edit_selection" id="edit">
                                <d:forEach items= "${list}" var="book" >
                                    <option ><d:out value="${book.title}"/></option>
                                </d:forEach>
                            </select>
                            <p></p>
                            <p></p>
                            <ul class="ship" >
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
                                <input type="text" id="publishDate2" name="publishDate" placeholder="mm/dd/yyy">
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