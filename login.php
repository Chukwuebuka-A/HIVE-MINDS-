<?php
session_start();

//Connecting  to  my school database
$conn = new mysqli("localhost","2458345","******","db2458345");

if ($conn->connect_error) {
    die("Connection failed");
}

//Getting the  form data
$email = $_POST['email'];
$password = $_POST['password'];
//find user
$stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();

$result = $stmt->get_result();
$user = $result->fetch_assoc();

//Verify  if  password is correct 
if ($user && password_verify($password, $user['password'])) {

    $_SESSION['user_id'] = $user['id'];
    $_SESSION['email'] = $user['email'];

    header("Location: dashboard.html");
    exit();

} else {
    echo "Invalid email or password";
}
?>