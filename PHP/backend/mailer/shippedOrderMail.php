<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require_once("../server/connection.php");

global $mysql;

//Load Composer's autoloader

require '../mailer/MAILER/vendor/autoload.php';

//Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true);

if (isset($_POST['fawb']))
    $awb = $_POST['fawb'];

global $mysql;
$query = "select * from users JOIN orders On users.id=orders.id_client where AWB=$awb";
if ($stmt = $mysql->prepare($query)) {
    $stmt->execute();
    $result_order = $stmt->get_result();
    $info_order = $result_order->fetch_assoc();
}
try {
    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'jmvcourier@gmail.com';                     //SMTP username
    $mail->Password   = 'jmvcourier12345678';                               //SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         //Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
    $mail->Port       = 587;                                    //TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

    //Recipients
    $mail->setFrom('jmvcourier@gmail.com', 'JMVCourier');
    $mail->addAddress($info_order['email'], $info_order['name']);     //Add a recipient

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'Order Shipped';
    $mail->Body    = 'An order with the following AWB has been shipped: ' . $awb . '. It has been delivered in ' . date('d/m/Y') . ' at ' . date('H:i');

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}