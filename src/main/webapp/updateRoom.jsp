<%@page import="java.sql.*"%>

<%
String ide=request.getParameter("roomid");
int num=Integer.parseInt(ide);
String roomname=request.getParameter("roomname");

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management","root", "123456");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update room set roomname='"+roomname+"' where roomid='"+num+"'");
response.sendRedirect("room.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>