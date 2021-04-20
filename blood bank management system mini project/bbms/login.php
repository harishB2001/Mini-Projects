<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$phone = $_POST['phone'];
$array = array();
$result = $conn->query("SELECT PHONE FROM BANK WHERE PHONE = ('$phone')");
$flag = 0;
while($now = $result->fetch_assoc()){
$array[] = $now;
$flag =1;
}
if($flag == 1){
$result = $conn->query("SELECT ID FROM BANK WHERE PHONE = ('$phone')");
while($now = $result->fetch_assoc()){
    
    $bank[] = $now;
    }
    $ret =  $bank[0]['ID'];
    echo $ret;
}
else{ 
    $state = "1";
    echo $state;
}

?>