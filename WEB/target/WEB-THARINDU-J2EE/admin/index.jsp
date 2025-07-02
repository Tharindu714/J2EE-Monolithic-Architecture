<%@ page import="javax.naming.InitialContext" %>
<%@ page import="com.tharindu.app.core.service.ProductService" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="com.tharindu.app.core.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>APP Mono | Admin</title>
</head>
<body>
<h1>Admin Dashboard</h1>
<a href="${pageContext.request.contextPath}/admin/addproduct.jsp">Add Product</a>

<h1>All Registered Products</h1>
<%
    try {
        InitialContext initialContext = new InitialContext();
        ProductService ps = (ProductService) initialContext.lookup("com.tharindu.app.core.service.ProductService");
        List<Product> products = ps.getAllProducts();
        pageContext.setAttribute("products", products);
    } catch (NamingException e) {
        throw new RuntimeException(e);
    }
%>

<table>
    <tr>
        <th>Products</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.category}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/delete_dino?dino_id=${product.id}">Remove DNA</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
