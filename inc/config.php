<?php

class dbObj {

    var $DB_Host = "192.168.0.128";
    var $DB_Name = "ais_inventory";
    var $DB_User = "root";
    var $DB_Pass = "!AIS_admin007";
    var $conn;

//$conn = mysql_connect(DB_Host, DB_User, DB_Pass);
//$db = mysql_select_db(DB_Name, $conn);
//if(!$conn) {header("location: model/error/e_conn.html"); exit();}
//if(!$db) {header("location: model/error/e_db.html");exit();}

    function getConstring() {
        $con = mysqli_connect($this->DB_Host, $this->DB_User, $this->DB_Pass, $this->DB_Name) or die("Connection failed: " . mysqli_connect_error());

        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        } else {
            $this->conn = $con;
        }

        return $this->conn;
    }

}
