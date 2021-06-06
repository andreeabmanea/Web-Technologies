<?php
require_once("../server/connection.php");
global $mysql;

if (isset($_POST['awb']))
    $awb = $_POST['awb'];

$stmt_order = $mysql->prepare("select * from orders where awb = ?");
$stmt_order->bind_param('s', $getAWB);
$stmt_order->execute();
$result_order = $stmt_order->get_result();
$info_order = $result_order->fetch_assoc();

echo
    '
    <table>
        <tr>
            <td style = "padding:10px">NAME</td>
            <td style = "padding:10px">' . $info_order['name'] . '</td>
        </tr>
        <tr>
            <td style = "padding:2px">PHONE</td>
        </tr>
        <tr>
            <td style = "padding:2px">ADDRESS</td>
        </tr>
        <tr>
            <td style = "padding:2px">WEIGHT</td>
        </tr>
        <tr>
            <td style = "padding:2px">CONTENT</td>
        </tr>
        <tr>
            <td style = "padding:2px">STANDARD/EXPRESS</td>
        </tr>
        <tr>
            <td style = "padding:2px">CASH/ACCOUNT REIMBURSEMENT</td>
        </tr>
        <tr>
            <td style = "padding:2px">AMOUNT</td>
        </tr>
        <tr>
            <td style = "padding:2px">STATUS</td>
        </tr>
        <tr>
            <td style = "padding:10px">AREA</td>
        </tr>
        <tr>
            <td style = "padding:10px">DELIVERY DATE</td>
        </tr>
        <tr>
            <td style = "padding:10px">DELIERY HOUR</td>
        </tr>';