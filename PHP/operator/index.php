<?php
$title = 'Operator Account';
require_once '../includes/header_for_accounts.php';
include("../Database/display_operator_reports.php");
if (isset($_GET['logout'])) {
    session_destroy();
    unset($_SESSION['username']);
    header("location: ../public/index.php");
}
?>
<div class="middle-box">
    <div class="starter">
        <p id="title">Hello, <?php echo $_SESSION['username'];?>. Here are today's reports:</p>
        <table id="operator-reports">
            <?php display_operator_reports($_SESSION['username'])?>
        </table>
    </div>
    <div class="starter">
        <div id="plan-order">
            <p id="title">Place an order:</p>
            <form class="order-form">
                <input type="text" placeholder="NAME" id="name" name="name"><br>
                <input type="text" placeholder="PHONE NUMBER" id="phone" name="phone"><br>
                <input type="text" placeholder="ADDRESS" id="address" name="address"><br>
                <input type="text" placeholder="WEIGHT" id="weight" name="weight"><br>
                <input type="text" placeholder="CONTENT" id="content" name="content"><br>
                <input type="text" placeholder="STANDARD/EXPRESS" id="type" name="type"><br>
                <input type="text" placeholder="CASH/ACCOUNT REIMBURSEMENT" id="reimbursement" name="reimbursement"><br>
                <div id="submit-button">
                    <input type="submit" value="Submit" class="button">
                </div>
            </form>
            <div id="modify-button">
                <input type="submit" value="Modify Order" class="button">
            </div>
        </div>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>
