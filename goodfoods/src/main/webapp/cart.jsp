<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.food.model.CartItem"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Shopping Cart</title>

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

nav a {
	color: white;
	text-decoration: none;
	margin-left: 20px;
	font-weight: bold;
}

nav a:hover {
	color: #ffe082;
}

.title {
	text-align: center;
	color: #ff6b35;
	margin: 30px 0;
}

.container {
	width: 90%;
	margin: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .15);
}

/* Quantity Controls */
.qty-form {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	margin: 0;
}

.qty-btn {
	width: 38px;
	height: 38px;
	border: none;
	border-radius: 50%;
	background: #ff6b35;
	color: white;
	font-size: 24px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
}

.qty-btn:hover {
	background: #e65100;
	transform: scale(1.08);
}

.qty-input {
	width: 45px;
	height: 35px;
	border: 1px solid #ddd;
	border-radius: 6px;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	background: #fff;
	outline: none;
}

.qty-input:focus {
	border-color: #ff6b35;
}

td form {
	margin: 0;
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

td form {
	margin: 0;
}

tr:hover {
	background: #fff7f2;
}

.remove-btn {
	background: #dc3545;
	color: white;
	border: none;
	padding: 8px 15px;
	border-radius: 6px;
	cursor: pointer;
}

.remove-btn:hover {
	background: #b71c1c;
}

.checkout-btn {
	background: #28a745;
	color: white;
	border: none;
	padding: 12px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-size: 16px;
}

.checkout-btn:hover {
	background: #218838;
}

.total {
	width: 300px;
	margin: 30px auto;
	background: white;
	padding: 20px;
	border-radius: 12px;
	text-align: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .15);
}

.total h2 {
	color: #28a745;
	margin-bottom: 15px;
}

.empty {
	text-align: center;
	color: red;
	margin-top: 40px;
	font-size: 22px;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 20px;
}

.profile {
	position: relative;
	display: inline-block;
}

.profile-btn {
	background: white;
	color: #ff6b35;
	border: none;
	padding: 8px 15px;
	border-radius: 25px;
	font-weight: bold;
	cursor: pointer;
	font-size: 15px;
}

.profile-btn:hover {
	background: #fff3ec;
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
	z-index: 1000;
}

.dropdown a {
	display: block;
	padding: 12px 15px;
	color: #333;
	text-decoration: none;
}

.dropdown a:hover {
	background: #fff5f0;
}

.profile:hover .dropdown {
	display: block;
}
</style>

</head>

<body>

	<header>

		<%@ page import="com.food.model.User"%>

		<%
		User user = (User) session.getAttribute("loggedInUser");
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");
		%>

		<nav>

			<h2>🛒 GoodFoods</h2>

			<div class="nav-links">

				<a href="home.jsp">Home</a> <a href="RestaurantServlet">Restaurants</a>

				<%
				if (restaurantId != null) {
				%>

				<a href="MenuServlet?restaurantId=<%=restaurantId%>"> Menu </a>

				<%
				}
				%>

				<a href="CartServlet">Cart</a>

				<%
				if (user == null) {
				%>

				<a href="login.jsp">Login</a>

				<%
				} else {
				%>

				<div class="profile">

					<button class="profile-btn">
						👤
						<%=user.getUserName()%>
						▼
					</button>

					<div class="dropdown">

						<a href="profile.jsp">My Profile</a> <a href="MyOrdersServlet">My
							Orders</a> <a href="<%=request.getContextPath()%>/LogoutServlet">
							Logout </a>

					</div>

				</div>

				<%
				}
				%>

			</div>

		</nav>

	</header>

	<h1 class="title">Shopping Cart</h1>

	<div class="container">

		<%
		List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");

		double grandTotal = 0;

		if (cartItems != null && !cartItems.isEmpty()) {
		%>

		<table>

			<tr>

				<th>Item</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total</th>
				<th>Remove</th>

			</tr>

			<%
			for (CartItem item : cartItems) {

				grandTotal += item.getItemTotal();
			%>

			<tr>

				<td><%=item.getName()%></td>

				<td>₹<%=item.getPrice()%>
				</td>

				<td>

					<form action="CartServlet" method="post" class="qty-form">

						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="menuId" value="<%=item.getMenuId()%>">

						<input type="hidden" name="restaurantId"
							value="<%=item.getRestaurantId()%>">

						<button type="button" class="qty-btn" onclick="changeQty(this,-1)">
							-</button>

						<input type="text" class="qty-input" name="quantity"
							value="<%=item.getQuantity()%>" readonly>

						<button type="button" class="qty-btn" onclick="changeQty(this,1)">
							+</button>

					</form>

				</td>

				<td>₹<%=item.getItemTotal()%>
				</td>


				<td>

					<form action="CartServlet" method="post">

						<input type="hidden" name="action" value="remove"> <input
							type="hidden" name="menuId" value="<%=item.getMenuId()%>">

						<input type="hidden" name="restaurantId"
							value="<%=item.getRestaurantId()%>"> <input
							class="remove-btn" type="submit" value="Remove">

					</form>

				</td>

			</tr>

			<%
			}
			%>

		</table>

		<div class="total">

			<h2>Grand Total</h2>

			<h1>
				₹<%=grandTotal%>
			</h1>

			<br>

			<form action="CheckOutServlet" method="get">

				<input class="checkout-btn" type="submit"
					value="Proceed To Checkout">

			</form>

		</div>

		<%
		} else {
		%>

		<h2 class="empty">🛒 Your Cart Is Empty</h2>

		<%
		}
		%>

	</div>
	<script>
		function updateCart(input) {
			input.form.submit();
		}
		function changeQty(button, change) {

			let form = button.parentElement;

			let qtyInput = form.querySelector(".qty-input");

			let qty = parseInt(qtyInput.value);

			qty += change;

			if (qty < 1) {
				qty = 1;
			}

			qtyInput.value = qty;

			form.submit();
		}
	</script>

</body>

</html>