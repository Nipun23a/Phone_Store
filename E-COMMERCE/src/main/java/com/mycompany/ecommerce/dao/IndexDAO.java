package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.model.Item;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;


import java.sql.Blob;
import java.util.List;
import java.util.Base64;

public class IndexDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");


    public List<Item> getMobilePhones() {
        EntityManager em = emf.createEntityManager();
        List<Item> phones = em.createQuery("SELECT i FROM Item i WHERE i.item_category = 'Mobile Phones'", Item.class)
                .setMaxResults(6)
                .getResultList();
        em.close();
        return phones;
    }

    public List<Item> getAccessories(){
        EntityManager em = emf.createEntityManager();
        List<Item> accessories = em.createQuery("SELECT i FROM Item i WHERE i.item_category = 'Accessories'", Item.class)
                .setMaxResults(6)
                .getResultList();
        em.close();
        return accessories;
    }

    public Item getItemInfo(int id){
        EntityManager em = emf.createEntityManager();

        Item item = em.createQuery("SELECT i FROM Item i WHERE i.item_id = :id", Item.class)
                .setParameter("id", id)
                .getSingleResult();
        em.close();
        return item;
    }
}
