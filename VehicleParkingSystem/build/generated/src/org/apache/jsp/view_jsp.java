package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class view_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("          <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\n");
      out.write("           <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n");
      out.write("           <script src=\"node_modules/tablefilter/dist/tablefilter/tablefilter.js\"></script>\n");
      out.write("           \n");
      out.write("            <link href=\"vendor/mdi-font/css/material-design-iconic-font.min.css\" rel=\"stylesheet\" media=\"all\">\n");
      out.write("    <link href=\"vendor/font-awesome-4.7/css/font-awesome.min.css\" rel=\"stylesheet\" media=\"all\">\n");
      out.write("    <!-- Font special for pages-->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Vendor CSS-->\n");
      out.write("    <link href=\"vendor/select2/select2.min.css\" rel=\"stylesheet\" media=\"all\">\n");
      out.write("    <link href=\"vendor/datepicker/daterangepicker.css\" rel=\"stylesheet\" media=\"all\">\n");
      out.write("\n");
      out.write("    <!-- Main CSS-->\n");
      out.write("    <link href=\"css/main.css\" rel=\"stylesheet\"> \n");
      out.write("     <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("       \n");
      out.write("   \n");
      out.write("    <!-- Font Awesome -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("   \n");
      out.write("        \n");
      out.write("        ");
 String sno="0"; 
      out.write("\n");
      out.write("       \n");
      out.write("        <script>\n");
      out.write("            \n");
      out.write("          \n");
      out.write("            function check(id){\n");
      out.write("                var sn=document.getElementById(id);\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                var no=document.getElementById(\"sn\");\n");
      out.write("                \n");
      out.write("                no.value=sn.value;\n");
      out.write("               \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            function time(id){\n");
      out.write("               \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                var no=document.getElementById(\"sn\");\n");
      out.write("                \n");
      out.write("                no.value=id;\n");
      out.write("               \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            </script>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <style>\n");
      out.write("                .slot{\n");
      out.write("                    width: 50px;\n");
      out.write("                    height: 100px;\n");
      out.write("                    border: 2px solid black;\n");
      out.write("                }\n");
      out.write("            </style>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("           \n");
      out.write("           \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("   \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("    \n");
      out.write("        \n");
      out.write("         <!-- Grey with black text -->\n");
      out.write("<nav class=\"navbar navbar-inverse\" style=\"position:fixed;width:100%;z-index: 100\">\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    <div class=\"navbar-header\">\n");
      out.write("      <a class=\"navbar-brand\" href=\"#\">Parking</a>\n");
      out.write("    </div>\n");
      out.write("    <ul class=\"nav navbar-nav\">\n");
      out.write("      <li><a href=\"table.jsp\">Show Detail </a></li>\n");
      out.write("     \n");
      out.write("      <li><a href=\"reg.jsp\">Register</a></li>\n");
      out.write("      <li class=\"active\"><a href=\"view.jsp\">Show Layout</a></li>\n");
      out.write("      <li><a href=\"DriverLogin.jsp\">Book slot</a></li>\n");
      out.write("      <li><a href=\"Pre_booking.jsp\">Pre-Booking</a></li>\n");
      out.write("      <li><a href=\"#\">Collect Payment</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li>\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-log-in\"></span> Logout</a></li>\n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</nav>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("         \n");
      out.write("         \n");
      out.write("        ");
 
            
            
            String col[]=new String[50];
           
            
            
            String ad="",at="";
            
           
            int i=1;
            for(i=1;i<50;i++)
                col[i]="#ffffff";
            i=1;
            try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement();  
                    
                    String q="select curdate(),curtime()";
                     ResultSet rs=stmt.executeQuery(q);
                     String time="";
                     if(rs.next())
                     {
                         ad=rs.getString(1);
                         at=rs.getString(2);
                         time=rs.getString(1)+" "+rs.getString(2);
                         
                     }
                    
                    q="select slot_no from entry_detail where arrival_time<='"+time+"' and departure_time>='"+time+"'";
                    rs=stmt.executeQuery(q);  
                    while(rs.next()) 
                    {
                        int c=rs.getInt("slot_no");
                        
                            col[c]="#ff0000";
                           
                        
                        
                    }
                         
                        con.close();  
                    }catch(Exception e){ out.println(e);}  


                    
            
            
         
      out.write("\n");
      out.write("         \n");
      out.write("         \n");
      out.write("                 <div style=\"padding-left: 800px\">\n");
      out.write("\n");
      out.write("      <p class=\"font-weight-bold\">Learn how to create a Bootstrap Pie Chart and see the examples of proper implementation\n");
      out.write("        and customization.\n");
      out.write("\n");
      out.write("      </p>\n");
      out.write("\n");
      out.write("      <p><strong>Detailed documentation and more examples of Charts you can find in our <a href=\"https://mdbootstrap.com/docs/jquery/javascript/charts/\" target=\"_blank\">Bootstrap Charts Docs</a>.</strong></p><strong>\n");
      out.write("\n");
      out.write("    <hr class=\"my-4\">\n");
      out.write("\n");
      out.write("    <div>\n");
      out.write("      <canvas id=\"pieChart\" style=\"max-width: 500px;\"></canvas>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("  </strong>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Start your project here-->\n");
      out.write("\n");
      out.write("    <!-- /Start your project here-->\n");
      out.write("\n");
      out.write("    <!-- SCRIPTS -->\n");
      out.write("    <!-- JQuery -->\n");
      out.write("    <script type=\"text/javascript\" src=\"js3/jquery-3.3.1.min.js\"></script>\n");
      out.write("    <!-- Bootstrap tooltips -->\n");
      out.write("    <script type=\"text/javascript\" src=\"js3/popper.min.js\"></script>\n");
      out.write("    <!-- Bootstrap core JavaScript -->\n");
      out.write("    <script type=\"text/javascript\" src=\"js3/bootstrap.min.js\"></script>\n");
      out.write("    <!-- MDB core JavaScript -->\n");
      out.write("    <script type=\"text/javascript\" src=\"js3/mdb.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("      //pie\n");
      out.write("      var ctxP = document.getElementById(\"pieChart\").getContext('2d');\n");
      out.write("      var myPieChart = new Chart(ctxP, {\n");
      out.write("        type: 'pie',\n");
      out.write("        data: {\n");
      out.write("          labels: [\"Red\", \"Green\", \"Yellow\", \"Grey\", \"Dark Grey\"],\n");
      out.write("          datasets: [{\n");
      out.write("            data: [300, 50, 100, 40, 120],\n");
      out.write("            backgroundColor: [\"#F7464A\", \"#46BFBD\", \"#FDB45C\", \"#949FB1\", \"#4D5360\"],\n");
      out.write("            hoverBackgroundColor: [\"#FF5A5E\", \"#5AD3D1\", \"#FFC870\", \"#A8B3C5\", \"#616774\"]\n");
      out.write("          }]\n");
      out.write("        },\n");
      out.write("        options: {\n");
      out.write("          responsive: true\n");
      out.write("        }\n");
      out.write("      });\n");
      out.write("    </script>\n");
      out.write("    \n");
      out.write("         <form  action=\"show2\" method=\"get\" style=\"padding-left: 0px;padding-top: 100px\">\n");
      out.write("             \n");
      out.write("            \n");
      out.write("              <table>\n");
      out.write("                <tr>\n");
      out.write("            <div class=\"row row-space\">\n");
      out.write("                <td>\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                                   <div class=\"input-group\">   \n");
      out.write("                                                       <label>Arrival Date </label> <input class=\"input--style-4\" type=\"date\" name=\"ad\" value=\"");
      out.print( ad );
      out.write("\">\n");
      out.write("               </div>\n");
      out.write("                            </div>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                <div class=\"input-group\">\n");
      out.write("                                    <label>Arrival time</label>  <input class=\"input--style-4\" type=\"time\" name=\"at\" value=\"");
      out.print( at );
      out.write("\">\n");
      out.write("               </div>\n");
      out.write("                            </div>\n");
      out.write("                </td>\n");
      out.write("                        </div>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("              <div class=\"row row-space\">\n");
      out.write("                  <td>\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                <div class=\"input-group\"> \n");
      out.write("                                    <label> Departure Date</label>  <input  class=\"input--style-4\" type=\"date\" name=\"dd\" value=\"");
      out.print( ad );
      out.write("\">\n");
      out.write("             </div>\n");
      out.write("                            </div>\n");
      out.write("                  </td>\n");
      out.write("                  <td>\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                <div class=\"input-group\">\n");
      out.write("                                    <label>Departure time</label><input class=\"input--style-4\" type=\"time\" name=\"dt\" value=\"");
      out.print(at );
      out.write("\">\n");
      out.write("            </div>\n");
      out.write("                            </div>\n");
      out.write("                  </td>\n");
      out.write("                        </div>\n");
      out.write("        </tr>\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("             \n");
      out.write("            <input class=\"btn btn--radius-2 btn--blue\" type=\"submit\" name=\"ok\" value=\"OK\" onclick=\"time(0)\">\n");
      out.write("            \n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            <div style=\"padding-left: 400px\">\n");
      out.write("             \n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba1\" value=\"1\" style=\"background-color:");
      out.print( col[1] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba2\" value=\"2\" style=\"background-color:");
      out.print( col[2] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba3\" value=\"3\" style=\"background-color:");
      out.print( col[3] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba4\" value=\"4\" style=\"background-color:");
      out.print( col[4] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba5\" value=\"5\" style=\"background-color:");
      out.print( col[5] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba6\" value=\"6\" style=\"background-color:");
      out.print( col[6] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba7\" value=\"7\" style=\"background-color:");
      out.print( col[7] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"ba8\" value=\"8\" style=\"background-color:");
      out.print( col[8] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <br><br>\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb1\" value=\"9\" style=\"background-color:");
      out.print( col[9] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb2\" value=\"10\" style=\"background-color:");
      out.print( col[10] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb3\" value=\"11\" style=\"background-color:");
      out.print( col[11] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb4\" value=\"12\" style=\"background-color:");
      out.print( col[12] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb5\" value=\"13\" style=\"background-color:");
      out.print( col[13] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb6\" value=\"14\" style=\"background-color:");
      out.print( col[14] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb7\" value=\"15\" style=\"background-color:");
      out.print( col[15] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bb8\" value=\"16\" style=\"background-color:");
      out.print( col[16] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            \n");
      out.write("            <br><br><br><br><br><br>\n");
      out.write("            \n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc1\" value=\"17\" style=\"background-color:");
      out.print( col[17] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc2\" value=\"18\" style=\"background-color:");
      out.print( col[18] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc3\" value=\"19\" style=\"background-color:");
      out.print( col[19] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc4\" value=\"20\" style=\"background-color:");
      out.print( col[20] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc5\" value=\"21\" style=\"background-color:");
      out.print( col[21] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc6\" value=\"22\" style=\"background-color:");
      out.print( col[22] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc7\" value=\"23\" style=\"background-color:");
      out.print( col[23] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bc8\" value=\"24\" style=\"background-color:");
      out.print( col[24] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <br><br>\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd1\" value=\"25\" style=\"background-color:");
      out.print( col[25] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd2\" value=\"26\" style=\"background-color:");
      out.print( col[26] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd3\" value=\"27\" style=\"background-color:");
      out.print( col[27] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd4\" value=\"28\" style=\"background-color:");
      out.print( col[28] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd5\" value=\"29\" style=\"background-color:");
      out.print( col[29] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd6\" value=\"30\" style=\"background-color:");
      out.print( col[30] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd7\" value=\"31\" style=\"background-color:");
      out.print( col[31] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bd8\" value=\"32\" style=\"background-color:");
      out.print( col[32] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            \n");
      out.write("            <br><br><br><br><br><br>\n");
      out.write("            \n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be1\" value=\"33\" style=\"background-color:");
      out.print( col[33] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be2\" value=\"34\" style=\"background-color:");
      out.print( col[34] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be3\" value=\"35\" style=\"background-color:");
      out.print( col[35] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be4\" value=\"36\" style=\"background-color:");
      out.print( col[36] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be5\" value=\"37\" style=\"background-color:");
      out.print( col[37] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be6\" value=\"38\" style=\"background-color:");
      out.print( col[38] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be7\" value=\"39\" style=\"background-color:");
      out.print( col[39] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"be8\" value=\"40\" style=\"background-color:");
      out.print( col[40] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <br><br>\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf1\" value=\"41\" style=\"background-color:");
      out.print( col[41] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf2\" value=\"42\" style=\"background-color:");
      out.print( col[42] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf3\" value=\"43\" style=\"background-color:");
      out.print( col[43] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf4\" value=\"44\" style=\"background-color:");
      out.print( col[44] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf5\" value=\"45\" style=\"background-color:");
      out.print( col[45] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf6\" value=\"46\" style=\"background-color:");
      out.print( col[46] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf7\" value=\"47\" style=\"background-color:");
      out.print( col[47] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            <input class=\"slot\" type=\"submit\" id=\"bf8\" value=\"48\" style=\"background-color:");
      out.print( col[48] );
      out.write(" \" onclick=\"check(id)\" >\n");
      out.write("            \n");
      out.write("            <br><br><br><br><br><br>\n");
      out.write("            \n");
      out.write("            <input type=\"text\" id=\"sn\" name=\"sn\" value=\"0\">\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <input type=\"submit\" value=\"Done\">\n");
      out.write("            \n");
      out.write("            </form>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("         \n");
      out.write("            \n");
      out.write("            \n");
      out.write("      \n");
      out.write("        \n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
