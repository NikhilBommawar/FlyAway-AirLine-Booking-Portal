package com.Servlet1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class FlightDetails
 */
public class FlightDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FlightDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {    // creating connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?autoreconnect=true&useSSL=false&allowPublicKeyRetrieval=true","root","root");	
		    
			//creating statement
		   Statement stmt=(Statement) con.createStatement();
		   
		   // getting inputs from client browser
		    String src=request.getParameter("source");
			String desti=request.getParameter("destination");
			
		   // fetching details from database 
		   ResultSet rs=stmt.executeQuery("select f1.FlightID,f1.Source,f1.Destination,f1.Time_of_Departure,f1.Travel_Time,f2.Ticket_Price\r\n"
		   		+ " from flighdetails as f1 left  join flightticket as f2 on f1.FlightID=f2.FlightID ");
		   int count=1;
		   PrintWriter out=response.getWriter();
	        out.print("<html><head><style>\r\n"
	        		+ "body{\r\n"
	        		+ "background-image:url(\"a.jpg\");\r\n"
	        		+ "background-repeat:no-repeat;\r\n"
	        		+ "background-size:cover;\r\n"
	        		+ "}\r\n"
	        		+ "</style></head><body bgcolor='pink'>"); 
	        out.print("<div align='center'>");
	        out.print("<marquee direction='right'><h1><p style='color:Yellow'>Welcome to FlyAway Portal</p></h1></marquee>");
	       
	        out.print("<h3><p style='color:Yellow'>The available flights are</p></h3>");
			while(rs.next()) {
				if(src.equalsIgnoreCase(rs.getString("Source"))&&desti.equalsIgnoreCase(rs.getString("Destination"))) {
				 
				
					
			        out.print("<br>");
			        out.print("<form action='CustomerRegister.jsp' >");
					out.println(count);
			        out.print(
			        		"<table border='1' bgcolor='LightGray'>"
			        		        +"<caption>Flight Details</caption>"
			        				+"<tr>"
			        				+ "<th>Flight ID</th>"
			        				+ "<th>Source</th>"
			        				+ "<th>Destination</th>"
			        				+ "<th>Time of Departure</th>"
			        				+ "<th>Arrival Time</th>"
			        				+ "<th>Flight Fare</th>"
			        				+"</tr>"
			        				+"<tr>"
			        				+ "<td>"+rs.getString(1)+"</td>"
			        				+ "<td>"+rs.getString(2)+"</td>"
			        				+ "<td>"+rs.getString(3)+"</td>"
			        				+ "<td>"+rs.getString(4)+"</td>"
			        				+ "<td>"+rs.getString(5)+"</td>"
			        				+ "<td>"+rs.getString(6)+"</td>"
			        				+"</tr>"   				
			        				+ " </table>"
			        		);
			        out.print("<br>");
			        out.print("Flight ID: <input type='text' name='FlightID' value="+rs.getString(1)+" readonly>");		
			        out.print("<br>");
			     //   out.print("Flight Fare: <input type='text' name='ticketprice' value="+rs.getString(6)+" readonly>");	
			        out.print("<input type='submit' value='Select'>");		
			    	    out.print("</form>");
                     out.print("<br>");
				       count+=1;
					
				
				}
				
			}
			out.print("<b><a href=\"index.html\">Go back to search page</a></b>	</div></body></html>");

		
		}
		catch(Exception e) {
			System.out.println(e);
		}
	
	
	}

}
