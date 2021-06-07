<?php
require_once("../server/connection.php");

//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if (isset($_POST['name']))
    $name = $_POST['name'];

if (isset($_POST['email']))
    $email = $_POST['email'];

if (isset($_POST['subject']))
    $subjectx = $_POST['subject'];

if (isset($_POST['problem']))
    $problem = $_POST['problem'];


//Load Composer's autoloader
require '../mailer/MAILER/vendor/autoload.php';

//Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth = true;                                   //Enable SMTP authentication
    $mail->Username = 'jmvcourier@gmail.com';                     //SMTP username
    $mail->Password = 'jmvcourier12345678';                               //SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         //Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
    $mail->Port = 587;                                    //TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

    //Recipients
    $mail->setFrom($email, $name);
    $mail->addAddress('jmvcourier@gmail.com', 'JMV CONTACT');     //Add a recipient
    $mail->addReplyTo($email $name);

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = $subjectx;
    $mail->Body = $problem;

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}
