<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$name=$_POST['name'];
$address=$_POST['address'];
$city=$_POST['city'];
$phone=$_POST['phone'];
$email=$_POST['email'];
$array = array();
$result = $conn->query("SELECT PHONE FROM BANK WHERE PHONE = ('$phone')");
$flag = 0; 
while($now = $result->fetch_assoc()){
$array[] = $now;
$flag =1;
}
if($flag == 1){
echo "0";
}
else{
    $conn->query("INSERT INTO BANK(NAME,ADDRESS,CITY,PHONE,EMAIL) VALUES(('$name'),('$address'),('$city'),('$phone'),('$email'))");
    $state = "1";
    echo $state;

}


?>

