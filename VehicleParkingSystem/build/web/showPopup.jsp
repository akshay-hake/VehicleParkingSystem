<%-- 
    Document   : showPopup
    Created on : 7 Oct, 2019, 8:37:25 PM
    Author     : akshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            
            alert("Login Id: " + "<%= request.getSession().getAttribute("popid") %>");
            window.location='reg.jsp';
             
            
        </script>
        
         
    </body>
</html>
