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
@WebServlet("/sendRequest")
public class SendRequest extends HttpServlet{
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String ad="";
        int lDays=0;
        String ur="";
        
       
        
        ad=request.getSession().getAttribute("arrival").toString();
        
        lDays=Integer.parseInt(request.getSession().getAttribute("dayLimit").toString());
        int status=Integer.parseInt(request.getSession().getAttribute("requestNos").toString());
       
        String vid=request.getSession().getAttribute("id").toString();
        Statement stmt=null,stmt1=null;
        
        
             try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem", "root", "root"); // gets a new connection
                stmt=c.createStatement();
                stmt1=c.createStatement();
                
             
                
            String rr="call check_requestValidity((select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"'),"+vid+",(select email from visitor where visitor_id="+vid+"),'"+ad+"',adddate('"+ad+"',interval "+(lDays-1)+" day) )";
            
             ResultSet rs=stmt.executeQuery(rr);
             
             if(rs.next())
             {
                 int st=rs.getInt("result");
                 if(st==-1)
                 {
                      request.getSession().setAttribute("message", "Your request limit is exceeded ");
                    request.getSession().setAttribute("jsp", "Slotbook.jsp");
                    response.sendRedirect("Error.jsp");
                    
                 }
                 else if(st==0)
                 {
                     
                 }
                 else if(st==1)
                 {
                      ur="update requests  set arrival_date='"+rs.getString("arrival")+"',days=days+"+(rs.getInt("dayLimit"))+" where o_id=(select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"') and visitor_id="+vid;
                 }
                 else if(st==2)
                 {
                     ur="update requests  set days=days+"+(rs.getInt("dayLimit"))+" where o_id=(select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"') and visitor_id="+vid;
                 
                 }
                 else if(st==3)
                 {
                     ur="insert into requests values((select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"'),"+vid+",'"+ad+"',"+lDays+" )";
      
                 }
                 else if(st==4)
                 {
                     ur="update requests  set arrival_date='"+rs.getString("arrival")+"',days=days+"+(rs.getInt("dayLimit")+rs.getInt("dayLimit2"))+" where o_id=(select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"') and visitor_id="+vid;
                
                 }
                 
                 if(st!=0)
                 stmt1.executeUpdate(ur);
             }
             if(status==2)
             {
                 ad=request.getSession().getAttribute("arrival2").toString();
        
                 lDays=Integer.parseInt(request.getSession().getAttribute("dayLimit2").toString());
                 
                 String rr2="call check_requestValidity((select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"'),"+vid+",(select email from visitor where visitor_id="+vid+"),'"+ad+"',adddate('"+ad+"',interval "+(lDays-1)+" day) )";
            
             ResultSet rs2=stmt1.executeQuery(rr2);
             
             if(rs2.next())
             {
                 int st=rs2.getInt("result");
                 if(st==-1)
                 {
                      request.getSession().setAttribute("message", "Your request limit is exceeded ");
                    request.getSession().setAttribute("jsp", "Slotbook.jsp");
                    response.sendRedirect("Error.jsp");
                    
                 }
                 else if(st==0)
                 {
                     
                 }
                 else if(st==1)
                 {
                      ur="update requests  set arrival_date='"+rs2.getString("arrival")+"',days=days+"+(rs2.getInt("dayLimit"))+" where o_id=(select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"') and visitor_id="+vid;
                 }
                 else if(st==2)
                 {
                     ur="update requests  set days=days+"+(rs2.getInt("dayLimit"))+" where o_id=(select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"') and visitor_id="+vid;
                 
                 }
                 else if(st==3)
                 {
                     ur="insert into requests values((select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"'),"+vid+",'"+ad+"',"+lDays+" )";
      
                 }
                 else if(st==4)
                 {
                     ur="update requests  set arrival_date='"+rs2.getString("arrival")+"',days=days+"+(rs2.getInt("dayLimit")+rs2.getInt("dayLimit2"))+" where o_id=(select o_id from organization where name='"+request.getSession().getAttribute("org").toString()+"') and visitor_id="+vid;
                
                 }
                 if(st!=0)
                 stmt1.executeUpdate(ur);
             }
                 
             }
                
                
          
            
            response.sendRedirect("requestPending.jsp");
        
        } catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
                        
                       PrintWriter pr=response.getWriter();
                       
                       pr.print(e);
                        
                        
			
    }
             
    }
    
}
