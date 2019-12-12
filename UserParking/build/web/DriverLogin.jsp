<%-- 
    Document   : DriverLogin
    Created on : 20 Sep, 2019, 7:16:57 PM
    Author     : akshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           
        
   <style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-image:url("2.jpg");
	background-color: black;
	color: white;
	text-shadow: 4px 4px 6px navy; 
}
h1{
	color :white;
text-shadow: 4px 4px 6px navy;  
}



.container {
    padding: 16px;
  
    background-color: ECECF3;
}

input[type=text], input[type=password], input[type=number] {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background: #c0c0c0;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
}

input {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background: #856404;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
    color: black;
}

select {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background: #c0c0c0;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
    color: black;
}

options {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background: black;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
    color: white;
}

.pwd {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    background: black;
    box-sizing: border-box;
    border: 2px solid blue;
    border-radius: 4px;
}


input:focus {
    background-color: #f0f0f0;
}

select:focus {
    background-color: #f0f0f0;
}

.registerbtn {
    background-color:#090468   ;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    cursor: pointer;
    width: 18%;
    opacity: 0.9;
     box-sizing: border-box;
    border: 2px solid white;
    border-radius: 4px;
}


.registerbtn:hover {
    opacity: 1;
}


</style>

<script>
function show() {
    
       
    
       var ty=document.getElementById("Type").value;
    
       
       
       if(ty==="visitor")
       {
            document.getElementById("dis").style.display = "block";
            
        }
       else
           document.getElementById("dis").style.display = "none";
}

</script>
</head>
<body style="background-color: white">
    
 
    <form action="DLogin" method="get" style="border:2px solid white;margin: 100px;background-color: gray">
  <div class="container">
<center>





    <h1>Login</h1>
    

    <label for="login"><b>Login Id</b></label><br>
    <input type="number" placeholder="Enter Login Id" name="login" required>
	<br>
    <label for="psw"><b>Password</b></label><br>
    <input  type="password" placeholder="Enter Password" name="psw" required>
    <br>
    
    <label for="Type"><b>Type</b></label><br>
    <select id="Type" name="Type" onChange="show()">
				<option value="employee">Employee</option>
				<option value="visitor">Visitor</option>
                                <option value="organization">Organization</option>
			</select>
    
    <br>
    
    <div id="dis" style="display: none">
    <label for="comp"><b>Company</b></label><br>
    <select id="comp" name="comp" >
				<option value="XYZ">XYZ</option>
				<option value="ABC">ABC</option>
                                
			</select>
    </div>
    
    <br>
    

    <button type="submit" class="registerbtn"><b>LOGIN</b></button>
</center>
  </div>
</body>
</html>
