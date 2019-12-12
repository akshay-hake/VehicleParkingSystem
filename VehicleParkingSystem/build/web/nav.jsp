<%-- 
    Document   : nav
    Created on : 19 Sep, 2019, 11:11:44 PM
    Author     : akshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
   li{
  list-style-type: none;
  margin: 2vw 0;
  
  font-size: 3vh;
}

a{
  text-decoration: none;
  color: black;
  font-family: monospace;

  padding: 2vw;
}

nav{
  width: 100vw;
  background-color: #D6EFFF;
}

ul{
  display: block;
  margin: 0;
  padding: 0;
  
  display: flex;  
}

body{
  margin: 0;
}

button{
  display: none;
}

a:hover{
  background-color: #C6E9FF;
}

@media only screen and (max-width: 500px) {
  ul{
    flex-direction: column;
  }
  
  a{
    display: block;
  }
  
  li{
    margin: 0;
  }
  
  button{
    display: block;
    
    padding: 2vw;
    font-size: 3vh;
    background-color: #AFE0FF;
    border: none;
    outline: none;
    cursor: pointer;
    
    align-self: flex-start;
  }
}
        </style>
        
        
        <script>
            $(document).ready(function(){
  
    $("button").click(function(){

      if($("button").text() == "☰"){
        $("button").text("🞬");
      }else{
        $("button").text("☰");
      }
      
      $("li").toggle("slow");
    });  
});


        </script>
    </head>
    <body>
       
<nav >
  <ul>
      <button>🞬</button>
    <li> 
      <!-- link one -->
      <a href="#aboutMe"> About Me </a>
    </li>
    <li>
      <!-- link two -->
       <a href="#projects"> Projects </a>
    </li>
    <li>
      <!-- link three -->
      <a href="#cv"> CV </a>
    </li>
    <li>
      <!-- link four -->
      <a href="#contacts"> Contacts </a>
    </li>
  </ul>
</nav>

    </body>
</html>
