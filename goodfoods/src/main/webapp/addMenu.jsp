<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Restaurant"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Add Menu Item</title>

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

.logo {
	font-size: 28px;
	font-weight: bold;
	color: white;
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
	border: none;
	border-radius: 8px;
	background: #28a745;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.submit-btn:hover {
	background: #218838;
}

.back {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: #ff6b35;
	font-weight: bold;
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

			<div>

				<a href="adminDashboard.jsp">Dashboard</a> <a
					href="MenuManagementServlet">Menu</a> <a href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<div class="container">

		<div class="card">

			<h2>➕ Add Menu Item</h2>

			<form action="AddMenuServlet" method="post">

				<div class="form-group">

					<label>Restaurant</label> <select name="restaurantId" required>

						<option value="">Select Restaurant</option>

						<%
						if (restaurantList != null) {
							for (Restaurant r : restaurantList) {
						%>

						<option value="<%=r.getRestaurantId()%>">
							<%=r.getName()%>
						</option>

						<%
						}
						}
						%>

					</select>

				</div>

				<div class="form-group">

					<label>Item Name</label> <input type="text" name="itemName"
						required>

				</div>

				<div class="form-group">

					<label>Description</label>

					<textarea name="description" required></textarea>

				</div>

				<div class="form-group">

					<label>Price</label> <input type="number" step="0.01" name="price"
						required>

				</div>

				<div class="form-group">

					<label>Category</label> <input type="text" name="category"
						placeholder="Pizza, Burger, Drinks..." required>

				</div>

				<div class="form-group">

					<label>Image Name</label> <input type="text" name="image"
						placeholder="pizza.jpg" required>

				</div>

				<div class="form-group">

					<label>Status</label> <select name="isAvailable">

						<option value="1">Available</option>

						<option value="0">Unavailable</option>

					</select>

				</div>

				<input class="submit-btn" type="submit" value="Add Menu Item">

			</form>

			<a class="back" href="MenuManagementServlet"> ⬅ Back to Menu
				Management </a>

		</div>

	</div>

</body>

</html>