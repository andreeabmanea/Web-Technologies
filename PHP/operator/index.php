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
                <input type="text" placeholder="AMOUNT" id="AMOUNT" name="AMOUNT"><br>
                <input type="text" placeholder="PHONE NUMBER/ACCOUNT/EMAIL" id="accountinfo" name="accountinfo"><br>
                <div id="hourselector" style="margin-left: auto">
                    <p id="mini-title" STYLE="text-align: left">SELECT DELIVERY HOUR</p>
                <select name="shour" class="selector" id="hour">
                    <option value="9:00-11:00">09:00-11:00</option>
                    <option value="11:00-13:00">11:00-13:00</option>
                    <option value="13:00-15:00">13:00-15:00</option>
                    <option value="15:00-17:00">15:00-17:00</option>
                </select>
                    <p id="mini-title" STYLE="text-align: left">SELECT AREA</p>
                <select name="sarea" class="selector" id="area">
                    <option value="Tatarasi">Tatarasi</option>
                    <option value="Podu-Ros">Podu-Ros</option>
                    <option value="Pacurari">Pacurari</option>
                    <option value="Tudor-Vladimirescu">Tudor-Vladimirescu</option>
                </select>
                    <p id="mini-title" STYLE="text-align: left">SELECT DATE</p>
                    <input type="date" id="ddate" name="delivery-date"
                           min="2021-05-25" max="2022-01-01">
                </div>
                <div id="submit-button">
                    <button onclick=addOrder() type="submit" class="button">SUBMIT</button>
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

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {

            }
        };
        const name = document.getElementById('name').value;
        const phone = document.getElementById('phone').value;
        const address = document.getElementById('address').value;
        const weight = document.getElementById('weight').value;
        const content = document.getElementById('content').value;
        const type = document.getElementById('type').value;
        const reimbursement = document.getElementById('reimbursement').value;
        const amount = document.getElementById('amount').value;
        const accountInfo = document.getElementById('accountinfo').value;
        const ddate = document.getElementById('date').value;
        const hour = document.getElementById('hour').value;
        const area = document.getElementById('area').value;
        define(status,"deposited");
        xhttp.open("POST", "../Database/add_order.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('$name=' + name + '&phone=' + phone + '&address=' + address + '&weight=' + weight + '$content=' + content + '$type=' + type + '$reimbursement=' + reimbursement + '$amount=' + amount + '$area=' + area + '$status=' + status + '$ddate=' + ddate + '$hour=' + hour  + '$accountInfo=' + accountInfo);
    }
</script>
