<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Edit Customer</title>

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

.container {
	width: 600px;
	margin: 40px auto;
}

.card {
	background: white;
	padding: 35px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .15);
}

.title {
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

input, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
}

textarea {
	height: 100px;
	resize: none;
}

input:focus, textarea:focus {
	outline: none;
	border-color: #ff6b35;
}

.update-btn {
	width: 100%;
	padding: 14px;
	background: #2196F3;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	cursor: pointer;
}

.update-btn:hover {
	background: #1976D2;
}

.back {
	display: inline-block;
	margin-top: 20px;
	color: #ff6b35;
	text-decoration: none;
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

	User customer = (User) request.getAttribute("customer");
	%>

	<header>

		<nav>

			<div class="logo">🍴 GoodFoods Admin</div>

			<div class="nav-links">

				<a href="adminDashboard.jsp">Dashboard</a> <a
					href="CustomerManagementServlet">Customers</a> <a
					href="LogoutServlet">Logout</a>

			</div>

		</nav>

	</header>

	<div class="container">

		<div class="card">

			<h2 class="title">✏ Edit Customer</h2>

			<form action="UpdateCustomerServlet" method="post">

				<input type="hidden" name="userId" value="<%=customer.getUserId()%>">

				<div class="form-group">

					<label>Name</label> <input type="text" name="userName"
						value="<%=customer.getUserName()%>" required>

				</div>

				<div class="form-group">

					<label>Email</label> <input type="email" name="email"
						value="<%=customer.getEmail()%>" required>

				</div>

				<div class="form-group">

					<label>Password</label> <input type="text" name="password"
						value="<%=customer.getPassword()%>" required>

				</div>

				<div class="form-group">

					<label>Address</label>

					<textarea name="address" required><%=customer.getAddress()%></textarea>

				</div>

				<input class="update-btn" type="submit" value="Update Customer">

			</form>

			<a class="back" href="CustomerManagementServlet"> ⬅ Back to
				Customers </a>

		</div>

	</div>

</body>

</html>