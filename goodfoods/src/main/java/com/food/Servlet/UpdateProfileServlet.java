package com.food.Servlet;

import java.io.IOException;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedInUser");

		if (user == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		String userName = req.getParameter("userName");
		String address = req.getParameter("address");

		user.setUserName(userName);
		user.setAddress(address);

		UserDAOImpl userDAO = new UserDAOImpl();

		userDAO.updateUser(user);

		session.setAttribute("loggedInUser", user);

		resp.sendRedirect("profile.jsp");
	}
}