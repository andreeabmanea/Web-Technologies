<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../public/style.css">
    <title><?php echo $title;?></title>
</head>
<body>
<header role="banner">
    <div class="nav-bar">
        <a class="nav-left button" href="../public/map.php">Map</a>
        <a class="nav-left button" href="../public/services.php">Services</a>
        <a class="nav-right button" onclick="document.getElementById('login-account').style.display='block'">Login</a>
        <a class="nav-right button" onclick="document.getElementById('sign-up').style.display='block'">Sign Up</a>
    </div>
    <div class="logo">
        <a href="../public/index.php">
            <img src="../../resources/Logo.png" width="182" height="82" alt="Logo"/>
        </a>
    </div>
</header>