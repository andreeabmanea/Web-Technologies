<?php
$title = 'Courier Account';
require_once "../includes/header_for_accounts.php";
include("functions.php");

if (isset($_GET['logout'])) {
    session_destroy();
    unset($_SESSION['username']);
    header("location: ../public/index.php");
}
?>
<div class="middle-box">
    <div class="starter">
        <p id="title">Hello, <?php echo $_SESSION['username'];?>. Here is today's schedule:</p>
        <table id="courier-schedule">
            <?php display_courier_schedule($_SESSION['username'])?>
        </table>
    </div>

    <div class="starter">
        <p id="title">Enter Delivery Number:</p>
        <div class="courier-awb">
            <form method = "post" action="">
            <input type="text" placeholder="AWB" id="fawb" name="fawb">
            <a class="button" onclick="markAsDoneSubmit()" name = "delivery_done">Mark as done</a>
            <a class="button" onclick="document.getElementById('ask-for-support').style.display='block'">Ask for support</a>
            </form>
        </div>
    </div>
</div>

<div id="ask-for-support" class="modal">
    <div class="modal-content">
        <p id="title">Enter your request:</p>
        <div class="container">
            <input type="text" name = "courier-request" id = "courier-request" placeholder="e.g. postpone delivery due to bad weather, report damage within transportation">
            <a class="button" style="margin-left:44%" onclick="askForSupport(); document.getElementById('ask-for-support').style.display='none';" class="close" title="Close">Confirm</a>
        </div>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>
<script>
    function markAsDone() {
        var awb = document.getElementById('fawb').value;
        console.log(awb);
        var xhttp;
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
               //console.log(this.responseText);
            }
        };
        xhttp.open("POST", "mark_as_done.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('fawb='+awb);
    }

    function updateCourierSchedule() {
        var xhttp;
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200){
                console.log(this.responseText);
                document.getElementById("courier-schedule").innerHTML = this.responseText;
            }
        }
        xhttp.open("GET", "update_courier_schedule.php", true);
        xhttp.send();
    }
    function markAsDoneMail(){
        var xhttp = new XMLHttpRequest();

        var awb = document.getElementById('fawb').value;

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log("succes-mail-mark-as-done");
            }
        };
        xhttp.open("POST", "../mailer/shippedOrderMail.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('fawb=' + awb);
    }
    function markAsDoneSubmit() {
        markAsDone();
        markAsDoneMail();
        updateCourierSchedule();
    }

    function askForSupport() {
        var request = document.getElementById('courier-request').value;
        var awb = document.getElementById('fawb').value;
        var xhttp;
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status == 200) {
                //console.log(this.responseText);
                console.log(awb);
            }
        };
        xhttp.open("POST", "ask_for_support.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('fawb='+awb+'&courier-request='+request);
    }
</script>
