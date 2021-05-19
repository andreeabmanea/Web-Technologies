<?php
require_once("../Database/server.php");

global $mysql;
$id = "";

if (isset($_POST['id']))
    $id = $_POST['id'];

// remove user
if ($stmt = $mysql->prepare("DELETE FROM users WHERE id = ?")) {
    $stmt->bind_param('s', $id);
    $stmt->execute();
    $stmt->close();
}
