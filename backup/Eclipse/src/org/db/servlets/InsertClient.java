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
@WebServlet("/InsertClient")
public class InsertClient extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public InsertClient() {
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
      writer.println("<head><title>Insert Client</title></head>"); 
      writer.println("<body>"); 
      writer.println("<h1>Insert Client!</h1>"); 
      String c_last_name = request.getParameter("clientlast_name"); 
      if((c_last_name == null) || (c_last_name.length() == 0)) 
      { 
        printMsg("Can not insert a Client with no last name!", writer, request); 
        return; 
      } 
      String c_first_name = request.getParameter("clientfirst_name"); 
      if((c_first_name == null) || (c_first_name.length() == 0)) 
      { 
        printMsg("Can not insert a Client with first name", writer, request); 
        return; 
      } 
      String c_age = request.getParameter("clientage"); 
      if((c_age == null) || (c_age.length() == 0)) 
      { 
        printMsg("Can not insert a Client with no age!", writer, request);
        return; 
      } 
      int ic_age;
      try 
      { 
    	 ic_age = Integer.parseInt(c_age); 
      } 
      catch(NumberFormatException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a client with an invalid Number!", writer, request); 
        return; 
      }
      
      
      String cemployeeid = request.getParameter("clientemployeeid"); 
      if((cemployeeid == null) || (cemployeeid.length() == 0)) 
      { 
        printMsg("Can not insert a Client with no number!", writer, request);
        return; 
      } 
      int ic_employeeid; 
      try 
      { 
    	  ic_employeeid = Integer.parseInt(cemployeeid); 
      } 
      catch(NumberFormatException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a Client with an invalid Number!", writer, request); 
        return; 
      } 
      try 
      { 
        Class.forName("com.mysql.jdbc.Driver"); 
      } 
      catch(ClassNotFoundException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a client : no JDBC driver found!", writer, request); 
        return; 
      } 
      try
      { 
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "lo32"); 
        //writer.println("got connection");
        Statement statement = connection.createStatement();
        //referential integrity gets checked here!!! 
        String insert_sql_stmt = "INSERT INTO clients (last_name, first_name, age, employees_id) VALUES('" +
        		c_last_name + "','" + c_first_name + "','" + ic_age + "','" + ic_employeeid + "')";
        //printMsg("created statement!", writer, request); 
        //writer.println(insert_sql_stmt);
        statement.executeUpdate(insert_sql_stmt); 
        printMsg("Transaction inserted!", writer, request); 
      }  
      catch(SQLException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a Client : database error!", writer, request); 
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