package com.food.model;

public class Restaurant {
	private int restaurantId;
	private String name;
	private String cuisineType;
	private int deliveryTime;
	private String address;
	private int adminUserId;
	private double rating;
	private Byte isActive;
	private String image;
	
	
	public Restaurant() {
		super();
	}


	public Restaurant(String name, String cuisineType, int deliveryTime, String address, int adminUserId,
			Byte isActive, String image) {
		super();
		this.name = name;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.adminUserId = adminUserId;
		this.isActive = isActive;
		this.image=image;
	}


	public Restaurant(int restaurantId, String name, String cuisineType, int deliveryTime, String address,
			int adminUserId, double rating, Byte isActive, String image) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
		this.image=image;
	}


	public int getRestaurantId() {
		return restaurantId;
	}


	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCuisineType() {
		return cuisineType;
	}


	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}


	public int getDeliveryTime() {
		return deliveryTime;
	}


	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getAdminUserId() {
		return adminUserId;
	}


	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}


	public double getRating() {
		return rating;
	}


	public void setRating(double rating) {
		this.rating = rating;
	}


	public Byte getIsActive() {
		return isActive;
	}


	public void setIsActive(Byte isActive) {
		this.isActive = isActive;
	}
	
	public String getImage() {
	    return image;
	}

	public void setImage(String image) {
	    this.image = image;
	}


	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", name=" + name + ", cuisineType=" + cuisineType
				+ ", deliveryTime=" + deliveryTime + ", address=" + address + ", adminUserId=" + adminUserId
				+ ", rating=" + rating + ", isActive=" + isActive + ", image=" + image + "]";
	}
	
}