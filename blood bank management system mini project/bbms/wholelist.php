<?php
include 'mysqli.php';
$bank = $_POST['bank'];
$result = $conn->query("SELECT UNIT_ID,CREATED,EXPIERY,CONTENT FROM UNIT WHERE STATE = 'INSTOCK' AND CONTENT = 'WHOLE' AND BANK_ID = ('$bank')");
$array = array();
while($row = $result->fetch_assoc()){
    $array[] = $row;}
    echo json_encode($array);
?>