
package com.mycompany.bakerysystem.servlet;

import com.mycompany.bakerysystem.entities.Category;
import com.mycompany.bakerysystem.dao.categoryDao;
import com.mycompany.bakerysystem.dao.productDao;
import com.mycompany.bakerysystem.entities.Product;        
import com.mycompany.bakerysystem.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             
                String operation = request.getParameter("operation");

            
                if(operation.trim().equals("addCategory")) {
                   //add category
                  String title = request.getParameter("categoryTitle");
                  String description = request.getParameter("categoryDescription");
                  Category category = new Category();
                  category.setCategoryTitle(title);
                  category.setCategoryDescription(description);
                  
                    //save into database
                    categoryDao categoryDao = new categoryDao(FactoryProvider.getFactory());
                    int categoryId = categoryDao.saveCategory(category);
//                    out.println("category saved");
                    HttpSession session=request.getSession();
                    session.setAttribute("message", "category added successfully: "+categoryId);
                    response.sendRedirect("admin.jsp");
                    return;
                }
                else if(operation.trim().equals("addProduct")) {
                   //add product
                   String productName = request.getParameter("productName");
                   String productDescription = request.getParameter("productDescription");
                   int productPrice = Integer.parseInt(request.getParameter("productPrice"));
                   int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
                   int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
                   int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                   Part part=request.getPart("productPhoto");
                   
                   Product product=new Product();
                   product.setpName(productName);
                   product.setpDescription(productDescription);
                   product.setpPrice(productPrice);
                   product.setpDiscount(productDiscount);
                   product.setpQuantity(productQuantity);
                   product.setpPhoto(part.getSubmittedFileName());
                   
                   //get category by id
                   categoryDao cDao=new categoryDao(FactoryProvider.getFactory());
                   Category category=cDao.getCategoryById(categoryId);
                   
                   product.setCategory(category);
                   
                    productDao pDao=new productDao(FactoryProvider.getFactory());
                    pDao.saveProduct(product);
                    
                    //find path
                    
                    String path=request.getRealPath("images")+File.separator+"product"+File.separator+part.getSubmittedFileName();
                    System.out.println(path);
                    
                    
                     
                    //uploding photo in folder
                    FileOutputStream fos=new FileOutputStream(path);
                    InputStream is=part.getInputStream();
                    
                    //reading data
                    
                    byte []data=new byte[is.available()];
                    
                    is.read(data); 
                    
                    //writing data
                    
                    fos.write(data);
                    fos.close();
                    
                    HttpSession session=request.getSession();
                    session.setAttribute("message", "product added successfully");
                    response.sendRedirect("admin.jsp");
                    return;
                   
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

    private String getAbsolutePath(String images) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
