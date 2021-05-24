<?php
include("server.php");
global $mysql;
if ($stmt = $mysql->prepare("select MONTHNAME(delivery_date) as month, count(*) as number from orders group by MONTH(delivery_date);")) {
    $stmt->execute();
    $result = $stmt->get_result();
    $json_res = [
        "month"=>[], "number"=>[]
    ];
    while ($info = $result->fetch_assoc()){
        array_push($json_res["month"], $info['month']);
        array_push($json_res["number"], $info['number']);
    }
    echo json_encode($json_res);
}