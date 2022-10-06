<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<style>
body{
background-image:url("a.jpg");
background-repeat:no-repeat;
background-size:cover;
}
</style>
</head>
<body bgcolor="Pink">

<div align="center">
<br>
<marquee direction="right"><h1><p style="color:Yellow">FlyAway Portal</p></h1></marquee><br><br>

<h2 style="color:Blue">Please choose your payment mode</h2>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?autoreconnect=true&useSSL=false&allowPublicKeyRetrieval=true","root","root");	
Statement stmt=(Statement) con.createStatement();
ResultSet rs=stmt.executeQuery("select f1.FlightID,f1.Source,f1.Destination,f1.Time_of_Departure,f1.Travel_Time,f2.Ticket_Price from flighdetails as f1 left join flightticket as f2 on f1.FlightID=f2.FlightID where f1.FlightID='"+session.getAttribute("FlightID")+"'");

rs.first();
%>
Flight Details:        <table border='1' bgcolor="LightGray">
			        		        <tr>
			        				<th>Flight ID</th>
			        				<th>Source</th>
			        				<th>Destination</th>
			        				<th>Time of Departure</th>
			        				<th>Arrival Time</th>
			        				<th>Ticket Fare</th>
			        				
			        				<tr>
			        				<td><%=rs.getString(1)%></td>
			        				<td><%=rs.getString(2)%></td>
			        				<td><%=rs.getString(3)%></td>
			        				<td><%=rs.getString(4)%></td>
			        				<td><%=rs.getString(5)%></td>
			        				<td><%=rs.getString(6)%></td>
			        				</tr> 				
			        				</table>
			        				<br>
<form action="PaymentMode.jsp" >
<b>Please Select the Payment mode</b>
<select name="pay">
 <option value="select">Select</option>
  <option value="phonepay">PhonePay</option>
   <option value="netbanking">NetBanking</option>
    <option value="debit">Debit Card</option>
     <option value="credit">Credit Card</option>
</select>
<input type="submit" value="Confirm">
</form>
<b><a href="index.html">Go back to search page</a></b>	
</div>
</body>
</html>