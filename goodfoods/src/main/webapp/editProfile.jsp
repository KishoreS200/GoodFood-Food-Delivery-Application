<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Edit Profile</title>

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

/* Form */
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 60px;
}

.card {
	width: 500px;
	background: white;
	padding: 35px;
	border-radius: 18px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, .15);
}

.card h2 {
	text-align: center;
	color: #ff6b35;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 8px;
	color: #333;
}

input, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 16px;
	outline: none;
}

input:focus, textarea:focus {
	border-color: #ff6b35;
}

textarea {
	resize: none;
	height: 100px;
}

.btn-group {
	display: flex;
	justify-content: space-between;
	margin-top: 25px;
}

.btn {
	padding: 12px 25px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
}

.save {
	background: #ff6b35;
	color: white;
}

.save:hover {
	background: #e65100;
}

.cancel {
	background: #6c757d;
	color: white;
}

.cancel:hover {
	background: #555;
}
</style>

</head>

<body>

	<%
	User user = (User) session.getAttribute("loggedInUser");

	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<header>

		<nav>

			<h2>🍴 GoodFoods</h2>

			<div class="nav-links">

				<a href="home.jsp">Home</a> <a href="RestaurantServlet">Restaurants</a>

				<a href="ProfileServlet">Profile</a>

			</div>

		</nav>

	</header>

	<div class="container">

		<div class="card">

			<h2>✏ Edit Profile</h2>

			<form action="UpdateProfileServlet" method="post">

				<div class="form-group">

					<label>Name</label> <input type="text" name="userName"
						value="<%=user.getUserName()%>" required>

				</div>

				<div class="form-group">

					<label>Email</label> <input type="email"
						value="<%=user.getEmail()%>" readonly>

				</div>

				<div class="form-group">

					<label>Address</label>

					<textarea name="address" required><%=user.getAddress()%></textarea>

				</div>

				<div class="btn-group">

					<input class="btn save" type="submit" value="💾 Save Changes">

					<a href="ProfileServlet" class="btn cancel"> Cancel </a>

				</div>

			</form>

		</div>

	</div>

</body>
</html>