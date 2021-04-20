<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$bg = $_POST['bg'];
$ut = $_POST['ut'];
$array = array();
if($ut == "WHOLE")
{
    $result=$conn ->query("SELECT * FROM BANK WHERE ID IN (SELECT BANK_ID FROM UNIT WHERE CONTENT = 'WHOLE' AND STATE = 'INSTOCK' AND DONOR_ID IN (SELECT ID FROM PERSON WHERE BLOOD_GROUP = ('$bg')) GROUP BY BANK_ID) ORDER BY CITY"); 
    while($row = $result->fetch_assoc()){
    $array[] = $row;}
    echo json_encode($array);
}
if($ut != "WHOLE")
{
    $result=$conn ->query("SELECT * FROM BANK WHERE ID IN (SELECT BANK_ID FROM UNIT WHERE (CONTENT = 'WHOLE' OR CONTENT = ('$ut')) AND STATE = 'INSTOCK' AND DONOR_ID IN (SELECT ID FROM PERSON WHERE BLOOD_GROUP = ('$bg')) GROUP BY BANK_ID) ORDER BY CITY"); 
    while($row = $result->fetch_assoc()){
    $array[] = $row;}
    echo json_encode($array);
}

?>