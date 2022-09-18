-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 18 sep. 2022 à 16:31
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `exchange_toy`
--

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `toy_uri` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toy_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `toy_uri`, `toy_id`, `created_at`, `updated_at`) VALUES
(1, 'http://localhost:8000/storage/toy/Coding game1.jpg', 2, '2022-09-18 09:45:11', '2022-09-18 09:45:11'),
(2, 'http://localhost:8000/storage/toy/Coding game10.png', 2, '2022-09-18 09:45:11', '2022-09-18 09:45:11'),
(3, 'http://localhost:8000/storage/toy/Hamburger5.jpg', 3, '2022-09-18 09:48:24', '2022-09-18 09:48:24'),
(4, 'http://localhost:8000/storage/toy/Hamburger4.jpg', 3, '2022-09-18 09:48:25', '2022-09-18 09:48:25'),
(5, 'http://localhost:8000/storage/toy/Trampoline3.jpg', 4, '2022-09-18 09:49:08', '2022-09-18 09:49:08'),
(6, 'http://localhost:8000/storage/toy/Trampoline10.jpg', 4, '2022-09-18 09:49:08', '2022-09-18 09:49:08'),
(7, 'http://localhost:8000/storage/toy/Trampoline1.jpg', 4, '2022-09-18 09:49:09', '2022-09-18 09:49:09'),
(8, 'http://localhost:8000/storage/toy/Trampoline3.jpg', 5, '2022-09-18 09:50:02', '2022-09-18 09:50:02'),
(9, 'http://localhost:8000/storage/toy/Trampoline9.jpg', 5, '2022-09-18 09:50:02', '2022-09-18 09:50:02'),
(10, 'http://localhost:8000/storage/toy/Trampoline6.jpg', 5, '2022-09-18 09:50:02', '2022-09-18 09:50:02'),
(11, 'http://localhost:8000/storage/toy/Avion9.png', 6, '2022-09-18 09:52:15', '2022-09-18 09:52:15'),
(12, 'http://localhost:8000/storage/toy/Avion6.jpg', 6, '2022-09-18 09:52:15', '2022-09-18 09:52:15'),
(13, 'http://localhost:8000/storage/toy/Avion0.jpg', 6, '2022-09-18 09:52:16', '2022-09-18 09:52:16'),
(14, 'http://localhost:8000/storage/toy/Avion1.jpg', 6, '2022-09-18 09:52:16', '2022-09-18 09:52:16'),
(15, 'http://localhost:8000/storage/toy/Chopper1.jpg', 7, '2022-09-18 09:52:44', '2022-09-18 09:52:44');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_09_18_124301_create_images_table', 1),
(3, '2022_09_18_124301_create_toys_table', 1),
(4, '2022_09_18_124301_create_users_table', 1),
(5, '2022_09_18_124302_add_foreign_keys_to_images_table', 1),
(6, '2022_09_18_124302_add_foreign_keys_to_toys_table', 1),
(7, '2022_09_18_125657_create_images_table', 0),
(8, '2022_09_18_125657_create_personal_access_tokens_table', 0),
(9, '2022_09_18_125657_create_toys_table', 0),
(10, '2022_09_18_125657_create_users_table', 0),
(11, '2022_09_18_125658_add_foreign_keys_to_images_table', 0),
(12, '2022_09_18_125658_add_foreign_keys_to_toys_table', 0),
(13, '2022_09_18_134652_create_images_table', 0),
(14, '2022_09_18_134652_create_personal_access_tokens_table', 0),
(15, '2022_09_18_134652_create_toys_table', 0),
(16, '2022_09_18_134652_create_users_table', 0),
(17, '2022_09_18_134653_add_foreign_keys_to_images_table', 0),
(18, '2022_09_18_134653_add_foreign_keys_to_toys_table', 0);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `toys`
--

CREATE TABLE `toys` (
  `id` int(11) NOT NULL,
  `toy_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_to` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `toys`
--

INSERT INTO `toys` (`id`, `toy_name`, `status`, `exchange_to`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Coding game', 'active', 'Programming', 1, '2022-09-18 09:45:11', '2022-09-18 10:14:05'),
(3, 'Hamburger', 'active', 'Pain', 2, '2022-09-18 09:48:24', '2022-09-18 09:56:19'),
(4, 'Trampoline', 'active', 'Piscine', 3, '2022-09-18 09:49:08', '2022-09-18 09:56:33'),
(5, 'Trampoline', 'active', 'Piscine', 3, '2022-09-18 09:50:02', '2022-09-18 09:56:38'),
(6, 'Avion', 'inactive', 'Piscine', 4, '2022-09-18 09:52:15', '2022-09-18 10:13:33'),
(7, 'Chopper', 'active', 'Zoro', 4, '2022-09-18 09:52:44', '2022-09-18 09:56:48');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `user_name`, `contact`, `created_at`, `updated_at`) VALUES
(1, 'Harilaza', '261385027232', '2022-09-18 09:42:49', '2022-09-18 09:42:49'),
(2, 'Onimalala', '261349000230', '2022-09-18 09:48:24', '2022-09-18 09:48:24'),
(3, 'Johanne', '261344326588', '2022-09-18 09:49:08', '2022-09-18 09:49:08'),
(4, 'Elisa', '261344665445', '2022-09-18 09:52:14', '2022-09-18 09:52:14');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FKimages458685` (`toy_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `toys`
--
ALTER TABLE `toys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FKtoys984664` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `toys`
--
ALTER TABLE `toys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FKimages458685` FOREIGN KEY (`toy_id`) REFERENCES `toys` (`id`);

--
-- Contraintes pour la table `toys`
--
ALTER TABLE `toys`
  ADD CONSTRAINT `FKtoys984664` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
