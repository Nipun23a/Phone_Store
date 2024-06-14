package com.mycompany.ecommerce.model;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    private List<CartItem> items = new ArrayList<>();

   /* public void addItem(Item item) {
        for (CartItem cartItem : items) {
            if (cartItem.getItem().getItem_id() == item.getItem_id()) {
                cartItem.setQuantity(cartItem.getQuantity() + 1);
                return;
            }
        }
        items.add(new CartItem(item));
    }*/

    public List<CartItem> getItems() {
        return items;
    }

    public void addItem(Item item) {

    }

   /* public double getTotalPrice() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getPrice();
        }
        return total;
    }*/
}
