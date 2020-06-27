<%-- 
    Document   : checkout
    Created on : 29-May-2020, 2:39:42 pm
    Author     : Dhrumi Kansara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int cartLength=0;
    if(request.getParameter("cartLength")==null) {
        cartLength=0;
    }
    else {
        cartLength=Integer.parseInt(request.getParameter("cartLength"));
    }
    User user3=(User)session.getAttribute("currnet-user");
    
    
    
    if(user3==null) {
        session.setAttribute("message","please login to checkout");
        response.sendRedirect("login.jsp");
        return;
    } 
    else if(cartLength<=0) {
        session.setAttribute("message","please add item in cart to checkout");
        response.sendRedirect("index.jsp");
        return;
    
    }
 
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    <%@include  file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/common_modals.jsp" %>
    
        <div class="container-fluid">
            <div class="row mt-2">
                <div class="col-md-5">
                    
                    
                    <div class="card">
                        <div class="card-header purple-bg text-uppercase text-white">
                            <h4>Cart Details</h4>
                        </div>
                        <div class="card-body">
                            <div class="cart-body"></div>
                        </div>
                    </div>
                    
                </div>
                <div class="col-md-7">
                    <div class="card">
                        <form>
                            <div class="card-header purple-bg text-uppercase text-white">
                                <h4>Order Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">Name</label>
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
                            <label for="address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="user_address" required placeholder="Enter your address"></textarea>
                            </div>
                        </div> 
                        </div>
                            <div class="card-footer bg-light">
                                <div class="container text-center">
                            <button class="btn btn-purple">Checkout</button>
                            <a class="btn custon-bg text-white">buy more bakery products</a>
                        </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
