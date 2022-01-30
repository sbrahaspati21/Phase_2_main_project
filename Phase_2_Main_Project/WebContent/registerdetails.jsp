<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String name=(String)session.getAttribute("user"); %>
<center><h2>Enter your details.</h2><form action="registerdetails2.jsp" method="post">
<td> Name : <input type="text" name="fullname"></td>
Age : <input type="text" name="age">
   Address : <input type="text" name="address"></td><br><br>
Email Id : <input type="text" name="emailid">
Mobile No : <input type="text" name="mobileno"><br><br>
Select Id :          <select class="idtype" name="idtype">
<option value="Select">Select</option>
    <option value="Aadhar Number">Aadhar Number</option>
    <option value="Pan Card">Pan Card</option>
    <option value="Passport">Passport</option>
    <option value="Voter Id">Voter Id</option>
    <option value="Driving License">Driving License</option>
  </select><br><br>
  Enter Id no : <input type="text" name="idno"/><br><br><br>
  <button>Submit</button>

</form></center>


</body>
</html>