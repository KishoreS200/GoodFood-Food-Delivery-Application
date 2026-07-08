<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderItem"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Order Details</title>

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

.title {
	text-align: center;
	margin: 30px;
	color: #ff6b35;
}

.container {
	width: 90%;
	margin: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 12px;
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

.back-btn {
	display: inline-block;
	margin-top: 30px;
	padding: 12px 20px;
	background: #ff6b35;
	color: white;
	text-decoration: none;
	border-radius: 8px;
	font-weight: bold;
}

.back-btn:hover {
	background: #e65100;
}

.empty {
	text-align: center;
	color: red;
	font-size: 24px;
	margin-top: 50px;
}

.total-box {
	width: 250px;
	margin: 30px auto;
	background: white;
	padding: 20px;
	border-radius: 12px;
	text-align: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .15);
}

.total-box h2 {
	color: #28a745;
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

				<a href="MyOrdersServlet">My Orders</a>

			</div>

		</nav>

	</header>

	<h1 class="title">📦 Order Details</h1>

	<div class="container">

		<%
		List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");

		double grandTotal = 0;

		if (orderItems != null && !orderItems.isEmpty()) {
		%>

		<table>

			<tr>
				<th>Image</th>
				<th>Food Name</th>
				<th>Quantity</th>
				<th>Item Total</th>
			</tr>

			<%
			for (OrderItem item : orderItems) {

				grandTotal += item.getItemTotal();
			%>

			<tr>

				<td><img src="images/menu/<%=item.getImage()%>"
					alt="<%=item.getMenuName()%>" width="80" height="80"
					style="border-radius: 10px; object-fit: cover;"></td>

				<td><%=item.getMenuName()%></td>

				<td><%=item.getQuantity()%></td>

				<td>₹<%=item.getItemTotal()%></td>

			</tr>

			<%
			}
			%>

		</table>

		<div class="total-box">

			<h2>Total Amount</h2>

			<h1>
				₹<%=grandTotal%></h1>

		</div>

		<%
		} else {
		%>

		<h2 class="empty">No Order Items Found</h2>

		<%
		}
		%>

		<center>

			<a href="MyOrdersServlet" class="back-btn"> ⬅ Back to My Orders </a>

		</center>

	</div>

</body>
</html>