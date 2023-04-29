<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.*, java.time.format.DateTimeFormatter" %>
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="Header.jsp"%>

<meta charset="UTF-8">
	<link rel="stylesheet" href="myStyles.css">
	<style>
		tr, td{
			padding: 8px;
		}
	</style>
<title>Insert title here</title>
</head>
<body Class="NotHeaderBody">
	<%
	String url = "jdbc:mysql://localhost:3306/BookEvent?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String password = "Alpha@123";
	    
		try (Connection myConn = DriverManager.getConnection(url, user, password);) {
			Statement st = myConn.createStatement();
			ResultSet rs = st.executeQuery("SELECT Name , TktNum, CityName , EventDate , EventTime, BookedDate, BookedTime, Price FROM Booking INNER JOIN Events ON Booking.eId = Events.eId WHERE  cId = " + session.getAttribute("cId"));
			//System.out.println("SELECT Name , TktNum, CityName , EventDate , EventTime, BookedDate, BookedTime, Price FROM Booking INNER JOIN Events ON cId = " + session.getAttribute("cId"));
			%><div class="custContainer"><%
			while(rs.next()){
				%> <div class = "items">
				
						<h1><%= rs.getInt("TktNum") %></h1>
						<b>TicketNum</b><br>`
						<table style="text-align: left">
							
							<tr><th>Name : </th><td><%= rs.getString("Name") %></td></tr>
							<tr><th>CityName : </th><td><%= rs.getString("CityName") %></td></tr>
							<tr><th>EventDate : </th><td><%= rs.getString("EventDate") %></td></tr>
							<tr><th>EventTime  :</th><td><%= rs.getString("EventTime") %></td></tr>
							<tr><th>Price  :</th><td><%= rs.getInt("Price") %></td></tr>
					
						</table>
					</div>
				<%
			}
			%></div>
			
			<br><br><br>
			<%
			
			myConn.close();
		}
		catch(SQLException ex){
	        System.err.println(ex.getMessage());
	    }
	
	
	
	
	%>
</body>

<%@ include file="Footer.jsp"%>
</html>