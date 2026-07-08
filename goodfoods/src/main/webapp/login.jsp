<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="css/cursor.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<title>Login</title>

<style>
/* =========================
   GOOGLE FONT
========================= */
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap')
	;

/* =========================
   RESET
========================= */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

/* =========================
   BODY
========================= */
body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

/* =========================
   BACKGROUND VIDEO
========================= */
.bg-video {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	z-index: -2;
}

/* =========================
   DARK OVERLAY
========================= */
.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .38);
	z-index: -1;
}

/* =========================
   LOGIN CARD
========================= */
.form {
	width: 430px;
	padding: 40px;
	border-radius: 30px;
	background: rgba(255, 255, 255, .14);
	backdrop-filter: blur(14px);
	-webkit-backdrop-filter: blur(14px);
	border: 1px solid rgba(255, 255, 255, .20);
	box-shadow: 0 20px 45px rgba(0, 0, 0, .35);
	animation: fadeIn .8s ease;
}

/* =========================
   ANIMATION
========================= */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* =========================
   LOGO
========================= */
.logo {
	width: 75px;
	display: block;
	margin: auto;
	margin-bottom: 15px;
}

/* =========================
   TITLE
========================= */
.form h1 {
	text-align: center;
	color: white;
	font-size: 42px;
	margin-bottom: 5px;
}

.form p {
	text-align: center;
	color: #eeeeee;
	margin-bottom: 30px;
}

/* =========================
   LABELS
========================= */
.flex-column {
	margin-bottom: 18px;
}

.flex-column label {
	display: block;
	color: white;
	font-weight: 600;
	margin-bottom: 8px;
}

/* =========================
   INPUT BOX
========================= */
.inputForm {
	height: 58px;
	display: flex;
	align-items: center;
	background: white;
	border-radius: 50px;
	padding: 0 18px;
	transition: .3s;
	box-shadow: 0 10px 20px rgba(0, 0, 0, .08);
}

.inputForm:hover {
	transform: translateY(-2px);
}

.inputForm:focus-within {
	box-shadow: 0 0 0 4px rgba(255, 136, 0, .25);
}

/* =========================
   ICONS
========================= */
.inputForm i {
	color: #ff7a18;
	font-size: 18px;
}

/* =========================
   INPUT
========================= */
.input {
	border: none;
	outline: none;
	width: 100%;
	margin-left: 12px;
	font-size: 16px;
	background: none;
}

::placeholder {
	color: #999;
}

/* =========================
   FORGOT PASSWORD
========================= */
.forgot {
	text-align: right;
	margin-top: -5px;
	margin-bottom: 18px;
}

.forgot a {
	color: white;
	text-decoration: none;
	font-size: 14px;
}

.forgot a:hover {
	color: #ffd4b0;
}

/* =========================
   LOGIN BUTTON
========================= */
.button-submit {
	width: 100%;
	height: 58px;
	border: none;
	border-radius: 50px;
	background: linear-gradient(135deg, #ff7a18, #ff9800);
	color: white;
	font-size: 17px;
	font-weight: 600;
	cursor: pointer;
	transition: .35s;
	box-shadow: 0 15px 30px rgba(255, 122, 24, .45);
}

.button-submit:hover {
	transform: translateY(-3px);
	box-shadow: 0 20px 40px rgba(255, 122, 24, .55);
}

.button-submit:active {
	transform: scale(.97);
}

/* =========================
   CREATE ACCOUNT
========================= */
.home-link {
	margin-top: 22px;
	text-align: center;
}

.home-link a {
	color: white;
	text-decoration: none;
	font-weight: 500;
	transition: .3s;
}

.home-link a:hover {
	color: #ffd3a6;
}

/* =========================
   DIVIDER
========================= */
.divider {
	display: flex;
	align-items: center;
	margin: 22px 0;
}

.divider::before, .divider::after {
	content: "";
	flex: 1;
	height: 1px;
	background: rgba(255, 255, 255, .3);
}

.divider span {
	color: white;
	padding: 0 12px;
	font-size: 14px;
}

/* =========================
   RESPONSIVE
========================= */
@media ( max-width :500px) {
	.form {
		width: 92%;
		padding: 30px;
	}
	.form h1 {
		font-size: 32px;
	}
	.inputForm {
		height: 54px;
	}
	.button-submit {
		height: 54px;
	}
}
</style>

</head>

<body>
	<video autoplay muted loop playsinline class="bg-video">
		<source src="videos/Bg.mp4" type="video/mp4">
	</video>

	<div class="overlay"></div>

	<form class="form" action="login" method="POST">

		<h1>🍴 GoodFoods</h1>
		<p>Welcome Back!</p>

		<div class="flex-column">
			<label>Email</label>

			<div class="inputForm">
				<input class="input" type="text" name="email"
					placeholder="Enter your email" required>
			</div>
		</div>

		<div class="flex-column">
			<label>Password</label>

			<div class="inputForm">
				<input class="input" type="password" name="password"
					placeholder="Enter your password" required>
			</div>
		</div>

		<input class="button-submit" type="submit" value="Login">

		<div class="home-link">
			<a href="register.jsp">Create an Account</a>
		</div>

	</form>

</body>

</html>
