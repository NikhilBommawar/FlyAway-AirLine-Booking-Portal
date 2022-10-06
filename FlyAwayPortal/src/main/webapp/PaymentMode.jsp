<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PayMode</title>
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
<br><br>
<marquee direction="right"><h1><p style="color:Yellow">FlyAway Portal</p></h1></marquee><br>
<% 
String paymode=request.getParameter("pay");
if(paymode.equals("phonepay")){%>
<form action="DonePayment.jsp">
PhonePay Number: <input type="text"><br>
Pin: <input type="password"><br>
<input type="submit" value="Pay">
</form>   
	
<%}
else if(paymode.equals("netbanking")){%>
	<form action="DonePayment.jsp">
User ID: <input type="text"><br>
Password: <input type="password"><br>
<input type="submit" value="Pay">
</form>   
<%}
else if(paymode.equals("credit")){%>
<form action="DonePayment.jsp">
Credit Card Number <input type="text"><br>
Pin <input type="password"><br>
<input type="submit" value="Pay">
</form>   	
<%}
else if(paymode.equals("debit")){%>
<form action="DonePayment.jsp">
Debit Card Number <input type="text"><br>
Pin <input type="password"><br>
<input type="submit" value="Pay">
</form> 	
<%}
%>

<b><a href="index.html">Go back to search page</a></b>	

</div>

</body>
</html>