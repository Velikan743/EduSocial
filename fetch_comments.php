<?php
$conn = new mysqli("localhost", "root", "", "edusocialnew");

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Database connection failed."]));
}

if (!isset($_GET["post_id"]) || !is_numeric($_GET["post_id"])) {
    die(json_encode(["success" => false, "message" => "Invalid post ID."]));
}

$post_id = intval($_GET["post_id"]);

$stmt = $conn->prepare("SELECT comments.comment, comments.time, users.username 
                        FROM comments 
                        JOIN users ON comments.user_id = users.id 
                        WHERE comments.post_id = ? 
                        ORDER BY comments.time DESC");
$stmt->bind_param("i", $post_id);
$stmt->execute();
$result = $stmt->get_result();

$comments = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode(["success" => true, "comments" => $comments]);

$stmt->close();
$conn->close();
?>
