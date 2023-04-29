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
    		
	if(request.getParameter("submit") != null){
	    
		try (Connection myConn = DriverManager.getConnection(url, user, password);) {
			Statement st = myConn.createStatement();
			//ResultSet rs = st.executeQuery("SELECT * FROM ShopKeeper WHERE skId = ");
            PreparedStatement inserter = myConn.prepareStatement("INSERT INTO Events(aId, Name, CityName , Category, EventDate, EventTime , TotalSeats, AvailSeats, Price, Image) VALUES(? , ? , ? , ? , ? , ?, ? , ? , ?, ?)"); 
            
            inserter.setInt(1, (int)session.getAttribute("aId"));
            inserter.setString(2 , request.getParameter("Name"));
            inserter.setString(3, request.getParameter("CityName"));
            inserter.setString(4, request.getParameter("Category"));
            inserter.setString(5, request.getParameter("EventDate"));
            inserter.setString(6, request.getParameter("EventTime"));
            inserter.setInt(7, Integer.parseInt(request.getParameter("TotalSeats")));
            inserter.setInt(8, Integer.parseInt(request.getParameter("AvailSeats")));
            inserter.setInt(9, Integer.parseInt(request.getParameter("Price")));
            inserter.setString(10, request.getParameter("Image"));
            
            //System.out.println(inserter);
            
            inserter.executeUpdate();
            ResultSet rs = st.executeQuery("SELECT * FROM Events ORDER BY eId DESC LIMIT 1;");
           	rs.next();
           	int eId = rs.getInt("eid");
           	LocalDate dateObj = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = dateObj.format(formatter);
            
            for(int i = 0; i < Integer.parseInt(request.getParameter("AvailSeats")); i++){
            	st.executeUpdate("INSERT INTO Booking(eId , TktNum) VALUES(" + eId + "," + (i + 1) + ")");
            }
            myConn.close();
            %>
            <script>alert(`Event added successfully`)</script>
            <meta http-equiv="Refresh" content="0.5;url=AdminHomePage.jsp">
            <%
		}
		catch(SQLException ex){
	        System.err.println(ex.getMessage());
	    }
	}
	
	
	
	%>
</body>
</html>