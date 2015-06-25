package org.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
@WebServlet("/DeleteEmployee")
public class DeleteEmployee extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public DeleteEmployee() {
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
      writer.println("<head><title>Delete Employee</title></head>");
      writer.println("<body>");
      writer.println("<h1>Delete Employee!</h1>");
      String e_id = request.getParameter("EId");
      if((e_id == null) || (e_id.length() == 0))
      {
        printMsg("Can not delete an Employee with no ID!", writer, request);
        return;
      }

      int ie_id;
      try
      {
        ie_id = Integer.parseInt(e_id);
      }
      catch(NumberFormatException exc)
      {
        exc.printStackTrace();
        printMsg("Can not delete an employee with an invalid Number!", writer, request);
        return;
      }


      try
      {
        Class.forName("com.mysql.jdbc.Driver");
      }
      catch(ClassNotFoundException exc)
      {
        exc.printStackTrace();
        printMsg("Can not delete an employee: no JDBC driver found!", writer, request);
        return;
      }
      try
      {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "lo32");
        //writer.println("got connection");
        Statement statement = connection.createStatement();
        //referential integrity gets checked here!!!
        String insert_sql_stmt = "DELETE FROM employees WHERE id = '" + ie_id + "'";
        //printMsg("created statement!", writer, request);
        //writer.println(insert_sql_stmt);
        statement.executeUpdate(insert_sql_stmt);
        printMsg("Transaction inserted!", writer, request);
      }
      catch(SQLException exc)
      {
        exc.printStackTrace();
        printMsg("Can not delete an employee : database error!", writer, request);
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
