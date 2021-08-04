<%@ page import="com.stockmanagementsystem.repositories.StockRespository" %>
<%@ page import="com.stockmanagementsystem.models.Stock" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/2/2021
  Time: 7:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/css/bootstrap.min.css">
    <link rel="stylesheet" href="../style.css">
    <title>Create Stock</title>
</head>
<body style = "background:grey;display: block;box-shadow: none">
<div style = "padding-top:2%; margin-bottom: 4%;margin-left: 30%">
    <div class="card " style="background-color:white;color:black ;width: 30rem;padding: 2%;">
<%--        <img src = "../images/category.jpg" class="card-img-top" alt="Category"/>--%>
        <div class="card-body">
            <div>
                <div class = "container-md">
                    <form method="post">
                        <div class="form-group">
                            <label for="Name">Name</label>
                            <input type="text" name = "Name" class="form-control" id="Name" placeholder="Category Name" required>
                        </div>
                        <div class="form-group">
                            <label for="costPrice">Cost Price</label>
                            <input type="text" name="costPrice" class="form-control" id="costPrice" placeholder="costPrice" required>
                        </div>

                        <div class="form-group">
                            <label for="sellingPrice">Selling Price</label>
                            <input type="text" name = "sellingPrice" class="form-control" id="sellingPrice" placeholder="Selling Price" required>
                        </div>
                        <div class="form-group">
                            <label for="quantity">Quantity</label>
                            <input type="text" name="quantity" class="form-control" id="quantity" placeholder="Your quantity" required>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary">Create Stock ++</button>
                        </div>
                    </form>
                </div>


            </div>
            <%
            if(request.getMethod().equalsIgnoreCase("POST")) {
                String name = request.getParameter("Name");
                String costPrice = request.getParameter("costPrice");
                String sellingPrice = request.getParameter("sellingPrice");
                String quantity = request.getParameter("quantity");
                try {
                    StockRespository stockRespository = new StockRespository();
                    boolean success= stockRespository.createStock(name, Double.parseDouble(costPrice), Double.parseDouble(sellingPrice), Integer.parseInt(quantity));
                    if (success == true) {
                        out.println(String.format("Stock created successfully"));
                        response.sendRedirect("StockMenu.jsp");
                    } else {
                        out.println(String.format("Stock creation Failed!!"));
                    }
                } catch(Exception e) {
                    //out.println(String.format("Sorry, %s creating failed.", name));
                    System.out.println(e.getMessage());
                }
            }
            %>

<%--    <hr>--%>
    <div>
        <footer class="mastfoot mt-auto">
            <div class = inner>
                <p>Cover page for <a style="color: floralwhite; text-decoration: none" href="http://localhost:8080/web_war_exploded/">Stock Management System</a>, by <a style="color: floralwhite; text-decoration: none" href="https://codelearnershub.com/">CodeLearners Hub</a>.</p>
            </div>
        </footer>
    </div>
</div>
</body>
</html>
