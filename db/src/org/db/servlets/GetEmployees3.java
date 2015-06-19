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
 * Servlet implementation class GetEmployeeDevice
 */
@WebServlet("/GetEmployees3")
public class GetEmployees3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEmployees3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PrintWriter writer = response.getWriter();
    writer.println("<html>");
    writer.println("<head><title>Get Employee Name 3</title></head>");
    writer.println("<body>");
    writer.println("<h1>Get Employee Name 3!</h1>");
    String type = request.getParameter("etype");
    if((type == null) || (type.length() == 0))
    {
      printMsg("Can not find an employee with no type!", writer, request);
      return;
    }
    String brand = request.getParameter("ebrand");
    if((brand == null) || (brand.length() == 0))
    {
      printMsg("Can not find an employee with no brand!", writer, request);
      return;
    }
    try
    {
      Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException exc)
    {
      exc.printStackTrace();
      printMsg("Can not get employee: no JDBCriver found!", writer, request);
      return;
    }
    try
    {
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root");
      //referential integrity gets checked here!!!
			String insert_sql_stmt = "SELECT last_name, first_name, position FROM "
					+ "employees, employee_uses_devices, devices WHERE "
					+ "devices.brand = \"" + brand + "\" "
					+ "AND devices.type = \"" + type +"\" "
					+ "AND devices.id = employee_uses_devices.devices_id "
					+ "AND employee_uses_devices.employees_id = employees.id";
      Statement statement = connection.createStatement();
      ResultSet rs = statement.executeQuery(insert_sql_stmt);
      boolean exist = false;
      writer.println("<table>");
      while(rs.next())
      {
        exist = true;
        writer.println("<tr>");
        writer.println("<td>" + rs.getString("last_name") + "</td>");
        writer.println("<td>" + rs.getString("first_name") + "</td>");
        writer.println("<td>" + rs.getString("position") + "</td>");
        writer.println("</tr>");
      }
      if(exist == false)
      {
        printMsg("No employee found!", writer, request);
      }
      else
      {
        writer.println("<a href = \"" + request.getHeader("Referer") + "\">Back</a>\n");
      }
    }
    catch(SQLException exc)
    {
      exc.printStackTrace();
      printMsg("Can not find a employee : database error!", writer, request);
    }
    writer.println("<body>");
    writer.println("</html>");
    writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
	}
	private void printMsg(String msg, PrintWriter writer, HttpServletRequest request)
  {
    writer.write("<h1>" + msg + "</h1>\n");
    writer.write("<a href = \"" + request.getHeader("Referer") + "\">Back</a>\n");
    writer.write("</body>");
    writer.write("</html>");
  }

}
