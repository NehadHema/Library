-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2023 at 09:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `desc` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('soft','hard') NOT NULL DEFAULT 'soft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `desc`, `image`, `price`, `category_id`, `user_id`, `created_at`, `updated_at`, `type`) VALUES
(2, 'book one', 'desc one', 'cate.jpeg', '200.00', 2, 2, '2023-05-15 08:49:49', '2023-05-15 08:49:49', 'soft'),
(3, 'book two', 'desc two', 'cate.jpeg', '200.00', 10, 2, '2023-05-15 08:52:32', '2023-05-15 08:52:32', 'soft'),
(6, 'book five', 'desc five', 'cate.jpg', '200.00', 3, 1, '2023-05-15 09:08:28', '2023-05-15 09:08:28', 'soft'),
(7, 'html', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque urna libero, mattis a convallis eleifend, ullamcorper et leo. Nullam pellentesque, lacus quis venenatis accumsan, lectus mauris volutpat sapien, a pharetra nibh nulla non lorem. Integer volutpat ultrices faucibus. Nam mattis orci a convallis tincidunt. Praesent vel sollicitudin libero. Donec vel tortor nec turpis placerat pellentesque. In justo nisl, laoreet vitae tempor sed, congue in dui.', 'books/3E6NLK2UksI2IyElDbxn234QYtwmf08UTo58XL7d.png', '500.00', 1, 2, '2023-05-16 13:53:38', '2023-05-16 13:53:38', 'soft'),
(8, 'css', 'decorate the design of the website', 'books/1ZjRb2VJGBviJwCS7TJIzttjYMJIx9f09Qs0PM1R.png', '500.00', 9, 2, '2023-05-17 01:44:02', '2023-05-17 01:44:02', 'soft'),
(9, 'JS', 'scripting language', 'books/XuURQRg0JciE4VLo6Osv8rSqBbhxKxmgAPe8UAOa.jpg', '1000.00', 1, 2, '2023-05-17 01:46:37', '2023-05-17 01:46:37', 'soft'),
(10, 's', 'vvv', 'books/HXhWYFdTlk1ESxfre8XrBExbvSfepqWKpa17YmmU.jpg', '5000.00', 1, 2, '2023-08-31 16:23:42', '2023-08-31 16:48:02', 'soft');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `desc`, `image`, `created_at`, `updated_at`) VALUES
(1, 'title1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor', 'categories/hQcjAIzWnh223uPyZrxE18CHpNb4XVpKZ0VJumYx.jpg', NULL, '2023-05-17 01:40:09'),
(2, 'title2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor', NULL, NULL, NULL),
(3, 'Sofa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor', NULL, '2023-05-07 07:33:21', '2023-05-07 07:33:21'),
(4, 'ggg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor.', NULL, '2023-05-07 07:35:36', '2023-05-07 07:35:36'),
(5, 'ggg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor.', NULL, '2023-05-07 07:37:08', '2023-05-07 07:37:08'),
(6, 'title6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor.', NULL, '2023-05-07 07:37:29', '2023-05-07 07:37:29'),
(7, 'title6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor.', NULL, '2023-05-07 07:41:00', '2023-05-07 07:41:00'),
(8, 'title6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor.', NULL, '2023-05-07 07:41:43', '2023-05-07 07:41:43'),
(9, 'title6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor.', NULL, '2023-05-07 07:43:46', '2023-05-07 07:43:46'),
(10, 'title 6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique erat nec posuere aliquet. Maecenas eu mauris vitae neque dictum sodales et id enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sem arcu, elementum sed quam at, aliquam fermentum ex. Nulla in ex scelerisque, eleifend nisi non, posuere velit. Mauris justo purus, consequat quis fermentum et, viverra eget urna. Sed ullamcorper placerat neque vitae condimentum. Suspendisse ut ante sed orci consectetur varius. Maecenas rutrum eros elit, vitae euismod augue mollis id. In luctus sem eu felis hendrerit porttitor.', NULL, '2023-05-07 07:44:49', '2023-05-09 11:17:33'),
(14, 'g', 'h', NULL, '2023-05-09 12:16:36', '2023-05-09 12:16:36'),
(15, 'fff', 'hhh', NULL, '2023-05-09 12:19:00', '2023-05-09 12:19:00'),
(16, 'h', 'h', NULL, '2023-05-09 12:20:06', '2023-05-09 12:20:06'),
(17, 'p', 'o', NULL, '2023-05-09 12:22:26', '2023-05-09 12:22:26'),
(18, 'gggg', 'gggggkkkkkkkk', NULL, '2023-05-09 12:23:08', '2023-05-09 12:23:22'),
(19, 'jj', 'kkk', NULL, '2023-05-09 12:26:34', '2023-05-09 12:26:34'),
(22, 'jjj', 'www', NULL, '2023-05-09 12:28:49', '2023-05-09 12:28:49'),
(23, 'nn', 'nnn', 'categories/XMtk65PUeHtshjEDCW9tYPrTnUnC2jMjHufQ40Ir.jpg', '2023-05-10 12:35:18', '2023-05-10 13:02:18'),
(25, 'programming', 'web Application', 'categories/XCFPbwznyPrkEDTKARQzfQg7ccL7Qz9f9TLErUFL.png', '2023-05-17 01:32:47', '2023-05-17 01:32:47'),
(26, 'enim', 'Consequuntur et magnam magnam ut nihil accusantium et. Cumque voluptatem facere ducimus occaecati. Perspiciatis animi eaque eos sunt.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(27, 'sapiente', 'Aut quis aspernatur rerum ipsam cumque. Dolorum doloribus et quo totam ratione. Assumenda pariatur consequatur aut a. Voluptas voluptatem saepe nam earum. Rerum id quia iure illo omnis voluptate.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(28, 'totam', 'Architecto quia aliquid et sint magni. A earum a quasi est officiis.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(29, 'facere', 'Consequuntur illo officia praesentium laboriosam. Enim quas ut aperiam est alias cupiditate. Perferendis voluptatum nisi aspernatur sunt qui.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(30, 'repudiandae', 'Omnis nostrum minima voluptas est doloremque tenetur cum. Maxime eum et magnam sit. Fugit velit sint accusantium et aut dolores aut. Maxime est neque tempora perferendis.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(31, 'neque', 'Ut ipsa laudantium at vel praesentium. Eum harum nihil sapiente omnis natus in. Earum saepe corrupti quaerat. Saepe nesciunt laboriosam qui doloribus consequatur odit magni.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(32, 'hic', 'Quo quibusdam autem velit ipsam corrupti. Aut quia ut eum doloribus ut deleniti aut. Voluptates nostrum sed perferendis temporibus quis molestiae consectetur quis. Quis aperiam provident qui quidem.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(33, 'deserunt', 'Nesciunt qui rem animi omnis est. Ut quo aut animi rerum eius in.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(34, 'praesentium', 'Voluptas quia nam dolorem quaerat officiis atque voluptatem. Consequatur autem et asperiores reprehenderit quia molestiae.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(35, 'quos', 'Ut sit consectetur accusantium unde eaque unde tempore ad. Qui deserunt quia numquam porro est. Maiores optio nihil rem qui corrupti.', NULL, '2023-05-17 15:24:10', '2023-05-17 15:24:10'),
(36, 'category One', 'new desc', NULL, NULL, NULL),
(37, 'AdpF0h1PT5', 'Rkc9eKOynCJexXWBD9sEDwMn2MkODgIQEvMM9DAgRrCOc2gEdy', NULL, '2023-05-21 11:26:48', '2023-05-21 11:26:48'),
(38, 'VblPcg0mwS', 'uy61ShDpW2s0ADXYRZ2KBagP9hJGVgn1cIKRKXE1fyMAC8RUJL', NULL, '2023-05-21 11:26:48', '2023-05-21 11:26:48'),
(39, 'O3FL7ekJ7f', 'Jb3Vca0LwVv5OZCObPgLFs1Tz6VJVxPz2d49lEY6OUjnZb8oB0', NULL, '2023-05-21 11:26:48', '2023-05-21 11:26:48'),
(40, 'BYQXrGnHjV', '4xdW4AennYa6UIQxOy1g41gBDxTuo94x6qnGOOCT5OxXsrdwTA', NULL, '2023-05-21 11:26:48', '2023-05-21 11:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_07_053517_create_categories_table', 1),
(6, '2023_05_11_101038_create_books_table', 2),
(7, '2023_05_11_101704_update-in-books-table', 3),
(8, '2023_05_11_102327_add-to-books-table', 4),
(9, '2023_05_21_214543_add_to__users_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'ali', 'a@a.com', NULL, '$2y$10$K6iUvVEareg39gGqOIjmkOLncNZ7Vegt2YjhM7qFlu5YMVC8BjDPe', NULL, '2023-05-14 17:11:11', '2023-05-14 17:11:11', 'user'),
(2, 'ahmed', 'ahmed@a.com', NULL, '$2y$10$puOH5Wdyqro9xZOZLAz7LOo5BYZXZHns8zaSlsnI.737cEZy7uf8i', NULL, '2023-05-14 17:11:38', '2023-05-14 17:11:38', 'user'),
(3, 'Nehad', 'n@gmail.com', NULL, '$2y$10$/wvmUMYwIaRC0Sj7d7eTXeGt.csiPoc1UEyMNaH/2yQf0coQ/UTMO', NULL, '2023-05-17 16:26:45', '2023-05-17 16:26:45', 'admin'),
(4, 'Noha', 'n@y.com', NULL, '$2y$10$Te6J4HRcerFqTCC6gHlGAOr2P3xBRHcyMT4rF6iKCset8cndI3NxK', NULL, '2023-06-17 04:22:11', '2023-06-17 04:22:11', 'admin'),
(5, 'Adel', 'adel@g.com', NULL, '$2y$10$/HvarXKpvZQgVv0AiSt9jekve8ZvsD85PrmJwlTPmLBjOnrLHQh7S', NULL, '2023-07-16 03:21:43', '2023-07-16 03:21:43', 'user'),
(6, 'ggg', 'it_teacher2012@yahoo.com', NULL, '$2y$10$b7ulHQLirHrwYBPl.WrpgOINwNKQeu3IINO./XespWOSmHNjKv2UK', NULL, '2023-08-31 15:54:08', '2023-08-31 15:54:08', 'user'),
(7, 'Sofa', 'engnehad2021@gmail.com', NULL, '$2y$10$sMY0IGktPTPZzibvYXvlsu1MsYo4cJwBYX67Zv6WEvxnqiWUumoou', NULL, '2023-08-31 16:00:03', '2023-08-31 16:00:03', 'user'),
(8, 'ggg', 't@t.com', NULL, '$2y$10$NSEFupCZLxhAtK1dR6XaDOVYono9HPZn6V3OOnQZbtFo/y7KWuVWq', NULL, '2023-08-31 16:14:52', '2023-08-31 16:14:52', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_category_id_foreign` (`category_id`),
  ADD KEY `books_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
