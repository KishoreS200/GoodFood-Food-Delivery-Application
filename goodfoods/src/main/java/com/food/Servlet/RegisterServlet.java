package com.food.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import org.mindrot.jbcrypt.BCrypt;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {

            resp.setContentType("text/html");

            PrintWriter out = resp.getWriter();

            out.println("<h2 style='color:red'>Passwords do not match!</h2>");

            return;
        }

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        User user = new User();

        user.setUserName(userName);
        user.setEmail(email);
        user.setAddress(address);
        user.setPassword(hashedPassword);

        UserDAOImpl userDAO = new UserDAOImpl();

        userDAO.addUser(user);

        resp.sendRedirect("login.jsp");
    }
}