/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author akshay
 */
@WebServlet("/cancelConfirm")
public class CancelConfirm extends HttpServlet {
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String car=request.getParameter("car");
       int bid=Integer.parseInt(request.getParameter("bid"));
       int en=Integer.parseInt(request.getParameter("e_no"));
       double amount=0;
       
       try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement(); 
                    
                    String q="select * from entry_detail where entry_no="+en+" and status='n' and car_no='"+car+"' and booking_id="+bid;
                    ResultSet rs=stmt.executeQuery(q);
                    
                    if(rs.next())
                    {
                        
                         en=rs.getInt("entry_no");
                    }
                    else
                    {
                        response.sendRedirect("BookingHistory.jsp");
                    }
                    
                 //   q="update entry_detail set status='c' where entry_no="+en;
                    
                  //  stmt.executeUpdate(q);
                    
                    q="select amount from payment where entry_no="+en;
                    rs=stmt.executeQuery(q);
                    
                    if(rs.next())
                    {
                        amount=rs.getInt("amount");
                    }
                    
                    amount=amount*0.9;
                    
                 //   q="insert into refund values("+en+","+(int)amount+")";
                 //   stmt.executeUpdate(q);
                    
                    request.getSession().setAttribute("refund", (int)amount);
                    request.getSession().setAttribute("enno", en);
                    response.sendRedirect("refund.jsp");
                    
                    
                   
                    
        }catch(Exception e){ 
            out.print(e);
        } 
        
        
       
    }
    
}


