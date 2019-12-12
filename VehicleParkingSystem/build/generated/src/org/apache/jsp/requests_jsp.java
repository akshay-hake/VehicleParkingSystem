package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class requests_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("          <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("          <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\n");
      out.write("           <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n");
      out.write("           <script src=\"node_modules/tablefilter/dist/tablefilter/tablefilter.js\"></script>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("                \n");
      out.write("           <style>\n");
      out.write("               body {font-family: Arial, Helvetica, sans-serif;}\n");
      out.write("* {box-sizing: border-box;}\n");
      out.write("\n");
      out.write("/* Button used to open the contact form - fixed at the bottom of the page */\n");
      out.write(".open-button {\n");
      out.write("  background-color: #555;\n");
      out.write("  color: white;\n");
      out.write("  padding: 16px 20px;\n");
      out.write("  border: none;\n");
      out.write("  cursor: pointer;\n");
      out.write("  opacity: 0.8;\n");
      out.write("  position: fixed;\n");
      out.write("  bottom: 23px;\n");
      out.write("  right: 28px;\n");
      out.write("  width: 280px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* The popup form - hidden by default */\n");
      out.write(".form-popup {\n");
      out.write("  display: none;\n");
      out.write("  position: fixed;\n");
      out.write("  bottom: 0;\n");
      out.write("  right: 15px;\n");
      out.write("  border: 3px solid #f1f1f1;\n");
      out.write("  z-index: 9;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Add styles to the form container */\n");
      out.write(".form-container {\n");
      out.write("  max-width: 300px;\n");
      out.write("  padding: 10px;\n");
      out.write("  background-color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Full-width input fields */\n");
      out.write(".form-container input[type=text],.form-container input[type=date], .form-container input[type=password] {\n");
      out.write("  width: 100%;\n");
      out.write("  padding: 15px;\n");
      out.write("  margin: 5px 0 22px 0;\n");
      out.write("  border: none;\n");
      out.write("  background: #f1f1f1;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* When the inputs get focus, do something */\n");
      out.write(".form-container input[type=text]:focus, .form-container input[type=password]:focus {\n");
      out.write("  background-color: #ddd;\n");
      out.write("  outline: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Set a style for the submit/login button */\n");
      out.write(".form-container .btn {\n");
      out.write("  background-color: #4CAF50;\n");
      out.write("  color: white;\n");
      out.write("  padding: 16px 20px;\n");
      out.write("  border: none;\n");
      out.write("  cursor: pointer;\n");
      out.write("  width: 100%;\n");
      out.write("  margin-bottom:10px;\n");
      out.write("  opacity: 0.8;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Add a red background color to the cancel button */\n");
      out.write(".form-container .cancel {\n");
      out.write("  background-color: red;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Add some hover effects to buttons */\n");
      out.write(".form-container .btn:hover, .open-button:hover {\n");
      out.write("  opacity: 1;\n");
      out.write("}\n");
      out.write("           </style>   \n");
      out.write("    </head>\n");
      out.write("    <body style=\" background-color:buttonface\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <!-- Grey with black text -->\n");
      out.write("<nav class=\"navbar navbar-inverse\" style=\"position:fixed;width:100%;z-index: 100\">\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    <div class=\"navbar-header\">\n");
      out.write("      <a class=\"navbar-brand\" href=\"#\">Parking</a>\n");
      out.write("    </div>\n");
      out.write("    <ul class=\"nav navbar-nav\">\n");
      out.write("      <li class=\"active\"><a href=\"table.jsp\">Show Detail </a></li>\n");
      out.write("     \n");
      out.write("      <li><a href=\"reg.jsp\">Register</a></li>\n");
      out.write("      <li><a href=\"view.jsp\">Show Layout</a></li>\n");
      out.write("      <li><a href=\"DriverLogin.jsp\">Book slot</a></li>\n");
      out.write("      <li><a href=\"Pre_booking.jsp\">Pre-Booking</a></li>\n");
      out.write("      <li><a href=\"#\">Collect Payment</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li>\n");
      out.write("      <li><a href=\"login\"><span class=\"glyphicon glyphicon-log-in\"></span> Logout</a></li>\n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</nav>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("\n");
      out.write("        <div style=\"padding-left: 10px;padding-right: 10px;\"> \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        <p style=\"padding-top: 70px;padding-left: 10px;padding-right: 10px;\">\n");
      out.write("        \n");
      out.write("        <form action=\"guestList.jsp\" method=\"get\">\n");
      out.write("                            \n");
      out.write("                           <input class=\"btn btn--radius-2 btn--blue\" style=\"margin-right: 10px;float:left;align:right;width: 10%;height:50px;background-color: skyblue;color:white;font-size: 15px;font-weight:bold\" type=\"submit\" name=\"dd\" value=\"Back\" onclick=\"DriverLogin.jsp\">\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("        <br><br>\n");
      out.write("        <br><br>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("\n");
      out.write("   \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("        Type something to search the table :</p>  \n");
      out.write("  <input class=\"form-control\" id=\"myInput\" type=\"text\" placeholder=\"Search..\">\n");
      out.write("  <br>\n");
      out.write("  <table class=\"table table-bordered table-striped\"  border=\"1\"  style=\"background-color: white;padding-left: 20px;padding-right: 20px;\">\n");
      out.write("            <tr>\n");
      out.write("                <th>Sr.NO</th>\n");
      out.write("                <th>Visitor id</th>\n");
      out.write("                <th>Name</th>\n");
      out.write("                <th>Email</th>\n");
      out.write("                \n");
      out.write("                <th>Confirmation</th>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tbody id=\"myTable\">\n");
      out.write("            \n");
      out.write("            \n");
      out.write("  ");

      
     
        Statement stmt=null;
        Statement stmt2=null;
        Statement st3=null;
        String email="";
        String name="";
        
        
        int i=0;
       
        int en=0;
        try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    stmt=con.createStatement(); 
                    stmt2=con.createStatement(); 
                    st3= con.createStatement();
                    
        }catch(Exception e){ out.println(e);} 
        
                    String q="select * from requests where o_id="+request.getSession().getAttribute("oid");
                    ResultSet rs=stmt.executeQuery(q);  
                    ResultSet temp=rs;
                    if(!rs.next())
                    {
                        
      out.write("\n");
      out.write("                        <tr style=\"background-color: #DDDDDD\">\n");
      out.write("                            <td style=\"background-color: white\" >Not found</td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                    }
                    rs.previous();
                    while(rs.next()) 
                    { 
                        i++;
                        
                        int vid=rs.getInt("visitor_id");
                        String v="select * from visitor where visitor_id="+vid;
                        ResultSet vres=stmt2.executeQuery(v);

                        if(vres.next())
                        {
                            email=vres.getString("email");
                            name=vres.getString("name");
                        }

                        

                       
                        
                  
                         
                    
      out.write("\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( i);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( vid);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(name);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(email);
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                           <form action=\"jj\" method=\"get\">\n");
      out.write("                              <input class=\"btn btn--radius-2 btn--blue\" style=\"margin-right: 10px;float:right;align:right;width: 10%;height:50px;background-color: skyblue;color:white;font-size: 15px;font-weight:bold\" type=\"submit\" name=\"accept\" value=\"Accept\" >\n");
      out.write("                              <input class=\"btn btn--radius-2 btn--blue\" style=\"margin-right: 10px;float:right;align:right;width: 10%;height:50px;background-color: skyblue;color:white;font-size: 15px;font-weight:bold\" type=\"submit\" name=\"reject\" value=\"Reject\" >\n");
      out.write("        \n");
      out.write("                           </form>   \n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                       \n");
      out.write("\n");
      out.write("                           \n");
      out.write("                            \n");
      out.write("                        \n");
      out.write("                       \n");
      out.write("                        \n");
      out.write("                    </tr>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                   ");
     
                        
                    }
                         
                    
  
      out.write("\n");
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("</table>\n");
      out.write("  \n");
      out.write("  \n");
      out.write(" \n");
      out.write("        </div>\n");
      out.write("  <script>\n");
      out.write("$(document).ready(function(){\n");
      out.write("  $(\"#myInput\").on(\"keyup\", function() {\n");
      out.write("    var value = $(this).val().toLowerCase();\n");
      out.write("    $(\"#myTable tr\").filter(function() {\n");
      out.write("      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)\n");
      out.write("    });\n");
      out.write("  });\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("\n");
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
