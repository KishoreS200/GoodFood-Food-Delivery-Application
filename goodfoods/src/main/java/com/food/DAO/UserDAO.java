package com.food.DAO;

import java.sql.SQLException;
import java.util.List;

import com.food.model.User;

public interface UserDAO {
	void addUser(User u);
	void updateUser(User u);
	void deleteUser(int userId);
	User getUser(int userId);
	List<User> getAllUser();
}
