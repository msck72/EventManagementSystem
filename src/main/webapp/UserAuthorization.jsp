<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="Header.jsp"%>
<%@ page import="java.sql.*, java.util.logging.*" %>
<meta charset="UTF-8">
<title>User Authorization</title>
</head>
<body>
	
	<% String url = "jdbc:mysql://localhost:3306/BookEvent?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String password = "Alpha@123";
    
    session = request.getSession();
    
    try (Connection myConn = DriverManager.getConnection(url, user, password);) {

    	if(request.getParameter("usrType").equals("Customer")){
    		Statement st = myConn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Customer WHERE UserName = '" + request.getParameter("usrName") + "' AND password = '" + request.getParameter("passwd") + "'");
            
            if(rs.next()) {
            	session.setAttribute("user", request.getParameter("usrName"));
            	session.setAttribute("cId", rs.getInt("cId"));
            	
            	%><script>alert("login successful")</script>
            	<meta http-equiv="Refresh" content="0.5;url=CustomerHomePage.jsp">
            	<%
            	
            	//response.sendRedirect("CustomerHomePage.jsp");
            	
            }
            else {
            	out.println("<script>alert(`login unsuccessful`)</script>");
            	%><meta http-equiv="Refresh" content="0.5;url=UserLogin.jsp"><%
            	
            }
            
    	}
    	else{
    		Statement st = myConn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Admin WHERE UserName = '" + request.getParameter("usrName") + "' AND password = '" + request.getParameter("passwd") + "'");
                        
            if(rs.next()) {
            	
            	session.setAttribute("user", request.getParameter("usrName"));
            	session.setAttribute("aId" , rs.getInt("aId"));
            	%><script>alert("login successful")</script>
            	<meta http-equiv="Refresh" content="0.5;url=AdminHomePage.jsp">
            	<%
            	//response.sendRedirect("GSHomePage.jsp");
            	
            }
            else {
            	out.println("<script>alert(`login unsuccessful`)</script>");
            	%><meta http-equiv="Refresh" content="0.5;url=UserLogin.jsp"><%
            }
            
    	}
    	
    	myConn.close();
    
    }
    catch(SQLException ex) {
    	System.err.println(ex.getMessage());
    } %>
    
</body>

<%@ include file="Footer.jsp"%>
</html>