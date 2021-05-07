<?php
$title = 'Courier Account';
include("../database/server.php");
require_once "../includes/header_for_accounts.php";
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
            <input type="text" placeholder="AWB" id="fawb" name="fawb">
            <a class="button" onclick="document.getElementById('mark-as-done').style.display='block'">Mark as done</a>
            <a class="button" onclick="document.getElementById('ask-for-support').style.display='block'">Ask for support</a>
        </div>
    </div>
</div>

<div id="mark-as-done" class="modal">
    <div class="modal-content">
        <p id="title">Enter client's signature:</p>
        <div class="text-box"></div>
        <p id="title">Are you sure you want to report delivery as done?</p>
        <nav class="container">
            <a class="button" style="margin-left:44%" onclick="document.getElementById('mark-as-done').style.display='none'" class="close" title="Close">Confirm</a>
        </nav>
    </div>
</div>

<div id="ask-for-support" class="modal">
    <div class="modal-content">
        <p id="title">Enter your request:</p>
        <div class="container">
            <input type="text" placeholder="e.g. postpone delivery due to bad weather, report damage within transportation">
            <a class="button" style="margin-left:44%" onclick="document.getElementById('ask-for-support').style.display='none'" class="close" title="Close">Confirm</a>
        </div>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>
