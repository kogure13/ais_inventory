<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$locationClass = new location($connString);

switch ($action) {
    case 'add' : $locationClass->insertData($params);
        break;
    case 'edit' : $locationClass->updateData($params);
        break;
    case 'delete' : $locationClass->deleteData($params);
        break;
    default :
        $locationClass->getData($params);
        return;
}

class location {

    protected $conn;
    protected $data = [];

    function __construct($connString) {
        $this->conn = $connString;
    }

    public function getData($params) {
        $this->data = $this->getRecords($params);
        echo json_encode($this->data);
    }

    function getRecords() {
        $page = isset($_POST['page']) ? $_POST['page'] : 1;
        $rp = isset($_POST['rp']) ? $_POST['rp'] : 10;
        $sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'kode_location';
        $sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : 'desc';
        $query = isset($_POST['query']) ? $_POST['query'] : false;
        $qtype = isset($_POST['qtype']) ? $_POST['qtype'] : false;

        $start = ($page - 1) * $rp;
        $sql = "SELECT * FROM master_location";
        $sql .= " ORDER BY " . $sortname . " " . $sortorder;
        $sql .= " LIMIT " . $start . " , " . $rp . " ";
        
        $sqlTot = "SELECT * FROM master_location";
        $qtot = mysqli_query($this->conn, $sqlTot) or die("Error to fecth total");
        $queryRecords = mysqli_query($this->conn, $sql) or die("Errot to fecth data");

        while ($row = mysqli_fetch_assoc($queryRecords)) {
            $data[] = $row;
        }

        if (intval($qtot->num_rows) > 0) {
            $json_data = [
                "page" => $page,
                "total" => intval($qtot->num_rows),
                "rows" => $data
            ];
        } else {
            $json_data = [
                "page" => 0,
                "total" => 0,
                "rows" => 0
            ];
        }

        return $json_data;
    }

    function insertData($params) {
        $data = [];
        $sql = "INSERT INTO master_location";
        $sql .= " (kode_location, nama_location)";
        $sql .= " VALUES('" . $params['kode_location'] . "', '" . $params['nama_location'] . "')";

        echo $result = mysqli_query($this->conn, $sql) or die("error to insert data");
    }

    function updateData($params) {
        $data = [];
        $sql = "UPDATE master_location";
        $sql .= " SET kode_location ='" . $params['kode_location'] . "', nama_location = '" . $params['nama_location'] . "'";
        $sql .= " WHERE id = '" . $_POST['edit_id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to update data");
    }

    function deleteData($params) {
        $data = [];
        $sql = "DELETE from master_location";
        $sql .= " WHERE id = '" . $params['id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to delete data");
    }

}
