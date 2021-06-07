<?php
$title = 'Map';
include('../includes/header.php');
include('../server/login.php');
include('../server/sign_up.php');
?>
<p class="title">Where we deliver?</p>
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

<!-- Login option -->
<div id="login-account" class="modal">
    <form class="modal-content" method="post">
        <div class="imgcontainer">
            <span onclick="document.getElementById('login-account').style.display='none'" class="close" title="Close">&times;</span>
            <img src="../../resources/User.png" alt="Avatar" class="avatar">
        </div>
        <div class="container">
            <label for="username"><b>Username</b></label>
            <input type="text" id="username" name="username" placeholder="Enter Username" required>
            <label for="psw1"><b>Password</b></label>
            <input type="password" id="psw1" placeholder="Enter Password" name="password" required>
            <button type="submit" name="login" >Login</button>
            <label>
                <input type="checkbox" checked="checked" name="remember_me" id="remember_me"> Remember me
            </label>
        </div>
    </form>
</div>

<!-- Sign-up option -->
<div id="sign-up" class="modal">
    <form class="modal-content" method="post" action="../server/sign_up.php">
        <div class="imgcontainer">
            <span onclick="document.getElementById('sign-up').style.display='none'" class="close" title="Close">&times;</span>
        </div>

        <div class="container">
            <h1 class="sign-up-text">Create a customer account.</h1>
            <p class="sign-up-text">Please fill in your information.</p>

            <label for="first_name"><b>First name</b></label>
            <input type="text" placeholder="First name" id="first_name" name="first-name" required>

            <label for="last_name"><b>Last name</b></label>
            <input type="text" placeholder="Last name" id="last_name" name="last-name" required>

            <label for="uname"><b>Username</b></label>
            <input type="text" placeholder="Username" id="uname" name="username" required>

            <label for="phone-number"><b>Phone number</b></label>
            <input type="text" placeholder="Phone number" id="phone-number" name="phone-number" required>

            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" id="email" name="email" required>

            <label for="psw2"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" id="psw2" name="psw" required>

            <label for="psw-repeat"><b>Repeat Password</b></label>
            <input type="password" placeholder="Repeat Password" id="psw-repeat" name="psw-repeat" required>

            <p class="sign-up-text">By creating an account you agree to our Terms & Privacy.</p>
            <button type="submit" name="signup" onclick="attention()">Sign up</button>

        </div>
    </form>
</div>
<?php
require_once '../includes/footer.php';
?>
</body>