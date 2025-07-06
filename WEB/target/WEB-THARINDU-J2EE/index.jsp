<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Welcome</title>
    <!-- Google Font: 'Rubik Beasts' or fallback -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('https://wallpapercave.com/wp/wp12401754.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: #e3e3e3;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
        }
        header {
            background: rgba(0, 0, 0, 0.6);
            padding: 20px;
            text-align: center;
            position: relative;
        }
        header h1 {
            font-family: 'Rubik Beasts', cursive;
            font-size: 3rem;
            margin: 0;
            color: #ffd700;
        }
        nav {
            margin-top: 15px;
        }
        .btn {
            display: inline-block;
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            border: 2px solid #ffd700;
            border-radius: 5px;
            background: rgba(0,0,0,0.5);
            transition: background 0.3s, transform 0.3s;
        }
        .btn:hover {
            background: rgba(0,0,0,0.8);
            transform: scale(1.05);
        }
        .welcome-text {
            margin: 100px auto;
            text-align: center;
        }
        .welcome-text h2 {
            font-family: 'Rubik Beasts', cursive;
            font-size: 2.5rem;
            color: #ffd700;
        }
    </style>
</head>
<body>
<header>
    <h1>Jurassic World</h1>
    <nav>
        <c:if test="${empty pageContext.request.userPrincipal}">
            <a class="btn" href="${pageContext.request.contextPath}/register.jsp">Register</a>
            <a class="btn" href="${pageContext.request.contextPath}/login.jsp">Login</a>
        </c:if>
        <c:if test="${not empty pageContext.request.userPrincipal}">
            <span class="btn">Welcome, ${pageContext.request.userPrincipal.name}!</span>
            <a class="btn" href="${pageContext.request.contextPath}/user/index.jsp">Dashboard</a>
            <a class="btn" href="${pageContext.request.contextPath}/home.jsp">Home</a>
            <a class="btn" href="${pageContext.request.contextPath}/logout">Logout</a>
        </c:if>
    </nav>
</header>

<div class="welcome-text">
    <h2>Step into the World of the Dinosaurs</h2>
</div>

</body>
</html>
