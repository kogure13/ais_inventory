<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();
$locationClass = new location();

$key = (isset($_REQUEST['term']) != '') ? $_REQUEST['term'] : '';

$locationClass->getLocation($key);

class location {
    
    function getLocation($key) {
        $json_data = array();

        $sql = "SELECT * FROM master_location";
        $sql .= " WHERE kode_location LIKE '%{$key}%' OR nama_location LIKE '%{$key}%'";
        $result = mysql_query($sql) or die();
        while ($row = mysql_fetch_array($result)) {
            $json_data[] = array(
                'label' => $row['kode_location'].' - '.$row['nama_location'],
                'value' => '',
                'id' => $row['id']
            );
        }

        echo json_encode($json_data);
    }

}
