<?php
require_once("../Database/server.php");

global $mysql;
$awb = "";
$new = "";

if (isset($_POST['fawb']))
    $awb = $_POST['fawb'];

if (isset($_POST['new-hour']))
    $new = $_POST['new-hour'];

// get id of order
if ($stmt_id = $mysql->prepare("SELECT id FROM orders WHERE awb = ?")) {
    $stmt_id->bind_param('s', $awb);
    $stmt_id->execute();
    $result_id = $stmt_id->get_result();
    $info_id = $result_id->fetch_assoc();
}
// get initial hour of order
if ($stmt_hour = $mysql->prepare("SELECT delivery_hour FROM orders WHERE awb = ?")) {
    $stmt_hour->bind_param('s', $awb);
    $stmt_hour->execute();
    $result_hour = $stmt_hour->get_result();
    $info_hour = $result_hour->fetch_assoc();
}
// insert new hour report
if ($stmt = $mysql->prepare("INSERT INTO `hour_change` (`id`, `id_order`, `initial_hour`, `new_hour`) VALUES (NULL, ?, ?, ?);")) {
    $stmt->bind_param('sss', $info_id['id'], $info_hour['delivery_hour'], $new);
    $stmt->execute();
}