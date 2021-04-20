<?php
include 'mysqli.php';
$unit = $_POST['unit'];

$result = $conn->query("CALL SEPERATION_PROCEDURE(('$unit'))");
$array = array();
while($now = $result->fetch_assoc()){
    $array[] = $now;}
$type =  gettype($array);
if($type == "array"){
    echo "0";
}
else
echo "1";
?>