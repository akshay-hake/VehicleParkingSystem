package UserParking;


import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author akshay
 */
@WebServlet("/col")
public class Color extends HttpServlet {
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String s=request.getParameter("par");
        int sno=Integer.parseInt(request.getParameter("sno"));
        
        try{  
                     String ad,at,dd,dt;
                     request.getSession().setAttribute("car_no", request.getParameter("car_no"));
        
        dd=request.getParameter("departure_date");
        ad=request.getParameter("arrival_date");
        at=request.getParameter("arrival_time");
       
        dt=request.getParameter("departure_time");
        
        request.getSession().setAttribute("ad", ad);
        request.getSession().setAttribute("at", at);
        
        request.getSession().setAttribute("dt", dt);
        
        request.getSession().setAttribute("dd", dd);
        
        request.getSession().setAttribute("sno", sno);
        
        
	response.sendRedirect("confirmBooking.jsp");
	return;
                    
                         
                         
                    }catch(Exception e){ out.println(e);}  
    }
        
    
}
