package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.model.Menu;
import com.food.utility.DBConnection;


public class MenuDAOImpl implements MenuDAO{
	private static final String INSERT_QUERY =
			"INSERT INTO menu(restaurantId,itemName,description,price,isAvailable,category,image,createdAt,updatedAt,deletedAt) VALUES(?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_MENU_BY_RESTID = "SELECT * FROM menu WHERE restaurantId=?";
	private static final String GET_MENU_BY_CATEGORY = "SELECT * FROM menu WHERE category=?";
	private static final String GET_ALL_QUERY = "SELECT * FROM menu";
	private static final String UPDATE_QUERY =
			"UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=?, category=?, image=?, updatedAt=?, deletedAt=? WHERE menuId=?";
	private static final String DELETE_QUERY ="UPDATE menu SET deletedAt=? WHERE menuId=?";
	private static final String GET_QUERY = "SELECT * FROM menu WHERE menuId=?";
	private Connection con=null;
	@Override
	public void addMenu(Menu m) {
		con = DBConnection.getConnection();
        try {
            PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

            pstmt.setInt(1, m.getRestaurantId());
            pstmt.setString(2, m.getItemName());
            pstmt.setString(3, m.getDescription());
            pstmt.setDouble(4, m.getPrice());
            pstmt.setByte(5, m.getIsAvailable());
            pstmt.setString(6, m.getCategory());
            pstmt.setString(7, m.getImage());
            pstmt.setTimestamp(8, m.getCreatedAt());
            pstmt.setTimestamp(9, m.getUpdatedAt());
            pstmt.setTimestamp(10, m.getDeletedAt());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


	@Override
	public void updateMenu(Menu m) {
		 con = DBConnection.getConnection();

	        PreparedStatement pstmt;
			try {
				pstmt = con.prepareStatement(UPDATE_QUERY);
				
		        pstmt.setInt(1, m.getRestaurantId());
		        pstmt.setString(2, m.getItemName());
		        pstmt.setString(3, m.getDescription());
		        pstmt.setDouble(4, m.getPrice());
		        pstmt.setByte(5, m.getIsAvailable());
		        pstmt.setString(6, m.getCategory());
		        pstmt.setString(7, m.getImage());
		        pstmt.setTimestamp(8, m.getUpdatedAt());
		        pstmt.setTimestamp(9, m.getDeletedAt());
		        pstmt.setInt(10, m.getMenuId());

		        pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    } 

	@Override
	public void deleteMenu(int menuId) {
		con=DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			
			pstmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(2, menuId);
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {

	    con = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = con.prepareStatement(GET_QUERY);

	        pstmt.setInt(1, menuId);

	        ResultSet res = pstmt.executeQuery();

	        if (res.next()) {
	            return getMenuByResultSet(res);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
	}
	
	@Override
	public List<Menu> getAllMenu() {
	    List<Menu> list = new ArrayList<>();

	    con = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = con.prepareStatement(GET_ALL_QUERY);

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {
	            list.add(getMenuByResultSet(res));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	@Override
	public List<Menu> getMenusByRestaurantId(int restaurantId) {
		con = DBConnection.getConnection();
	    List<Menu> list = new ArrayList<>();

	    try {
	        PreparedStatement pstmt = con.prepareStatement(GET_MENU_BY_RESTID);

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {
	            list.add(getMenuByResultSet(res));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
}

	@Override
	public List<Menu> getMenusByCategory(String category) {

	    List<Menu> list = new ArrayList<>();

	    con = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = con.prepareStatement(GET_MENU_BY_CATEGORY);

	        pstmt.setString(1, category);

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {
	            list.add(getMenuByResultSet(res));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	private Menu getMenuByResultSet(ResultSet res) throws SQLException {
		    int menuId = res.getInt("menuId");
		    int restaurantId = res.getInt("restaurantId");
		    String itemName = res.getString("itemName");
		    String description = res.getString("description");
		    double price = res.getDouble("price");
		    byte isAvailable = res.getByte("isAvailable");
		    String category = res.getString("category");
		    String image = res.getString("image");		    
		    Timestamp createdAt = res.getTimestamp("createdAt");
		    Timestamp updatedAt = res.getTimestamp("updatedAt");
		    Timestamp deletedAt = res.getTimestamp("deletedAt");

		    Menu m = new Menu(menuId, restaurantId, itemName, description, price, isAvailable, category, image, createdAt, updatedAt, deletedAt);
		    return m;
		}
	}