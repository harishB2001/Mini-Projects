<?php
include 'mysqli.php';
$bankid = $_POST['bankid'];
$array = array();
$result = $conn->query("SELECT NAME FROM BANK WHERE ID = ('$bankid')");
while($row = $result->fetch_assoc()){
    $array[] = $row;}
    $send = $array[0]['NAME'];
    echo $send;
?>