<?php
require_once("../Database/server.php");
global $mysql;
if ($stmt = $mysql->prepare("SELECT status, delivery_date, delivery_hour FROM orders WHERE awb=?")) {
    $stmt->bind_param('s', $_GET['fawb']);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($status, $date, $hour);
    $stmt->fetch();
}
if ($stmt->num_rows!=0) {
    echo '<p id="title">Status:</p>
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
                <caption id="title">Details about your package:</caption>
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
        $stmt->bind_param('s', $_GET['fawb']);
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
        <p id="title" style="margin-top: 2%">Change hours, cancel or report?</p>
        <a class="button" style="margin-left: 45%" onclick="displayReport()">Please click!</a>';

}

else {
    echo '<p id="title">Please enter a valid AWB!</p>';
}
$stmt->close();
