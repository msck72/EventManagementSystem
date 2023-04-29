<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.*, java.time.format.DateTimeFormatter, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="Header.jsp"%>

<meta charset="UTF-8">
	<link rel="stylesheet" href="myStyles.css">
	<style>
	
		.cities {
			display: grid;
			padding: 10px;
			grid-column-gap: 10px;
			grid-row-gap: 10px;
			text-align: center;
			align-items: center;
			grid-template-columns: auto auto auto auto;
			background-image:
				url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6YZgAcZZDjDOpawIWsCX2bPKU_VlgBekWjw&usqp=CAU");
			background-repeat: no-repeat; /* Do not repeat the image */
			background-size: cover;
		}
		
		
		.searchContainer {
			display: grid;
			padding: 10px;
			grid-column-gap: 10px;
			grid-row-gap: 10px;
			text-align: center;
			align-items: center;
			grid-template-columns: auto auto;
			background-color: linear-gradient(rgb(0 , 0 , 150 , 0), rgb(0 , 0 , 150 , 1));
		}
		
		.city{
			height: 200px;
			width: 200px;
		}
		
		
		.searchContainer > .items{
			background-color: linear-gradient(rgb(0 , 0 , 150 , 0), rgb(0 , 0 , 150 , 1));
		}
		
		
	</style>
<title>Customer Home Page</title>
</head>
<body Class="NotHeaderBody">

	<%
		String url = "jdbc:mysql://localhost:3306/BookEvent?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	    String user = "root";
	    String password = "Alpha@123";
	    
		try (Connection myConn = DriverManager.getConnection(url, user, password);){
			
			String search;
			String category;
			String on;
			if(request.getParameter("searchInCity") == null || request.getParameter("searchInCity").equals("null")){
				search = "";
			}
			else{
				search = "AND CityName LIKE '%" +  request.getParameter("searchInCity") + "%'";
			}
			
			
			if(request.getParameter("Category") == null || request.getParameter("Category").equals("null")){
				category = "";
			}
			else{
				/*if(search.equals("")){
					category = "AND Category LIKE '%" +  request.getParameter("Category") + "%' ";
				}
				else{*/
					category = "AND Category LIKE '%" +  request.getParameter("Category") + "%'";
				//}
			}
			
			if(request.getParameter("date") == null){
				on = "";
			}
			else{
				/*if(search.equals("") && category.equals("")){
					on = "AND EventDate = '" +  request.getParameter("date") + "'";
				}
				else{*/
					on = "AND EventDate >= '" +  request.getParameter("date") + "'";
				//}
			}
			
			
			
		    Statement st = myConn.createStatement();
		    Statement mySt = myConn.createStatement();
		    
		    
		    LocalDate dateObj = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = dateObj.format(formatter);
		    
		    System.out.println("SELECT * FROM Events " + search + " " + category + " " + on);
		    ResultSet rs = st.executeQuery("SELECT * FROM Events WHERE EventDate >= " + date + " " + search + " " + category + " " + on);
		    
		
		%>
		<br>
		
		<%if(request.getParameter("searchInCity") == null || search.equals("")){ %>
		<div class="cities">
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Hyderabad"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ_LYD50w3cMC2SNxEhtyKrmVCx1Rw_ioqBQ&usqp=CAU" class="city"></a>
			</div>	
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Bengaluru"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA03t_k-6xYA_qKOmscn6VO4z5wiErkiGhvA&usqp=CAU" class="city"></a>
			</div>	
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Chennai"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_joNj7b_V1Fq86BG_z_sCSzmuPCxqZ_HM8Q&usqp=CAU" class="city"></a>
			</div>
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Mumbai"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAluixE_LiMgIi9fp0XfZfyZIsZpETwnr0wg&usqp=CAU" class="city"></a>
			</div>	
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Kolkata"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ26_TGWnF2WkM6P1aibAU4tHkmvnGYksbXyQ&usqp=CAU" class="city"></a>
			</div>	
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Delhi"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2UG57cASdmaRbduPwfR-4pdMs5I6UC9WvEQ&usqp=CAU" class="city"></a>
			</div>	
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Pune"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhRjbI9F3x1yuB_27EFrn-rFlMqAYX0u8z1w&usqp=CAU" class="city"></a>
			</div>	
			<div class="items">
				<a href="CustomerHomePage.jsp?searchInCity=Indore"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_shTYCayhvs5spIEKgXSQ2Hvo98Jm_rnRQg&usqp=CAU" class="city"></a>
			</div>			
			
		</div>
		<%} 
		
		String city = request.getParameter("searchInCity");
		if(city == null || city.equals("null")){
			city = "";
		}
		%>
			<div class="searchContainer">
				<div class="items">
					<b>Want to select by Category in  <%= city%>??</b><br>`
					<form class="con">
						<input type="text" name="Category" placeHolder="Search with Category in <% out.print(city);%>">
						<input type="hidden" name="searchInCity"  value=<%=request.getParameter("searchInCity") %>><br><br>
						<input type="submit" value="CategorySearch">
					</form>
				</div>
				<div class="items">
				<b>Want to select by Date in  <%= city%>??</b><br>`
					<form style="align-items: center;">
						<input type="date" name="date">
						<input type="hidden" name="searchInCity"  value=<%=request.getParameter("searchInCity") %>>
						<input type="hidden" name="Category"  value=<%=request.getParameter("category") %>><br><br>
						<input type="submit" value="search">
					</form>
				</div>
			</div>
				<h1 style="text-align: center">Upcoming Events</h1>
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
			<br> <b>Available seats</b> :
			<%=rs.getInt("AvailSeats")%><br>
			<br> <b>Price</b> :
			<%=rs.getInt("price")%><br><br>
			
			<b>Choose Your Ticket Number..</b><br><br>
			<% ResultSet myRs = mySt.executeQuery("SELECT * FROM Booking WHERE eId = " + rs.getInt("eId") + " AND Status = 'Not Filled'"); %>
			<form action="BookTkt.jsp">
				<select id="number<%= rs.getInt("eId") %>" name="TktNum" placeholder="0">
					<%while(myRs.next()){
					   		
					   			out.println("<option value=\""+ myRs.getInt("TktNum") +"\" >"+ myRs.getInt("TktNum") +"</option>");
					   		
					   	}
					%>
				</select>
				
				<input type="hidden" name="eId" value=<%= rs.getInt("eId") %>>
				<input type="hidden" name="AvailSeats" value=<%= rs.getInt("AvailSeats") %>>
				<input type="submit" value="Book">
			</form>
			<hr>
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