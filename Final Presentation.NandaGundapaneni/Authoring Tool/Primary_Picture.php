<?php 

header("Content-type: text/xml"); 

include ("connect.php");
$lid = $_GET['l_id'];
if(isset($lid)){
$xml_output = "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>\n"; 

    //images
    $result = mysql_query("select * from `Location_Details` where Location_ID = '$lid'");
    
    $xml_output .= "\t<Locations>\n";
for($x = 0 ; $x < mysql_num_rows($result) ; $x++){ 
    $row = mysql_fetch_assoc($result);
     $xml_output .= "\t\t<Location>\n";
    $path = "http://pba.cs.clemson.edu/~ngundap/". $row['Primary_Picture'];
    $xml_output .= "\t\t<location_Name>". $row['Location_Name'] ."</location_Name>\n";
    $xml_output .= "\t\t<location_picture>". $path."</location_picture>\n";
     $xml_output .= "</Location>\n";
    
    } 
    $xml_output .= "\t</Locations>\n";
/*$fh = fopen('Details.xml', 'w');
fwrite($fh, $xml_output);*/
echo $xml_output;
}
?>