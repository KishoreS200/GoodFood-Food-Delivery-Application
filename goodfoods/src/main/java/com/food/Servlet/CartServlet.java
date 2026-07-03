package com.food.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.food.DAO.MenuDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Cart cart = (Cart) session.getAttribute("cart");

		if (cart == null) {
			cart = new Cart();
		}

		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		String action = req.getParameter("action");

		if ("add".equals(action)) {

			int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));

			if (restaurantId == null || !restaurantId.equals(newRestaurantId)) {

				cart = new Cart();

				session.setAttribute("restaurantId", newRestaurantId);
			}

			addItemToCart(req, cart);

		} else if ("update".equals(action)) {

			updateItem(req, cart);

		} else if ("remove".equals(action)) {

			removeItemFromCart(req, cart);

		}

		session.setAttribute("cart", cart);

		resp.sendRedirect("CartServlet");
	}
    
    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {

            req.setAttribute(
                "cartItems",
                new ArrayList<>(cart.getItems().values()));

        }

        req.getRequestDispatcher("cart.jsp")
           .forward(req, resp);
    }
	private void removeItemFromCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));

	    cart.removeItem(menuId);
	}

	private void updateItem(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
	    int quantity = Integer.parseInt(req.getParameter("quantity"));

	    cart.updateItem(menuId, quantity);
		
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
	    int quantity = Integer.parseInt(req.getParameter("quantity"));

	    MenuDAO menuDAO = new MenuDAOImpl();
	    Menu menu = menuDAO.getMenu(menuId);

	    CartItem item = new CartItem();

	    item.setMenuId(menu.getMenuId());
	    item.setRestaurantId(menu.getRestaurantId());
	    item.setName(menu.getItemName());
	    item.setPrice((float) menu.getPrice());
	    item.setQuantity(quantity);

	    cart.addItem(item);
		
	}
}