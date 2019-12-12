package UserParking;



import java.io.IOException;
import java.io.PrintWriter;
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
import javax.websocket.Session;

/**
 *
 * @author akshay
 */
@WebServlet("/BeforeExtend")
public class BeforeExtend extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getSession().setAttribute("enb", request.getParameter("enb"));
        String en=request.getSession().getAttribute("enb").toString();
        int sec=7200;
        String at="",dt="";
        
        int sh=0,sl=0;
        int scar_space=0;
        String type=request.getSession().getAttribute("type").toString();
        
        int osn=0;
        int bid=0;
        
        
        
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
                        bid=res.getInt("booking_id");
                    }
                    
                    
                    //1
                    sec=7200;
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
                        request.getSession().setAttribute("3t", "");
                        request.getSession().setAttribute("2t", "");
                        request.getSession().setAttribute("1t", "");
                        
                        if(bid==0)
                           response.sendRedirect("SpotExtend.jsp");
                        else
                            response.sendRedirect("extend.jsp");
                        return;
                    }
                    else
                    {
                        //error
                        
                        request.getSession().setAttribute("3t", "disabled");
                    }
                       
                   }
                   else
                   {
                       request.getSession().setAttribute("3t", "");
                        request.getSession().setAttribute("2t", "");
                        request.getSession().setAttribute("1t", "");
                        
                        if(bid==0)
                            response.sendRedirect("SpotExtend.jsp");
                        else
                            response.sendRedirect("extend.jsp");
                        
                        return;
                   }
                    
                   
                   
                   //2
                   sec=3600;
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
                        
                        request.getSession().setAttribute("2t", "");
                        request.getSession().setAttribute("1t", "");
                        if(bid==0)
                            response.sendRedirect("SpotExtend.jsp");
                        else
                            response.sendRedirect("extend.jsp");
                        return;
                    }
                    else
                    {
                        //error
                        
                        request.getSession().setAttribute("2t", "disabled");
                        request.getSession().setAttribute("3t", "disabled");
                    }
                       
                   }
                   else
                   {
                      
                        request.getSession().setAttribute("2t", "");
                        request.getSession().setAttribute("1t", "");
                        
                        if(bid==0)
                            response.sendRedirect("SpotExtend.jsp");
                        else
                            response.sendRedirect("extend.jsp");
                        return;
                   }
                    
                   
                   //3
                   
                   sec=1800;
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
                        
                        
                        request.getSession().setAttribute("1t", "");
                        if(bid==0)
                            response.sendRedirect("SpotExtend.jsp");
                        else
                            response.sendRedirect("extend.jsp");
                        return;
                    }
                    else
                    {
                        //error
                        
                        request.getSession().setAttribute("2t", "disabled");
                        request.getSession().setAttribute("3t", "disabled");
                        request.getSession().setAttribute("1t", "disabled");
                    }
                       
                   }
                   else
                   {
                      
                        
                        request.getSession().setAttribute("1t", "");
                        if(bid==0)
                            response.sendRedirect("SpotExtend.jsp");
                        else
                            response.sendRedirect("extend.jsp");
                        return;
                   }
                    
                   request.getSession().setAttribute("message", "We are out of space!\nPlease contact admin..");
                   request.getSession().setAttribute("jsp", "BookingHistory.jsp");
                   response.sendRedirect("Error.jsp");
                      con.close();  
                    }catch(Exception e){ out.println(e);}
                        
                   
        
    }

   

   
}
