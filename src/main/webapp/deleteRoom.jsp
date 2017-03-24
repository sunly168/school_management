<%@page import="java.sql.*"%>
<%

String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "123456");
Statement st = conn.createStatement();
st.executeUpdate("delete from room where roomid = '"+no+"'");
response.sendRedirect("room.jsp");
}
catch(Exception e){}
%>