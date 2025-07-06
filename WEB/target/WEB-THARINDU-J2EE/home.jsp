<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="com.tharindu.app.core.model.Product" %>
<%@ page import="com.tharindu.app.core.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Home</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <!-- AOS for scroll animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #000;
            color: #e3e3e3;
            font-family: 'Rubik Beasts', cursive;
            overflow-x: hidden;
        }
        /* Fullscreen background video */
        #bg-video {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            object-fit: cover;
            z-index: -1;
            opacity: 0.7;
        }
        header {
            text-align: center;
            padding: 30px 0;
            background: rgba(0,0,0,0.6);
            box-shadow: 0 0 20px rgba(0,0,0,0.7);
        }
        header h1 {
            margin: 0;
            font-size: 3rem;
            color: #ffd700;
            text-shadow: 2px 2px 8px #000;
        }
        .welcome {
            text-align: center;
            margin: 20px 0;
            font-size: 1.5rem;
            animation: glow 2s infinite alternate;
        }
        @keyframes glow {
            from { text-shadow: 0 0 5px #ffd700; }
            to   { text-shadow: 0 0 20px #ff0000; }
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 0 50px 50px;
        }
        .product-card {
            background: rgba(0,0,0,0.7);
            border: 2px solid #ffd700;
            border-radius: 15px;
            padding: 20px;
            position: relative;
            overflow: hidden;
            transform: translateY(50px);
            opacity: 0;
        }
        .product-card::before {
            content: '';
            position: absolute;
            top: -50%; left: -50%;
            width: 200%; height: 200%;
            background: url('https://static.scientificamerican.com/sciam/cache/file/D41879FA-263E-4AB2-9014609C1EF76D79_source.jpg') no-repeat center;
            background-size: contain;
            opacity: 0.05;
        }
        .product-card h3 {
            margin-top: 0;
            color: #ffd700;
        }
        .product-card p { margin: 5px 0; }
        .product-card .price { font-size: 1.2rem; font-weight: bold; }
        .product-card:hover {
            animation: shake 0.5s;
            border-color: #ff4500;
        }
        @keyframes shake {
            0%,100% { transform: translateX(0); }
            20%,80% { transform: translateX(-10px); }
            40%,60% { transform: translateX(10px); }
        }

        /* Fullscreen YouTube container */
        #yt-bg-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
            z-index: -1;
        }
        /* Cover behavior: ensures no black bars */
        #yt-bg-iframe {
            position: absolute;
            top: 50%;
            left: 50%;
            /* force iframe to cover both dimensions */
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            transform: translate(-50%, -50%);
            pointer-events: none;
        }

    </style>
</head>
<body>
<!-- Full‑screen YouTube background -->
<div id="yt-bg-container">
    <iframe
            id="yt-bg-iframe"
            src="https://www.youtube.com/embed/C7kbVvpOGdQ?autoplay=1&mute=1&loop=1&playlist=C7kbVvpOGdQ&controls=0&rel=0"
            frameborder="0"
            allow="autoplay; fullscreen"
            allowfullscreen>
    </iframe>
</div>


<header>
    <h1>Jurassic World DNA Catalog</h1>
    <div class="welcome">Welcome, ${pageContext.request.userPrincipal.name}</div>
</header>

<%
    try {
        InitialContext ctx = new InitialContext();
        ProductService ps = (ProductService) ctx.lookup("com.tharindu.app.core.service.ProductService");
        List<Product> products = ps.getAllProducts();
        pageContext.setAttribute("products", products);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>

<div class="product-grid">
    <c:forEach var="product" items="${products}" varStatus="status">
        <div class="product-card" data-aos="fade-up" data-aos-delay="${status.index * 100}">
            <h3>${product.name}</h3>
            <p class="category">Category: ${product.category}</p>
            <p class="description">${product.description}</p>
            <p class="price">Price: $${product.price}</p>
            <p class="quantity">Quantity: ${product.quantity}</p>
        </div>
    </c:forEach>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init({
        duration: 1200,
        once: true
    });
</script>
</body>
</html>
