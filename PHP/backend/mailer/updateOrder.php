<?php
$title = 'Client Account';
require_once "../includes/header_for_accounts.php";
require_once("../server/connection.php");
require 'PHPMailerAutoload.php';
require 'credentials.php';

global $mysql;

$mail = new PHPMailer;

if (isset($_POST['name']))
    $name = $_POST['name'];

if (isset($_POST['phone_number']))
    $phone_number = $_POST['phone_number'];

if (isset($_POST['ddate']))
    $date = $_POST['ddate'];

if (isset($_POST['dhour']))
    $hour = $_POST['dhour'];

$stmt_order = $mysql->prepare("select email from users where phone_number=?");
$stmt_order->bind_param('s', $phone_number);
$stmt_order->execute();
$result_id = $stmt_order->get_result();
$info_order = $result_id->fetch_assoc();
$stmt_order->close();

//$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = EMAIL;                 // SMTP username
$mail->Password = PASS;                           // SMTP password
$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 587;                                    // TCP port to connect to

$mail->setFrom(EMAIL, 'localhost    ');
$mail->addAddress($info_order, $name);     // Add a recipient
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'Order Update';
$mail->Body    = ' Your order has been updated!</b>';
$mail->AltBody = 'It will be delivered in ' . $date . ' at ' . $hour . '.';
if(!$mail->send()) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message has been sent';
}