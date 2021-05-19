<?php
require_once("../Database/server.php");

global $mysql;
$awb = "";
$damage = "";
$something = "";
$comment = "";

if (isset($_POST['awb']))
    $awb = $_POST['awb'];

if (isset($_POST['damage']))
    $damage = $_POST['damage'];

if (isset($_POST['something']))
    $something = $_POST['something'];

if (isset($_POST['comment']))
    $comment = $_POST['comment'];

// get id of order
if ($stmt_id = $mysql->prepare("SELECT id FROM orders WHERE awb = ?")) {
    $stmt_id->bind_param('s', $awb);
    $stmt_id->execute();
    $result_id = $stmt_id->get_result();
    $info_id = $result_id->fetch_assoc();
    $stmt_id->close();
}
// insert new parcel report
if ($stmt = $mysql->prepare("INSERT INTO `reports` (`id_order`, `damage`, `other_content`, `comment`) VALUES (?, ?, ?, ?);")) {
    $stmt->bind_param('isss', $info_id['id'], $damage, $something, $comment);
    $stmt->execute();
    $stmt->close();
}