
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    <%@include  file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-7 offset-md-3">
                    <%@include file="components/message.jsp" %>
                    <%@include file="components/common_modals.jsp" %>
                    <div class="card card-line">
                        
                        <div class="card-header text-white purple-bg">
                            <h3 class="text-center">Login</h3>
                        </div>
                        <div class="card-body">
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group row">
                                  <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                                  <div class="col-sm-10">
                                      <input type="text" name="email"  required class="form-control" id="inputPassword" placeholder="Enter Email">
                                  </div>
                                </div>
                                <div class="form-group row">
                                  <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                                  <div class="col-sm-10">
                                    <input type="password" name="password" required class="form-control" id="inputPassword" placeholder="Enter password">
                                  </div>
                                </div>
                                <p class="text-center">
                                    Don't have an account? <a href="register.jsp" class="text-decoration-none">Sign Up</a>
                                </p>
                                
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-purple">Submit</button>
                                    <button type="warning" class="btn btn-outline-warning">Reset</button>
                                </div>
                             </form>
                        </div>
                         
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
