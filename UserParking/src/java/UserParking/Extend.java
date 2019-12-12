package UserParking;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akshay
 */
@WebServlet("/extend")
public class Extend extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String en=request.getSession().getAttribute("enb").toString();
        int sec=Integer.parseInt(request.getParameter("time"));
        String at="",dt="";
        
        int sh=0,sl=0;
        int scar_space=0;
        String type=request.getSession().getAttribute("type").toString();
        
        int osn=0;
        int pay_id=0;
        int bk_id=0;
        
        
        
        int sen=0;
           
       try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement(); 
                    String q="Select * from entry_detail where entry_no="+en;
                    
                    ResultSet res=stmt.executeQuery(q);
                    
                    if(res.next())
                    {
                        osn=res.getInt("slot_no");
                        at=res.getString("arrival_time");
                        dt=res.getString("departure_time");
                       // pay_id=res.getInt("payment_id");
                        bk_id=res.getInt("booking_id");
                    }
                        
                    
                    
                    q="select entry_detail.car_no,entry_no,arrival_time,departure_time,slot_no,space_required from entry_detail,car where slot_no="+osn+" and entry_detail.car_no=car.car_no and (arrival_time<=timestampadd(second,"+sec+",'"+dt+"') and arrival_time>='"+dt+"')";
                    
                  
                   res=stmt.executeQuery(q);
                   
                   
                   if(res.next())
                   {
                       scar_space=res.getInt("space_required");
                       sen=res.getInt("entry_no");
                        String art=res.getString("arrival_time");
                           String dpt=res.getString("departure_time");
                           
                     if(scar_space==10 && type.equals("employee"))
                     {
                         sl=33;
                         sh=48;
                     }
                     else if(scar_space==10 && type.equals("visitor"))
                     {
                         sl=41;
                         sh=48;
                     }
                     else if(scar_space==20 && type.equals("employee"))
                     {
                         sl=17;
                         sh=32;
                     }
                     else if(scar_space==10 && type.equals("visitor"))
                     {
                         sl=25;
                         sh=32;
                     }
                     
                     
                       
                     
                    String upq="select slot_no from slot where slot.slot_no>="+sl+" and slot.slot_no<="+sh+" and slot_no not in (select slot_no from entry_detail where (arrival_time<=STR_TO_DATE('"+dpt+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+dpt+"', '%Y-%m-%d %H:%i:%s'))  or (arrival_time<=STR_TO_DATE('"+art+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+art+"', '%Y-%m-%d %H:%i:%s')) or (arrival_time>=STR_TO_DATE('"+art+"', '%Y-%m-%d %H:%i:%s') and departure_time<=STR_TO_DATE('"+dpt+"', '%Y-%m-%d %H:%i:%s')))";
                    
                    ResultSet r=stmt.executeQuery(upq);
                    
                    
                    
                    if(r.next())
                    {
                        String sc="update entry_detail set slot_no="+r.getInt("slot_no")+" where entry_no="+sen;
                        
                        stmt.executeUpdate(sc);
                        
                        String uq="update entry_detail set departure_time=timestampadd(second,"+sec+",'"+dt+"') where entry_no="+en;
                       
                         stmt.executeUpdate(uq);
                    }
                    else
                    {
                        //error
                       
                    }
                       
                   }
                   else
                   {
                       
                       String uwq="update entry_detail set departure_time=timestampadd(second,"+sec+",'"+dt+"') where entry_no="+en;
                       
                       stmt.executeUpdate(uwq);
                   }
                    
                  //  response.sendRedirect("checkout.jsp");
                   
                  String ndt="select departure_time from entry_detail where entry_no="+en;
                  
                  ResultSet gdt=stmt.executeQuery(ndt);
                  
                  
                  
                  
                  if(bk_id!=0)
                  {
                      
                     String method=request.getParameter("ptype");
                   int amount=Integer.parseInt(request.getParameter("amount"));
                   String name=request.getParameter("fname");
                   String email=request.getParameter("email");
                   
                   
                   
                  
                   
                     Statement st=con.createStatement();
                     String pq="call insert_payment_after_extend("+en+",'"+method+"',"+amount+",'"+name+"','"+email+"')";
                      
                    st.executeUpdate(pq);
                    
                    
                      
                     
                      
                  }
                  
                  if(gdt.next())
                  {
                  request.getSession().setAttribute("edt",gdt.getString(1) );
                  response.sendRedirect("success.jsp");
                  }
                         
                        con.close();  
                    }catch(Exception e){ out.println(e);} 
        
    }

    
}
