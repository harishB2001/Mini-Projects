<?php
include 'mysqli.php';
$unit = $_POST['unit'];
$bank = $_POST['bank'];
// $bank = "BB1";
// $unit = "PL109AP";
$array = array();
$flag = 0;
$result= $conn->query("SELECT BILL_NO FROM UNIT WHERE UNIT_ID = ('$unit') AND EXPIERY >= CURRENT_DATE() AND STATE = ('SOLD')");
while($row = $result->fetch_assoc()){
    $array[] = $row;
    $flag =1;}

if( $flag == 1)
{
 $conn->query("CALL RETURN_PROCEDURE(('$unit'),('$bank'))");
    echo "done" ;

}
else {
 echo "not done";
}
?>