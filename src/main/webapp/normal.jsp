<%@page import="com.mycompany.bakerysystem.entities.User" %> 

<%
    User user2=(User)session.getAttribute("currnet-user");
    System.out.println("Inside admin login");
    System.out.println(user2);
    
    if(user2==null) {
        session.setAttribute("message","You are not Logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else {
        if(user2.getUserType().equals("admin")) {
            session.setAttribute("message","You are not a normal user ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <%@include  file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
         <%
             session.setAttribute("message","You are Logged in :)");
             response.sendRedirect("index.jsp");
         %>
        
    </body>
</html>
