<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Order Confirmed</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI",sans-serif;
}

body{
    background:#f4f6f9;
}

.container{
    width:500px;
    margin:100px auto;
    background:white;
    padding:40px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
}

.success{
    font-size:70px;
}

h1{
    color:#28a745;
    margin:20px 0;
}

p{
    color:#555;
    font-size:18px;
    margin-bottom:25px;
}

.btn{
    display:inline-block;
    background:#ff6b35;
    color:white;
    text-decoration:none;
    padding:12px 25px;
    border-radius:8px;
    font-size:18px;
}

.btn:hover{
    background:#e65100;
}

</style>

</head>

<body>

<div class="container">

    <div class="success">✅</div>

    <h1>Order Confirmed!</h1>

    <p>
        Thank you for ordering with
        <strong>GoodFoods</strong>.
    </p>

    <p>
        Your order has been placed successfully.
    </p>

    <p>
        🍽 Estimated Delivery Time:
        <strong>30 - 40 Minutes</strong>
    </p>

    <a href="RestaurantServlet" class="btn">
        Continue Shopping
    </a>

</div>

</body>

</html>