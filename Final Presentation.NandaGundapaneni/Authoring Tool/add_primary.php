
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
            if(isset($_FILES['media'])){
                    $m_id = upload_primary($_POST['loc'],$_FILES['media']);
                }
            }
        ?>
        <div class='form' >
            <form method="post" action="" enctype="multipart/form-data">
                <?php locations();?><br/>
                <br/> <br/>
                <br/>Primary Picture:<br/>
                <input type="file" name="media"/><br/>
                <input type="submit" name="submit" value="Submit"/>
            </form>
        </div>
        
    </body>
</html>
