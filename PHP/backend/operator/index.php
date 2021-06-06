<?php
$title = 'Operator Account';
require_once '../includes/header_for_accounts.php';
include("display_operator_reports.php");
include "../server/login.php";
include "../server/sign_up.php";

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
            <p id="title">WHAT DO YOU WANT TO DO?</p>
            <div id="add-order" style="text-align: center;">
                <a class="button" onclick="displayAddOrder()" style="width: 140px">PLACE ORDER</a>
                <a class="button" onclick="displayModifyOrder()" style="width: 140px">MODIFY ORDER</a>
            </div>
        </div>
    </div>
    <div id="new-order" class="modal">
        <div class="modal-content" style="background-color: rgba(235, 228, 216, 1);border-color:  #3c887e;border-style: solid;border-radius: 10px;padding: 4%;margin-bottom: 4%;">
            <p id="title">Fill in details about the new order:</p>
            <form class="order-form">
                <input type="text" placeholder="NAME" id="name" name="name"><br>
                <input type="text" placeholder="PHONE NUMBER" id="phone_number" name="phone"><br>
                <input type="text" placeholder="ADDRESS" id="address" name="address"><br>
                <input type="text" placeholder="WEIGHT" id="weight" name="weight"><br>
                <input type="text" placeholder="CONTENT" id="content" name="content"><br>
                <input type="text" placeholder="STANDARD/EXPRESS" id="type" name="type"><br>
                <input type="text" placeholder="CASH/ACCOUNT REIMBURSEMENT" id="reimbursement" name="reimbursement"><br>
                <input type="text" placeholder="AMOUNT" id="amount" name="amount"><br>
                <input type="text" placeholder="PHONE NUMBER/ACCOUNT/EMAIL" id="accountInfo" name="accountinfo"><br>
                <div id="hourselector" style="margin-left: auto">
                    <p id="mini-title" STYLE="text-align: left">SELECT DELIVERY HOUR</p>
                    <select name="shour" class="selector" id="dhour">
                        <option value="9:00-11:00">09:00-11:00</option>
                        <option value="11:00-13:00">11:00-13:00</option>
                        <option value="13:00-15:00">13:00-15:00</option>
                        <option value="15:00-17:00">15:00-17:00</option>
                    </select>
                    <p id="mini-title" STYLE="text-align: left">SELECT AREA</p>
                    <select name="sarea" class="selector" id="darea">
                        <option value="Tatarasi">Tatarasi</option>
                        <option value="Podu-Ros">Podu-Ros</option>
                        <option value="Pacurari">Pacurari</option>
                        <option value="Tudor-Vladimirescu">Tudor-Vladimirescu</option>
                    </select>
                    <p id="mini-title" STYLE="text-align: left">SELECT DATE</p>
                    <input type="date" id="ddate" name="delivery-date"
                           min="2021-05-25" max="2022-01-01">
                </div>
                <a class="button" onclick="Add()" style="margin-left: 45%">Submit</a>
            </form>
        </div>
    </div>
    <div id="modify-order" class="modal">
        <div class="modal-content" style="background-color: rgba(235, 228, 216, 1);border-color:  #3c887e;border-style: solid;border-radius: 10px;padding: 4%;margin-bottom: 4%;">
            <p id="title">Please enter AWB:</p>
            <form class="modify-form">
                <input type="text" placeholder="" id="getAWB" name="getAWB"><br>
                <a class="button" onclick="getInfoSubmit()" style="margin-left: 45%">Submit</a>
            </form>
        </div>
    </div>
</div>
+   <div id="extend-form-left" class="modal">
    <div class="modal-content" style="background-color: rgba(235, 228, 216, 1);border-color:  #3c887e;border-style: solid;border-radius: 10px;padding: 4%;margin-bottom: 4%; width: 40%; float:right">
        <table id="showInfo" style="display:inline-block; float: right">
        </table>
    </div>
</div>
<div id="extend-form" class="modal">
    <div class="modal-content" style="background-color: rgba(235, 228, 216, 1);border-color:  #3c887e;border-style: solid;border-radius: 10px;padding: 4%;margin-bottom: 4%; width: 40%; float:left">
        <p id="title">Edit info</p>
        <form class="modify-extend-form">
            <input type="text" placeholder="NAME" id="mname" name="name"><br>
            <input type="text" placeholder="PHONE NUMBER" id="mphone_number" name="phone"><br>
            <input type="text" placeholder="ADDRESS" id="maddress" name="address"><br>
            <input type="text" placeholder="WEIGHT" id="mweight" name="weight"><br>
            <input type="text" placeholder="CONTENT" id="mcontent" name="content"><br>
            <input type="text" placeholder="STANDARD/EXPRESS" id="mtype" name="type"><br>
            <input type="text" placeholder="CASH/ACCOUNT REIMBURSEMENT" id="mreimbursement" name="reimbursement"><br>
            <input type="text" placeholder="AMOUNT" id="mamount" name="amount"><br>
            <div id="hourselector" style="margin-left: auto">
                <p id="mini-title" STYLE="text-align: left">SELECT DELIVERY HOUR</p>
                <select name="dhour" class="selector" id="mdhour">
                    <option value="9:00-11:00">09:00-11:00</option>
                    <option value="11:00-13:00">11:00-13:00</option>
                    <option value="13:00-15:00">13:00-15:00</option>
                    <option value="15:00-17:00">15:00-17:00</option>
                </select>
                <p id="mini-title" STYLE="text-align: left">SELECT AREA</p>
                <select name="darea" class="selector" id="mdarea">
                    <option value="Tatarasi">Tatarasi</option>
                    <option value="Podu-Ros">Podu-Ros</option>
                    <option value="Pacurari">Pacurari</option>
                    <option value="Tudor-Vladimirescu">Tudor-Vladimirescu</option>
                </select>
                <p id="mini-title" STYLE="text-align:left">SELECT DATE</p>
                <input type="date" id="mddate" name="ddate"
                       min="2021-05-25" max="2022-01-01">
        </form>
        <a class="button" onclick="Modify()" style="margin-left: 25%">Submit</a>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>
