<%@page import="java.sql.*"%>

<%
String ide=request.getParameter("userid");
int num=Integer.parseInt(ide);
String username=request.getParameter("username");
String userpassword=request.getParameter("userpassword");

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management","root", "123456");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update userlogin set username='"+username+"',userpassword='"+userpassword+"' where userid='"+num+"'");
response.sendRedirect("userManagement.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>