package com.food.DAO;

import java.util.List;

import com.food.model.OrderTable;

public interface OrderTableDAO {
	int addOrder(OrderTable order);
	OrderTable getOrder(int orderId);
	List<OrderTable> getAllOrder();
	void updateOrder(OrderTable order);
	List<OrderTable> getOrderByUserId(int userId);
	List<OrderTable> getOrderByRestaurantId(int restaurantId);
	void deleteOrder(int orderId);
	List<OrderTable> getOrderByStatus(String status);
}
