<%@ page import="com.stockmanagementsystem.repositories.CategoryRepository" %>
<%@ page import="java.sql.SQLException" %>
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
    <title>Category Edit</title>
</head>
<body>
<div class=" container card " style="background:darkblue; width: 31rem;border: 1px solid black;border-radius:10px" >
    <img src="../../images/category.jpg" class="card-img-top" alt="Category">
    <div class="card-body">
        <div class = "container-md">
            <%
                Category category = null;
                if(request.getMethod().equalsIgnoreCase("GET")){
                    try{
                        String id = request.getParameter("id");
                        CategoryRepository categoryRepository = new CategoryRepository();
                        category = categoryRepository.find(Integer.parseInt(id));
                    }catch (Exception e){
                        out.println(String.format(e.getMessage()));
                    }
                    assert category != null;%>
            <form method="post">
                <div class="form-group">
                    <label for="id">Id</label>
                    <input type="text" name = "id" class="form-control" id="id" value="<%=category.getId()%>" required readonly>
                </div>
                <div class="form-group">
                    <label for="Name">Name</label>
                    <input type="text" name = "name" class="form-control" id="Name" placeholder="Name" value="<%=category.getName()%>" required>
                </div>
                <div class="form-group">
                    <label for="Description">Description</label>
                    <input type="text" Name = "Description" class="form-control" id="Description" value="<%=category.getDescription()%>" placeholder="Your Description" required>
                </div>


                <div>

                    <div class = "form-group">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </form>
            <%}%>
            <%if(request.getMethod().equalsIgnoreCase("POST")) {
                try {
                    CategoryRepository categoryRepositoryUpdate = new CategoryRepository();
                    String id = request.getParameter("id");
                    String name = request.getParameter("name");
                    String description =  request.getParameter("Description");
                    boolean success = categoryRepositoryUpdate.updatecategory(id, name, description);

                    if (success) {
                        out.println("Congrats, category updated successfully.");

                    } else{
                        out.println(String.format("Sorry!! Something went wrong"));
                    }
                } catch (Exception e) {
                    out.println(String.format(e.getMessage()));
                }
            }%>
            <div class = "form-group">
                <a href="../../index.jsp" class="btn btn-outline-success "><<=Go Back Home</a>
            </div>
        </div>
    </div>
</div>
<hr>
<footer class="mastfoot mt-auto" style="margin-top: 20%">
    <div class="inner">
        <p>Cover page for <a style="color: floralwhite; text-decoration: none" href="http://localhost:8080/web_war_exploded/">Stock Management System</a>, by <a style="color: floralwhite; text-decoration: none" href="https://codelearnershub.com/">CodeLearners Hub</a>.</p>
    </div>
</footer>
</body>
</html>
