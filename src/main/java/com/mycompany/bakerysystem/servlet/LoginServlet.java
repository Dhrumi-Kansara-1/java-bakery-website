
package com.mycompany.bakerysystem.servlet;

import com.mycompany.bakerysystem.dao.UserDao;
import com.mycompany.bakerysystem.entities.User;
import com.mycompany.bakerysystem.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import jdk.nashorn.internal.runtime.regexp.JoniRegExp;
 
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //authenticate user
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPsssword(email, password);
            System.out.println(user);
            HttpSession httpSession = request.getSession();
            if(user==null) {
                
                httpSession.setAttribute("message", "Invalid details!! try again");
                
                response.sendRedirect("login.jsp");
            }
            else {
                
                
                //login 
                httpSession.setAttribute("currnet-user", user);
                
                if(user.getUserType().equals("admin")) {
                    response.sendRedirect("admin.jsp");
                    System.out.println("admin login");
                }
                else if(user.getUserType().equals("normal")) {
                    response.sendRedirect("normal.jsp");
                    System.out.println("normal login");
                }
                else {
                    out.println("we have not identified user type");
                }
            }
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
