<?php
require_once("../Database/server.php");

global $mysql;
$id = "";

if (isset($_POST['id']))
    $id = $_POST['id'];
// remove user
if ($stmt_id = $mysql->prepare("DELETE FROM users WHERE id = ?")) {
    $stmt_id->bind_param('s', $id);
    $stmt_id->execute();
}