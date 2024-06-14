package com.mycompany.ecommerce.model;

import jakarta.persistence.*;

import java.io.Serializable;
import java.math.BigDecimal;


@Entity
@Table(name = "orders")
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int orderId;

    @Column(name = "item_information")
    private String itemInformation;

    @Column(name = "order_amount")
    private double orderAmount;

    @Column(name = "user_id")
    private int user;

    public Order() {
    }

    public Order(String itemInformation,int user,double orderAmount) {
        this.itemInformation = itemInformation;
        this.user = user;
        this.orderAmount = orderAmount;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getItemInformation() {
        return itemInformation;
    }

    public void setItemInformation(String itemInformation) {
        this.itemInformation = itemInformation;
    }

    public double getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(Double orderAmount) {
        this.orderAmount = orderAmount;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

}
