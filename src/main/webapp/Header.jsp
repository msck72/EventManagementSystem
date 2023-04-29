<!DOCTYPE html>
<html>
<head>
<style>
.NavContainer {
	color: #f2f2f2;
	float: center;
	vertical-align: middle;
	display: grid;
	padding: 10px;
	grid-column-gap: 10px;
	grid-row-gap: 10px;
	grid-template-columns: auto 65% auto auto auto auto;
	background-color: #003399;
	background-repeat: no-repeat;
	background-size: cover;
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 50px;
}

#inside {
	padding: 10px;
}

#inside:hover {
	background-color: #000000;
}

.NavContainer>div>b {
	font-size: 36px;
}

.ButtonOptions {
	float: left;
	overflow: hidden;
}


.ButtonOptions .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}


.ButtonOptions-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.ButtonOptions-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropbtn a {
	float: none;
	color: white;
	text-decoration: none;
	display: block;
	text-align: left;
}

.ButtonOptions-content a:hover {
	background-color: #ddd;
}

/* Show the ButtonOptions menu on hover */
.ButtonOptions:hover .ButtonOptions-content {
	display: block;
}
</style>
<!-- <img src="https://c8.alamy.com/comp/2AKKAJJ/initial-gs-letter-linked-logo-gs-letter-type-logo-design-vector-template-abstract-letter-gs-logo-design-2AKKAJJ.jpg" width="100px" height="auto">-->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<div class="NavContainer">
			<div>
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbPV4u-zn7WCIrGd_mncmsH8OqjfQ9Hxcs3g&usqp=CAU"
					height="50px" width="75px">
			</div>
			<div class="Label">
				<b>BookEvent</b>
			</div>

		
			<div id="inside" class="ButtonOptions">
			
				<button class="dropbtn">
					<% if(session.getAttribute("user") == null){%>
							<a href="UserLogin.jsp">Home</a>
					<%} 
					else if(session.getAttribute("user") != null && session.getAttribute("cId") != null){%>
						<a href="CustomerHomePage.jsp">Home</a>
					<%}	
					else if(session.getAttribute("user") != null && session.getAttribute("cId") != null){%>
						<a href="AdminHomePage.jsp">Home</a>
					<%} %>	
					
				</button>

			</div>
			
			<%
				if(session.getAttribute("user") != null){
					%><div id="inside" class="ButtonOptions">
						<button class="dropbtn">
							<%= session.getAttribute("user")%>
						</button>
						<div class="ButtonOptions-content">
							<a href="#">My Profile</a> 
							<a><%@ include file="LogOut.jsp"%></a>
						</div>
					</div><%
				}
			%>
			
			<%
				if(session.getAttribute("user") != null && session.getAttribute("cId") != null){
					%><div id="inside" class="ButtonOptions">
						<button class="dropbtn"><a href="PrevBookings.jsp" style="color:white;">PrevBookings</a></button>
					</div><%
				}
			
				if(session.getAttribute("user") != null && session.getAttribute("aId") != null){
					%><div id="inside" class="ButtonOptions">
						<button class="dropbtn"><a href="ShowMyEvents.jsp" style="color:white;">MyEvents</a></button>
					</div><%
				}
			%>
		</div>


</body>
</html>