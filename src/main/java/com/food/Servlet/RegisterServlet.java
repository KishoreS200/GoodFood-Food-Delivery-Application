package com.food.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String cpassword = req.getParameter("confirmPassword");
        
        if(!password.equals(cpassword))
        {
        	PrintWriter out = resp.getWriter();
        	out.println("Password does not match");
        	return;
        }
        
        User user = new User();
        user.setUserName(userName);
        user.setEmail(email);
        user.setAddress(address);
        user.setPassword(password);
        user.setPassword(cpassword);
        
        UserDAOImpl userDAOImpl = new UserDAOImpl();
        userDAOImpl.addUser(user);   
        
        resp.sendRedirect("login.jsp");
	}

}
