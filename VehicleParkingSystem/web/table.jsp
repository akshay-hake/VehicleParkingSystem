<%-- 
    Document   : table
    Created on : 19 Sep, 2019, 2:28:27 PM
    Author     : akshay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
           <script src="node_modules/tablefilter/dist/tablefilter/tablefilter.js"></script>
       
                
        
    </head>
    <body style=" background-color:buttonface">
        
        <!-- Grey with black text -->
<nav class="navbar navbar-inverse" style="position:fixed;width:100%;height: 8%;z-index: 100">
  <div class="container-fluid" >
    <div class="navbar-header" >
      <a class="navbar-brand" href="#">Parking</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="table.jsp">Show Detail </a></li>
     
      <li ><a href="reg.jsp" >Register</a></li>
      <li><a href="view.jsp">Show Layout</a></li>
      <li><a href="DriverLogin.jsp">Login page</a></li>
      <li><a href="Pre_booking.jsp">Pre-Booking</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

        <div style="padding-left: 10px;padding-right: 10px;"> 
        <p style="padding-top: 100px;padding-left: 10px;padding-right: 10px;">Type something to search the table :</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped"  border="1"  style="background-color: white;padding-left: 20px;padding-right: 20px;">
            <tr>
                <th>Sr.NO</th>
                <th>Name</th>
                <th>Slot no</th>
                <th>Arrival_time</th>
                <th>Departure_time</th>
                <th>Purpose</th>
                <th>Type</th>
                <th>Status</th>
                <th>Payment</th>
            </tr>
            
            <tbody id="myTable">
            
            
  <%
      
     
        Statement stmt=null;
        Statement stmt2=null;
        Statement st3=null;
        String pstatus="Pending";
        String ps="";
        String color="red";
        int i=0;
        String dstatus="";
        String dcol="";
        String fcol="";
        int en=0;
        try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    stmt=con.createStatement(); 
                    stmt2=con.createStatement(); 
                    st3= con.createStatement();
                    
        }catch(Exception e){ out.println(e);} 
        
                    String q="select * from entry_car_detail";
                    ResultSet rs=stmt.executeQuery(q);  
                    while(rs.next()) 
                    { 
                        i++;
                        
                        en=rs.getInt("entry_no");
                        
                        String st="select giveStatus("+en+")";
                        ResultSet ms=st3.executeQuery(st);
                        int s=0;
                        
                        if(ms.next())
                        {
                            s=ms.getInt(1);
                        }
                       
                       
                       if(s==2)
                       {
                           dstatus="Arrived";
                           dcol="#B9DDDF  ";
                           fcol="black";
                       }
                       else if(s==1)
                       {
                           dstatus="Arriving";
                           dcol="yellow";
                           fcol="black";
                       }
                       else if(s==4)
                       {
                           dstatus="Canceled";
                           dcol="red";
                           fcol="white";
                       }
                       else if(s==5)
                            {
                                dstatus="Expired";
                                dcol="#C7C5B7";
                                fcol="white";
                            }
                            else
                            {
                                dstatus="Departed";
                                dcol="grey";
                                fcol="white";
                            }
                       
                       
                        
                         String rq="select * from payment where entry_no="+rs.getInt("entry_no");
                         ResultSet p=st3.executeQuery(rq);
                         
                         if(p.next())
                         {
                             pstatus="Done";
                             ps="disabled";
                             color="green";
                         }
                         else
                         {
                             pstatus="Pending";
                             ps="";
                             color="red";
                         }
                         
                    %>
                    
                    <tr>
                        <td><%= i%></td>
                        
                        <%
                            
                           String type=""; 
                          int id=rs.getInt("emp_id");
                          if(rs.wasNull())
                          {
                              String q2="select name from visitor where visitor_id="+rs.getInt("visitor_id");
                              ResultSet rs2=stmt2.executeQuery(q2);
                              if(rs2.next())
                              { %>
                                 <td><%= rs2.getString("name") %></td> 
                                 <%
                                     type="Visitor";
                              }
                          }
                          else
                          {
                            String q2="select name from employee where emp_id="+rs.getInt("emp_id");
                              ResultSet rs2=stmt2.executeQuery(q2);
                              if(rs2.next())
                              { %>
                                 <td><%= rs2.getString("name") %></td> 
                                 <%
                                     
                                     type="Employee";
                              }

                            }

                                                                      
                         %>
                        <td><%= rs.getInt("slot_no") %></td>
                        <td><%= rs.getString("arrival_time") %></td>
                        <td><%= rs.getString("departure_time") %></td>
                        <td><%= rs.getString("purpose") %></td>
                        <td><%= type %></td>
                        
                        <td style="background-color: <%= dcol %>;color:<%=fcol%>;font-size: 15px;font-weight:bold"><% out.print(dstatus); %></td>
                           
                           
                            
                        
                        <td>
                            <form action="SpotPayment.jsp" method="get">
                            <input type="text" name="en" value="<%= en %>" hidden>
                            <input class="btn btn--radius-2 btn--blue" style="width: 100%;background-color: <%= color %>;color:white;font-size: 15px;font-weight:bold" type="submit" name="ok" value="<%= pstatus %>" <%= ps %> >
                            </form>
                            </td>
                        
                    </tr>
                        
                        
                   <%     
                        
                    }
                         
                    
  %>

            </tbody>
</table>
        </div>
  <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

    </body>
</html>
