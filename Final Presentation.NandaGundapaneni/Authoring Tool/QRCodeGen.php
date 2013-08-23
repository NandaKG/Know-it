<?php
include("func.php");
require('header.php'); 
?>
<html>
    <head>
        <title>QR CODE GENERATOR</title>
    </head>
    
    <body>
       
        <div class='form' >
            <form method="post" action="" enctype="multipart/form-data">
                <?php locations();?><br/>
                 <?php
            	if(isset($_POST['submit'])){
                $p_id = locationID($_POST['loc']);
                echo "Location ID:";
				echo $p_id;
                }
       			 ?>
                <br/> <br/>
                <input type="submit" name="submit" value="GET LOCATION ID"/>
                <p>
				<button type="button" onclick="window.location.href='http://qrcode.kaywa.com/'">
				GO TO QR CODE GENERATOR SITE
				</button>
				</p>
            </form>
        </div>
        	
    </body>
</html>
