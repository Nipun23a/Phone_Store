package com.mycompany.ecommerce.model;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Base64;

@Entity
@Table(name = "item")
public class Item implements Serializable {

    @Id
    @Column(name = "item_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int item_id;

    @Column(name = "item_name",nullable = false)
    private String item_name;

    @Column(name = "item_category")
    private String item_category;

    @Column(name = "item_brand")
    private String item_brand;
    @Column(name = "item_quantity", nullable = false)
    private int item_quantity;

    @Column(name = "item_price",nullable = false)
    private double price;

    @Column(name = "item_description")
    private String item_description;
    @Lob
    @Column(name = "item_image", nullable = false)
    private byte[] item_image;


    // Constructors


    public Item() {
    }

    public Item(String item_name, String item_category, String item_brand, int item_quantity, double price, String item_description, byte[] item_image) {
        this.item_name = item_name;
        this.item_category = item_category;
        this.item_brand = item_brand;
        this.item_quantity = item_quantity;
        this.price = price;
        this.item_description = item_description;
        this.item_image = item_image;
    }

    public Item(String itemName, byte[] itemPic, double itemPrice) {
        this.item_name = itemName;
        this.item_image = itemPic;
        this.price = itemPrice;

    }

    public Item(int item_quantity, double price, String item_description) {
        this.item_quantity = item_quantity;
        this.price = price;
        this.item_description = item_description;
    }
    // Getters and Setters


    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public int getItem_quantity() {
        return item_quantity;
    }

    public String getItem_category() {
        return item_category;
    }

    public void setItem_quantity(int item_quantity) {
        this.item_quantity = item_quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public byte[] getItem_image() {
        return item_image;
    }

    public void setItem_image(byte[] item_image) {
        this.item_image = item_image;
    }

    public void setItem_category(String item_category) {
        this.item_category = item_category;
    }

    public String getItem_brand() {
        return item_brand;
    }

    public void setItem_brand(String item_brand) {
        this.item_brand = item_brand;
    }

    public String getItem_description() {
        return item_description;
    }

    public void setItem_description(String item_description) {
        this.item_description = item_description;
    }

}
