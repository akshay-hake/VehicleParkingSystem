<%-- 
    Document   : Slotbook
    Created on : 17 Sep, 2019, 7:27:56 PM
    Author     : akshay
--%>

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

                   <script type="text/javascript">

         function validation() {
            			var dateTextO = document.getElementById("adate");
            			var timeTextO = document.getElementById("atime");
            			var errDateTimeMsgO = document.getElementById("dateTimeAlert");

        var currentDate = new Date();
        	var day = currentDate.getDate();
        	var month = currentDate.getMonth() + 1;
        	var year = currentDate.getFullYear();
        	
        	var currentTime = new Date();
        	var hours = currentTime.getHours();
        	var minutes = currentTime.getMinutes();
        	if (minutes < 10){
        	minutes = "0" + minutes;
        	}
        	if (hours < 10){
        	hours = "0" + hours;
        	}
        	
        	if((dateTextO < currentDate) && (timeTextO < currentTime)){
        		errDateTimeMsgO.innerHTML = "The Date and Time you have selected is before the Current Date and Time";
        	} else {
        		errDateTimeMsgO.innerHTML = "";
        	}

                }
                
           function ddV()
           {
               var ad = document.getElementById("adate");
               var dd = document.getElementById("ddate");
               var at = document.getElementById("atime");
               var dt = document.getElementById("dtime");
               
               var cd=new Date();
               var d=cd.getDate();
               var mon =cd.getMonth()+1;
        	if (mon < 10){
        	mon = "0" + mon;
        	}
        	if (d < 10){
        	d = "0" + d;
        	}
               var checkD=cd.getFullYear()+"-"+mon+"-"+d;
               
               var h=cd.getHours();
               var m=cd.getMinutes();
               var s=cd.getSeconds();
               
               var mt=h+":"+m;
               
               
               
               dd.min=ad.value;
               
               
               
               if(ad.value===checkD)
               {
                    at.min=mt;
               }
               
               
           }
        </script>
        
    
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
				<a class="active" href="Slotbook.jsp"><h2>Book your slot</h2></a>
				<a  href="BookingHistory.jsp"><h2>Booking History</h2></a>
                                 <a href="MyRequests.jsp"><h2>My Requests</h2></a>
				
				
			</div>
		</div>
	</div>
        

        
        <br><br><br>
        <%
            
             if(request.getSession().getAttribute("id")==null)
            {
                
                response.sendRedirect("DriverLogin.jsp");
            }
             else
             {
            
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
        
 
                    <center>

                        <form action="slotbook" method="get" style="padding-top: 100px;padding-left: 100px;padding-right: 100px " >
            <table>
                <tr>
            <div class="row row-space">
                <td>
                            <div class="col-2">
                                                   <div class="input-group">   
                                                       <label>Arrival Date </label> <input class="input--style-4" type="date" min="<%=at%>" id="adate" name="arrival_date" value="<%= at %>" onchange="ddV()">
               </div>
                            </div>
                </td>
                <td>
                            <div class="col-2">
                                <div class="input-group">
                                    <label>Arrival time</label>  <input class="input--style-4" type="time" id="atime" name="arrival_time" min="" value="<%= ct %>">
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
                                    <label> Departure Date</label>  <input  class="input--style-4" id="ddate" type="date" min="<%=at%>" name="departure_date">
             </div>
                            </div>
                  </td>
                  <td>
                            <div class="col-2">
                                <div class="input-group">
                                    <label>Departure time</label><input class="input--style-4" id="dtime" type="time" name="departure_time">
            </div>
                            </div>
                  </td>
                        </div>
        </tr>
            
           
            </table>
               <br>
               
              
            <input class="btn btn--radius-2 btn--blue" style="width: 100px " type="submit" name="ok" value="OK">
    </form>
                
                    </center>
                                    <%
                                        }
                                        %>
    </body>

