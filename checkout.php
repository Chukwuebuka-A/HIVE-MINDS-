<?php
header("Content-Type: application/json");
require "db.php";

error_reporting(E_ALL);
ini_set('display_errors', 1);

$id = $_GET["id"] ?? null;

if (!$id) {
    echo json_encode([
        "success" => false,
        "message" => "Missing ID"
    ]);
    exit;
}

$check_out_time = date("Y-m-d H:i:s");


$stmt = $conn->prepare("SELECT check_in_time FROM check_ins WHERE id = ?");
if (!$stmt) {
    echo json_encode([
        "success" => false,
        "message" => "Prepare failed: " . $conn->error
    ]);
    exit;
}

$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if (!$result) {
    echo json_encode([
        "success" => false,
        "message" => "Query failed: " . $conn->error
    ]);
    exit;
}

if ($result->num_rows === 0) {
    echo json_encode([
        "success" => false,
        "message" => "Record not found"
    ]);
    exit;
}

$row = $result->fetch_assoc();

$check_in = strtotime($row["check_in_time"]);
$check_out = strtotime($check_out_time);

$duration = round(($check_out - $check_in) / 60);
$points = floor($duration / 10);


$stmt = $conn->prepare("
    UPDATE check_ins 
    SET check_out_time = ?, 
        status = 'checked_out',
        duration_minutes = ?,
        points = ?
    WHERE id = ?
");

if (!$stmt) {
    echo json_encode([
        "success" => false,
        "message" => "Prepare failed: " . $conn->error
    ]);
    exit;
}

$stmt->bind_param("siii", $check_out_time, $duration, $points, $id);

if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "check_out_time" => $check_out_time,
        "duration" => $duration,
        "points" => $points
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Update failed: " . $stmt->error
    ]);
}

$conn->close();
?>