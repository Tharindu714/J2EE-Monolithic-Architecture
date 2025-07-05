<%--
  Created by IntelliJ IDEA.
  User: tharidu
  Date: 7/5/2025
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Unauthorized Response</title>
</head>
<body>
<h2>${requestScope['jakarta.servlet.error.status_code']} ||
  ${requestScope['jakarta.servlet.error.message']} </h2>
</body>
</html>
