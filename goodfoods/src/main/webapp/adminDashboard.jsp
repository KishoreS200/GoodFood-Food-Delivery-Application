<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>GoodFoods Admin Dashboard</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Segoe UI", sans-serif;
}

body {
	background: #f5f7fb;
}

/* Navbar */
header {
	background: linear-gradient(135deg, #ff6b35, #ff914d);
	padding: 18px 40px;
	color: white;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .15);
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 30px;
	font-weight: bold;
}

.admin {
	display: flex;
	align-items: center;
	gap: 20px;
	font-size: 18px;
	font-weight: bold;
}

.admin a {
	color: white;
	text-decoration: none;
	padding: 8px 15px;
	border: 1px solid white;
	border-radius: 8px;
	transition: .3s;
}

.admin a:hover {
	background: white;
	color: #ff6b35;
}

/* Title */
.title {
	text-align: center;
	margin: 40px;
	font-size: 40px;
	color: #ff6b35;
}

/* Statistics */
.stats {
	width: 90%;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 25px;
}

.card {
	background: white;
	padding: 30px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .12);
	transition: .3s;
}

.card:hover {
	transform: translateY(-8px);
}

.card h3 {
	color: #666;
	margin-bottom: 15px;
}

.number {
	font-size: 45px;
	font-weight: bold;
	color: #ff6b35;
}

/* Quick Actions */
.actions {
	width: 90%;
	margin: 60px auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 25px;
}

.action {
	background: white;
	padding: 30px;
	border-radius: 15px;
	text-align: center;
	text-decoration: none;
	color: #333;
	font-size: 22px;
	font-weight: bold;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .12);
	transition: .3s;
}

.action:hover {
	background: #ff6b35;
	color: white;
	transform: translateY(-5px);
}

.footer {
	text-align: center;
	padding: 25px;
	color: #777;
	font-size: 15px;
}
</style>

</head>

<body>

	<%
	User admin = (User) session.getAttribute("admin");

	if (admin == null) {
		response.sendRedirect("adminLogin.jsp");
		return;
	}
	%>

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div class="admin">

				<span> 👤 <%=admin.getUserName()%>

				</span> <a href="LogoutServlet"> Logout </a>

			</div>

		</nav>

	</header>

	<h1 class="title">Dashboard</h1>

	<div class="stats">

		<div class="card">

			<h3>Restaurants</h3>

			<div class="number">

				<%=request.getAttribute("restaurantCount")%>

			</div>

		</div>

		<div class="card">

			<h3>Menu Items</h3>

			<div class="number">

				<%=request.getAttribute("menuCount")%>

			</div>

		</div>

		<div class="card">

			<h3>Orders</h3>

			<div class="number">

				<%=request.getAttribute("orderCount")%>

			</div>

		</div>

		<div class="card">

			<h3>Customers</h3>

			<div class="number">

				<%=request.getAttribute("customerCount")%>

			</div>

		</div>

	</div>

	<div class="actions">

		<a class="action" href="RestaurantManagementServlet"> 🍽<br>
		<br> Manage Restaurants

		</a> <a class="action" href="MenuManagementServlet"> 📋<br>
		<br> Manage Menus

		</a> <a class="action" href="OrderManagementServlet"> 📦<br>
		<br> Manage Orders

		</a> <a class="action" href="CustomerManagementServlet"> 👥<br>
		<br> Manage Customers

		</a>

	</div>

	<div class="footer">GoodFoods Admin Panel © 2026</div>

</body>

</html>