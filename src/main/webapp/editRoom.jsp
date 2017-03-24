<%@page language="java"%>
<%@page import="java.sql.*"%>
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
<form method="post" action="updateRoom.jsp">
<table border="1">
<tr><th>Room Id</th><th>Room Name</th></tr>
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "123456");
String query = "select * from room where roomid='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><input type="text" name="roomid" value="<%=rs.getString("roomid")%>" readonly></td>
<td><input type="text" name="roomname" value="<%=rs.getString("roomname")%>"></td>
</tr>
<tr>
<td colspan="3" align="right">	
	<input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;">
	<input type="button" name="cancel" value="Cancel" style="background-color:#49743D;font-weight:bold;color:#ffffff;" onclick="window.location.href='room.jsp'">
</td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</form>
</body>
</html>