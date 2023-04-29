<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="myStyles.css">
<%@ page import="java.sql.*" %>
<%@ include file="Header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="NotHeaderBody">
	<%		
		if(session.getAttribute("user") == null){
			response.sendRedirect("UserLogin.jsp");
		}
	
	%>
	
	<h2 class="Ask" style="text-align: center;">Want to add Events??</h2>
	<form name="itemsForm" action="AddEvent.jsp">
		<table>
			<tr><th>Event Name : </th><td><input type="text" name="Name"></td></tr>
			<tr><th>Event Category : </th><td><input type="text" name="Category"></td></tr>
			<tr><th>City Name : </th><td><input type="text" name="CityName"></td></tr>
			<tr><th>Event Date  :</th><td><input type="Date" name="EventDate"></td></tr>
			<tr><th>Event Time  :</th><td><input type="Time" name="EventTime"></td></tr>
			<tr><th>Total Seats  :</th><td><input type="number" name="TotalSeats"></td></tr>
			<tr><th>Available Seats  :</th><td><input type="number" name="AvailSeats"></td></tr>
			<tr><th>Price  :</th><td><input type="text" name="Price"></td></tr>
			<tr><th>Image  :</th><td><input type="text" name="Image"></td></tr>
			<tr><th></th><td><input type="submit" name="submit" value="Add Event" style="width: 50%"> </td></tr>
		</table>
		
	</form>
	<br><br><br>
	
</body>

<script type="text/javascript">
	/*function Validate(num){
		//alert("Hi");
		var qty = document.forms["myForm" + num]["qtyNow"].value;
		if(qty == ""){
			alert("Enter all fields");
			return false;
		}	
		if(isNaN(qty)){
			alert("Only numbers are allowed");
			return false;
		}
		if(qty < 0){
			alert("Only positive numbers are allowed");
			return false;
		}
		return true;
	}
	
	function ValidateItems(){
		alert(`${document.forms["itemsForm"]["itemName"].value}`);
		var itemName = document.forms["itemsForm"]["itemName"].value;
		var itemDesc = document.forms["itemsForm"]["itemDesc"].value;
		var qty = document.forms["itemsForm"]["qty"].value;
		var price = document.forms["itemsForm"]["price"].value;
		var image = document.forms["itemsForm"]["image"].value;
		
		if(itemName == "" || itemDesc == "" || qty == "" || price == "" || image == ""){
			alert("Enter all fields");
			return false;
		}	
		if(isNaN(qty) || isNaN(price)){
			alert("Only numbers are allowed for qty and price");
			return false;
		}
		if(qty < 0 || price < 0){
			alert("Only positive numbers are allowed for qty and price");
			return false;
		}
		return true;
	}*/


</script>

</html>

<%@ include file="Footer.jsp"%>