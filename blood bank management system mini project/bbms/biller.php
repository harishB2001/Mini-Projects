<?php
include 'mysqli.php';
$ref = $_POST['refer'];
$refer = (int) $ref;

$conn->query("INSERT INTO BILL(REFER_ID) VALUES($refer)");
$b = array();
$result = $conn->query("SELECT BILL_NO FROM BILL WHERE REFER_ID = ($refer)");
while($now = $result->fetch_assoc()){
    $b[]= $now;}
$bill = $b[0]["BILL_NO"];
echo $bill;
?>
