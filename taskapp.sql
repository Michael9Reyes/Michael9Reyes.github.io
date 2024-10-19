-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2024 a las 03:00:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taskapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2024-10-10-235214', 'App\\Database\\Migrations\\CreateTask', 'default', 'App', 1728614000, 1),
(2, '2024-10-10-235214', 'App\\Database\\Migrations\\AddTimestampsToTask', 'default', 'App', 1728615768, 2),
(3, '2024-10-14-005517', 'App\\Database\\Migrations\\CreateUser', 'default', 'App', 1728868593, 3),
(4, '2024-10-15-143657', 'App\\Database\\Migrations\\AddUserIdToTask', 'default', 'App', 1729003916, 4),
(5, '2024-10-15-171255', 'App\\Database\\Migrations\\AddIndexToTaskCreatedAt', 'default', 'App', 1729012548, 5),
(6, '2024-10-15-220126', 'App\\Database\\Migrations\\AddIsAdminToUser', 'default', 'App', 1729030167, 6),
(7, '2024-10-16-012058', 'App\\Database\\Migrations\\AddAccountActivationToUser', 'default', 'App', 1729042068, 7),
(8, '2024-10-16-170056', 'App\\Database\\Migrations\\CreateTask', 'default', 'App', 1729107132, 8),
(9, '2024-10-16-183656', 'App\\Database\\Migrations\\AddPasswordResetToUser', 'default', 'App', 1729107132, 8),
(10, '2024-10-17-035430', 'App\\Database\\Migrations\\AddProfileImageToUser', 'default', 'App', 1729137603, 9),
(11, '2024-10-17-182433', 'App\\Database\\Migrations\\CreateRememberedLogin', 'default', 'App', 1729197674, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remembered_login`
--

CREATE TABLE `remembered_login` (
  `token_hash` varchar(64) NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` int(5) UNSIGNED NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `task`
--

INSERT INTO `task` (`id`, `description`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Task ones', '2024-10-15 22:27:25', '2024-10-18 04:28:52', 12),
(2, 'This task', '2024-10-15 22:27:36', '2024-10-17 22:27:39', 12),
(3, 'another task', '2024-10-15 22:27:43', '2024-10-17 22:28:16', 2),
(4, '', '2024-10-15 22:27:47', '2024-10-16 22:28:24', 2),
(5, 'An important task', '2024-10-15 22:27:50', '2024-10-17 22:28:27', 2),
(6, 'something to do ', '2024-10-15 22:27:55', '2024-10-17 22:28:29', 12),
(7, 'An interesting task', '2024-10-15 22:27:58', '2024-10-17 22:28:32', 2),
(9, '<em>XSS?</em>', '2024-10-15 22:28:07', '2024-10-17 22:28:39', 2),
(10, 'To do today urgently', '2024-10-15 22:28:13', '2024-10-17 22:28:35', 12),
(11, 'A task with timestamps edited', '2024-10-13 23:35:51', '2024-10-13 23:36:09', 2),
(13, 'Something interesting', '2024-10-15 01:55:07', '2024-10-15 01:55:07', 2),
(14, 'A new task', '2024-10-15 16:55:52', '2024-10-15 16:55:52', NULL),
(15, 'A fun task changed', '2024-10-15 16:56:20', '2024-10-15 17:01:04', 2),
(16, 'Urgent task ', '2024-10-15 17:08:09', '2024-10-15 17:08:09', 2),
(17, 'Task prueba', '2024-10-17 21:18:58', '2024-10-17 21:18:58', 2),
(18, 'Task new', '2024-10-18 00:44:50', '2024-10-18 00:44:50', 12),
(20, 'Hello', '2024-10-18 16:28:51', '2024-10-18 16:28:51', 12),
(21, 'Hello mister', '2024-10-18 21:54:10', '2024-10-18 21:54:10', 12),
(22, 'Tasksssss', '2024-10-18 22:35:03', '2024-10-18 22:35:03', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `activation_hash` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `reset_hash` varchar(64) DEFAULT NULL,
  `reset_expires_at` datetime DEFAULT NULL,
  `profile_image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`, `is_admin`, `activation_hash`, `is_active`, `reset_hash`, `reset_expires_at`, `profile_image`) VALUES
(1, 'Dave', 'dave@example.com', '$2y$10$4xdnQcHzcRxvkhQQqJPQ9.gBkWHA1nv5v2sQrkMxT0PcoTdgq02zu', '2024-10-10 13:06:52', '2024-10-16 21:10:08', 0, NULL, 0, NULL, NULL, NULL),
(2, 'Alice', 'alice@example.com', '$2y$10$L8xXi9YKAwrkbnPXjggHB.WSiPO9jaHMJGJ7J3jRWA0/NTAswD562', '2024-10-10 13:07:04', '2024-10-16 21:18:10', 1, NULL, 1, NULL, NULL, NULL),
(5, 'Mary', 'mary@example.com', '$2y$10$v6izImLD8Gw7pIv4SMy1geJRUZCPW1z1.pfUVI/h33scJEOQBsKTa', '2024-10-15 13:07:12', '2024-10-15 15:50:26', 0, NULL, 0, NULL, NULL, NULL),
(8, 'Admin', 'admin@example.com', '$2y$10$fbBE.1fS35RVHojlCZBpb.xnVqkd4QprYru4MK1OwvZse1VwErjiy', '2024-10-15 16:28:48', '2024-10-16 22:36:51', 1, NULL, 1, '9ff2d90913800411ba4ff2e9903598981424293e9659104f38d93ad3f59e952f', '2024-10-17 00:36:00', NULL),
(9, 'Admin2', 'admin2@example.com', '$2y$10$OZqD0yh4llogFCu3FTm9/e7VyG/2TLxfTUa8C5458Hb.2LV0UUNs6', '2024-10-15 19:09:02', '2024-10-15 19:09:06', 1, NULL, 0, NULL, NULL, NULL),
(10, 'Emily', 'emily@example.com', '$2y$10$rdWZ2lpEPDw2R8NCW1COiuHgcbdrgNRvhYdhenahj3yswAzyeEvwe', '2024-10-15 22:29:18', '2024-10-17 22:29:22', 0, '42b47eb075c4bbf9f631bdb0b8f276bd35159605fc93896dbb548493f31d7a25', 1, NULL, NULL, NULL),
(12, 'Michaels', 'mreyesg30@miumg.edu.gt', '$2y$10$v9xLvGFbraW2.PzXa0FMhu0RsoJdJ21DpfdMdCwi9OJ.wTIbIo.GC', '2024-10-15 22:29:12', '2024-10-18 22:30:01', 1, NULL, 1, NULL, NULL, '1729290601_03df1943bc707576f352.jpeg'),
(13, 'Reynaldo', 'michael90reyes@gmail.com', '$2y$10$WKFuwMx68nXl8zBTTeQJ7ODDcxJR06qSrc1TiFF25IaTQFtjCnsK2', '2024-10-19 00:11:21', '2024-10-19 00:12:35', 0, NULL, 1, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `remembered_login_user_id_foreign` (`user_id`),
  ADD KEY `expires_at` (`expires_at`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_user_id_fk` (`user_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `activation_hash` (`activation_hash`),
  ADD UNIQUE KEY `reset_hash` (`reset_hash`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD CONSTRAINT `remembered_login_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
