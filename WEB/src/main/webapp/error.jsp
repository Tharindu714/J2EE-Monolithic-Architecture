<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jurassic World | Error</title>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Beasts&display=swap" rel="stylesheet">
    <!-- AOS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <style>
        body { margin:0; padding:0; overflow:hidden; font-family:'Rubik Beasts', cursive; color:#fff; }
        /* Full-screen error backdrop */
        #bg-image { position:fixed; top:0; left:0; width:100vw; height:100vh;
            background:url('https://w0.peakpx.com/wallpaper/553/835/HD-wallpaper-t-rex-vlad-konstantinov-horror-nice-fantasy-paleontology-tyrannosaurus-rex-reptile-leg-tooth-black-predator-demon-cool-screaming-awesome-great-tyrannosaur-evil-animal-t-rex-darkness.jpg') no-repeat center center;
            background-size:cover; z-index:-2; filter: brightness(0.4);
        }
        /* Blood splatter overlay */
        #blood-overlay { position:fixed; top:0; left:0; width:100%; height:100%;
            background:url('https://static.vecteezy.com/system/resources/thumbnails/033/172/372/small_2x/horror-bloody-scary-collection-of-bloodstain-free-png.png') no-repeat center center;
            background-size:cover; opacity:0.3; z-index:-1;
        }
        .error-container {
            position: absolute;
            top: 50%;
            /* shift back by half its own width & height */
            transform: translate(-50%, -50%);
            width: 100%;
            text-align: center;
            animation: shake 0.8s infinite alternate;
        }

        .error-container h1 {
            font-size: 8rem;
            margin: 0;
            color: #ff0000;
            text-shadow: 2px 2px 10px #000;
        }

        .error-container p {
            font-size: 1.5rem;
            margin: 1rem 0 0;
            color: #ffd700;
            text-shadow: 1px 1px 5px #000;
        }
        @keyframes shake {
            0% { transform: translate(-2px, -40%) rotate(-1deg); }
            100% { transform: translate(2px, -40%) rotate(1deg); }
        }
    </style>
</head>
<body>
<div id="bg-image"></div>
<div id="blood-overlay"></div>

<div class="error-container" data-aos="flip-left">
    <h1>${requestScope['jakarta.servlet.error.status_code']}</h1>
    <p>Oops! ${requestScope['jakarta.servlet.error.message']}</p>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>AOS.init({ duration:1000, once:true });</script>
</body>
</html>

