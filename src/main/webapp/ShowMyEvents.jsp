<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="Header.jsp"%>

<meta charset="UTF-8">
	<link rel="stylesheet" href="myStyles.css">
<title>Customer Home Page</title>
</head>
<body Class="NotHeaderBody">

	<%
		String url = "jdbc:mysql://localhost:3306/BookEvent?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	    String user = "root";
	    String password = "Alpha@123";
	    
		try (Connection myConn = DriverManager.getConnection(url, user, password);){
			
		    Statement st = myConn.createStatement();
		    Statement mySt = myConn.createStatement();
		    
		    ResultSet rs = st.executeQuery("SELECT * FROM Events WHERE aId = " + session.getAttribute("aId"));
		    
		
		%>
		
	<div class="custContainer">
		<%
			 while(rs.next()){
			%><div class="items">
			
			<img src=<%= rs.getString("Image") %> style="width: 100%; height: 300px"><br><br>
			<b>Event Name</b> :
			<%=rs.getString("Name") %><br><br>
			<b>City Name</b> :
			<%=rs.getString("CityName") %><br>
			<br> <b>Category</b> :
			<%=rs.getString("Category")%><br>
			<br> <b>Event Date</b> :
			<%=rs.getString("EventDate")%><br>
			<br><b>Event Time</b> :
			<%=rs.getString("EventTime")%><br>
			<br> <b>Total Seats</b> :
			<%=rs.getInt("TotalSeats")%><br>
			<br> <h1><b>Remaining seats</b> :
			<%=rs.getInt("AvailSeats")%></h1><br>
			 <b>Price</b> :
			<%=rs.getInt("price")%><br><br>
		</div>
		
		<%
			   		
			   	}
			
		%>
		</div>
		
		<%
		}catch(SQLException ex) {
		    	System.err.println(ex.getMessage());
		    }
		
		%>

	
	<br><br><br>

</body>

<script type="text/javascript">
	function Validate(){
		//alert("Hi");
		var view = document.forms["myForm"]["view"].value;
		if(view == ""){
			alert("Enter all fields");
			return false;
		}	
		if(isNaN(view)){
			alert("Only numbers are allowed");
			return false;
		}
		if(view < 0){
			alert("Only positive numbers are allowed");
			return false;
		}
		return true;
	}


</script>
<%@ include file="Footer.jsp"%>
</html>