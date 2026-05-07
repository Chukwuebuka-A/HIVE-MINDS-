<?php
$host = "localhost";
$user = "2458345";
$password = "******";
$database = "db2458345";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
  http_response_code(500);
  exit();
}
?>