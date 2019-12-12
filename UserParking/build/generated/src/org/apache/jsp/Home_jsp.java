package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("        <style>\n");
      out.write("            #crumbs ul li a {\n");
      out.write("\tdisplay: block;\n");
      out.write("\tfloat: left;\n");
      out.write("\theight: 50px;\n");
      out.write("\tbackground: #3498db;\n");
      out.write("\t\n");
      out.write("\tpadding: 30px 22px 1px 64px;\n");
      out.write("\tposition: relative;\n");
      out.write("\tmargin: 0 10px 0 0; \n");
      out.write("\t\n");
      out.write("\tfont-size: 20px;\n");
      out.write("\ttext-decoration: none;\n");
      out.write("\tcolor: #fff;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#crumbs ul li a:after {\n");
      out.write("\tcontent: \"\";  \n");
      out.write("\tborder-top: 40px solid transparent;\n");
      out.write("border-bottom: 40px solid transparent;\n");
      out.write("border-left: 40px solid #3498db;\n");
      out.write("\tposition: absolute; right: -40px; top: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#crumbs ul li a:before {\n");
      out.write("\tcontent: \"\";  \n");
      out.write("\tborder-top: 40px solid transparent;\n");
      out.write("\tborder-bottom: 40px solid transparent;\n");
      out.write("\tborder-left: 40px solid #ffffff;\n");
      out.write("\tposition: absolute; left: 0; top: 0;\n");
      out.write("        \n");
      out.write("}\n");
      out.write("\n");
      out.write("#crumbs ul li a:hover {\n");
      out.write("\tbackground: #fa5ba5;\n");
      out.write("}\n");
      out.write("\t#crumbs ul li a:hover:after {\n");
      out.write("\t\tborder-left-color: #fa5ba5;\n");
      out.write("\t}\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <div id=\"crumbs\" style=\"padding-left: 30px\">\n");
      out.write("\t<ul>\n");
      out.write("\t\t<li><a href=\"#\">Book Slot</a></li>\n");
      out.write("\t</ul>\n");
      out.write("        </div>\n");
      out.write("        <br><br>\n");
      out.write("        <div id=\"crumbs\" style=\"padding-left: 230px\">\n");
      out.write("\t<ul>\n");
      out.write("\t\t<li><a href=\"#\">Your Booking</a></li>\n");
      out.write("\t</ul>\n");
      out.write("        </div>\n");
      out.write("        <br><br>\n");
      out.write("        <div id=\"crumbs\" style=\"padding-left: 30px\">\n");
      out.write("\t<ul>\n");
      out.write("\t\t<li><a href=\"#\">Show layout</a></li>\n");
      out.write("\t</ul>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
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
