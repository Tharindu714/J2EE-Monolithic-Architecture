<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Add Dinosaur</title>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <!-- AOS Animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Rubik Beasts', cursive;
            background: #000;
            color: #e3e3e3;
            overflow-x: hidden;
        }

        #bg-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: url('https://forums.frontier.co.uk/attachments/158771/') no-repeat center center;
            background-size: cover;
            z-index: -2;
        }

        #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: -1;
        }

        .form-card {
            position: relative;
            z-index: 1;
            max-width: 600px;
            margin: 8vh auto;
            background: rgba(0, 0, 0, 0.8);
            border: 2px solid #ffd700;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
            animation: zoomIn 1s ease;
        }

        @keyframes zoomIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .form-card h1 {
            text-align: center;
            color: #ffd700;
            margin-bottom: 30px;
            font-size: 2.5rem;
            text-shadow: 2px 2px 8px #000;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
            animation: fadeUp 0.6s ease forwards;
        }

        .form-group:nth-child(1) {
            animation-delay: 0.2s;
        }

        .form-group:nth-child(2) {
            animation-delay: 0.4s;
        }

        .form-group:nth-child(3) {
            animation-delay: 0.6s;
        }

        .form-group:nth-child(4) {
            animation-delay: 0.8s;
        }

        .form-group:nth-child(5) {
            animation-delay: 1s;
        }

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        label {
            margin-bottom: 8px;
            font-size: 1rem;
        }

        input {
            padding: 12px;
            border: 1px solid #555;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            color: #e3e3e3;
        }

        .btn-submit {
            display: block;
            width: 100%;
            padding: 15px;
            margin-top: 20px;
            font-size: 1rem;
            font-weight: bold;
            text-align: center;
            color: #000;
            background: #ffd700;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
            animation: pulse 1.5s infinite alternate;
        }

        .btn-submit:hover {
            background: #ff4500;
        }

        @keyframes pulse {
            from {
                box-shadow: 0 0 10px #ffd700;
            }
            to {
                box-shadow: 0 0 20px #ff4500;
            }
        }

        .egg-decor {
            position: absolute;
            bottom: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            opacity: 0.2;
            animation: wiggle 2s infinite ease-in-out;
        }

        @keyframes wiggle {
            0%, 100% {
                transform: translateX(-50%) rotate(-5deg);
            }
            50% {
                transform: translateX(-50%) rotate(5deg);
            }
        }
    </style>
</head>
<body>
<div id="bg-image"></div>
<div id="overlay"></div>

<div class="form-card" data-aos="flip-down">
    <h1>Add New Dinosaur DNA</h1>
    <form method="POST" action="${pageContext.request.contextPath}/admin/add-dinosaurs">
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" id="category" name="category" required>
        </div>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input type="text" id="description" name="description" required>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" required>
        </div>
        <button type="submit" class="btn-submit">Extract DNA</button>
        <img src="https://img.pikbest.com/origin/08/99/65/30HpIkbEsT5ty.png!bw700" alt="Dino Egg" class="egg-decor">
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script> AOS.init({duration: 1000, once: true}); </script>
</body>
</html>