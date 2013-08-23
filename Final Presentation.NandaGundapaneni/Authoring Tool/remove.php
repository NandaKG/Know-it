<?php include("/home/ngundap/public_html/password_protect.php"); ?>
<?php
include('header.php');
include('func.php');
?>

<div class="section">
<?php

$pid = $_GET['p_id'];
//echo $pid;
if(isset($pid)){
    if(isset($_POST['Remove'])){
    mysql_query("DELETE FROM `Location_Details` WHERE `Location_ID`='$pid'") or die(mysql_error());
        mysql_query("DELETE FROM `Location_Media` WHERE `Location_id`='$pid'") or die(mysql_error());
        echo "<h3>Location and Media Deleted</h3>";
    }
}
else {
    echo "<h3>No Media Selected</h3>";
}
?>
<form action='removal_list.php'>
<input type='submit' value='Back'/>
</form>
</div>