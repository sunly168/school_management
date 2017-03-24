<%@page language="java"%>
<%@ page import="java.sql.*" %>
<html>
<title>School Management System</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
	body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
	body {font-size:16px;}
	.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
	.w3-half img:hover{opacity:1}
</style>
<head>
</head>
<body>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-16"><b>SCHOOL MANAGEMENT SYSTEM</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="userManagement.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">User Management</a> 
    <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Enrollment</a> 
    <a href="room.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Room</a> 
    <a href="teacher.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Teacher</a> 
    <a href="level.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Level</a>
    <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Student Admission</a>
    <a href="index.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Log off</a>
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>SCHOOL MANAGEMENT SYSTEM</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left:340px;margin-right:40px; padding:20px;">
<br/><br/><br/><br/>
<form name="userform" method="post" action="AddUser">
<br><br><br>
<table width="330px" style="background-color:#EDF6EA;border:1px solid #000000;padding:5px;">
<tr><td colspan=2 style="font-weight:bold;" align="center">Add User</td></tr>
<tr><td colspan=2 align="center" height="10px"></td></tr>
	<%
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/";
		String db = "school_management";
		String driver = "com.mysql.jdbc.Driver";
		String userName ="root";
		String password="123456";
		
		int sumcount=0;
		Statement st;
		try{
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url+db,userName,password);
		String query = "select (count(userid)+1) as newuserid from userlogin";
		st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
	%>
	<%
		while(rs.next()){
	%>
	
	<tr>
		<td style="font-weight:bold;">User Id</td>
		<td><input type="text" name="userId" value=<%=rs.getInt(1)%> readonly></td>
	</tr>
	
	<%
		}
	%>
	<%
		}
		catch(Exception e){
		e.printStackTrace();
		}
	%>
	
	<tr>
		<td style="font-weight:bold;">User Name</td>
		<td><input type="text" name="userName" value="" autofocus></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Password</td>
		<td><input type="text" name="userPassword" value=""></td>
	</tr>
	
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Save" style="background-color:#49743D;font-weight:bold;color:#ffffff;"><input type="button" name="cancel" value="Cancel" style="background-color:#49743D;font-weight:bold;color:#ffffff;" onclick="window.location.href='userManagement.jsp'"></td>		
	</tr>
	<tr><td colspan=2 align="center" height="10px"></td></tr>
</table>
</form>


</body>
</html>