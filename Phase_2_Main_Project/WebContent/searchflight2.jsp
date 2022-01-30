<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@ page import = "java.util.Date" %> 
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String name=(String)session.getAttribute("user"); %>

<%!
    Connection con;
    PreparedStatement ps1, ps2;
    public void jspInit()
    {
        try
        {
            //loading the driver
            Class.forName("com.mysql.jdbc.Driver");
            //establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_world","root","ROOT");
            //create statement object
            ps1 = con.prepareStatement("select count(*) from flightdetails where srccity =? and destcity=?");
     
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
  
        //write jdbc code for authentication
        String src = request.getParameter("srccityy");
        String dest = request.getParameter("destcityy");
        		
       
        //set form data as param value
        ps1.setString(1,src);
        ps1.setString(2,dest);
        //ps1.setDate(3,parameter);
        
        
        //excute the query
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
            cnt = rs.getInt(1);
        if(cnt == 0){
        	request.getRequestDispatcher("searchflights.jsp").include(request, response);
            out.println("<SPAN style ='color:red'> No flights available </SPAN>");
       	
        } 
        else
        {%>
        	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_world"  
     user="root"  password="ROOT"/>  



<sql:query dataSource="${db}" var="rs">  
	SELECT flightno,airline_name,price,depttimesrc,desttime from flightdetails where srccity="<%= request.getParameter("srccityy") %>" and destcity="<%=request.getParameter("destcityy") %>";  
</sql:query>  
    
<table border="2" width="100%">  
<tr>  
<th>flight no</th>  
<th>Airline name</th>  
<th>Arrival Time</th> 
<th>Dept Time</th>  
<th>Price</th>  


</tr>  
	<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td> <a href ="registerdetails.jsp"> <c:out value="${table.flightno}"/></a></td>  
			<td><c:out value="${table.airline_name}"/></td> 
			<td><c:out value="${table.depttimesrc}"/></td>
			<td><c:out value="${table.desttime}"/></td> 
			<td><c:out value="${table.price}"/></td>  
			  
			
		</tr>  
	</c:forEach>  
</table>  
       <%}
        
       
%>
<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>