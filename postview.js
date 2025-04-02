document.getElementById("homeBtn").addEventListener("click", function () {
    window.location.href = "index.html";
});

document.addEventListener("DOMContentLoaded", function () {
    let urlParams = new URLSearchParams(window.location.search);
    let postId = urlParams.get("post_id");

    if (!postId) {
        alert("No post selected!");
        window.location.href = "index.html";
    }

    // Fetch and display the post
    fetch(`postview.php?id=${postId}`)
        .then(response => response.json())
        .then(data => {
            if (!data.success) {
                alert(data.message);
                window.location.href = "index.html";
                return;
            }
            let post = data.post;
            let postContainer = document.getElementById("postContainer");

            let postElement = document.createElement("div");
            postElement.classList.add("post");

            let username = document.createElement("p");
            username.innerHTML = `<strong>${post.username}</strong>`;
            postElement.appendChild(username);

            if (post.filetype.startsWith("image")) {
                let img = document.createElement("img");
                img.src = post.filepath;
                img.alt = "Uploaded Image";
                postElement.appendChild(img);
            } else if (post.filetype.startsWith("video")) {
                let video = document.createElement("video");
                video.src = post.filepath;
                video.controls = true;
                postElement.appendChild(video);
            }

            postContainer.appendChild(postElement);
        })
        .catch(error => console.error("Error fetching post:", error));

    function loadComments() {
        fetch(`fetch_comments.php?post_id=${postId}`)
            .then(response => response.json())
            .then(data => {
                if (!data.success) {
                    console.error("Error fetching comments:", data.message);
                    return;
                }

                let commentList = document.getElementById("commentList");
                commentList.innerHTML = ""; // Clear previous comments

                data.comments.forEach(comment => {
                    let commentElement = document.createElement("div");
                    commentElement.classList.add("comment");

                    // Username (Left-aligned)
                    let username = document.createElement("strong");
                    username.textContent = comment.username;
                    username.classList.add("commentUsername");

                    // Comment text (Next to username) - Decoding entities
                    let commentText = document.createElement("span");
                    commentText.innerHTML = comment.comment; // Decodes HTML entities
                    commentText.classList.add("commentText");

                    // Time (Right-aligned)
                    let time = document.createElement("span");
                    time.textContent = comment.time;
                    time.classList.add("commentTime");

                    // Append elements to comment container
                    commentElement.appendChild(username);
                    commentElement.appendChild(commentText);
                    commentElement.appendChild(time);

                    commentList.appendChild(commentElement);
                });
            })
            .catch(error => console.error("Error fetching comments:", error));
    }

    loadComments();

    document.getElementById("commentForm").addEventListener("submit", function (event) {
        event.preventDefault();
        let commentText = document.getElementById("commentText").value;

        fetch("add_comment.php", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: `post_id=${postId}&comment=${encodeURIComponent(commentText)}`
        })
            .then(response => response.json())
            .then(result => {
                alert(result.message);
                if (result.success) {
                    document.getElementById("commentText").value = "";
                    loadComments();
                }
            })
            .catch(error => console.error("Error posting comment:", error));
    });
});
