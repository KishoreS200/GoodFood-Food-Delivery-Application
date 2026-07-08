package com.food.Servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAOImpl userDAO = new UserDAOImpl();

        // Fetch user by email
        User user = userDAO.getUserByEmail(email);

        if (user != null && BCrypt.checkpw(password, user.getPassword())) {

            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", user);

            resp.sendRedirect("home.jsp");

        } else {

            req.setAttribute("error", "Invalid Email or Password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}