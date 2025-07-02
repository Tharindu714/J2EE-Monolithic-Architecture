<%--
  Created by IntelliJ IDEA.
  User: tharidu
  Date: 7/2/2025
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>APP Mono | Add Product</title>
</head>
<body>
<h1>Add Products</h1>
<form method="POST" action="${pageContext.request.contextPath}/admin/addproduct">
    <tr>
        <td>
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>
        </td>
        <td>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </td>
        <td>
            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required>
        </td>
        <td>
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required>
        </td>
        <td>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>
        </td>
        <td>
            <button type="submit">Add Product</button>
        </td>
    </tr>
</form>
</body>
</html>
