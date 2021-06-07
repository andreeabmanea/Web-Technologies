<?php
require_once("../server/connection.php");
global $mysql;

// get information based on awb
if ($stmt = $mysql->prepare("SELECT status, delivery_date, delivery_hour FROM orders WHERE awb=?")) {
    $stmt->bind_param('s', $_GET['awb']);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($status, $date, $hour);
    $stmt->fetch();
}

// print the information
if ($stmt->num_rows!=0) {
    echo '<p class="title">Status:</p>
         <div id="myProgress">';
    switch ($status) {
        case "deposited":
        {
            echo '<p class="process-text">Your package is getting ready..</p>
                  <div id="myBar1"></div>';
            break;
        }
        case "processed":
        {
            echo '<p class="process-text">Your package is on your way!</p>
                <div id="myBar2"></div>';
            break;
        }
        case "arrived":
        {
            echo '<p class="process-text">Your package arrived!</p>
                  <div id="myBar3"></div>';
            break;
        }
    }
    echo '</div>
            <table>
                <caption class="title">Details about your package:</caption>
                <tr>
                    <th>Date</th>
                    <th>Hours</th>
                </tr>
                <tr>
                    <td>' . $date . '</td>
                    
                    <td>' . $hour . '</td>
                </tr>
            </table>';
    if ($stmt = $mysql->prepare("SELECT users.phone_number FROM users JOIN areas ON areas.id_courier = users.id JOIN orders ON areas.area = orders.area WHERE awb = ?")) {
        $stmt->bind_param('s', $_GET['awb']);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($number);
        $stmt->fetch();
    }
    echo '<table>
                <tr>
                    <th>Phone number of courier</th>
                    <th>' . $number . '</th>
                </tr>
            </table>
        <p class="title" style="margin-top: 2%">Change hours, cancel or report?</p>
        <a class="button" style="margin-left: 45%" onclick="displayReport()">Please click!</a>';

}

else {
    // if the awb is incorrect or blank
    echo '<p class="title">Please enter a valid AWB!</p>';
}
$stmt->close();
