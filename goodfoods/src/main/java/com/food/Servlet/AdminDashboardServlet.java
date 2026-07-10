package com.food.Servlet;

import java.io.IOException;

import com.food.DAO.MenuDAO;
import com.food.DAO.OrderTableDAO;
import com.food.DAO.RestaurantDAO;
import com.food.DAO.UserDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

	private RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
	private MenuDAO menuDAO = new MenuDAOImpl();
	private OrderTableDAO orderDAO = new OrderTableDAOImpl();
	private UserDAO userDAO = new UserDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		req.setAttribute("restaurantCount", restaurantDAO.getRestaurantCount());
		req.setAttribute("menuCount", menuDAO.getMenuCount());
		req.setAttribute("orderCount", orderDAO.getOrderCount());
		req.setAttribute("customerCount", userDAO.getCustomerCount());

		req.getRequestDispatcher("adminDashboard.jsp").forward(req, resp);
	}
}