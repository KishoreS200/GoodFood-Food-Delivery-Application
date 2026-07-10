package com.food.Servlet;

import java.io.IOException;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddRestaurantServlet")
public class AddRestaurantServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		String name = req.getParameter("restaurantName");
		String cuisineType = req.getParameter("cuisineType");
		String address = req.getParameter("address");
		int deliveryTime = Integer.parseInt(req.getParameter("deliveryTime"));
		double rating = Double.parseDouble(req.getParameter("rating"));
		byte isActive = Byte.parseByte(req.getParameter("isActive"));
		String image = req.getParameter("image");

		Restaurant restaurant = new Restaurant();

		restaurant.setName(name);
		restaurant.setCuisineType(cuisineType);
		restaurant.setAddress(address);
		restaurant.setDeliveryTime(deliveryTime);
		restaurant.setRating(rating);
		restaurant.setIsActive(isActive);
		restaurant.setAdminUserId(admin.getUserId());
		restaurant.setImage(image);

		RestaurantDAOImpl dao = new RestaurantDAOImpl();

		dao.addRestaurant(restaurant);

		resp.sendRedirect("RestaurantManagementServlet");
	}
}