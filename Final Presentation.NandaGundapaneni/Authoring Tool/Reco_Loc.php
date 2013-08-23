<?php
include("func.php");
require('Admin_Page.php'); 
?>


<html>
    <head>
        <title>Add Media</title>
    </head>
    
    <body>
        <?php
            if(isset($_POST['submit'])){
                $p_id = reco_loc($_POST['loc'],$_POST['reco_loc']);
            }
        ?>
        <div class='form' >
            <form method="post" action="" enctype="multipart/form-data">
                <?php locations();?><br/>
			<form method="post" action="" enctype="multipart/form-data">
                <?php rec_locations();?><br/>
                <input type="submit" name="submit" value="Submit"/>
            </form>
        </div>
        
    </body>
</html>
