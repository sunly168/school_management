<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<center>
		<form action="LoginServlet">
			
			<table>
				<tr><td colspan="2" align="center"><h2>SIGN IN</h2></td></tr>
				<tr>
					<td>User Name: </td>
					<td><input type="text" name="un" autofocus /></td>
				</tr>
				<tr>
					<td>Password: </td>
					<td><input type="password" name="pw"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<hr/>
					</td>
				</tr>	
				<tr>
					<td colspan="2">
						<center>
							<input type="submit" value="Sign in" style="background-color:#49743D;font-weight:bold;color:#ffffff;">
						</center>
					</td>
				</tr>
			</table>
		  </form>
	</center>
</html>
