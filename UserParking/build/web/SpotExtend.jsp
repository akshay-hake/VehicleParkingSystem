<%-- 
    Document   : SpotExtend
    Created on : 7 Oct, 2019, 10:54:21 AM
    Author     : akshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
            
     <style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
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
  padding: 0 16px;
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

        <script>
function myFunction() {
  var x = document.getElementById("time").selectedIndex;
  var y = document.getElementById("time").options;
  var amount="Rs. 5";
  if(y[x].index===0)
  {
      amount="Rs. 5";
        document.getElementById("am").value=5;
  }
  
  else if(y[x].index===1)
  {
      amount="Rs. 10";
        document.getElementById("am").value=10;
  }
  
  else if(y[x].index===2)
  {
      amount="Rs. 20";
        document.getElementById("am").value=20;
  }
  
  document.getElementById("rs").innerHTML = amount;

}
</script>
    </head>
    <body>
        <%
             if(request.getSession().getAttribute("id")==null)
            {
                
                response.sendRedirect("DriverLogin.jsp");
            }
             else
             {
            request.getSession().setAttribute("extendType", 0);
             }
            %>
                  <div class="row">
  <div class="col-75">
    <div class="container">
       <form action="extend" method="get" >
            
    <div class="row">
          <div class="col-50">
            <label >Select Time Interval</label>
            <select id="time" name="time" class="form-control form-control-lg" onclick="myFunction()" >
                <option value="1800" <%= request.getSession().getAttribute("1t") %> >30 MINUTES</option>
                <option value="3600" <%= request.getSession().getAttribute("2t") %> >1 HOUR</option>
                <option value="7200" <%= request.getSession().getAttribute("3t") %> >2 HOUR</option>
            </select>
          </div>
    </div>
                 <input type="submit" value="Confirm" class="btn">
        
        <input type="text" name="amount"  id="am" value="50" hidden>
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Slot <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>
      
      <hr>
      <p>Total <span class="price" style="color:black" ><b id="rs">Rs. 5</b></span></p>
    </div>
  </div>
</div>
    </body>
</html>
