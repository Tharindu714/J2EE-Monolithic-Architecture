<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Login</title>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <!-- AOS Animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <style>
        body { margin:0; padding:0; overflow-x:hidden; font-family: 'Rubik Beasts', cursive; background:#000; color:#e3e3e3; }
        #overlay { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.6); z-index:0; }
        .login-card {
            position:relative;
            z-index:1;
            max-width:400px;
            margin:10vh auto;
            background:rgba(0,0,0,0.8);
            border:2px solid #ffd700;
            border-radius:10px;
            padding:30px;
            box-shadow:0 0 20px rgba(0,0,0,0.7);
            animation: fadeInDown 1s ease-out;
        }
        @keyframes fadeInDown {
            from { opacity:0; transform:translateY(-50px); }
            to { opacity:1; transform:translateY(0); }
        }
        .login-card h1 { margin-bottom:20px; color:#ffd700; text-align:center; font-size:2rem; }
        .login-card label { display:block; margin-bottom:5px; font-size:1rem; }
        .login-card input {
            width:100%; padding:10px; margin-bottom:20px;
            border:1px solid #555; border-radius:5px;
            background:rgba(255,255,255,0.1); color:#e3e3e3;
        }
        .login-card button {
            width:100%; padding:12px; font-size:1rem; font-weight:bold;
            background:#ffd700; color:#000; border:none; border-radius:5px;
            cursor:pointer; transition:background 0.3s;
        }
        .login-card button:hover { background:#ff4500; }
        .dino-footprint {
            position:absolute; bottom:10px; right:10px;
            width:80px; opacity:0.1;
            animation: footprintPulse 2s infinite alternate;
        }
        @keyframes footprintPulse {
            from { opacity:0.1; transform:scale(1); }
            to { opacity:0.3; transform:scale(1.1); }
        }
        /* Full-screen 4K background image */
        #bg-image {
            position: fixed;
            top: 0; left: 0;
            width: 100vw;
            height: 100vh;
            background: url('https://image-service.zaonce.net/eyJidWNrZXQiOiJmcm9udGllci1jbXMiLCJrZXkiOiIyMDIyLTA1L2p3ZTItZG9taW5pb24ta2V5YXJ0LWxlZnQtbG93ZXItY2xlYW4uanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo4NX0sInRvRm9ybWF0Ijoid2VicCIsInJlc2l6ZSI6eyJ3aWR0aCI6Mzg0MCwiZml0IjoiY29udGFpbiJ9fX0=') no-repeat center center;
            background-size: cover;
            z-index: -1;
        }
    </style>
</head>
<body>
<!-- YouTube Background -->
<!-- Full‑screen 4K background image -->
<div id="bg-image"></div>
<div id="overlay"></div>

<div class="login-card" data-aos="zoom-in">
    <h1>Jurassic Login</h1>
    <form method="POST" action="${pageContext.request.contextPath}/login">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Enter Park</button>
    </form>
    <img src="https://cdn2.iconfinder.com/data/icons/dinosaur-flat-edition/120/footprint_dinosaur_jurassic_triceratops-512.png" alt="Footprint" class="dino-footprint">
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script> AOS.init({ duration:1000, once:true }); </script>
</body>
</html>
