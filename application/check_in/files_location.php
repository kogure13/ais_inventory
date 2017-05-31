<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();
$locationClass = new location($connString);


$key = $_REQUEST['term'];
$locationClass->getLocation($key);

class location {

    protected $conn;

    function __construct($connString) {
        $this->conn = $connString;
    }

    function getLocation($key) {
        $json_data = array();

        $sql = "SELECT * FROM master_location";
        $sql .= " WHERE kode_location LIKE '%{$key}%' OR nama_location LIKE '%{$key}%'";
        $result = mysqli_query($this->conn, $sql) or die();
        while ($row = mysqli_fetch_array($result)) {
            $json_data[] = array(
                'label' => $row['kode_location'],
                'value' => '',
                'id' => $row['id']
            );
        }

        echo json_encode($json_data);
    }

}
