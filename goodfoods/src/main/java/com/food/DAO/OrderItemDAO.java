package com.food.DAO;

import java.util.List;

import com.food.model.OrderItem;

public interface OrderItemDAO {

	void addOrderItem(OrderItem oi);

	OrderItem getOrderItem(int orderItemId);

	List<OrderItem> getAllOrderItem();

	List<OrderItem> getOrderByMenuId(int menuId);

	List<OrderItem> getOrderByOrderId(int orderId);

	void updateOrderItem(OrderItem oi);

	void deleteOrderItem(int orderItemId);
}