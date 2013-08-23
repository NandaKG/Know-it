
<html>
<head>
  <title>Custom Title</title>
  <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>
<?php 
include('Admin_Page.php');
include('func.php');
?>
<link rel="stylesheet" type="text/css" href="col_style.css"/>
<table id="col_box">
<tr>
<td>Locations</td>
</tr>

<?php
$l_q = mysql_query("SELECT * FROM `Location_Details`");
while ($l_row = mysql_fetch_assoc($l_q)){
    $id = $l_row['Location_ID'];
    $name = $l_row['Location_Name'];
    $text = $l_row['Location_History'];
?>
<tr>
<td style='border-top:2px solid black'><div class="section" >
<?php echo "<h3>".$name."</h3>";
echo $text; ?>
<form action="remove.php?<?php echo "p_id=".$id;?>" method="post">
    <input type="submit" name="Remove" value="Remove"/>
</form>
</div></td>
<?php 
$p_q = mysql_query("SELECT * FROM `Location_Media` WHERE Location_ID='$id'");
$firstLoop = 1;
while ($p_row = mysql_fetch_assoc($p_q)){
    if($firstLoop == 1){
        echo "<td style='border-top:2px solid black'><div class='section'>";
        $firstLoop++;
    }
    else 
        echo "<td><div class='section'>";
    $pid = $p_row['uid'];
    $pid = $p_row['uid'];
    $q2 = mysql_query("SELECT * FROM `Location_Media` WHERE `uid`='$pid'") or die(mysql_error());
    $title = $p_row['Name'];
    $text = $p_row['Description'];
    echo "<h3>".$title."</h3>";
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
    echo "<br/>";
echo "<form action='remove.php?type=loc&id=$pid' method='post'>";
echo "<input type='submit' name='Remove' value='Remove'/>";
echo "</form></div></td></tr><tr><td></td>";
}
if($firstLoop == 1){
    echo "<td style='border-top:2px solid black'></td>>";
}
?>
</tr>
<?php
}
?>

</table>
