<?php
include 'mysqli.php';
$bill = $_POST['bill'];
$list =  $_POST['list'];
$res = 0;
$res = $conn->query("CALL SELLING(('$bill'),('$list'))");
$send = (String) $res;
echo $send
?>
