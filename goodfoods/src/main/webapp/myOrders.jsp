<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderTable"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Orders</title>

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

/* Profile */
.profile {
	position: relative;
}

.profile-btn {
	background: white;
	color: #ff6b35;
	border: none;
	padding: 8px 15px;
	border-radius: 25px;
	cursor: pointer;
	font-weight: bold;
}

.dropdown {
	display: none;
	position: absolute;
	top: 100%;
	right: 0;
	width: 180px;
	background: white;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .2);
	overflow: hidden;
}

.dropdown a {
	display: block;
	padding: 12px;
	color: #333;
	text-decoration: none;
}

.dropdown a:hover {
	background: #fff5f0;
}

.profile:hover .dropdown {
	display: block;
}

/* Title */
.title {
	text-align: center;
	color: #ff6b35;
	margin: 35px 0;
}

/* Table */
.container {
	width: 90%;
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
	font-size: 17px;
}

td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #eee;
}

tr:hover {
	background: #fff7f2;
}

.status {
	padding: 6px 12px;
	border-radius: 20px;
	color: white;
	font-size: 14px;
	font-weight: bold;
}

.pending {
	background: #ff9800;
}

.delivered {
	background: #4caf50;
}

.cancelled {
	background: #e53935;
}

.view-btn {
	background: #ff6b35;
	color: white;
	padding: 10px 18px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	text-decoration: none;
	font-weight: bold;
}

.view-btn:hover {
	background: #e65100;
}

.empty {
	text-align: center;
	color: red;
	margin-top: 60px;
	font-size: 24px;
}
</style>

</head>

<body>

	<%
	User user = (User) session.getAttribute("loggedInUser");
	%>

	<header>

		<nav>

			<h2>🍴 GoodFoods</h2>

			<div class="nav-links">

				<a href="home.jsp">Home</a> <a href="RestaurantServlet">Restaurants</a>

				<a href="CartServlet">Cart</a>

				<div class="profile">

					<button class="profile-btn">

						👤
						<%=user.getUserName()%>
						▼

					</button>

					<div class="dropdown">

						<a href="profile.jsp">My Profile</a> <a href="MyOrdersServlet">My
							Orders</a> <a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>

					</div>

				</div>

			</div>

		</nav>

	</header>

	<h1 class="title">📦 My Orders</h1>

	<div class="container">

		<%
		List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orders");

		if (orders != null && !orders.isEmpty()) {
		%>

		<table>

			<tr>

				<th>Order ID</th>

				<th>Date</th>

				<th>Total</th>

				<th>Payment</th>

				<th>Status</th>

				<th>Action</th>

			</tr>

			<%
			for (OrderTable order : orders) {

				String status = order.getStatus();

				String css = "pending";

				if (status.equalsIgnoreCase("Delivered"))
					css = "delivered";

				else if (status.equalsIgnoreCase("Cancelled"))
					css = "cancelled";
			%>

			<tr>

				<td>#<%=order.getOrderId()%></td>

				<td><%=order.getOrderDate()%></td>

				<td>₹<%=order.getTotalAmount()%></td>

				<td><%=order.getPaymentMethod()%></td>

				<td><span class="status <%=css%>"> <%=order.getStatus()%>

				</span></td>

				<td><a class="view-btn"
					href="OrderDetailsServlet?orderId=<%=order.getOrderId()%>">

						View </a></td>

			</tr>

			<%
			}
			%>

		</table>

		<%
		}

		else {
		%>

		<h2 class="empty">📭 No Orders Found</h2>

		<%
		}
		%>

	</div>

</body>

</html>