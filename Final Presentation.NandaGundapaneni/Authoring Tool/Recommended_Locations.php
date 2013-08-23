<?php 

header("Content-type: text/xml"); 

include ("connect.php");
$lid = $_GET['l_id'];
if(isset($lid)){
$xml_output = "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>\n"; 

    //images
    $q = mysql_query("select * from `Recommended_Location` where Location_ID = '$lid'");
    $xml_output .= "\t<Locations>\n";
    for($y = 0 ; $y < mysql_num_rows($q) ; $y++){
    $r = mysql_fetch_assoc($q);
    $id = $r['Recommended_Location_id'];
    $result = mysql_query("select * from `Location_Details` where Location_ID = '$id'"); 
    $row = mysql_fetch_assoc($result);
    $xml_output .= "\t\t<Location>\n";
    $xml_output .= "\t\t<location_Name>". $row['Location_Name'] ."</location_Name>\n";
    $xml_output .= "\t\t<location_History>". $row['Location_History'] ."</location_History>\n";
    $xml_output .= "\t\t<longitude>". $row['Location_longitude']."</longitude>\n";
    $xml_output .= "\t\t<latitude>". $row['Location_latitude']."</latitude>\n";
    $xml_output .= "</Location>\n";
    }
    $xml_output .= "\t</Locations>\n";
/*$fh = fopen('Details.xml', 'w');
fwrite($fh, $xml_output);*/
echo $xml_output;
}
?>