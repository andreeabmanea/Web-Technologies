<?php
include ("../server/login.php");
function display_courier_schedule($username)
{
    global $mysql;
    $query = "select name, address, phone_number, awb, amount from orders where area in (select area from areas join users on id_courier = id where username = ?) and status!='arrived' and delivery_date = CURRENT_DATE();";
    if ($stmt = $mysql->prepare($query)) {
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $stmt->bind_result($name, $address, $number, $awb, $amount);
    }
    echo
    '<tr>
                <th style = "padding:10px">Name</th>
                <th style = "padding:10px">Address</th>
                <th style = "padding:10px">Contact Number</th>
                <th style = "padding:10px">Delivery Number</th>
                <th style = "padding:10px">Anything to pay?</th>
            </tr>';
    while ($stmt->fetch()) {
        echo '<tr>';
        echo '<td style = "padding:10px">' . $name . '</td>';
        echo '<td style = "padding:10px">' . $address . '</td>';
        echo '<td style = "padding:10px">' . $number . '</td>';
        echo '<td style = "padding:10px">' . $awb . '</td>';
        if ($amount != null)
            echo '<td style = "padding:10px">' . $amount . '</td>';
        else echo '<td style = "padding:10px">' . "NO" . '</td>';
        echo '</tr>';
    }
}