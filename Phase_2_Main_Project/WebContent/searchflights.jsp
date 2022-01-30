<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<% String name=(String)session.getAttribute("user"); %>
Login successful
<center><h2>Find your flight....</h2><br><br><br>
<form action="searchflight2.jsp" method="post">

From : <select name = "srccityy">
<option value ="Select">Select City</option>
<option value ="surat">surat</option>
<option value ="mumbai">mumbai</option>
</select>
   To : <select name = "destcityy">
<option value ="Select">Select City</option>
<option value ="pune">pune</option>
<option value ="goa">goa</option>
</select>
<br/>
<br/>Date of Travel :  <input type="text" id="datepicker"> 
<script>
$( function() {
    $.datepicker.setDefaults({
        onClose:function(date, inst){
            $("#selectedDtaeVa").html(date);
        }
    });
    $( "#datepicker" ).datepicker({
    		dateFormat:"yy-mm-dd"		
    });
});
</script>
<br/>
<br/>
Number of Person :
<select name = "Select">select
<option value ="Select">No of Person</option>
<option value ="1">1</option>
<option value ="2">2</option>
<option value ="3">3</option>
<option value ="4">4</option>
<option value ="5">5</option>
<option value ="6">6</option>
</select><br><br>
<button>Search</button>
</form>
</center>
</body>
</html>