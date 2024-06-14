package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.model.CartItem;
import com.mycompany.ecommerce.model.Item;
import com.mycompany.ecommerce.model.Order;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");

    public ProductDAO(){
        super();
    }
    public List<Item> getAllProducts() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TypedQuery<Item> query = entityManager.createQuery("SELECT i FROM Item i", Item.class);
        List<Item> item = query.getResultList();
        entityManager.close();
        return item;
    }

    public Item getSingleProduct(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Item product = entityManager.find(Item.class, id);
        entityManager.close();
        return product;
    }

    public double getTotalCartPrice(List<CartItem> cartList) {
        double sum = 0;
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        for (CartItem item : cartList) {
            Item item1 = entityManager.find(Item.class, item.getItem_id());
            if (item1 != null) {
                sum += item1.getPrice();
            }
        }
        entityManager.close();
        return sum;
    }

    public List<CartItem> getCartProducts(List<CartItem> cartList) {
        List<CartItem> carts = new ArrayList<>();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        for (CartItem item : cartList) {
            Item item1 = entityManager.find(Item.class, item.getItem_id());
            if (item1 != null) {
                CartItem cart = new CartItem();
                cart.setItem_id(item1.getItem_id());
                cart.setItem_name(item1.getItem_name());
                cart.setPrice(item1.getPrice());
                carts.add(cart);
            }
        }
        entityManager.close();
        return carts;
    }


}



