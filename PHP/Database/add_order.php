<?php
require_once("../Database/server.php");
global $mysql;

$status= " ";
$rawb = mt_rand(1000000000000,9999999999999);
$info_id=null;


if (isset($_POST['name']))
    $name = $_POST['name'];

if (isset($_POST['phone_number']))
    $phone_number = $_POST['phone_number'];

if (isset($_POST['address']))
    $address = $_POST['address'];

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

if (isset($_POST['accountInfo']))
    $accountInfo = $_POST['accountInfo'];

if (isset($_POST['ddate']))
    $date = $_POST['ddate'];

if (isset($_POST['dhour']))
    $hour = $_POST['dhour'];

if (isset($_POST['darea']))
    $area = $_POST['darea'];


$stmt_order = $mysql->prepare("SELECT id FROM users WHERE phone_number=? or email=? or username=?");
$stmt_order->bind_param('sss', $accountInfo,$accountInfo, $accountInfo);
$stmt_order->execute();
$result_id = $stmt_order->get_result();
$info_order = $result_id->fetch_assoc();
$stmt_order->close();

$insert = "INSERT INTO `orders` (`id`, `name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `amount`, `area`, `status`, `delivery_date`, `delivery_hour`, `AWB`, `id_client`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'deposited', ?, ?, ?, ?)";
if ($stmt = $mysql->prepare($insert)) {
    $stmt->bind_param('sssssssissssi', $name, $phone_number, $address, $weight, $content, $type, $reimbursement, $amount, $area, $date, $hour, $rawb, $info_order['id']);
    $stmt->execute();
    $stmt->close();
}
