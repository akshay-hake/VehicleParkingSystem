package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import jdk.nashorn.internal.runtime.ScriptFunction;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.Calendar;

public final class confirmBooking_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("     \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("\n");
      out.write("        \n");
      out.write("          ");
 
            
            String col[]=new String[50];
            
            String rcY="";
            String rcN="";
            String access="";
            String ad="2019-08-16",at="01:01:00",dd="2019-08-16",dt="01:40:00";
            
            dd=request.getSession().getAttribute("dd").toString();
            ad=request.getSession().getAttribute("ad").toString();
            at=request.getSession().getAttribute("at").toString();
            
           dt=request.getSession().getAttribute("dt").toString();
           
                        String cn=request.getSession().getAttribute("car_no").toString();
                        String space="",id="";
                       try{  
                    Class.forName("com.mysql.jdbc.Driver");  

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleParkingSystem","root","root");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement();  
                    String q="select * from car where car_no='"+cn+"'";
                    ResultSet rs=stmt.executeQuery(q);  
                    if(rs.next()) 
                    {
                       space=String.valueOf(rs.getInt("space_required"));
                       int k=rs.getInt("emp_id");
                       if(rs.wasNull())
                            id=String.valueOf(rs.getInt("visitor_id"));
                       else
                           id=String.valueOf(k);
                       
                       if(rs.getInt("rc")==1)
                       {
                          rcY="checked";
                          access="readonly";
                       }
                       else
                           rcN="checked";
                       
                       
           
                        
                    }
                         
                        con.close();  
                    }catch(Exception e){out.print(e); } 
                    
          
      out.write("\n");
      out.write("        \n");
      out.write("        <form action=\"confirmBook\" method=\"get\" style=\"padding-top: 100px\">\n");
      out.write("            <center>\n");
      out.write("             Car_no : <input type=\"text\" name=\"car_no\" id=\"car_no\" value=\"");
      out.print( request.getSession().getAttribute("car_no") );
      out.write('"');
      out.write(' ');
      out.print( access );
      out.write(">\n");
      out.write("            \n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            Space_required : <input type=\"number\" name=\"space\" id=\"space\" value=\"");
      out.print( space );
      out.write('"');
      out.write(' ');
      out.print(access);
      out.write(">\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            RC : <input type=\"radio\" name=\"rc\" id=\"rc\" value=\"yes\" ");
      out.print( rcY );
      out.write(' ');
      out.print(access);
      out.write(" >Yes\n");
      out.write("            <input type=\"radio\" name=\"rc\" id=\"rc\" value=\"no\" ");
      out.print(access);
      out.write(' ');
      out.print(rcN);
      out.write(">No\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            ID : <input type=\"number\" name=\"id\" id=\"id\" value=\"");
      out.print( request.getSession().getAttribute("id") );
      out.write('"');
      out.write(' ');
      out.print(access);
      out.write(">\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            Type : <input type=\"text\" name=\"type\" value=\"");
      out.print( request.getSession().getAttribute("type"));
      out.write("\">\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            Slot No. : <input type=\"number\" name=\"sno\" id=\"sno\" value=\"");
      out.print( request.getSession().getAttribute("sno") );
      out.write("\" readonly>\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            Purpose : <input type=\"text\" name=\"purpose\">\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            Arrival Date : <input type=\"date\" name=\"arrival_date\" value=\"");
      out.print( ad );
      out.write("\">  Arrival time : <input type=\"time\" name=\"arrival_time\" value=\"");
      out.print( at );
      out.write("\">\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            Departure Date : <input type=\"date\" name=\"departure_date\" value=\"");
      out.print( dd );
      out.write("\">  Departure time : <input type=\"time\" name=\"departure_time\" value=\"");
      out.print( dt );
      out.write("\">\n");
      out.write("            <br><br>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <input type=\"submit\" name=\"submit\" value=\"Done\">\n");
      out.write("            \n");
      out.write("            </center>\n");
      out.write("        </form>\n");
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
