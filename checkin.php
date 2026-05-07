<?php
header("Content-Type: application/json");
require "db.php";

$check_in_time = date("Y-m-d H:i:s");
$user_id = 1;

$sql = "INSERT INTO check_ins (user_id, status, check_in_time)
        VALUES ($user_id, 'active', '$check_in_time')";

if ($conn->query($sql)) {
    echo json_encode([
        "success" => true,
        "id" => $conn->insert_id,
        "time" => $check_in_time
    ]);
} else {
    echo json_encode([
        "success" => false
    ]);
}

$conn->close();
?>