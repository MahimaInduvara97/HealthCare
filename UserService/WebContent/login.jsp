<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from storage.googleapis.com/themevessel-products/neer/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 16 Mar 2020 09:04:07 GMT -->
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/login.js" ></script>
    <title>Neer - Real Estate HTML Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">

    <!-- External CSS libraries -->
    <link rel="stylesheet" type="text/css" href="Views/boostrap/bootstrap.min.css">


    <!-- Custom stylesheet -->
    <link rel="stylesheet" type="text/css" href="Views/style.css">
    <link rel="stylesheet" type="text/css" id="style_sheet" href="Views/default.css">

    <!-- Favicon icon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" >

    <!-- Google fonts -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,300,700">



</head>
<body>
<div class="page_loader"></div>

<!-- Contact section start -->
<div class="contact-section" style="background-image: url('img/contact.jpg');">
    <div class="container">
        <div class="row login-box">
            <div class="col-lg-6 align-self-center pad-0">
                <div class="form-section align-self-center">
                    <h3>Sign into your account</h3>
                    <div class="btn-section clearfix">
                        <a href="login.html" class="link-btn active btn-1 active-bg">Login</a>
                        <a href="signup.html" class="link-btn btn-2 default-bg">Register</a>
                    </div>
                    <div class="clearfix"></div>
                    <form id="logform" name="logform" action="login.jsp" method="POST">
                        <div class="form-group form-box">
                            <input id="userEmail" type="email" name="userEmail" class="input-text" placeholder="Email Address">
                        </div>
                        <div class="form-group form-box clearfix">
                            <input id="password" type="text" name="password" class="input-text" placeholder="Password">
                        </div>
                        <div class="form-group clearfix mb-0">
                           <input type="hidden" id="hidItemIDSave" name="hidUserIDSave" value="">
                            <button id="btnSave" type="submit" class="btn-md btn-theme float-left">Login</button>
                            <a href="forgot-password.html" class="forgot-password">Forgot Password</a>
                        </div>
                    </form>
                </div>
                <br>
                <div id="alertSuccess" class="alert alert-success"></div>
                    
			<div id="alertError" class="alert alert-danger"></div>
            </div>
            <div class="col-lg-6 bg-color-15 align-self-center pad-0 none-992 bg-img">
                <div class="info clearfix">
                    <div class="logo-2">
                        <a href="index.html">
                            <img src="img/art.png" alt="logo">
                        </a>
                    </div>
                    <h3>Health Care Sysytem</h3>
              
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact section end -->

<!-- Full Page Search -->

<script src="Components/js/jquery-2.2.0.min.js"></script>
<script src="Components/js/bootstrap.min.js"></script>

<script  src="Components/js/app.js"></script>


</body>
</html>