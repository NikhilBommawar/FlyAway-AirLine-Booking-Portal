<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<style>
body{
background-image:url("a.jpg");
background-repeat:no-repeat;
background-size:cover;
}
</style>
</head>
<body bgcolor="pink">
<div align="center">

<br>
<marquee direction="right"><h1><p style="color:Yellow">FlyAway Portal</p></h1></marquee><br><br><br>
<h2 style="color:violet">Hurray !!!!!!  Congratulations <%=session.getAttribute("name")%> </h2>
<h3 style="color:Green">Your Flight is booked Successfully</h3>
<b><a href="index.html">Go back to search page</a></b>	
<img src="2.jpg" height="300" width="500">
</div>

</body>
</html>