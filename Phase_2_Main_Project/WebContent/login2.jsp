<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ page import ="java.sql.*" %>
    <%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("username");
session.setAttribute("user", name);
%>

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
            ps1 = con.prepareStatement("select count(*) from user where username =? and password=?");
            ps2 = con.prepareStatement("select * from user");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
  
        //write jdbc code for authentication
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        //set form data as param value
        ps1.setString(1,user);
        ps1.setString(2,pass);
        //excute the query
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
            cnt = rs.getInt(1);
        if(cnt == 0){
        	request.getRequestDispatcher("loginpage.jsp").include(request, response);
            out.println("<SPAN style ='color:red'> Invalid Password </SPAN>");
       	
        } 
        else
        {
        	response.sendRedirect("searchflights.jsp");
        }
    
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
