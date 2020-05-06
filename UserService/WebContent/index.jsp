<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.User"%>
<!DOCTYPE html>
<html lang="zxx">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js" ></script>
<head>
    <!-- End Google Tag Manager -->
    <title>Health care system</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">

    <!-- External CSS libraries -->
    <link rel="stylesheet" type="text/css" href="Views/boostrap/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="Views/style.css">
   <link rel="stylesheet" type="text/css" id="style_sheet" href="Views/default.css">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,300,700">


</head>
<body style="background-image: url('img/contact.jpg');">
<div class="page_loader"></div>

<!-- Contact section start -->
<div class="contact-section">
    <div class="container">
        <div class="row login-box">
            <div class="col-lg-6 align-self-center pad-0">
                <div class="form-section clearfix">
                    <h3>Create an account</h3>
                    <div class="btn-section clearfix">
                        <a href="login.jsp" class="link-btn active btn-1 default-bg">Login</a>
                        <a href="index.jsp" class="link-btn btn-2 active-bg">Register</a>
                    </div>
                    <div class="clearfix"></div>
                    <form name="formuser" id="formuser" method="post" action="">
         
                        <div class="form-group form-box">
                            <input id="userName" type="text" name="userName" class="input-text" placeholder="Full Name">
                        </div>
                        <div class="form-group form-box">
                            <input id="userAge" type="text" name="userAge" class="input-text" placeholder="Age">
                        </div>
                        <div class="form-group form-box clearfix">
                            <input id="userGender" type="text" name="userGender" class="input-text" placeholder="Gender">
                        </div>
						<div class="form-group form-box clearfix">
                            <input id="userPhone" type="text" name="userPhone" class="input-text" placeholder="Phone Number">
                        </div>
						<div class="form-group form-box clearfix">
                            <input id="userEmail" type="email" name="userEmail" class="input-text" placeholder="Email">
                        </div>
						<div class="form-group form-box clearfix">
                            <input id="password" type="text" name="password" class="input-text" placeholder="Password">
                        </div>
                    
                        <div class="form-group clearfix mb-0">
  							 <input type="hidden" id="hidUserIDSave" name="hidUserIDSave" value="" >
                            <button type="button" class="btn-md btn-theme float-left" id="btnSave" name="btnSave" >Register</button>                    
                           
                        </div>
                    </form>    
                    <br>
             <div id="alertSuccess" class="alert alert-success"></div>
                    
			<div id="alertError" class="alert alert-danger"></div>
			
		 </div>
            </div>
             <div class="col-lg-6 bg-color-15 align-self-center pad-0 none-992 bg-img">
                <div class="info clearfix">
                    <h3>Welcome to Health Care System</h3>
                </div>
            </div>
                <div id="divItemsGrid">
				<%
					User userObj = new User();
					out.print(userObj.readUser());
				%>
			</div>
        </div>
    </div>
</div>
<!-- Contact section end -->


<script src="Components/js/jquery-2.2.0.min.js"></script>
<script src="Components/js/bootstrap.min.js"></script>

<script  src="Components/app.js"></script>
</body>

</html>