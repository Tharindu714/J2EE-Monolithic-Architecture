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
            <th>Username</th>
            <td><label for="username"></label><input type="text" name="username" id="username"></td>
        </tr>
        <tr>
            <th>Contact Number</th>
            <td><label for="contact"></label><input type="text" name="contact" id="contact"></td>
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
