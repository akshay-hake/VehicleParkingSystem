package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class DriverLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("           \n");
      out.write("        \n");
      out.write("   <style>\n");
      out.write("body {\n");
      out.write("\tfont-family: Arial, Helvetica, sans-serif;\n");
      out.write("\tbackground-image:url(\"2.jpg\");\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tcolor: white;\n");
      out.write("\ttext-shadow: 4px 4px 6px navy; \n");
      out.write("}\n");
      out.write("h1{\n");
      out.write("\tcolor :white;\n");
      out.write("text-shadow: 4px 4px 6px navy;  \n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(".container {\n");
      out.write("    padding: 16px;\n");
      out.write("  \n");
      out.write("    background-color: ECECF3;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input[type=text], input[type=password], input[type=number] {\n");
      out.write("    width: 30%;\n");
      out.write("    padding: 15px;\n");
      out.write("    margin: 5px 0 22px 0;\n");
      out.write("    display: inline-block;\n");
      out.write("    background: #c0c0c0;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("    border: 2px solid blue;\n");
      out.write("    border-radius: 4px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input {\n");
      out.write("    width: 30%;\n");
      out.write("    padding: 15px;\n");
      out.write("    margin: 5px 0 22px 0;\n");
      out.write("    display: inline-block;\n");
      out.write("    background: #856404;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("    border: 2px solid blue;\n");
      out.write("    border-radius: 4px;\n");
      out.write("    color: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write("select {\n");
      out.write("    width: 30%;\n");
      out.write("    padding: 15px;\n");
      out.write("    margin: 5px 0 22px 0;\n");
      out.write("    display: inline-block;\n");
      out.write("    background: #c0c0c0;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("    border: 2px solid blue;\n");
      out.write("    border-radius: 4px;\n");
      out.write("    color: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write("options {\n");
      out.write("    width: 30%;\n");
      out.write("    padding: 15px;\n");
      out.write("    margin: 5px 0 22px 0;\n");
      out.write("    display: inline-block;\n");
      out.write("    background: black;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("    border: 2px solid blue;\n");
      out.write("    border-radius: 4px;\n");
      out.write("    color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".pwd {\n");
      out.write("    width: 30%;\n");
      out.write("    padding: 15px;\n");
      out.write("    margin: 5px 0 22px 0;\n");
      out.write("    display: inline-block;\n");
      out.write("    background: black;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("    border: 2px solid blue;\n");
      out.write("    border-radius: 4px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("input:focus {\n");
      out.write("    background-color: #f0f0f0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("select:focus {\n");
      out.write("    background-color: #f0f0f0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".registerbtn {\n");
      out.write("    background-color:#090468   ;\n");
      out.write("    color: white;\n");
      out.write("    padding: 16px 20px;\n");
      out.write("    margin: 8px 0;\n");
      out.write("    cursor: pointer;\n");
      out.write("    width: 18%;\n");
      out.write("    opacity: 0.9;\n");
      out.write("     box-sizing: border-box;\n");
      out.write("    border: 2px solid white;\n");
      out.write("    border-radius: 4px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".registerbtn:hover {\n");
      out.write("    opacity: 1;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("function show() {\n");
      out.write("    \n");
      out.write("       \n");
      out.write("    \n");
      out.write("       var ty=document.getElementById(\"Type\").value;\n");
      out.write("    \n");
      out.write("       \n");
      out.write("       \n");
      out.write("       if(ty===\"visitor\")\n");
      out.write("       {\n");
      out.write("            document.getElementById(\"dis\").style.display = \"block\";\n");
      out.write("            \n");
      out.write("        }\n");
      out.write("       else\n");
      out.write("           document.getElementById(\"dis\").style.display = \"none\";\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body style=\"background-color: white\">\n");
      out.write("    \n");
      out.write(" \n");
      out.write("    <form action=\"DLogin\" method=\"get\" style=\"border:2px solid white;margin: 100px;background-color: gray\">\n");
      out.write("  <div class=\"container\">\n");
      out.write("<center>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <h1>Login</h1>\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <label for=\"login\"><b>Login Id</b></label><br>\n");
      out.write("    <input type=\"number\" placeholder=\"Enter Login Id\" name=\"login\" required>\n");
      out.write("\t<br>\n");
      out.write("    <label for=\"psw\"><b>Password</b></label><br>\n");
      out.write("    <input  type=\"password\" placeholder=\"Enter Password\" name=\"psw\" required>\n");
      out.write("    <br>\n");
      out.write("    \n");
      out.write("    <label for=\"Type\"><b>Type</b></label><br>\n");
      out.write("    <select id=\"Type\" name=\"Type\" onChange=\"show()\">\n");
      out.write("\t\t\t\t<option value=\"employee\">Employee</option>\n");
      out.write("\t\t\t\t<option value=\"visitor\">Visitor</option>\n");
      out.write("                                <option value=\"organization\">Organization</option>\n");
      out.write("\t\t\t</select>\n");
      out.write("    \n");
      out.write("    <br>\n");
      out.write("    \n");
      out.write("    <div id=\"dis\" style=\"display: none\">\n");
      out.write("    <label for=\"comp\"><b>Company</b></label><br>\n");
      out.write("    <select id=\"comp\" name=\"comp\" >\n");
      out.write("\t\t\t\t<option value=\"XYZ\">XYZ</option>\n");
      out.write("\t\t\t\t<option value=\"ABC\">ABC</option>\n");
      out.write("                                \n");
      out.write("\t\t\t</select>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <br>\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <button type=\"submit\" class=\"registerbtn\"><b>LOGIN</b></button>\n");
      out.write("</center>\n");
      out.write("  </div>\n");
      out.write("</body>\n");
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
