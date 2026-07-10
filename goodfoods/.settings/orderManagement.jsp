<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderTable"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Manage Orders</title>

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
	width: 96%;
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

.status {
	padding: 6px 15px;
	border-radius: 20px;
	color: white;
	font-weight: bold;
}

.pending {
	background: #ff9800;
}

.completed {
	background: #4caf50;
}

.cancelled {
	background: #f44336;
}

.details-btn {
	background: #2196F3;
	color: white;
	padding: 8px 15px;
	text-decoration: none;
	border-radius: 6px;
}

.details-btn:hover {
	background: #1976D2;
}

.update-btn {
	background: #28a745;
	color: white;
	padding: 8px 15px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

.update-btn:hover {
	background: #218838;
}

select {
	padding: 7px;
	border-radius: 5px;
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

	List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orders");
	%>

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div class="nav-links">

				<a href="adminDashboard.jsp">Dashboard</a> <a
					href="RestaurantManagementServlet">Restaurants</a> <a
					href="MenuManagementServlet">Menu</a> <a href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<h1 class="title">📦 Manage Orders</h1>

	<div class="container">

		<%
		if (orders != null && !orders.isEmpty()) {
		%>

		<table>

			<tr>

				<th>Order ID</th>

				<th>User ID</th>

				<th>Restaurant ID</th>

				<th>Date</th>

				<th>Total</th>

				<th>Payment</th>

				<th>Address</th>

				<th>Status</th>

				<th>Details</th>

				<th>Update</th>

			</tr>

			<%
			for (OrderTable order : orders) {

				String css = "pending";

				if (order.getStatus().equalsIgnoreCase("Completed"))
					css = "completed";
				else if (order.getStatus().equalsIgnoreCase("Cancelled"))
					css = "cancelled";
			%>

			<tr>

				<td>#<%=order.getOrderId()%></td>

				<td><%=order.getUserId()%></td>

				<td><%=order.getRestaurantId()%></td>

				<td><%=order.getOrderDate()%></td>

				<td>₹<%=order.getTotalAmount()%></td>

				<td><%=order.getPaymentMethod()%></td>

				<td><%=order.getDeliveryAddress()%></td>

				<td><span class="status <%=css%>"> <%=order.getStatus()%>

				</span></td>

				<td><a class="details-btn"
					href="AdminOrderDetailsServlet?orderId=<%=order.getOrderId()%>">

						View </a></td>

				<td>

					<form action="UpdateOrderStatusServlet" method="post">

						<input type="hidden" name="orderId"
							value="<%=order.getOrderId()%>"> <select name="status">

							<option value="Pending"
								<%=order.getStatus().equals("Pending") ? "selected" : ""%>>

								Pending</option>

							<option value="Completed"
								<%=order.getStatus().equals("Completed") ? "selected" : ""%>>

								Completed</option>

							<option value="Cancelled"
								<%=order.getStatus().equals("Cancelled") ? "selected" : ""%>>

								Cancelled</option>

						</select> <br>
						<br> <input class="update-btn" type="submit" value="Update">

					</form>

				</td>

			</tr>

			<%
			}
			%>

		</table>

		<%
		} else {
		%>

		<h2 class="empty">No Orders Found</h2>

		<%
		}
		%>

	</div>

</body>

</html>