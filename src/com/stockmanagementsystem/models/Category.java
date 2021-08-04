package com.stockmanagementsystem.models;


import java.sql.Date;

public class Category extends BaseEntity {

    private String name;
    private String description;

    public String getName(){
        return name;
    }
    public void setName(String Name){
        this.name = Name;
    }

    public String getDescription(){
        return description;
    }
    public void setDescription(String Description){
        this.description = Description;
    }
    public Category(int id, String name, String description, Date Created_Time){

        this.id = id;
        this.name = name;
        this.description = description;
        this.created_Time = Created_Time;

    }
}
