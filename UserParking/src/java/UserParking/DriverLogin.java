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
import java.sql.*;

/**
 *
 * @author akshay
 */
@WebServlet("/DLogin")
public class DriverLogin extends HttpServlet {

   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
             String org="";
           String un=request.getParameter("login");
           int id=Integer.parseInt(un);
		String pw=request.getParameter("psw");
                String type=request.getParameter("Type");
                String tid="0";
                if(type.equals("employee"))
                    tid="emp_id";
                else if(type.equals("visitor"))
                {
                    tid="visitor_id";
                    org=request.getParameter("comp");
                    request.getSession().setAttribute("org", org);
                }
                
		
		// Connect to mysql and verify username password
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem", "root", "root"); // gets a new connection
 
		String q="select * from "+type+" where "+tid+"="+id+" and password='"+pw+"'";
		
 
		ResultSet rs = c.createStatement().executeQuery(q);
 
		while (rs.next()) {
                    
                    request.getSession().setAttribute("id", un);
                    request.getSession().setAttribute("type", type);
                    
                    
                    if(type.equals("visitor"))
                    {
                        String g="select * from visitor where visitor_id="+id;
                        Statement ss=c.createStatement();
                        ResultSet rst=ss.executeQuery(g);
                        
                        if(rst.next())
                        {
                            response.sendRedirect("Home.jsp");
                        }
                        else
                        {
                            response.sendRedirect("DriverLogin.jsp");
                        }
                    }
                    
                    else
                    {
                    
                        
			response.sendRedirect("Home.jsp");
                    }
			return;
		}
		response.sendRedirect("DriverLogin.jsp");
		return;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			
		}
        
    }

 

}
