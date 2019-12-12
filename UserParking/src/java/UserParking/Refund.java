/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserParking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
@WebServlet("/Refund")
public class Refund extends HttpServlet {
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
       int en=Integer.parseInt(request.getParameter("enb"));
       int amount=Integer.parseInt(request.getParameter("amount"));
       
       try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement(); 
                    
                   
                    
                   String q="update entry_detail set status='c' where entry_no="+en;
                    
                    stmt.executeUpdate(q);
                    
                   
                    
                    q="insert into refund values("+en+","+(int)amount+")";
                    stmt.executeUpdate(q);
                    
                   
                    response.sendRedirect("BookingHistory.jsp");
                    
                    
                   
                    
        }catch(Exception e){ } 
        
        
       
    }
    
}


