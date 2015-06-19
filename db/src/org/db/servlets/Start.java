package org.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Start
 */
@WebServlet("/Start")
public class Start extends HttpServlet {
  private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Start() {
        super();
        // TODO Auto-generated constructor stub
    }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    PrintWriter writer = response.getWriter();
    writer.println("<html>");
    writer.println("<head><title>Overview Servlet</title></head>");
    writer.println("<body>");
    
    // Location
    writer.println("<form method='get' action='/db/InsertLocation'>");
    writer.println("<h1>Insert a new Location:</h1>");
    writer.println("Country: <input type='text' name='locationcountry'/>");
    writer.println("City: <input type='text' name='locationcity'/>");
    writer.println("Street: <input type='text' name='locationstreet'/>");
    writer.println("Street Number: <input type='text' name='locationnumber'/>");
    writer.println("<input type='submit' value='Insert location'/>");
    writer.println("</form>");
    
    // Client
    writer.println("<form method='get' action='/db/InsertClient'>");
    writer.println("<h1>Insert a new Client:</h1>");
    writer.println("ID: <input type='text' name='clientid'/>");
    writer.println("Last name: <input type='text' name='clientlast_name'/>");
    writer.println("First name: <input type='text' name='clientfirst_name'/>");
    writer.println("Age: <input type='text' name='clientage'/>");
    writer.println("Employee ID: <input type='text' name='clientemployeeid'/>");
    writer.println("<input type='submit' value='Insert client'/>");
    writer.println("</form>");
    
    // Products
    writer.println("<form method='get' action='/db/InsertProduct'>");
    writer.println("<h1>Insert a new Product:</h1>");
    writer.println("Name: <input type='text' name='productname'/>");
    writer.println("Type <input type='text' name='producttype'/>");
    writer.println("Value: <input type='text' name='productvalue'/>");
    writer.println("Selling price: <input type='text' name='productselling_price'/>");
    writer.println("<input type='submit' value='Insert product'/>");
    writer.println("</form>");
    
    // Delete Employee
    writer.println("<form method='get' action='/db/DeleteEmployee'>");
    writer.println("<h1>Delete a specific Employee:</h1>");
    writer.println("Employee ID: <input type='text' name='EId'/>");
    writer.println("<input type='submit' value='Delete Employee'/>");
    writer.println("</form>");
    
    // Get names of employees who are older than x years who use
    // software with name y and whose 
    // Position is z
    writer.println("<form method='get' action='/db/GetEmployeeName'>");
    writer.println("<h1>Get all employee, who used a specific software, are older than a specific age and have a specific position:</h1>");
    writer.println("Age: <input type='text' name='eage'/>");
    writer.println("Software name: <input type='text' name='softwarename'/>");
    writer.println("Position name: <input type='text' name='positionname'/>");
    writer.println("<input type='submit' value='Submit'/>");
    writer.println("</form>");
    
    // Get names of employees who used vehicle of type x and brand y
    writer.println("<form method='get' action='/db/GetEmployeeName2'>");
    writer.println("<h1>Get names of employees who used vehicle of type x and brand y</h1>");
    writer.println("Type: <input type='text' name='vtype'/>");
    writer.println("Brand name: <input type='text' name='vbrand'/>");
    writer.println("<input type='submit' value='Submit'/>");
    writer.println("</form>");
    
    // Get names of clients who bought a total x or more and who are y years or younger
    writer.println("<form method='get' action='/db/GetClientName'>");
    writer.println("<h1>Get names of clients who bought a total x or more and who are y years or younger</h1>");
    writer.println("Price: <input type='text' name='cprice'/>");
    writer.println("Age: <input type='text' name='cage'/>");
    writer.println("<input type='submit' value='Submit'/>");
    writer.println("</form>");
        
    // Get location where employees with position x are located
    writer.println("<form method='get' action='/db/GetLocation'>");
    writer.println("<h1>Get all locations where employees with position x are located</h1>");
    writer.println("Position: <input type='text' name='lposition'/>");
    writer.println("<input type='submit' value='Submit'/>");
    writer.println("</form>");
    
    // Get products which were sold after x
    writer.println("<form method='get' action='/db/GetProducts'>");
    writer.println("<h1>Get all products which were sold after x</h1>");
    writer.println("Date: <input type='text' name='pdate'/>");
    writer.println("<input type='submit' value='Submit'/>");
    writer.println("</form>");
    
    // Get employees who used the device from brand x and type y
    writer.println("<form method='get' action='/db/GetEmployees3'>");
    writer.println("<h1>Get employees who used the device from brand x and type y</h1>");
    writer.println("Brand: <input type='text' name='ebrand'/>");
    writer.println("Type: <input type='text' name='etype'/>");
    writer.println("<input type='submit' value='Submit'/>");
    writer.println("</form>");
    
    writer.println("<body>");
    writer.println("</html>");
    writer.close(); 
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
  }

}
