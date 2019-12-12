<%-- 
    Document   : confirmBooking
    Created on : 16 Sep, 2019, 8:35:17 PM
    Author     : akshay
--%>

<%@page import="jdk.nashorn.internal.runtime.ScriptFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
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
    
    
    <body>
        
         <nav class="navbar navbar-inverse" style="position:fixed;width:100%;z-index: 100">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Parking</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="table.jsp">Show Detail </a></li>
     
      <li><a href="reg.jsp">Register</a></li>
      <li><a href="view.jsp">Show Layout</a></li>
      <li class="active"><a href="DriverLogin.jsp">Book slot</a></li>
      <li><a href="Pre_booking.jsp">Pre-Booking</a></li>
      <li><a href="#">Collect Payment</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
        
          <% 
            
            String col[]=new String[50];
            
            String rcY="";
            String rcN="";
            String access="";
            String ad="2019-08-16",at="01:01:00",dd="2019-08-16",dt="01:40:00";
            
            dd=request.getSession().getAttribute("dd").toString();
            ad=request.getSession().getAttribute("ad").toString();
            at=request.getSession().getAttribute("at").toString();
            
           dt=request.getSession().getAttribute("dt").toString();
           
                        String cn=request.getSession().getAttribute("car_no").toString();
                        String space="",id="";
                       try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement();  
                    String q="select * from car where car_no='"+cn+"'";
                    ResultSet rs=stmt.executeQuery(q);  
                    if(rs.next()) 
                    {
                       space=String.valueOf(rs.getInt("space_required"));
                       int k=rs.getInt("emp_id");
                       if(rs.wasNull())
                            id=String.valueOf(rs.getInt("visitor_id"));
                       else
                           id=String.valueOf(k);
                       
                       if(rs.getInt("rc")==1)
                       {
                          rcY="checked";
                          access="readonly";
                       }
                       else
                           rcN="checked";
                       
                       
           
                        
                    }
                         
                        con.close();  
                    }catch(Exception e){out.print(e); } 
                    
          %>
        
        <form action="confirmBook" method="get" style="padding-top: 100px">
            <center>
             Car_no : <input type="text" name="car_no" id="car_no" value="<%= request.getSession().getAttribute("car_no") %>" <%= access %>>
            
            <br><br>
            
            Space_required : <input type="number" name="space" id="space" value="<%= space %>" <%=access%>>
            <br><br>
            
            RC : <input type="radio" name="rc" id="rc" value="yes" <%= rcY %> <%=access%> >Yes
            <input type="radio" name="rc" id="rc" value="no" <%=access%> <%=rcN%>>No
            <br><br>
            
            ID : <input type="number" name="id" id="id" value="<%= request.getSession().getAttribute("id") %>" <%=access%>>
            <br><br>
            
            Type : <input type="text" name="type" value="<%= request.getSession().getAttribute("type")%>">
            <br><br>
            
            Slot No. : <input type="number" name="sno" id="sno" value="<%= request.getSession().getAttribute("sno") %>" readonly>
            <br><br>
            
            Purpose : <input type="text" name="purpose">
            <br><br>
            
            
            Arrival Date : <input type="date" name="arrival_date" value="<%= ad %>">  Arrival time : <input type="time" name="arrival_time" value="<%= at %>">
            <br><br>
            
            Departure Date : <input type="date" name="departure_date" value="<%= dd %>">  Departure time : <input type="time" name="departure_time" value="<%= dt %>">
            <br><br>
            
            
            <input type="submit" name="submit" value="Done">
            
            </center>
        </form>
    </body>
</html>
