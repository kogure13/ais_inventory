<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();
$jenisClass = new Jenis($connString);


$key = $_REQUEST['term'];
$jenisClass->getJenis($key);

class Jenis {

    protected $conn;

    function __construct($connString) {
        $this->conn = $connString;
    }

    function getJenis($key) {
        $json_data = array();

        $sql = "SELECT * FROM master_jenis";
        $sql .= " WHERE nama_jenis LIKE '%{$key}%'";
        $result = mysqli_query($this->conn, $sql) or die();
        while ($row = mysqli_fetch_array($result)) {
            $json_data[] = array(
                'label' => $row['nama_jenis'].'-'.$row['kode_jenis'],
                'value' => "",
                'id_jenis' => $row['id']
            );
        }

        echo json_encode($json_data);
    }

}
