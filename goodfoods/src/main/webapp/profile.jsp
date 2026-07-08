<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Segoe UI", sans-serif;
}

body {
	background: #f4f6f9;
}

header {
	background: linear-gradient(135deg, #ff6b35, #ff914d);
	padding: 15px 40px;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

nav h2 {
	color: white;
	font-size: 28px;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 20px;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-weight: bold;
}

.nav-links a:hover {
	color: #ffe082;
}

/* ================= PROFILE CARD ================= */
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 60px;
}

.card {
	width: 500px;
	background: white;
	border-radius: 18px;
	padding: 35px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, .15);
}

.avatar {
	width: 110px;
	height: 110px;
	border-radius: 50%;
	background: linear-gradient(135deg, #ff6b35, #ff914d);
	color: white;
	font-size: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: auto;
}

.card h2 {
	text-align: center;
	color: #ff6b35;
	margin: 20px 0;
}

.info {
	margin: 18px 0;
	font-size: 18px;
}

.info strong {
	display: inline-block;
	width: 140px;
	color: #333;
}

.buttons {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 30px;
}

.btn {
	padding: 12px 22px;
	border: none;
	border-radius: 10px;
	background: #ff6b35;
	color: white;
	text-decoration: none;
	font-weight: bold;
	transition: .3s;
}

.btn:hover {
	background: #e65100;
}

.logout {
	background: #dc3545;
}

.logout:hover {
	background: #b52a37;
}
</style>

</head>

<body>

	<%
	User user = (User) session.getAttribute("loggedInUser");

	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<header>

		<nav>

			<h2>🍴 GoodFoods</h2>

			<div class="nav-links">

				<a href="home.jsp">Home</a> <a href="RestaurantServlet">Restaurants</a>

				<a href="CartServlet">Cart</a> <a href="MyOrdersServlet">My
					Orders</a>

			</div>

		</nav>

	</header>

	<div class="container">

		<div class="card">

			<div class="avatar">👤</div>

			<h2>My Profile</h2>

			<div class="info">
				<strong>Name :</strong>
				<%=user.getUserName()%>
			</div>

			<div class="info">
				<strong>Email :</strong>
				<%=user.getEmail()%>
			</div>

			<div class="info">
				<strong>Address :</strong>
				<%=user.getAddress()%>
			</div>


			<div class="buttons">

				<a href="editProfile.jsp" class="btn"> ✏ Edit Profile </a> <a
					href="LogoutServlet" class="btn logout"> 🚪 Logout </a>

			</div>

		</div>

	</div>

</body>
</html>