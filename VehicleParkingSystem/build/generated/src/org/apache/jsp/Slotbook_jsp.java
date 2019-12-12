package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;

public final class Slotbook_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Au Register Forms by Colorlib</title>\n");
      out.write("\n");
      out.write("    <!-- Icons font CSS-->\n");
      out.write("    <link href=\"vendor/mdi-font/css/material-design-iconic-font.min.css\" rel=\"stylesheet\" media=\"all\">\n");
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
      out.write("    \n");
      out.write("            \n");
      out.write("        \n");
      out.write("    \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            
            request.getSession().setAttribute("id", request.getSession().getAttribute("id"));
            request.getSession().setAttribute("type", request.getSession().getAttribute("type"));
        
            Calendar cal=Calendar.getInstance();
            int day=cal.get(Calendar.DAY_OF_MONTH);
            int month=cal.get(Calendar.MONTH)+1;
            
            int hr,min,sec;
            
            String at;
            String ct="";
            
            at=""+cal.get(Calendar.YEAR);
            
            if(month<10)
                at=at.concat("-0"+month);
            else
                at=at.concat("-"+month);
            
            if(day<10)
                at=at+"-0"+day;
            else
                at=at+"-"+day;
            
            hr=cal.get(Calendar.HOUR);
            min=cal.get(Calendar.MINUTE);
            sec=cal.get(Calendar.SECOND);
            
            if(hr<10)
                ct=ct.concat(":0"+hr);
            else
                ct=ct.concat(":"+hr);
            
            if(min<10)
                ct=ct+":0"+min;
            else
                ct=ct+":"+min;
            
            if(sec<10)
                ct=ct+":0"+sec;
            else
                ct=ct+":"+sec;
            
            
            
            
            
            
            
            
            
           
            
           
            
            
        
      out.write("\n");
      out.write("        \n");
      out.write("         <nav class=\"navbar navbar-inverse\" style=\"position:fixed;width:100%;z-index: 100\">\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    <div class=\"navbar-header\">\n");
      out.write("      <a class=\"navbar-brand\" href=\"#\">Parking</a>\n");
      out.write("    </div>\n");
      out.write("    <ul class=\"nav navbar-nav\">\n");
      out.write("      <li><a href=\"table.jsp\">Show Detail </a></li>\n");
      out.write("     \n");
      out.write("      <li><a href=\"reg.jsp\">Register</a></li>\n");
      out.write("      <li><a href=\"view.jsp\">Show Layout</a></li>\n");
      out.write("      <li class=\"active\"><a href=\"DriverLogin.jsp\">Book slot</a></li>\n");
      out.write("      <li><a href=\"#\">Collect Payment</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li>\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-log-in\"></span> Logout</a></li>\n");
      out.write("    </ul>\n");
      out.write("  </div>\n");
      out.write("</nav>\n");
      out.write("                    <center>\n");
      out.write("\n");
      out.write("        <form action=\"slotbook\" method=\"get\" style=\"padding-top: 100px;padding-left: 100px;padding-right: 100px \">\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("            <div class=\"row row-space\">\n");
      out.write("                <td>\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                                   <div class=\"input-group\">   \n");
      out.write("                                                       <label>Arrival Date </label> <input class=\"input--style-4\" type=\"date\" name=\"arrival_date\" value=\"");
      out.print( at );
      out.write("\">\n");
      out.write("               </div>\n");
      out.write("                            </div>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                <div class=\"input-group\">\n");
      out.write("                                    <label>Arrival time</label>  <input class=\"input--style-4\" type=\"time\" name=\"arrival_time\" value=\"");
      out.print( ct );
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
      out.write("                                    <label> Departure Date</label>  <input  class=\"input--style-4\" type=\"date\" name=\"departure_date\">\n");
      out.write("             </div>\n");
      out.write("                            </div>\n");
      out.write("                  </td>\n");
      out.write("                  <td>\n");
      out.write("                            <div class=\"col-2\">\n");
      out.write("                                <div class=\"input-group\">\n");
      out.write("                                    <label>Departure time</label><input class=\"input--style-4\" type=\"time\" name=\"departure_time\">\n");
      out.write("            </div>\n");
      out.write("                            </div>\n");
      out.write("                  </td>\n");
      out.write("                        </div>\n");
      out.write("        </tr>\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            </table>\n");
      out.write("            <input class=\"btn btn--radius-2 btn--blue\" type=\"submit\" name=\"ok\" value=\"OK\">\n");
      out.write("    </form>\n");
      out.write("                \n");
      out.write("                    </center>\n");
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
