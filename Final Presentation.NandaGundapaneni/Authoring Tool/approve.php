<?php include("/home/ngundap/public_html/password_protect.php"); ?>
<?php
include('header.php');
include('func.php');
?>

<div class="section">
<?php

$pid = $_GET['p_id'];

if(isset($pid)){
    if(isset($_POST['Approve'])){
        mysql_query("UPDATE `Location_Media` SET `CitationNeeded`='1' WHERE `uid`='$pid'") or die(mysql_error());
        echo "<h3>Media Apporved</h3>";
    }
    elseif(isset($_POST['Deny'])){
        mysql_query("UPDATE `Location_Media` SET `CitationNeeded`='-1' WHERE `uid`='$pid'") or die(mysql_error());
        echo "<h3>Media Denied</h3>";
    }
}
else {
    echo "<h3>No Post Selected</h3>";
}
?>
<form action='approval_list.php'>
<input type='submit' value='Back'/>
</form>
</div>
