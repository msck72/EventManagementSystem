<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ page import="java.sql.*, java.util.*" %>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean flag = false;
		
		String url = "jdbc:mysql://localhost:3306/BookEvent?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	    String user = "root";
	    String password = "Alpha@123";
	    
	    try (Connection myConn = DriverManager.getConnection(url, user, password);) {
	
	    	if(request.getParameter("usrType").equals("Customer")){
	    		Statement st = myConn.createStatement();
	            ResultSet rs = st.executeQuery("SELECT * FROM Customer WHERE UserName = '" + request.getParameter("usrName") + "' AND password = '" + request.getParameter("passwd") + "'");
	            
	            if(rs.next()) {		          
	            	%><script>alert("login Unsuccessful username aldready exists")</script>
	            	<meta http-equiv="Refresh" content="0.5;url=UserLogin.jsp">
	            	<%
	            }
	            else {
	            	flag = true;
	            	myConn.setAutoCommit(false);
	            	PreparedStatement inserter = myConn.prepareStatement("INSERT INTO Customer(UserName , Name, password, phno) VALUES(? , ? , ? , ?)");
	            	
	            	inserter.setString(1 , request.getParameter("usrName"));
	            	inserter.setString(2 , request.getParameter("Name"));
	            	inserter.setString(3 , request.getParameter("passwd"));
	            	inserter.setString(4 , request.getParameter("phno"));
	            	inserter.executeUpdate();
	            	
	            	myConn.commit(); 
	            	out.println("create account successful for customer");
	            }
	            
	    	}
	    	else{
	    		Statement st = myConn.createStatement();
	            ResultSet rs = st.executeQuery("SELECT * FROM Admin WHERE UserName = '" + request.getParameter("usrName") + "' AND password = '" + request.getParameter("passwd") + "'");
	            
	            if(rs.next()) {		            	
	            	%><script>alert("login Unsuccessful username aldready exists")</script>
	            	<meta http-equiv="Refresh" content="0.5;url=UserLogin.jsp">
	            	<%
	            }
	            else {
	            	flag = true;
	            	myConn.setAutoCommit(false);

					PreparedStatement inserter = myConn.prepareStatement("INSERT INTO Admin(UserName , Name, password, phno) VALUES(? , ? , ? , ?)");
	            	
	            	inserter.setString(1 , request.getParameter("usrName"));
	            	inserter.setString(2 , request.getParameter("Name"));
	            	inserter.setString(3 , request.getParameter("passwd"));
	            	inserter.setString(4 , request.getParameter("phno"));
	            	inserter.executeUpdate();
	            	
	            	
	            	myConn.commit(); 
	            	out.println("create account successful for ShopKeeper");
	            }
	            
	    	}
	    	
	    	myConn.close();
	    	
	    
	    }
	    catch(SQLException ex) {
	    	System.err.println(ex.getMessage());
	    } 
		
		if(flag){
			request.getRequestDispatcher("/UserAuthorization.jsp").forward(request, response);
		}
		
	%>
</body>
</html>