<?php
require_once("../Database/server.php");

global $mysql;
$awb = "";

if (isset($_POST['fawb']))
    $awb = $_POST['fawb'];

// get id of order
if ($stmt_id = $mysql->prepare("SELECT id FROM orders WHERE awb = ?")) {
    $stmt_id->bind_param('s', $awb);
    $stmt_id->execute();
    $result_id = $stmt_id->get_result();
    $info_id = $result_id->fetch_assoc();
    $stmt_id->close();
}
// insert new parcel cancel report
if ($stmt = $mysql->prepare("INSERT INTO `reports` (`id_order`, `damage`, `other_content`, `comment`) VALUES (?, 'no', 'no', 'I want to cancel it!');")) {
    $stmt->bind_param('i', $info_id['id']);
    $stmt->execute();
    $stmt->close();
}