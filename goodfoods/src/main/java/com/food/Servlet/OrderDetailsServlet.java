package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAO.OrderItemDAO;
import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.model.OrderItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("orderId");

        if (id == null || id.isEmpty()) {
            resp.sendRedirect("MyOrdersServlet");
            return;
        }

        int orderId = Integer.parseInt(id);

        OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

        List<OrderItem> orderItems =
                orderItemDAO.getOrderByOrderId(orderId);

        req.setAttribute("orderItems", orderItems);

        RequestDispatcher rd =
                req.getRequestDispatcher("orderDetails.jsp");

        rd.forward(req, resp);
    }
}