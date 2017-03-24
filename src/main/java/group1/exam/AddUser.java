package group1.exam;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddUser extends HttpServlet{ 
 
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			System.out.println("MySQL Connect Example.");
			Connection conn = null;
			String url = "jdbc:mysql://localhost:3306/";
			String dbName = "school_management";
			String driver = "com.mysql.jdbc.Driver";
			String userName = "root"; 
			String password = "123456";

			String user_Id = request.getParameter("userId").toString();
			String user_Name = request.getParameter("userName").toString();
			String user_Password = request.getParameter("userPassword").toString();		
			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				String query = "insert into userlogin(userid, username, userpassword) values("+user_Id+",'"+user_Name+"','"+user_Password+"')";
				stmt = conn.createStatement();
            
			    int i = stmt.executeUpdate(query);
				System.out.println("query" + query);
				if(i>0)
				{
					response.sendRedirect("userManagement.jsp");
				}
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}