<?php
include("../server/connection.php");
global $mysql;

//get details of user using his id
if ($stmt = $mysql->prepare("SELECT username, last_name, first_name, email, phone_number, cnp FROM users WHERE id = ?")) {
    $stmt->bind_param('s', $_GET['id']);
    $stmt->execute();
    $stmt->bind_result($username, $name, $first_name, $email, $phone_number, $cnp);
    $stmt->fetch();
}

// basic information
echo '<p id="mini-title"> Username: '. $username . '</p>
    <p id="mini-title"> Name: '. $name . $first_name . '</p>
    <p id="mini-title"> Email: ' . $email . '</p>';

// users don't have cnp if they sign-in from personal computer
if ($cnp == null)
    echo'<p id="mini-title"> Phone number: ' . $phone_number . '</p>
    <a class=button onclick="closeDetailsWindow()">Done</a>';
else {
    echo '<p id="mini-title"> CNP: ' . $cnp . '</p>
    <p id="mini-title"> Phone number: ' . $phone_number . '</p>
    <a class=button onclick="closeDetailsWindow()">Done</a>';
}
$stmt->close();
