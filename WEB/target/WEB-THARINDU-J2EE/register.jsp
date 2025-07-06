<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Register</title>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <!-- AOS Animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <style>
        body { margin:0; padding:0; font-family: 'Rubik Beasts', cursive; color:#e3e3e3; overflow-x:hidden; }
        /* Full-screen 4K background image */
        #bg-image {
            position: fixed; top:0; left:0;
            width:100vw; height:100vh;
            background: url('https://static1.srcdn.com/wordpress/wp-content/uploads/2025/07/every-dinosaur-in-jurassic-world-rebirth-explained.jpg?q=70&fit=contain&w=1200&h=628&dpr=1') no-repeat center center;
            background-size: cover;
            z-index:-2;
        }
        /* Dark overlay filter */
        #overlay { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.6); z-index:-1; }
        .register-card {
            position:relative; z-index:1;
            max-width:400px; margin:8vh auto;
            background:rgba(0,0,0,0.8);
            border:2px solid #ffd700; border-radius:10px;
            padding:30px; box-shadow:0 0 20px rgba(0,0,0,0.7);
            animation: fadeInUp 1s ease-out;
        }
        @keyframes fadeInUp {
            from { opacity:0; transform:translateY(50px); }
            to   { opacity:1; transform:translateY(0); }
        }
        .register-card h1 { text-align:center; color:#ffd700; margin-bottom:20px; font-size:2rem; }
        .register-card label { display:block; margin-bottom:5px; font-size:1rem; }
        .register-card input {
            width:100%; padding:10px; margin-bottom:20px;
            border:1px solid #555; border-radius:5px;
            background:rgba(255,255,255,0.1); color:#e3e3e3;
        }
        .register-card button {
            width:100%; padding:12px; font-size:1rem; font-weight:bold;
            background:#ffd700; color:#000; border:none; border-radius:5px;
            cursor:pointer; transition:background 0.3s;
        }
        .register-card button:hover { background:#ff4500; }
        .dino-footprint {
            position:absolute; bottom:10px; right:10px;
            width:80px; opacity:0.1;
            animation: footprintPulse 2s infinite alternate;
        }
        @keyframes footprintPulse {
            from { opacity:0.1; transform:scale(1); }
            to   { opacity:0.3; transform:scale(1.1); }
        }
    </style>
</head>
<body>
<div id="bg-image"></div>
<div id="overlay"></div>

<div class="register-card" data-aos="zoom-in">
    <h1>Jurassic Registration</h1>
    <form method="POST" action="${pageContext.request.contextPath}/register">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>

        <label for="contact">Contact Number</label>
        <input type="text" id="contact" name="contact" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Enter the Park</button>
    </form>
    <img src="https://cdn2.iconfinder.com/data/icons/dinosaur-flat-edition/120/footprint_dinosaur_jurassic_triceratops-512.png" alt="Footprint" class="dino-footprint">
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script> AOS.init({ duration:1000, once:true }); </script>
</body>
</html>
