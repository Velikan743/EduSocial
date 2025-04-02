<?php
$conn = new mysqli("localhost", "root", "", "edusocialnew");

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Database connection failed."]));
}

// Check if post ID is provided
if (!isset($_GET["id"])) {
    die(json_encode(["success" => false, "message" => "No post ID provided."]));
}

$post_id = intval($_GET["id"]);

// Fetch post details along with the username and user_id
$stmt = $conn->prepare("SELECT posts.id, posts.filename, posts.filetype, posts.filepath, 
                               users.id AS user_id, users.username 
                        FROM posts 
                        JOIN users ON posts.user_id = users.id 
                        WHERE posts.id = ?");
$stmt->bind_param("i", $post_id);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    echo json_encode(["success" => true, "post" => $row]);
} else {
    echo json_encode(["success" => false, "message" => "Post not found."]);
}

$stmt->close();
$conn->close();
?>
