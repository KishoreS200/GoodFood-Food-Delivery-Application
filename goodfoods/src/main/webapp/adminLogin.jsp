<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Segoe UI", sans-serif;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #ff6b35, #ff914d);
}

.login-card {
	width: 400px;
	background: white;
	padding: 35px;
	border-radius: 18px;
	box-shadow: 0 15px 40px rgba(0, 0, 0, .25);
}

h2 {
	text-align: center;
	color: #ff6b35;
	margin-bottom: 30px;
}

input {
	width: 100%;
	padding: 12px;
	margin: 12px 0;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 16px;
}

input:focus {
	outline: none;
	border-color: #ff6b35;
}

button {
	width: 100%;
	padding: 14px;
	margin-top: 20px;
	border: none;
	border-radius: 8px;
	background: #ff6b35;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

button:hover {
	background: #e65100;
}

.error {
	color: red;
	text-align: center;
	margin-top: 10px;
}
</style>

</head>

<body>

	<div class="login-card">

		<h2>🔐 Admin Login</h2>

		<form action="AdminLoginServlet" method="post">

			<input type="email" name="email" placeholder="Admin Email" required>

			<input type="password" name="password" placeholder="Password"
				required>

			<button type="submit">Login</button>

			<%
			String error = (String) request.getAttribute("error");

			if (error != null) {
			%>

			<p class="error">
				<%=error%>
			</p>

			<%
			}
			%>

		</form>

	</div>

</body>
</html>