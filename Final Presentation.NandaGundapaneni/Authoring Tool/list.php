<?php

include('connect.php');
include('header.php');

$q = mysql_query("SELECT * FROM `locations`") or die(mysql_error());
while ($row = mysql_fetch_assoc($q)){
    
    $name = $row['name'];
    $text = $row['description'];
    echo "<div class='section'>";
    echo $name."<br/>";
    echo $text."<br/>";
    echo "<br/> </div>";
}

?>