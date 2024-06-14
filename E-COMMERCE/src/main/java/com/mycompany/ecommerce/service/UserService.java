package com.mycompany.ecommerce.service;

import com.mycompany.ecommerce.model.Item;
import com.mycompany.ecommerce.model.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class UserService {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");

    public void register(Users user){
        EntityManager entityManager = emf.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public Users authenticate(String username,String password){
        EntityManager entityManager = emf.createEntityManager();
        Users user = null;
        try{
            user = entityManager.createQuery("SELECT u FROM Users u WHERE u.username = :username AND u.password = :password", Users.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .getSingleResult();
        }catch (Exception e){

        }finally {
            entityManager.close();
        }
        return user;
    }
    public Users getUserById(int userId) {
        EntityManager entityManager = emf.createEntityManager();
        Users users = null;

        try {
            users = entityManager.find(Users.class, userId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.close();
        }

        return users;
    }

}
