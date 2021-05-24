<?php
require_once("../Database/server.php");
global $mysql;
$name = "";
$phone = "";
$adress = "";
$weight = "";
$content = "";
$type = "";
$reimbursement = "";

if (isset($_POST['name']))
    $name = $_POST['name'];

if (isset($_POST['phone']))
    $phone = $_POST['phone'];

if (isset($_POST['adress']))
    $adress = $_POST['adress'];

if (isset($_POST['weight']))
    $weight = $_POST['weight'];

if (isset($_POST['content']))
    $content = $_POST['content'];

if (isset($_POST['type']))
    $type = $_POST['type'];

if (isset($_POST['reimbursement']))
    $reimbursement = $_POST['reimbursement'];

// inserting new order
if ($stmt = $mysql->prepare("INSERT INTO `orders` (`name`, `phone`, `adress`, `weight`, `content`, `type`, `reimbursement`) VALUES (?, ?, ?, ?, ?, ?, ?);")) {
    $stmt->bind_param('sisissi', $name, $phone, $adress, $weight, $content, $type, $reimbursement);
    $stmt->execute();
    $stmt->close();
}