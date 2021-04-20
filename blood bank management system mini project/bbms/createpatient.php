<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$name = $_POST['name'];
$gender = $_POST['gender'];
$bg = $_POST['bg'];
$phone = $_POST['phone'];
$elig = $_POST['eligible'];
$city = $_POST['city'];
$eligible;

if ($elig == "Yes") {
    $eligible = 1;
} 
if ($elig == "No") {
    $eligible = 0;
}


$conn->query("INSERT INTO PERSON(NAME,
CITY,
PHONE,

GENDER,
ELIGIBLE,
BLOOD_GROUP
)VALUES(('$name'),
('$city'),
('$phone'),
('$gender'),
($eligible),
('$bg')
)
");
?>