<%@ page import="com.stockmanagementsystem.repositories.CategoryRepository" %>
<%@ page import="com.stockmanagementsystem.models.Category" %><%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/1/2021
  Time: 10:29 AM
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
    <title>Delete Category</title>
</head>
<body>
    <%
        if(request.getMethod().equalsIgnoreCase("GET")) {
            try {
                CategoryRepository cat = new CategoryRepository();
                String id = request.getParameter("id");
                boolean success = cat.deletecategory(Integer.parseInt(id));
                if (success == true) {
                    out.println(String.format("Congrats, category deleted successfully."));
                    response.sendRedirect("../CategoryMenu.jsp");
                } else {
                    out.println(String.format("Opoos!!, delete couldn't be completed."));
                }
            } catch (Exception e) {
                System.out.print(e.getMessage());
            }
        }%>

</body>
</html>
