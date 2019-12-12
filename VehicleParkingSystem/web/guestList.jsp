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
        
        <%
           Calendar cal=Calendar.getInstance();
           
           String md="";
            if(request.getParameter("cdate")==null)
            {
                md=java.time.LocalDate.now().toString();
                
            }
            else
            {
                md=request.getParameter("cdate");
            }
            

            
            %>
        
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
                            <input class="btn btn--radius-2 btn--blue" style="margin-right: 10px;float:left;width: 15%;height:50px;color:black;font-size: 15px;font-weight:bold" type="date" name="cdate" value="<%=md%>" onclick="">
                           <input class="btn btn--radius-2 btn--blue" style="margin-right: 10px;float:left;align:right;width: 10%;height:50px;background-color: skyblue;color:white;font-size: 15px;font-weight:bold" type="submit" name="dd" value="Get List" onclick="DriverLogin.jsp">
        </form>
        
        
        
        
                            <input class="btn btn--radius-2 btn--blue" style="border-radius: 50%;margin-right: 10px;float:right;align:right;width: 10%;height:50px;background-color: orange;color:white;font-size: 15px;font-weight:bold" type="submit" name="ok" value="+ ADD" onclick="openForm()">
              <form action="requests.jsp" method="get">
                              <input class="btn btn--radius-2 btn--blue" style="border-radius: 50%;margin-right: 10px;float:right;align:right;width: 10%;height:50px;background-color: skyblue;color:white;font-size: 15px;font-weight:bold" type="submit" name="dd" value="Requests" onclick="DriverLogin.jsp">
        </form>              
        
                            
                            
        <br><br>
        <br><br>
        
       

        <div class="form-popup"  id="myForm">
  <form action="addG" class="form-container">
    <h1>Add Guest</h1>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
    
    <label for="adate"><b>Arrival date</b></label>
    <input type="date" placeholder="Enter Arrival date" name="adate" required>

    <label for="day"><b>Days</b></label>
    <input type="text" placeholder="Enter Days" name="days" required>
    
    

    <button type="submit" class="btn">Add</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
  </form>
</div>

<script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>

        
        Type something to search the table :</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped"  border="1"  style="background-color: white;padding-left: 20px;padding-right: 20px;">
            <tr>
                <th>Sr.NO</th>
                <th>Email</th>
                <th>Remaining Days</th>
                <th>status</th>
            </tr>
            
            <tbody id="myTable">
            
            
  <%
      
     
        Statement stmt=null;
        Statement stmt2=null;
        Statement st3=null;
        String email="";
        int days=0;
        String st="";
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
        
                    String q="select * from guestList where o_id="+request.getSession().getAttribute("oid")+" and ('"+md+"' between A_date and adddate(A_date,interval days-1 day))";
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
                        </tr>
                        <%
                    }
                    rs.previous();
                    while(rs.next()) 
                    { 
                        i++;
                        
                        email=rs.getString("email");


                         String rd="select get_remaining_days('"+email+"','"+md+"')";
                         ResultSet mr=st3.executeQuery(rd);
                         if(mr.next())
                        {
                            days=mr.getInt(1);

                        }

                        
                       
                        
                       
                     
                        String rr="select get_status('"+email+"','"+md+"')";
                        ResultSet ms=st3.executeQuery(rr);
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
                      
                       else
                       {
                            dstatus="Departed";
                            dcol="grey";
                            fcol="white";
                       }
                       
                       
                        
                  
                         
                    %>
                    
                    <tr>
                        <td><%= i%></td>
                        <td><%= email%></td>
                        <td><%=days%></td>
                        
                       

                        
                        <td style="background-color: <%= dcol %>;color:<%=fcol%>;font-size: 15px;font-weight:bold"><% out.print(dstatus); %></td>
                           
                           
                            
                        
                       
                        
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
