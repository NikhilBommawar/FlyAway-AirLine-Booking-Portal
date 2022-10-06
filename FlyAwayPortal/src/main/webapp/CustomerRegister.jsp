<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cusrtomer Details</title>
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
<br><marquee direction="right"><h1><p style="color:Yellow">FlyAway Portal</p></h1></marquee><br>
<h2 style="color:Green">Hurray you are just one step away from your flight with Flight ID <% out.print(request.getParameter("FlightID"));%></h2>
<h3 style="color:Blue">Please fill the following credentials</h3>
<%session.setAttribute("FlightID", request.getParameter("FlightID")); %>
<form action="ConfirmDetails.jsp">
Name:<input type="text" name="fname"/><br>
ID Proof No:<input type="text" name="id"/><br>
Address:<input type="text" name="address"/><br>
Mobile:<input type="text" name="mobile"/><br>
Email ID:<input type="email" name="email"/><br>
Your Flight ID:<input type="text" value=<%=session.getAttribute("FlightID")%> name="FlightID" readonly><br>
<input type="submit" value="Submit"/>
</form>
<b><a href="index.html">Go back to search page</a></b>	
</div>
</body>
</html>