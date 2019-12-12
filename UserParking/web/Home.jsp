<%-- 
    Document   : Home
    Created on : 28 Sep, 2019, 11:05:52 PM
    Author     : akshay
--%>

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
       <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}


             
             
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
    <body >
        
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            if(request.getSession().getAttribute("id")==null)
            {
                
                response.sendRedirect("DriverLogin.jsp");
            }
            
            
            %>
            
                
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
                                <a class="active" href="Home.jsp"><h2>Home</h2></a>
				<a  href="Slotbook.jsp"><h2>Book your slot</h2></a>
				<a  href="BookingHistory.jsp"><h2>Booking History</h2></a>
                                <a href="MyRequests.jsp"><h2>My Requests</h2></a>
				
				
			</div>
		</div>
	</div>
        <br><br><br>    
        
  <div class="w3-main" style="margin-left:400px;margin-right:40px">      
  <!-- Photo grid (modal) -->
  <div class="w3-row-padding">
    <div class="w3-half">
      <img src="images1/Parking.jpg" style="width:40%"  alt="Concrete meets bricks">
     </div>

   
  </div>

  
  </div>
        

    </body>
</html>
