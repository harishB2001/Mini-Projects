<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$don = $_POST['donor'];
$bank = $_POST['bank'];
$content = $_POST['content'];
$donor = (int)$don;
$result = $conn->query("INSERT INTO UNIT(DONOR_ID,BANK_ID,CONTENT)VALUES(($donor),('$bank'),('$content'))");
echo $result;
?>