<?php
require_once("../Database/server.php");
global $mysql;
if (isset($_POST['fawb']))
    $awb = $_POST['fawb'];
if (isset($_POST['courier-request']))
    $request = $_POST['courier-request'];

$username = $_SESSION['username'];
$stmt_courier = $mysql->prepare("select id from users where username = ?");
$stmt_courier->bind_param('s', $username);
$stmt_courier->execute();
$result_courier = $stmt_courier->get_result();
$info_courier = $result_courier->fetch_assoc();

$stmt_order = $mysql->prepare("select id from orders where awb = ?");
$stmt_order->bind_param('s', $awb);
$stmt_order->execute();
$result_order = $stmt_order->get_result();
$info_order = $result_order->fetch_assoc();


    $insert = "insert into courier_requests (courier_id, order_id, request) values (?, ?, ?)";
    if ($stmt3 = $mysql->prepare($insert)) {
        {
            $stmt3->bind_param('sss', $info_courier['id'], $info_order['id'], $request);
            $stmt3->execute();
        }
    }
