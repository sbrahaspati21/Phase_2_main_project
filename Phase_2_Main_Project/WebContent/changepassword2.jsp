
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
 content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String pwd = request.getParameter("oldpassword");
String chg = request.getParameter("cnfmpassword");
String username = request.getParameter("username");%>
<%--Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_world",
        "root", "ROOT");
Statement st = con.createStatement();
ResultSet rs;

st.executeUpdate("update user set password='" + chg + "' where password='" + pwd + "'");
request.getRequestDispatcher("loginpage.jsp").include(request, response);
out.println("<SPAN  style ='color:red' 'text-align: centre'> Password change </SPAN>");
 --%>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_world"  
     user="root"  password="ROOT"/>  
<sql:query dataSource="${db}" var="rs">  
	SELECT password from user;  
</sql:query>  

<c:set var="password" value="<%=pwd %>"/>  
	<sql:update dataSource="${db}" var="count">  
		update user set password="<%=chg%>" WHERE password =?
	 <sql:param value="${password}" />  

</sql:update> 
	<% request.getRequestDispatcher("loginpage.jsp").include(request, response);
out.println("<SPAN  style ='color:red' 'text-align: centre'> Password change </SPAN>");
%> 
</body>
</html>



