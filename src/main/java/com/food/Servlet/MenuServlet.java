package com.food.Servlet;

import java.io.IOException;

import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	 private MenuDAO menuDAO = new MenuDAOImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
	        String id =req.getParameter("restaurantId");
	        if (id == null || id.isEmpty()) {
	            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Restaurant ID is required");
	            return;
	        }
	       

	        int restaurantId = Integer.parseInt(id);
	        List<Menu> menuList = menuDAO.getMenusByRestaurantId(restaurantId);
	        System.out.println(menuList);
	        req.setAttribute("menuList", menuList);
	        HttpSession session = req.getSession();
	        session.setAttribute("restaurantId", restaurantId);
	        System.out.println("Restaurant ID = " + req.getParameter("restaurantId"));
	        RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
	        rd.forward(req, resp);     
	}
}
