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
<title>Source-Destination list</title>
<style>
body{
background-image:url("a.jpg");
background-repeat:no-repeat;
background-size:cover;
}
</style>
</head>
<body>
<div align="center">
<br><br>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?"
		+"autoreconnect=true&useSSL=false&usePublicKeyRerieval=true","root","root");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select Source,Destination,Time_of_Departure from flighdetails");
%>
<jsp:include page="AdminHome.html"></jsp:include>
<h3 style="color:red"> Source Destination List </h3>
 <table border="1">
  <tr>
   <th>Source</th>
   <th>Destination</th>
   <th>Departure Time</th>         
 </tr>

<% while(rs.next()){%>
   <tr>
   <td><%=rs.getString("Source")%></td>
   <td><%=rs.getString("Destination")%></td>
   <td><%=rs.getString("Time_of_Departure")%></td>
   </tr>  
	
<%}%>
 </table>
 </div>
</body>
</html>