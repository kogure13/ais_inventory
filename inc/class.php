<?php

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
                $user = new User();
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
