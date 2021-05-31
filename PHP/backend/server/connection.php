<?php
$mysql = mysqli_connect(
    'localhost',
    'root',
    '',
    'jmv_pass'
);
if (mysqli_connect_errno()) {
    die('Connection failed');
}