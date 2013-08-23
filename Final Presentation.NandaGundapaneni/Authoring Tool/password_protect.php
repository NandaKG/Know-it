<?php



$LOGIN_INFORMATION = array(
  'zubrag' => 'root',
  'test' => 'testpass',
  'admin' => 'passwd'
);



$LOGIN_INFORMATION = array(
  'root',
  'testpass',
  'passwd'
);




$LOGIN_INFORMATION = array(
  'admin' => 'adminpass',
  'ngundap'=>'1441'
);


define('USE_USERNAME', true);


define('LOGOUT_URL', 'http://pba.cs.clemson.edu/~ngundap/loc_list.php');


define('TIMEOUT_MINUTES', 15);


define('TIMEOUT_CHECK_ACTIVITY', true);


if(isset($_GET['help'])) {
  die('Include following code into every page you would like to protect, at the very beginning (first line):<br>&lt;?php include("' . str_replace('\\','\\\\',__FILE__) . '"); ?&gt;');
}


$timeout = (TIMEOUT_MINUTES == 0 ? 0 : time() + TIMEOUT_MINUTES * 60);

if(isset($_GET['logout'])) {
  setcookie("verify", '', $timeout, '/'); // clear password;
  header('Location: ' . LOGOUT_URL);
  exit();
}

if(!function_exists('showLoginPasswordProtect')) {

function showLoginPasswordProtect($error_msg) {
?>
<html>
<head>
  <title>Please enter password to access this page</title>
  <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
<body>
  <style>
    input { border: 1px solid black; }
  </style>
  <div style="width:500px; margin-left:auto; margin-right:auto; text-align:center">
  <form method="post">
    <h3>Admin Login</h3>
    <font color="red"><?php echo $error_msg; ?></font><br />
<?php if (USE_USERNAME) echo 'Login:<br /><input type="input" name="access_login" /><br />Password:<br />'; ?>
    <input type="password" name="access_password" /><p></p><input type="submit" name="Submit" value="Submit" />
  </form>
  <br />
  <a style="font-size:16px; color: #000000; font-family: Verdana, Arial;" href="loc_list.php" title="Home">Go Back</a>
  <br />
  <br />
  </div>
</body>
</html>

<?php
  // stop at this point
  die();
}
}

// user provided password
if (isset($_POST['access_password'])) {

  $login = isset($_POST['access_login']) ? $_POST['access_login'] : '';
  $pass = $_POST['access_password'];
  if (!USE_USERNAME && !in_array($pass, $LOGIN_INFORMATION)
  || (USE_USERNAME && ( !array_key_exists($login, $LOGIN_INFORMATION) || $LOGIN_INFORMATION[$login] != $pass ) ) 
  ) {
    showLoginPasswordProtect("Incorrect password.");
  }
  else {
    // set cookie if password was validated
    setcookie("verify", md5($login.'%'.$pass), $timeout, '/');
    
    unset($_POST['access_login']);
    unset($_POST['access_password']);
    unset($_POST['Submit']);
  }

}

else {

  // check if password cookie is set
  if (!isset($_COOKIE['verify'])) {
    showLoginPasswordProtect("");
  }

  // check if cookie is good
  $found = false;
  foreach($LOGIN_INFORMATION as $key=>$val) {
    $lp = (USE_USERNAME ? $key : '') .'%'.$val;
    if ($_COOKIE['verify'] == md5($lp)) {
      $found = true;
      // prolong timeout
      if (TIMEOUT_CHECK_ACTIVITY) {
        setcookie("verify", md5($lp), $timeout, '/');
      }
      break;
    }
  }
  if (!$found) {
    showLoginPasswordProtect("");
  }

}

?>

