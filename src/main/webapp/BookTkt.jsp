<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.* , java.sql.*, java.time.*, java.time.format.DateTimeFormatter, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>

<%//@ include file="Header.jsp"%>

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
		    
		    LocalDate dateObj = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = dateObj.format(formatter);
            
            dateObj = LocalDate.now();
            SimpleDateFormat dateformat = new SimpleDateFormat("hh:mm:ss");
            String time = dateformat.format(Calendar.getInstance().getTime());
		   
		    PreparedStatement inserter = myConn.prepareStatement(("UPDATE Booking SET cId = ? , BookedDate = ? , BookedTime = ? , status = ? WHERE eId = ? AND TktNum = ?"));
		    
		    inserter.setInt(1 , (int)session.getAttribute("cId"));
		    inserter.setString(2 , date);
		    inserter.setString(3 , time);
		    inserter.setString(4 , "Booked");
		    inserter.setInt(5 , Integer.parseInt(request.getParameter("eId")));
		    inserter.setInt(6 , Integer.parseInt(request.getParameter("TktNum")));
		    
		    System.out.println(inserter);
		    
		    inserter.executeUpdate();
		    
		    int dec = Integer.parseInt(request.getParameter("AvailSeats"));
		    dec--;
		    st.executeUpdate("UPDATE Events SET AvailSeats = " + dec-- + " WHERE eId = " + request.getParameter("eId"));
		    
		    //System.out.println("UPDATE Events SET AvailSeats = " + dec-- + " WHERE  eId = " + request.getParameter("eId"));
		    
		    %>
		    <script>alert(`Tkt Booked successfully`)</script>
            <meta http-equiv="Refresh" content="0.5;url=CustomerHomePage.jsp">
		    <%
		    
		
		%>
		
		<%
		}catch(SQLException ex) {
		    	System.err.println(ex.getMessage());
		    }
		
		%>

</body>

</html>