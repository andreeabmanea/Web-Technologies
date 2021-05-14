<?php
$title = 'Map';
include('../includes/header.php');
?>
<p id="title">Where we deliver?</p>
<div class="middle-box">
    <div class="starter">
        <div class="mapouter">
            <div class="gmap_canvas">
                <iframe width="800" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=Iasi&t=&z=11&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
                </iframe>
                <a href="https://123movies-to.org">123movies</a>
                <br>
                <style>.mapouter{position:relative;text-align:right;height:500px;width:800px;}</style>
                <a href="https://www.embedgooglemap.net">maps for websites</a>
                <style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:800px;}</style>
            </div>
        </div>
    </div>
</div>

<div id="login-account" class="modal">
    <form class="modal-content" method="post">
        <div class="imgcontainer">
            <span onclick="document.getElementById('login-account').style.display='none'" class="close" title="Close">&times;</span>
            <img src="../resources/User.png" alt="Avatar" class="avatar">
        </div>
        <div class="container">
            <label for="uname"><b>Username</b></label>
            <input type="text" name="username" placeholder="Enter Username">
            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required>
            <button type="submit" name="login">Login</button>
            <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>
        </div>
    </form>
</div>

<div id="sign-up" class="modal">
    <form class="modal-content" method="post">
        <div class="imgcontainer">
            <span onclick="document.getElementById('sign-up').style.display='none'" class="close" title="Close">&times;</span>
        </div>

        <div class="container">
            <h1 class="sign-up-text">Create a customer account.</h1>
            <p class="sign-up-text">Please fill in your information.</p>
            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>

            <label for="psw-repeat"><b>Repeat Password</b></label>
            <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
            <p class="sign-up-text">By creating an account you agree to our Terms & Privacy.</p>
            <button type="submit">Sign up</button>

        </div>
    </form>
</div>
<?php
require_once '../includes/footer.php';
?>
</body>