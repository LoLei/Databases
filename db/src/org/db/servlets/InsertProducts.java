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
@WebServlet("/InsertProduct")
public class InsertProducts extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public InsertProducts() {
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
      writer.println("<head><title>Insert Product</title></head>"); 
      writer.println("<body>"); 
      writer.println("<h1>Insert Product!</h1>"); 
      String pname = request.getParameter("productname"); 
      if((pname == null) || (pname.length() == 0)) 
      { 
        printMsg("Can not insert a product with no name!", writer, request); 
        return; 
      } 
      String ptype = request.getParameter("producttype"); 
      if((ptype == null) || (ptype.length() == 0)) 
      { 
        printMsg("Can not insert a product with no type!", writer, request); 
        return; 
      } 
      String pvalue = request.getParameter("productvalue"); 
      if((pvalue == null) || (pvalue.length() == 0)) 
      { 
        printMsg("Can not insert a product with no value!", writer, request); 
        return; 
      } 
      int ivalue; 
      try 
      { 
        ivalue = Integer.parseInt(pvalue); 
      } 
      catch(NumberFormatException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a product with an invalid Number!", writer, request); 
        return; 
      } 
      String pprice = request.getParameter("productselling_price"); 
      if((pprice == null) || (pprice.length() == 0)) 
      { 
        printMsg("Can not insert a product with no price!", writer, request); 
        return; 
      } 
      int iprice; 
      try 
      { 
        iprice = Integer.parseInt(pprice); 
      } 
      catch(NumberFormatException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a product with an invalid Number!", writer, request); 
        return; 
      } 
      try 
      { 
        Class.forName("com.mysql.jdbc.Driver"); 
      } 
      catch(ClassNotFoundException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a product : no JDBC driver found!", writer, request); 
        return; 
      } 
      try
      { 
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root"); 
        Statement statement = connection.createStatement();
        //referential integrity gets checked here!!! 
        String insert_sql_stmt = "INSERT INTO products (name, type, value, selling_price) VALUES ('" + 
        pname + "','" + ptype + "','" + ivalue + "','" + iprice + "')";
        statement.executeUpdate(insert_sql_stmt); 
        printMsg("Transaction inserted!", writer, request); 
      }  
      catch(SQLException exc) 
      { 
        exc.printStackTrace(); 
        printMsg("Can not insert a product : database error!", writer, request); 
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