/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserParking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akshay
 */
@WebServlet("/slotbook")
public class SlotBook extends HttpServlet{
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         
        String ad,at,dd,dt;
        
        
        ad=request.getParameter("arrival_date");
        at=request.getParameter("arrival_time");
        dd=request.getParameter("departure_date");      
        dt=request.getParameter("departure_time");
        
        request.getSession().setAttribute("ad", ad);
        request.getSession().setAttribute("at", at);
        request.getSession().setAttribute("dd", dd);
        request.getSession().setAttribute("dt", dt);
        
        String type=request.getSession().getAttribute("type").toString();
        String vid=request.getSession().getAttribute("id").toString();
        Statement stmt=null;
        
             try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem", "root", "root"); // gets a new connection
                stmt=c.createStatement();
                
                
        
        if(type.equals("visitor"))
        {
            String rr="call check_guestValidity((select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"'),"+vid+",(select email from visitor where visitor_id="+vid+"),'"+ad+"','"+dd+"')";
            ResultSet rs=stmt.executeQuery(rr);
            if(rs.next())
            {
                int st=rs.getInt("result");
                
                if(st==0)
                    response.sendRedirect("color.jsp");
                else if(st==1)
                {
                    request.getSession().setAttribute("requestNos", 1);
                    request.getSession().setAttribute("arrival", rs.getString("arrival"));
                    request.getSession().setAttribute("dayLimit", rs.getString("dayLimit"));
                    response.sendRedirect("sendRequest.jsp");
                }
                else
                {
                    request.getSession().setAttribute("requestNos", 2);
                    request.getSession().setAttribute("arrival", rs.getString("arrival"));
                    request.getSession().setAttribute("dayLimit", rs.getString("dayLimit"));
                    
                    request.getSession().setAttribute("arrival2", rs.getString("arrival2"));
                    request.getSession().setAttribute("dayLimit2", rs.getString("dayLimit2"));
                    response.sendRedirect("sendRequest.jsp");
                }
            }
           
           
        }
        else
             response.sendRedirect("color.jsp");
       
       
        
        
        
	
        
           
        
        
        } catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
                        
                       PrintWriter pr=response.getWriter();
                       
                       pr.print(e);
                        
                        
			
    }
             
    

    }
    
}
