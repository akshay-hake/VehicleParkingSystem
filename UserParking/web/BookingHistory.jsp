<%-- 
    Document   : BookingHistory
    Created on : 29 Sep, 2019, 6:00:08 PM
    Author     : akshay
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
     </style>
    </head>
    
    
    
    <body >
        
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
				<a href="Slotbook.jsp"><h2>Book your slot</h2></a>
				<a class="active" href="BookingHistory.jsp"><h2>Booking History</h2></a>
				<a href="MyRequests.jsp"><h2>My Requests</h2></a>
				
			</div>
		</div>
	</div>
        

        
        <br><br><br>
        
     <%
      response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
      
      
            int timeout=session.getMaxInactiveInterval();
           response.setHeader("Refresh", timeout+ "; URL = SessionExpired.jsp");
          if(request.getSession().getAttribute("id")==null)
            {
                
                response.sendRedirect("DriverLogin.jsp");
            }
          else
          {
         
           
         String id=request.getSession().getAttribute("id").toString();
         String type=request.getSession().getAttribute("type").toString();
         
         
        Statement stmt=null;
        Statement stmt2=null;
        String car_no="",booking_id="",pay_id="",slot_no="",at="",dt="",ht="";
        String q;
        String es="disabled";
        String ct="Cancel";
        String disD="disabled";
        String col1="",col2="";
        int e_no=0;
        int i=0;
        int st=0;
        try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    stmt=con.createStatement(); 
                    stmt2=con.createStatement(); 
                    
        }catch(Exception e){ out.println(e);} 
                    if(type.equals("employee"))
                     q="select * from entry_detail,car where entry_detail.car_no=car.car_no and emp_id="+id+" and departure_time>now() and status<>'c' order by arrival_time desc";
                    else
                     q="select * from entry_detail,car where entry_detail.car_no=car.car_no and visitor_id="+id+" and departure_time>now() and status<>'c' order by arrival_time desc";
                    
                    ResultSet rs=stmt.executeQuery(q);  
                    while(rs.next()) 
                    { 
                        st=1;
                        e_no=rs.getInt("entry_no");
                        
                        
                         car_no=rs.getString("car_no");
                        booking_id=String.valueOf(rs.getInt("booking_id"));
                        //pay_id=String.valueOf(rs.getInt("payment_id"));
                        slot_no=String.valueOf(rs.getInt("slot_no"));
                        at=rs.getString("arrival_time");
                        dt=rs.getString("departure_time");
                        
                        String fq="select p_id from payment where entry_no="+e_no;
                    
                        ResultSet res2=stmt2.executeQuery(fq);
                    
                    if(res2.next())
                        pay_id=String.valueOf(res2.getInt("p_id"));
                    
                        String eq="select * from entry_detail where entry_no="+e_no+" and now()>arrival_time and now()<departure_time";
                        res2=stmt2.executeQuery(eq);
                        
                        if(res2.next())
                        {
                            es="";
                            col1="green";
                        }
                        else
                        {
                            es="disabled";
                            col1="grey";
                        }
                        
                        eq="select * from entry_detail where entry_no="+e_no+" and now()<arrival_time and status='n'";
                        res2=stmt2.executeQuery(eq);
                        
                         if(res2.next())
                        {
                            ct="Cancel";
                            col2="red";
                            disD="";
                        }
                        else
                        {
                            ct="Cancel";
                            col2="skyblue";
                            disD="disabled";
                        }
                    
                        

     %> 
    
        <div  style="position: inherit">
        <div style="padding-top: 30px;margin-left: 400px" class="wrapper wrapper--w680">
            <div class="card card-4" style="background: #3b5998" >
                <div class="card-body">
                    <h2 class="title1" style="color:white;padding-top:0px;margin-bottom: 20px ">SLOT NO. <%out.print(slot_no);%></h2>
                        <div class="row row-space">
                            <table class="table table-bordered table-striped"  border="1" id="myTable" style="background: white">
                           
                                <tr>
                                    <td> Car no </td><td> <% out.print(car_no); %></td>
                                </tr>
                               
                            
                                
                            
                                <tr>
                                    <td> Slot no </td><td> <% out.print(slot_no); %></td>
                                </tr>
                               
                            
                                
                            
                                <tr>
                                    <td> Booking id </td><td> <% out.print(booking_id); %></td>
                                </tr>
                               
                              
                                
                            
                                <tr>
                                    <td> Transaction id </td><td> <% out.print(pay_id); %></td>
                                </tr>
                               
                            
                                
                            
                                <tr>
                                    <td> Arrival time</td><td> <% out.print(at); %></td>
                                </tr> 
                               
                            
                                
                            
                                <tr>
                                    <td> Departure time </td><td> <% out.print(dt); %></td>
                                </tr>
                               
                                <br><br>
                                
                            </table>
                                
                            
                   
                </div>
                         
                                
                                
                                    <table style=" margin-left: 300px;">
                                        <td>
                                        <form action="cancelConfirm.jsp" method="get">
                                            <input type="text" name="e_no" value="<%= e_no %>" hidden>
                                        <input class="button"  style="background-color: <%=col2%>"  type="submit" value="<%=ct%>" <%=disD%>>
                                        </form>
                                        </td>
                                        <td  >
                                        <form action="BeforeExtend" method="get">
                                            <input type="text" name="enb" value="<%= e_no %>" hidden>
                                        <input class="button" style="margin-left: 15px;background-color: <%=col1%>" type="submit" value="Extend" <%=es%>>
                                         </form>
                                         </td>
                                    </table>
                                    
                                    
                                               
                                  
    
     </div>
            </div>
        </div>
         </div>
                                
                                              <%     
                        
                    }

                    if(st==0)
                    {

%>
    
        <div  style="position: inherit">
        <div style="padding-top: 30px;margin-left: 400px" class="wrapper wrapper--w680">
            <div class="card card-4" style="background: #3b5998" >
                <div class="card-body">
                    <h2 class="title1" style="color:white;padding-top:0px;margin-bottom: 20px "> You do not have any Booking !</h2>
                    <br><br><br>
                    <input class="button"  style="background-color: skyblue;width: 25%"  type="submit" value="Back" onclick="window.location='Home.jsp'">
                </div>
            </div>
        </div>
        </div>
    
<%
                        
                    }
}
                         
                    
  %>
  
       
    </body>
</html>
