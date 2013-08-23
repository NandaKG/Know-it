<?php
require('func.php');

if(isset($_FILES["media"])){
    
   upload_media($_FILES["media"],1); 
   /*
    $hash = md5($_FILES["media"]["name"]);
    $hash = substr($hash,0,5);
    $fn = "upload/".$hash."-".$_FILES["media"]["name"];
    if(!file_exists($fn))
        move_uploaded_file($_FILES["media"]["tmp_name"],$fn );
    */
}
?>

<html>
<body>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="file">Filename:</label>
        <input type="file" name="media" id="file" /> 
        <br />
        <input type="submit" name="submit" value="Submit" />
    </form>
</body>
</html>
