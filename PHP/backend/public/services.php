<?php
$title = 'Services';
include('../includes/header.php');
include('../server/connection.php');

?>

<div class="middle-box">
    <div class="starter">
        <p id="title">Domestic delivery</p>
        <div class="grid-box">
            <div class="text-box">
                <p><strong>Standard</strong></p>
                <p>Collection, sorting, transport and delivery of envelopes (max 500 grams) and parcels in a minimum term of one and maximum 3 working days.</p>
                <p class="included-services">Check on delivery | Return of documents | Saturday delivery | Insurance | Collector account reimbursement | Cash reimbursement</p>
            </div>
            <div class="text-box">
                <p><strong>Express</strong></p>
                <p>Collection, sorting, transport and delivery of envelopes (max 500 grams) and parcels (max 10 kg) in a maximum term of 1h, 2h, 4h or 6h.</p>
                <p class="included-services">Check on delivery | Return of documents | Saturday delivery | Insurance | Collector account reimbursement | Cash reimbursement</p>
            </div>
        </div>
    </div>
    <div class="starter">
        <p id="title">Collector account reimbursement</p>
        <div class="text-box">
            <p>This service implies the collection, sorting, transport and delivery of parcels with reimbursement in the collector account, in a minimum term of one and maximum 3 working days from the pick-up moment and transfer of reimbursements in the account of the sender, in an average term of 2 working days from the delivery.</p>
        </div>
    </div>
    <div class="starter">
        <p id="title">Cash reimbursement</p>
        <div class="text-box">
            <p>This service implies the collection, sorting, transport and delivery of parcels with cash reimbursement, in a minimum term of one and maximum 3 working days from the pick-up moment and the delivery of the cash reimbursement by envelope to the sender, in an average term of 2 working days from the delivery.</p>
        </div>
    </div>
    <div class="starter">
        <p id="title">
            Packaging rules
        </p>
        <table id="package-rules">
            <tr>
                <th>Type of product</th>
                <th>Suitable packaging</th>
            </tr>

            <tr>
                <td>Glass, windshields, glass bottles with liquids</td>
                <td>Wood packaging filled with polystyrene</td>
            </tr>

            <tr>
                <td>Cosmetics</td>
                <td>Multilayer carton filled with polystyrene and sealed with bubble wrap</td>
            </tr>

            <tr>
                <td>Paintings and Engravings</td>
                <td>Wood packaging filled with polystyrene</td>
            </tr>

            <tr>
                <td>Auto parts, appliances</td>
                <td>Pressed cardboard filled with polystyrene</td>
            </tr>

            <tr>
                <td>Disk, Tapes, CD's</td>
                <td>Cardboard or plastic filled with bubble wrap</td>
            </tr>

            <tr>
                <td>Furniture, musical intruments, toys</td>
                <td>Pressed cardboard filled with polystyrene sealed with protective plastic wrap</td>
            </tr>

            <tr>
                <td>Electronics</td>
                <td>Multilayer carton filled with polystyrene and sealed with bubble wrap</td>
            </tr>

            <tr>
                <td>Refrigerator, washing machine, stove</td>
                <td>Wood packaging filled with polystyrene</td>
            </tr>
        </table>
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
            <label for="uname"><b>Username</b></label>
            <input type="text" name="username" placeholder="Enter Username" required>
            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required>
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
            <button type="submit" name="signup" onclick="attention()">Sign up</button>

        </div>
    </form>
</div>
<?php
    require_once '../includes/footer.php';
?>
</body>
</html>