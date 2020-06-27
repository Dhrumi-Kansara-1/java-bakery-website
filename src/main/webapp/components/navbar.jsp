<%@page import="com.mycompany.bakerysystem.entities.User" %> 
<%@page import="java.util.List"%>
<%@page import="com.mycompany.bakerysystem.entities.Product"%>
<%@page import="com.mycompany.bakerysystem.helper.FactoryProvider"%>
<%@page import="com.mycompany.bakerysystem.dao.productDao"%>
<%@page import="com.mycompany.bakerysystem.dao.categoryDao"%>
<%@page import="com.mycompany.bakerysystem.entities.Product"%>
<%@page import="com.mycompany.bakerysystem.entities.Category"%>
<%@page import="com.mycompany.bakerysystem.helper.helper"%>
<%@ taglib prefix="myprefix" uri="WEB-INF/logo.tld"%>
<%
    User user1=(User)session.getAttribute("currnet-user");
    Boolean isAdmin=false;
        if(user1==null) {
           isAdmin=false;
    }
    else {
        if(user1.getUserType().equals("normal")) {
         isAdmin=false; 
        }
        else if(user1.getUserType().equals("admin")) {
         isAdmin=true;    
        }
    }
        
     String cat2=null;
                if(request.getParameter("category")==null) {
                    cat2="all";
                }
                else {
                    cat2=request.getParameter("category");
                }
                
                
                int catId2=0;
                productDao pDao2=new productDao(FactoryProvider.getFactory()); 
                List<Product> plist2=null;
                
                if(cat2.trim().equals("all")) {
                    plist2=pDao2.getAllProduct();
                }
                else {
                    catId2=Integer.parseInt(cat2.trim());
                    plist2=pDao2.getAllProductById(catId2);
                }
                
                
                categoryDao cDao2=new categoryDao(FactoryProvider.getFactory());
                List<Category> cList2=cDao2.getCategory();
                
                helper help2 = new helper();
%>

<nav class="navbar navbar-expand-lg navbar-dark custon-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"> 
            <label>< </label>
            <img src="images/muffin.png" alt="bakery symbol" style="height:25px">
            <label style="height:25px"><myprefix:MyMsg/></label>
            <label> ></label>
        </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
  
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories    
        </a>
        <div class="dropdown-menu custon-bg" aria-labelledby="navbarDropdown">
            
           <%
                    for(Category category:cList2) {
                        %>
                        <a class="dropdown-item dropdown-style text-white" href="index.jsp?category=<%= category.getCategoryId() %>"><%=category.getCategoryTitle()%></a>
                        <%
                    }
            %> 
          
          
           
      </li>
      <%
          if(isAdmin) {
              %>
              <li class="nav-item active">
                <a class="nav-link" href="admin.jsp">Admin panel</a>
              </li>
              
              <%
          }
      %>
      
    </ul>
    
    <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#cart">
                <i class="fa fa-cart-plus" style="font-size: 16px"></i>
                <span style="font-size: 16px" class="cart-items">( 0 )</span>
            </a>
      </li> 
      <li class="nav-item active">
              <label class="nav-link">|</label>
      </li>
        <% 
            if(user1==null) {
        %>
       <li class="nav-item active">
        <a class="nav-link" href="login.jsp">Login</a>
      </li> 
      <li class="nav-item active">
              <label class="nav-link">|</label>
      </li> 
       <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register</a>
      </li>
      <% 
          }
          else {
        %>
           <li class="nav-item active">
            <a class="nav-link" href="#">
                <%= user1.getUserName()%>
                <i class="fas fa-user-circle"></i>
            </a>
          </li>  
          <li class="nav-item active">
              <label class="nav-link">|</label>
          </li>
           <li class="nav-item active">
            <a class="nav-link" href="LogoutServlet">
                Logout
            </a>
            
          </li>
        <%
          
          }
      %>
    </ul>
  </div>
    </div>
</nav>