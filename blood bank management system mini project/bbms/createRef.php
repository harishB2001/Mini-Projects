<?php
include 'mysqli.php';
header("Access-Control-Allow-Origin: *");
$pati = $_POST['patid'];
$doci = $_POST['docid'];
$docname = $_POST['docname'];
$refn = $_POST['refno'];
$hospital = $_POST['hospital'];
$elig = $_POST['elig'];

$eligible;
$docid = (int) $doci;
$refno = (int) $refn;
$patid = (int) $pati;
if ($elig == "Yes") {
    $eligible = 1;
} 
if ($elig == "No") {
    $eligible = 0;
}
$result = $conn->query("CALL REFER_EXISTS(($docid),
('$docname'),
($refno),
($patid),
('$hospital'),
($eligible))");

echo $result;
?>