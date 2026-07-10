package com.food.Servlet;

import java.io.IOException;

import com.food.DAO.UserDAO;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {

	private UserDAO userDAO = new UserDAOImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User admin = (User) session.getAttribute("admin");

		if (admin == null) {
			resp.sendRedirect("adminLogin.jsp");
			return;
		}

		int userId = Integer.parseInt(req.getParameter("userId"));
		String userName = req.getParameter("userName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");

		User customer = new User();

		customer.setUserId(userId);
		customer.setUserName(userName);
		customer.setEmail(email);
		customer.setPassword(password);
		customer.setAddress(address);

		userDAO.updateUser(customer);

		resp.sendRedirect("CustomerManagementServlet");
	}
}