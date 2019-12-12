<%-- 
    Document   : Slotbook
    Created on : 17 Sep, 2019, 7:27:56 PM
    Author     : akshay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
       
    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
           <script src="node_modules/tablefilter/dist/tablefilter/tablefilter.js"></script>
       
     
         <style>
             
             .sidebar {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 2;
    width: 300px;
    background-size: cover;
    background-position: center center;
    
}
.sidebar .sidebar-background {
    position: absolute;
    z-index: 189;
    height: 100%;
    display: block;
    top: 0;
    left: 0;
    bottom: 0;
    color: white;
    background-color:#076377 ;
    padding: 18px;
    padding-top: 40px;
    
}

.left-menu{
padding: 0;
margin: 0;
margin-top: 110px;
}

.left-menu h2{
	padding: 5px;
	color: #3C4858;
	    margin: 0;
    line-height: 30px;
    font-size: 19px;
    white-space: nowrap;
    opacity: 1;
    display: block;
    height: auto;
    font-weight: normal;
    color: white;
    text-align: center;
    margin-bottom: 8px;
}
.left-menu h2:hover{
	background:rgba(10,10,10,0.3);
}

.left-menu .active h2{
	background: white;
	border-radius: 5px;
	color: #444444;
box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(60, 72, 88, 0.4);
}
.left-menu a:link, a:visited,a:link{
	text-decoration: none;
}

.sidebar .logo-text{
	font-size: 23px;
	font-family: sans-serif;
	text-align: center;
	color: white;
}
         .button {
  display: inline-block;
  padding: 15px 25px;
  
 
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;

  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
  width: 100%;
}
</style>
        
    
</head>
    <body>
        
             
                <nav class="navbar navbar-inverse" style="position:fixed;width:100%;float:right;height: 8%;z-index: 1.5;background-color: #E5EC98   ">
  <div class="container-fluid" >
   
   
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="logout" style="color: black"><span class="glyphicon glyphicon-log-in" style="color: black"></span> Logout</a></li>
    </ul>
  </div>
</nav>
        
        <div class="sidebar" style="background-image: url(sidebar-1.jpg);z-index: 0.5">
		<div class="sidebar-background" >
			<h2 class="logo-text">
				Online Vehicle Parking System
			</h2>

			<div class="left-menu">
                                <a href="Home.jsp"><h2>Home</h2></a>
				<a  href="Slotbook.jsp"><h2>Book your slot</h2></a>
				<a  href="BookingHistory.jsp"><h2>Booking History</h2></a>
                                <a class="active" href="MyRequests.jsp"><h2>My Requests</h2></a>
				
				
			</div>
		</div>
	</div>
        

        
        <br><br><br>
    
              Type something to search the table :</p>  
  <input class="form-control" style="width: 70%;float:right;background-color: white;padding-left: 20px;padding-right: 20px;margin-right: 40px" id="myInput" type="text" placeholder="Search..">
  <br><br><br>
  <table class="table table-bordered table-striped"  border="1"  style="width: 70%;float:right;background-color: white;padding-left: 20px;padding-right: 20px;margin-right: 40px">
            <tr>
                <th>Sr.NO</th>
                <th>Email</th>
                <th>Arrival date</th>
                <th>Days</th>
                <th>Request status</th>
            </tr>
            
            <tbody id="myTable">
        <%
             if(request.getSession().getAttribute("id")==null)
            {
                
                response.sendRedirect("DriverLogin.jsp");
            }
             else
             {
            
            request.getSession().setAttribute("id", request.getSession().getAttribute("id"));
            request.getSession().setAttribute("type", request.getSession().getAttribute("type"));
        
            
            String email="";
            String adate="";
            int days=0;
            int i=0;
            String id=request.getSession().getAttribute("id").toString();
            String type=request.getSession().getAttribute("type").toString();
            
            String q="";
            Statement stmt=null,stmt2,st3;
            String st="";
            String col="";
            
            try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    stmt=con.createStatement(); 
                    stmt2=con.createStatement(); 
                    st3= con.createStatement();
                    
        }catch(Exception e){ out.println(e);} 
            if(type.equals("visitor"))
            {
                    
                        q="select * from requests,visitor where visitor.visitor_id=requests.visitor_id and visitor.visitor_id="+id;
                    ResultSet rs=stmt.executeQuery(q);  
                    
                    while(rs.next()) 
                    { 
                       i++;
                       email=rs.getString("email");
                       adate=rs.getString("arrival_date");
                       days=rs.getInt("days");
                       st="PENDING";
                       col="red";
        
            
        %>
        
        
        
        <tr>
                        <td><%= i%></td>
                        <td><%= email%></td>
                        <td><%=adate%></td>
                        <td><%=days%></td>
                        
                       

                        
                        <td style="background-color: <%= col %>;color:white;font-size: 15px;font-weight:bold"><% out.print(st); %></td>
                           
                           
                            
                        
                       
                        
                    </tr>
                    
                        
                    <%
                        }

                        q="select * from guestList where email in (select email from visitor where visitor_id="+id+")";
                     rs=stmt.executeQuery(q);  
                    
                    while(rs.next()) 
                    { 
                       i++;
                       email=rs.getString("email");
                       adate=rs.getString("A_date");
                       days=rs.getInt("days");
                       st="ACCEPTED";
                       col="skyblue";
        
            
        %>
        
        
        
        <tr>
                        <td><%= i%></td>
                        <td><%= email%></td>
                        <td><%=adate%></td>
                        <td><%=days%></td>
                        
                       

                        
                        <td style="background-color: <%= col %>;color:white;font-size: 15px;font-weight:bold"><% out.print(st); %></td>
                           
                           
                            
                        
                       
                        
                    </tr>
                    
                    <%
                        }

        }
}
                        %>
                        
            </tbody>
  </table>
                        
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

