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
            
            %>
      
         <div  style="position: inherit">
        <div style="padding-top: 100px" class="wrapper wrapper--w680">
            <div class="card card-4" style="background: #3b5998" >
                <div class="card-body">
                    <h2 class="title1" style="color:white;padding-top:10px;margin-bottom: 50px ">Time extended successfully !</h2>
                        <div class="row row-space">
                         
                                
                                    
                                    <h4 style="color: #ffffff"> New Departure Time =  <% out.println(request.getSession().getAttribute("edt")); %></h4>
                                    <br>
                                    
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
