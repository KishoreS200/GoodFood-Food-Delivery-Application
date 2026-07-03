package com.food.model;

public class OrderItem {
	private int orderItem;
	private int orderId;
	private int menuId;
	private int quantity;
	private double itemTotal;
	
	public OrderItem() {
		super();
	}
	
	public OrderItem(int orderItem, int orderId, int menuId, int quantity, double itemTotal) {
		super();
		this.orderItem = orderItem;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
	}
	public int getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(int orderItem) {
		this.orderItem = orderItem;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(double itemTotal) {
		this.itemTotal = itemTotal;
	}
	
	@Override
	public String toString() {
		return "OrderItem [orderItem=" + orderItem + ", orderId=" + orderId + ", menuId=" + menuId + ", quantity="
				+ quantity + ", itemTotal=" + itemTotal + "]";
	}
}
