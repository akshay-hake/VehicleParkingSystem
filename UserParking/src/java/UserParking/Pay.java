/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserParking;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author akshay
 */
@WebServlet("/pay")
public class Pay extends HttpServlet {



   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                 int en=Integer.parseInt(request.getSession().getAttribute("en").toString());
                  String car_no=request.getSession().getAttribute("car_no").toString();
                   String purpose=request.getSession().getAttribute("purpose").toString();
                   String ids=request.getSession().getAttribute("ids").toString();
                   int sno =Integer.parseInt(request.getSession().getAttribute("sno").toString());
                   String ad= request.getSession().getAttribute("ad").toString();
                   String at= request.getSession().getAttribute("at").toString();
                   String dd= request.getSession().getAttribute("dd").toString();
                   String dt= request.getSession().getAttribute("dt").toString();
                   int space= Integer.parseInt(request.getSession().getAttribute("space").toString());
                   int rc= Integer.parseInt(request.getSession().getAttribute("rc").toString());
                   
                   int pid=0;
                   int bid=0;
                  
                   String method=request.getParameter("ptype");
                   int amount=(int)Double.parseDouble(request.getParameter("amount"));
                   String name=request.getParameter("fname");
                   String email=request.getParameter("email");
                                  
                   try{  
                       
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement();  
                    String q="select p_id from payment order by p_id desc limit 1";
                    ResultSet rs=stmt.executeQuery(q);
       
                    if(rs.next())
                        pid=rs.getInt("p_id");
                    
                    pid++;
                    
                    q="select booking_no from pre_booking order by booking_no desc limit 1";
                    rs=stmt.executeQuery(q);
       
                    if(rs.next())
                        bid=rs.getInt("booking_no");
                    
                    bid++;
                    
                    q="call booking("+pid+",'"+method+"',"+amount+",'"+name+"','"+email+"',"+en+",'"+car_no+"','"+purpose+"',"+ids+","+sno+",'"+ad+" "+ at+"','"+dd+" "+dt+"',"+bid+",null,"+pid+","+space+","+rc+",'n')";
                    ResultSet res=stmt.executeQuery(q);
                    
                    String result="000";
                    if(res.next())
                    {
                        result=res.getString(1)+res.getString(2)+res.getString(3);
                    }
                    
                    if(result.equals("111"))
                    {
                       // result="Your booking is confirmed for slot no: "+sno;
                        
                        q="create event e"+bid+" on schedule at ('0000-01-01' + interval ((TO_SECONDS('"+ad+" "+at+"')+TO_SECONDS('"+dd+" "+dt+"'))/2) second - interval 1 day) do update entry_detail set departure_time=('0000-01-01' + interval ((TO_SECONDS('"+ad+" "+at+"')+TO_SECONDS('"+dd+" "+dt+"'))/2) second - interval 1 day) where status='n' and entry_no="+en;
                        stmt.executeUpdate(q);
                      //  JOptionPane.showMessageDialog(new JFrame(),result,"Success",JOptionPane.OK_OPTION);
                        request.getSession().setAttribute("eno", en);
                        response.sendRedirect("Receipt.jsp");
                        return;
                    }
                    else if(result.equals("000"))
                        result="Something went wrong ...";
                    else if(result.charAt(0)=='Y')
                    {
                       // JOptionPane.showMessageDialog(new JFrame(),result,"Error",JOptionPane.ERROR_MESSAGE);
                        request.getSession().setAttribute("message", result);
                        request.getSession().setAttribute("jsp", "Slotbook.jsp");
                        response.sendRedirect("Error.jsp");
                        return;
                    }
                        
                  //  request.getSession().setAttribute("popup", result);
                    
                     //  JOptionPane.showMessageDialog(new JFrame(),result,"Error",JOptionPane.ERROR_MESSAGE);
                    request.getSession().setAttribute("message", result);
                    request.getSession().setAttribute("jsp", "color.jsp");
                    response.sendRedirect("Error.jsp");
                   
                   }
               catch(Exception e){ out.println(e);} 
        
    }



}