<script>
    function displayAddOrder(){
        document.getElementById('new-order').style.display = 'block';
    }

    function displayModifyOrder(){
        const awb = document.getElementById('getAWB').value;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log('succes-awb-sent')
                console.log(awb);
            }
        };
        xhttp.open("POST", "display_existing_order.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('awb=' + awb);
        document.getElementById('modify-order').style.display = 'block';
    }

    function getInfo(){
        document.getElementById('extend-form-left').style.display = 'block';
        document.getElementById('extend-form').style.display = 'block';
        var xhttp;
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200){
                console.log(this.responseText);
                document.getElementById("showInfo").innerHTML = this.responseText;
            }
        }
        xhttp.open("GET", "display_existing_order.php", true);
        xhttp.send();
    }

    function modifyOrder(){
        var xhttp = new XMLHttpRequest();

        const toModify = document.getElementById('getAWB').value;
        const name = document.getElementById('mname').value;
        const phone_number = document.getElementById('mphone_number').value;
        const address = document.getElementById('maddress').value;
        const weight = document.getElementById('mweight').value;
        const content = document.getElementById('mcontent').value;
        const type = document.getElementById('mtype').value;
        const reimbursement = document.getElementById('mreimbursement').value;
        const amount = document.getElementById('mamount').value;
        const ddate = document.getElementById('mddate').value;
        const dhour = document.getElementById('mdhour').value;
        const darea = document.getElementById('mdarea').value;

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log("succes-modify");
            }
        };
        xhttp.open("POST", "modify_order.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('toModify=' + toModify + '&name=' + name + '&phone_number=' + phone_number + '&address=' + address + '&weight=' + weight + '&content=' + content + '&type=' + type + '&reimbursement=' + reimbursement + '&amount=' + amount + '&ddate=' + ddate + '&dhour=' + dhour + '&darea=' + darea);
    }

    function sendMailModify(){
        var xhttp = new XMLHttpRequest();

        const name = document.getElementById('mname').value;
        const phone_number = document.getElementById('mphone_number').value;
        const ddate = document.getElementById('mddate').value;
        const dhour = document.getElementById('mdhour').value;

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log("succes-mail-modify");
                console.log(name);
            }
        };
        xhttp.open("POST", "../mailer/updateOrderMail.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('name=' + name + '&phone_number=' + phone_number + '&ddate=' + ddate + '&dhour=' + dhour);
    }

    function addOrder(){
        var xhttp = new XMLHttpRequest();

        const name = document.getElementById('name').value;
        const phone_number = document.getElementById('phone_number').value;
        const address = document.getElementById('address').value;
        const weight = document.getElementById('weight').value;
        const content = document.getElementById('content').value;
        const type = document.getElementById('type').value;
        const reimbursement = document.getElementById('reimbursement').value;
        const amount = document.getElementById('amount').value;
        const accountInfo = document.getElementById('accountInfo').value;
        const ddate = document.getElementById('ddate').value;
        const dhour = document.getElementById('dhour').value;
        const darea = document.getElementById('darea').value;

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log("succes-add");
            }
        };
        xhttp.open("POST", "add_order.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('name=' + name + '&phone_number=' + phone_number + '&address=' + address + '&weight=' + weight + '&content=' + content + '&type=' + type + '&reimbursement=' + reimbursement + '&amount=' + amount + '&accountInfo=' + accountInfo + '&ddate=' + ddate + '&dhour=' + dhour + '&darea=' + darea);
    }

    function sendMailAdd(){
        var xhttp = new XMLHttpRequest();

        const name = document.getElementById('name').value;
        const phone_number = document.getElementById('phone_number').value;
        const ddate = document.getElementById('ddate').value;
        const dhour = document.getElementById('dhour').value;

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log("succes-mail-add");
            }
        };
        xhttp.open("POST", "../mailer/newOrderMail.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('name=' + name + '&phone_number=' + phone_number + '&ddate=' + ddate + '&dhour=' + dhour);
    }

    function getInfoSubmit(){
        displayModifyOrder();
        getInfo();
    }

    function Modify(){
        modifyOrder()
        sendMailModify();
    }

    function Add(){
        addOrder();
        sendMailAdd();
    }
</script>
