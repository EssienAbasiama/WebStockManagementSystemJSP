package com.stockmanagementsystem.repositories;

import com.stockmanagementsystem.models.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository {

    Connection connection;

    public CategoryRepository() throws ClassNotFoundException, SQLException {
        //Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver Loaded Successfully.");

        //Connect to database.
        String url = "jdbc:mysql://localhost/stockmanagementsystem?userTimeZone=UTC&serverTimeZone=UTC";
        connection = DriverManager.getConnection(url, "root", "Tetfunds01.");
        System.out.println("Connected to DB Successfully.");
    }

    public boolean createCategory(String name, String description) {
        Date createdTime = new Date(System.currentTimeMillis());
        try {
            //Create statement
            Statement statement = connection.createStatement();

            //Execute a statement
            int count = statement.executeUpdate("insert into category(name, description, created_time) values('" + name + "', '" + description + "', '" + createdTime + "')");

            if (count > 0) {
                return true;
            }

        } catch (Exception e) {
            return false;
        }
        return false;
    }

    public List<Category> getAll() {

        List<Category> categories = new ArrayList<>();
        try {
            //Create the statement.
            Statement statement = connection.createStatement();

            //Execute the statement.
            ResultSet resultSet = statement.executeQuery("select * from category");

            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String description = resultSet.getString(3);
                Date createdTime = resultSet.getDate(4);
                Category category = new Category(id, name, description, createdTime);
                categories.add(category);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return categories;
    }



    public Category find(int id) {

        Category category = null;
        try {
            //Create the statement.
            Statement statement = connection.createStatement();

            //Execute the statement.
            ResultSet resultSet = statement.executeQuery("select * from category where id = '" + id + "' ");

            while (resultSet.next()) {
                String name = resultSet.getString(2);
                String description = resultSet.getString(3);
                Date createdTime = resultSet.getDate(4);
                category = new Category(id, name, description, createdTime);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return category;
    }

    public boolean deletecategory(int id) {

        try {
            //Create statement
            Statement statement = connection.createStatement();

            //Execute a statement
            int count = statement.executeUpdate("delete from category where id = '" + id + "' ");

            if (count > 0) {
                System.out.println("Category deleted successfully.");
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println("Opooos!! Category Delete failed");
    return false;
    }
    public boolean updatecategory(String id, String name, String description) {
        Category category = find(Integer.parseInt(id));
        if (category == null) {
            return false;
        } else {
            try {
                //Create statement
                Statement statement = connection.createStatement();

                //Execute a statement
                int count = statement.executeUpdate("update category set name = '" + name + "', description = '" + description + "'  where id = '" +Integer.parseInt(id)+ "' ");

                if (count > 0) {
                    System.out.println("Category updated successfully.");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return true;
    }
//    public static void edit() {
//        String html =
//                "<html>" +
//                    "<head>" +
//                        "<title>Hello World</title>" +
//                    "</head>" +
//                "<body>" +
//                        "<div>"+
//                            "<form method=\"post\">" +
//                                "<div class=\"form-group\">"+
//                                    "<label for=\"Name\">Name</label>" +
//                                    " <input type=\"text\" name = \"name\" class=\"form-control\" id=\"Name\" placeholder=\"Category Name\" required>"+
//                                "</div>"+
//                                "<div class=\"form-group\">"+
//                                    "<label for=\"Description\">Name</label>" +
//                                    " <input type=\"text\" name = \"name\" class=\"form-control\" id=\"Name\" placeholder=\"Category Name\" required>"+
//                                "</div>"+
//                            "</form>" +
//                        "<div>"+
//                "</body>" +
//                "</html>";
//
//    }
//    public static void delete() {
//
//    }
}


