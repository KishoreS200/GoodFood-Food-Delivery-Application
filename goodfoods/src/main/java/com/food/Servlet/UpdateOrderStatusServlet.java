package com.food.Servlet;

import java.io.IOException;

import com.food.DAO.OrderTableDAO;
import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

	private OrderTableDAO orderDAO = new OrderTableDAOImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		int orderId = Integer.parseInt(req.getParameter("orderId"));
		String status = req.getParameter("status");

		orderDAO.updateOrderStatus(orderId, status);

		resp.sendRedirect("OrderManagementServlet");
	}
}