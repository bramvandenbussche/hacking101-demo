<?php
$sqlserver = "db";
$sqluser = "fqsqsfqsdfqsfqef";
$sqlpass = "fqsdj56153maqsdqs854/83143sqdff";
$sqldb = "test_db";

$db_conn = mysqli_connect($sqlserver, $sqluser, $sqlpass, $sqldb) or die("Connection Failed");

function DbSearch($conn, $keyword) {
    $query = "SELECT id, title, article FROM articles WHERE id > 0 AND article LIKE '%$keyword%'";

}

?>