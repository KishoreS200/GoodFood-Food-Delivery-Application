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

@WebServlet("/OrderManagementServlet")
public class OrderManagementServlet extends HttpServlet {

	private OrderTableDAO orderDAO = new OrderTableDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		List<OrderTable> orders = orderDAO.getAllOrder();

		req.setAttribute("orders", orders);

		req.getRequestDispatcher("orderManagement.jsp").forward(req, resp);
	}
}