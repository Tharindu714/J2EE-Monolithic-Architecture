<%@ page import="javax.naming.InitialContext" %>
<%@ page import="com.tharindu.app.core.service.ProductService" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="com.tharindu.app.core.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Rubik Beasts', cursive;
            background: #000;
            color: #e3e3e3;
        }

        #bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: url('https://images.bauerhosting.com/legacy/empire-tmdb/films/331/images/iqE0xCFCV8MX2xeYh1Tu7QTRE74.jpg?ar=16:9&fit=crop&crop=top') no-repeat center center;
            background-size: cover;
            filter: brightness(0.5);
            z-index: -2;
        }

        #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        .container {
            position: relative;
            z-index: 1;
            padding: 40px;
            max-width: 1000px;
            margin: 0 auto;
        }

        h1 {
            color: #ffd700;
            text-shadow: 2px 2px 8px #000;
        }

        .add-link {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background: #ffd700;
            color: #000;
            text-decoration: none;
            border-radius: 5px;
            transition: background .3s;
        }

        .add-link:hover {
            background: #ff4500;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: left;
        }

        th {
            background: rgba(0, 0, 0, 0.7);
            color: #ffd700;
        }

        tr:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .remove-btn {
            color: #000;
            background: #ff4500;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        /* Dino modal */
        #dino-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            align-items: center;
            justify-content: center;
            z-index: 999;
        }

        #dino-modal img {
            width: 400px;
            animation: dino-pop 0.5s ease-out, dino-fade 2s 1s forwards;
        }

        @keyframes dino-pop {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        @keyframes dino-fade {
            to {
                opacity: 0;
            }
        }
    </style>
</head>
<body>
<div id="bg"></div>
<div id="overlay"></div>
<div class="container">
    <h1>Jurassic Admin Dashboard</h1>
    <a href="${pageContext.request.contextPath}/admin/addproduct.jsp" class="add-link">Add New Dinosaur</a>

    <h1>All Registered Dinosaurs</h1>
    <%
        try {
            InitialContext ctx = new InitialContext();
            ProductService ps = (ProductService) ctx.lookup("com.tharindu.app.core.service.ProductService");
            List<Product> products = ps.getAllProducts();
            pageContext.setAttribute("products", products);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    %>

    <table>
        <tr>
            <th>Category</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Action</th>
        </tr>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.category}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>
                    <button class="remove-btn"
                            onclick="triggerRoar('${pageContext.request.contextPath}/admin/delete_dino?dino_id=${product.id}')">
                        Remove DNA
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<!-- Dino Roar Modal -->
<div id="dino-modal">
    <img src="https://dbdzm869oupei.cloudfront.net/img/sticker/preview/35754.png" alt="Roaring Dinosaur">
    <audio id="dino-sound" src="audio/dino-roar.mp3"></audio>
</div>

<script>
    function triggerRoar(deleteUrl) {
        const modal = document.getElementById('dino-modal');
        const sound = document.getElementById('dino-sound');
        modal.style.display = 'flex';
        sound.play();
        // After roar, fade and redirect
        setTimeout(() => {
            window.location = deleteUrl;
        }, 2500);
    }
</script>
</body>
</html>
