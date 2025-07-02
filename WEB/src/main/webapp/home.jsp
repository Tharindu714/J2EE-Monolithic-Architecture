<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tharidu
  Date: 7/1/2025
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="com.tharindu.app.core.model.Product" %>
<%@ page import="com.tharindu.app.core.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>APP Mono | Home</title>
</head>
<body>
<h1>Welcome to the Homepage</h1>
<h4>Hello, ${pageContext.request.userPrincipal.name}</h4>

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
        </tr>
    </c:forEach>
</table>
</body>
</html>
