<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.Menu"%>
<%@ page import="com.food.model.User"%>
<%@ page import="com.food.model.Restaurant"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Food Menu</title>

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

nav a {
	color: white;
	text-decoration: none;
	margin-left: 20px;
	font-weight: bold;
}

nav a:hover {
	color: #ffe082;
}

/* Title */
.title {
	text-align: center;
	margin: 30px;
	color: #ff6b35;
}

/* Menu Grid */
.container {
	width: 90%;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
	gap: 25px;
	margin-bottom: 40px;
}

/* Card */
.card {
	background: white;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
	transition: 0.3s;
}

.card:hover {
	transform: translateY(-8px);
}

.card h2 {
	color: #ff6b35;
	margin-bottom: 15px;
}

.price {
	font-size: 24px;
	color: green;
	font-weight: bold;
	margin: 10px 0;
}

.available {
	color: green;
	font-weight: bold;
}

.unavailable {
	color: red;
	font-weight: bold;
}

input[type="number"] {
	width: 70px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

input[type="submit"] {
	background: #ff6b35;
	color: white;
	border: none;
	padding: 10px 18px;
	border-radius: 8px;
	cursor: pointer;
	margin-left: 10px;
	font-size: 15px;
}

input[type="submit"]:hover {
	background: #e65100;
}

.empty {
	text-align: center;
	color: red;
	margin-top: 50px;
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

.menu-img{
    width:100%;
    height:220px;
    object-fit:cover;
    border-radius:12px;
    margin-bottom:15px;
    transition:.4s;
}

.card:hover .menu-img{
    transform:scale(1.05);
}
</style>

</head>

<body>

	<header>
		<%@ page import="com.food.model.User"%>

		<%
		User user = (User) session.getAttribute("loggedInUser");
		%>

		<nav>

			<h2>🍴 GoodFoods</h2>

			<div class="nav-links">

				<a href="home.jsp">Home</a> <a href="RestaurantServlet">Restaurants</a>

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

	<h1 class="title">🍽 Our Delicious Menu</h1>

	<div class="container">

		<%
		List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");

		if (menuList != null && !menuList.isEmpty()) {

			for (Menu item : menuList) {
		%>

		<div class="card">

			<img src="images/menu/<%=item.getImage()%>" class="menu-img"
				alt="<%=item.getItemName()%>">

			<p>
				<strong>Category :</strong>
				<%=item.getCategory()%>
			</p>

			<br>

			<p><%=item.getDescription()%></p>

			<div class="price">
				₹<%=item.getPrice()%>
			</div>

			<p>

				<strong>Status :</strong>

				<%
				if (item.getIsAvailable() == 1) {
				%>

				<span class="available">Available</span>

				<%
				} else {
				%>

				<span class="unavailable">Out Of Stock</span>

				<%
				}
				%>

			</p>

			<br>

			<form action="CartServlet" method=post>

				<input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
				<input type="hidden" name="quantity" value="1"> <input
					type="hidden" name="restaurantId"
					value="<%=item.getRestaurantId()%>"> <input type="hidden"
					name="action" value="add"> <input type="submit"
					value="🛒 Add To Cart">

			</form>

		</div>

		<%
		}
		} else {
		%>

	</div>

	<h2 class="empty">No Menu Items Found</h2>

	<%
	}
	%>

</body>

</html>
