<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Master List</title>
</head>
<body>
<div align="center"> 
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?"
		+"autoreconnect=true&useSSL=false&usePublicKeyRerieval=true","root","root");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from flighdetails");
%>
<jsp:include page="AdminHome.html"></jsp:include>
<h3 style="color:red"> Master List of Flights </h3>
 <table border="1">
  <tr>
  <th>Flight ID</th>
   <th>Source</th>
   <th>Destination</th>
   <th>Airline</th>
   <th>Departure Time</th>         
 </tr>

<% while(rs.next()){%>
   <tr>
   <td><%=rs.getString(1)%></td>
   <td><%=rs.getString(2)%></td>
   <td><%=rs.getString(3)%></td>
   <td><%=rs.getString(4)%></td>
   <td><%=rs.getString(5)%></td>
   </tr>  
	
<%}%>
 </table>
</div>
</body>
</html>