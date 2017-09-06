<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();
$kdauto = new kdauto();

$no = $kdauto->autonum("data_check_in", "AIS-MU/IN");
echo $no;
