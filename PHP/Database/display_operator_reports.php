<?php
require_once("../Database/server.php");
function display_operator_reports($AWB)
{
    global $mysql;
    if ($stmt_id = $mysql->prepare("SELECT id FROM orders WHERE awb = ?")) {
        $stmt_id->bind_param('s', $awb);
        $stmt_id->execute();
        $result_id = $stmt_id->get_result();
        $info_id = $result_id->fetch_assoc();
    }
    $query = "select id_order, ?, damage, other_content, comment from reports";
    if ($stmt = $mysql->prepare($query)) {
        $stmt->execute();
        $stmt->bind_result($id_order,$AWB, $damage, $other_content, $comment);
    }
    echo
        '<tr>
            <th style = "padding:10px">ID Order</th>
            <th style = "padding:10px">AWB</th>
            <th style = "padding:10px">Damage</th>
            <th style = "padding:10px">Other Content</th>
            <th style = "padding:10px">Comment</th>
        </tr>';
    while ($stmt->fetch()) {
        echo '<tr>';
            echo '<td style = "padding:10px">' . $id_order . '</td>';
            echo '<td style = "padding:10px">' . $AWB . '</td>';
            echo '<td style = "padding:10px">' . $damage . '</td>';
            echo '<td style = "padding:10px">' . $other_content . '</td>';
            echo '<td style = "padding:10px">' . $comment . '</td>';
            echo '</tr>';
    }
}