package group1.exam;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddRoom extends HttpServlet{ 
 
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

			String roomId = request.getParameter("roomId").toString();
			String roomName = request.getParameter("roomName").toString();			
			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				String query = "insert into room(roomid, roomname) values("+roomId+",'"+roomName+"')";
				stmt = conn.createStatement();
            
			    int i = stmt.executeUpdate(query);
				System.out.println("query" + query);
				if(i>0)
				{
					response.sendRedirect("room.jsp");
				}
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}