<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$phone = $_POST['phone'];
$array = array();
$result = $conn->query("SELECT ID,NAME,PHONE,CITY FROM PERSON WHERE NEXT_DATE_FOR_DONATION <= CURRENT_DATE() AND PHONE = ('$phone')");
while($row = $result->fetch_assoc()){
    $array[] = $row;}
    echo json_encode($array);
?>