-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: sql.freedb.tech
-- Generation Time: Oct 02, 2025 at 06:57 PM
-- Server version: 8.0.43-0ubuntu0.22.04.1
-- PHP Version: 8.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freedb_techie`
--
CREATE DATABASE IF NOT EXISTS `freedb_techie` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `freedb_techie`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_96fa568404f358bd48e44f7bbdf3f68c', 'i:1;', 1756893400),
('laravel_cache_96fa568404f358bd48e44f7bbdf3f68c:timer', 'i:1756893399;', 1756893399),
('laravel_cache_cc28d992d5ac0888e0b4ebb67cfb0dfd', 'i:1;', 1756894447),
('laravel_cache_cc28d992d5ac0888e0b4ebb67cfb0dfd:timer', 'i:1756894446;', 1756894446),
('laravel_cache_dd79bdc4b62e97a97c6e3944ba3890d4', 'i:1;', 1759081638),
('laravel_cache_dd79bdc4b62e97a97c6e3944ba3890d4:timer', 'i:1759081637;', 1759081637);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-09-02 07:16:58', '2025-09-02 07:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(34, 1, 5, 1, 10000.00, '2025-10-01 11:37:21', '2025-10-01 15:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Laptops', '2025-09-02 13:23:03', '2025-09-02 13:23:03'),
(2, 'Phones', '2025-09-02 13:23:04', '2025-09-02 13:23:04'),
(3, 'Accessories', '2025-09-02 13:23:05', '2025-09-02 13:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_logins`
--

