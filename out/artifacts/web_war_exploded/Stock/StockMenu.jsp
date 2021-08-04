<%@ page import="com.stockmanagementsystem.models.Stock" %>
<%@ page import="com.stockmanagementsystem.repositories.StockRespository" %>
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
    <title>Stock Menu</title>
</head>
<body>
    <div class ="container-fluid">
        <div class="jumbotron jumbotron-fluid" style="background-color: darkblue;">

            <div>
                <h3 id="h3" class="text-center display-4">THIS IS MY STOCK MANAGEMENT SYSTEM.
                </h3>
                <hr>

            </div>
        </div>

        <div>
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">S/N</th>
                        <th scope="col">Name</th>
                        <th scope="col">costPrice</th>
                        <th scope = "col">sellingPrice</th>
                        <th scope = "col">quantity</th>
                        <th scope = "col">Created Time</th>
                        <th scope = "col">Edit</th>
                        <th scope = "col">Delete</th>
                    </tr>
                </thead>
                <tbody>

                        <%
                            StockRespository stockRespository = new StockRespository();
                            List<Stock> arrStock = stockRespository.getallstk();
                            int count = 0;
                            for (Stock stocks : arrStock) {

                        %>
                        <tr>
                            <td><%=++count%></td>
                            <td><%=stocks.getName()%></td>
                            <td><%=stocks.getCostPrice()%></td>
                            <td><%=stocks.getSellingPrice()%></td>
                            <td><%=stocks.getSellingPrice()%></td>
                            <td><%=stocks.getCreated_Time()%></td>
                            <td><a href="Action/Edit.jsp?id=<%=stocks.getId()%>" class="btn btn-outline-success ">Edit</a></td>
                            <td><a href="Action/Delete.jsp?id=<%=stocks.getId()%>" class="btn btn-danger ">Delete</a></td>
                        <%}%>
                    </tr>
                </tbody>
            </table>

            <div >
                <a href="createStock.jsp" class="btn btn-primary ">Create Stock++</a>
            </div>
        </div>

        <hr>

        <footer class="mastfoot mt-auto">
            <div class="inner">
                <p class="inner" style = "text-align: center">Cover page for
                    <a style="color: floralwhite; text-decoration: none" href="http://localhost:8080/web_war_exploded/">
                        Stock Management System
                    </a>, by
                    <a style="color: floralwhite; text-decoration: none"
                       href="https://codelearnershub.com/">CodeLearners Hub
                    </a>.
                </p>
            </div>
        </footer>
    </div>
</body>
</html>
