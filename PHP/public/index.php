<?php
$title = 'Home';
include('../includes/header.php');
include('../database/server.php');
require('../public/errors.php');
?>
<div class="middle-box">
    <div class="starter">
        <p id="title">About us</p>
        <div class="grid-box">
            <div class="text-box">Our company is a premium, all-inclusive service which collects and delivers your parcels in the shortest possible time frame.
                <p>We define ourselves by the motto “Always on time. Everytime.”</p></div>
            <div class="text-box">Founded in 2015, we built our company through responsibility and involvement.
                <p>The needs of our customers always come first and we made it our main goal to satisfy them.</p></div>
            <div class="text-box"> People placing an order with our team in can rest assured that their deliveries are not only made on time but arrive safely.
                <p>Our delivery drivers are equipped with GPS which allows for real time tracking.</p></div>
            <div class="text-box"> Our services are open 24 hours a day 7 days a week. We have sedans, cargo vans and box trucks in our fleet of vehicles.
                <p>This allows us to quickly deliver packages that can weigh up to 5,000 kg.</p></div>
        </div>
    </div>

    <div class="starter">
        <p id="title">FAQ</p>
        <div class="grid-box">
            <div class="text-box">
                <strong>How should I pack? Do you offer packaging?</strong>
                <p>In order for your package to be adequately protected during transport, it is very important that you follow the packaging recommendations <a href="services.php#package-rules">(see here)</a>.</p>
            </div>
            <div class="text-box">
                <strong>How could I check the status of a shipment?</strong>
                <p>You need to login into your client account and access the AWB Tracking section available there or you can ask for further information at jmv@courieriasi.ro.</p>
            </div>
            <div class="text-box">
                <strong>I wish to change the delivery address. Could I still receive my shipment today?</strong>
                <p>The delivery address can be changed, but rerouting towards a new address is considered a new shipment with an average term of 24 hours. So, it will not be delivered in the same day.</p>
            </div>
            <div class="text-box">
                <strong>I received an AWB number, but I cannot find it in your system. Why is that?</strong>
                <p>Your parcel was not picked up by the courier and the AWB is not in our database because it was not scanned yet. You will find the shipment in the system once the parcel is picked up from the sender.</p>
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
            <input type="text" name="username" placeholder="Enter Username" required>
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
    <form class="modal-content" method="post" action="../Database/server.php">
        <div class="imgcontainer">
            <span onclick="document.getElementById('sign-up').style.display='none'" class="close" title="Close">&times;</span>
        </div>

        <div class="container">
            <h1 class="sign-up-text">Create a customer account.</h1>
            <p class="sign-up-text">Please fill in your information.</p>

            <label for="first_name"><b>First name</b></label>
            <input type="text" placeholder="First name" name="first-name" required>

            <label for="last_name"><b>Last name</b></label>
            <input type="text" placeholder="Last name" name="last-name" required>

            <label for="username"><b>Username</b></label>
            <input type="text" placeholder="Username" name="username" required>

            <label for="phone-number"><b>Phone number</b></label>
            <input type="text" placeholder="Phone number" name="phone-number" required>

            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>

            <label for="psw-repeat"><b>Repeat Password</b></label>
            <input type="password" placeholder="Repeat Password" name="psw-repeat" required>

            <p class="sign-up-text">By creating an account you agree to our Terms & Privacy.</p>
            <button type="submit" name="signup">Sign up</button>

        </div>
    </form>
</div>
<?php
require_once '../includes/footer.php';
?>
</body>
</html>






