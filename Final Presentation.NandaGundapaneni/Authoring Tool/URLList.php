<?php
include('connect.php');

if(isset($_GET['loc_id'])){
    $loc_id = $_GET['loc_id'];
    
    $q = mysql_query("select URL from `Recommended_URL` where `Location_ID` = '$loc_id'") or die(mysql_error());
    while ($row = mysql_fetch_assoc($q)){
        $url = $row['URL'];
        echo "<div class='section'>";
        echo "<br/>";
		echo "<a href=\"$url\">".$url."</a>";
		echo "</a><br/><br/>";
        echo "<br/> </div>";
         }
    
   
}

?>
