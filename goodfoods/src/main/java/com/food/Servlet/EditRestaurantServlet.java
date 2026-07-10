package com.food.Servlet;

import java.io.IOException;

import com.food.DAO.RestaurantDAO;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditRestaurantServlet")
public class EditRestaurantServlet extends HttpServlet {

	private RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

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

		Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);

		if (restaurant == null) {
			resp.sendRedirect("RestaurantManagementServlet");
			return;
		}

		req.setAttribute("restaurant", restaurant);

		req.getRequestDispatcher("editRestaurant.jsp")
				.forward(req, resp);
	}
}