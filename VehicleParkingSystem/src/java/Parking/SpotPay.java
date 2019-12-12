/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akshay
 */
@WebServlet(name = "SpotPay", urlPatterns = {"/SpotPay"})
public class SpotPay extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                
                String method=request.getParameter("ptype");
                String amount=request.getParameter("amount");
                String name=request.getParameter("fname");
                String email=request.getParameter("email");
                int pid=0;  
                
                
                   
               try {
                    Class.forName("com.mysql.jdbc.Driver");
			
                        int en=Integer.parseInt(request.getParameter("entryno"));
                        
		  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                      
                         Statement stmt=con.createStatement();
                         String q1="select p_id from payment order by p_id desc limit 1";
                         ResultSet rs1= stmt.executeQuery(q1);
                         if(rs1.next()) {
                             pid=rs1.getInt("p_id");
                         }
                         pid++;
                         
                         String q="insert into payment values("+pid+",'"+method+"',"+amount+",'"+name+"','"+email+"',"+en+")";
                         stmt.executeUpdate(q);
                         
                         response.sendRedirect("table.jsp");
                        
                         
                         
                         
                        con.close();  
                    }catch(Exception e){ out.println(e);} 
		
    }

    
}
