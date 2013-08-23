<?php

include('connect.php');
include('header.php');

$q = mysql_query("SELECT * FROM `Location_Details`") or die(mysql_error());
while ($row = mysql_fetch_assoc($q)){

    $id = $row['Location_ID'];
    $name = $row['Location_Name'];
    $text = $row['Location_History'];
    echo "<div class='section'>";
    echo "<a href=\"post_list.php?loc_id=$id\">";
    echo $name."</a><br/><br/>";
    echo $text."<br/>";
            $path = $row['Primary_Picture'];
            $type = $row['Media_type'];
            if(stripos($type,"image")!==false)
                echo "<img src='$path' type='$type'/>";
            elseif(stripos($type,"video")!==false){
                echo "<video controls='controls'>";
                echo "<source src='$path' type='$type'/>";
                echo "Your Browser Does Not Suppor This Video Format";
                echo "</video>";
   

            }
    echo "<br/> </div>";
}

?>
