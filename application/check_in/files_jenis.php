<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();
$jenisClass = new Jenis();

$key = $_REQUEST['term'];
$jenisClass->getJenis($key);

class Jenis {

    function getJenis($key) {
        $json_data = array();

        $sql = "SELECT * FROM master_jenis";
        $sql .= " WHERE nama_jenis LIKE '%{$key}%' OR kode_jenis LIKE '%{$key}%'";
        $result = mysql_query($sql) or die();
        while ($row = mysql_fetch_array($result)) {
            $json_data[] = array(
                'label' => $row['nama_jenis'].'-'.$row['kode_jenis'],
                'value' => '',
                'id' => $row['id']
            );
        }

        echo json_encode($json_data);
    }

}
