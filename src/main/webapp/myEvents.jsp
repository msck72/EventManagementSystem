<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.*, java.time.format.DateTimeFormatter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String url = "jdbc:mysql://localhost:3306/BookEvent?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String password = "Alpha@123";
	    
		try (Connection myConn = DriverManager.getConnection(url, user, password);) {
			Statement st = myConn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Events WHERE aId = " + session.getAttribute("aId"));
			
			while(rs.next()){
				%>
					Name : <%= rs.getString("Name") %><br><br>
					CityName : <%= rs.getString("CityName") %><br><br>
					Category : <%= rs.getString("Category") %><br><br>
					EventDate : <%= rs.getString("EventDate") %><br><br>
					EventTime : <%= rs.getString("EventTime") %><br><br>
					TotalSeats : <%= rs.getInt("TotalSeats") %><br><br>
					AvailSeats : <%= rs.getInt("AvailSeats") %><br><br>
					Price : <%= rs.getInt("Price") %><br><br>
				<%
			}
			
			myConn.close();
		}
		catch(SQLException ex){
	        System.err.println(ex.getMessage());
	    }
	
	
	
	
	%>
</body>
</html>