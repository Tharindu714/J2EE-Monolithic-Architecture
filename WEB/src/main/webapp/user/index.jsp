<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Profile</title>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <!-- AOS Animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Rubik Beasts', cursive;
            color: #e3e3e3;
            background: #000;
        }

        /* Full-screen background */
        #bg-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: url('https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2025/02/titanosaurus-in-jurassic-world-rebirth.jpg') no-repeat center center;
            background-size: cover;
            z-index: -2;
        }

        /* Dark overlay */
        #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        .profile-container {
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: 5vh auto;
            padding: 20px;
            background: rgba(0, 0, 0, 0.7);
            border: 2px solid #ffd700;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
            display: grid;
            grid-template-columns:1fr 2fr;
            gap: 20px;
        }

        .avatar {
            text-align: center;
        }

        .avatar img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            border: 5px solid #ffd700;
            object-fit: cover;
        }

        .user-info h1 {
            margin: 0 0 10px;
            font-size: 2.5rem;
            color: #ffd700;
            text-shadow: 2px 2px 8px #000;
        }

        .user-info p {
            font-size: 1.2rem;
            margin: 5px 0;
        }

        .stats {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .stat-card {
            flex: 1;
            margin: 0 10px;
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            animation: pulse 2s infinite alternate;
        }

        .stat-card h2 {
            margin: 0;
            font-size: 2rem;
            color: #ff4500;
        }

        .stat-card span {
            display: block;
            margin-top: 5px;
            font-size: 1rem;
            color: #ffd700;
        }

        @keyframes pulse {
            from {
                transform: scale(1);
            }
            to {
                transform: scale(1.05);
            }
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-weight: bold;
            color: #000;
            background: #ffd700;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #ff4500;
        }
    </style>
</head>
<body>
<div id="bg-image"></div>
<div id="overlay"></div>

<div class="profile-container" data-aos="fade-up">
    <div class="avatar">
        <img src="https://www.pngall.com/wp-content/uploads/15/Jurassic-World-Logo-PNG-Photos.png" alt="User Avatar">
        <a href="${pageContext.request.contextPath}/logout" class="btn" data-aos="zoom-in"
           data-aos-delay="200">Logout</a>
    </div>
    <div class="user-info">
        <h1>Your Jurassic Profile</h1>
        <p><strong>Role:</strong> Visitor</p>
        <p><strong>Email:</strong> ${pageContext.request.userPrincipal.name}</p>
        <div class="stats">
            <div class="stat-card" data-aos="flip-left">
                <h2>5</h2>
                <span>DNA Samples</span>
            </div>
            <div class="stat-card" data-aos="flip-left" data-aos-delay="100">
                <h2>12</h2>
                <span>Expeditions</span>
            </div>
            <div class="stat-card" data-aos="flip-left" data-aos-delay="200">
                <h2>3</h2>
                <span>Alerts</span>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script> AOS.init({duration: 1200, once: true}); </script>
</body>
</html>
