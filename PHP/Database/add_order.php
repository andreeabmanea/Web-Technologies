<?php
require_once("../Database/server.php");
global $mysql;
$name = "";
$phone = "";
$address = "";
$weight = "";
$content = "";
$type = "";
$reimbursement = "";
$amount = "";
$accountInfo = "";
$ddate = "";
$hour = "";
$area = "";
$status= " ";
$rawb = rand(1000000000000,9999999999999);
$info_id=null;

if (isset($_POST['name']))
    $name = $_POST['name'];

if (isset($_POST['phone']))
    $phone = $_POST['phone'];

if (isset($_POST['adress']))
    $address = $_POST['adress'];

if (isset($_POST['weight']))
    $weight = $_POST['weight'];

if (isset($_POST['content']))
    $content = $_POST['content'];

if (isset($_POST['type']))
    $type = $_POST['type'];

if (isset($_POST['reimbursement']))
    $reimbursement = $_POST['reimbursement'];

if (isset($_POST['amount']))
    $amount = $_POST['amount'];

if (isset($_POST['area']))
    $area = $_POST['area'];

if (isset($_POST['status']))
    $status = $_POST['status'];

if (isset($_POST['ddate']))
    $ddate = $_POST['ddate'];

if (isset($_POST['hour']))
    $hour = $_POST['hour'];

if (isset($_POST['accountInfo']))
    $accountInfo = $_POST['accountInfo'];


$stmt_order = $mysql->prepare("SELECT id_client FROM users WHERE phone_number=$accountInfo or email=$accountInfo or username=$accountInfo");
$stmt_order->execute();
$result_id = $stmt_order->get_result();
$info_order = $result_id->fetch_assoc();
$stmt_order->close();

if($info_order==FALSE){
    $info_order=null;
}
// inserting new order
$insert = "insert into orders ($info_id, $name, $phone, $address, $weight, $content, $type, $reimbursement, $amount, $area, $status, $ddate, $hour, $rawb, $result_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
if ($stmt = $mysql->prepare($insert)) {
    $stmt->bind_param('isisisssissiiii', $info_id['id'], $name, $phone, $adress, $weight, $content, $type, $reimbursement, $area, $status, $ddate, $hour, $rawb, $result_id);
    $stmt->execute();
    $stmt->close();
}
