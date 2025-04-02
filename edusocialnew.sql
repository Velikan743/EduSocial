-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2025 at 11:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edusocialnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`, `username`, `time`) VALUES
(1, 3, 1, 'Oh, so are these the types of OS?', '2025-03-27 17:11:59', 'Chinmay', '2025-03-27 17:11:59'),
(3, 2, 1, 'Could you provide some numericals for this topic?', '2025-03-27 19:06:14', 'Chinmay', '2025-03-27 19:06:14'),
(4, 4, 1, 'Spare', '2025-03-27 19:29:08', 'Chinmay', '2025-03-27 19:29:08'),
(5, 4, 1, 'Kill', '2025-03-29 11:46:33', 'Chinmay', '2025-03-29 11:46:33'),
(6, 8, 1, 'mim fr', '2025-03-29 15:19:26', 'Chinmay', '2025-03-29 15:19:26'),
(7, 7, 1, 'kamedi mimis', '2025-03-29 15:31:54', 'Chinmay', '2025-03-29 15:31:54'),
(8, 6, 1, 'real fr', '2025-03-29 15:32:06', 'Chinmay', '2025-03-29 15:32:06'),
(9, 9, 2, 'hacker hai bhai hacker fr', '2025-03-29 15:51:51', 'Karthik', '2025-03-29 15:51:51'),
(10, 13, 1, 'Lmao', '2025-03-29 16:38:33', 'Chinmay', '2025-03-29 16:38:33'),
(11, 11, 1, 'Nice View', '2025-03-29 20:49:01', 'Chinmay', '2025-03-29 20:49:01'),
(12, 1, 2, 'That&#039;s quite slow, why don&#039;t you try troubleshooting', '2025-03-30 19:16:35', 'Karthik', '2025-03-30 19:16:35'),
(13, 15, 2, 'That&#039;s a nice view', '2025-03-30 19:24:19', 'Karthik', '2025-03-30 19:24:19'),
(14, 15, 2, 'Indeed', '2025-03-30 23:08:26', 'Karthik', '2025-03-30 23:08:26'),
(15, 17, 4, 'This is how the webpage used to look initially', '2025-03-31 11:43:49', 'Allen', '2025-03-31 11:43:49'),
(16, 17, 1, 'The current version looks much better', '2025-03-31 11:44:35', 'Chinmay', '2025-03-31 11:44:35'),
(17, 18, 5, 'Here&#039;s a how basic login page would look with only an html file', '2025-03-31 21:06:44', 'Saleena', '2025-03-31 21:06:44'),
(18, 11, 1, 'ABCCC', '2025-04-02 08:09:24', 'Chinmay', '2025-04-02 08:09:24'),
(19, 14, 7, 'good photo', '2025-04-02 08:10:28', 'Leenata', '2025-04-02 08:10:28'),
(20, 19, 7, 'ok', '2025-04-02 08:14:08', 'Leenata', '2025-04-02 08:14:08'),
(21, 19, 1, 'theek hai', '2025-04-02 08:20:23', 'Chinmay', '2025-04-02 08:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `created_at`) VALUES
(1, 1, 'Hello', '2025-03-27 17:28:53'),
(2, 1, 'abc', '2025-03-30 18:05:14'),
(3, 2, 'Greetings', '2025-03-30 19:16:06'),
(4, 2, 'Yesn\'t', '2025-03-30 19:23:44'),
(5, 3, 'How\'s everyone?', '2025-03-30 23:09:31'),
(6, 4, 'We\'re pretty good', '2025-03-30 23:09:55'),
(7, 5, 'xyz', '2025-03-31 21:05:38'),
(8, 1, 'Kya bolu', '2025-04-02 07:05:35'),
(9, 2, 'abcdef', '2025-04-02 07:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `filename`, `filetype`, `filepath`, `created_at`) VALUES
(1, 1, 'Screenshot 2025-03-15 011407.png', 'image/png', 'uploads/Screenshot 2025-03-15 011407.png', '2025-03-27 16:31:02'),
(2, 1, 'Screenshot 2025-03-23 162457.png', 'image/png', 'uploads/Screenshot 2025-03-23 162457.png', '2025-03-27 16:31:12'),
(3, 1, 'Screenshot 2025-02-09 223154.png', 'image/png', 'uploads/Screenshot 2025-02-09 223154.png', '2025-03-27 16:31:32'),
(4, 1, 'Screenshot 2024-12-15 002019.png', 'image/png', 'uploads/Screenshot 2024-12-15 002019.png', '2025-03-27 19:28:58'),
(6, 1, 'Screenshot 2025-02-02 215900.png', 'image/png', 'uploads/Screenshot 2025-02-02 215900.png', '2025-03-29 14:36:22'),
(7, 1, 'Screenshot 2025-01-20 015352.png', 'image/png', 'uploads/Screenshot 2025-01-20 015352.png', '2025-03-29 14:38:33'),
(8, 1, 'Screenshot 2025-03-27 223727.png', 'image/png', 'uploads/Screenshot 2025-03-27 223727.png', '2025-03-29 14:53:01'),
(9, 2, 'Screenshot 2025-02-12 022127.png', 'image/png', 'uploads/Screenshot 2025-02-12 022127.png', '2025-03-29 15:51:16'),
(10, 3, 'Screenshot 2025-03-22 235419.png', 'image/png', 'uploads/Screenshot 2025-03-22 235419.png', '2025-03-29 16:00:08'),
(11, 3, 'Screenshot 2024-12-01 222900.png', 'image/png', 'uploads/Screenshot 2024-12-01 222900.png', '2025-03-29 16:00:35'),
(13, 2, 'v0f044gc0000cptlp3fog65t716jigsg.mov', 'video/quicktime', 'uploads/v0f044gc0000cptlp3fog65t716jigsg.mov', '2025-03-29 16:36:20'),
(14, 1, 'na2.jpg', 'image/jpeg', 'uploads/na2.jpg', '2025-03-30 18:22:38'),
(15, 1, 'Ghost of Tsushima DIRECTOR\'S CUT v1053.0.0515.2048 20-03-2025 13_23_11.png', 'image/png', 'uploads/Ghost of Tsushima DIRECTOR\'S CUT v1053.0.0515.2048 20-03-2025 13_23_11.png', '2025-03-30 19:07:38'),
(16, 4, 'Screenshot 2025-02-18 150346.png', 'image/png', 'uploads/Screenshot 2025-02-18 150346.png', '2025-03-30 23:10:22'),
(17, 6, 'Screenshot 2025-03-23 012733.png', 'image/png', 'uploads/Screenshot 2025-03-23 012733.png', '2025-03-31 11:42:53'),
(18, 5, 'Screenshot 2025-01-29 012054.png', 'image/png', 'uploads/Screenshot 2025-01-29 012054.png', '2025-03-31 21:06:08'),
(19, 7, 'WhatsApp Image 2025-03-31 at 23.58.08_7e310edd.jpg', 'image/jpeg', 'uploads/WhatsApp Image 2025-03-31 at 23.58.08_7e310edd.jpg', '2025-04-02 08:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `password`) VALUES
(1, 'Chinmay', 'chinmay@gmail.com', '9833113449', '$2y$10$LlgrnsCtRGLuzqoWPyXB/uiK7JHd24Ggwc9weum8FzjMa2I6csaBW'),
(2, 'Karthik', 'karthik@gmail.com', '1234567890', '$2y$10$nHcBM6b0bNksTsRw4O6aiulZ7Zn7IHERL7JTYuPrlYjZZW4t0Flui'),
(3, 'Tejas', 'tejas@gmail.com', '9812472910', '$2y$10$ithcRQ7dQlrDcmdyBoljVe3/Rc1bUcIof8rAQlyayaODUGwH36QVm'),
(4, 'Allen', 'allen@gmail.com', '7437437432', '$2y$10$iUzgE5Gual/0UAZh5pXzi.Oz2VP8q745lMcqnJoeqEd33lIvTdGGu'),
(5, 'Saleena', 'saleena@gmail.com', '9819282525', '$2y$10$.Q8cztEyPRAu51b1GaApLOiN3bSnZ7M3ORQ28RE5Ev/q/aVumg8VC'),
(6, 'Charu', 'charushree@gmail.com', '9167967657', '$2y$10$.TsbomOmzrejfCfwzo3FLuAiIyWRWYWIUK8K01PWjZsJL0JEgS90y'),
(7, 'Leenata', 'leenata@gmail.com', '1234123412', '$2y$10$HmHCY1abwL/G7h3QUTrUnuc1TLgj.9W39sNTX854jcy50UqCByH0O');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
