<?php

$script = "tar -czf ~/public_html/bundel/$dbname.tgz ~/public_html/ ";
$results = system($script,$retval);
echo "\n CREATE TAR FILE:\n $results\n RETURN VALUE: $retval\n";

?>
