package com.food.DAO;

import java.util.List;

import com.food.model.Menu;

public interface MenuDAO {
	void addMenu(Menu m);
	void updateMenu(Menu m);
	void deleteMenu(int menuId);
	Menu getMenu(int menuId);
	List<Menu> getAllMenu();
	List<Menu> getMenusByRestaurantId(int restaurantId);
	List<Menu> getMenusByCategory(String category);
}
