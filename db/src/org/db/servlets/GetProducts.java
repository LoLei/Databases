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
@WebServlet("/GetProducts")
public class GetProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PrintWriter writer = response.getWriter();
    writer.println("<html>");
    writer.println("<head><title>Get Product</title></head>");
    writer.println("<body>");
    writer.println("<h1>Get Product!</h1>");
    String date = request.getParameter("pdate");
    if((date == null) || (date.length() == 0))
    {
      printMsg("Can not find a product with no date!", writer, request);
      return;
    }
    try
    {
      Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException exc)
    {
      exc.printStackTrace();
      printMsg("Can not get a product: no JDBCriver found!", writer, request);
      return;
    }
    try
    {
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root");
      //referential integrity gets checked here!!!
			String insert_sql_stmt = "SELECT name FROM products, sale_has_products, sales WHERE "
					+ "sales.date >  \"" + date + "\" "
					+ "AND sales.id = sale_has_products.sales_id "
					+ "AND sale_has_products.products_id = products.id";
      writer.println(insert_sql_stmt);
      Statement statement = connection.createStatement();
      ResultSet rs = statement.executeQuery(insert_sql_stmt);
      boolean exist = false;
      writer.println("<table>");
      while(rs.next())
      {
        exist = true;
        writer.println("<tr>");
        writer.println("<td>" + rs.getString("name") + "</td>");
        writer.println("</tr>");
      }
      if(exist == false)
      {
        printMsg("No Product found!", writer, request);
      }
      else
      {
        writer.println("<a href = \"" + request.getHeader("Referer") + "\">Back</a>\n");
      }
    }
    catch(SQLException exc)
    {
      exc.printStackTrace();
      printMsg("Can not find a product: database error!", writer, request);
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
