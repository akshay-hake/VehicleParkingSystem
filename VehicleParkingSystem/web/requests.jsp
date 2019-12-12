<%-- 
    Document   : table
    Created on : 19 Sep, 2019, 2:28:27 PM
    Author     : akshay
--%>

<%@page import="java.util.Calendar"%>
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
        
       
                
           <style>
               body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text],.form-container input[type=date], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
           </style>   
    </head>
    <body style=" background-color:buttonface">
        
        
        
        <!-- Grey with black text -->
<nav class="navbar navbar-inverse" style="position:fixed;width:100%;z-index: 100">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Parking</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="table.jsp">Show Detail </a></li>
     
      <li><a href="reg.jsp">Register</a></li>
      <li><a href="view.jsp">Show Layout</a></li>
      <li><a href="DriverLogin.jsp">Book slot</a></li>
      <li><a href="Pre_booking.jsp">Pre-Booking</a></li>
      <li><a href="#">Collect Payment</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
        
        

        <div style="padding-left: 10px;padding-right: 10px;"> 
            
            
        <p style="padding-top: 70px;padding-left: 10px;padding-right: 10px;">
        
        <form action="guestList.jsp" method="get">
                            
                           <input class="btn btn--radius-2 btn--blue" style="margin-right: 10px;float:left;align:right;width: 10%;height:50px;background-color: skyblue;color:white;font-size: 15px;font-weight:bold" type="submit" name="dd" value="Back" onclick="DriverLogin.jsp">
        </form>
        
        
                            
                            
        <br><br>
        <br><br>
        
       

   



        
        Type something to search the table :</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped"  border="1"  style="background-color: white;padding-left: 20px;padding-right: 20px;">
            <tr>
                <th>Sr.NO</th>
                <th>Visitor id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Arrival Date</th>
                <th>Days</th>
                <th>Confirmation</th>
            </tr>
            
            <tbody id="myTable">
            
            
  <%
      
     
        Statement stmt=null;
        Statement stmt2=null;
        Statement st3=null;
        String email="";
        String name="";
        String adate="";
        int days=0;
        
        
        int i=0;
       
        int en=0;
        try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    stmt=con.createStatement(); 
                    stmt2=con.createStatement(); 
                    st3= con.createStatement();
                    
        }catch(Exception e){ out.println(e);} 
        
                    String q="select * from requests where o_id="+request.getSession().getAttribute("oid");
                    ResultSet rs=stmt.executeQuery(q);  
                    ResultSet temp=rs;
                    if(!rs.next())
                    {
                        %>
                        <tr style="background-color: #DDDDDD">
                            <td style="background-color: white" >Not found</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <%
                    }
                    rs.previous();
                    while(rs.next()) 
                    { 
                        i++;

                        adate=rs.getString("arrival_date");
                        days=rs.getInt("days");
                        
                        int vid=rs.getInt("visitor_id");
                        String v="select * from visitor where visitor_id="+vid;
                        ResultSet vres=stmt2.executeQuery(v);

                        if(vres.next())
                        {
                            email=vres.getString("email");
                            name=vres.getString("name");
                            //adate=vres.getString("A_date");
                        }

                    

                        

                       
                        
                  
                         
                    %>
                    
                    <tr>
                        <td><%= i%></td>
                        <td><%= vid%></td>
                        <td><%=name%></td>
                        <td><%=email%></td>
                        <td><%=adate%></td>
                        <td><%=days%></td>
                        <td style="width:25%">
                           <form action="request" method="get">
                               <input type="date" name="ad" value="<%=adate%>" hidden>
                               <input type="number" name="vid" value="<%=vid%>" hidden>
                              <input class="btn btn--radius-2 btn--blue" style="margin-right: 20px;width: 45%;height:40px;background-color: skyblue;color:white;font-size: 15px;font-weight:bold" type="submit" name="type" value="Accept" >
                              <input class="btn btn--radius-2 btn--blue" style="margin-right: 0px;width: 45%;height:40px;background-color: red;color:white;font-size: 15px;font-weight:bold" type="submit" name="type" value="Reject" >
        
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
