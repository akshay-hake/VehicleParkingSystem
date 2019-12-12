<%-- 
    Document   : color
    Created on : 15 Sep, 2019, 1:22:23 PM
    Author     : akshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
           <script src="node_modules/tablefilter/dist/tablefilter/tablefilter.js"></script>
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
       
     <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
        <% String sno="0"; %>
       
        <script>
            
            function time(sn)
            {
                var no=document.getElementById("sn");
                
                no.value=sn;
            }
            function check(id){
                var sn=document.getElementById(id);
                
                
                var no=document.getElementById("sn");
                
                no.value=sn.value;
               
            }
            
            </script>
            
            
            
            
            <style>
                .slot{
                    width: 50px;
                    height: 100px;
                    border: 2px solid black;
                }
                
                            .row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}
            </style>
            
            
           
           
    
    
    
   
        
    </head>
    <body style="overflow-x: hidden">
       
        
         <!-- Grey with black text -->
<nav class="navbar navbar-inverse" style="position: fixed;width: 100%;z-index: 100">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Parking</a>
    </div>
     <ul class="nav navbar-nav">
      <li ><a href="table.jsp">Show Detail </a></li>
     
      <li ><a href="reg.jsp" >Register</a></li>
      <li class="active"><a href="view.jsp">Show Layout</a></li>
      <li><a href="DriverLogin.jsp">Login page</a></li>
      <li><a href="Pre_booking.jsp">Pre-Booking</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
        
        
         
         
        <% 
            
            
            String col[]=new String[50];
          
    
           int b4=0,a4=16,b2=0,a2=16,rb=0,ra=16;
            String ad,at,dd="2019-08-16",dt;
            
            
            
            dd=request.getSession().getAttribute("dd").toString();
            ad=request.getSession().getAttribute("ad").toString();
            at=request.getSession().getAttribute("at").toString();
            
            dt=request.getSession().getAttribute("dt").toString();
            
            
            
            
            int i=1;
            for(i=1;i<50;i++)
                col[i]="#ffffff";
            i=1;
            try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement();  
                    String q="select slot_no from entry_detail where status<>'c' and ((arrival_time<=STR_TO_DATE('"+dd+" "+ dt+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+dd+" "+dt+"', '%Y-%m-%d %H:%i:%s'))  or (arrival_time<=STR_TO_DATE('"+ad+" "+ at+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+ad+" "+at+"', '%Y-%m-%d %H:%i:%s')) or (arrival_time>=STR_TO_DATE('"+ad+" "+ at+"', '%Y-%m-%d %H:%i:%s') and departure_time<=STR_TO_DATE('"+dd+" "+dt+"', '%Y-%m-%d %H:%i:%s')))";
                    ResultSet rs=stmt.executeQuery(q);  
                    while(rs.next()) 
                    {
                        int c=rs.getInt("slot_no");
                        
                            col[c]="#ff0000";
                        
                        
                    }
                    
                    q="select sum(case when slot_no<=16 then 1 else 0 end) as reserved,sum(case when (slot_no>=17 and slot_no<=32) then 1 else 0 end) as 4w,sum(case when slot_no>=33 then 1 else 0 end) as 2w from entry_detail where status<>'c' and ((arrival_time<=STR_TO_DATE('"+dd+" "+ dt+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+dd+" "+dt+"', '%Y-%m-%d %H:%i:%s'))  or (arrival_time<=STR_TO_DATE('"+ad+" "+ at+"', '%Y-%m-%d %H:%i:%s') and departure_time>=STR_TO_DATE('"+ad+" "+at+"', '%Y-%m-%d %H:%i:%s')) or (arrival_time>=STR_TO_DATE('"+ad+" "+ at+"', '%Y-%m-%d %H:%i:%s') and departure_time<=STR_TO_DATE('"+dd+" "+dt+"', '%Y-%m-%d %H:%i:%s')))";
                    rs=stmt.executeQuery(q);  
                   if(rs.next()) 
                    {
                       rb=rs.getInt(1);
                       b4=rs.getInt(2);
                       b2=rs.getInt(3);
                       
                       ra=16-rb;
                       a4=16-b4;
                       a2=16-b2;
                        
                    }
                         
                        con.close();  
                    }catch(Exception e){ out.println(e);}  



                    
            
            
         %>
           
         <form  action="show2" method="get" style="padding-top: 100px">
              <div class="row">
  <div class="col-75">
    <div class="container">
               <table >
                 <tr>
                     <td><div style="padding-left: 40px">
                
              <table>
                <tr>
            <div class="row row-space">
                <td>
                            <div class="col-2">
                                                   <div class="input-group">   
                                                       <label>Arrival Date </label> <input class="input--style-4" type="date" name="ad" value="<%= ad %>">
               </div>
                            </div>
                </td>
                <td>
                            <div class="col-2">
                                <div class="input-group">
                                    <label>Arrival time</label>  <input class="input--style-4" type="time" name="at" value="<%= at %>">
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
                                    <label> Departure Date</label>  <input  class="input--style-4" type="date" name="dd" value="<%= dd %>">
             </div>
                            </div>
                  </td>
                  <td>
                            <div class="col-2">
                                <div class="input-group">
                                    <label>Departure time</label><input class="input--style-4" type="time" name="dt" value="<%=dt %>">
            </div>
                            </div>
                  </td>
                        </div>
        </tr>
            
           
            </table>
                         </div></td>
            
                         <td> <div >

     

     <p>___________________________________________________________________</p><strong>
    <hr class="my-4">

    <div>
      <canvas id="pieChart" style="max-width: 500px;"></canvas>
    </div>

  </strong>
    </div>
            
             <!-- JQuery -->
    <script type="text/javascript" src="js3/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js3/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js3/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js3/mdb.min.js"></script>



    <script type="text/javascript">
      //pie
      var ctxP = document.getElementById("pieChart").getContext('2d');
      var myPieChart = new Chart(ctxP, {
        type: 'pie',
        data: {
          labels: ["Reserved Booked","Reserved Available","4-wheeler Booked", "4-wheeler available", "2-wheeler Booked", "2-wheeler available"],
          datasets: [{
            data: [<%= rb %>, <%= ra %>,<%= b4 %>, <%= a4 %>, <%= b2 %>, <%= a2 %>],
            backgroundColor: ["#EC33FF ","#2BB3A9  ","#ff0000", "#00ff00", "#FF8033", "#33FFFF "],
            hoverBackgroundColor: [ "#F033FF ","#34A29A  ","#cc0000", "#00cc00", "#FFA233 ", "#33FFBB "]
          }]
        },
        options: {
          responsive: true
        }
      });
    </script>
    
    <br><br>
    
    <p>___________________________________________________________________</p>
                         </td>
                 </tr>
             </table>
            <br>
             
            <input class="btn btn--radius-2 btn--blue" style="width:25%;margin-left: 50px" type="submit" name="ok" value="OK" onclick="time(0)">
            </div>
  </div>
                       </div>
            <br><br>
            
             <div class="row">
  <div class="col-75">
    <div class="container">
            
        <center>
            Reserved slots..
            <br><br>
            <input class="slot" type="submit" id="ba1" value="1" style="background-color:<%= col[1] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="ba2" value="2" style="background-color:<%= col[2] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="ba3" value="3" style="background-color:<%= col[3] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="ba4" value="4" style="background-color:<%= col[4] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="ba5" value="5" style="background-color:<%= col[5] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="ba6" value="6" style="background-color:<%= col[6] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="ba7" value="7" style="background-color:<%= col[7] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="ba8" value="8" style="background-color:<%= col[8] %> " onclick="check(id)" >
            <br><br>
            <input class="slot" type="submit" id="bb1" value="9" style="background-color:<%= col[9] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bb2" value="10" style="background-color:<%= col[10] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bb3" value="11" style="background-color:<%= col[11] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bb4" value="12" style="background-color:<%= col[12] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bb5" value="13" style="background-color:<%= col[13] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bb6" value="14" style="background-color:<%= col[14] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bb7" value="15" style="background-color:<%= col[15] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bb8" value="16" style="background-color:<%= col[16] %> " onclick="check(id)" >
            
            <br><br><br><br><br><br>
            4-Wheeler slots..
            <br><br>
            <input class="slot" type="submit" id="bc1" value="17" style="background-color:<%= col[17] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bc2" value="18" style="background-color:<%= col[18] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bc3" value="19" style="background-color:<%= col[19] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bc4" value="20" style="background-color:<%= col[20] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bc5" value="21" style="background-color:<%= col[21] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bc6" value="22" style="background-color:<%= col[22] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bc7" value="23" style="background-color:<%= col[23] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bc8" value="24" style="background-color:<%= col[24] %> " onclick="check(id)" >
            <br><br>
            <input class="slot" type="submit" id="bd1" value="25" style="background-color:<%= col[25] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bd2" value="26" style="background-color:<%= col[26] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bd3" value="27" style="background-color:<%= col[27] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bd4" value="28" style="background-color:<%= col[28] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bd5" value="29" style="background-color:<%= col[29] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bd6" value="30" style="background-color:<%= col[30] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bd7" value="31" style="background-color:<%= col[31] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bd8" value="32" style="background-color:<%= col[32] %> " onclick="check(id)" >
            
            <br><br><br><br><br><br>
            2-wheeler slots..
            <br><br>
            <input class="slot" type="submit" id="be1" value="33" style="background-color:<%= col[33] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="be2" value="34" style="background-color:<%= col[34] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="be3" value="35" style="background-color:<%= col[35] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="be4" value="36" style="background-color:<%= col[36] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="be5" value="37" style="background-color:<%= col[37] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="be6" value="38" style="background-color:<%= col[38] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="be7" value="39" style="background-color:<%= col[39] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="be8" value="40" style="background-color:<%= col[40] %> " onclick="check(id)" >
            <br><br>
            <input class="slot" type="submit" id="bf1" value="41" style="background-color:<%= col[41] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bf2" value="42" style="background-color:<%= col[42] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bf3" value="43" style="background-color:<%= col[43] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bf4" value="44" style="background-color:<%= col[44] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bf5" value="45" style="background-color:<%= col[45] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bf6" value="46" style="background-color:<%= col[46] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bf7" value="47" style="background-color:<%= col[47] %> " onclick="check(id)" >
            <input class="slot" type="submit" id="bf8" value="48" style="background-color:<%= col[48] %> " onclick="check(id)" >
            
            <br><br><br><br><br><br>
            
            <input type="text" id="sn" name="sn" value="0" hidden>
            
           
             
            
            
            
              </center>
            
            
            
            
    </div>
  </div>
             </div>
           
            
            </form>
            
            
            
      
        
            
    </body>
</html>
