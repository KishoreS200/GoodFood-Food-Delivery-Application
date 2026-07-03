<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Restaurant" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Restaurants</title>

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

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
        }

        nav a:hover {
            color: #ffe082;
        }

        /* Title */

        .title {
            text-align: center;
            color: #ff6b35;
            margin: 30px 0;
        }

        /* Grid */

        .container {
            width: 90%;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(330px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        /* Card */

        .card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-8px);
        }

        .card h2 {
            color: #ff6b35;
            margin-bottom: 15px;
        }

        .card p {
            margin: 10px 0;
        }

        .open {
            color: green;
            font-weight: bold;
        }

        .closed {
            color: red;
            font-weight: bold;
        }

        input[type="submit"] {
            margin-top: 15px;
            background: #ff6b35;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #e65100;
        }

        .empty {
            text-align: center;
            color: red;
            margin-top: 40px;
        }

    </style>

</head>

<body>

<header>

    <nav>

        <h2>🍴 GoodFoods</h2>

        <div>
            <a href="home.jsp">Home</a>
            <a href="CartServlet">Cart</a>
        </div>

    </nav>

</header>

<h1 class="title">🍽 Explore Restaurants</h1>

<div class="container">

<%
    List<Restaurant> restaurantList =
        (List<Restaurant>) request.getAttribute("allRestaurants");

    if (restaurantList != null && !restaurantList.isEmpty()) {

        for (Restaurant restaurant : restaurantList) {
%>

    <div class="card">

        <h2><%= restaurant.getName() %></h2>

        <p>
            <strong>🍜 Cuisine :</strong>
            <%= restaurant.getCuisineType() %>
        </p>

        <p>
            <strong>⭐ Rating :</strong>
            <%= restaurant.getRating() %>
        </p>

        <p>
            <strong>🚚 Delivery :</strong>
            <%= restaurant.getDeliveryTime() %> mins
        </p>

        <p>
            <strong>📍 Address :</strong>
            <%= restaurant.getAddress() %>
        </p>

        <p>

            <strong>Status :</strong>

            <%
                if (restaurant.getIsActive() == 1) {
            %>

                <span class="open">🟢 Open</span>

            <%
                } else {
            %>

                <span class="closed">🔴 Closed</span>

            <%
                }
            %>

        </p>

        <form action="MenuServlet" method="get">

            <input
                type="hidden"
                name="restaurantId"
                value="<%= restaurant.getRestaurantId() %>">

            <input
                type="submit"
                value="📖 View Menu">

        </form>

    </div>

<%
        }
    } else {
%>

</div>

<h2 class="empty">No Restaurants Available</h2>

<%
    }
%>

</body>
</html>

