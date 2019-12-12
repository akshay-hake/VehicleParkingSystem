<%-- 
    Document   : index2
    Created on : 7 Oct, 2019, 8:16:20 PM
    Author     : akshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<body>
<form method="get" action="SendSms.jsp">
Message:<br>
<input type="text" name="message">
<br>
Mobile Number:<br>
<input type="text" name="phone">
<br>
<br><br>
<input type="submit" name="save" value="submit">
</form>
    
    
    <%
        
Parking.sendsms.init();

Parking.sendsms.server = "https://192.168.43.157:8080";

Parking.sendsms.user = "root";

Parking.sendsms.password = "root";

Parking.sendsms.phonenumber = "+919075725194";

Parking.sendsms.text = "This is a test message";

Parking.sendsms.send();
        %>
</body>
</html>
