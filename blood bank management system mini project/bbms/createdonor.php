<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$name = $_POST['name'];
$dob = $_POST['dob'];
$gender = $_POST['gender'];
$bg = $_POST['bg'];
$weight = $_POST['weight'];
$height = $_POST['height'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$address = $_POST['address'];
$elig = $_POST['eligible'];
$city = $_POST['city'];
$eligible;

if ($elig == "Yes") {
    $eligible = 1;
} 
if ($elig == "No") {
    $eligible = 0;
}


$conn->query("INSERT INTO PERSON(NAME,DOB,
ADDRESS,
CITY,
PHONE,
EMAIL,
HEIGHT,
WEIGHT,
GENDER,
ELIGIBLE,
BLOOD_GROUP
)VALUES(('$name'),
('$dob'),
('$address'),
('$city'),
('$phone'),
('$email'),
('$height'),
('$weight'),
('$gender'),
($eligible),
('$bg')
)
");
?>