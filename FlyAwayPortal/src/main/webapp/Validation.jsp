<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validation</title>
<style>
body{
background-image:url("a.jpg");
background-repeat:no-repeat;
background-size:cover;
}
</style>
</head>
<body>

<%! 

String user;
String pass;
// int flag=0;
%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?autoreconnect=true&useSSL=false&usePublicKeyRerieval=true","root","root");
Statement stmt=con.createStatement();
user=request.getParameter("uid");
pass=request.getParameter("password");
ResultSet rs=stmt.executeQuery("select * from admin_login");
rs.beforeFirst();
while(rs.next()){
	if(user.equals(rs.getString(1))&&pass.equals(rs.getString(2))){
		
	//	flag=1;
		%>
		<jsp:forward page="AdminHome.html"/>        
		
		<% 
	   response.getWriter().write("Login Successfull");	
	}
	} 
//  if(flag==0){
//	out.print("Wrong Credentials Try Again");
	
	%><div align="center"><br><br>
	<h3><p style="color:red"> Wrong Credentials Try Again</p></h3>
	</div>
	<jsp:include page="AdminLogin.html"/>  
    <%
//	 }


%>
</body>
</html>