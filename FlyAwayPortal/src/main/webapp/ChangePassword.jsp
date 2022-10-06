<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangePassword</title>
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
<jsp:include page="AdminHome.html"></jsp:include>
<h3 style="color:blue">Are you sure to change the password ???</h3>

<form action="">
UserID:<input type="text" name="uid"><br>
New Password:<input type="text" name="newpass"><br><br>
<input type="submit" value="Change Password" name="submit"><br>
</form>


<% 
if(request.getParameter("submit")!=null){
	String uid=request.getParameter("uid");
	String password=request.getParameter("newpass");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?"
			+"autoreconnect=true&useSSL=false&usePublicKeyRerieval=true","root","root");
    PreparedStatement stmt=con.prepareStatement("update admin_login set Password=? where UserID=?");
    stmt.setString(1, password);
    stmt.setString(2,uid);
    stmt.execute();  %>
    <br>
   <b style="color:green">    <% out.println("New password updated");%> </b>
<%}
%>
</div>
</body>
</html>