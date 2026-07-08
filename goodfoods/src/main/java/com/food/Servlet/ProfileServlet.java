package com.food.Servlet;

import java.io.IOException;

import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedInUser");

		if (user == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		req.setAttribute("user", user);

		req.getRequestDispatcher("profile.jsp").forward(req, resp);
	}
}
