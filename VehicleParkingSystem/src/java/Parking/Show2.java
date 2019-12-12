/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking;

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
@WebServlet("/show2")
public class Show2 extends HttpServlet {

 
  
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
      
        String ad,at,dd,dt,sn;
        
        
        sn=request.getParameter("sn");
        
        if(sn.equals("0"))
        {
        ad=request.getParameter("ad");
        at=request.getParameter("at");
        dd=request.getParameter("dd");
        dt=request.getParameter("dt");
        
        request.getSession().setAttribute("ad", ad);
        request.getSession().setAttribute("at", at);
        request.getSession().setAttribute("dd", dd);
        request.getSession().setAttribute("dt", dt);
        
        response.sendRedirect("show2.jsp");
        
        }
        else
        {
            ad=request.getParameter("ad");
        at=request.getParameter("at");
        dd=request.getParameter("dd");
        dt=request.getParameter("dt");
        
        request.getSession().setAttribute("ad", ad);
        request.getSession().setAttribute("at", at);
        request.getSession().setAttribute("dd", dd);
        request.getSession().setAttribute("dt", dt);
            request.getSession().setAttribute("sn", sn);
            response.sendRedirect("booking_detail.jsp");
        }
        
        
        
        
        
    }

  

}
