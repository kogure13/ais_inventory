<?php

require_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$jenisClass = new Jenis($connString);

switch ($action) {
    case 'add' : $jenisClass->insertJenis($params);
        break;
    case 'edit' : $jenisClass->updateJenis($params);
        break;
    case 'delete' : $jenisClass->deleteJenis($params);
        break;
    default :
        $jenisClass->getjenis($params);
        return;
}

class Jenis {

    protected $conn;
    protected $data = [];

    function __construct($connString) {
        $this->conn = $connString;
    }

    public function getJenis($params) {
        $this->data = $this->getRecords($params);
        echo json_encode($this->data);
    }

    function getRecords() {
        $page = isset($_POST['page']) ? $_POST['page'] : 1;
        $rp = isset($_POST['rp']) ? $_POST['rp'] : 10;
        $sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'date_purchase';
        $sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : 'desc';
        $query = isset($_POST['query']) ? $_POST['query'] : false;
        $qtype = isset($_POST['qtype']) ? $_POST['qtype'] : false;
        $qsearch = ($qtype != '' && $query != '') ? " WHERE $qtype LIKE '%{$query}%' " : '';

        $start = ($page - 1) * $rp;
        $sql = "SELECT master_jenis.id, master_jenis.id_kategori, master_jenis.kode_jenis, "
                . "master_jenis.nama_jenis, master_jenis.sample_foto, "
                . "master_jenis.qty, master_jenis.date_purchase, "
                . "master_kategori.nama_kategori";
        $sql .= " FROM master_jenis ";
        $sql .= " INNER JOIN master_kategori ON master_jenis.id_kategori = master_kategori.id ";
        
        $sqlTot = $sql;
        $sql .= $qsearch;
        $sql .= " ORDER BY id_kategori asc, date_purchase asc";
        $sql .= " LIMIT " . $start . " , " . $rp . " ";
        
        $qtot = mysqli_query($this->conn, $sqlTot) or die("Error to fecth total data");
        $queryRecords = mysqli_query($this->conn, $sql) or die("Error to fecth data");

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
            $json_data = ["page" => 0, "total" => 0, "rows" => 0];
        }

        return $json_data;
    }

    function insertJenis($params) {
        $data = array();
        $sql = "INSERT INTO master_jenis ";
        $sql .= "(id_kategori, kode_jenis, nama_jenis) ";
        $sql .= "VALUES('" . $params['kategori'] . "', '" . $params['kode_jenis'] . "', "
                . "'" . $params['nama_jenis'] . "')";

        echo $result = mysqli_query($this->conn, $sql) or die("error to insert data");
    }

    function updateJenis($params) {
        $data = array();
        $sql = "UPDATE master_jenis";
        $sql .= " SET id_kategori='" . $params['kategori'] . "', kode_jenis = '" . $params['kode_jenis'] . "', "
                . "nama_jenis = '" . $params['nama_jenis'] . "', date_purchase = '" . $params['date_purchase'] . "', "
                . "qty = '" . $params['qty'] . "' ";
        $sql .= " WHERE id = '" . $_POST['edit_id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to update data");
    }

    function deleteJenis($params) {
        $data = array();
        $sql = "DELETE from master_jenis";
        $sql .= " WHERE id = '" . $params['id'] . "'";

        echo $result = mysqli_query($this->conn, $sql) or die("error to delete data");
    }

}
