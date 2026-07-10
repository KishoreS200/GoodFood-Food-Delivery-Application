<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Restaurant"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Edit Restaurant</title>

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

nav a {
	color: white;
	text-decoration: none;
	font-weight: bold;
	margin-left: 20px;
}

nav a:hover {
	color: #ffe082;
}

/* Form */
.container {
	width: 700px;
	margin: 40px auto;
}

.card {
	background: white;
	padding: 35px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .15);
}

h2 {
	text-align: center;
	color: #ff6b35;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

input, textarea, select {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
}

textarea {
	height: 100px;
	resize: vertical;
}

input:focus, textarea:focus, select:focus {
	outline: none;
	border-color: #ff6b35;
}

.submit-btn {
	width: 100%;
	padding: 14px;
	background: #2196F3;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	cursor: pointer;
}

.submit-btn:hover {
	background: #1976D2;
}

.back {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: #ff6b35;
	font-weight: bold;
}

.preview {
	width: 150px;
	height: 120px;
	object-fit: cover;
	border-radius: 10px;
	margin-bottom: 15px;
	border: 2px solid #ddd;
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

	Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
	%>

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div>

				<a href="adminDashboard.jsp">Dashboard</a> <a
					href="RestaurantManagementServlet">Restaurants</a> <a
					href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<div class="container">

		<div class="card">

			<h2>✏ Edit Restaurant</h2>

			<form action="UpdateRestaurantServlet" method="post">

				<input type="hidden" name="restaurantId"
					value="<%=restaurant.getRestaurantId()%>">

				<div class="form-group">

					<label>Restaurant Name</label> <input type="text"
						name="restaurantName" value="<%=restaurant.getName()%>" required>

				</div>

				<div class="form-group">

					<label>Cuisine Type</label> <input type="text" name="cuisineType"
						value="<%=restaurant.getCuisineType()%>" required>

				</div>

				<div class="form-group">

					<label>Address</label>

					<textarea name="address" required><%=restaurant.getAddress()%></textarea>

				</div>

				<div class="form-group">

					<label>Delivery Time (Minutes)</label> <input type="number"
						name="deliveryTime" value="<%=restaurant.getDeliveryTime()%>"
						required>

				</div>

				<div class="form-group">

					<label>Rating</label> <input type="number" step="0.1" min="0"
						max="5" name="rating" value="<%=restaurant.getRating()%>" required>

				</div>

				<div class="form-group">

					<label>Current Image</label> <br> <img class="preview"
						src="images/restaurants/<%=restaurant.getImage()%>">

				</div>

				<div class="form-group">

					<label>Image File Name</label> <input type="text" name="image"
						value="<%=restaurant.getImage()%>" required>

				</div>

				<div class="form-group">

					<label>Status</label> <select name="isActive">

						<option value="1" <%=restaurant.getIsActive() == 1 ? "selected" : ""%>>
							Open</option>

						<option value="0" <%=restaurant.getIsActive() == 0 ? "selected" : ""%>>
							Closed</option>

					</select>

				</div>

				<input class="submit-btn" type="submit" value="Update Restaurant">

			</form>

			<a class="back" href="RestaurantManagementServlet"> ⬅ Back to
				Restaurants </a>

		</div>

	</div>

</body>

</html>