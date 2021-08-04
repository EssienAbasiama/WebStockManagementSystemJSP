package com.stockmanagementsystem.models;

import java.util.Date;

public class BaseEntity {

    protected int id;
    protected Date created_Time;

    public int getId(){
        return id;
    }
    public void setId(int Id){
        this.id = Id;
    }


    public Date getCreated_Time(){
        return created_Time;
    }
    public void setCreated_Time(Date Created_Time){
        this.created_Time = Created_Time;
    }

}
