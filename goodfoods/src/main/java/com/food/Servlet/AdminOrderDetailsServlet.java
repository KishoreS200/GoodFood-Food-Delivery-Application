package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAO.OrderItemDAO;
import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminOrderDetailsServlet")
public class AdminOrderDetailsServlet extends HttpServlet {

	private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		String id = req.getParameter("orderId");

		if (id == null || id.isEmpty()) {
			resp.sendRedirect("OrderManagementServlet");
			return;
		}

		int orderId = Integer.parseInt(id);

		List<OrderItem> orderItems = orderItemDAO.getOrderByOrderId(orderId);

		req.setAttribute("orderItems", orderItems);

		RequestDispatcher rd = req.getRequestDispatcher("adminOrderDetails.jsp");

		rd.forward(req, resp);
	}
}