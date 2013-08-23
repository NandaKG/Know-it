<?php
$mysql_hostname = "localhost";
$mysql_user = "ngundap";
$mysql_password = "674638";
$mysql_database = "ngundap";
$bd = mysql_connect($mysql_hostname, $mysql_user, $mysql_password)
or die("some thing went wrong");
mysql_select_db($mysql_database, $bd) or die("some thing went wrong");
?>