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
      String mname = request.getParameter("MName"); 
      if((mname == null) || (mname.length() == 0)) 
      { 
        printMsg("Can not insert a movie with no name!", writer, request); 
        return; 
      } 
      String mgenre = request.getParameter("MGenre"); 
      if((mgenre == null) || (mgenre.length() == 0)) 
      { 
        printMsg("Can not insert a movie with no genre!", writer, request); 
        return; 
      } 
      String director = request.getParameter("DId"); 
      if((director == null) || (director.length() == 0)) 
      { 
        printMsg("Can not insert a movie with no director!", writer, request); 
        return; 
      } 
      int dId; 
      try 
      { 
        dId = Integer.parseInt(director); 
      } 
      catch
      (NumberFormatException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a movie with an invalid Director!", writer, request); 
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
        Statement statement = connection.createStatement();
        //referential integrity gets checked here!!! 
        ResultSet result = statement.executeQuery("SELECT * FROM director WHERE DId=" + dId); 
        if(!result.next()) 
        { 
          printMsg("Can not insert a movie : no such actor!", writer, request); 
          return; 
        } 
        String insert_sql_stmt =  "INSERT INTO movie (MName, MGenre, DID) VALUES('" + mname + "','" + mgenre + "'," + dId + ")"; 
        statement = connection.createStatement(); 
        statement.executeUpdate(insert_sql_stmt); 
        printMsg("Transaction inserted!", writer, request); 
      }  
      catch(SQLException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a movie : database error!", writer, request); 
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
