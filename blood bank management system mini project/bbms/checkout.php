<?php
include 'mysqli.php';
$bg = $_POST['bg'];
$ut = $_POST['ut'];
$bank = $_POST['bank'];
$array = array();
$result = $conn-> query("SELECT * FROM UNIT WHERE BANK_ID = ('$bank') AND DONOR_ID IN (SELECT ID FROM PERSON WHERE BLOOD_GROUP = ('$bg')) AND STATE = 'INSTOCK' AND CONTENT = ('$ut')");
while($row = $result->fetch_assoc()){
    $array[] = $row;}
    echo json_encode($array);
?>