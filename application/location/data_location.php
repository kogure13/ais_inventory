<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$locationClass = new location();

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
        $qsearch = ($qtype != '' && $query != '') ? " WHERE $qtype LIKE '%{$query}%' " : "";

        $start = ($page - 1) * $rp;
        $sql = "SELECT * FROM master_location";
        $sql .= $qsearch;        
        $sqlTot = $sql;
        
        $sql .= " ORDER BY " . $sortname . " " . $sortorder;
        $sql .= " LIMIT " . $start . " , " . $rp . " ";
                
        $qtot = mysql_query($sqlTot) or die("Error to fecth total");
        $num_rows = mysql_num_rows($qtot) or die("Error to fecth total");;
        $queryRecords = mysql_query($sql) or die("Errot to fecth data");

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

        echo $result = mysql_query($sql) or die("error to insert data");
    }

    function updateData($params) {
        $data = [];
        $sql = "UPDATE master_location";
        $sql .= " SET kode_location ='" . $params['kode_location'] . "', nama_location = '" . $params['nama_location'] . "'";
        $sql .= " WHERE id = '" . $_POST['edit_id'] . "'";

        echo $result = mysql_query($sql) or die("error to update data");
    }

    function deleteData($params) {
        $data = [];
        $sql = "DELETE from master_location";
        $sql .= " WHERE id = '" . $params['id'] . "'";

        echo $result = mysql_query($sql) or die("error to delete data");
    }

}
