<?php
include("connect.php");

function add_location($loc, $text,$loc_lo,$loc_la){
    mysql_query("INSERT INTO `Location_Details` (`Location_Name`,`Location_History`,`Location_Longitude`,`Location_Latitude`,`CitationNeeded`) VALUES ('$loc','$text','$loc_lo','$loc_la',0)") 
	or die(mysql_error());
    echo "<div class='result'>Location Added</div>";
    return mysql_insert_id();   
}

function update_location($loc, $text,$loc_lo,$loc_la){
    $q = mysql_query("SELECT Location_ID FROM `Location_Details` WHERE Location_Name='$loc'") or die(mysql_error());
    $row = mysql_fetch_assoc($q) or die(mysql_error());
    
    $loc_id = $row['Location_ID'];
    mysql_query("UPDATE `Location_Details` SET `Location_Name`='$loc',`Location_History`='$text',`Location_Longitude`='$loc_lo',`Location_Latitude`='$loc_la',`CitationNeeded`= 0 WHERE `Location_ID` = '$loc_id'") or die(mysql_error());
    
    echo "<div class='result'>Location Updated</div>";
    return mysql_insert_id();
}
function locations(){
    echo "Location: <select name='loc'>";
    $q = mysql_query("SELECT * FROM `Location_Details`") or die(mysql_error());
    while ($row = mysql_fetch_assoc($q)){
        $name = $row['Location_Name'];
        echo "<option value='$name'>$name</option>";
    }
    echo "</select>";
}
function locationID($loc){
$q = mysql_query("SELECT * FROM `Location_Details` where Location_Name = '$loc'") or die(mysql_error());
    while ($row = mysql_fetch_assoc($q)){
        $id = $row['Location_ID'];
       }
      return $id;
}

function rec_locations(){
    echo "Recommended Location: <select name='reco_loc'>";
    $q = mysql_query("SELECT * FROM `Location_Details`") or die(mysql_error());
    while ($row = mysql_fetch_assoc($q)){
        $name = $row['Location_Name'];
        echo "<option value='$name'>$name</option>";
    }
    echo "</select>";
}
function upload_primary($loc,$media_info)
{
    $hash = md5($media_info["name"]);
    $hash = substr($hash,0,5);
    $media_type = $media_info["type"];
    if(stripos($media_type,"image")!==false)
        $type = "image/"; 
    elseif(stripos($media_type,"video")!==false)
        $type = "video/";
    else
        $type = "";
    $fn = "primary/".$type.$hash."-".$media_info["name"];
    //echo $loc;
    //echo $fn;
    if(!file_exists($fn)){
        move_uploaded_file($media_info["tmp_name"],$fn );
    }
    if(file_exists($fn)){                                                      
        $media_name = $media_info["name"];
        $media_type = $media_info["type"];
        $q = mysql_query("UPDATE `Location_Details` SET `Media_type` = '$media_type', `Primary_Picture` = '$fn',`CitationNeeded` = '0' WHERE Location_Name ='$loc'") or die(mysql_error());
        echo "<div class='result'>Primary Picture Added</div>";
    }
}
function add_Media($loc, $title, $text){
    $q = mysql_query("SELECT Location_ID FROM `Location_Details` WHERE Location_Name='$loc'") or die(mysql_error());
    $row = mysql_fetch_assoc($q) or die(mysql_error());
    
    $loc_id = $row['Location_ID'];
    mysql_query("INSERT INTO `Location_Media` (`Location_ID`,`Name`,`Description`,`CitationNeeded`) VALUES ('$loc_id','$title','$text',0)") or die(mysql_error());
    
    echo "<div class='result'>Media Added</div>";
    return mysql_insert_id();
}

function upload_media($media_info, $p_id){
    $hash = md5($media_info["name"]);
    $hash = substr($hash,0,5);
    $media_type = $media_info["type"];
    if(stripos($media_type,"image")!==false)
        $type = "image/"; 
    elseif(stripos($media_type,"video")!==false)
        $type = "video/";
    else
        $type = "";
    $fn = "upload/".$type.$hash."-".$media_info["name"];
    //echo $p_id;
    //echo $fn;
    if(!file_exists($fn)){
        move_uploaded_file($media_info["tmp_name"],$fn );
    }
    if(file_exists($fn)){                                                      
        $media_name = $media_info["name"];
        $media_type = $media_info["type"];
        $q = mysql_query("UPDATE `Location_Media` SET `Media_type` = '$media_type', `Media_file_path` = '$fn' WHERE uid ='$p_id'") or die(mysql_error());
        echo "<div class='result'>Media Added</div>";
    }
}

function approval_list(){
    $q = mysql_query("SELECT * FROM `Location_Media` WHERE `CitationNeeded`=0");
    while ($row = mysql_fetch_assoc($q)){
        

    }
}

function add_URL($loc, $url){
    $q = mysql_query("SELECT Location_ID FROM `Location_Details` WHERE Location_Name='$loc'") or die(mysql_error());
    $row = mysql_fetch_assoc($q) or die(mysql_error());
    
    $loc_id = $row['Location_ID'];
    mysql_query("INSERT INTO `Recommended_URL` (`Location_ID`,`URL`,`CitationNeeded`) VALUES ('$loc_id','$url',0)") or die(mysql_error());
    
    echo "<div class='result'>Recommended URL Added</div>";
    return mysql_insert_id();
}
function reco_loc($loc, $reco_loc){
    $q = mysql_query("SELECT Location_ID FROM `Location_Details` WHERE Location_Name='$loc'") or die(mysql_error());
    $row = mysql_fetch_assoc($q) or die(mysql_error());
    $q2 = mysql_query("SELECT Location_ID FROM `Location_Details` WHERE Location_Name='$reco_loc'") or die(mysql_error());
    $row2 = mysql_fetch_assoc($q2) or die(mysql_error());
    
    $loc_id = $row['Location_ID'];
    $reco_loc_id = $row2['Location_ID'];
    mysql_query("INSERT INTO `Recommended_Location` (`Location_ID`,`Recommended_Location_id`,`CitationNeeded`) VALUES ('$loc_id','$reco_loc_id',0)") or die(mysql_error());
    
    echo "<div class='result'>Recommended Location Added</div>";
    return mysql_insert_id();
}
function QRCode($loc){
$q = mysql_query("SELECT Location_ID FROM `Location_Details` WHERE Location_Name='$loc'") or die(mysql_error());
$row = mysql_fetch_assoc($q) or die(mysql_error());
$loc_id = $row['Location_ID'];
return $loc_id;
}

?>
