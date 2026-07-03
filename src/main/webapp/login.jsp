<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #ff6b35, #ff914d);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 380px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .login-container h1 {
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
            color: #444;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #ff6b35;
            box-shadow: 0 0 8px rgba(255, 107, 53, 0.3);
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #ff6b35;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #e65100;
        }

        .home-link {
            text-align: center;
            margin-top: 20px;
        }

        .home-link a {
            text-decoration: none;
            color: #ff6b35;
            font-weight: bold;
        }

        .home-link a:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>

    <div class="login-container">

        <h1>🍴 GoodFoods Login</h1>

        <form action="login" method="POST">

            <div class="form-group">

                <label>Email</label>

                <input
                    type="text"
                    name="email"
                    placeholder="Enter your email"
                    required>

            </div>

            <div class="form-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter your password"
                    required>

            </div>

            <input
                type="submit"
                value="Login">

        </form>

        <div class="home-link">
            <a href="register.jsp"> Create an Account</a>
        </div>

    </div>

</body>

</html>
