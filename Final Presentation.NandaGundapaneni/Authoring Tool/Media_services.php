<?php 

header("Content-type: text/xml"); 

include ("connect.php");
$lid = $_GET['l_id'];
if(isset($lid)){
$xml_output = "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>\n"; 

    //images
    $result = mysql_query("select * from `Location_Media` where Location_id = '$lid' and CitationNeeded = '1' and Media_type = 'image/jpeg' ");
    
    $xml_output .= "\t<Locations>\n";
    
for($x = 0 ; $x < mysql_num_rows($result) ; $x++){ 
    $row = mysql_fetch_assoc($result);
    $path = "http://pba.cs.clemson.edu/~ngundap/". $row['Media_file_path'];
    $xml_output .= "\t\t<Location>\n";
    $xml_output .= "\t\t<title>". $row['Name'] ."</title>\n";
    $xml_output .= "\t\t<description>". $row['Description'] ."</description>\n";
    $xml_output .= "\t\t<location_picture>". $path."</location_picture>\n";
    //$xml_output .= "\t\t<type>". $row['Media_type']."</type>\n";
    $xml_output .= "</Location>\n";
    }
    $xml_output .= "\t</Locations>\n"; 
    
/*$fh = fopen('Media.xml', 'w');
fwrite($fh, $xml_output);*/
echo $xml_output;
}
?>