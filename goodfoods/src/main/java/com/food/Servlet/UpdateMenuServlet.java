package com.food.Servlet;

import java.io.IOException;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Menu;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateMenuServlet")
public class UpdateMenuServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		String itemName = req.getParameter("itemName");
		String description = req.getParameter("description");
		double price = Double.parseDouble(req.getParameter("price"));
		String category = req.getParameter("category");
		byte isAvailable = Byte.parseByte(req.getParameter("isAvailable"));
		String image = req.getParameter("image");

		Menu menu = new Menu();

		menu.setMenuId(menuId);
		menu.setRestaurantId(restaurantId);
		menu.setItemName(itemName);
		menu.setDescription(description);
		menu.setPrice(price);
		menu.setCategory(category);
		menu.setIsAvailable(isAvailable);
		menu.setImage(image);

		MenuDAOImpl dao = new MenuDAOImpl();

		dao.updateMenu(menu);

		resp.sendRedirect("MenuManagementServlet");
	}
}