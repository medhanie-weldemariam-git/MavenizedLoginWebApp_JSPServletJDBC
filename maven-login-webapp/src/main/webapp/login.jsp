<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%
	String tempUserName= null;
	String tempPassword = null;
	
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/medhaniedb",
            "postgres", "thisshouldbeyourpassword");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from registeration where userName='" + userName + "' and password='" + password + "'");
    
    while(rs.next())
    {
    	tempUserName= rs.getString("username");
		tempPassword = rs.getString("password");
    }
    
    if(userName.equals(tempUserName) && password.equals(tempPassword))
	{
    	session.setAttribute("username", userName);
		response.sendRedirect("success.jsp");
	}
	else
	{
		out.println("Invalid password <a href='index.jsp'>try again</a>");
	}
%>

</body>
</html>