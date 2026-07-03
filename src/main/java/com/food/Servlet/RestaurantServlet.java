package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDAOImpl restaurantDAOImpl=new RestaurantDAOImpl();
		List<Restaurant> allRestaurant = restaurantDAOImpl.getAllRestaurant();
		System.out.println(allRestaurant);
		System.out.println("Restaurant Count = " + allRestaurant.size());
		
		req.setAttribute("allRestaurants", allRestaurant);
		RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");
		rd.forward(req, resp);
	}
}
