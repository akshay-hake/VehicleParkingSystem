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
@WebServlet("/addG")
public class AddGuest extends HttpServlet {

 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email=request.getParameter("email");
        String days=request.getParameter("days");
        String id=request.getSession().getAttribute("id").toString();
        String date1=request.getParameter("adate");
        
        try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement(); 
                    
                   
                    
                   String q="call add_guest("+id+",'"+email+"',"+days+",'"+date1+"')";
                   stmt.executeUpdate(q);
                    
                   
                    response.sendRedirect("guestList.jsp");
                    
                    
                   
                    
        }catch(Exception e){ } 
        
    }

   // </editor-fold>

}
