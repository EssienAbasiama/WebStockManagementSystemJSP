<%@ page import="com.stockmanagementsystem.repositories.StockRespository" %><%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/2/2021
  Time: 7:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(request.getMethod().equalsIgnoreCase("GET")) {
        try {
            StockRespository cat = new StockRespository();
            String id = request.getParameter("id");
            boolean success = cat.deletestk(Integer.parseInt(id));
            if (success) {
                out.println("Congrats, category deleted successfully.");
                response.sendRedirect("../StockMenu.jsp");
            } else {
                out.println("Oops!!, delete couldn't be completed.");
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }%>

</body>
</html>
