<%-- 
    Document   : confirm_prebooking
    Created on : 26 Sep, 2019, 11:46:52 PM
    Author     : akshay
--%>

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
        
    
    </head>
    <body>
         <div  style="position: inherit">
        <div style="padding-top: 100px" class="wrapper wrapper--w680">
            <div class="card card-4" style="background: skyblue" >
                <div class="card-body">
                    <h2 class="title1" style="color:white;padding-top:10px ">Confirmation</h2>
                    <form  method="get" action="PreBooking">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label style="padding-top: 30px" >Enter your Car_no</label>
                                    
                                    <input class="input--style-4" style="position: relative" type="text" name="car">
                                </div>
                                
                                <div class="input-group">
                                    <label >Enter your Booking id</label>
                                    
                                    <input class="input--style-4" style="position: relative" type="number" name="bid">
                                </div>
                            </div>
                        </div>
                        
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
         </div>
    </body>
</html>
