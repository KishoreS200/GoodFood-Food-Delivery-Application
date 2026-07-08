package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderTableDAO;
import com.food.model.OrderTable;
import com.food.utility.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO {

	private static final String INSERT_QUERY = "INSERT INTO ordertable(userId, restaurantId, orderDate, totalAmount, status, paymentMethod, deliveryAddress) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_QUERY = "SELECT * FROM ordertable WHERE orderId = ?";
	private static final String GET_ALL_QUERY = "SELECT * FROM orderTable";
	private static final String UPDATE_QUERY = "UPDATE ordertable SET userId=?, restaurantId=?, orderDate=?, totalAmount=?, status=?, paymentMethod=?, deliveryAddress=?"
			+ "WHERE orderId=?";
	private static final String GET_QUERY_BY_USERID = "SELECT * FROM ordertable WHERE userId = ? ORDER BY orderDate DESC";
	private static final String GET_QUERY_BY_RESID = "SELECT * FROM ordertable WHERE restaurantId = ?";
	private static final String DELETE_QUERY = "DELETE FROM ordertable WHERE orderId=?";
	private static final String GET_QUERY_BY_STATUS = "SELECT * FROM ordertable WHERE status = ?";
	private static Connection con = null;

	@Override
	public int addOrder(OrderTable order) {

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setTimestamp(3, order.getOrderDate());
			pstmt.setDouble(4, order.getTotalAmount());
			pstmt.setString(5, order.getStatus());
			pstmt.setString(6, order.getPaymentMethod());
			pstmt.setString(7, order.getDeliveryAddress());

			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();

			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public OrderTable getOrder(int orderId) {
		OrderTable ot = null;
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY);

			pstmt.setInt(1, orderId);

			ResultSet res = pstmt.executeQuery();
			while (res.next()) {
				int id = res.getInt("orderId");
				int userId = res.getInt("userId");
				int restaurantId = res.getInt("restaurantId");
				Timestamp orderDate = res.getTimestamp("orderDate");
				Double totalAmount = res.getDouble("totalAmount");
				String status = res.getString("status");
				String payment = res.getString("paymentMethod");
				String deliveryAddress = res.getString("deliveryAddress");

				ot = new OrderTable(id, userId, restaurantId, orderDate, totalAmount, status, payment, deliveryAddress);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ot;
	}

	@Override
	public List<OrderTable> getAllOrder() {
		con = DBConnection.getConnection();
		List<OrderTable> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_ALL_QUERY);

			ResultSet res = pstmt.executeQuery();
			while (res.next()) {
				OrderTable ot = getAllOrdersByResultSet(res);
				list.add(ot);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOrder(OrderTable order) {
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setTimestamp(3, order.getOrderDate());
			pstmt.setDouble(4, order.getTotalAmount());
			pstmt.setString(5, order.getStatus());
			pstmt.setString(6, order.getPaymentMethod());
			pstmt.setString(7, order.getDeliveryAddress());

			pstmt.setInt(8, order.getOrderId());

			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderTable> getOrderByUserId(int userId) {
		con = DBConnection.getConnection();
		List<OrderTable> orders = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY_BY_USERID);
			pstmt.setInt(1, userId);

			ResultSet res = pstmt.executeQuery();
			while (res.next()) {
				orders.add(getAllOrdersByResultSet(res));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public List<OrderTable> getOrderByRestaurantId(int restaurantId) {
		con = DBConnection.getConnection();
		List<OrderTable> orders = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY_BY_RESID);
			pstmt.setInt(1, restaurantId);

			ResultSet res = pstmt.executeQuery();
			while (res.next()) {
				orders.add(getAllOrdersByResultSet(res));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public void deleteOrder(int orderId) {
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, orderId);
			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderTable> getOrderByStatus(String status) {
		List<OrderTable> orders = new ArrayList<>();
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY_BY_STATUS);
			pstmt.setString(1, status);

			ResultSet res = pstmt.executeQuery();
			while (res.next()) {
				orders.add(getAllOrdersByResultSet(res));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	public static OrderTable getAllOrdersByResultSet(ResultSet res) throws SQLException {
		int id = res.getInt("orderId");
		int userId = res.getInt("userId");
		int restaurantId = res.getInt("restaurantId");
		Timestamp orderDate = res.getTimestamp("orderDate");
		Double totalAmount = res.getDouble("totalAmount");
		String status = res.getString("status");
		String payment = res.getString("paymentMethod");
		String deliveryAddress = res.getString("deliveryAddress");

		OrderTable oi = new OrderTable(id, userId, restaurantId, orderDate, totalAmount, status, payment,
				deliveryAddress);
		return oi;
	}

}
