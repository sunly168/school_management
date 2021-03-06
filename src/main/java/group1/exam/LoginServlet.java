package group1.exam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
		try
		{
		     UserBean user = new UserBean();
		     user.setUserName(request.getParameter("un"));
		     user.setPassword(request.getParameter("pw"));
		
		     user = UserDAO.login(user);
			   		    
		     if (user.isValid())
		     {
			        
		          HttpSession session = request.getSession(true);	    
		          session.setAttribute("searchId",""); 
		          response.sendRedirect("dashBoard.jsp");     		
		     }
			        
		     else 
		          response.sendRedirect("invalidLogin.jsp"); 
		}		
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
    }
}
