package com.food.Servlet;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/RestaurantManagementServlet")
public class RestaurantManagementServlet extends HttpServlet {

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

		List<Restaurant> restaurantList = restaurantDAO.getAllRestaurant();

		req.setAttribute("restaurantList", restaurantList);

		req.getRequestDispatcher("restaurantManagement.jsp")
				.forward(req, resp);
	}
}