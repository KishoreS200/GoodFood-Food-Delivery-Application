<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Add Restaurant</title>

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
	color: #444;
}

input, textarea, select {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
}

textarea {
	resize: vertical;
	height: 100px;
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
	margin-top: 15px;
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

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div>

				<a href="adminDashboard.jsp">Dashboard</a> <a href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<div class="container">

		<div class="card">

			<h2>➕ Add Restaurant</h2>

			<form action="<%=request.getContextPath()%>/AddRestaurantServlet"
				method="post">

				<div class="form-group">

					<label>Restaurant Name</label> <input type="text"
						name="restaurantName" required>

				</div>

				<div class="form-group">

					<label>Cuisine Type</label> <input type="text" name="cuisineType"
						required>

				</div>

				<div class="form-group">

					<label>Address</label>

					<textarea name="address" required></textarea>

				</div>

				<div class="form-group">

					<label>Phone Number</label> <input type="text" name="phoneNumber"
						required>

				</div>

				<div class="form-group">

					<label>Rating</label> <input type="number" step="0.1" min="0"
						max="5" name="rating" required>

				</div>

				<div class="form-group">

					<label>Delivery Time</label> <input type="text" name="deliveryTime"
						placeholder="30-40 mins" required>

				</div>

				<div class="form-group">

					<label>Restaurant Image</label> <input type="text" name="image"
						placeholder="kfc.jpeg" required>

				</div>

				<div class="form-group">

					<label>Status</label> <select name="isActive">

						<option value="1">Open</option>

						<option value="0">Closed</option>

					</select>

				</div>

				<input class="submit-btn" type="submit" value="Add Restaurant">

			</form>

			<a class="back" href="AdminDashboardServlet"> ⬅ Back to Dashboard </a>

		</div>

	</div>

</body>

</html>