CREATE TABLE `failed_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"5ddaef61-856c-426b-9a6f-b74ae34bc424\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756799587, 1756799587),
(2, 'default', '{\"uuid\":\"23651567-e012-4fef-a0a3-ce73fbf12b61\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756799588, 1756799588),
(3, 'default', '{\"uuid\":\"635073ce-d060-4934-bdd3-f100e785198f\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756799590, 1756799590),
(4, 'default', '{\"uuid\":\"e62df13a-c50f-450b-b563-3d050afb6b5e\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756800402, 1756800402),
(5, 'default', '{\"uuid\":\"b81a752d-a7cf-4b97-b4e7-798a0343a171\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756800697, 1756800697),
(6, 'default', '{\"uuid\":\"77a827ef-e03e-4c38-a3a8-f157516334a7\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756837697, 1756837697),
(7, 'default', '{\"uuid\":\"52d54737-aab8-48ae-abda-c80de6622af6\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756840999, 1756840999),
(8, 'default', '{\"uuid\":\"733d3a5e-c938-4575-aaa9-0883cd0995eb\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756847113, 1756847113),
(9, 'default', '{\"uuid\":\"5b7d05d2-9cb3-42e7-9ddd-0c2fe9bcd23e\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756894567, 1756894567),
(10, 'default', '{\"uuid\":\"bdaadfa5-d2c0-49be-8c0a-a363ef92b60a\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756895409, 1756895409),
(11, 'default', '{\"uuid\":\"2371ae9a-be84-490a-b8d7-68f5fe03f145\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756909388, 1756909388),
(12, 'default', '{\"uuid\":\"8706baea-101a-483e-ad71-a2d538952373\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1756909389, 1756909389),
(13, 'default', '{\"uuid\":\"1e8891c4-710b-416e-8de8-0cce01d46924\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1759257214, 1759257214),
(14, 'default', '{\"uuid\":\"7db88505-31c2-47d8-bb3f-61ee483c302e\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1759311766, 1759311766),
(15, 'default', '{\"uuid\":\"d8ccc158-de1a-4803-86d9-a91c13657d02\",\"displayName\":\"App\\\\Jobs\\\\CacheHomepage\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CacheHomepage\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CacheHomepage\\\":0:{}\"}}', 0, NULL, 1759317821, 1759317821);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_01_000001_add_role_to_users_table', 1),
(5, '2025_01_01_000100_create_categories_table', 1),
(6, '2025_01_01_000101_create_products_table', 1),
(7, '2025_01_01_000200_create_carts_and_items', 1),
(8, '2025_01_01_000300_create_orders_and_items', 1),
(9, '2025_01_01_000400_create_failed_logins_table', 1),
(10, '2025_08_19_051310_add_two_factor_columns_to_users_table', 1),
(11, '2025_08_19_051357_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `subtotal` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `payment_ref` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `subtotal`, `tax`, `total`, `payment_ref`, `created_at`, `updated_at`) VALUES
(1, 1, 'paid', 10000.00, 1000.00, 11000.00, 'SIM-TU8CKPLFOI', '2025-09-03 10:16:06', '2025-09-03 10:16:07'),
(2, 1, 'paid', 199.99, 20.00, 219.99, 'SIM-RNHM2OYMZG', '2025-09-03 10:30:08', '2025-09-03 10:30:09'),
(3, 1, 'paid', 10199.99, 1020.00, 11219.99, 'SIM-BB7CT2Y8JM', '2025-09-03 14:23:07', '2025-09-03 14:23:07'),
(4, 1, 'paid', 10000.00, 1000.00, 11000.00, 'SIM-IS5FY58THJ', '2025-09-30 18:33:33', '2025-09-30 18:33:33'),
(5, 1, 'paid', 599.97, 60.00, 659.97, 'SIM-BCP6NVURKT', '2025-10-01 09:42:45', '2025-10-01 09:42:45'),
(6, 1, 'paid', 399.98, 40.00, 439.98, 'SIM-ASA1BLYSVP', '2025-10-01 11:23:40', '2025-10-01 11:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, 10000.00, '2025-09-03 10:16:06', '2025-09-03 10:16:06'),
(2, 2, 3, 1, 199.99, '2025-09-03 10:30:08', '2025-09-03 10:30:08'),
(3, 3, 3, 1, 199.99, '2025-09-03 14:23:08', '2025-09-03 14:23:08'),
(4, 3, 5, 1, 10000.00, '2025-09-03 14:23:09', '2025-09-03 14:23:09'),
(5, 4, 5, 1, 10000.00, '2025-09-30 18:33:34', '2025-09-30 18:33:34'),
(6, 5, 3, 3, 199.99, '2025-10-01 09:42:46', '2025-10-01 09:42:46'),
(7, 6, 3, 2, 199.99, '2025-10-01 11:23:40', '2025-10-01 11:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'mobile', '8b429d3a53983d032d0d3cc86c15f2b88bf27b8bc12ad68f6f2bc063baa99197', '[\"read-products\"]', '2025-09-03 12:48:48', NULL, '2025-09-03 12:47:38', '2025-09-03 12:48:48'),
(2, 'App\\Models\\User', 6, 'flutter_app', '84e7c7a37c39435f54b5204ea5829d4e53ee90e1b724863417fd208a27991294', '[\"read-products\"]', NULL, NULL, '2025-09-03 13:09:50', '2025-09-03 13:09:50'),
(3, 'App\\Models\\User', 1, 'flutter_app', '6b768096266859fea53c8e99dc6b0aa047282219ae3208f417e40fea556184da', '[\"read-products\"]', '2025-09-03 13:51:28', NULL, '2025-09-03 13:50:10', '2025-09-03 13:51:28'),
(4, 'App\\Models\\User', 1, 'flutter_app', '61ef23403ec4f9160af19ac6c32f2d15b8fd1d6621a1294d29f69b4e2abf30bf', '[\"read-products\"]', '2025-09-03 14:02:58', NULL, '2025-09-03 14:02:47', '2025-09-03 14:02:58'),
(5, 'App\\Models\\User', 1, 'flutter_app', 'dbc9690c6dbda3c9182bb14e57b9c728ff05802e48424ce25cc18cc8a3a37d02', '[\"read-products\"]', '2025-09-03 14:09:17', NULL, '2025-09-03 14:08:30', '2025-09-03 14:09:17'),
(6, 'App\\Models\\User', 1, 'flutter_app', '860fbc0c4a543f73ac58ffaf5b46369436a12ffd98f8e4123fd1d069f3e81f9b', '[\"read-products\"]', '2025-09-03 14:13:27', NULL, '2025-09-03 14:12:42', '2025-09-03 14:13:27'),
(7, 'App\\Models\\User', 1, 'flutter_app', '1985491117d70bb2dd6a8ed4c1c79cbc6a52257f03bc15721d3d6075e01f7788', '[\"read-products\"]', '2025-09-03 14:23:26', NULL, '2025-09-03 14:22:38', '2025-09-03 14:23:26'),
(8, 'App\\Models\\User', 1, 'flutter_app', '8b00ad1d429580be58e0d6a26c64d5dca49ac88cd738670270e8ffd082244cde', '[\"read-products\"]', '2025-09-03 16:15:18', NULL, '2025-09-03 15:04:24', '2025-09-03 16:15:18'),
(9, 'App\\Models\\User', 1, 'flutter_app', '3496d780c074c1311063fc1b590c6e5b819f744c00fddd1810a505a14b129d19', '[\"read-products\"]', '2025-09-03 16:24:43', NULL, '2025-09-03 16:21:40', '2025-09-03 16:24:43'),
(10, 'App\\Models\\User', 1, 'flutter_app', 'ef1e0268b18298134506d2f9a8089aeaf1f9a318625e7a0a80c55ccedad270c7', '[\"read-products\"]', '2025-09-04 09:14:23', NULL, '2025-09-04 09:11:28', '2025-09-04 09:14:23'),
(11, 'App\\Models\\User', 1, 'flutter_app', 'dd5f03c4e5b2a1df00e439e5b1376aef8e9024179fa4f75ef8f3d1de7ecccf98', '[\"read-products\"]', '2025-09-04 09:38:09', NULL, '2025-09-04 09:37:54', '2025-09-04 09:38:09'),
(12, 'App\\Models\\User', 1, 'flutter_app', 'd1e2468de948e7478192c9e9c378f658f779d901205d35cf06e9a2f5ae26d8b9', '[\"read-products\"]', '2025-09-04 16:54:14', NULL, '2025-09-04 16:53:38', '2025-09-04 16:54:14'),
(13, 'App\\Models\\User', 1, 'flutter_app', '9c93e5bf8b3b5cf90c0f9c29f2c278c6c52320447be7d182e920c33bd5e1ff8a', '[\"read-products\"]', '2025-09-04 17:09:54', NULL, '2025-09-04 17:01:07', '2025-09-04 17:09:54'),
(14, 'App\\Models\\User', 1, 'flutter_app', 'd275308cde7ad9d4b23ffafcef82a66cef78111173be4fdfafe635e6d2bc1869', '[\"read-products\"]', '2025-09-04 17:23:34', NULL, '2025-09-04 17:21:56', '2025-09-04 17:23:34'),
(15, 'App\\Models\\User', 1, 'mobile', 'f3b19fd66cea47aa778d4048b79794a7ea57e2434e3be875abc3d39aa3bbc5b4', '[\"read-products\"]', '2025-09-29 11:47:06', NULL, '2025-09-23 15:54:02', '2025-09-29 11:47:06'),
(16, 'App\\Models\\User', 1, 'flutter_app', 'aa0e6cf8751e5a4db386c0f13de5ff234657ea74868ef889f3694166a99901f4', '[\"read-products\"]', '2025-09-26 17:02:33', NULL, '2025-09-26 17:02:18', '2025-09-26 17:02:33'),
(17, 'App\\Models\\User', 1, 'flutter_app', 'b04fc6bf1cc3c6c70400f573c7de46fe99844ed038f1120aa326314e3a632553', '[\"read-products\"]', '2025-09-28 19:25:34', NULL, '2025-09-28 19:25:31', '2025-09-28 19:25:34'),
(18, 'App\\Models\\User', 1, 'flutter_app', '37682b99f5f134ac938482909f40d4f2b22639bb102e1d88f593d787683f62ab', '[\"read-products\"]', '2025-09-29 07:43:56', NULL, '2025-09-28 20:15:41', '2025-09-29 07:43:56'),
(19, 'App\\Models\\User', 1, 'flutter_app', '3ae5ff6dab82c1b2ce88e3426909b949a3eeadef3eea485ad1ade51694e6e69a', '[\"read-products\"]', '2025-09-29 09:44:27', NULL, '2025-09-29 09:42:35', '2025-09-29 09:44:27'),
(20, 'App\\Models\\User', 1, 'flutter_app', '4b221a91bc9a1589ee0faa34883a220a95a3a7f8cdf651d0ee9e32c71b61e706', '[\"read-products\"]', '2025-09-29 09:54:03', NULL, '2025-09-29 09:50:55', '2025-09-29 09:54:03'),
(21, 'App\\Models\\User', 1, 'flutter_app', '041b5730c76617fe5e49f0e9614b7214703848dfad5321d6852443e0f4e31545', '[\"read-products\"]', '2025-09-29 11:26:55', NULL, '2025-09-29 11:24:05', '2025-09-29 11:26:55'),
(22, 'App\\Models\\User', 1, 'flutter_app', 'e8e34af5973472ca8cb637008700c280b1ce221a4f38c478a68a667c6671e999', '[\"read-products\"]', NULL, NULL, '2025-09-29 13:01:44', '2025-09-29 13:01:44'),
(23, 'App\\Models\\User', 1, 'flutter_app', '707d728dc206623e3b0e4e52b6c62ccaf0e52d6586b327d6bec1c7731be7d421', '[\"read-products\"]', NULL, NULL, '2025-09-29 13:02:09', '2025-09-29 13:02:09'),
(24, 'App\\Models\\User', 1, 'flutter_app', '74cc3e668a40e6ebda9fca98d6dc83126ca85f9b669f7a9a05160c2989cb2038', '[\"read-products\"]', NULL, NULL, '2025-09-29 13:03:28', '2025-09-29 13:03:28'),
(25, 'App\\Models\\User', 1, 'flutter_app', 'ba259f3c9bcc77e009758b7450e96a7bf0af77783ad85375fca5765d41f198cb', '[\"read-products\"]', NULL, NULL, '2025-09-29 13:07:23', '2025-09-29 13:07:23'),
(26, 'App\\Models\\User', 1, 'flutter_app', '197d443ab44dde01d75de9fb46ba1fae40053c9a306ff47f0e3f55a19d4cb083', '[\"read-products\"]', '2025-09-29 13:23:22', NULL, '2025-09-29 13:23:19', '2025-09-29 13:23:22'),
(27, 'App\\Models\\User', 1, 'flutter_app', '8f16d45026b56f91d827b19722501079d56500c9533fe3e8a7945d8d58627815', '[\"read-products\"]', '2025-09-29 13:23:41', NULL, '2025-09-29 13:23:37', '2025-09-29 13:23:41'),
(28, 'App\\Models\\User', 1, 'flutter_app', '349bfd7fbd2a7aa7ebe69c42dd09d15d60d60fdb9eb925da6e15bc1e2351a32e', '[\"read-products\"]', '2025-09-29 13:27:45', NULL, '2025-09-29 13:27:17', '2025-09-29 13:27:45'),
(29, 'App\\Models\\User', 1, 'flutter_app', '1f4806a21e546e73a6e5ecdc19753eed3a730a556f800c491b8fd7a071dd5dba', '[\"read-products\"]', '2025-09-29 13:44:37', NULL, '2025-09-29 13:43:26', '2025-09-29 13:44:37'),
(30, 'App\\Models\\User', 1, 'flutter_app', 'bdf29b5350ab969ee0ebfb4913fe4436e74f3b9510bb874c2f91f11ec8857141', '[\"read-products\"]', '2025-09-29 13:46:35', NULL, '2025-09-29 13:46:27', '2025-09-29 13:46:35'),
(31, 'App\\Models\\User', 1, 'flutter_app', '4b2289b263fd8cf53d1759df2ba7c8cb41665575fb9e8005f1f318932191bd61', '[\"read-products\"]', '2025-09-29 13:53:09', NULL, '2025-09-29 13:53:02', '2025-09-29 13:53:09'),
(32, 'App\\Models\\User', 1, 'flutter_app', '8bebdecdd0f897de31333162129d1538d0ec7b0147e39ef9eba13f076728a00a', '[\"read-products\"]', '2025-09-29 15:26:59', NULL, '2025-09-29 15:25:27', '2025-09-29 15:26:59'),
(33, 'App\\Models\\User', 1, 'flutter_app', 'a19bec5974d2556564dc546ee1b44ad679137246304264b1174b79ecbbdc419f', '[\"read-products\"]', '2025-09-29 18:11:56', NULL, '2025-09-29 18:11:32', '2025-09-29 18:11:56'),
(34, 'App\\Models\\User', 1, 'flutter_app', '25b958c595a8c6547f8b532561cbfebd4cd4f58e6a3ae19c0c4e6e0f59c27d0c', '[\"read-products\"]', '2025-09-29 18:12:42', NULL, '2025-09-29 18:12:36', '2025-09-29 18:12:42'),
(35, 'App\\Models\\User', 1, 'flutter_app', 'b1421d191b58f4a86eb1afebab67bdb9b5549b2a4122a6c4ced87d88bfb8a318', '[\"read-products\"]', NULL, NULL, '2025-09-29 18:32:52', '2025-09-29 18:32:52'),
(36, 'App\\Models\\User', 1, 'flutter_app', '0e40677c82be88a6f97fa9bf036e58b285bfbdb107d72651ab34972be35e5939', '[\"read-products\"]', NULL, NULL, '2025-09-29 18:33:02', '2025-09-29 18:33:02'),
(37, 'App\\Models\\User', 1, 'flutter_app', 'c627e9efbbddea6289285aa76c9f0f697fd564025715eb5ea923fd393f9a6a7a', '[\"read-products\"]', '2025-09-29 18:39:14', NULL, '2025-09-29 18:33:34', '2025-09-29 18:39:14'),
(38, 'App\\Models\\User', 1, 'flutter_app', '410d24d57449fdb05cf012bf2ccae1df46f156b27c01eb6de3b401a53f1284f0', '[\"read-products\"]', '2025-09-29 18:47:34', NULL, '2025-09-29 18:41:58', '2025-09-29 18:47:34'),
(39, 'App\\Models\\User', 1, 'flutter_app', '162971e3d87d04b5f1263d64a266c7ee6a5031426edbc520a13dc2c4d8c01c49', '[\"read-products\"]', '2025-09-29 18:59:17', NULL, '2025-09-29 18:56:25', '2025-09-29 18:59:17'),
(40, 'App\\Models\\User', 1, 'flutter_app', '81ceab27116cd7606dde7aaa3bf1228df201a2916e8576de6690b27bec13d179', '[\"read-products\"]', '2025-09-29 19:06:17', NULL, '2025-09-29 19:06:10', '2025-09-29 19:06:17'),
(41, 'App\\Models\\User', 1, 'flutter_app', 'ef2cd0a343abdb5c78d132b86cc64c2f0c1d548023016f1f48fed2bf06f0dc9a', '[\"read-products\"]', '2025-09-30 08:56:33', NULL, '2025-09-30 08:56:28', '2025-09-30 08:56:33'),
(42, 'App\\Models\\User', 1, 'flutter_app', 'abe1a0b901b8ffacfa25e1329f5fc65ccdfa75942488ac75eb895f6ede1d166d', '[\"read-products\"]', '2025-09-30 09:01:16', NULL, '2025-09-30 09:00:51', '2025-09-30 09:01:16'),
(43, 'App\\Models\\User', 1, 'flutter_app', 'ad5877a8cbc10e0a65319aaa9182b1f823398701f7e0a7a636b6c51dfc9e78dd', '[\"read-products\"]', '2025-09-30 09:19:13', NULL, '2025-09-30 09:19:08', '2025-09-30 09:19:13'),
(44, 'App\\Models\\User', 1, 'flutter_app', '9658f279e1f920a216c764d570d1d1c7a9cc5cb937c87eb231ce34a6fa8ccd9b', '[\"read-products\"]', '2025-09-30 09:37:37', NULL, '2025-09-30 09:36:16', '2025-09-30 09:37:37'),
(45, 'App\\Models\\User', 1, 'flutter_app', 'd2c238f701e4b2c505233e4ec429c4ae3058899395cebe64ea3d609426543369', '[\"read-products\"]', '2025-09-30 10:19:11', NULL, '2025-09-30 10:18:56', '2025-09-30 10:19:11'),
(46, 'App\\Models\\User', 1, 'flutter_app', 'd9156a633ffa5dbd57d415f84980b6a60b4fb359a669a7d7e69f30da4a2187ff', '[\"read-products\"]', '2025-09-30 10:28:11', NULL, '2025-09-30 10:28:05', '2025-09-30 10:28:11'),
(47, 'App\\Models\\User', 1, 'flutter_app', 'e8343609ad7ada9dd0ab6c826fb8131dd481257ea87b03680b5e8cc50e6da492', '[\"read-products\"]', '2025-09-30 10:32:56', NULL, '2025-09-30 10:32:48', '2025-09-30 10:32:56'),
(48, 'App\\Models\\User', 1, 'flutter_app', '4d5f498c31ca5f07d8e4458327f15fb31da174f3c006a29e524f193e8a3a5231', '[\"read-products\"]', '2025-09-30 12:06:10', NULL, '2025-09-30 12:05:38', '2025-09-30 12:06:10'),
(49, 'App\\Models\\User', 1, 'flutter_app', '24faf6e17add767c71b0e0d70d431fa81d8679bc9fc8138ec3881170a337f92d', '[\"read-products\"]', '2025-09-30 12:10:27', NULL, '2025-09-30 12:10:06', '2025-09-30 12:10:27'),
(50, 'App\\Models\\User', 1, 'flutter_app', '6769ad5bd7731a4c693df777ff80b0f2da7d66b2bdf94798e1ff6b52ecf1463d', '[\"read-products\"]', '2025-09-30 13:39:45', NULL, '2025-09-30 13:38:11', '2025-09-30 13:39:45'),
(51, 'App\\Models\\User', 1, 'flutter_app', 'fc6e0f1053ddbd01ec78fa9fbe20f5394409857c7d038bf113fae5a3bf5383fb', '[\"read-products\"]', '2025-09-30 13:54:32', NULL, '2025-09-30 13:44:12', '2025-09-30 13:54:32'),
(52, 'App\\Models\\User', 1, 'flutter_app', 'f3cc0f73633dc0bf27461ede9c02dc862d65bc85ff9998dfd87ed642a6aa8c3e', '[\"read-products\"]', '2025-09-30 13:56:42', NULL, '2025-09-30 13:56:26', '2025-09-30 13:56:42'),
(53, 'App\\Models\\User', 1, 'flutter_app', '13adf7285b7a5e2e64f309257205825c576eb3ca0a0d211bcd54fde3e51ff1af', '[\"read-products\"]', '2025-09-30 15:06:53', NULL, '2025-09-30 15:04:19', '2025-09-30 15:06:53'),
(54, 'App\\Models\\User', 1, 'flutter_app', 'db5dd899578acec7bfd3d172e2c5df4d4f183620cb39fee8ae9d047a3be2a0ee', '[\"read-products\"]', '2025-09-30 15:09:35', NULL, '2025-09-30 15:08:37', '2025-09-30 15:09:35'),
(55, 'App\\Models\\User', 1, 'flutter_app', '48e0eef4881b0b7d0d0bf54a0abb61117b2ed66a8e0d1222861c79d5b9781153', '[\"read-products\"]', '2025-09-30 15:14:22', NULL, '2025-09-30 15:13:27', '2025-09-30 15:14:22'),
(56, 'App\\Models\\User', 1, 'flutter_app', 'c89b41134fd6d84039c4d1a3983de954d29addcc85f8ffe19c34624b233c6f67', '[\"read-products\"]', '2025-09-30 16:09:58', NULL, '2025-09-30 16:08:21', '2025-09-30 16:09:58'),
(57, 'App\\Models\\User', 1, 'flutter_app', 'a337b86a7c7530bf7bfc5cf090256e91688ad96fdb3b44f4fee5203e75264ddd', '[\"read-products\"]', '2025-09-30 16:16:36', NULL, '2025-09-30 16:14:46', '2025-09-30 16:16:36'),
(58, 'App\\Models\\User', 1, 'flutter_app', '04e52a5bae46075e8befacddf8db193ef946b0ca7c53d6c152cacb4ff981365d', '[\"read-products\"]', '2025-09-30 17:12:09', NULL, '2025-09-30 17:12:01', '2025-09-30 17:12:09'),
(59, 'App\\Models\\User', 1, 'flutter_app', '9bf37d47ab28b71b17da167a2d3516d5eca71a05dd782c49ef731a675f0acdcd', '[\"read-products\"]', '2025-09-30 17:32:58', NULL, '2025-09-30 17:32:50', '2025-09-30 17:32:58'),
(60, 'App\\Models\\User', 1, 'flutter_app', '365c5f822814b4d02ead0d834fb6eab943fb00c674deec3b011897c8ffb53b28', '[\"read-products\"]', '2025-09-30 17:49:56', NULL, '2025-09-30 17:49:47', '2025-09-30 17:49:56'),
(61, 'App\\Models\\User', 1, 'flutter_app', '0df5a5f26fa8559623dcb218f418f98749ff3c1ef8b20495717bac989ccddf82', '[\"read-products\"]', '2025-09-30 18:33:39', NULL, '2025-09-30 18:30:50', '2025-09-30 18:33:39'),
(62, 'App\\Models\\User', 1, 'flutter_app', '7456df1942280a6a0abf57f96f70989ba01c867350a2a75eabb03962d0dff773', '[\"read-products\"]', '2025-09-30 19:16:08', NULL, '2025-09-30 19:11:50', '2025-09-30 19:16:08'),
(63, 'App\\Models\\User', 1, 'flutter_app', '86ee7241ab86203dba71bad0ec02982838cc946af6f30afd5e7ed410328d8bd3', '[\"read-products\"]', '2025-09-30 19:31:02', NULL, '2025-09-30 19:27:58', '2025-09-30 19:31:02'),
(64, 'App\\Models\\User', 1, 'flutter_app', '01425f93dd522d4df68ca7f5b0ec23ea628c87d3d9398aa51c6c278e1b40fa36', '[\"read-products\"]', '2025-09-30 20:59:51', NULL, '2025-09-30 20:58:36', '2025-09-30 20:59:51'),
(65, 'App\\Models\\User', 1, 'flutter_app', 'd10f8a046996331118cc4520c22576c76b06732c839c47892b3357c6b9fa9b1b', '[\"read-products\"]', '2025-10-01 07:46:45', NULL, '2025-10-01 07:45:39', '2025-10-01 07:46:45'),
(66, 'App\\Models\\User', 1, 'flutter_app', '9f9fdc48b16b27f3d9c186f9e5f88112390d03b70e4ce96502134dbc08c54679', '[\"read-products\"]', '2025-10-01 08:06:51', NULL, '2025-10-01 07:58:18', '2025-10-01 08:06:51'),
(67, 'App\\Models\\User', 1, 'flutter_app', '66f9360c8d90a1368b391723d9eac3288dc11389535db10e61396cfaaef70380', '[\"read-products\"]', '2025-10-01 08:51:24', NULL, '2025-10-01 08:46:54', '2025-10-01 08:51:24'),
(68, 'App\\Models\\User', 1, 'flutter_app', '44bb2af7370a51b53b008074dae9329f65e7442a902fe1f32bff30832dd59b3f', '[\"read-products\"]', '2025-10-01 09:18:23', NULL, '2025-10-01 09:17:57', '2025-10-01 09:18:23'),
(69, 'App\\Models\\User', 1, 'flutter_app', 'e05fdef754188e9e6c32758b77303bd56cf64fdd9524cdf5c32cd13311d39c6d', '[\"read-products\"]', '2025-10-01 09:33:02', NULL, '2025-10-01 09:32:32', '2025-10-01 09:33:02'),
(70, 'App\\Models\\User', 1, 'flutter_app', '69e6ec8ca38983d3cb330e405eb8c639ef1a653cf1959e8771b496eafbbf7016', '[\"read-products\"]', '2025-10-01 09:42:55', NULL, '2025-10-01 09:42:15', '2025-10-01 09:42:55'),
(71, 'App\\Models\\User', 1, 'flutter_app', '11a3a76d998a339aed8a9953c70463e08be2eac6b5bd7d9e0101b0e8a26801a7', '[\"read-products\"]', '2025-10-01 11:02:12', NULL, '2025-10-01 11:01:44', '2025-10-01 11:02:12'),
(72, 'App\\Models\\User', 1, 'flutter_app', '05e34d747dee06819ab619272539e8b5799dd727a6c7cce7f3d5c198593579b0', '[\"read-products\"]', '2025-10-01 11:07:53', NULL, '2025-10-01 11:07:29', '2025-10-01 11:07:53'),
(73, 'App\\Models\\User', 1, 'flutter_app', '1d07f0f35a473ed1f62065731bce8aae26ece54a05480e788ccd128a20c78ab5', '[\"read-products\"]', '2025-10-01 11:23:38', NULL, '2025-10-01 11:15:33', '2025-10-01 11:23:38'),
(74, 'App\\Models\\User', 1, 'flutter_app', '6e749e22b31167157310aea8e8bb96a9b501d861038d3985b2dd1f6332fc473e', '[\"read-products\"]', '2025-10-01 11:38:32', NULL, '2025-10-01 11:37:02', '2025-10-01 11:38:32'),
(75, 'App\\Models\\User', 1, 'flutter_app', 'd812397f3e8c8fb4c01dd08b0f37329871be6bd2adf136a41ad661688cef1983', '[\"read-products\"]', '2025-10-01 12:35:12', NULL, '2025-10-01 12:34:15', '2025-10-01 12:35:12'),
(76, 'App\\Models\\User', 1, 'flutter_app', 'c540f77322d6f47b35995088edf8c34d90b04e728b852b6b7fcabdb54c6ed9e2', '[\"read-products\"]', '2025-10-01 12:44:22', NULL, '2025-10-01 12:43:40', '2025-10-01 12:44:22'),
(77, 'App\\Models\\User', 1, 'flutter_app', '8bae4e27d8b26f5fe48490dbf5ce429aa54b41a4e4a07f6450c9b9611305300a', '[\"read-products\"]', '2025-10-01 13:30:17', NULL, '2025-10-01 13:29:33', '2025-10-01 13:30:17'),
(78, 'App\\Models\\User', 1, 'flutter_app', '2ded5ae6ff1c474f752f95dedfab69d10ac30a8815bfff931a516604e3a316cd', '[\"read-products\"]', '2025-10-01 13:52:52', NULL, '2025-10-01 13:52:11', '2025-10-01 13:52:52'),
(79, 'App\\Models\\User', 1, 'flutter_app', '3975c09b6c3491fcdf907a2178bec5be8bea25098e0c55bf9c75de98e85f34df', '[\"read-products\"]', '2025-10-01 15:05:32', NULL, '2025-10-01 15:00:00', '2025-10-01 15:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int UNSIGNED NOT NULL DEFAULT '0',
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `price`, `stock`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'UltraBook Pro 14', 'ultrabook-pro-14-amkmd9', 'Slim, fast, reliable.', 1499.00, 10, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200', '2025-09-02 13:23:07', '2025-09-02 13:23:07'),
(2, 2, 'SmartPhone X', 'smartphone-x-ezenuj', 'Flagship camera & battery.', 999.00, 20, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200', '2025-09-02 13:23:08', '2025-09-02 13:23:08'),
(3, 3, 'Wireless Headset', 'wireless-headset-8nv9q6', 'Noise canceling over-ear.', 199.99, 63, 'https://res.cloudinary.com/dfnzcn8dl/image/upload/v1756840996/he7gsetippkuquatgz9o.jpg', '2025-09-02 13:23:10', '2025-10-01 11:23:41'),
(5, 1, 'Laptop', 'laptop-3m36da', 'Good', 10000.00, 7, 'https://res.cloudinary.com/dfnzcn8dl/image/upload/v1756847111/nhm4jbwiqlwbkcufn7tv.jpg', '2025-09-02 21:05:13', '2025-09-30 18:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6wZutY3BYVWSMvVgZq2HSNN9A6LHQu2U5tfMsp0B', NULL, '100.64.0.6', 'Dart/3.8 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielEyVXRNZnVTQnN5M05wQkY2ZDJPOEZ4WmtKSXpmaTY4NXNudDU1VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly90ZWNoaWV3ZWItdjItcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759325184),
('ofvC5rTZWyYoQlgwTwU8Qz2hmT4Q3RrlFJ1iPyhG', NULL, '100.64.0.2', 'Dart/3.8 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEhMQ1JOSWtGWllBQ1o2WFBwZDlnY3dZMDEySXVPQVp4RDlGUGNpcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly90ZWNoaWV3ZWItdjItcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759330782),
('quxN5ArclZrZVz4kef8WrvdgWtCr97HijVA1ADZC', NULL, '100.64.0.2', 'Dart/3.8 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmZBZmQyWkY2N1hGVEtsY1hZUVZOWk5ScDJwVXJNNG51WVE4cUxURiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly90ZWNoaWV3ZWItdjItcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759326703),
('rMHDFHCSVKgGmJqDnS0DbDjAWgccfPCq1EY2pKaJ', NULL, '100.64.0.10', 'Dart/3.8 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0FzaGxMVTZ1VHFUajdVSjI3WUc5SEx5NTR6NW1LTlZWeU12dzZwQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly90ZWNoaWV3ZWItdjItcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759384467);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text,
  `two_factor_recovery_codes` text,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `phone`, `address`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Mudeen Mohomad', 'muzeenmohammed6@gmail.com', 'customer', NULL, 'Kurunegala', NULL, '$2y$12$MBxiafP.aC/EIu7nqifFkeJ.i7/BSTvPT/kfSuypKlJBGFajWpfQG', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-02 07:15:38', '2025-09-04 17:09:26'),
(2, 'Admin', 'admin@gmail.com', 'admin', NULL, NULL, NULL, '$2y$12$QdGR7nAGoskdgRzDXsXY3uL85fQfdczZHWjuYnRUkUEqr55MEOJqi', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-02 07:18:32', '2025-09-02 07:18:32'),
(3, 'Admin', 'admin@shop.test', 'admin', NULL, NULL, NULL, '$2y$12$MN8kvjo31sn89VI6UThj5ee4tzexWiPLPvFHWwnMmPsLtAYx7YxlC', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-02 13:23:01', '2025-09-02 13:23:01'),
(4, 'Customer', 'customer@shop.test', 'customer', NULL, NULL, NULL, '$2y$12$sPcQL9pZmbaCzPOp1dOEruno/P0JvwbzwAWsdxCmrnDxTif0F4nCC', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-02 13:23:02', '2025-09-02 13:23:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_user_id_unique` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_items_cart_id_product_id_unique` (`cart_id`,`product_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `failed_logins`
--
ALTER TABLE `failed_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_logins`
--
ALTER TABLE `failed_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
