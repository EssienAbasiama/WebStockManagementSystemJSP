package com.stockmanagementsystem.models;

import java.util.Date;

public class Stock extends BaseEntity {

    private String name;
    private Double costPrice;
    private Double sellingPrice;
    private int quantity;

    public Stock(int id, String name, Double costPrice, Double sellingPrice, int quantity, Date createdTime) {
        this.id = id;
        this.name = name;
        this.costPrice = costPrice;
        this.sellingPrice = sellingPrice;
        this.quantity = quantity;
        this.created_Time = createdTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(Double costPrice) {
        this.costPrice = costPrice;
    }

    public Double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
