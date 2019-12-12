<%-- 
    Document   : SpotPayment
    Created on : 7 Oct, 2019, 6:29:32 PM
    Author     : akshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   
        
         
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

     
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
    </head>
    <body>

        <%
            int en=Integer.parseInt(request.getParameter("en"));
            String car="",at="",dt="";
            int sn=0;
            int amount=0;
            try {
                    Class.forName("com.mysql.jdbc.Driver");
			
                        
		  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                      
                         Statement stmt=con.createStatement();
                         String q="select * from entry_detail where entry_no="+en;
                         ResultSet res=stmt.executeQuery(q);
                        
                         if(res.next())
                         {
                             car=res.getString("car_no");
                             at=res.getString("arrival_time");
                             dt=res.getString("departure_time");
                             sn=res.getInt("slot_no");
                         }
                         
                         
                           q="select time_to_sec(timediff('"+dt+"','"+at+"'))/3600*10";
                           res=stmt.executeQuery(q);  
                            if(res.next()) 
                            {

                                amount=(int)Double.parseDouble(res.getString(1));

                            }
                         
                         
                        con.close();  
                    }catch(Exception e){ out.println(e);} 
		

            %>

      
           
            <div class="row">
  <div class="col-75">
    <div class="container">
       <form action="SpotPay" method="get" >
            
    <div class="row">
          <div class="col-50">
            
              
              <h3>Slot information</h3>
            <label for="fname"><i class="fa fa-car"></i> Car no</label>
            <input type="text" id="cn" name="cn" value="<%= car %>" disabled>
            <label ><i class="fa fa-bandcamp "></i> Slot no</label>
            <input type="text" id="sn" name="sn" value="<%= sn %>" disabled>
            <label ><i class="fa fa-clock-o"></i> Arrival time</label>
            <input type="text" id="atime" name="atime" value="<%= at %>" disabled>
            <label ><i class="fa fa-clock-o"></i> Departure time</label>
            <input type="text" id="dtime" name="dtime" value="<%= dt %>" disabled>
              
        
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="fname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            
            <input type="text" id="entryno" name="entryno" value="<%=en%>" hidden>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
              <i class="fa fa-google-wallet" style="color:lightgreen;"></i>
              <i class="fa fa-credit-card" style="color:darkgray;"></i>
              <i class="fa fa-paypal" style="color:navy;"></i>
              
            </div>
            <label for="ptype">Payment method</label>
            <select name="ptype">
                                    <option disabled="disabled" selected="selected">Choose option</option>
                                    <option>Debit card</option>
                                    <option>Credit card </option>
                                    <option>Net banking </option>
                                    
                                </select>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        
        <input type="submit" value="Confirm" class="btn">
        
        <input type="text" name="amount" id="am" value="<%= amount %>" hidden>
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Slot <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>
      
      <hr>
      <p>Total <span class="price" style="color:black" ><b id="rs">Rs. <% out.print(amount) ; %></b></span></p>
    </div>
  </div>
</div>
  
</html>
