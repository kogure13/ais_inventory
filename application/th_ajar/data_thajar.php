<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$thajarClass = new thajar($connString);

switch ($action) {
    case 'add' : $thajarClass->insertData($params);
        break;
    case 'edit' : $thajarClass->updateData($params);
        break;
    case 'delete' : $thajarClass->deleteData($params);
        break;
    default :
        $thajarClass->getData($params);
        return;
}

class thajar {

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
        $sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'kode_th_ajaran';
        $sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : 'desc';
        $query = isset($_POST['query']) ? $_POST['query'] : false;
        $qtype = isset($_POST['qtype']) ? $_POST['qtype'] : false;

        $start = ($page - 1) * $rp;
        $sql = "SELECT * FROM th_ajaran";
        $sql .= " ORDER BY " . $sortname . " " . $sortorder;
        $sql .= " LIMIT " . $start . " , " . $rp . " ";
        $sqlTot = "SELECT * FROM th_ajaran";
        $qtot = mysqli_query($this->conn, $sqlTot) or die("Error to fecth total \"Kategori\"");
        $queryRecords = mysqli_query($this->conn, $sql) or die("Errot to fecth kategori data");

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
        $data = array();
        $sql = "INSERT INTO th_ajaran";
        $sql .= " (kode_th_ajaran, nama_th_ajaran)";
        $sql .= " VALUES('" . $params['kode_th_ajaran'] . "', '" . $params['nama_th_ajaran'] . "')";

        echo $result = mysqli_query($this->conn, $sql) or die("error to insert data");
    }

    function updateData($params) {
        $data = array();
        $sql = "UPDATE th_ajaran";
        $sql .= " SET kode_th_ajaran='" . $params['kode_th_ajaran'] . "', nama_th_ajaran = '" . $params['nama_th_ajaran'] . "'";
        $sql .= " WHERE id = '" . $_POST['edit_id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to update data");
    }

    function deleteData($params) {
        $data = array();
        $sql = "DELETE from th_ajaran";
        $sql .= " WHERE id = '" . $params['id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to delete data");
    }

}
