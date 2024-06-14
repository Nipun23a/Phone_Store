package com.mycompany.ecommerce.service;



import com.mycompany.ecommerce.model.Item;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ItemService {

   private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");;




    // Method to add a new item
    public void addItem(Item item) {
        EntityManager entityManager = emf.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(item);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    // Method to get all items
    public List<Item> getAllItems() {
        EntityManager entityManager = emf.createEntityManager();
        TypedQuery<Item> query = entityManager.createQuery("SELECT i FROM Item i", Item.class);
        List<Item> items = query.getResultList();
        entityManager.close();
        return items;
    }



    // Method to update an item
    public void updateItem(Item item) {
        EntityManager entityManager = emf.createEntityManager();

        try {
            // Begin transaction
            entityManager.getTransaction().begin();

            // Merge the provided item with the current persistence context
            entityManager.merge(item);

            // Commit transaction
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            // Rollback transaction if an exception occurs
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            // Close EntityManager
            entityManager.close();
        }
    }

    // Method to delete an item by ID
    public void deleteItem(int itemId) {
        EntityManager entityManager = emf.createEntityManager();
        entityManager.getTransaction().begin();
        Item item = entityManager.find(Item.class, itemId);
        if (item != null) {
            entityManager.remove(item);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    // Optional: Method to find an item by ID
    public Item getItemById(int itemId) {
        EntityManager entityManager = emf.createEntityManager();
        Item item = null;

        try {
            item = entityManager.find(Item.class, itemId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.close();
        }

        return item;
    }
}
