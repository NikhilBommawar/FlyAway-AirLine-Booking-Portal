package com.JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
// import java.sql.Statement;
import java.util.Scanner;
//import java.sql.PreparedStatement;
// import com.mysql.jdbc.PreparedStatement;
// import com.mysql.jdbc.Statement;

public class InsertAirline {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

      try {
    	  Class.forName("com.mysql.jdbc.Driver");
    	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?autoreconnect=true&useSSL=false&usePublicKeyRetrieval=true","root","root");
          PreparedStatement stmt=(PreparedStatement) con.prepareStatement("select * from flighdetails");
          
         // Statement stmt=(Statement)con.createStatement();
          Scanner sc=new Scanner(System.in);
    	  
    	  ResultSet rs=stmt.executeQuery();
          int i=1;  
          while(rs.next()) {
        	  System.out.println(i+" "+rs.getString("FlightID"));
             i++;
             String sql="update flighdetails set Airline=? where FlightID=?";
             PreparedStatement stmt2=(PreparedStatement) con.prepareStatement(sql);
            
            System.out.println("Enetr Airline");
            String airline=sc.next();
            stmt2.setString(1, airline);
            stmt2.setString(2, rs.getString("FlightID"));
            stmt2.execute();
          }
      }
      catch(Exception e) {
    	  System.out.println(e);
      }
		
	}

}
