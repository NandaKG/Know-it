<?php
require('Admin_Page.php');
require('func.php');

$q = mysql_query("SELECT * FROM `Location_Media` WHERE CitationNeeded='0'") or die(mysql_error());
while ($row = mysql_fetch_assoc($q)){
    $pid = $row['uid'];
    $loc_id = $row['Location_ID'];
    $q2 = mysql_query("SELECT * FROM `Location_Details` WHERE `Location_ID`='$loc_id'") or die(mysql_error());
    $row2 = mysql_fetch_assoc($q2);
    $loc = $row2['name'];
    $q2 = mysql_query("SELECT * FROM `Location_Media` WHERE `uid`='$pid'") or die(mysql_error());
    $title = $row['Name'];
    $text = $row['Description'];
    echo "<div class='section'>";
    echo "<h3>".$title."</h3>";
    echo "<h4>Location: ".$loc."</h4>";
    echo $text."<br/>";
    while ($row2 = mysql_fetch_assoc($q2)){
        $path = $row2['Media_file_path'];
        $type = $row2['Media_type'];
        if(stripos($type,"image")!==false)
            echo "<img src='$path' type='$type'/>";
        elseif(stripos($type,"video")!==false){
            echo "<video controls='controls'>";
            echo "<source src='$path' type='$type'/>";
            echo "Your Browser Does Not Suppor This Video Format";
            echo "</video>";
        }
    }
    echo "<br/><br/>";
?>
<form action='approve.php?<?php echo "p_id=".$pid;?>' method="post">
    <li style="display:inline;"> <input type="submit" name="Approve" value="Approve"/> </li>
    <li style="display:inline;"> <input type="submit" name="Deny" value="Deny"/></li>
</form>
<?php
    echo "</div>";
}

?>
