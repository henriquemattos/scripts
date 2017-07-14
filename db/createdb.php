<?php
header('Content-type: application/json;');
// $response = json_encode(array('response' => 'This script was parsed'));
// print_r($response);
// exit;

class CreateDB {
  private $host = '';
  private $user = '';
  private $pass = '';

  __construct($dbname, $dbuser, $dbroot, $dbrootpass){
    // Create connection
    $conn = new mysqli($this->host, $this->user, $this->pass);
    // Check connection
    if ($conn->connect_error) {
        return 'Connection failed: ' . $conn->connect_error;
    }

    // Create database
    $sql = 'CREATE DATABASE ' . $dbuser . '_' . $dbname;
    if ($conn->query($sql) === TRUE) {
        return 'Database created successfully';
    } else {
        return 'Error creating database: ' . $conn->error;
    }

    mysql_query("GRANT ALL ON db1.* TO 'username'@'localhost'");
    // Close connection
    $conn->close();
  }
}

if(isset($_POST)){
  $dbname = $_POST['dbname'];
  $dbuser = $_POST['dbuser'];
  $dbroot = $_POST['dbroot'];
  $dbrootpass = $_POST['dbrootpass'];
  $response = new CreateDB($_POST);
  print_r(json_encode(array('response' => $response)));
}
exit;
?>
