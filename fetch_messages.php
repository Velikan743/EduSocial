<?php
$conn = new mysqli("localhost", "root", "", "edusocialnew");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query("SELECT messages.id, messages.user_id, messages.message, messages.created_at, users.username 
                        FROM messages 
                        JOIN users ON messages.user_id = users.id 
                        ORDER BY messages.created_at ASC");

$messages = array();
while ($row = $result->fetch_assoc()) {
    $messages[] = [
        "id" => $row["id"],
        "username" => $row["username"],
        "message" => $row["message"],
        "timestamp" => $row["created_at"]  // Ensuring created_at is included
    ];
}

echo json_encode($messages);

$conn->close();
?>
