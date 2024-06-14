package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.model.Item;
import com.mycompany.ecommerce.model.Order;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

import java.util.List;

public class AdminDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public int getNumberOfProducts() {
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createQuery("SELECT COUNT(p) FROM Item p");
            Long count = (Long) query.getSingleResult();
            return count.intValue();
        } finally {
            em.close();
        }
    }

    public int getNumberOfCustomers() {
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createQuery("SELECT COUNT(c) FROM Users c where c.role ='USER'");
            Long count = (Long) query.getSingleResult();
            return count.intValue();
        } finally {
            em.close();
        }
    }

    public int getNumberOfOrders() {
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createQuery("SELECT COUNT(o) FROM Order o");
            Long count = (Long) query.getSingleResult();
            return count.intValue();
        } finally {
            em.close();
        }
    }
    public int getRecentOrders() {
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createQuery("SELECT o FROM Order o ORDER BY o.orderId");
            Long count = (Long) query.getSingleResult();
            return count.intValue();
        } finally {
            em.close();
        }
    }

    public List<Item> getAllProducts() {
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createQuery("SELECT p FROM Item p");
            return query.getResultList();
        } finally {
            em.close();
        }
    }
    public List<Order> getAllInvoice(){
        EntityManager em = emf.createEntityManager();
        try{
            Query query = em.createQuery("SELECT o FROM Order o");
            return query.getResultList();
        }finally {
            em.close();
        }
    }
    public void removeItem(int itemId) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Item item = em.find(Item.class, itemId);
        if (item != null) {
            em.remove(item);
        }
        em.getTransaction().commit();
        em.close();
    }
}