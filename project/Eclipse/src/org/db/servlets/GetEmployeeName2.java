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
 * Servlet implementation class GetEmployeeName
 */
@WebServlet("/GetEmployeeName2")
public class GetEmployeeName2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEmployeeName2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PrintWriter writer = response.getWriter(); 
    writer.println("<html>"); 
    writer.println("<head><title>Get Employee Name 2</title></head>"); 
    writer.println("<body>"); 
    writer.println("<h1>Get Employee Name 2!</h1>"); 
    String vtype = request.getParameter("vtype"); 
    if((vtype == null) || (vtype.length() == 0)) 
    { 
      printMsg("Can not find a vehicle with no type!", writer, request); 
      return; 
    }
    String vbrand = request.getParameter("vbrand"); 
    if((vbrand == null) || (vbrand.length() == 0)) 
    { 
      printMsg("Can not find a vehicle with no brand!", writer, request); 
      return; 
    }
    try 
    { 
      Class.forName("com.mysql.jdbc.Driver"); 
    } 
    catch(ClassNotFoundException exc) 
    { 
      exc.printStackTrace(); 
      printMsg("Can not insert a movie : no JDBCriver found!", writer, request); 
      return; 
    } 
    try
    {
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root"); 
      //referential integrity gets checked here!!! 
      String insert_sql_stmt = "SELECT employees.last_name, employees.first_name, employees.age, "
          + "employees.position FROM employees, employee_used_vehicles, vehicles "
          + "WHERE employee_used_vehicles.employees_id = employees.id "
          + "AND employee_used_vehicles.vehicles_id = vehicles.id "
          + "AND vehicles.brand = \"" + vbrand + "\" "
          + "AND vehicles.type = \"" + vtype +"\" ORDER BY employees.last_name;";
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
        writer.println("<td>" + rs.getInt("age") + "</td>"); 
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
