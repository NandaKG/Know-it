<?php
include('connect.php');

if(isset($_GET['loc_id'])){
    $loc_id = $_GET['loc_id'];
    
    $q = mysql_query("SELECT uid, Name, Description FROM `Location_Media` WHERE Location_id='$loc_id' and CitationNeeded = '1'") or die(mysql_error());
    while ($row = mysql_fetch_assoc($q)){
        $pid = $row['uid'];
        $q2 = mysql_query("SELECT * FROM `Location_Media` WHERE `uid`='$pid'") or die(mysql_error());
        //$title = $row['Name'];
        //$text = $row['Description'];
        echo "<div class='section'>";
        //echo "<h3>".$title."</h3>";
        //echo $text.
        echo "<br/>";
        while ($row2 = mysql_fetch_assoc($q2)){
            $path = $row2['Media_file_path'];
            $type = $row2['Media_type'];
            if(stripos($type,"video")!==false){
            	$title = $row['Name'];
        		$text = $row['Description'];
        		echo $title;
        		echo "<br/>";
        		echo $text;
        		echo "<br/>";
                echo "<video controls='controls'>";
                echo "<source src='$path' type='$type'/>";
                echo "Your Browser Does Not Suppor This Video Format";
                echo "</video>";
            }
        }
        echo "<br/> </div>";
    }
   
}

?>
