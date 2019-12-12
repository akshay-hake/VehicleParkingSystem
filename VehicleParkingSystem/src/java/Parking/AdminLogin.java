/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akshay
 */
@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname=req.getParameter("username");
        String pass=req.getParameter("pass");
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem", "root", "root"); // gets a new connection
 
		String q="select * from administrator where username='"+uname+"' and password='"+pass+"'";
		
 
		ResultSet rs = c.createStatement().executeQuery(q);
 
		if (rs.next()) {
                        req.getSession().setAttribute("id", rs.getInt(1));
                        
			resp.sendRedirect("table.jsp");
			return;
		}
		resp.sendRedirect("login.jsp");
		return;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			
		}
    }
    
    
    
}
