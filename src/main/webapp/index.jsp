<%@page import="java.util.List"%>
<%@page import="com.mycompany.bakerysystem.entities.Product"%>
<%@page import="com.mycompany.bakerysystem.helper.FactoryProvider"%>
<%@page import="com.mycompany.bakerysystem.dao.productDao"%>
<%@page import="com.mycompany.bakerysystem.dao.categoryDao"%>
<%@page import="com.mycompany.bakerysystem.entities.Product"%>
<%@page import="com.mycompany.bakerysystem.entities.Category"%>
<%@page import="com.mycompany.bakerysystem.helper.helper"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bakery - Home</title>
        <%@include  file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/common_modals.jsp" %>
        <div class="container-fluid">
            <%@include file="components/message.jsp" %>
        <div class="row mt-3 mx-2">
            
            <%

                String cat=null;
                if(request.getParameter("category")==null) {
                    cat="all";
                }
                else {
                    cat=request.getParameter("category");
                }
                
                
                int catId=0;
                productDao pDao=new productDao(FactoryProvider.getFactory()); 
                List<Product> plist=null;
                
                if(cat.trim().equals("all")) {
                    plist=pDao.getAllProduct();
                }
                else {
                    catId=Integer.parseInt(cat.trim());
                    plist=pDao.getAllProductById(catId);
                }
                
                
                categoryDao cDao=new categoryDao(FactoryProvider.getFactory());
                List<Category> cList=cDao.getCategory();
                
                helper help = new helper();
            %>
            
            <!-- show categories -->
            <div class="row-md-2 m-auto">
               
                    <div class="list-group list-group-horizontal mb-2 position-sticky div-stick">
                        <a class="list-group-item purple-bg text-decoration-none text-white" href="index.jsp?category=all">Categories</a>
                    
               
                <%
                    for(Category category:cList) {
                        %>
                        <a class="list-group-item list-group-item-action btn-purple" id="<%= category.getCategoryId() %>" href="index.jsp?category=<%= category.getCategoryId() %>"><%=category.getCategoryTitle()%></a>
                        <%
                    }
                %>
                    </div>
            </div>
            </div>
            <!-- show products -->
            <div class="row mt-3">
                
                    
                        <div class=" index" style="display: flex;flex-wrap: wrap;">
                               <%
                                   for(Product product:plist) {
                                   %>
                                   <div class="card card-line m-2" style="width: 20rem;">
                                       <img class="card-img-top" style="height:260px; width:auto; m-auto" src="images/product/<%= product.getpPhoto() %>" alt="Card image cap">
                                       <div class="card-body">
                                           
                                           <h5 class="card-title text-center"><%=product.getpName()%></h5>
<!--                                           <p class="card-text"><%= help.get10Words(product.getpDescription())%></p>-->
                                           
                                           
                                       </div>
                                       <div class="card-footer ">
                                           
                                           <label class="card-text" style="color: #721b65">&#x20B9 <%= product.getPriceAfterDiscount() %>/-  
                                                <spam class="text-success discount-label">
                                                    <spam class="text-secondary" style="text-decoration: line-through;">&#x20B9 <%= product.getpPrice() %>/-</spam>
                                                     <%= product.getpDiscount() %>% off
                                                </spam>
                                           </label>
                                           <button class="btn btn-purple ml-4" onclick="add_to_cart(<%= product.getpId() %>,'<%= product.getpName() %>',<%= product.getPriceAfterDiscount() %>)">Add to cart</button>
                                       </div>
                                   </div>
                                   <%
                                   }

                               %>   
                        </div>
                        
                    
                        <%
                             if(plist.size()==0){
                                 
                             %>
                                        <div class="alert text-center m-auto" style="background-color: #ffd4e0;" role="alert">
                                            
                                            <h5>no product availabe in this category</h5>
                                        </div>
                                        <%                                   
                                            }
                        %>
                
            </div>

 
        
        
        </div>
                        
        
        <% 
        //System.out.println(FactoryProvider.getFactory());
        %>
        
        
    </body>
</html>
