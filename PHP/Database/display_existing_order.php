<?php
require_once("../Database/server.php");
function display_existing_orders($info){
    global $mysql;
    $stmt_order = $mysql->prepare("SELECT `name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `amount`, `area`, `status`, `delivery_date`, `delivery_hour` from orders WHERE AWB=? OR phone_number=? OR username=?");
    $stmt_order->bind_param('sss', $info,$info, $info);
    $stmt_order->execute();
    $stmt_order->bind_result($name,$phone_number, $address, $weight, $content, $type, $cash_account, $amount, $area, $ddate, $dhour);
    echo
    '<th>
            <tr style = "padding:10px">NAME</tr>
            <tr style = "padding:10px">PHONE</tr>
            <tr style = "padding:10px">ADDRESS</tr>
            <tr style = "padding:10px">WEIGHT</tr>
            <tr style = "padding:10px">CONTENT</tr>
            <tr style = "padding:10px">STANDARD/EXPRESS</tr>
            <tr style = "padding:10px">CASH/ACCOUNT REIMBURSEMENT</tr>
            <tr style = "padding:10px">AMOUNT</tr>
            <tr style = "padding:10px">AREA</tr>
            <tr style = "padding:10px">DELIVERY DATE</tr>
            <tr style = "padding:10px">DELIERY HOUR</tr>
        </th>';
    while ($stmt_order->fetch()) {
        echo '<td>';
        echo '<tr style = "padding:10px">' . $name . '</tr>';
        echo '<tr style = "padding:10px">' . $phone_number . '</tr>';
        echo '<tr style = "padding:10px">' . $address . '</tr>';
        echo '<tr style = "padding:10px">' . $weight . '</tr>';
        echo '<tr style = "padding:10px">' . $content. '</tr>';
        echo '<tr style = "padding:10px">' . $type . '</tr>';
        echo '<tr style = "padding:10px">' . $cash_account . '</tr>';
        echo '<tr style = "padding:10px">' . $amount . '</tr>';
        echo '<tr style = "padding:10px">' . $area . '</tr>';
        echo '<tr style = "padding:10px">' . $ddate . '</tr>';
        echo '<tr style = "padding:10px">' . $dhour . '</tr>';
        echo '</td>';
    }
}
