<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoodFoods - Home</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f5f7fa;
    color:#333;
}

/* Navbar */
header{
    background:linear-gradient(135deg,#ff6b35,#ff914d);
    padding:15px 50px;
    position:sticky;
    top:0;
    z-index:1000;
}

nav{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

nav h2{
    color:white;
    font-size:30px;
}

nav div a{
    color:white;
    text-decoration:none;
    margin-left:20px;
    font-weight:bold;
    transition:0.3s;
}

nav div a:hover{
    color:#ffe082;
}

/* Hero Section */
.hero{
    text-align:center;
    padding:100px 20px;
    background:url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1400&q=80");
    background-size:cover;
    background-position:center;
    color:white;
    position:relative;
}

.hero::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.5);
}

.hero-content{
    position:relative;
    z-index:1;
}

.hero h1{
    font-size:50px;
    margin-bottom:20px;
}

.hero p{
    font-size:20px;
    margin-bottom:30px;
}

.btn{
    background:#ff6b35;
    color:white;
    border:none;
    padding:12px 25px;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
    margin:10px;
    transition:0.3s;
}

.btn:hover{
    background:#e65100;
    transform:scale(1.05);
}

/* Common Section */
section{
    background:white;
    width:85%;
    margin:30px auto;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

section h2{
    color:#ff6b35;
    margin-bottom:20px;
}

/* Search */
.search-box{
    text-align:center;
}

input[type=text]{
    width:70%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:16px;
}

input[type=submit]{
    background:#ff6b35;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:8px;
    cursor:pointer;
    font-size:16px;
}

input[type=submit]:hover{
    background:#e65100;
}

/* Categories */
.categories{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
    gap:15px;
}

.card{
    background:#fff3e0;
    padding:20px;
    text-align:center;
    border-radius:10px;
    font-size:18px;
    font-weight:bold;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
    background:#ffe0b2;
}

/* Offers */
.offer{
    background:#fff3e0;
    padding:15px;
    margin-bottom:10px;
    border-left:5px solid #ff6b35;
    border-radius:8px;
}

/* Why Choose Us */
.features{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:15px;
}

.feature-card{
    background:#fafafa;
    padding:20px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 2px 5px rgba(0,0,0,0.1);
}

/* Reviews */
.review{
    background:#f8f9fa;
    padding:15px;
    margin-bottom:15px;
    border-left:5px solid #ff6b35;
    border-radius:8px;
}

/* Footer */
footer{
    background:#212121;
    color:white;
    text-align:center;
    padding:25px;
    margin-top:30px;
}

footer a{
    color:#ffb74d;
    text-decoration:none;
    margin:0 10px;
}

footer a:hover{
    text-decoration:underline;
}

/* Responsive */
@media(max-width:768px){

    nav{
        flex-direction:column;
        gap:15px;
    }

    nav div{
        display:flex;
        flex-wrap:wrap;
        justify-content:center;
    }

    .hero h1{
        font-size:35px;
    }

    input[type=text]{
        width:100%;
        margin-bottom:10px;
    }
}
</style>
</head>

<body>

<header>
    <nav>
        <h2>🍴 GoodFoods</h2>
        <div>
            <a href="home.jsp">Home</a>
            <a href="RestaurantServlet">Restaurants</a>
            <a href="CartServlet">Cart</a>
            <a href="login.jsp">Login</a>
        </div>
    </nav>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h1>Delicious Food Delivered To Your Doorstep</h1>

        <p>
            Discover your favorite dishes from top restaurants and
            get them delivered quickly and safely.
        </p>

        <a href="RestaurantServlet">
            <button class="btn">Explore Restaurants</button>
        </a>
    </div>
</section>

<!-- Search -->
<section>
    <h2>🔍 Search Food & Restaurants</h2>

    <div class="search-box">
        <form action="SearchServlet" method="get">
            <input type="text" name="keyword"
                placeholder="Search Food or Restaurant">

            <input type="submit" value="Search">
        </form>
    </div>
</section>

<!-- Categories -->
<section>
    <h2>🍽 Food Categories</h2>

    <div class="categories">
        <div class="card">🍕 Pizza</div>
        <div class="card">🍔 Burger</div>
        <div class="card">🍜 Noodles</div>
        <div class="card">🍗 Chicken</div>
        <div class="card">🥗 Salads</div>
        <div class="card">🍰 Desserts</div>
        <div class="card">☕ Beverages</div>
        <div class="card">🍟 Snacks</div>
    </div>
</section>

<!-- Offers -->
<section>
    <h2>🎉 Special Offers</h2>

    <div class="offer">🎉 50% OFF on First Order</div>
    <div class="offer">🚚 Free Delivery on Orders Above ₹299</div>
    <div class="offer">🎁 Exclusive Deals for Registered Users</div>
</section>

<!-- Features -->
<section>
    <h2>⭐ Why Choose Us?</h2>

    <div class="features">
        <div class="feature-card">
            <h3>🚚 Fast Delivery</h3>
            <p>Quick and reliable delivery service.</p>
        </div>

        <div class="feature-card">
            <h3>🥗 Fresh Food</h3>
            <p>Prepared with hygiene and quality.</p>
        </div>

        <div class="feature-card">
            <h3>💳 Secure Payments</h3>
            <p>Safe online payment options.</p>
        </div>

        <div class="feature-card">
            <h3>📍 Live Tracking</h3>
            <p>Track your order in real time.</p>
        </div>

        <div class="feature-card">
            <h3>📞 24/7 Support</h3>
            <p>Always available to help you.</p>
        </div>
    </div>
</section>

<!-- Reviews -->
<section>
    <h2>💬 Customer Reviews</h2>

    <div class="review">
        ⭐⭐⭐⭐⭐ <br><br>
        Food arrived hot and fresh. Great service!
    </div>

    <div class="review">
        ⭐⭐⭐⭐⭐ <br><br>
        Easy ordering process and quick delivery.
    </div>

    <div class="review">
        ⭐⭐⭐⭐⭐ <br><br>
        Best food ordering experience I've had.
    </div>
</section>

<!-- Footer -->
<footer>

    <p>
        <a href="#">About Us</a> |
        <a href="#">Contact Us</a> |
        <a href="#">Privacy Policy</a> |
        <a href="#">Terms & Conditions</a>
    </p>

    <br>

    <p>
        &copy; 2026 GoodFoods. All Rights Reserved.
    </p>

</footer>

</body>
</html>