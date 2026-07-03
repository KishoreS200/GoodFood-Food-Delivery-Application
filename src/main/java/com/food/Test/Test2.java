package com.food.Test;

import java.util.Scanner;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

public class Test2 {

	public static void main(String[] args) {
		//ADD Restaurant
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter the Name");
		String name = scan.nextLine();
		System.out.println("Enter the Type");
		String type = scan.nextLine();
		System.out.println("Enter the Time");
		int time = scan.nextInt();
		scan.nextLine();
		System.out.println("Enter the Address");
		String address = scan.nextLine();
		System.out.println("Enter the adminid");
		int adminId = scan.nextInt();
		System.out.println("Is it active");
		byte active = scan.nextByte();
		
		Restaurant res = new Restaurant(name,type,time,address,adminId,active);
		RestaurantDAOImpl rdi = new RestaurantDAOImpl();
		rdi.addRestaurant(res);
		
		System.out.print("Restaurant Created");

	}

}
