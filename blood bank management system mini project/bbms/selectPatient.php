<?php
include 'mysqli.php';
$phone = $_POST['phone'];
$array = array();
$result = $conn->query("SELECT ID,NAME,PHONE,CITY FROM PERSON WHERE PHONE = ('$phone')");
while($row = $result->fetch_assoc()){
    $array[] = $row;}
    echo json_encode($array);
?>