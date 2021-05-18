<?php
include ("server.php");
global $mysql;
if ($stmt = $mysql->prepare("SELECT last_name, first_name, id FROM users WHERE role = ?")) {
    $stmt->bind_param('s', $_GET['role']);
    $stmt->execute();
    $stmt->bind_result($name, $first_name, $id);
}
while ($stmt->fetch()) {
    echo '<tr>
    <td>' . $name . " " . $first_name . '</td>
    <td><a class=button onclick="detailsAccount(' . $id . ')">View Details</a></td>
    <td><a class=button onclick="removeAccount(' . $id . '), document.location.reload(true)">Remove</a></td>
</tr>';
}