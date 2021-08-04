package com.stockmanagementsystem.repositories;

import com.stockmanagementsystem.models.Stock;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StockRespository {
    Connection connection;
    public StockRespository() throws ClassNotFoundException, SQLException {
        //Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver Loaded Successfully.");

        //Connect to database.
        String url = "jdbc:mysql://localhost/stockmanagementsystem?userTimeZone=UTC&serverTimeZone=UTC";
        connection = DriverManager.getConnection(url, "root", "Tetfunds01.");
        System.out.println("Connected to DB Successfully.");
    }

    public boolean createStock(String name, Double costPrice, Double sellingPrice, int quantity) {
        try{
            Date created_Time = new Date(System.currentTimeMillis());

            //Create statement
            Statement statement = connection.createStatement();

            //Execute a statement
            int count = statement.executeUpdate("insert into Stock(name, costPrice, sellingPrice, quantity,created_Time) values('"+name+"', '"+costPrice+"', '"+sellingPrice+"','"+quantity+"','"+created_Time+"')");
            if (count > 0) {
                System.out.println ("Stocks created successfully");
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public List<Stock> getallstk() {

        List<Stock> arrstocks = new ArrayList<Stock>();
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from stock");
            while(resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                Double costPrice = resultSet.getDouble(3);
                Double sellingPrice = resultSet.getDouble(4);
                int quantity = resultSet.getInt(5);
                Date created_Time = resultSet.getDate(6);

                Stock stock = new Stock(id, name, costPrice, sellingPrice,quantity, created_Time);
                arrstocks.add(stock);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return arrstocks;
    }


    public Stock find(int id) {

        Stock stock = null;
        try {
            //Create the statement.
            Statement statement = connection.createStatement();
            //Execute the statement.
            ResultSet resultSet = statement.executeQuery("select * from stock where id = '"+id+"' ");

            while(resultSet.next()) {
                String name = resultSet.getString(2);
                Double costPrice = resultSet.getDouble(3);
                Double sellingPrice = resultSet.getDouble(4);
                int quantity = resultSet.getInt(5);
                Date created_Time = resultSet.getDate(6);
                stock = new Stock(id, name, costPrice, sellingPrice,quantity, created_Time);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return stock;
    }
//    public void findStockById() {
//        System.out.println("Input your Id");
//        int id = sc.nextInt();
//
//        Stock stock = find(id);
//        if(stock == null){
//            System.out.println(" The category with the id does not exist.");
//        }else{
//            printStock(stock);
//        }
//    }
    public boolean updatestk(int id,String name,Double costPrice , Double sellingPrice , int quantity) {
        try{
//            Date created_Time = new Date(System.currentTimeMillis());
            Statement statement = connection.createStatement();
            int count = statement.executeUpdate("update stock set name = '"+name+"', costPrice = '"+costPrice+"', sellingPrice = '"+sellingPrice+"', quantity = '"+quantity+"' where id = '"+id+"' ");
            if (count > 0) {
                System.out.println("Update Successful");
                return true;
            }
        }catch (Exception e) {
            e.getMessage();
        }
        return false;
    }
    public boolean deletestk(int id) {
        try {
            Stock stocks = find(id);
            Statement statement = connection.createStatement();
            int count = statement.executeUpdate("Delete from Stock where id = '"+id+"'");
            if (count > 0) {
                System.out.println("Delete Successful");
                return true;
            }
        } catch(Exception e) {
            e.getMessage();
        }
        return false;
    }
}