<%-- 
    Document   : confirm_prebooking
    Created on : 26 Sep, 2019, 11:46:52 PM
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
        
     <style>
         .button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
     </style>
     
    </head>
    <body>
        
        <%
             if(request.getSession().getAttribute("id")==null)
            {
                
                response.sendRedirect("DriverLogin.jsp");
            }
             else
             {
            
            String car_no="",booking_id="",pay_id="",slot_no="",at="",dt="",ht="";
            int eno=Integer.parseInt(request.getSession().getAttribute("eno").toString());
            
            try
            {
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement(); 
                    
                    String q="select * from entry_detail where entry_no="+eno;
                    
                    ResultSet res=stmt.executeQuery(q);
                    
                    if(res.next())
                    {
                        car_no=res.getString("car_no");
                        booking_id=String.valueOf(res.getInt("booking_id"));
                        slot_no=String.valueOf(res.getInt("slot_no"));
                        at=res.getString("arrival_time");
                        dt=res.getString("departure_time");
                    }
                    
                     q="select p_id from payment where entry_no="+eno;
                    
                    res=stmt.executeQuery(q);
                    
                    if(res.next())
                        pay_id=String.valueOf(res.getInt("p_id"));
                    
                    q="select ('0000-01-01' + interval ((TO_SECONDS('"+at+"')+TO_SECONDS('"+dt+"'))/2) second - interval 1 day) as half_time";
                    
                    res=stmt.executeQuery(q);
                    if(res.next())
                        ht=res.getString("half_time");
            }
            catch(Exception e)
            {
                out.print(e);
            }
            
            %>
         <div  style="position: inherit">
        <div style="padding-top: 100px" class="wrapper wrapper--w680">
            <div class="card card-4" style="background: #3b5998" >
                <div class="card-body">
                    <h2 class="title1" style="color:white;padding-top:10px;margin-bottom: 50px ">Your Booking is confirmed !</h2>
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
                                
                                <h5 style="color:orange">(Be present before <% out.print(ht); %> , Otherwise your booking will be canceled.)</h5>
                                
                        
                                <center>
                               <div style="padding-top: 50px;align-content: center">
                            
                             
                                    <button class="button"  type="submit" onclick="window.location='Home.jsp'">OK </button>
                              
                            </div>
                                </center>
                   
                </div>
            </div>
        </div>
         </div>
                                <% } %>
    </body>
</html>
