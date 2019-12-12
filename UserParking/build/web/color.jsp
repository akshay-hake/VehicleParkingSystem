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
        
        <% String sno="0"; %>
       
        <script>
            
            var val;
            function showPopup()
            {
               
            var popup1= '<%= request.getSession().getAttribute("popup") %>';
            
            if(popup1==="ok")
            {
                
            }
            else {
             alert(popup1);   
	
            }
            
        }

            function changeColor(id)
            {
                
                var allCol=["ba1","ba2","ba3","ba4","ba5","ba6","ba7","ba8","bb1","bb2","bb3","bb4","bb5","bb6","bb7","bb8","bc1","bc2","bc3","bc4","bc5","bc6","bc7","bc8","bd1","bd2","bd3","bd4","bd5","bd6","bd7","bd8","be1","be2","be3","be4","be5","be6","be7","be8","bf1","bf2","bf3","bf4","bf5","bf6","bf7","bf8"];
                
                var i;
                var col;
                var bt;
                for(i=0;i<allCol.length;i++)
                {
                  bt=document.getElementById(allCol[i]);
                  col=bt.style.backgroundColor;  
                  if(col==="rgb(0, 255, 0)" && allCol[i]!==id)
                        bt.style.backgroundColor="#ffffff";  
                }
                bt=document.getElementById(id);
                col=bt.style.backgroundColor;
                
                var val=bt.value;
                
                var book=document.getElementById("par");
                book.value=val;
                
                
                
                
                
                
               
               
                if(col==="rgb(255, 255, 255)")
                {
                        bt.style.backgroundColor="#00ff00";
            
                }
                else if(col==="rgb(0, 255, 0)")
                {
                        bt.style.backgroundColor="#ffffff";
                        book.value="0";
                }
                    
                   
                  
                    
                    return true;
                
                
                
            }
            
            function check(){
                var no=document.getElementById("par");
                
                if(no==="0")
                    return false;
                
                return true;
            }
            
            </script>
            
            
            
            
            <style>
                .slot{
                    width: 50px;
                    height: 100px;
                    border: 2px solid black;
                }
     
        a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
  margin-top: 5px;
}

a:hover {
  background-color: greenyellow;
  color: black;
}

.previous {
  background-color: skyblue;
  color: black;
}

.next {
  background-color: #4CAF50;
  color: white;
}

.round {
  border-radius: 50%;
}



