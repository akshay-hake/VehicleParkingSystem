package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class sendRequest_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        \n");
      out.write("          <!-- Icons font CSS-->\n");
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
      out.write("        \n");
      out.write("     <style>\n");
      out.write("         .button {\n");
      out.write("  display: inline-block;\n");
      out.write("  padding: 15px 25px;\n");
      out.write("  font-size: 24px;\n");
      out.write("  cursor: pointer;\n");
      out.write("  text-align: center;\n");
      out.write("  text-decoration: none;\n");
      out.write("  outline: none;\n");
      out.write("  color: #fff;\n");
      out.write("  background-color: #4CAF50;\n");
      out.write("  border: none;\n");
      out.write("  border-radius: 15px;\n");
      out.write("  box-shadow: 0 9px #999;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".button:hover {background-color: #3e8e41}\n");
      out.write("\n");
      out.write(".button:active {\n");
      out.write("  background-color: #3e8e41;\n");
      out.write("  box-shadow: 0 5px #666;\n");
      out.write("  transform: translateY(4px);\n");
      out.write("}\n");
      out.write(".container1 {\n");
      out.write("  display: block;\n");
      out.write("  position: relative;\n");
      out.write("  padding-left: 35px;\n");
      out.write("  margin-bottom: 12px;\n");
      out.write("  cursor: pointer;\n");
      out.write("  font-size: 22px;\n");
      out.write("  -webkit-user-select: none;\n");
      out.write("  -moz-user-select: none;\n");
      out.write("  -ms-user-select: none;\n");
      out.write("  user-select: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Hide the browser's default checkbox */\n");
      out.write(".container1 input {\n");
      out.write("  position: absolute;\n");
      out.write("  opacity: 0;\n");
      out.write("  cursor: pointer;\n");
      out.write("  height: 0;\n");
      out.write("  width: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Create a custom checkbox */\n");
      out.write(".checkmark {\n");
      out.write("  position: absolute;\n");
      out.write("  top: 15;\n");
      out.write("  left: 10;\n");
      out.write("  height: 25px;\n");
      out.write("  width: 25px;\n");
      out.write("  background-color: #eee;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* On mouse-over, add a grey background color */\n");
      out.write(".container1:hover input ~ .checkmark {\n");
      out.write("  background-color: #ccc;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* When the checkbox is checked, add a blue background */\n");
      out.write(".container1 input:checked ~ .checkmark {\n");
      out.write("  background-color: #2196F3;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Create the checkmark/indicator (hidden when not checked) */\n");
      out.write(".checkmark:after {\n");
      out.write("  content: \"\";\n");
      out.write("  position: absolute;\n");
      out.write("  display: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Show the checkmark when checked */\n");
      out.write(".container1 input:checked ~ .checkmark:after {\n");
      out.write("  display: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Style the checkmark/indicator */\n");
      out.write(".container1 .checkmark:after {\n");
      out.write("  left: 9px;\n");
      out.write("  top: 5px;\n");
      out.write("  width: 5px;\n");
      out.write("  height: 10px;\n");
      out.write("  border: solid white;\n");
      out.write("  border-width: 0 3px 3px 0;\n");
      out.write("  -webkit-transform: rotate(45deg);\n");
      out.write("  -ms-transform: rotate(45deg);\n");
      out.write("  transform: rotate(45deg);\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("     \n");
      out.write("<script>\n");
      out.write("        function check(){\n");
      out.write("            var bt=document.getElementById(\"okk\");\n");
      out.write("            var ch=document.getElementById(\"box\");\n");
      out.write("            \n");
      out.write("            if(!ch.checked)\n");
      out.write("            {\n");
      out.write("                \n");
      out.write("                bt.style.backgroundColor=\"#BABFBF\";\n");
      out.write("                bt.disabled=true;\n");
      out.write("            }\n");
      out.write("            else\n");
      out.write("            {\n");
      out.write("                \n");
      out.write("                bt.style.backgroundColor=\"#05F97F \";\n");
      out.write("                bt.disabled=false;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("    <body>\n");
      out.write("      \n");
      out.write("        \n");
      out.write("        \n");
      out.write("         <div  style=\"position: inherit\">\n");
      out.write("        <div style=\"padding-top: 100px\" class=\"wrapper wrapper--w680\">\n");
      out.write("            <div class=\"card card-4\" style=\"background: #3b5998\" >\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h2 class=\"title1\" style=\"color:white;padding-top:10px;margin-bottom: 50px \">Visitor not in the GUEST LIST of this organization !</h2>\n");
      out.write("                       \n");
      out.write("                     \n");
      out.write("                       \n");
      out.write("                     \n");
      out.write("                     <br><br>\n");
      out.write("                     <label class=\"container1\" style=\"color: white\">Do you want to send the request to organization manager?\n");
      out.write("                     <input id=\"box\" style=\"float: left\" type=\"checkbox\"  onchange=\"return check()\" value=\"hhh\">\n");
      out.write("                    \n");
      out.write("                     <span class=\"checkmark\"></span>\n");
      out.write("                    </label>               \n");
      out.write("                     <br><br><br>              \n");
      out.write("                                    \n");
      out.write("                    \n");
      out.write("                    <div class=\"row row-space\">\n");
      out.write("                         \n");
      out.write("                                \n");
      out.write("                                    \n");
      out.write("                                   \n");
      out.write("                                    <center>\n");
      out.write("                             <table style=\" margin-left: 300px;\">\n");
      out.write("                                        <td>\n");
      out.write("                                        <form action=\"DriverLogin.jsp\" method=\"get\">\n");
      out.write("                                            \n");
      out.write("                                        <input class=\"button\"  style=\"background-color: red\"  type=\"submit\" value=\"Cancel\" >\n");
      out.write("                                        </form>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td  >\n");
      out.write("                                        <form action=\"sendRequest\" method=\"get\">\n");
      out.write("                                            \n");
      out.write("                                             <input class=\"button\" id=\"send\" style=\"margin-left: 15px;background-color: #BABFBF\"  type=\"submit\" value=\"Send Request\" disabled>\n");
      out.write("                                         </form>\n");
      out.write("                                         </td>\n");
      out.write("                                    </table>\n");
      out.write("                                </center>\n");
      out.write("                   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("         </div>\n");
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
