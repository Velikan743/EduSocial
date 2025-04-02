document.addEventListener("DOMContentLoaded", function () {
    let feed = document.getElementById("feed");

    // Function to fetch and display posts
    function fetchPosts(username = "") {
        let url = username ? `search_posts.php?username=${encodeURIComponent(username)}` : "fetch_posts.php";
        fetch(url)
            .then(response => response.json())
            .then(posts => {
                feed.innerHTML = "";

                posts.forEach(post => {
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

                    // Add "Comments" button
                    let commentBtn = document.createElement("button");
                    commentBtn.textContent = "Comments";
                    commentBtn.classList.add("comment-btn");
                    commentBtn.addEventListener("click", function () {
                        window.location.href = `postview.html?post_id=${post.id}`;
                    });

                    postElement.appendChild(commentBtn);
                    feed.appendChild(postElement);
                });
            })
            .catch(error => console.error("Error fetching posts:", error));
    }

    // Load all posts initially
    fetchPosts();

    // Search functionality
    let searchBtn = document.getElementById("searchBtn");
    if (searchBtn) {
        searchBtn.addEventListener("click", function () {
            let username = document.getElementById("searchInput").value.trim();
            fetchPosts(username);
        });
    }

    // Upload functionality
    let postBtn = document.getElementById("postBtn");
    let popup = document.getElementById("uploadPopup");
    let closePopup = document.getElementById("closePopup");
    let fileInput = document.getElementById("fileInput");
    let fileNameDisplay = document.getElementById("fileNameDisplay");
    let uploadBtn = document.getElementById("uploadBtn");

    if (postBtn) {
        postBtn.addEventListener("click", function () {
            popup.style.display = "flex";
        });
    }

    if (closePopup) {
        closePopup.addEventListener("click", function () {
            popup.style.display = "none";
            fileInput.value = ""; // Reset file input
            fileNameDisplay.textContent = "No file chosen"; // Clear file name display
        });
    }

    // Show selected file name
    if (fileInput) {
        fileInput.addEventListener("change", function () {
            if (fileInput.files.length > 0) {
                fileNameDisplay.textContent = "Selected file: " + fileInput.files[0].name;
                fileNameDisplay.style.color = "black"; // Ensure visibility
            } else {
                fileNameDisplay.textContent = "No file chosen";
            }
        });
    }

    let uploadForm = document.getElementById("uploadForm");
    if (uploadForm) {
        uploadForm.addEventListener("submit", function (event) {
            event.preventDefault();
            let formData = new FormData(uploadForm);

            fetch("upload.php", {
                method: "POST",
                body: formData
            })
                .then(response => response.text())
                .then(result => {
                    alert(result);
                    popup.style.display = "none";
                    location.reload();
                })
                .catch(error => console.error("Error uploading file:", error));
        });
    }

    let chatBtn = document.getElementById("chatBtn");
    if (chatBtn) {
        chatBtn.addEventListener("click", function () {
            window.location.href = "chat.html";
        });
    }

    let logoutBtn = document.getElementById("logoutBtn");
    if (logoutBtn) {
        logoutBtn.addEventListener("click", function () {
            fetch("logout.php")
                .then(() => {
                    window.location.href = "login.html";
                })
                .catch(error => console.error("Logout failed:", error));
        });
    }
});
