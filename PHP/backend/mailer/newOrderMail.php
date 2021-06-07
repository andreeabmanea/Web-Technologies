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
    $mail->addAddress($result_id, $name);     //Add a recipient

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'New Order';
    $mail->Body    =$name . ' you have a new order!b>';
    $mail->AltBody = 'It will be delivered in ' . $date . ' at ' . $hour . '.';

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}