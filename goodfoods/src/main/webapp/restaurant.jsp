<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Restaurant"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Restaurants</title>

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

/* ================= NAVBAR ================= */
header {
	background: linear-gradient(135deg, #ff6b35, #ff914d);
	padding: 16px 50px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, .15);
	position: sticky;
	top: 0;
	z-index: 1000;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

nav h2 {
	color: #fff;
	font-size: 34px;
	font-weight: 700;
	letter-spacing: .5px;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 25px;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-size: 18px;
	font-weight: 600;
	transition: .3s;
}

.nav-links a:hover {
	color: #fff2b2;
	transform: translateY(-2px);
}

/* ================= PROFILE ================= */
.profile {
	position: relative;
}

.profile-btn {
	background: #fff;
	color: #ff6b35;
	border: none;
	padding: 10px 18px;
	border-radius: 30px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 700;
	transition: .3s;
}

.profile-btn:hover {
	background: #fff5ef;
}

.dropdown {
	display: none;
	position: absolute;
	right: 0;
	top: 115%;
	width: 210px;
	background: #fff;
	border-radius: 14px;
	overflow: hidden;
	box-shadow: 0 15px 35px rgba(0, 0, 0, .18);
}

.dropdown a {
	display: block;
	padding: 14px 18px;
	text-decoration: none;
	color: #444;
	margin: 0;
	transition: .25s;
}

.dropdown a:hover {
	background: #fff4ed;
	color: #ff6b35;
	padding-left: 24px;
}

.profile:hover .dropdown {
	display: block;
}

/* ================= TITLE ================= */
.title {
	text-align: center;
	color: #ff6b35;
	margin: 40px 0;
	font-size: 50px;
	font-weight: 700;
}

/* ================= GRID ================= */
.container {
	width: 92%;
	margin: 40px auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(320px, 350px));
	justify-content: center;
	gap: 30px;
}

/* ================= CARD ================= */
.card {
	background: white;
	border-radius: 22px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .12);
	transition: .35s;
	display: flex;
	flex-direction: column;
	width: 350px;
	min-height: 540px;
	position: relative;
}

.card:hover {
	transform: translateY(-12px);
	box-shadow: 0 20px 45px rgba(0, 0, 0, .20);
}

/* ================= IMAGE ================= */
.restaurant-img {
	width: 100%;
	height: 210px;
	object-fit: cover;
	transition: .4s;
}

.card:hover .restaurant-img {
	transform: scale(1.06);
}

/* ================= CONTENT ================= */
.card-content {
	padding: 22px;
	display: flex;
	flex-direction: column;
	flex: 1;
}

.card h2 {
	color: #ff6b35;
	font-size: 24px;
	margin-bottom: 12px;
}

.card p {
	font-size: 16px;
	margin: 8px 0;
	color: #444;
}

.card strong {
	color: #222;
}

/* ================= STATUS ================= */
.open {
	color: #18a558;
	font-weight: bold;
}

.closed {
	color: #e53935;
	font-weight: bold;
}

/* ================= BUTTON ================= */
.card form {
	margin-top: auto;
}

.card input[type="submit"] {
	width: 170px;
	padding: 14px;
	background: linear-gradient(135deg, #ff6b35, #ff914d);
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 17px;
	font-weight: bold;
	cursor: pointer;
	transition: .3s;
}

.card input[type="submit"]:hover {
	transform: scale(1.05);
	box-shadow: 0 10px 25px rgba(255, 107, 53, .35);
}

/* ================= EMPTY ================= */
.empty {
	text-align: center;
	color: #ff3b3b;
	margin-top: 60px;
	font-size: 30px;
	font-weight: bold;
}

.rating-badge {
	display: inline-block;
	background: #1abc54;
	color: #fff;
	padding: 5px 12px;
	border-radius: 20px;
	font-weight: bold;
	font-size: 14px;
}
</style>

</head>

<body>

	<header>
		<%
		User user = (User) session.getAttribute("loggedInUser");
		%>

		<nav>

			<h2>🍴 GoodFoods</h2>

			<div class="nav-links">

				<a href="home.jsp">Home</a> <a href="CartServlet">Cart</a>

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

	<h1 class="title">🍽 Explore Restaurants</h1>

	<div class="container">

		<%
		List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("allRestaurants");

		if (restaurantList != null && !restaurantList.isEmpty()) {

			for (Restaurant restaurant : restaurantList) {
		%>

		<div class="card">

			<img src="images/restaurants/<%=restaurant.getImage()%>"
				alt="<%=restaurant.getName()%>" class="restaurant-img">

			<div class="card-content">

				<h2><%=restaurant.getName()%></h2>

				<p>
					<strong>🍜 Cuisine :</strong>
					<%=restaurant.getCuisineType()%>
				</p>

				<p>
					<strong><span class="rating-badge">⭐<%=restaurant.getRating()%></span></strong>
				</p>

				<p>
					<strong>🚚 Delivery :</strong>
					<%=restaurant.getDeliveryTime()%>
					mins
				</p>

				<p>
					<strong>📍 Address :</strong>
					<%=restaurant.getAddress()%>
				</p>

				<p>
					<strong>Status :</strong>

					<%
					if (restaurant.getIsActive() == 1) {
					%>
					<span class="open">🟢 Open</span>
					<%
					} else {
					%>
					<span class="closed">🔴 Closed</span>
					<%
					}
					%>

				</p>

				<form action="MenuServlet" method="get">
					<input type="hidden" name="restaurantId"
						value="<%=restaurant.getRestaurantId()%>"> <input
						type="submit" value="📖 View Menu">
				</form>

			</div>
		</div>

		<%
		}
		} else {
		%>

	</div>

	<h2 class="empty">No Restaurants Available</h2>

	<%
	}
	%>

</body>
</html>

