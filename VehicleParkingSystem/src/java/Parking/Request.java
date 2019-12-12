/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking;

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
@WebServlet("/request")
public class Request extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String type=request.getParameter("type");
        String vid=request.getParameter("vid");
        String ad=request.getParameter("ad");
        String email="";
        Statement stmt=null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem", "root", "root"); // gets a new connection
                stmt=c.createStatement();
                
                
        
        if(type.equals("Accept"))
        {
            String rr="select email from visitor where visitor_id="+vid;
            ResultSet rs=stmt.executeQuery(rr);
            if(rs.next())
            {
                email=rs.getString(1);
            }
            
            rr="select * from requests where arrival_date='"+ad+"' and visitor_id="+vid;
            rs=stmt.executeQuery(rr);
            if(rs.next())
            {
                rr="insert into guestList values("+request.getSession().getAttribute("oid")+",'"+email+"',1,'"+ad+"')";
                stmt.executeUpdate(rr);
            }
        }
       
            String del="delete from requests where arrival_date='"+ad+"' and visitor_id="+vid;
            stmt.executeUpdate(del);
            
            response.sendRedirect("requests.jsp");
        
        
        } catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
                        
                       PrintWriter pr=response.getWriter();
                       
                       pr.print(e);
                        
                        
			
		}
    }

    
}
