 
package com.mycompany.bakerysystem.helper;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;
public class tag extends SimpleTagSupport {
   public void doTag() throws JspException, IOException {
      /*This is just to display a message, when
       * we will use our custom tag. This message
       * would be displayed
       */
      JspWriter out = getJspContext().getOut();
      out.println("Bakery");
      
      
 
   }
}