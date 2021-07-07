package org.example.model;

import org.example.entity.Category;

public class ProductInfo {
    private int id;
    private String name;
    private String publisher;
    private float price;
    private Category category;
    private int quantity;

    public ProductInfo(){}

    public ProductInfo(int id, String name, String publisher, float price, Category category, int quantity){
        this.id = id;
        this.name = name;
        this.publisher = publisher;
        this.price = price;
        this.category = category;
        this.quantity = quantity;
    }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getPublisher() { return publisher; }

    public void setPublisher(String publisher) { this.publisher = publisher; }

    public float getPrice() { return price; }

    public void setPrice(float price) { this.price = price; }

    public Category getCategory() { return category; }

    public void setCategory(Category category) { this.category = category; }

    public int getQuantity() { return quantity; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
}
