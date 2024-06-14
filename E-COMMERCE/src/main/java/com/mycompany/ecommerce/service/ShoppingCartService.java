package com.mycompany.ecommerce.service;

import com.mycompany.ecommerce.model.Order;
import com.mycompany.ecommerce.model.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class ShoppingCartService {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public void addtoInvoice(Order order){
        EntityManager entityManager = emf.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(order);
        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
