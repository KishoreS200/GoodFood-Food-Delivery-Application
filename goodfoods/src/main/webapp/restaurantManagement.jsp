<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Restaurant"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Manage Restaurants</title>

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

/* Navbar */
header {
	background: linear-gradient(135deg, #ff6b35, #ff914d);
	padding: 15px 40px;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 28px;
	font-weight: bold;
	color: white;
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

/* Title */
.title {
	text-align: center;
	margin: 30px;
	color: #ff6b35;
}

/* Table */
.container {
	width: 95%;
	margin: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .15);
}

th {
	background: #ff6b35;
	color: white;
	padding: 15px;
}

td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background: #fff7f2;
}

img {
	width: 90px;
	height: 70px;
	border-radius: 8px;
	object-fit: cover;
}

.open {
	color: green;
	font-weight: bold;
}

.closed {
	color: red;
	font-weight: bold;
}

.edit {
	background: #2196F3;
	color: white;
	padding: 8px 15px;
	border-radius: 6px;
	text-decoration: none;
}

.edit:hover {
	background: #1976D2;
}

.delete {
	background: #f44336;
	color: white;
	padding: 8px 15px;
	border-radius: 6px;
	text-decoration: none;
}

.delete:hover {
	background: #d32f2f;
}

.add-btn {
	display: inline-block;
	margin: 20px 0;
	background: #28a745;
	color: white;
	padding: 12px 20px;
	text-decoration: none;
	border-radius: 8px;
	font-weight: bold;
}

.add-btn:hover {
	background: #218838;
}

.empty {
	text-align: center;
	font-size: 25px;
	color: red;
	margin-top: 50px;
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

	List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
	%>

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div class="nav-links">

				<a href="adminDashboard.jsp">Dashboard</a> <a
					href="addRestaurant.jsp">Add Restaurant</a> <a href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<h1 class="title">Restaurant Management</h1>

	<div class="container">

		<a href="AdminDashboardServlet" class="add-btn"> ➕ Add Restaurant </a>

		<%
		if (restaurantList != null && !restaurantList.isEmpty()) {
		%>

		<table>

			<tr>

				<th>ID</th>

				<th>Image</th>

				<th>Name</th>

				<th>Cuisine</th>

				<th>Delivery</th>

				<th>Rating</th>

				<th>Status</th>

				<th>Edit</th>

				<th>Delete</th>

			</tr>

			<%
			for (Restaurant r : restaurantList) {
			%>

			<tr>

				<td><%=r.getRestaurantId()%></td>

				<td><img src="images/restaurants/<%=r.getImage()%>"></td>

				<td><%=r.getName()%></td>

				<td><%=r.getCuisineType()%></td>

				<td><%=r.getDeliveryTime()%> mins</td>

				<td>⭐ <%=r.getRating()%>

				</td>

				<td>
					<%
					if (r.getIsActive() == 1) {
					%> <span class="open"> Open </span> <%
 } else {
 %> <span class="closed"> Closed </span> <%
 }
 %>

				</td>

				<td><a class="edit"
					href="EditRestaurantServlet?restaurantId=<%=r.getRestaurantId()%>">

						Edit </a></td>

				<td><a class="delete"
					onclick="return confirm('Delete this restaurant?')"
					href="DeleteRestaurantServlet?restaurantId=<%=r.getRestaurantId()%>">

						Delete </a></td>

			</tr>

			<%
			}
			%>

		</table>

		<%
		} else {
		%>

		<h2 class="empty">No Restaurants Found</h2>

		<%
		}
		%>

	</div>

</body>

</html>