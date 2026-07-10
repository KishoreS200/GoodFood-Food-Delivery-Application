<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Menu"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Menu Management</title>

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
	box-shadow: 0 5px 15px rgba(0, 0, 0, .15);
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
	gap: 20px;
	align-items: center;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-weight: bold;
}

.nav-links a:hover {
	color: #ffe082;
}

/* Page */
.title {
	text-align: center;
	margin: 30px;
	color: #ff6b35;
}

.container {
	width: 95%;
	margin: auto;
}

.add-btn {
	display: inline-block;
	margin-bottom: 20px;
	padding: 12px 20px;
	background: #28a745;
	color: white;
	text-decoration: none;
	border-radius: 8px;
	font-weight: bold;
}

.add-btn:hover {
	background: #218838;
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
	object-fit: cover;
	border-radius: 8px;
}

.available {
	color: green;
	font-weight: bold;
}

.unavailable {
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

.empty {
	text-align: center;
	color: red;
	font-size: 24px;
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

	List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
	%>

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div class="nav-links">

				<a href="AdminDashboardServlet">Dashboard</a> <a
					href="RestaurantManagementServlet">Restaurants</a> <a
					href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<h1 class="title">🍽 Menu Management</h1>

	<div class="container">

		<a href="AddMenuPageServlet" class="add-btn"> ➕ Add Menu Item </a>

		<%
		if (menuList != null && !menuList.isEmpty()) {
		%>

		<table>

			<tr>

				<th>ID</th>

				<th>Image</th>

				<th>Item Name</th>

				<th>Restaurant ID</th>

				<th>Category</th>

				<th>Price</th>

				<th>Status</th>

				<th>Edit</th>

				<th>Delete</th>

			</tr>

			<%
			for (Menu menu : menuList) {
			%>

			<tr>

				<td><%=menu.getMenuId()%></td>

				<td><img src="images/menu/<%=menu.getImage()%>"></td>

				<td><%=menu.getItemName()%></td>

				<td><%=menu.getRestaurantId()%></td>

				<td><%=menu.getCategory()%></td>

				<td>₹<%=menu.getPrice()%></td>

				<td>
					<%
					if (menu.getIsAvailable() == 1) {
					%> <span class="available"> Available </span> <%
 } else {
 %> <span class="unavailable"> Unavailable </span> <%
 }
 %>

				</td>

				<td><a class="edit"
					href="EditMenuServlet?menuId=<%=menu.getMenuId()%>"> Edit </a></td>

				<td><a class="delete"
					href="DeleteMenuServlet?menuId=<%=menu.getMenuId()%>"
					onclick="return confirm('Delete this menu item?')"> Delete </a></td>

			</tr>

			<%
			}
			%>

		</table>

		<%
		} else {
		%>

		<h2 class="empty">No Menu Items Found</h2>

		<%
		}
		%>

	</div>

</body>

</html>