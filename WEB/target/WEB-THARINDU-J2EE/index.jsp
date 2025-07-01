<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tharidu
  Date: 6/29/2025
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>APP Mono | Welcome</title>
</head>
<body>
<h1>This is Front End</h1>

<c:if test="${empty pageContext.request.userPrincipal}">
    <a href="${pageContext.request.contextPath}/register.jsp">Register</a>
    <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
</c:if>

<c:if test="${not empty pageContext.request.userPrincipal}">
    <h2>Welcome, ${pageContext.request.userPrincipal.name}!</h2>
    <a href="${pageContext.request.contextPath}/user/index.jsp">User Dashboard</a>
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
</c:if>

</body>
</html>
