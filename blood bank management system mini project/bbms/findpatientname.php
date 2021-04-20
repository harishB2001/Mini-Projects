<?php
include 'mysqli.php';
$patid = $_POST['patid'];
$array = array();
$result = $conn->query("SELECT NAME FROM PERSON WHERE ID = ('$patid')");
while($row = $result->fetch_assoc()){
    $array[] = $row;}
    $send = $array[0]['NAME'];
    echo $send;
?>