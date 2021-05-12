<?php
require_once("../Database/server.php");
$awb = "";
if (isset($_POST['fawb'])){
    $awb = $_POST['fawb'];
    }
global $mysql;
$query = "update orders set status = 'arrived' where awb = ?";
if ($stmt = $mysql->prepare($query)) {
    $stmt->bind_param('s',$awb);
    $stmt->execute();
}
