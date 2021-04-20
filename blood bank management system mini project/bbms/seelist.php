<?php
include 'mysqli.php';
$bg = $_POST['bg'];
$ut = $_POST['ut'];
$stt = $_POST['stt'];
$bank = $_POST['bank'];

$array = array();
$result = $conn->query("SELECT UNIT_ID,DONOR_ID,BANK_ID,CREATED,EXPIERY,CONTENT,STATE FROM UNIT WHERE CONTENT = ('$ut') AND STATE = ('$stt') AND BANK_ID = ('$bank') AND DONOR_ID IN (SELECT ID FROM PERSON WHERE BLOOD_GROUP = ('$bg'))");
while($now = $result->fetch_assoc()){
    $array[] = $now;
    }
    echo json_encode($array);
?>