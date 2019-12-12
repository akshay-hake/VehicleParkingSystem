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
        <!-- Grey with black text -->
<nav class="navbar navbar-inverse" style="position:fixed;width:100%;z-index: 100">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Parking</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="table.jsp">Show Detail </a></li>
     
      <li><a href="reg.jsp">Register</a></li>
      <li class="active"><a href="view.jsp">Show Layout</a></li>
      <li><a href="DriverLogin.jsp">Book slot</a></li>
      <li><a href="Pre_booking.jsp">Pre-Booking</a></li>
      <li><a href="#">Collect Payment</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

         <div style="padding-left: 10px;padding-right: 10px;"> 
        <p style="padding-top: 100px">Type something to search the table :</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped" width="60%" border="1" id="myTable" style="background-color: white">
            <tr>
                <th>Sr.NO</th>
                <th>Name</th>
                <th>Slot no</th>
                <th>Arrival_time</th>
                <th>Departure_time</th>
                <th>Purpose</th>
                <th>Type</th>
            </tr>
            
            
  <%
      
        String ad,at,dd="2019-08-16",dt;
            
            
            
            dd=request.getSession().getAttribute("dd").toString();
            ad=request.getSession().getAttribute("ad").toString();
            at=request.getSession().getAttribute("at").toString();
            
            dt=request.getSession().getAttribute("dt").toString();
        
        Statement stmt=null;
        Statement stmt2=null;
        int sn=Integer.parseInt(request.getSession().getAttribute("sn").toString());
        int i=0;
        try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    stmt=con.createStatement(); 
                    stmt2=con.createStatement(); 
                    
        }catch(Exception e){ out.println(e);} 
        
                    String q="select * from entry_detail,car where entry_detail.car_no=car.car_no and slot_no="+sn+" and status<>'c' and ((arrival_time<=STR_TO_DATE('"+dd+" "+ dt+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+dd+" "+dt+"', '%Y-%m-%d %H:%i:%s'))  or (arrival_time<=STR_TO_DATE('"+ad+" "+ at+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+ad+" "+at+"', '%Y-%m-%d %H:%i:%s')) or (arrival_time>=STR_TO_DATE('"+ad+" "+ at+"', '%Y-%m-%d %H:%i:%s') and departure_time<=STR_TO_DATE('"+dd+" "+dt+"', '%Y-%m-%d %H:%i:%s'))) order by arrival_time desc";
                    ResultSet rs=stmt.executeQuery(q);  
                    while(rs.next()) 
                    { 
                        i++;
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
                        
                    </tr>
                        
                        
                   <%     
                        
                    }
                         
                    
  %>


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
