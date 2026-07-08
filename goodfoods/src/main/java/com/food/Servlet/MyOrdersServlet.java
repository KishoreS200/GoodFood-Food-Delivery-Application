package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAO.OrderTableDAO;
import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.model.OrderTable;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyOrdersServlet")
public class MyOrdersServlet extends HttpServlet {

    private OrderTableDAO orderDAO = new OrderTableDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<OrderTable> orders = orderDAO.getOrderByUserId(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("myOrders.jsp").forward(request, response);
    }
}