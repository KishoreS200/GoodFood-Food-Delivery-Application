<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Register</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI",sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#ff6b35,#ff914d);
    display:flex;
    justify-content:center;
    align-items:center;
    padding:30px;
}

.container{
    width:420px;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

.container h1{
    text-align:center;
    color:#ff6b35;
    margin-bottom:25px;
}

.form-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
    color:#444;
}

input[type="text"],
input[type="email"],
input[type="password"],
textarea,
select{

    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
    transition:.3s;
}

input:focus,
textarea:focus,
select:focus{

    outline:none;
    border-color:#ff6b35;
    box-shadow:0 0 8px rgba(255,107,53,.3);
}

textarea{
    resize:none;
}

input[type="submit"]{

    width:100%;
    background:#ff6b35;
    color:white;
    border:none;
    padding:12px;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
    transition:.3s;
}

input[type="submit"]:hover{

    background:#e65100;
}

.login-link{

    text-align:center;
    margin-top:20px;
}

.login-link a{

    color:#ff6b35;
    text-decoration:none;
    font-weight:bold;
}

.login-link a:hover{

    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

    <h1>🍴 Create Account</h1>

    <form action="RegisterServlet" method="post">

        <div class="form-group">

            <label>User Name</label>

            <input
                type="text"
                name="userName"
                placeholder="Enter username"
                required>

        </div>

        <div class="form-group">

            <label>Email</label>

            <input
                type="email"
                name="email"
                placeholder="Enter email"
                required>

        </div>

        <div class="form-group">

            <label>Password</label>

            <input
                type="password"
                name="password"
                placeholder="Enter password"
                required>

        </div>

        <div class="form-group">

            <label>Confirm Password</label>

            <input
                type="password"
                name="confirmPassword"
                placeholder="Confirm password"
                required>

        </div>

        <div class="form-group">

            <label>Address</label>

            <textarea
                name="address"
                rows="4"
                placeholder="Enter address"
                required></textarea>

        </div>

        <input
            type="submit"
            value="Register">

    </form>

    <div class="login-link">

        Already have an account?

        <a href="login.jsp">Login</a>

    </div>

</div>

</body>

</html>
