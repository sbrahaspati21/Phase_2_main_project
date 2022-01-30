<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String name=(String)session.getAttribute("user"); %>

<jsp:useBean id="hello" class="project.com.userdetails" scope="session"></jsp:useBean>
<center><h2>Review your details.</h2><br>
    Full Name  : <jsp:getProperty name="hello" property="fullname" />  <br><br>
       Age :     <jsp:getProperty name="hello" property="age" />  <br><br>
      Address :  <jsp:getProperty name="hello" property="address" />  <br><br>
	Email Id  :  <jsp:getProperty name="hello" property="emailid" />  <br><br>
	Mobile no :	 <jsp:getProperty name="hello" property="mobileno" />  <br><br>
	Id type :	 <jsp:getProperty name="hello" property="idtype" />  <br><br>
	Id number :	 <jsp:getProperty name="hello" property="idno" />  <br><br>

<form action="payment.jsp" method="post">
<button>Make Payment</button></form>
</center>
</body>
</html>