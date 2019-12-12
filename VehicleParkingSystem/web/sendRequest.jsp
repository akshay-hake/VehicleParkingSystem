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
.container1 {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container1 input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 15;
  left: 10;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container1:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container1 input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container1 input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container1 .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
     
<script>
        function check(){
            var bt=document.getElementById("send");
            var ch=document.getElementById("box");
            
            if(!ch.checked)
            {
                
                bt.style.backgroundColor="#BABFBF";
                bt.disabled=true;
            }
            else
            {
                
                bt.style.backgroundColor="#05F97F ";
                bt.disabled=false;
            }
        }
    </script>
</head>
    <body>
      
        
        
         <div  style="position: inherit">
        <div style="padding-top: 100px" class="wrapper wrapper--w680">
            <div class="card card-4" style="background: #3b5998" >
                <div class="card-body">
                    <h2 class="title1" style="color:white;padding-top:10px;margin-bottom: 50px ">Visitor not in GUEST LIST of this organization !</h2>
                       
                     
                       
                     
                     <br><br>
                     <label class="container1" style="color: white">Do you want to send the request to organization manager?
                     <input id="box" style="float: left" type="checkbox"  onchange="return check()" value="hhh">
                    
                     <span class="checkmark"></span>
                    </label>               
                     <br><br><br>              
                                    
                    
                    <div class="row row-space">
                         
                                
                                    
                                   
                                    <center>
                             <table style=" margin-left: 250px;">
                                        <td>
                                        <form action="DriverLogin.jsp" method="get">
                                            
                                        <input class="button"  style="background-color: red"  type="submit" value="Cancel" >
                                        </form>
                                        </td>
                                        <td  >
                                        <form action="sendRequest" method="get">
                                            
                                             <input class="button" id="send" style="margin-left: 15px;background-color: #BABFBF;width: 100%"  type="submit" value="Send Request" disabled>
                                         </form>
                                         </td>
                                    </table>
                                </center>
                   
                </div>
            </div>
        </div>
         </div>
    </body>
</html>
