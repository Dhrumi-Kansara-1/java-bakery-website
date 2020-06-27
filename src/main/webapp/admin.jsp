<%@page import="com.mycompany.bakerysystem.helper.FactoryProvider"%>
<%@page import="com.mycompany.bakerysystem.entities.User" %> 
<%@page import="com.mycompany.bakerysystem.entities.Category" %> 
<%@page import="com.mycompany.bakerysystem.dao.categoryDao" %> 
<%@page import="org.hibernate.SessionFactory" %> 
<%@page import="java.util.*" %> 
<%
    User user=(User)session.getAttribute("currnet-user");
//    System.out.println("Inside admin login");
//    System.out.println(user);
    
    if(user==null) {
        session.setAttribute("message","You are not Logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else {
        if(user.getUserType().equals("normal")) {
            session.setAttribute("message","You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<!--
Icons made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> 
from
<a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> 
from 
<a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
Icons made by <a href="https://www.flaticon.com/free-icon/add_875515" title="Kiranshastry">Kiranshastry</a> 
from 
<a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
Icons made by <a href="https://www.flaticon.com/authors/itim2101" title="itim2101">itim2101</a> 
from 
<a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
Icons made by <a href="https://www.flaticon.com/authors/bqlqn" title="bqlqn">bqlqn</a> 
from 
<a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
Icons made by <a href="https://icon54.com/" title="Pixel perfect">Pixel perfect</a> 
from 
<a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
    <%@include  file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/common_modals.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
          
            </div>
            <!-- 1st row -->
            <div class="row mt-3">
                <!-- 1st column -->
                <div class="col-md-4">
                    <div class="card mt-2   text-center card-line">
                        <div class="card-body">
                            <div class="container">
                                <img class="img-fluid img-size rounded-circle" src="images/group.png" alt="user-icon">
                            </div>
                            <h1>8</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                    </div>
                
                <!-- 2nd column -->
                <div class="col-md-4">
                    <div class="card mt-2 text-center">
                        <div class="card-body">
                            <div class="container">
                                <img class="img-fluid img-size rounded-circle" src="images/checklist.png" alt="user-icon">
                            </div>
                            <h1>4</h1>
                            <h1 class="text-uppercase text-muted">Category</h1>
                        </div>
                    </div>
                </div>
                <!-- 3rd column -->
                <div class="col-md-4">
                    <div class="card mt-2 text-center">
                        <div class="card-body">
                            <div class="container">
                                <img class="img-fluid img-size rounded-circle" src="images/product.png" alt="user-icon">
                            </div>
                            <h1>27</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
                <!-- 2nd row -->
                <div class="row mt-3">
                <!-- 1st column -->
                <div class="col-md-6">
                    <!-- card trigger add-category modal -->
                    <div class="card mt-2 text-center" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container">
                                <img class="img-fluid img-size rounded-circle" src="images/category.png" alt="user-icon">
                            </div>
                            <p class="mt-2">click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                    </div>
                
                <!-- 2nd column -->
                <div class="col-md-6">
                <!-- card trigger add-product modal -->            
                <div class="card mt-2 text-center" data-toggle="modal" data-target="#add-product-modal">
                    <div class="card-body">
                        <div class="container">
                            <img class="img-fluid img-size rounded-circle" src="images/add.png" alt="user-icon">
                        </div>
                        <p class="mt-2">click here to add new product</p>
                        <h1 class="text-uppercase text-muted">Add product</h1>
                    </div>
                </div>
            </div>
            </div>
                
        <!-- category modal -->     
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg"  role="document">
            <div class="modal-content">
              <div class="modal-header purple-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
               <form action="ProductOperationServlet" method="post">
                   <input type="hidden" name="operation" value="addCategory">
              <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" name="categoryTitle"  required class="form-control" id="categoryTitle" placeholder="Enter category title">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="categoryDescription" required placeholder="Enter category description"></textarea>
                                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-purple">Add Category</button>
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                
              </div>
              </form>
            </div>
          </div>
        </div>
        <!-- product modal -->     
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg"  role="document">
            <div class="modal-content">
              <div class="modal-header purple-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
                <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                   <input type="hidden" name="operation" value="addProduct">
              <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" name="productName"  required class="form-control" id="productName" placeholder="Enter product mame">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="productDescription" required placeholder="Enter product description"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="number" name="productPrice"  required class="form-control" id="productPrice" placeholder="Enter product price">
                                </div>
                                <div class="form-group">
                                    <input type="number" name="productDiscount"  required class="form-control" id="productDiscount" placeholder="Enter product discount">
                                </div>
                                <div class="form-group">
                                    <input type="number" name="productQuantity"  required class="form-control" id="productQuantity" placeholder="Enter product quantity">
                                </div>
                  
                                <%
                                    categoryDao cDao=new categoryDao(FactoryProvider.getFactory());
                                    List<Category> list=cDao.getCategory();
                                    
                                    
                                %>
                  
                                <div class="form-group">
                                    <select name="categoryId" class="form-control">
                                    
                                        <%
                                            for(Category c:list) {
                                            
                                        %>
                                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                        
                                </div>
                                <div class="input-group mb-3">
                                    <div class="custom-file">
                                      <input type="file" name="productPhoto" required class="custom-file-input" id="inputGroupFile02">
                                      <label class="custom-file-label" for="inputGroupFile02">Choose product image</label>
                                    </div>   
                                 </div>
                  
              </div>            
              <div class="modal-footer">
                <button type="submit" class="btn btn-purple">Add product</button>
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                
              </div>
              </form>
            </div>
          </div>
        </div>
        </div>
    </body>
</html>
