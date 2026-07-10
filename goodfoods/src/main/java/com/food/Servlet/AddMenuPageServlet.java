package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddMenuPageServlet")
public class AddMenuPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        RestaurantDAO dao = new RestaurantDAOImpl();

        List<Restaurant> restaurantList = dao.getAllRestaurant();

        req.setAttribute("restaurantList", restaurantList);

        req.getRequestDispatcher("addMenu.jsp").forward(req, resp);
    }
}