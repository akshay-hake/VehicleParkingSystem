/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking;

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

@WebServlet("/confirmBook")
public class ConfirmBook extends HttpServlet{
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String car_no=request.getParameter("car_no");
        
        int space=Integer.parseInt(request.getParameter("space"));
        int rc;
        if(request.getParameter("rc").equals("yes"))
            rc=1;
        else
            rc=0;
        
         int id=Integer.parseInt(request.getParameter("id"));
         String ids="";
        if(request.getParameter("type").equals("employee"))
            ids=request.getParameter("id")+",0";
        else
            ids="0,"+request.getParameter("id");
        
        String purpose=request.getSession().getAttribute("org")+" : "+request.getParameter("purpose");
            
       
        int sno=Integer.parseInt(request.getParameter("sno"));
        
        // String ad="2019-08-16",at="01:01:00",dd="2019-08-16",dt="01:40:00";
        
         String ad,at,dd="2019-08-16",dt;
        dd=request.getParameter("departure_date");
        ad=request.getParameter("arrival_date");
        at=request.getParameter("arrival_time");
       
        dt=request.getParameter("departure_time");
       
       try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement();  
                    String q="select entry_no from entry_detail order by entry_no desc limit 1";
                    ResultSet rs=stmt.executeQuery(q);
                    int en=0;
                    if(rs.next())
                        en=rs.getInt("entry_no");
                    en++;
                    
                    stmt=con.createStatement();
                    q="call insert_entry_data("+en+",'"+car_no+"','"+purpose+"',"+ids+","+sno+",'"+ad+" "+at+"','"+dd+" "+dt+"',null,null,null,"+space+","+rc+",'y')";
                    
                    
                    stmt.executeUpdate(q);
                    
                    response.sendRedirect("DriverLogin.jsp");
                   
                         
                        con.close();  
                    }catch(Exception e){ out.println(e);} 
		
	
    }
    
}
