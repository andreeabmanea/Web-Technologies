<?php
include("server.php");
global $mysql;
if ($stmt = $mysql->prepare("SELECT area, count(*) as number from orders group by area")) {
    $stmt->execute();
    $result = $stmt->get_result();
    $json_res = [
        "area"=>[], "number"=>[]
    ];
    while ($info = $result->fetch_assoc()){
        array_push($json_res["area"], $info['area']);
        array_push($json_res["number"], $info['number']);
    }
       echo json_encode($json_res);
}
?>