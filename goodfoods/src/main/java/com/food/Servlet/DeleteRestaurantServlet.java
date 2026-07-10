package com.food.Servlet;

import java.io.IOException;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteRestaurantServlet")
public class DeleteRestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		String id = req.getParameter("restaurantId");

		if (id == null || id.isEmpty()) {
			resp.sendRedirect("RestaurantManagementServlet");
			return;
		}

		int restaurantId = Integer.parseInt(id);

		RestaurantDAOImpl dao = new RestaurantDAOImpl();

		dao.deleteRestaurant(restaurantId);

		resp.sendRedirect("RestaurantManagementServlet");
	}
}