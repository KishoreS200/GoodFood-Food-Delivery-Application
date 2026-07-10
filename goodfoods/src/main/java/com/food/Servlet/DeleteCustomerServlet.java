package com.food.Servlet;

import java.io.IOException;

import com.food.DAO.UserDAO;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User admin = (User) session.getAttribute("admin");

        if (admin == null) {
            resp.sendRedirect("adminLogin.jsp");
            return;
        }

        String id = req.getParameter("userId");

        if (id == null || id.isEmpty()) {
            resp.sendRedirect("CustomerManagementServlet");
            return;
        }

        int userId = Integer.parseInt(id);

        userDAO.deleteUser(userId);

        resp.sendRedirect("CustomerManagementServlet");
    }
}