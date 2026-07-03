package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.UserDAO;
import com.food.model.User;
import com.food.utility.DBConnection;

public class UserDAOImpl implements UserDAO{
	
	public static final String INSERT_QUERY="INSERT INTO user (userName, email, "
			+ "password, address, role, lastLogged) VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_QUERY = "UPDATE user SET userName=?, email=?, password=?, "
			+ "address=?, lastLogged=? WHERE userId=?";
	private static final String GET_QUERY="SELECT * FROM user WHERE userId=?";
	private static final String DELETE_QUERY="DELETE FROM user WHERE userId=?";
	private static final String GET_ALL_QUERY ="SELECT * FROM user";
	
	private static final String LOGIN_QUERY = "SELECT * FROM user WHERE email=? AND password=?";
	@Override
	public void addUser(User u) {
		Connection con=DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt=con.prepareStatement(INSERT_QUERY);
			
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUser(User u){
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getAddress());
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(6,u.getUserId());
			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteUser(int userId) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, userId);
			int i = pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(int userId) {
		Connection con=DBConnection.getConnection();
		User u=null;
		try {
			PreparedStatement pstmt = con.prepareStatement(GET_QUERY);
			pstmt.setInt(1, userId);
			
			ResultSet res = pstmt.executeQuery();
			
			while(res.next())
			{
				int id = res.getInt("userId");
				String name = res.getString("userName");
				String email = res.getString("email");
				String password = res.getString("password");
				String address = res.getString("address");
				String role = res.getString("role");
				Timestamp currentDate=res.getTimestamp("createdDate");
				Timestamp lastLogged = res.getTimestamp("lastLogged");
				
				u=new User(id, name, email, password, address, role, currentDate, lastLogged);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public List<User> getAllUser() {
		Connection con = DBConnection.getConnection();
		List<User> list = new ArrayList<>();
		try {
			Statement stmt = con.createStatement();
			
			ResultSet res = stmt.executeQuery(GET_ALL_QUERY);
			while(res.next())
			{
				User u1=getUserAllFromResultSet(res);
				list.add(u1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public User login(String email, String password) {

	    Connection con = DBConnection.getConnection();

	    User user = null;

	    try {

	        PreparedStatement pstmt =
	                con.prepareStatement(LOGIN_QUERY);

	        pstmt.setString(1, email);
	        pstmt.setString(2, password);

	        ResultSet res = pstmt.executeQuery();

	        if (res.next()) {

	            user = getUserAllFromResultSet(res);

	        }

	    }
	    catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return user;
	}
	
	public static User getUserAllFromResultSet(ResultSet res) throws SQLException
	{
		int id = res.getInt("userId");
		String name = res.getString("userName");
		String email = res.getString("email");
		String password = res.getString("password");
		String address = res.getString("address");
		String role = res.getString("role");
		Timestamp currentDate=res.getTimestamp("createdDate");
		Timestamp lastLogged = res.getTimestamp("lastLogged");
		
		User u=new User(id, name, email, password, address, role, currentDate, lastLogged);
		return u;
	}
}