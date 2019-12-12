<%-- 
    Document   : DriverLogin
    Created on : 20 Sep, 2019, 7:16:57 PM
    Author     : akshay
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
           <script src="node_modules/tablefilter/dist/tablefilter/tablefilter.js"></script>
        
   <style>
body {
	font-family: Arial, Helvetica, sans-serif;
	
	background-color: white;
	color: white;
	text-shadow: 4px 4px 6px navy; 
}
h1{
	color :white;
text-shadow: 4px 4px 6px navy;  
}



.container {
    padding: 16px;
    background-color: ECECF3;
}




input {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background:#c0c0c0;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
    color: black;
}

select {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background: #c0c0c0;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
    color: black;
}

.pwd {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background: #c0c0c0;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
    color: black;
}



.registerbtn {
    background-color:#090468   ;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    cursor: pointer;
    width: 18%;
    opacity: 0.9;
     box-sizing: border-box;
    border: 2px solid white;
    border-radius: 4px;
}


.registerbtn:hover {
    opacity: 1;
}


</style>
<script>
function show() {
    
       
    
       var ty=document.getElementById("Type").value;
    
       
       
       if(ty==="visitor")
       {
            document.getElementById("dis").style.display = "block";
            
        }
       else
           document.getElementById("dis").style.display = "none";
}

</script>
</head>
<body>
    
    <%
        
    try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem", "root", "root"); // gets a new connection
 
		String q="delete from requests where adddate(arrival_date,interval days-1 day)<curdate()";
                
                                                                                    
		
 
		 c.createStatement().executeUpdate(q);
 
		
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
                    out.print(e);
                        
			
		}
        
    
    %>
    
    <nav class="navbar navbar-inverse" style="margin-top: 0px;position:fixed;width:100%;z-index: 100">
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
    
        
    <br>
    <form action="DriverLogin" method="get" style="border: 2px solid black;background-color: #d0d0d0;margin: 100px">
  <div class="container">
<center>





    <h1>Login</h1>
    
    <br><br><br>
    <label for="login"><b>Login Id</b></label><br>
    <input type="number" placeholder="Enter Login Id" name="login" required>
	<br>
    <label for="psw"><b>Password</b></label><br>
    <input  class="pwd" type="password" placeholder="Enter Password" name="psw" required>
    <br>
    
    <label for="Type"><b>Type</b></label><br>
    <select id="Type" name="Type" onChange="show()">
				<option value="employee">Employee</option>
				<option value="visitor">Visitor</option>
                                <option value="organization">Organization</option>
			</select>
    
    <br>
    
    <div id="dis" style="display: none">
    <label for="comp"><b>Company</b></label><br>
    <select id="comp" name="comp" >
				<option value="XYZ">XYZ</option>
				<option value="ABC">ABC</option>
                                
			</select>
    </div>
    
    <br>

    <button type="submit" class="registerbtn"><b>LOGIN</b></button>
</center>
  </div>
</body>
</html>
