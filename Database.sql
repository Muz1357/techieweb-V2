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
