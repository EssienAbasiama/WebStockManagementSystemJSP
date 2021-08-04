<%@ page import="com.stockmanagementsystem.repositories.StockRespository" %>
<%@ page import="com.stockmanagementsystem.models.Stock" %><%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/2/2021
  Time: 7:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../style.css">
    <title>Stock Edit</title>
</head>
<body style = "background:grey;display: block;box-shadow: none">
<div style = "padding-top:2%; margin-bottom: 4%;margin-left: 30%">
    <div class="card "  style="background-color:white;color:black ;width: 30rem;padding: 2%;" >
    <%--    <img src="../../images/category.jpg" class="card-img-top" alt="Category">--%>
        <div class="card-body">
            <div class = "container-md">
                <%if (request.getMethod().equalsIgnoreCase("GET")) {
                    try {
                        String id = request.getParameter("id");
                        StockRespository stockRespository = new StockRespository();
                        Stock stock = stockRespository.find(Integer.parseInt(id));
                %>
                <form method="post">
                    <div class="form-group">
                        <label for="Id">Id</label>
                        <input type="text" name = "Id" class="form-control" id="Id" Value="<%=stock.getId()%>" Readonly>
                    </div>
                    <div class="form-group">
                        <label for="Name">Name</label>
                        <input type="text" name = "Name" class="form-control" id="Name" Value="<%=stock.getName()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="costPrice">Cost Price</label>
                        <input type="text" name="costPrice" class="form-control" id="costPrice" Value="<%=stock.getCostPrice()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="sellingPrice">Selling Price</label>
                        <input type="text" name = "sellingPrice" class="form-control" id="sellingPrice" Value="<%=stock.getSellingPrice()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="text" name="quantity" class="form-control" id="quantity" Value="<%=stock.getQuantity()%>" required>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Update Stock</button>
                    </div>

                </form>
                <%} catch(Exception e) {
                    out.println("An error occurred");
                }
                }
                    if(request.getMethod().equalsIgnoreCase("POST")) {
                        try{
                            StockRespository stockRespository = new StockRespository();
                            String id = request.getParameter("Id");
                            String name = request.getParameter("Name");
                            String costPrice = request.getParameter("costPrice");
                            String sellingPrice = request.getParameter("sellingPrice");
                            String quantity = request.getParameter("quantity");
                            boolean success = stockRespository.updatestk(Integer.parseInt(id),name,Double.parseDouble(costPrice) , Double.parseDouble(sellingPrice) ,Integer.parseInt(quantity) );
                            if (success) {
                                out.println("Update Successful");
                                response.sendRedirect("../StockMenu.jsp");
                            } else {
                                out.println(String.format("Update failed"));
                            }
                        } catch(Exception e) {
                            e.getMessage();
                        }
                    }
                %>

                <div class = "form-group">
                    <a href="../../index.jsp" class="btn btn-outline-success "><<=Go Back Home</a>
                </div>
            </div>
        </div>
    </div>

    <hr>
    <footer class="mastfoot mt-auto" style="margin-top: 20%">
        <div class="inner">
            <p style="color: black">Cover page for <a style="color: floralwhite; text-decoration: none" href="http://localhost:8080/web_war_exploded/">Stock Management System</a>, by <a style="color: floralwhite; text-decoration: none" href="https://codelearnershub.com/">CodeLearners Hub</a>.</p>
        </div>
    </footer>
</div>
</body>
</html>

