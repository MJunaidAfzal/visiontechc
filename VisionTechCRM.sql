-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 15, 2024 at 03:08 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `VisionTechCRM`
--

-- --------------------------------------------------------

--
-- Table structure for table `breezy_sessions`
--

CREATE TABLE `breezy_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint(20) UNSIGNED NOT NULL,
  `panel_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `breezy_sessions`
--

INSERT INTO `breezy_sessions` (`id`, `authenticatable_type`, `authenticatable_id`, `panel_id`, `guard`, `ip_address`, `user_agent`, `expires_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IjNpUGNUTEs0eXBwQWx0Q0J3UGNvbHc9PSIsInZhbHVlIjoiMDhRTG0rbExBMk9FNFAzeURRSGNBQ1I5eGcxd0k3SXFCa2RSek16dE1VQT0iLCJtYWMiOiJmY2U3MGU2N2VkZjFiZTI3YTFjZDY3MDNhMTNjZjZiNzQwMWE3NTYxZjdjNjc2ODFmMjFiOTg3MDA2NWMyZmQwIiwidGFnIjoiIn0=', 'eyJpdiI6IitpTTNVajEyWEtieWlFUlVoQWpuZWc9PSIsInZhbHVlIjoidU5aLzZXUS9yTWFPc2k1Nm1kT1FKWlBmdkZnWm8rLzNmRU11Wi9xTTVxWjNYNjVpWXhpcFBrNHhSOEJNQTBqSXdKUUIwQW5YSzVyalVsejVtd2dkalh2NXRCSWwrZUFCdERGdjI3eDZiSnZReVJvVTBCTXNUN1VJemJyNndmTWNhQXNRT1VzZS84M013MkJRQ2U1bHk3WDJCSmlHN2hlUHJvc3d1TWJRVitZZEI2b2pMSUJjLzM2Y1RzdnpVSHY4cHcvUlBqN2srakMxaTl4K1dwMEo0d3c1UXVHZ3JoVEN2d0ptZ2N5S0txdmhaNC8xTzEzSm51WWU2RXQzL3NNbld2OHIxNGFHZ2hJWUJHQUxUczRoVlE9PSIsIm1hYyI6IjNjNDc1YzkxMjAxNjkxNTU4N2Y2ZDM2MjgwY2NhNzY2YTU1Nzg4YjVlODg5Y2FjYmMyZjcwNGM5MzhjYWM3OTAiLCJ0YWciOiIifQ==', '2024-08-14 05:58:45', '2024-08-09 09:53:27', '2024-08-14 05:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:19:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:13:\"see-dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:14:\"manage-clients\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"manage-users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:12:\"manage-roles\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:18:\"manage-permissions\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:19:\"manage-lead-sources\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:23:\"manage-order-categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:10:\"order-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"order-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:10:\"order-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:10;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:10:\"order-view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:11;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:9:\"lead-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:12;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:11:\"lead-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:13;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:9:\"lead-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:11:\"lead-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:15;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:8:\"lead-all\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:9:\"order-all\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:9:\"lead-view\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:12:\"order-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:13:\"administrator\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"Sales Exec\";s:1:\"c\";s:3:\"web\";}}}', 1723812667);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `url`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Vision Tech', 'https://vision-tech.co/', 1, '2024-07-29 09:47:35', '2024-07-29 09:47:35'),
(2, 'Digi-Dive', 'https://digidive.com/', 1, '2024-07-29 09:49:20', '2024-07-29 09:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filament_comments`
--

CREATE TABLE `filament_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filament_comments`
--

INSERT INTO `filament_comments` (`id`, `user_id`, `subject_type`, `subject_id`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'App\\Models\\Order', 1, '<p>I don\'t know whats happening in this applicaiton :D</p>', '2024-08-06 10:41:53', '2024-08-06 10:41:53', NULL),
(2, 1, 'App\\Models\\Order', 1, '<p>Then follow the steps here: https://spatie.be/index.php/docs/laravel-comments/v1/installation-setup</p><p><br></p>', '2024-08-06 10:42:13', '2024-08-06 10:42:13', NULL),
(3, 1, 'App\\Models\\Order', 1, '<p>I don\'t know whats happening in this applicaiton :D</p>', '2024-08-06 10:42:18', '2024-08-06 10:42:18', NULL),
(4, 1, 'App\\Models\\Order', 1, '<p>Then follow the steps here: https://spatie.be/index.php/docs/laravel-comments/v1/installation-setup</p>', '2024-08-06 10:42:25', '2024-08-06 10:42:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `filament_email_2fa_codes`
--

CREATE TABLE `filament_email_2fa_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filament_email_2fa_codes`
--

INSERT INTO `filament_email_2fa_codes` (`id`, `created_at`, `updated_at`, `user_type`, `user_id`, `code`, `expiry_at`) VALUES
(2, '2024-07-31 11:41:23', '2024-07-31 11:41:23', 'App\\Models\\User', 1, '864975', '2024-07-31 16:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `filament_email_2fa_verify`
--

CREATE TABLE `filament_email_2fa_verify` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lead_source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Open - Contacted, 1 = Open - Uncontacted ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `title`, `email`, `phone_number`, `city`, `country`, `description`, `client_id`, `lead_source_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Naqi', 'sadasd', 'sadsada@SSADASD.com', '2025550164', 'Karachi', 'Pakistan', '<p>asdad</p>', 1, 1, 0, '2024-07-31 11:36:05', '2024-08-13 15:19:01'),
(2, 'Maisam Naqviss', 'sadasdss', 'sadsada@SSADASD.comaa', '202555016445', 'Karachia', 'Pakistan', '<p>adsdasda</p>', 1, 2, 1, '2024-07-31 11:38:10', '2024-08-13 15:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `lead_assignees`
--

CREATE TABLE `lead_assignees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_assignees`
--

INSERT INTO `lead_assignees` (`id`, `user_id`, `lead_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(3, 2, 2, NULL, NULL),
(5, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Web', 1, '2024-07-31 10:33:22', '2024-07-31 10:33:22'),
(2, 'Phone Enquiry', 1, '2024-07-31 10:33:22', '2024-07-31 10:33:22'),
(3, 'Partner Referral', 1, '2024-07-31 10:33:22', '2024-07-31 10:33:22'),
(4, 'Purchased List', 1, '2024-07-31 10:33:22', '2024-07-31 10:33:22'),
(5, 'Other', 1, '2024-07-31 10:33:22', '2024-07-31 10:33:22'),
(6, 'Facebook Ads', 1, '2024-08-06 11:06:19', '2024-08-06 11:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_29_133637_create_permission_tables', 1),
(5, '2024_07_29_144100_create_clients_table', 2),
(6, '2024_07_30_091912_add_is_admin_and_2fa_to_users_table', 3),
(7, '2024_07_30_200117_create_filament_otp_login_table', 4),
(8, '2024_07_30_201503_create_breezy_sessions_table', 5),
(9, '2024_07_30_203848_create_filament-email-2fa_table', 6),
(11, '2024_07_31_152635_create_lead_sources_table', 7),
(12, '2024_07_31_153824_create_leads_table', 8),
(13, '2024_07_31_155450_create_lead_assignees_table', 9),
(14, '2024_07_31_171102_add_login_details_to_users_table', 10),
(22, '2024_08_05_102024_create_order_categories_table', 11),
(23, '2024_08_05_102025_create_orders_table', 11),
(24, '2024_08_05_104627_create_order_payments_table', 11),
(25, '2024_08_05_104647_create_order_assignees_table', 11),
(26, '2024_08_06_153234_create_filament_comments_table', 12),
(27, '2024_08_06_153235_add_index_to_subject', 12),
(28, '2024_08_13_225028_create_personal_access_tokens_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `word_count` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`order_attachments`)),
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint(20) UNSIGNED NOT NULL COMMENT '1: In progress, 2: Revision, 3: Completed, 4: Cancelled',
  `payment_method` bigint(20) UNSIGNED NOT NULL COMMENT '1: Paypal , 2: Payooner , "Other',
  `payment_receipt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payment_receipt`)),
  `total_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `upfront` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = No, 1 = Yes',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `order_categories_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `description`, `word_count`, `deadline`, `order_attachments`, `comment`, `name`, `email`, `phone_number`, `status`, `payment_method`, `payment_receipt`, `total_amount`, `upfront`, `priority`, `user_id`, `lead_id`, `order_categories_id`, `created_at`, `updated_at`) VALUES
(1, 'TT292', '<p>Corporis nesciunt laudantium rerum repellat mollitia recusandae. Libero nemo ipsa optio amet perspiciatis. Velit beatae id saepe reiciendis ab eos illo.Voluptate optio odit expedita ab suscipit. Repudiandae amet sed voluptates tempore nemo ullam minima ducimus. Ipsam tempora eligendi minus velit corporis ab inventore saepe.Vel non nulla ex. Blanditiis sed cumque repellendus itaque aperiam laboriosam libero corrupti. Deserunt culpa aspernatur voluptatum odio voluptates quod.</p>', '10000', '2024-08-12', '[\"01J4M4AM1BY5CYNWKXF8P3VKN5.pdf\",\"01J4M4AM1FT3W2MCSH4JY1HJYD.docx\"]', '<p>Corporis nesciunt laudantium rerum repellat mollitia recusandae. Libero nemo ipsa optio amet perspiciatis. Velit beatae id saepe reiciendis ab eos illo.Voluptate optio odit expedita ab suscipit. Repudiandae amet sed voluptates tempore nemo ullam minima ducimus. Ipsam tempora eligendi minus velit corporis ab inventore saepe.Vel non nulla ex. Blanditiis sed cumque repellendus itaque aperiam laboriosam libero corrupti. Deserunt culpa aspernatur voluptatum odio voluptates quod.</p>', 'Devon Hyatt', 'your.email+fakedata67302@gmail.com', '825-052-6006', 1, 3, '[\"01J4M4AM1HVZHDQMDQWEA3V4FW.pdf\",\"01J4M4AM1J55WP7061KY9KH07M.png\"]', '1000', '200', 1, 1, 1, 1, '2024-08-06 10:18:36', '2024-08-13 17:37:40'),
(2, 'ODR-VMTYN9', '<p>sdadasdasd</p>', '45', '2024-08-19', '[\"01J56XC3034HXF4SC1TR37CWZS.png\"]', '<p>asdadad</p>', 'Mathias O\'Connell', 'your.email+fakedata48992@gmail.com', '662-646-6294', 1, 2, '[\"01J56XC309ABGX2FHF9YSCBVCY.png\"]', '381', '582', 1, 1, 1, 1, '2024-08-13 17:22:39', '2024-08-13 17:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_assignees`
--

CREATE TABLE `order_assignees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_assignees`
--

INSERT INTO `order_assignees` (`id`, `user_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_categories`
--

CREATE TABLE `order_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Unactive, 1 = Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_categories`
--

INSERT INTO `order_categories` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Assignments', 0, NULL, '2024-08-06 10:06:32', '2024-08-13 11:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_codes`
--

CREATE TABLE `otp_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'see-dashboard', 'web', '2024-07-29 09:00:52', '2024-07-29 09:00:52'),
(4, 'manage-clients', 'web', '2024-07-29 09:13:37', '2024-08-15 06:30:42'),
(5, 'manage-users', 'web', '2024-07-29 09:13:37', '2024-08-15 06:31:01'),
(6, 'manage-roles', 'web', '2024-07-29 09:13:37', '2024-08-15 06:31:21'),
(7, 'manage-permissions', 'web', '2024-07-29 09:13:37', '2024-08-15 06:31:38'),
(8, 'manage-lead-sources', 'web', '2024-07-29 09:13:37', '2024-08-15 06:32:08'),
(9, 'manage-order-categories', 'web', '2024-07-29 09:13:37', '2024-08-15 06:32:30'),
(10, 'order-edit', 'web', '2024-07-29 09:13:37', '2024-07-29 09:13:37'),
(11, 'order-delete', 'web', '2024-07-29 09:13:37', '2024-07-29 09:13:37'),
(12, 'order-list', 'web', '2024-07-29 09:13:37', '2024-07-29 09:13:37'),
(13, 'order-view', 'web', '2024-07-29 09:13:37', '2024-07-29 09:13:37'),
(20, 'lead-list', 'web', '2024-07-29 09:13:37', '2024-07-29 09:13:37'),
(21, 'lead-create', 'web', '2024-07-29 09:13:37', '2024-07-29 09:13:37'),
(22, 'lead-edit', 'web', '2024-07-29 09:13:37', '2024-07-29 09:13:37'),
(23, 'lead-delete', 'web', '2024-07-29 09:13:37', '2024-08-15 06:37:08'),
(24, 'lead-all', 'web', '2024-08-15 04:59:59', '2024-08-15 04:59:59'),
(25, 'order-all', 'web', '2024-08-15 05:00:15', '2024-08-15 05:00:15'),
(26, 'lead-view', 'web', '2024-08-15 07:25:43', '2024-08-15 07:25:43'),
(27, 'order-create', 'web', '2024-08-15 07:25:55', '2024-08-15 07:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2024-07-29 09:00:52', '2024-07-29 09:00:52'),
(2, 'Sales Exec', 'web', '2024-08-09 06:54:50', '2024-08-15 06:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(25, 1),
(26, 1),
(27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6iRH1IgZN6PexY9XkTEJ7XEiag2n29Ph3rRYlNkO', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoidUNzMTZYcUs5MTkwQ0NvdVBDRDJoVFJWN1lTWjFzYUJodUhob21KRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9vcmRlcnMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTY6InVzZXJfcGVybWlzc2lvbnMiO2E6MTc6e2k6MDtzOjEzOiJzZWUtZGFzaGJvYXJkIjtpOjE7czoxNDoibWFuYWdlLWNsaWVudHMiO2k6MjtzOjEyOiJtYW5hZ2UtdXNlcnMiO2k6MztzOjEyOiJtYW5hZ2Utcm9sZXMiO2k6NDtzOjE4OiJtYW5hZ2UtcGVybWlzc2lvbnMiO2k6NTtzOjE5OiJtYW5hZ2UtbGVhZC1zb3VyY2VzIjtpOjY7czoyMzoibWFuYWdlLW9yZGVyLWNhdGVnb3JpZXMiO2k6NztzOjEwOiJvcmRlci1lZGl0IjtpOjg7czoxMjoib3JkZXItZGVsZXRlIjtpOjk7czoxMDoib3JkZXItbGlzdCI7aToxMDtzOjEwOiJvcmRlci12aWV3IjtpOjExO3M6OToibGVhZC1saXN0IjtpOjEyO3M6MTE6ImxlYWQtY3JlYXRlIjtpOjEzO3M6OToibGVhZC1lZGl0IjtpOjE0O3M6MTE6ImxlYWQtZGVsZXRlIjtpOjE1O3M6ODoibGVhZC1hbGwiO2k6MTY7czo5OiJvcmRlci1hbGwiO31zOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHphdGw2WlB1TFFQQlU3WkFWb0YuR2VxUmxrMFhXRnMxTS5wNHZrM3FpZzZoTmNnT3VpZU1LIjtzOjg6ImZpbGFtZW50IjthOjA6e31zOjY6InRhYmxlcyI7YToxOntzOjI0OiJMaXN0UGVybWlzc2lvbnNfcGVyX3BhZ2UiO3M6MjoiNTAiO319', 1723727275),
('EkpKWQO2xraMO5cpqn8iiHC43T7AiE1XIrQ2bhFj', 2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiblRYQ0hyWnJVQThWUEszZmxHaHVmM09OMEtXZkNPUTVpNEpQWW1RNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9vcmRlcnMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTY6InVzZXJfcGVybWlzc2lvbnMiO2E6ODp7aTowO3M6MTA6Im9yZGVyLWVkaXQiO2k6MTtzOjEyOiJvcmRlci1kZWxldGUiO2k6MjtzOjEwOiJvcmRlci1saXN0IjtpOjM7czoxMDoib3JkZXItdmlldyI7aTo0O3M6OToibGVhZC1saXN0IjtpOjU7czoxMToibGVhZC1jcmVhdGUiO2k6NjtzOjk6ImxlYWQtZWRpdCI7aTo3O3M6MTE6ImxlYWQtZGVsZXRlIjt9czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiQ1WFNvSmJmM3N5VHh2eEd4Z1k2Q2VlN0dyVTJxNlVMWFE4MHpqVFprSm9wOHpGc1hnR3dnSyI7fQ==', 1723727271);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google2fa_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_system_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `google2fa_secret`, `is_admin`, `is_system_admin`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `last_login_at`, `last_login_ip`, `last_login_location`, `last_login_browser`) VALUES
(1, 'admin', 'syedmaisam97@gmail.com', NULL, 0, 1, NULL, '$2y$12$zatl6ZPuLQPBU7ZAVoF.GeqRlk0XWFs1M.p4vk3qig6hNcgOuieMK', 'LCCWXNh0cniVOWnMwLV7rN5ME3XoAo7E1vUFRYdzObmR8NjjcdUQyOD9iXSB', '2024-07-29 08:45:13', '2024-07-29 08:45:13', NULL, NULL, NULL, NULL),
(2, 'Sales Exec', 'sales@gmail.com', NULL, 0, 1, NULL, '$2y$12$5XSoJbf3syTxvxGxgY6Cee7GrU2q6ULXQ80zjTZkJop8zFsXgGwgK', 'f9n38UIvWHobWk7TZp3W2J0H0stIZTdRKcWsPv7rYVaGDLtmynMSItfxq5rr', '2024-07-29 08:45:13', '2024-08-15 07:00:36', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breezy_sessions`
--
ALTER TABLE `breezy_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `breezy_sessions_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`);

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
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_url_unique` (`url`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `filament_comments`
--
ALTER TABLE `filament_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filament_comments_subject_type_subject_id_index` (`subject_type`,`subject_id`);

--
-- Indexes for table `filament_email_2fa_codes`
--
ALTER TABLE `filament_email_2fa_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filament_email_2fa_codes_user_type_user_id_index` (`user_type`,`user_id`),
  ADD KEY `filament_email_2fa_codes_code_index` (`code`);

--
-- Indexes for table `filament_email_2fa_verify`
--
ALTER TABLE `filament_email_2fa_verify`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filament_email_2fa_verify_user_type_user_id_index` (`user_type`,`user_id`),
  ADD KEY `filament_email_2fa_verify_session_id_index` (`session_id`);

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
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_client_id_foreign` (`client_id`),
  ADD KEY `leads_lead_source_id_foreign` (`lead_source_id`);

--
-- Indexes for table `lead_assignees`
--
ALTER TABLE `lead_assignees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_assignees_user_id_foreign` (`user_id`),
  ADD KEY `lead_assignees_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lead_sources_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_lead_id_foreign` (`lead_id`),
  ADD KEY `orders_order_categories_id_foreign` (`order_categories_id`);

--
-- Indexes for table `order_assignees`
--
ALTER TABLE `order_assignees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_assignees_user_id_foreign` (`user_id`),
  ADD KEY `order_assignees_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_categories`
--
ALTER TABLE `order_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payments_user_id_foreign` (`user_id`),
  ADD KEY `order_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `breezy_sessions`
--
ALTER TABLE `breezy_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filament_comments`
--
ALTER TABLE `filament_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `filament_email_2fa_codes`
--
ALTER TABLE `filament_email_2fa_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `filament_email_2fa_verify`
--
ALTER TABLE `filament_email_2fa_verify`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lead_assignees`
--
ALTER TABLE `lead_assignees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_assignees`
--
ALTER TABLE `order_assignees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_categories`
--
ALTER TABLE `order_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp_codes`
--
ALTER TABLE `otp_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leads_lead_source_id_foreign` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_assignees`
--
ALTER TABLE `lead_assignees`
  ADD CONSTRAINT `lead_assignees_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_assignees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_order_categories_id_foreign` FOREIGN KEY (`order_categories_id`) REFERENCES `order_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_assignees`
--
ALTER TABLE `order_assignees`
  ADD CONSTRAINT `order_assignees_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_assignees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD CONSTRAINT `order_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
