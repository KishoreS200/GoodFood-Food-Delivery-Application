package com.food.Servlet;

import java.io.IOException;
import java.sql.Timestamp;

import com.food.DAO.OrderItemDAO;
import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.OrderTable;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedInUser");
		Cart cart = (Cart) session.getAttribute("cart");
		
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		if (user == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		if (cart == null || cart.getItems().isEmpty()) {
			resp.sendRedirect("CartServlet");
			return;
		}

		String address = req.getParameter("address");
		String paymentMethod = req.getParameter("paymentMethod");

		OrderTable order = new OrderTable();

		order.setUserId(user.getUserId());
		order.setRestaurantId(restaurantId);
		order.setTotalAmount(cart.getGrandTotal());
		order.setDeliveryAddress(address);
		order.setPaymentMethod(paymentMethod);
		order.setStatus("Pending");
		order.setOrderDate(new Timestamp(System.currentTimeMillis()));

		OrderTableDAOImpl orderDAO = new OrderTableDAOImpl();

		int orderId = orderDAO.addOrder(order);
		if (orderId <= 0) {
		    throw new RuntimeException("Order creation failed.");
		}


		OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

		for (CartItem item : cart.getItems().values()) {

			OrderItem orderItem = new OrderItem();

			orderItem.setOrderId(orderId);
			orderItem.setMenuId(item.getMenuId());
			orderItem.setQuantity(item.getQuantity());
			orderItem.setItemTotal(item.getItemTotal());

			orderItemDAO.addOrderItem(orderItem);
		}

		cart.clearCart();

		session.removeAttribute("restaurantId");

		resp.sendRedirect("orderConfirmed.jsp");
	}
}