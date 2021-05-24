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
                <input type="text" placeholder="CASH/ACCOUNT REIMBURSEMENT " id="reimbursement" name="reimbursement"><br>
                <div id="submit-button">
                    <a class="button" onclick="addOrder()">Submit</a>
                </div>
            </form>
            <div id="modify-button">
                <a class="button">Modify Order</a>
            </div>
        </div>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>
<script>
    function addOrder(){
        var xhttp = new XMLHttpRequest();
        const name = document.getElementById('name').value;
        const phone = document.getElementById('phone').value;
        const adress = document.getElementById('adress').value;
        const weight = document.getElementById('weight').value;
        const content = document.getElementById('content').value;
        const type = document.getElementById('type').value;
        const reimbursement = document.getElementById('reimbursement').value;

        xhttp.open("POST", "../Database/add_order.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('$name=' + name + '&phone=' + phone + '&adress=' + adress + '&weight=' + weight + '$content=' + content + '$type=' + type + '$reimbursement=' + reimbursement);
    }
</script>
