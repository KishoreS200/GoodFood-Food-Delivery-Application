package com.food.DAO;

import java.util.List;

import com.food.model.Restaurant;

public interface RestaurantDAO {
	void addRestaurant(Restaurant res);
	void updateRestaurant(Restaurant res);
	void deleteRestaurant(int restaurantId);
	Restaurant getRestaurant(int resrestaurantId);
	List<Restaurant> getAllRestaurant();

}
