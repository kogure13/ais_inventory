<?php

define("DB_Host", "192.168.0.128");
define("DB_Name", "ais_inventory");
define("DB_User", "root");
define("DB_Pass", "!AIS_admin007");

class dbObj {

    function getConn() {
        $conn = mysql_connect(DB_Host, DB_User, DB_Pass);
        $db = mysql_select_db(DB_Name, $conn);
        if (!$conn) {
            header("location: model/error/e_conn.html");
            exit();
        }
        if (!$db) {
            header("location: model/error/e_db.html");
            exit();
        }
    }

//    function getConstring() {
//        $con = mysqli_connect($this->DB_Host, $this->DB_User, $this->DB_Pass, $this->DB_Name) or die("Connection failed: " . mysqli_connect_error());
//
//        if (mysqli_connect_errno()) {
//            printf("Connect failed: %s\n", mysqli_connect_error());
//            exit();
//        } else {
//            $this->conn = $con;
//        }
//
//        return $this->conn;
//    }
}

class Main {

    function getPage() {
        if (!isset($_GET['page'])) {
            include_once 'view/home.php';
        } else {
            $page = htmlentities($_GET['page']);
            $pageRoot = "view/" . $page . ".php";

            if (file_exists($pageRoot)) {
                include_once $pageRoot;
            } elseif ($page == "crud") {
                $halaman = $_GET['act'];
                if (file_exists("model/" . $halaman . ".php")) {
                    include_once "model/" . $halaman . ".php";
                }
            } elseif ($page == "logout") {
                $user = new userLogout();
                $user->logout();
            } else {
                include_once 'view/home.php';
            }
        }
    }

    function getNavHead() {
        include 'model/nav_head.php';
    }

}

class kdauto {

    function autonum($tabel, $inisial) {
        $today = date('Y-m-d');
        $nodate = date("md");
        
        $query = "SELECT * FROM ".$tabel;
        $query .= " WHERE date_check_in LIKE '$today%'";
        $sql_kode = mysql_query($query);
        $data_kode = mysql_fetch_array($sql_kode);
        $jumlah_kode = mysql_num_rows($sql_kode);
        
        if($data_kode){
            $nilai_kode = substr($jumlah_kode[0], 1);
            $kode = (int) $nilai_kode;
            $kode = $jumlah_kode + 1;
            $kode_otomatis = $inisial."-".$nodate."/".str_pad($kode, 4, "0", STR_PAD_LEFT);
        }else{
            $kode_otomatis = $inisial."-".$nodate."/0001";
        }
        
        return $kode_otomatis;
    }

}

class userLogout {

    function logout() {
        $id = $_SESSION['id_user'];

        $uLogin = "UPDATE pengguna set login_status = 0 WHERE id = '$id'";
        $result = mysql_query($uLogin);

        session_destroy();
        echo '<meta http-equiv="refresh" content="0;url=index.php" >';
    }

}
