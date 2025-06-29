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
    <title>APP Mono | Register</title>
</head>
<body>
<h1>REGISTER</h1>
<form method="POST" action="${pageContext.request.contextPath}/register">
    <table>
        <tr>
            <th>First Name</th>
            <td><label for="firstName"></label><input type="text" name="firstName" id="firstName"></td>
        </tr>
        <tr>
            <th>Last Name</th>
            <td><label for="lastName"></label><input type="text" name="lastName" id="lastName"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><label for="email"></label><input type="email" name="email" id="email"></td>
        </tr>
        <tr>
            <th>Password</th>
            <td><label for="password"></label><input type="password" name="password" id="password"></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Register</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
