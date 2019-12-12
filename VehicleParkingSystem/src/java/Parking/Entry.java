/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking;

/**
 *
 * @author akshay
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Entry
 */

@WebServlet("/entrycontrol")
public class Entry extends HttpServlet {
    
   
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// Connect to mysql and verify username password
                
                 String url="jdbc:mysql://localhost:3306/VehicleParkingSystem";
                 String username="root";
                 String password="root";
                 
                 String name,mob,purpose,type,email,pwd,license;
                 name=request.getParameter("fname")+" "+request.getParameter("lname");
                 mob=request.getParameter("Mobile");
                 purpose=request.getParameter("type");
                 type=request.getParameter("Company");
                 email=request.getParameter("email");
                 pwd=request.getParameter("psw");
                 license=request.getParameter("license");
                 
                 int lic;
                 if(license.equals("yes"))
                     lic=1;
                 else
                     lic=0;
                 
                 
                 
		
		try {
                    Class.forName("com.mysql.jdbc.Driver");
			
                        
		 // loads driver
                         Connection c = DriverManager.getConnection(url,username,password); // gets a new connection
                         
                         Statement stmt=c.createStatement();
                         String q="select o_id from organization where name='"+type+"'";
                         ResultSet res=stmt.executeQuery(q);
                         int oid=0;
                         if(res.next())
                             oid=res.getInt(1);
                         
                         
                         
                         int id=0;
                         
                         if(purpose.equals("employee"))
                         {
                             q="select emp_id from employee order by emp_id desc limit 1";
                             ResultSet rs=stmt.executeQuery(q);
                             if(rs.next())
                                 id=rs.getInt(1);
                             id++;
                             
                             q="insert into employee values("+id+",'"+name+"','"+mob+"',"+oid+",'"+email+"','"+pwd+"',"+lic+")";
                             stmt.executeUpdate(q);
                             
                             request.getSession().setAttribute("popid", id);
                             response.sendRedirect("showPopup.jsp");
                         }
                         else
                         {
                              q="select visitor_id from visitor order by visitor_id desc limit 1";
                             ResultSet rs=stmt.executeQuery(q);
                             if(rs.next())
                                 id=rs.getInt(1);
                             id++;
                             q="insert into visitor values("+id+",'"+name+"','"+mob+"',"+lic+",'"+email+"','"+pwd+"')";
                              stmt.executeUpdate(q);
                              
                              request.getSession().setAttribute("popid", id);
                              
                              response.sendRedirect("showPopup.jsp");
                             
                         }
                         
                         //response.sendRedirect("showPopup.jsp");
                         
                         
                         
 
		
 
		
                
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
        
       

}

