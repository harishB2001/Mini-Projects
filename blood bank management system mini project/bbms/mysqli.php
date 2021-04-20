<?php
header("Access-Control-Allow-Origin: *");
$server = "localhost";
$user = "Fill here with mysql username";  
$pass = "Fill here with mysql password";
$dbname = "bbms";
$conn = new mysqli($server,$user,$pass,$dbname);
?>