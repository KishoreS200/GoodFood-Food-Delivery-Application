<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User"%>
<%@ page import="com.food.model.Cart" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Checkout</title>

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

/* Navbar */

header{
    background:linear-gradient(135deg,#ff6b35,#ff914d);
    padding:15px 40px;
}

nav{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

nav h2{
    color:white;
    font-size:28px;
}

nav a{
    color:white;
    text-decoration:none;
    margin-left:20px;
    font-weight:bold;
}

nav a:hover{
    color:#ffe082;
}

/* Title */

.title{
    text-align:center;
    color:#ff6b35;
    margin:30px 0;
}

/* Checkout Card */

.container{
    width:700px;
    margin:0 auto 40px;
}

.card{
    background:white;
    border-radius:15px;
    padding:30px;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
}

.section-title{
    color:#ff6b35;
    margin-bottom:15px;
    border-bottom:2px solid #ff6b35;
    padding-bottom:8px;
}

.info{
    margin:15px 0;
    font-size:17px;
}

textarea{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
    resize:none;
}

textarea:focus{
    outline:none;
    border-color:#ff6b35;
}

.payment-option{
    margin:15px 0;
    font-size:17px;
}

.payment-option label{
    cursor:pointer;
}

.total-card{
    margin-top:30px;
    background:#fff7f2;
    padding:20px;
    border-radius:10px;
    text-align:center;
}

.total-card h2{
    color:#28a745;
    margin-bottom:10px;
}

.amount{
    font-size:36px;
    font-weight:bold;
    color:#000;
}

.place-btn{
    width:100%;
    margin-top:25px;
    padding:15px;
    border:none;
    border-radius:8px;
    background:#28a745;
    color:white;
    font-size:18px;
    cursor:pointer;
    transition:.3s;
}

.place-btn:hover{
    background:#218838;
}

</style>

</head>

<body>

<%
    User user = (User)session.getAttribute("loggedInUser");

    Cart cart=(Cart)session.getAttribute("cart");
    
    double totalAmount=0;
    if(cart!=null)
    {
    	totalAmount=cart.getGrandTotal();
    }
    
%>

<header>

    <nav>

        <h2>🍴 GoodFoods</h2>

        <div>

            <a href="home.jsp">Home</a>
            <a href="CartServlet">Cart</a>

        </div>

    </nav>

</header>

<h1 class="title">Checkout</h1>

<div class="container">

    <div class="card">

        <form action="OrderServlet" method="post">

            <h2 class="section-title">Customer Details</h2>

            <div class="info">
                <strong>Name :</strong>
                <%= user.getUserName() %>
            </div>

            <div class="info">
                <strong>Email :</strong>
                <%= user.getEmail() %>
            </div>

            <br>

            <h2 class="section-title">Delivery Address</h2>

            <textarea
                name="address"
                rows="4"
                required><%= user.getAddress() %></textarea>

            <br><br>

            <h2 class="section-title">Payment Method</h2>

            <div class="payment-option">

                <label>

                    <input
                        type="radio"
                        name="paymentMethod"
                        value="Cash On Delivery"
                        required>

                    💵 Cash On Delivery

                </label>

            </div>

            <div class="payment-option">

                <label>

                    <input
                        type="radio"
                        name="paymentMethod"
                        value="UPI">

                    📱 UPI

                </label>

            </div>

            <div class="payment-option">

                <label>

                    <input
                        type="radio"
                        name="paymentMethod"
                        value="Card">

                    💳 Credit / Debit Card

                </label>

            </div>

            <div class="total-card">

                <h2>Total Amount</h2>

                <div class="amount">
                    ₹<%= totalAmount %>
                </div>

            </div>

            <input
                class="place-btn"
                type="submit"
                value="Place Order">

        </form>

    </div>

</div>

</body>

</html>