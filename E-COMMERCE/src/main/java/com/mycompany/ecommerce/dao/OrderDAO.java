package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.model.Item;
import com.mycompany.ecommerce.service.ItemService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import java.util.ArrayList;
import java.util.List;
import com.mycompany.ecommerce.model.Order;
import com.mycompany.ecommerce.model.CartItem;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

public class OrderDAO {
    List<String> itemNames = new ArrayList<>();
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public boolean placeOrder(List<CartItem> cartItems, int userId) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        ItemService itemService = new ItemService();

        boolean isOrderPlaced = false;
        int itemID;
        double totalPrice = 0;

        try {
            transaction.begin();
            for (CartItem item : cartItems) {
                itemID = item.getItem_id();
                Item item1=itemService.getItemById(itemID);
                totalPrice+=item1.getPrice();
            }
            for (CartItem item:cartItems) {
                itemID = item.getItem_id();
                Item item1 = itemService.getItemById(itemID);
                itemNames.add(item1.getItem_name());
            }
            String itemNamesString = String.join(", ", itemNames);
            Order order = new Order();
            order.setItemInformation(itemNamesString);
            order.setUser(userId);
            order.setOrderAmount(totalPrice);
            em.persist(order);
            transaction.commit();
            isOrderPlaced = true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }

        return isOrderPlaced;
    }

    public List<Order> getAllOrder(){
        EntityManager entityManager = emf.createEntityManager();
        List<Order> orders = entityManager.createQuery("SELECT o FROM Order o", Order.class)
                .getResultList();
        entityManager.close();
        return orders;
    }


}
