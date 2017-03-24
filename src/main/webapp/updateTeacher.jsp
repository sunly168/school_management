<%@page import="java.sql.*"%>

<%
String ide=request.getParameter("teacherid");
int num=Integer.parseInt(ide);
String teacherName=request.getParameter("teachername");
String gender=request.getParameter("gender");
String roomId=request.getParameter("roomid");
String levelId=request.getParameter("levelid");
String phoneNumber=request.getParameter("phonenumber");
String email=request.getParameter("email");

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management","root", "123456");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update teacher set teachername='"+teacherName+"',gender='" + gender + "',roomid=" + roomId + ",levelid=" + levelId + ",phonenumber='" + phoneNumber + "',email='" + email + "' where teacherid='"+num+"'");
response.sendRedirect("teacher.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>