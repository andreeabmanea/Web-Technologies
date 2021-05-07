<?php
$title = 'Operator Account';
require_once '../includes/header_for_accounts.php';
?>
<div class="middle-box">
    <div class="starter">
        <p id="title">Here are today's reports:</p>
        <table class="operator-reports">
            <tr>
                <th>AWB</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>Contact Number</th>
                <th>Is the package damaged?</th>
                <th>Did you get something other than what you ordered?</th>
                <th>Other comments</th>
            </tr>
            <tr>
                <td>2402002350971</td>
                <td>Ioana Ursachi</td>
                <td>Soseaua Pacurari 13, 700535, Bl. 541</td>
                <td>0732398476</td>
                <td>YES</td>
                <td>-</td>
                <td>I did not receive the package in a decent shape so that is why i filled this report.</td>
            </tr>
            <tr>
                <td>2403212350971</td>
                <td>Costin Pelescu</td>
                <td>Strada Canta 41, 700432</td>
                <td>0745362712</td>
                <td>-</td>
                <td>YES</td>
                <td>I received a package which was not for me.</td>
            </tr>
        </table>
    </div>
    <div class="starter">
        <div id="plan-order">
            <p id="title">Place an order:</p>
            <form id="order-form">
                <input type="text" placeholder="NAME" id="name" name="name"><br>
                <input type="text" placeholder="PHONE NUMBER" id="phone" name="phone"><br>
                <input type="text" placeholder="ADDRESS" id="address" name="address"><br>
                <input type="text" placeholder="WEIGHT" id="weight" name="weight"><br>
                <input type="text" placeholder="CONTENT" id="content" name="content"><br>
                <input type="text" placeholder="STANDARD/EXPRESS" id="type" name="type"><br>
                <input type="text" placeholder="CASH/ACCOUNT REIMBURSEMENT" id="reimbursement" name="reimbursement"><br>
            </form>
            <div id="submit-button">
                <input type="submit" value="Submit" class="button">
            </div>
        </div>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>
