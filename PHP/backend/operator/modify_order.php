<?php
$title = 'Client Account';
require_once "../includes/header_for_accounts.php";
require_once("../server/connection.php");

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



//UPDATE `orders` SET `name`=?, `phone_number`?, `address`=?, `weight`=?, `content`=?, `standard/express`=?, `cash/account_reimbursement`=?, `amount`?, `area`=?, `status`=?, `delivery_date`=?, `delivery_hour`=? where AWB=$info;


