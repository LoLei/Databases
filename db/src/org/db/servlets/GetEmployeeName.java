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
@WebServlet("/GetEmployeeName")
public class GetEmployeeName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEmployeeName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PrintWriter writer = response.getWriter(); 
    writer.println("<html>"); 
    writer.println("<head><title>Get Employee Name</title></head>"); 
    writer.println("<body>"); 
    writer.println("<h1>Get Employee Name!</h1>"); 
    String eage = request.getParameter("eage"); 
    if((eage == null) || (eage.length() == 0)) 
    { 
      printMsg("Can not find an employee with no age!", writer, request); 
      return; 
    } 
    int iage;
    try 
    { 
      iage = Integer.parseInt(eage); 
    } 
    catch(NumberFormatException exc) 
    { 
      exc.printStackTrace(); 
      printMsg("Can not find an employee with an invalid age!", writer, request); 
      return; 
    } 
    String esoftware = request.getParameter("softwarename"); 
    if((esoftware == null) || (esoftware.length() == 0)) 
    { 
      printMsg("Can not find an employee with no software!", writer, request); 
      return; 
    } 
    String eposition = request.getParameter("positionname"); 
    if((eposition == null) || (eposition.length() == 0)) 
    { 
      printMsg("Can not find an employee with no position!", writer, request); 
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
      String insert_sql_stmt = "SELECT last_name, age FROM employees, employee_uses_software, software WHERE "
          + "software.name = \"" + esoftware + "\" AND software.id = employee_uses_software.software_id AND "
          + "employee_uses_software.employees_id = employees.id AND employees.position = \"" + eposition
          + "\" AND employees.age >= " + iage + " ORDER BY age DESC;";
      Statement statement = connection.createStatement();
      ResultSet rs = statement.executeQuery(insert_sql_stmt); 
      boolean exist = false; 
      writer.println("<table>"); 
      while(rs.next()) 
      { 
        exist = true; 
        writer.println("<tr>"); 
        writer.println("<td>" + rs.getString("last_name") + "</td>"); 
        writer.println("<td>" + rs.getInt("age") + "</td>"); 
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
