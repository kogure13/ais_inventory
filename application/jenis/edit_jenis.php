<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();
$jenisClass = new Jenis();

if (!isset($_GET['id'])) {
    exit();
} else {
    $params = $_GET['id'];
}
if ($params > 0) {
    $jenisClass->getJenis($params);
} else {
    mysql_errno();
}

class Jenis {

    function getJenis($params) {
        $json_data = array();
        $sql = "SELECT * FROM master_jenis";
        $sql .= " WHERE id = $params";

        $result = mysql_query($sql) or die();

        while ($row = mysql_fetch_assoc($result)) {
            $json_data = $row;
        }
        echo json_encode($json_data);
    }

}
