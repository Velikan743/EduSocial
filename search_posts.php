<?php
session_start();
$conn = new mysqli("localhost", "root", "", "edusocialnew"); 

if (!isset($_GET['username'])) {
    echo json_encode([]);
    exit;
}

$username = $_GET['username'];

$query = "SELECT posts.id, users.username, posts.filename, posts.filetype, posts.filepath 
          FROM posts 
          JOIN users ON posts.user_id = users.id 
          WHERE users.username LIKE ? 
          ORDER BY posts.id DESC";

$stmt = $conn->prepare($query);
$searchTerm = "%" . $username . "%";
$stmt->bind_param("s", $searchTerm);
$stmt->execute();
$result = $stmt->get_result();

$posts = [];
while ($row = $result->fetch_assoc()) {
    $posts[] = $row;
}

echo json_encode($posts);
?>
