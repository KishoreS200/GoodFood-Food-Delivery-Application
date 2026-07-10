package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	private static final String INSERT_QUERY = "INSERT INTO restaurant(name, cuisineType, deliveryTime, address, adminUserId, isActive, image) VALUES (?,?,?,?,?,?,?)";
	private static final String UPDATE_QUERY = "UPDATE restaurant SET name=?, cuisineType=?, deliveryTime=?, address=?, adminUserId=?, rating=?, isActive=?, image=? WHERE restaurantId=?";
	private static final String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurantId=?";
	private static final String GET_QUERY = "SELECT * FROM restaurant WHERE restaurantId=?";
	private static final String GET_ALL_QUERY = "SELECT * FROM restaurant";
	private static final String COUNT_QUERY = "SELECT COUNT(*) FROM restaurant";
	private static Connection con;

	@Override
	public void addRestaurant(Restaurant res) {
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, res.getName());
			pstmt.setString(2, res.getCuisineType());
			pstmt.setInt(3, res.getDeliveryTime());
			pstmt.setString(4, res.getAddress());
			pstmt.setInt(5, res.getAdminUserId());
			pstmt.setDouble(6, res.getRating());
			pstmt.setByte(7, res.getIsActive());
			pstmt.setString(8, res.getImage());
			pstmt.setInt(9, res.getRestaurantId());

			int rows = pstmt.executeUpdate();

			System.out.println("Rows Updated = " + rows);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateRestaurant(Restaurant res) {
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1, res.getName());
			pstmt.setString(2, res.getCuisineType());
			pstmt.setInt(3, res.getDeliveryTime());
			pstmt.setString(4, res.getAddress());
			pstmt.setInt(5, res.getAdminUserId());
			pstmt.setDouble(6, res.getRating());
			pstmt.setByte(7, res.getIsActive());
			pstmt.setString(8, res.getImage());

			pstmt.setInt(9, res.getRestaurantId());

			int rows = pstmt.executeUpdate();
			System.out.println("Rows Updated = " + rows);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int res_id) {
		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, res_id);

			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		con = DBConnection.getConnection();
		Restaurant r = null;
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY);
			pstmt.setInt(1, restaurantId);

			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				int id = result.getInt("restaurantId");
				String name = result.getString("name");
				String cuisineType = result.getString("cuisineType");
				int deliveryTime = result.getInt("deliveryTime");
				String address = result.getString("address");
				int adminUserId = result.getInt("adminUserId");
				double rating = result.getDouble("rating");
				byte isActive = result.getByte("isActive");
				String image = result.getString("image");

				r = new Restaurant(id, name, cuisineType, deliveryTime, address, adminUserId, rating, isActive, image);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	@Override
	public List<Restaurant> getAllRestaurant() {

		con = DBConnection.getConnection();
		List<Restaurant> list = new ArrayList<>();

		try {

			System.out.println("Connected DB: " + con.getCatalog());

			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(GET_ALL_QUERY);

			while (result.next()) {

				System.out.println("Found: " + result.getInt("restaurantId") + " " + result.getString("name"));

				Restaurant res = getAllRestarantByResultSet(result);
				list.add(res);
			}

			System.out.println("Final Size = " + list.size());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static Restaurant getAllRestarantByResultSet(ResultSet result) throws SQLException {
		int id = result.getInt("restaurantId");
		String name = result.getString("name");
		String cuisineType = result.getString("cuisineType");
		int deliveryTime = result.getInt("deliveryTime");
		String address = result.getString("address");
		int adminUserId = result.getInt("adminUserId");
		double rating = result.getDouble("rating");
		byte isActive = result.getByte("isActive");
		String image = result.getString("image");

		Restaurant res = new Restaurant(id, name, cuisineType, deliveryTime, address, adminUserId, rating, isActive,
				image);
		return res;
	}
	@Override
	public int getRestaurantCount() {

	    int count = 0;

	    Connection con = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = con.prepareStatement(COUNT_QUERY);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return count;
	}
}