* {
  box-sizing: border-box;
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
  padding: 0 65px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

select {
    width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
    </style>
    </head>
    
    <body style="overflow-x:hidden">
        
                               <nav class="navbar navbar-inverse" style="position:fixed;width:100%;float:right;height: 8%;z-index: 1.5;background-color: #E5EC98   ">
  <div class="container-fluid" >
   
     
   
       <a href="Slotbook.jsp" class="previous round" style="font-size: 15px;font-weight:bold">&laquo Back </a>
       <a href="Home.jsp" style="font-size: 15px;font-weight:bold;margin-top: 8px">Home</a>
    
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="logout" style="color: black"><span class="glyphicon glyphicon-log-in" style="color: black"></span> Logout</a></li>
    </ul>
  </div>
</nav>
        <br><br>
        
        
        <% 
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
             if(request.getSession().getAttribute("id")==null)
            {
                
                response.sendRedirect("DriverLogin.jsp");
            }
            else
             {
            request.getSession().setAttribute("id", request.getSession().getAttribute("id"));
            request.getSession().setAttribute("type", request.getSession().getAttribute("type"));
             String type=request.getSession().getAttribute("type").toString();
             String vc="gray";
              String ec="gray";
            String edis="disabled";
            String vdis="disabled";
             if(type.equals("employee"))
             {
                 edis="";
                 ec="white";
             }
             else
             {
                 vdis="";
                 vc="white";
             }
            
            
            
        
            
            String col[]=new String[50];
            String ad,at,dd="2019-08-16",dt;
            
            
            
            dd=request.getSession().getAttribute("dd").toString();
            ad=request.getSession().getAttribute("ad").toString();
            at=request.getSession().getAttribute("at").toString();
            
            dt=request.getSession().getAttribute("dt").toString();
            
            
            
            
            int i=1;
            for(i=1;i<50;i++)
            {
                if(type.equals("employee") && ((i>=17 && i<=24) || (i>=33 && i<=40)))
                {
                    col[i]="#ffffff";
                }
                else if(type.equals("visitor") && ((i>=25 && i<=32) || (i>=41 && i<=48)))
                {
                    col[i]="#ffffff";
                }
                 
                else
                    col[i]="#c0c0c0";
            }
            
            
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
                         
                        con.close();  
                    }catch(Exception e){ out.println(e);}  


                    
            
            
         %>
  
         <div class="row" style="margin-top: 30px;margin-bottom: 20px" >
  <div class="col-75">
    <div class="container">
         <form action="col" method="get" onsubmit="return check()" >
            <div class="row">
                <div class="col-50" style="padding-top: 50px">
             Reserved slots..
            <br><br>
            <input class="slot" type="button" id="ba1" value="1" style="background-color:<%= col[1] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="ba2" value="2" style="background-color:<%= col[2] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="ba3" value="3" style="background-color:<%= col[3] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="ba4" value="4" style="background-color:<%= col[4] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="ba5" value="5" style="background-color:<%= col[5] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="ba6" value="6" style="background-color:<%= col[6] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="ba7" value="7" style="background-color:<%= col[7] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="ba8" value="8" style="background-color:<%= col[8] %> " onclick="changeColor(id)" disabled>
            <br><br>
            <input class="slot" type="button" id="bb1" value="9" style="background-color:<%= col[9] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="bb2" value="10" style="background-color:<%= col[10] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="bb3" value="11" style="background-color:<%= col[11] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="bb4" value="12" style="background-color:<%= col[12] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="bb5" value="13" style="background-color:<%= col[13] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="bb6" value="14" style="background-color:<%= col[14] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="bb7" value="15" style="background-color:<%= col[15] %> " onclick="changeColor(id)" disabled>
            <input class="slot" type="button" id="bb8" value="16" style="background-color:<%= col[16] %> " onclick="changeColor(id)" disabled>
            
            <br><br><br><br><br><br>
            4-wheeler slots..
            <br><br>
            
            <input class="slot" type="button" id="bc1" value="17" style="background-color:<%= col[17] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="bc2" value="18" style="background-color:<%= col[18] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="bc3" value="19" style="background-color:<%= col[19] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="bc4" value="20" style="background-color:<%= col[20] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="bc5" value="21" style="background-color:<%= col[21] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="bc6" value="22" style="background-color:<%= col[22] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="bc7" value="23" style="background-color:<%= col[23] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="bc8" value="24" style="background-color:<%= col[24] %> " onclick="changeColor(id)" <%= edis %>>
            <br><br>
            <input class="slot" type="button" id="bd1" value="25" style="background-color:<%= col[25] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bd2" value="26" style="background-color:<%= col[26] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bd3" value="27" style="background-color:<%= col[27] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bd4" value="28" style="background-color:<%= col[28] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bd5" value="29" style="background-color:<%= col[29] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bd6" value="30" style="background-color:<%= col[30] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bd7" value="31" style="background-color:<%= col[31] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bd8" value="32" style="background-color:<%= col[32] %> " onclick="changeColor(id)" <%= vdis %>>
            
            <br><br><br><br><br><br>
            2-wheeler slots..
            <br><br>
            <input class="slot" type="button" id="be1" value="33" style="background-color:<%= col[33] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="be2" value="34" style="background-color:<%= col[34] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="be3" value="35" style="background-color:<%= col[35] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="be4" value="36" style="background-color:<%= col[36] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="be5" value="37" style="background-color:<%= col[37] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="be6" value="38" style="background-color:<%= col[38] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="be7" value="39" style="background-color:<%= col[39] %> " onclick="changeColor(id)" <%= edis %>>
            <input class="slot" type="button" id="be8" value="40" style="background-color:<%= col[40] %> " onclick="changeColor(id)" <%= edis %>>
            <br><br>
            <input class="slot" type="button" id="bf1" value="41" style="background-color:<%= col[41] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bf2" value="42" style="background-color:<%= col[42] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bf3" value="43" style="background-color:<%= col[43] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bf4" value="44" style="background-color:<%= col[44] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bf5" value="45" style="background-color:<%= col[45] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bf6" value="46" style="background-color:<%= col[46] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bf7" value="47" style="background-color:<%= col[47] %> " onclick="changeColor(id)" <%= vdis %>>
            <input class="slot" type="button" id="bf8" value="48" style="background-color:<%= col[48] %> " onclick="changeColor(id)" <%= vdis %>>
            
            <br><br><br><br><br><br>
            </div>
            
           
            <div  class="col-50" style="padding-top: 80px" >
            
            Car No :<input type="text" name="car_no" id="car_no"  >
            <br><br>
            
            Slot no :<input type="text" name="sno" id="par" value=<%= sno %>  readonly> 
            
             
            
            
             <input type="hidden" name="arrival_date" value="<%= ad %>">   <input type="hidden" name="arrival_time" value="<%= at %>">
            <br><br>
            
           <input type="hidden" name="departure_date" value="<%= dd %>">  <input type="hidden" name="departure_time" value="<%= dt %>">
            <br><br>
            
            
            <input type="submit" value="Done">
            
            </div>
            </div>
            
            
            </form>
    </div>
  </div>
         </div>
            
            
            
            
            
      <% } %>
        
            
    </body>
</html>
