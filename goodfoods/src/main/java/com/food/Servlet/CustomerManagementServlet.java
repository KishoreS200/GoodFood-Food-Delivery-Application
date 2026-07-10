package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAO.UserDAO;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerManagementServlet")
public class CustomerManagementServlet extends HttpServlet {

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

        List<User> customers = userDAO.getAllUsers();

        req.setAttribute("customers", customers);

        req.getRequestDispatcher("customerManagement.jsp").forward(req, resp);
    }
}