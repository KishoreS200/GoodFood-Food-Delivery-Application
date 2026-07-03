# 🍔 GoodFoods - Online Food Ordering System

GoodFoods is a Java-based online food ordering web application developed using JSP, Servlets, JDBC, and MySQL. It allows customers to browse restaurants, view menus, add items to the cart, place orders, and manage their food ordering experience.

---

## 🚀 Features

### 👤 Customer Module
- User Registration
- User Login
- Browse Restaurants
- View Restaurant Menu
- Add Items to Cart
- Update Item Quantity (+ / -)
- Remove Items from Cart
- Checkout
- Place Order
- Order Confirmation

### 🛒 Cart Features
- Session-based Cart
- Quantity Update
- Automatic Total Calculation
- Grand Total
- Single Restaurant Cart Validation

### 🍽 Restaurant Module
- Display Restaurants
- Restaurant Details
- Restaurant-wise Menu

### 💳 Checkout
- Customer Details
- Delivery Address
- Payment Method
- Order Summary

---

## 🛠 Technologies Used

### Frontend
- HTML
- CSS
- JSP
- JavaScript

### Backend
- Java
- Servlets
- JDBC

### Database
- MySQL

### Server
- Apache Tomcat 10

### IDE
- Eclipse IDE

---

## 📂 Project Structure

```
GoodFoods
│
├── src
│   ├── com.food.model
│   ├── com.food.DAO
│   ├── com.food.DAOImpl
│   ├── com.food.Servlet
│   └── com.food.utility
│
├── WebContent
│   ├── home.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── restaurants.jsp
│   ├── menu.jsp
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── orderConfirmed.jsp
│   └── css
│
└── database.sql
```

---

## 📊 Database Tables

- User
- Restaurant
- Menu
- Cart (Session)
- Order
- OrderItem

---

## 🔄 Application Flow

```
Home
   ↓
Login / Register
   ↓
Restaurants
   ↓
Restaurant Menu
   ↓
Add to Cart
   ↓
Shopping Cart
   ↓
Checkout
   ↓
Place Order
   ↓
Order Confirmed
```

---

## 📸 Screens

- Home Page
- Login Page
- Registration Page
- Restaurant Listing
- Menu Page
- Shopping Cart
- Checkout Page
- Order Confirmation Page

---

## 📌 Current Functionalities

✔ User Authentication

✔ Restaurant Listing

✔ Menu Listing

✔ Session-based Shopping Cart

✔ Quantity Update

✔ Remove Items

✔ Checkout

✔ Order Placement

✔ Order Confirmation

---

## 🔮 Future Enhancements

- Admin Dashboard
- Delivery Agent Module
- Order History
- Search Restaurants
- Online Payment Gateway
- Food Images
- Ratings & Reviews
- Email Notifications
- Live Order Tracking

---

## 👨‍💻 Author

**Kishore S**

Information Science and Engineering

The Oxford College of Engineering

---

## 📜 License

This project is developed for educational purposes.
