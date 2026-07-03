package com.food.Servlet;

import java.io.IOException;

import com.food.model.Cart;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckOutServlet")
public class CheckoutServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {

            resp.sendRedirect("login.jsp");

            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {

            req.setAttribute("totalAmount",
                    cart.getGrandTotal());

        }

        req.getRequestDispatcher("checkout.jsp")
           .forward(req, resp);
    }
}
