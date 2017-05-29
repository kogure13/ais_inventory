<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$catgClass = new Kategori($connString);

switch ($action) {
    case 'add' : $catgClass->insertKategori($params);
        break;
    case 'edit' : $catgClass->updateKategori($params);
        break;
    case 'delete' : $catgClass->deleteKategori($params);
        break;
    default :
        $catgClass->getKategori($params);
        return;
}

class Kategori {

    protected $conn;
    protected $data = [];

    function __construct($connString) {
        $this->conn = $connString;
    }

    public function getKategori($params) {
        $this->data = $this->getRecords($params);
        echo json_encode($this->data);
    }

    function getRecords() {
        $page = isset($_POST['page']) ? $_POST['page'] : 1;
        $rp = isset($_POST['rp']) ? $_POST['rp'] : 10;
        $sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'kode_kategori';
        $sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : 'desc';
        $query = isset($_POST['query']) ? $_POST['query'] : false;
        $qtype = isset($_POST['qtype']) ? $_POST['qtype'] : false;

        $start = ($page - 1) * $rp;
        $sql = "SELECT * FROM master_kategori";
        $sql .= " ORDER BY " . $sortname . " " . $sortorder;
        $sql .= " LIMIT " . $start . " , " . $rp . " ";
        $sqlTot = "SELECT * FROM master_kategori";
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

    function insertKategori($params) {
        $data = array();
        $sql = "INSERT INTO master_kategori";
        $sql .= " (kode_kategori, nama_kategori)";
        $sql .= " VALUES('" . $params['kode_kategori'] . "', '" . $params['nama_kategori'] . "')";

        echo $result = mysqli_query($this->conn, $sql) or die("error to insert kategori data");
    }

    function updateKategori($params) {
        $data = array();
        $sql = "UPDATE master_kategori";
        $sql .= " SET kode_kategori='" . $params['kode_kategori'] . "', nama_kategori = '" . $params['nama_kategori'] . "'";
        $sql .= " WHERE id = '" . $_POST['edit_id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to update employee data");
    }

    function deleteKategori($params) {
        $data = array();
        $sql = "DELETE from master_kategori";
        $sql .= " WHERE id = '" . $params['id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to delete employee data");
    }

}
