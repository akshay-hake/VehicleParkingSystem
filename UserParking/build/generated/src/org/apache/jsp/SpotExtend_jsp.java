package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SpotExtend_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("                  <div class=\"row\">\n");
      out.write("  <div class=\"col-75\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("       <form action=\"extend\" method=\"get\" >\n");
      out.write("            \n");
      out.write("    <div class=\"row\">\n");
      out.write("          <div class=\"col-50\">\n");
      out.write("            <label >Select Time Interval</label>\n");
      out.write("            <select id=\"time\" name=\"time\" class=\"form-control form-control-lg\" onclick=\"myFunction()\" >\n");
      out.write("                <option value=\"1800\" ");
      out.print( request.getSession().getAttribute("1t") );
      out.write(" >30 MINUTES</option>\n");
      out.write("                <option value=\"3600\" ");
      out.print( request.getSession().getAttribute("2t") );
      out.write(" >1 HOUR</option>\n");
      out.write("                <option value=\"7200\" ");
      out.print( request.getSession().getAttribute("3t") );
      out.write(" >2 HOUR</option>\n");
      out.write("            </select>\n");
      out.write("          </div>\n");
      out.write("    </div>\n");
      out.write("                 <input type=\"submit\" value=\"Confirm\" class=\"btn\">\n");
      out.write("        \n");
      out.write("        <input type=\"text\" name=\"amount\" value=\"50\" hidden>\n");
      out.write("      </form>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"col-25\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("      <h4>Slot <span class=\"price\" style=\"color:black\"><i class=\"fa fa-shopping-cart\"></i> <b></b></span></h4>\n");
      out.write("      \n");
      out.write("      <hr>\n");
      out.write("      <p>Total <span class=\"price\" style=\"color:black\" ><b id=\"rs\">Rs. 5</b></span></p>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
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
