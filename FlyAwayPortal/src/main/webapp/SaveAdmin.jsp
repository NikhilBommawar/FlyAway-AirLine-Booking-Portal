<%@page import="java.sql.PreparedStatement"%>
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
<title>Save Admin</title>
</head>
<body>
<div align="center"> 
<jsp:include page="AdminLogin.html"></jsp:include>
<%

 String uid=request.getParameter("uname");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?"
		+"autoreconnect=true&useSSL=false&usePublicKeyRerieval=true","root","root");
PreparedStatement pstmt=con.prepareStatement("insert into admin_login values(?,?)");
pstmt.setString(1,uid);
pstmt.setString(2,password);
pstmt.execute();
%>
<h3 style="color:green"> Hurray, you registered successfully as ADMIN </h3>
 </div>
</body>
</html>