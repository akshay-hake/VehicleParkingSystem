/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserParking;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akshay
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {

    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        request.getSession().removeAttribute("id");
//        request.getSession().removeAttribute("type");
//        request.getSession().removeAttribute("ad");
//        request.getSession().removeAttribute("at");
//        request.getSession().removeAttribute("dd");
//        request.getSession().removeAttribute("dt");
//        request.getSession().removeAttribute("enb");
//        request.getSession().removeAttribute("en");
//        request.getSession().removeAttribute("sn");
String [] vs=request.getSession().getValueNames();

 for(int i=0;i<vs.length;i++)
        {
            PrintWriter pr=response.getWriter();
                       
                       pr.print(vs[i]);
                        
            request.getSession().removeAttribute(vs[i]);
        }
        
       // request.getSession().invalidate();
        
        
       
        
        response.sendRedirect("DriverLogin.jsp");
    }

    
}
