<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include  file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
            <div class="col-md-7 offset-md-3">
                
                <div class="card card-line">
                    <%@include file="components/message.jsp" %>
                    <%@include file="components/common_modals.jsp" %>
                    <div class="card-header text-white purple-bg">
                            <h3 class="text-center">Sign Up</h3>
                    </div>
                    <div class="card-body">
                           
                        <form action="RegistrationServlet" method="post">
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" name="user_name" required class="form-control" id="name" placeholder="Enter username" aria-describedby="emailHelp">
                                </div>
                            </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" " name="user_email" required class="form-control" id="email" placeholder="Enter email" aria-describedby="emailHelp">
                                </div>
                        </div>
                        <div class="form-group row">
                            <label for="password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" name="user_password" required class="form-control" id="password" placeholder="Enter password" aria-describedby="emailHelp">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-10">
                                <input type="number" name="user_phone" required class="form-control" id="phone" placeholder="Enter phone" aria-describedby="emailHelp">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="user_address" required placeholder="Enter your address"></textarea>
                            </div>
                        </div>
                        <p class="text-center">
                                    have an account? <a href="login.jsp" class="text-decoration-none">Login</a>
                                </p>
                        <div class="container text-center">
                            <button class="btn btn-purple">Register</button>
                            <button class="btn btn-outline-warning">Reset</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        </div>
    </body>
</html>
    