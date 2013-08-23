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
                $p_id = add_URL($_POST['loc'],$_POST['url']);
            }
        ?>
        <div class='form' >
            <form method="post" action="" enctype="multipart/form-data">
                <?php locations();?><br/>
                <br/>URL:<br/>
                <textarea name='url' rows='15' cols='40'></textarea><br/>
                <input type="submit" name="submit" value="Submit"/>
            </form>
        </div>
        
    </body>
</html>
