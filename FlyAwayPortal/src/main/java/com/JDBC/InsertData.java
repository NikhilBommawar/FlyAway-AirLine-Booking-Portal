package com.JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class InsertData {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?autoreconnect=true&useSSL=false&allowPublicKeyRetrieval=true","root","root");	
		   
		    Scanner sc=new Scanner(System.in);
		
		    /*	    for(int i=0;i<25;i++) {
		    	PreparedStatement stmt=con.prepareStatement("insert into flighdetails values(?,?,?,?,?)");
	        	System.out.println("1 Enter Flight ID");
		    	String id=sc.next();
		    	System.out.println("2 Enter source");
		    	String source=sc.next();
		    	System.out.println("3 Enter Desitination");
		    	String dest=sc.next();
		    	System.out.println("4 Enter ToD");
		    	String tod=sc.next();
		    	System.out.println("5 Enter ToJ");
		    	String toj=sc.next();
		    	stmt.setString(1, id);
		    	stmt.setString(2, source);
		    	stmt.setString(3, dest);
		    	stmt.setString(4, tod);
		    	stmt.setString(5, toj);
		    	stmt.execute();

	
		*/
		    
		    
		 int j;
		
		for(j=0;j<25;j++) {
			PreparedStatement stmt=con.prepareStatement("insert into flightticket values(?,?)");
        	System.out.println("1 Enter Flight ID");
	    	String id=sc.next();
	    	System.out.println("2 Enter Tickt Price");
	    	String tkt=sc.next();
	    	stmt.setString(1, id);
	    	stmt.setString(2, tkt);
	    	stmt.execute();
		
		}
		    
		    
		 System.out.println("Number of entries inserted= "+j);
		
		}
		catch(Exception e) {
			System.out.println(e);
		}
	
	}

}
