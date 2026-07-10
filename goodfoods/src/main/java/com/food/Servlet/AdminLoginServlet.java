package com.food.Servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDAOImpl dao = new UserDAOImpl();

		User user = dao.getUserByEmail(email);

		if (user != null && user.getRole().equals("superAdmin") && BCrypt.checkpw(password, user.getPassword())) {

			HttpSession session = req.getSession();

			session.setAttribute("admin", user);

			resp.sendRedirect("AdminDashboardServlet");

		} else {

			req.setAttribute("error", "Invalid Admin Credentials");

			req.getRequestDispatcher("adminLogin.jsp").forward(req, resp);
		}

	}

}