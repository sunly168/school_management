<%@ page import="java.sql.*" %>
<html>
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
<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='delete.jsp?id='+id;
    f.submit();
}
</script>
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
<a href="addUser.jsp" style="font-weight:bold;color:#cc0000;">Add New User</a>
<br/><br/>
<form method="post" name="form">
<table border="1">
<tr><th>User Id</th><th>User Name</th><th>Password</th><th>Edit</th><th>Delete</th></tr>
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
String query = "select * from userlogin";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>

<%
while(rs.next()){
%>
<tr><td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><input type="button" name="edit" value="Edit" style="background-color:#49743D;font-weight:bold;color:#ffffff;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td><input type="button" name="delete" value="Delete" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>
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
</table>
</form>
</div>
</body>
</html>