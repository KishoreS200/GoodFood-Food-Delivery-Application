package com.food.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    // Add item
    public void addItem(CartItem item) {

        if (items.containsKey(item.getMenuId())) {

            CartItem existingItem = items.get(item.getMenuId());

            existingItem.setQuantity(
                    existingItem.getQuantity() + item.getQuantity());

        } else {

            items.put(item.getMenuId(), item);

        }
    }

    // Update quantity
    public void updateItem(int menuId, int quantity) {

        if (items.containsKey(menuId)) {

            items.get(menuId).setQuantity(quantity);

        }

    }

    // Remove item
    public void removeItem(int menuId) {

        items.remove(menuId);

    }

    // Clear cart
    public void clearCart() {

        items.clear();

    }
    
    public CartItem getItem(int menuId) {

        return items.get(menuId);

    }

    // Grand total
    public float getGrandTotal() {

        float total = 0;

        for (CartItem item : items.values()) {

            total += item.getItemTotal();

        }

        return total;
    }
}