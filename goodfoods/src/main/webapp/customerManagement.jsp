<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Manage Customers</title>

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
	font-size: 30px;
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
	margin: 35px;
	color: #ff6b35;
	font-size: 38px;
}

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
	box-shadow: 0 8px 20px rgba(0, 0, 0, .15);
}

th {
	background: #ff6b35;
	color: white;
	padding: 15px;
}

td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #eee;
}

tr:hover {
	background: #fff7f2;
}

.edit-btn {
	background: #2196F3;
	color: white;
	padding: 10px 18px;
	text-decoration: none;
	border-radius: 6px;
}

.edit-btn:hover {
	background: #1976D2;
}

.delete-btn {
	background: #f44336;
	color: white;
	padding: 10px 18px;
	text-decoration: none;
	border-radius: 6px;
}

.delete-btn:hover {
	background: #d32f2f;
}

.empty {
	text-align: center;
	color: red;
	font-size: 25px;
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

	List<User> customers = (List<User>) request.getAttribute("customers");
	%>

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div class="nav-links">

				<a href="adminDashboard.jsp">Dashboard</a> <a
					href="RestaurantManagementServlet">Restaurants</a> <a
					href="MenuManagementServlet">Menu</a> <a
					href="OrderManagementServlet">Orders</a> <a href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<h1 class="title">👥 Manage Customers</h1>

	<div class="container">

		<%
		if (customers != null && !customers.isEmpty()) {
		%>

		<table>

			<tr>

				<th>Customer ID</th>

				<th>Name</th>

				<th>Email</th>

				<th>Address</th>

				<th>Edit</th>

				<th>Delete</th>

			</tr>

			<%
			for (User user : customers) {
			%>

			<tr>

				<td><%=user.getUserId()%></td>

				<td><%=user.getUserName()%></td>

				<td><%=user.getEmail()%></td>

				<td><%=user.getAddress()%></td>

				<td><a class="edit-btn"
					href="EditCustomerServlet?userId=<%=user.getUserId()%>"> ✏ Edit

				</a></td>

				<td><a class="delete-btn"
					href="DeleteCustomerServlet?userId=<%=user.getUserId()%>"
					onclick="return confirm('Are you sure you want to delete this customer?')">

						🗑 Delete </a></td>

			</tr>

			<%
			}
			%>

		</table>

		<%
		} else {
		%>

		<h2 class="empty">No Customers Found</h2>

		<%
		}
		%>

	</div>

</body>

</html>