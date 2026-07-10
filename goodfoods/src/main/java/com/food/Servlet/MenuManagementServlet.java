package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Menu;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MenuManagementServlet")
public class MenuManagementServlet extends HttpServlet {

	private MenuDAO menuDAO = new MenuDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		List<Menu> menuList = menuDAO.getAllMenu();

		req.setAttribute("menuList", menuList);

		req.getRequestDispatcher("menuManagement.jsp").forward(req, resp);
	}
}