package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderItemDAO;
import com.food.model.OrderItem;
import com.food.model.OrderTable;
import com.food.model.User;
import com.food.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{

	private static final String INSERT_QUERY = "INSERT INTO OrderItem (orderId, menuId, quantity, itemTotal) VALUES (?, ?, ?, ?)";
	private static final String GET_QUERY = "SELECT * FROM orderTable WHERE orderItem = ?";
	private static final String GET_QUERY_BY_MENUID = "SELECT * FROM orderTable WHERE menuId = ?";
	private static final String GET_QUERY_BY_ORDERID = "SELECT * FROM orderTable WHERE orderId = ?";
	private static final String DELETE_QUERY =  "DELETE FROM orderTable WHERE orderItem=?";
	private static final String UPDATE_QUERY = "SELECT orderItem SET orderId=?, menuId=?, quantity=?, itemTotal=?"
			+"WHERE orderItem=?";
	private Connection con;

	@Override
	public void addOrderItem(OrderItem oi) {
		con = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);
			pstmt.setInt(1, oi.getOrderId());
			pstmt.setInt(2, oi.getMenuId());
			pstmt.setInt(3, oi.getQuantity());
			pstmt.setDouble(4, oi.getItemTotal());
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public OrderItem getOrderItem(int orderItem) {
		OrderItem ot=null;
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY);
			
			pstmt.setInt(1, orderItem);
			
			ResultSet res = pstmt.executeQuery();
			while(res.next())
			{
				int id=res.getInt("orderItem");
				int orderId=res.getInt("orderId");
				int menuId=res.getInt("menuId");
				int quantity=res.getInt("quantity");
				Double itemTotal=res.getDouble("itemTotal");
				
			    ot=new OrderItem(id,orderId,menuId,quantity,itemTotal);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ot;
	}

	@Override
	public List<OrderItem> getAllOrderItem() {
		Connection con = DBConnection.getConnection();
		List<OrderItem> list = new ArrayList<>();
		try {
			Statement stmt = con.createStatement();
			
			ResultSet res = stmt.executeQuery(GET_QUERY);
			while(res.next())
			{
				OrderItem oi=getOrderItemsAllFromResultSet(res);
				list.add(oi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}

	@Override
	public List<OrderItem> getOrderByMenuId(int menuId) {
		con = DBConnection.getConnection();
		List<OrderItem> menu = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY_BY_MENUID);
			pstmt.setInt(1, menuId);
			
			ResultSet res = pstmt.executeQuery();
			while(res.next())
			{
				menu.add(getOrderItemsAllFromResultSet(res));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public List<OrderItem> getOrderByOrderId(int orderId) {
		con = DBConnection.getConnection();
		List<OrderItem> id = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY_BY_ORDERID);
			pstmt.setInt(1, orderId);
			
			ResultSet res = pstmt.executeQuery();
			while(res.next())
			{
				id.add(getOrderItemsAllFromResultSet(res));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateOrderItem(OrderItem oi) {
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, oi.getOrderId());
			pstmt.setInt(2, oi.getMenuId());
			pstmt.setInt(3, oi.getQuantity());
			pstmt.setDouble(4, oi.getItemTotal());

			pstmt.setInt(5, oi.getOrderItem());
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItem) {
		con=DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, orderItem);
			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}
	
	public static OrderItem getOrderItemsAllFromResultSet(ResultSet res) throws SQLException
	{
		int orderItem = res.getInt("orderItem");
		int orderId = res.getInt("orderId");
		int menuId = res.getInt("menuId");
		int quantity = res.getInt("quantity");
		double itemTotal = res.getDouble("itemTotal");
		
		OrderItem oi=new OrderItem(orderItem, orderId, menuId, quantity, itemTotal);
		return oi;
	}

}
