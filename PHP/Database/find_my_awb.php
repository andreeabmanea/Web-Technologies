<?php
require_once("../Database/server.php");
global $mysql;
if ($stmt = $mysql->prepare("SELECT status FROM orders WHERE awb=?")) {
    $stmt->bind_param('s', $_GET['fawb']);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($status);
    $stmt->fetch();
}
if ($stmt->num_rows!=0) {
    echo '<p id="title">Status:</p>
         <div id="myProgress">';
    switch ($status) {
        case "deposited":
        {
            echo '<p class="procces-text">Your package is getting ready..</p>
                  <div id="myBar1"></div>';
            break;
        }
        case "arrived":
        {
            echo '<p class="procces-text">Your package arrived!</p>
                  <div id="myBar4"></div>';
            break;
        }
        case "processed":
        {
            echo '<p class="procces-text">Your package is on your way!</p>
                <div id="myBar3"></div>';
            break;
        }
    }
    echo '</div>';
}
else echo '<p id="title">Please enter a valid AWB!</p>';
//TODO: se afiseaza asta de 2 ori (odata sus, unde nu ar trebui)