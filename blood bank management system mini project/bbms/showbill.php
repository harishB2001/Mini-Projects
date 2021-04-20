<?php
include 'mysqli.php';
$bill = $_POST['bill'];
$array = array();
$result = $conn->query("SELECT UNIT_ID,CONTENT,EXPIERY FROM UNIT WHERE BILL_NO = ('$bill')");
while($row = $result->fetch_assoc()){
    $array[] = $row;}
    echo json_encode($array);
?>