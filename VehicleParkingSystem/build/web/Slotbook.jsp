<%-- 
    Document   : Slotbook
    Created on : 17 Sep, 2019, 7:27:56 PM
    Author     : akshay
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>Au Register Forms by Colorlib</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet"> 
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
       
    
            
        
    
    </head>
    <body>
        <%
            
            request.getSession().setAttribute("id", request.getSession().getAttribute("id"));
            request.getSession().setAttribute("type", request.getSession().getAttribute("type"));
        
            Calendar cal=Calendar.getInstance();
            int day=cal.get(Calendar.DAY_OF_MONTH);
            int month=cal.get(Calendar.MONTH)+1;
            
            int hr,min,sec;
            
            String at;
            String ct="";
            
            at=""+cal.get(Calendar.YEAR);
            
            if(month<10)
                at=at.concat("-0"+month);
            else
                at=at.concat("-"+month);
            
            if(day<10)
                at=at+"-0"+day;
            else
                at=at+"-"+day;
            
            hr=cal.get(Calendar.HOUR);
            min=cal.get(Calendar.MINUTE);
            sec=cal.get(Calendar.SECOND);
            
            if(hr<10)
                ct=ct.concat(":0"+hr);
            else
                ct=ct.concat(":"+hr);
            
            if(min<10)
                ct=ct+":0"+min;
            else
                ct=ct+":"+min;
            
            if(sec<10)
                ct=ct+":0"+sec;
            else
                ct=ct+":"+sec;
            
            
            
            
            
            
            
            
            
           
            
           
            
            
        %>
        
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
                    <center>

        <form action="slotbook" method="get" style="padding-top: 100px;">
            <table>
                <tr>
            <div class="row row-space">
                <td>
                            <div class="col-2">
                                                   <div class="input-group">   
                                                       <label>Arrival Date </label> <input class="input--style-4" type="date" name="arrival_date" value="<%= at %>">
               </div>
                            </div>
                </td>
                <td>
                            <div class="col-2">
                                <div class="input-group">
                                    <label>Arrival time</label>  <input class="input--style-4" type="time" name="arrival_time" value="<%= ct %>">
               </div>
                            </div>
                </td>
                        </div>
            </tr>
            <tr>
              <div class="row row-space">
                  <td>
                            <div class="col-2">
                                <div class="input-group"> 
                                    <label> Departure Date</label>  <input  class="input--style-4" type="date" name="departure_date">
             </div>
                            </div>
                  </td>
                  <td>
                            <div class="col-2">
                                <div class="input-group">
                                    <label>Departure time</label><input class="input--style-4" type="time" name="departure_time">
            </div>
                            </div>
                  </td>
                        </div>
        </tr>
            
           
            </table>
               <br><br>
            <input class="btn btn--radius-2 btn--blue" style="width: 10%" type="submit" name="ok" value="OK">
    </form>
                
                    </center>
    </body>
</html>
