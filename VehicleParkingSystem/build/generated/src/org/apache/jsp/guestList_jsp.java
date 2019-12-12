package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class guestList_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body style=\" background-color:buttonface\">\n");
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
      out.write("\n");
      out.write("        <div style=\"padding-left: 10px;padding-right: 10px;\"> \n");
      out.write("        <p style=\"padding-top: 100px;padding-left: 10px;padding-right: 10px;\">Type something to search the table :</p>  \n");
      out.write("  <input class=\"form-control\" id=\"myInput\" type=\"text\" placeholder=\"Search..\">\n");
      out.write("  <br>\n");
      out.write("  <table class=\"table table-bordered table-striped\"  border=\"1\"  style=\"background-color: white;padding-left: 20px;padding-right: 20px;\">\n");
      out.write("            <tr>\n");
      out.write("                <th>Sr.NO</th>\n");
      out.write("                <th>Email</th>\n");
      out.write("                <th>Days</th>\n");
      out.write("                <th>status</th>\n");
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
        int days=0;
        String st="";
        String pstatus="Pending";
        String ps="";
        String color="red";
        int i=0;
        String dstatus="";
        String dcol="";
        String fcol="";
        int en=0;
        try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    stmt=con.createStatement(); 
                    stmt2=con.createStatement(); 
                    st3= con.createStatement();
                    
        }catch(Exception e){ out.println(e);} 
        
                    String q="select * from guestList";
                    ResultSet rs=stmt.executeQuery(q);  
                    while(rs.next()) 
                    { 
                        i++;
                        
                        email=rs.getString("email");
                        days=rs.getInt("days");
                        st=rs.getString("status");
                        
                       
                     
                        String rr="select get_status('"+email+"')";
                        ResultSet ms=st3.executeQuery(st);
                        int s=0;
                        
                        if(ms.next())
                        {
                            s=ms.getInt(1);
                        }
                        
                       
                       if(s==2)
                       {
                           dstatus="Arrived";
                           dcol="#B9DDDF  ";
                           fcol="black";
                       }
                       else if(s==1)
                       {
                           dstatus="Arriving";
                           dcol="yellow";
                           fcol="black";
                       }
                      
                       else
                       {
                            dstatus="Departed";
                            dcol="grey";
                            fcol="white";
                       }
                       
                       
                        
                         String rq="select * from payment where entry_no="+rs.getInt("entry_no");
                         ResultSet p=st3.executeQuery(rq);
                         
                         if(p.next())
                         {
                             pstatus="Done";
                             ps="disabled";
                             color="green";
                         }
                         else
                         {
                             pstatus="Pending";
                             ps="";
                             color="red";
                         }
                         
                    
      out.write("\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( i);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( email);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(days);
      out.write("</td>\n");
      out.write("                        \n");
      out.write("                       \n");
      out.write("\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: ");
      out.print( dcol );
      out.write(";color:");
      out.print(fcol);
      out.write(";font-size: 15px;font-weight:bold\">");
 out.print(dstatus); 
      out.write("</td>\n");
      out.write("                           \n");
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
