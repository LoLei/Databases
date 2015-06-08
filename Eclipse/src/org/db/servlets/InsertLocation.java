package org.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Start
 */
@WebServlet("/InsertLocation")
public class InsertLocation extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public InsertLocation() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      PrintWriter writer = response.getWriter(); 
      writer.println("<html>"); 
      writer.println("<head><title>Insert Location</title></head>"); 
      writer.println("<body>"); 
      writer.println("<h1>Insert Location!</h1>"); 
      String lcountry = request.getParameter("locationcountry"); 
      if((lcountry == null) || (lcountry.length() == 0)) 
      { 
        printMsg("Can not insert a location with no country!", writer, request); 
        return; 
      } 
      String lcity = request.getParameter("locationcity"); 
      if((lcity == null) || (lcity.length() == 0)) 
      { 
        printMsg("Can not insert a location with no city!", writer, request); 
        return; 
      } 
      String lstreet = request.getParameter("locationstreet"); 
      if((lstreet == null) || (lstreet.length() == 0)) 
      { 
        printMsg("Can not insert a location with no street!", writer, request);
        return; 
      } 
      String lnumber = request.getParameter("locationnumber"); 
      if((lnumber == null) || (lnumber.length() == 0)) 
      { 
        printMsg("Can not insert a location with no number!", writer, request);
        return; 
      } 
      int inumber; 
      try 
      { 
        inumber = Integer.parseInt(lnumber); 
      } 
      catch(NumberFormatException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a movie with an invalid Number!", writer, request); 
        return; 
      } 
      try 
      { 
        Class.forName("com.mysql.jdbc.Driver"); 
      } 
      catch(ClassNotFoundException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a movie : no JDBC driver found!", writer, request); 
        return; 
      } 
      try
      { 
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root"); 
        writer.println("got connection");
        Statement statement = connection.createStatement();
        //referential integrity gets checked here!!! 
        String insert_sql_stmt = "INSERT INTO locations (country, city, street, number) VALUES('" + 
        lcountry + "','" + lcity + "','" + lstreet + "','" + inumber + "')";
        printMsg("created statement!", writer, request); 
        writer.println(insert_sql_stmt);
        statement.executeUpdate(insert_sql_stmt); 
        printMsg("Transaction inserted!", writer, request); 
      }  
      catch(SQLException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a location : database error!", writer, request); 
      } 
      writer.println("<body>"); 
      writer.println("</html>"); 
      writer.close();
      
    }
    /** 
    * 
    @see 
    HttpServlet#doPost(HttpServletRequest request, Http
    ServletResponse 
    response) 
    */ 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    throws 
    ServletException, IOException { 
    // TODO  Auto-generated method stub 
    } 
      private void 
      printMsg(String msg, PrintWriter writer, HttpServletRequest request) 
      { 
        writer.write("<h1>" + msg + "</h1>\n"); 
        writer.write("<a href = \"" + request.getHeader("Referer") + "\">Back</a>\n"); 
        writer.write("</body>"); 
        writer.write("</html>"); 
      } 
    } 