<%@ page import="com.stockmanagementsystem.repositories.CategoryRepository" %>
<%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 7/29/2021
  Time: 10:21 AM
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
    <title>Create Category</title>
</head>
<body>
    <div class=" container card " style="background:darkblue; width: 35rem;border: 2px solid black;border-radius:10px" >
        <img src="../images/category.jpg" class="card-img-top" alt="Category">
        <div class="card-body">
            <div>
                <div class = "container-md">
                    <form method="post">
                        <div class="form-group">
                            <label for="Name">Name</label>
                            <input type="text" name = "name" class="form-control" id="Name" placeholder="Category Name" required>
                        </div>
                        <div class="form-group">
                            <label for="Description">Description</label>
                            <input type="text" name="description" class="form-control" id="Description" placeholder="Your Description" required>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary">create</button>
                         </div>

                    </form>
                </div>
                <br>
                <br>
                <br>
                <br>
<%--                <div>--%>
<%--                    <div class = form-group">--%>
<%--                        <a href="../index.jsp" class="btn btn-success"><<=Go Back Home</a>--%>
<%--                    </div>--%>

<%--                </div>--%>
            </div>

            <%
                if(request.getMethod().equalsIgnoreCase("POST")){
                    String name = request.getParameter("name");
                    String description = request.getParameter("description");
                    try{
                        CategoryRepository categoryRepository = new CategoryRepository();
                        boolean success = categoryRepository.createCategory(name, description);
                        if(success){
                            out.println(String.format("Congrats, %s was created successfully.", name));
                            response.sendRedirect("CategoryMenu.jsp");
                        }else {
                            out.println(String.format("Sorry, %s creating failed.", name));
                        }
                    }catch (Exception e){
                        out.println(String.format(e.getMessage()));
                    }
                }
            %>
        </div>
    </div>

    <hr>
    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Cover page for <a style="color: floralwhite; text-decoration: none" href="http://localhost:8080/web_war_exploded/">Stock Management System</a>, by <a style="color: floralwhite; text-decoration: none" href="https://codelearnershub.com/">CodeLearners Hub</a>.</p>
        </div>
    </footer>

</body>
</html>
