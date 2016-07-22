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
                     <a class="navbar-brand " href="front">Cover to Cover</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li >
                            <a href="account">Account</a>
                        </li>
                        <li >
                             <a href="cart">Book Bag</a>
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
        <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
        <li><a data-toggle="tab" href="#menu1">Login Info</a></li>
        <li><a data-toggle="tab" href="#menu2">Payment Info</a></li>
        <li><a data-toggle="tab" href="#menu3">Shipping Info</a></li>
      </ul>

      <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <div id="menu1" class="tab-pane fade">
            <form>
                <p><input type="email" placeholder="Username or Email" required/></p>
                <p><input type="password" placeholder="Password" required/></p>
                <button class="btn btn-success login-button" type="submit" value="Login">Submit</button>
            </form>
        </div>
        <div id="menu2" class="tab-pane fade">
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
                    <input type="text" id="number" name="number" >
                </li>
                <li>
                    <label for="expdate">Expiration Date:</label>
                    <input type="text" id="expdate" name="expdate">
                </li>
                <li>
                    <button class="btn btn-success login-button" type="submit" value="Login">Submit</button>
                </li>
			</ul>
        </div>
        <div id="menu3" class="tab-pane fade">
          <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
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