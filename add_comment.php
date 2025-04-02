<?php
session_start();
$conn = new mysqli("localhost", "root", "", "edusocialnew");

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Database connection failed."]));
}

if (!isset($_SESSION["user_id"])) {
    die(json_encode(["success" => false, "message" => "User not logged in."]));
}

$user_id = $_SESSION["user_id"];
$username = $_SESSION["username"];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $post_id = intval($_POST["post_id"]);
    $comment = trim($_POST["comment"]);

    if (empty($comment)) {
        die(json_encode(["success" => false, "message" => "Comment cannot be empty."]));
    }

    $comment = htmlspecialchars($comment, ENT_QUOTES, 'UTF-8');

    $stmt = $conn->prepare("INSERT INTO comments (post_id, user_id, username, comment, time) 
                            VALUES (?, ?, ?, ?, NOW())");
    $stmt->bind_param("iiss", $post_id, $user_id, $username, $comment);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Comment added successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Error adding comment."]);
    }

    $stmt->close();
}

$conn->close();
?>
