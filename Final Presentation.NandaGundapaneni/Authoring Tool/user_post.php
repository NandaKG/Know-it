<?php
include("func.php");
require('user_header.php'); 
?>


<html>
    <head>
        <title>Add Post</title>
    </head>
    
    <body>
        <?php
            if(isset($_POST['submit'])){
                $p_id = add_post($_POST['loc'],$_POST['title'],$_POST['text']);
                if(isset($_FILES['media'])){
                    $m_id = upload_media($_FILES['media'],$p_id);
                }
            }
        ?>
        <div class='form' >
            <form method="post" action="" enctype="multipart/form-data">
                <?php locations();?><br/>
                <br/>Title:<br/>
                <input type='text' name='title' maxlength='20'/><br/>
                <br/>Text:<br/>
                <textarea name='text' rows='15' cols='40'></textarea><br/>
                <br/>Media:<br/>
                <input type="file" name="media"/>
                <br/> <br/>
                <input type="submit" name="submit" value="Submit"/>
            </form>
        </div>
        
    </body>
</html>
