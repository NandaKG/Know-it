<?php

include('connect.php');
include('user_header.php');

$q = mysql_query("SELECT * FROM `locations`") or die(mysql_error());
while ($row = mysql_fetch_assoc($q)){
    $id = $row['id'];
    $name = $row['name'];
    $text = $row['description'];
    $h = md5(microtime());
    $h = substr($h,5);
    echo "<div class='section'>";
    echo "<a href=\"post_list.php?loc_id=$id&user=\">";
    echo $name."</a><br/><br/>";
    echo $text."<br/>";
    echo "<br/> </div>";
}

?>
