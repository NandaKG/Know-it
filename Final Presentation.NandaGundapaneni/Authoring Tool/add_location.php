
<?php
include('func.php');
require('Admin_Page.php');
?>

<html>
    <head>
        <title>Add Location</title>
    </head>
    
    <body>
        <?php
            if(isset($_POST['submit'])){
              $p_id = add_location($_POST['loc'],$_POST['text'],$_POST['loc_lo'],$_POST['loc_la']);
            }
        ?>
        <div class='form'>
            <form method="post" action="" enctype="multipart/form-data">
                <br/>Location Name:<br/>
                <input type='text' name='loc' maxlength='20'/><br/>
                <br/>Location History:<br/>
                <textarea name='text' rows='15' cols='50'></textarea>
                <br/>
                <br/>Location Longitude:<br/>
                <input type='text' name='loc_lo' maxlength='20'/><br/>
                <br/>Location Latitude:<br/>
                <input type='text' name='loc_la' maxlength='20'/><br/>
                <input type="submit" name="submit" value="Submit"/>
            </form>
        </div>
        
    </body>
</html>
