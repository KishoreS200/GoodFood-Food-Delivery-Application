# 🍴 GoodFoods - Food Delivery Web Application

GoodFoods is a full-stack Java web application that allows customers to browse restaurants, order food online, manage their cart, and track orders. It also provides a complete Admin Panel to manage restaurants, menus, customers, and orders.

---

# 🚀 Features

## 👤 Customer Module

- User Registration
- User Login & Logout
- Profile Management
- Browse Restaurants
- View Restaurant Menus
- Search Food Items
- Shopping Cart
- Checkout
- Place Orders
- View Order History
- View Order Details

---

## 👨‍💼 Admin Module

- Admin Login
- Dashboard
- Restaurant Management
  - Add Restaurant
  - Edit Restaurant
  - Delete Restaurant
- Menu Management
  - Add Menu
  - Edit Menu
  - Delete Menu
- Order Management
  - View Orders
  - View Order Details
  - Update Order Status
- Customer Management
  - View Customers
  - Edit Customer
  - Delete Customer

---

# 🛠 Technologies Used

## Frontend

- HTML5
- CSS3
- JSP
- JavaScript

## Backend

- Java
- Jakarta Servlet
- JDBC

## Database

- MySQL

## Server

- Apache Tomcat 10

## IDE

- Eclipse IDE

---

# 🗄 Database

Database Name

```
goodfoods
```

Main Tables

```
user
restaurant
menu
cart
ordertable
orderitem
```

---

# 📂 Project Structure

```
GoodFoods
│
├── src
│   ├── com.food.Servlet
│   ├── com.food.DAO
│   ├── com.food.DAOImpl
│   ├── com.food.model
│   └── com.food.utility
│
├── WebContent
│   ├── css
│   ├── images
│   ├── home.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── profile.jsp
│   ├── adminDashboard.jsp
│   └── ...
│
└── README.md
```

---

# ⚙ Installation

## Clone Repository

```bash
git clone https://github.com/yourusername/GoodFoods.git
```

---

## Import Project

Import the project into Eclipse as an Existing Dynamic Web Project.

---

## Configure Database

Create a MySQL database

```
goodfoods
```

Import the SQL file.

Update database credentials inside

```
DBConnection.java
```

Example

```java
private static final String URL = "jdbc:mysql://localhost:3306/goodfoods";
private static final String USERNAME = "root";
private static final String PASSWORD = "yourpassword";
```

---

## Configure Apache Tomcat

- Install Apache Tomcat 10
- Add Tomcat Server in Eclipse
- Run the project

---

# ▶ Running the Project

Open

```
http://localhost:8080/goodfoods/
```

---

# 📸 Screens

### Customer

- Home Page
- Restaurant Listing
- Menu Page
- Cart
- Checkout
- My Orders
- Order Details
- Profile

### Admin

- Admin Login
- Dashboard
- Restaurant Management
- Menu Management
- Order Management
- Customer Management

---

# 📈 Future Enhancements

- Online Payment Gateway
- Email Notifications
- Restaurant Search
- Order Tracking
- Customer Reviews & Ratings
- Wishlist
- Offers & Coupons
- Analytics Dashboard
- Image Upload Support
- Password Encryption
- Responsive Mobile Design

---

# 🎯 Learning Outcomes

This project demonstrates

- Java Servlets
- JSP
- JDBC
- MVC Architecture
- Session Management
- CRUD Operations
- MySQL Integration
- Admin Dashboard Development
- Authentication & Authorization

---

# 👨‍💻 Author

**Kishore S**

Bachelor of Engineering (Information Science & Engineering)

The Oxford College of Engineering

---

# 📄 License

This project is developed for educational purposes.
