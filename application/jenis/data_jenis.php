<?php

require_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$jenisClass = new Jenis();



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
    
    protected $data = [];
    
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
        $sql .= $qsearch;
        $sqlTot = $sql;
        
        $sql .= " ORDER BY id_kategori asc, nama_jenis asc, date_purchase asc";
        $sql .= " LIMIT " . $start . " , " . $rp . " ";
        
        $qtot = mysql_query($sqlTot) or die("Error to fecth total data");
        $num_rows = mysql_num_rows($qtot);
        $queryRecords = mysql_query($sql) or die("Error to fecth data");

        while ($row = mysql_fetch_assoc($queryRecords)) {
            $data[] = $row;
        }

        if ($num_rows > 0) {
            $json_data = [
                "page" => $page,
                "total" => $num_rows,
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
        $sql .= "(id_kategori, kode_jenis, nama_jenis, date_purchase, qty) ";
        $sql .= "VALUES('" . $params['kategori'] . "', '" . $params['kode_jenis'] . "', "
                . "'" . $params['nama_jenis'] . "', '".$params['date_purchase']."', '".$params['qty']."')";

        echo $result = mysql_query($sql) or die("error to insert data");
    }

    function updateJenis($params) {
        $data = array();
        $sql = "UPDATE master_jenis";
        $sql .= " SET id_kategori = '" . $params['kategori'] . "', kode_jenis = '" . $params['kode_jenis'] . "', "
                . "nama_jenis = '" . $params['nama_jenis'] . "', date_purchase = '" . $params['date_purchase'] . "', "
                . "qty = '" . $params['qty'] . "' ";
        $sql .= " WHERE id = '" . $_POST['edit_id'] . "'";

        echo $result = mysql_query($sql) or die("error to update data");
    }

    function deleteJenis($params) {
        $data = array();
        $sql = "DELETE from master_jenis";
        $sql .= " WHERE id = '" . $params['id'] . "'";

        echo $result = mysql_query($sql) or die("error to delete data");
    }

}
