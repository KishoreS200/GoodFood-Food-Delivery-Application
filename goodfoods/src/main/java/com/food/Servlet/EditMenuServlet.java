package com.food.Servlet;

import java.io.IOException;

import com.food.DAO.MenuDAO;
import com.food.DAO.RestaurantDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Menu;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditMenuServlet")
public class EditMenuServlet extends HttpServlet {

	private MenuDAO menuDAO = new MenuDAOImpl();
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

		String id = req.getParameter("menuId");

		if (id == null || id.isEmpty()) {
			resp.sendRedirect("MenuManagementServlet");
			return;
		}

		int menuId = Integer.parseInt(id);

		Menu menu = menuDAO.getMenu(menuId);

		if (menu == null) {
			resp.sendRedirect("MenuManagementServlet");
			return;
		}

		req.setAttribute("menu", menu);

		req.setAttribute("restaurantList", restaurantDAO.getAllRestaurant());

		req.getRequestDispatcher("editMenu.jsp").forward(req, resp);
	}
}