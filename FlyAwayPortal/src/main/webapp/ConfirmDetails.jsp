<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
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
<marquee direction="right"><h1><p style="color:Yellow">FlyAway Portal</p></h1></marquee><br>
<h2 style="color:Green">Please Confirm your details...</h2>
	                        <table border='1' bgcolor="LightGray">
			        		        
			        		        <tr>
			        				 <th>Name</th>
			        				<th>ID Proof No.</th>
			        				<th>Address</th>
			        				<th>Mobile No.</th>
			        				<th>Email ID</th>
			        				<th>FlightID</th>	
			        				</tr>
			        				<tr>
			        				<td><%=request.getParameter("fname") %></td>
			        				<td><%=request.getParameter("id") %></td>
			        				<td><%=request.getParameter("address") %></td>
			        				<td><%=request.getParameter("mobile") %></td>
			        				<td><%=request.getParameter("email") %></td>
			        				<td><%=request.getParameter("FlightID") %></td>
			        				</tr>  				
			        		</table>
			  <% 
			  session.setAttribute("name", request.getParameter("fname"));
			  
			  %>      		
		<form action="PaymentGateway.jsp" >
		<input type="submit" value="Proceed for Payment">
		</form>
		<form action="CustomerRegister.jsp" >
	Click below to Edit your details <br>	
	<input type="submit" name="FlightID" value="<%=request.getParameter("FlightID")%>" >
		</form>
	<b><a href="index.html">Go back to search page</a></b>	
</div>	
<img src="D:\a.jpg" alt="Pic loading...."  >		        		
</body>
</html>