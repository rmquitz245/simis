-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 07:24 PM
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
-- Database: `simis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_type`
--

CREATE TABLE `address_type` (
  `address_type_id` int(11) NOT NULL,
  `address_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_status`
--

CREATE TABLE `appointment_status` (
  `appointment_status_id` int(11) NOT NULL,
  `appointment_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_status`
--

INSERT INTO `appointment_status` (`appointment_status_id`, `appointment_status_name`) VALUES
(1, 'Active'),
(2, 'Resigned'),
(3, 'Retired'),
(4, 'Dismissed'),
(5, 'Deceased');

-- --------------------------------------------------------

--
-- Table structure for table `barangay`
--

CREATE TABLE `barangay` (
  `barangay_id` int(11) NOT NULL,
  `municipality_id_barangay_fk` int(11) NOT NULL,
  `barangay_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay`
--

INSERT INTO `barangay` (`barangay_id`, `municipality_id_barangay_fk`, `barangay_name`) VALUES
(1, 78, 'Amtic'),
(2, 78, 'Baligang');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_of_civil_status`
--

CREATE TABLE `change_of_civil_status` (
  `change_of_civil_status_id` int(11) NOT NULL,
  `personnel_id_change_of_civil_status_fk` int(11) NOT NULL,
  `change_of_civil_status_from` int(11) NOT NULL,
  `change_of_civil_status_to` int(11) NOT NULL,
  `change_of_civil_status_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `change_of_name`
--

CREATE TABLE `change_of_name` (
  `change_of_name_id` int(11) NOT NULL,
  `personnel_id_change_of_name_fk` int(11) NOT NULL,
  `part_of_name_id_change_of_name_fk` int(11) NOT NULL,
  `change_of_name_from` varchar(255) NOT NULL,
  `change_of_name_to` varchar(255) NOT NULL,
  `reason_for_change_correction_of_name__id_fk` int(11) NOT NULL,
  `change_of_name_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `civil_status`
--

CREATE TABLE `civil_status` (
  `civil_status_id` int(11) NOT NULL,
  `civil_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `civil_status`
--

INSERT INTO `civil_status` (`civil_status_id`, `civil_status_name`) VALUES
(1, 'Single'),
(2, 'Married'),
(3, 'Widowed'),
(4, 'Legally Separated');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'Philippines');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `office_id_department_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `division_id` int(11) NOT NULL,
  `division_code` varchar(50) NOT NULL,
  `division_name` int(11) NOT NULL,
  `region_id_division_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employment_status`
--

CREATE TABLE `employment_status` (
  `employment_status_id` int(11) NOT NULL,
  `employment_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `ipcrf_rating_scales`
--

CREATE TABLE `ipcrf_rating_scales` (
  `ipcrf_rating_scale_id` int(11) NOT NULL,
  `rating_value` tinyint(4) NOT NULL,
  `adjectival_rating` varchar(50) NOT NULL,
  `score_range_min` decimal(4,3) NOT NULL,
  `score_range_max` decimal(4,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipcrf_rating_status`
--

CREATE TABLE `ipcrf_rating_status` (
  `ipcrf_rating_status_id` int(11) NOT NULL,
  `ipcrf_rating_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ipcrf_rating_status`
--

INSERT INTO `ipcrf_rating_status` (`ipcrf_rating_status_id`, `ipcrf_rating_status_name`) VALUES
(1, 'Draft'),
(2, 'Locked'),
(3, 'Not Applicable'),
(4, 'Unlocked');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
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
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mode_of_separation`
--

CREATE TABLE `mode_of_separation` (
  `mode_of_separation_id` int(11) NOT NULL,
  `mode_of_separation_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `municipality`
--

CREATE TABLE `municipality` (
  `municipality_id` int(11) NOT NULL,
  `province_id_municipality_fk` int(11) NOT NULL,
  `municipality_name` varchar(255) NOT NULL,
  `zip_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `municipality`
--

INSERT INTO `municipality` (`municipality_id`, `province_id_municipality_fk`, `municipality_name`, `zip_code`) VALUES
(1, 108, 'Bangued*', NULL),
(2, 108, 'Boliney', NULL),
(3, 108, 'Bucay', NULL),
(4, 108, 'Bucloc', NULL),
(5, 108, 'Daguioman', NULL),
(6, 108, 'Danglas', NULL),
(7, 108, 'Dolores', NULL),
(8, 108, 'La Paz', NULL),
(9, 108, 'Lacub', NULL),
(10, 108, 'Lagangilang', NULL),
(11, 108, 'Lagayan', NULL),
(12, 108, 'Langiden', NULL),
(13, 108, 'Licuan-Baay', NULL),
(14, 108, 'Luba', NULL),
(15, 108, 'Malibcong', NULL),
(16, 108, 'Manabo', NULL),
(17, 108, 'Peñarrubia', NULL),
(18, 108, 'Pidigan', NULL),
(19, 108, 'Pilar', NULL),
(20, 108, 'Sallapadan', NULL),
(21, 108, 'San Isidro', NULL),
(22, 108, 'San Juan', NULL),
(23, 108, 'San Quintin', NULL),
(24, 108, 'Tayum', NULL),
(25, 108, 'Tineg', NULL),
(26, 108, 'Tubo', NULL),
(27, 108, 'Villaviciosa', NULL),
(28, 85, 'Buenavista', NULL),
(29, 85, 'Butuan*', NULL),
(30, 85, 'Cabadbaran', NULL),
(31, 85, 'Carmen', NULL),
(32, 85, 'Jabonga', NULL),
(33, 85, 'Kitcharao', NULL),
(34, 85, 'Las Nieves', NULL),
(35, 85, 'Magallanes', NULL),
(36, 85, 'Nasipit', NULL),
(37, 85, 'Remedios T. Romualdez', NULL),
(38, 85, 'Santiago', NULL),
(39, 85, 'Tubay', NULL),
(40, 86, 'Bayugan*', NULL),
(41, 86, 'Bunawan', NULL),
(42, 86, 'Esperanza', NULL),
(43, 86, 'La Paz', NULL),
(44, 86, 'Loreto', NULL),
(45, 86, 'Prosperidad', NULL),
(46, 86, 'Rosario', NULL),
(47, 86, 'San Francisco', NULL),
(48, 86, 'San Luis', NULL),
(49, 86, 'Santa Josefa', NULL),
(50, 86, 'Sibagat', NULL),
(51, 86, 'Talacogon', NULL),
(52, 86, 'Trento', NULL),
(53, 86, 'Veruela', NULL),
(54, 39, 'Altavas', NULL),
(55, 39, 'Balete', NULL),
(56, 39, 'Banga', NULL),
(57, 39, 'Batan', NULL),
(58, 39, 'Buruanga', NULL),
(59, 39, 'Ibajay', NULL),
(60, 39, 'Kalibo*', NULL),
(61, 39, 'Lezo', NULL),
(62, 39, 'Libacao', NULL),
(63, 39, 'Madalag', NULL),
(64, 39, 'Makato', NULL),
(65, 39, 'Malay', NULL),
(66, 39, 'Malinao', NULL),
(67, 39, 'Nabas', NULL),
(68, 39, 'New Washington', NULL),
(69, 39, 'Numancia', NULL),
(70, 39, 'Tangalan', NULL),
(71, 33, 'Bacacay', NULL),
(72, 33, 'Camalig', NULL),
(73, 33, 'Daraga', NULL),
(74, 33, 'Guinobatan', NULL),
(75, 33, 'Jovellar', NULL),
(76, 33, 'Legazpi*', NULL),
(77, 33, 'Libon', NULL),
(78, 33, 'Ligao', NULL),
(79, 33, 'Malilipot', NULL),
(80, 33, 'Malinao', NULL),
(81, 33, 'Manito', NULL),
(82, 33, 'Oas', NULL),
(83, 33, 'Pio Duran', NULL),
(84, 33, 'Polangui', NULL),
(85, 33, 'Rapu-Rapu', NULL),
(86, 33, 'Santo Domingo', NULL),
(87, 33, 'Tabaco', NULL),
(88, 33, 'Tiwi', NULL),
(89, 40, 'Anini-y', NULL),
(90, 40, 'Barbaza', NULL),
(91, 40, 'Belison', NULL),
(92, 40, 'Bugasong', NULL),
(93, 40, 'Caluya', NULL),
(94, 40, 'Culasi', NULL),
(95, 40, 'Hamtic', NULL),
(96, 40, 'Laua-an', NULL),
(97, 40, 'Libertad', NULL),
(98, 40, 'Pandan', NULL),
(99, 40, 'Patnongon', NULL),
(100, 40, 'San Jose de Buenavista*', NULL),
(101, 40, 'San Remigio', NULL),
(102, 40, 'Sebaste', NULL),
(103, 40, 'Sibalom', NULL),
(104, 40, 'Tibiao', NULL),
(105, 40, 'Tobias Fornier', NULL),
(106, 40, 'Valderrama', NULL),
(107, 109, 'Calanasan', NULL),
(108, 109, 'Conner*', NULL),
(109, 109, 'Flora', NULL),
(110, 109, 'Kabugao', NULL),
(111, 109, 'Luna', NULL),
(112, 109, 'Pudtol', NULL),
(113, 109, 'Santa Marcela', NULL),
(114, 12, 'Baler', NULL),
(115, 12, 'Casiguran', NULL),
(116, 12, 'Dilasag', NULL),
(117, 12, 'Dinalungan', NULL),
(118, 12, 'Dingalan', NULL),
(119, 12, 'Dipaculao', NULL),
(120, 12, 'Maria Aurora*', NULL),
(121, 12, 'San Luis', NULL),
(122, 115, 'Akbar', NULL),
(123, 115, 'Al-Barka', NULL),
(124, 115, 'Hadji Mohammad Ajul', NULL),
(125, 115, 'Hadji Muhtamad', NULL),
(126, 115, 'Isabela*', NULL),
(127, 115, 'Lamitan', NULL),
(128, 115, 'Lantawan', NULL),
(129, 115, 'Maluso', NULL),
(130, 115, 'Sumisip', NULL),
(131, 115, 'Tabuan-Lasa', NULL),
(132, 115, 'Tipo-Tipo', NULL),
(133, 115, 'Tuburan', NULL),
(134, 115, 'Ungkaya Pukan', NULL),
(135, 13, 'Abucay', NULL),
(136, 13, 'Bagac', NULL),
(137, 13, 'Balanga', NULL),
(138, 13, 'Dinalupihan', NULL),
(139, 13, 'Hermosa', NULL),
(140, 13, 'Limay', NULL),
(141, 13, 'Mariveles*', NULL),
(142, 13, 'Morong', NULL),
(143, 13, 'Orani', NULL),
(144, 13, 'Orion', NULL),
(145, 13, 'Pilar', NULL),
(146, 13, 'Samal', NULL),
(147, 5, 'Basco*', NULL),
(148, 5, 'Itbayat', NULL),
(149, 5, 'Ivana', NULL),
(150, 5, 'Mahatao', NULL),
(151, 5, 'Sabtang', NULL),
(152, 5, 'Uyugan', NULL),
(153, 21, 'Agoncillo', NULL),
(154, 21, 'Alitagtag', NULL),
(155, 21, 'Balayan', NULL),
(156, 21, 'Balete', NULL),
(157, 21, 'Batangas City', NULL),
(158, 21, 'Bauan', NULL),
(159, 21, 'Calaca', NULL),
(160, 21, 'Calatagan', NULL),
(161, 21, 'Cuenca', NULL),
(162, 21, 'Ibaan', NULL),
(163, 21, 'Laurel', NULL),
(164, 21, 'Lemery', NULL),
(165, 21, 'Lian', NULL),
(166, 21, 'Lipa*', NULL),
(167, 21, 'Lobo', NULL),
(168, 21, 'Mabini', NULL),
(169, 21, 'Malvar', NULL),
(170, 21, 'Mataasnakahoy', NULL),
(171, 21, 'Nasugbu', NULL),
(172, 21, 'Padre Garcia', NULL),
(173, 21, 'Rosario', NULL),
(174, 21, 'San Jose', NULL),
(175, 21, 'San Juan', NULL),
(176, 21, 'San Luis', NULL),
(177, 21, 'San Nicolas', NULL),
(178, 21, 'San Pascual', NULL),
(179, 21, 'Santa Teresita', NULL),
(180, 21, 'Santo Tomas', NULL),
(181, 21, 'Taal', NULL),
(182, 21, 'Talisay', NULL),
(183, 21, 'Tanauan', NULL),
(184, 21, 'Taysan', NULL),
(185, 21, 'Tingloy', NULL),
(186, 21, 'Tuy', NULL),
(187, 111, 'Atok', NULL),
(188, 111, 'Baguio*', NULL),
(189, 111, 'Bakun', NULL),
(190, 111, 'Bokod', NULL),
(191, 111, 'Buguias', NULL),
(192, 111, 'Itogon', NULL),
(193, 111, 'Kabayan', NULL),
(194, 111, 'Kapangan', NULL),
(195, 111, 'Kibungan', NULL),
(196, 111, 'La Trinidad', NULL),
(197, 111, 'Mankayan', NULL),
(198, 111, 'Sablan', NULL),
(199, 111, 'Tuba', NULL),
(200, 111, 'Tublay', NULL),
(201, 54, 'Almeria', NULL),
(202, 54, 'Biliran', NULL),
(203, 54, 'Cabucgayan', NULL),
(204, 54, 'Caibiran', NULL),
(205, 54, 'Culaba', NULL),
(206, 54, 'Kawayan', NULL),
(207, 54, 'Maripipi', NULL),
(208, 54, 'Naval*', NULL),
(209, 47, 'Alburquerque', NULL),
(210, 47, 'Alicia', NULL),
(211, 47, 'Anda', NULL),
(212, 47, 'Antequera', NULL),
(213, 47, 'Baclayon', NULL),
(214, 47, 'Balilihan', NULL),
(215, 47, 'Batuan', NULL),
(216, 47, 'Bien Unido', NULL),
(217, 47, 'Bilar', NULL),
(218, 47, 'Buenavista', NULL),
(219, 47, 'Calape', NULL),
(220, 47, 'Candijay', NULL),
(221, 47, 'Carmen', NULL),
(222, 47, 'Catigbian', NULL),
(223, 47, 'Clarin', NULL),
(224, 47, 'Corella', NULL),
(225, 47, 'Cortes', NULL),
(226, 47, 'Dagohoy', NULL),
(227, 47, 'Danao', NULL),
(228, 47, 'Dauis', NULL),
(229, 47, 'Dimiao', NULL),
(230, 47, 'Duero', NULL),
(231, 47, 'Garcia Hernandez', NULL),
(232, 47, 'Getafe', NULL),
(233, 47, 'Guindulman', NULL),
(234, 47, 'Inabanga', NULL),
(235, 47, 'Jagna', NULL),
(236, 47, 'Lila', NULL),
(237, 47, 'Loay', NULL),
(238, 47, 'Loboc', NULL),
(239, 47, 'Loon', NULL),
(240, 47, 'Mabini', NULL),
(241, 47, 'Maribojoc', NULL),
(242, 47, 'Panglao', NULL),
(243, 47, 'Pilar', NULL),
(244, 47, 'President Carlos P. Garcia', NULL),
(245, 47, 'Sagbayan', NULL),
(246, 47, 'San Isidro', NULL),
(247, 47, 'San Miguel', NULL),
(248, 47, 'Sevilla', NULL),
(249, 47, 'Sierra Bullones', NULL),
(250, 47, 'Sikatuna', NULL),
(251, 47, 'Tagbilaran*', NULL),
(252, 47, 'Talibon', NULL),
(253, 47, 'Trinidad', NULL),
(254, 47, 'Tubigon', NULL),
(255, 47, 'Ubay', NULL),
(256, 47, 'Valencia', NULL),
(257, 66, 'Baungon', NULL),
(258, 66, 'Cabanglasan', NULL),
(259, 66, 'Damulog', NULL),
(260, 66, 'Dangcagan', NULL),
(261, 66, 'Don Carlos', NULL),
(262, 66, 'Impasugong', NULL),
(263, 66, 'Kadingilan', NULL),
(264, 66, 'Kalilangan', NULL),
(265, 66, 'Kibawe', NULL),
(266, 66, 'Kitaotao', NULL),
(267, 66, 'Lantapan', NULL),
(268, 66, 'Libona', NULL),
(269, 66, 'Malaybalay', NULL),
(270, 66, 'Malitbog', NULL),
(271, 66, 'Manolo Fortich', NULL),
(272, 66, 'Maramag', NULL),
(273, 66, 'Pangantucan', NULL),
(274, 66, 'Quezon', NULL),
(275, 66, 'San Fernando', NULL),
(276, 66, 'Sumilao', NULL),
(277, 66, 'Talakag', NULL),
(278, 66, 'Valencia*', NULL),
(279, 14, 'Angat', NULL),
(280, 14, 'Balagtas', NULL),
(281, 14, 'Baliwag', NULL),
(282, 14, 'Bocaue', NULL),
(283, 14, 'Bulakan', NULL),
(284, 14, 'Bustos', NULL),
(285, 14, 'Calumpit', NULL),
(286, 14, 'Doña Remedios Trinidad', NULL),
(287, 14, 'Guiguinto', NULL),
(288, 14, 'Hagonoy', NULL),
(289, 14, 'Malolos', NULL),
(290, 14, 'Marilao', NULL),
(291, 14, 'Meycauayan', NULL),
(292, 14, 'Norzagaray', NULL),
(293, 14, 'Obando', NULL),
(294, 14, 'Pandi', NULL),
(295, 14, 'Paombong', NULL),
(296, 14, 'Plaridel', NULL),
(297, 14, 'Pulilan', NULL),
(298, 14, 'San Ildefonso', NULL),
(299, 14, 'San Jose del Monte*', NULL),
(300, 14, 'San Miguel', NULL),
(301, 14, 'San Rafael', NULL),
(302, 14, 'Santa Maria', NULL),
(303, 6, 'Abulug', NULL),
(304, 6, 'Alcala', NULL),
(305, 6, 'Allacapan', NULL),
(306, 6, 'Amulung', NULL),
(307, 6, 'Aparri', NULL),
(308, 6, 'Baggao', NULL),
(309, 6, 'Ballesteros', NULL),
(310, 6, 'Buguey', NULL),
(311, 6, 'Calayan', NULL),
(312, 6, 'Camalaniugan', NULL),
(313, 6, 'Claveria', NULL),
(314, 6, 'Enrile', NULL),
(315, 6, 'Gattaran', NULL),
(316, 6, 'Gonzaga', NULL),
(317, 6, 'Iguig', NULL),
(318, 6, 'Lal-lo', NULL),
(319, 6, 'Lasam', NULL),
(320, 6, 'Pamplona', NULL),
(321, 6, 'Peñablanca', NULL),
(322, 6, 'Piat', NULL),
(323, 6, 'Rizal', NULL),
(324, 6, 'Sanchez-Mira', NULL),
(325, 6, 'Santa Ana', NULL),
(326, 6, 'Santa Praxedes', NULL),
(327, 6, 'Santa Teresita', NULL),
(328, 6, 'Santo Niño', NULL),
(329, 6, 'Solana', NULL),
(330, 6, 'Tuao', NULL),
(331, 6, 'Tuguegarao*', NULL),
(332, 34, 'Basud', NULL),
(333, 34, 'Capalonga', NULL),
(334, 34, 'Daet*', NULL),
(335, 34, 'Jose Panganiban', NULL),
(336, 34, 'Labo', NULL),
(337, 34, 'Mercedes', NULL),
(338, 34, 'Paracale', NULL),
(339, 34, 'San Lorenzo Ruiz', NULL),
(340, 34, 'San Vicente', NULL),
(341, 34, 'Santa Elena', NULL),
(342, 34, 'Talisay', NULL),
(343, 34, 'Vinzons', NULL),
(344, 35, 'Baao', NULL),
(345, 35, 'Balatan', NULL),
(346, 35, 'Bato', NULL),
(347, 35, 'Bombon', NULL),
(348, 35, 'Buhi', NULL),
(349, 35, 'Bula', NULL),
(350, 35, 'Cabusao', NULL),
(351, 35, 'Calabanga', NULL),
(352, 35, 'Camaligan', NULL),
(353, 35, 'Canaman', NULL),
(354, 35, 'Caramoan', NULL),
(355, 35, 'Del Gallego', NULL),
(356, 35, 'Gainza', NULL),
(357, 35, 'Garchitorena', NULL),
(358, 35, 'Goa', NULL),
(359, 35, 'Iriga', NULL),
(360, 35, 'Lagonoy', NULL),
(361, 35, 'Libmanan', NULL),
(362, 35, 'Lupi', NULL),
(363, 35, 'Magarao', NULL),
(364, 35, 'Milaor', NULL),
(365, 35, 'Minalabac', NULL),
(366, 35, 'Nabua', NULL),
(367, 35, 'Naga*', NULL),
(368, 35, 'Ocampo', NULL),
(369, 35, 'Pamplona', NULL),
(370, 35, 'Pasacao', NULL),
(371, 35, 'Pili', NULL),
(372, 35, 'Presentacion', NULL),
(373, 35, 'Ragay', NULL),
(374, 35, 'Sagñay', NULL),
(375, 35, 'San Fernando', NULL),
(376, 35, 'San Jose', NULL),
(377, 35, 'Sipocot', NULL),
(378, 35, 'Siruma', NULL),
(379, 35, 'Tigaon', NULL),
(380, 35, 'Tinambac', NULL),
(381, 68, 'Catarman', NULL),
(382, 68, 'Guinsiliban', NULL),
(383, 68, 'Mahinog', NULL),
(384, 68, 'Mambajao*', NULL),
(385, 68, 'Sagay', NULL),
(386, 42, 'Cuartero', NULL),
(387, 42, 'Dao', NULL),
(388, 42, 'Dumalag', NULL),
(389, 42, 'Dumarao', NULL),
(390, 42, 'Ivisan', NULL),
(391, 42, 'Jamindan', NULL),
(392, 42, 'Ma-ayon', NULL),
(393, 42, 'Mambusao', NULL),
(394, 42, 'Panay', NULL),
(395, 42, 'Panitan', NULL),
(396, 42, 'Pilar', NULL),
(397, 42, 'Pontevedra', NULL),
(398, 42, 'President Roxas', NULL),
(399, 42, 'Roxas*', NULL),
(400, 42, 'Sapian', NULL),
(401, 42, 'Sigma', NULL),
(402, 42, 'Tapaz', NULL),
(403, 36, 'Bagamanoc', NULL),
(404, 36, 'Baras', NULL),
(405, 36, 'Bato', NULL),
(406, 36, 'Caramoran', NULL),
(407, 36, 'Gigmoto', NULL),
(408, 36, 'Pandan', NULL),
(409, 36, 'Panganiban', NULL),
(410, 36, 'San Andres', NULL),
(411, 36, 'San Miguel', NULL),
(412, 36, 'Viga', NULL),
(413, 36, 'Virac*', NULL),
(414, 22, 'Alfonso', NULL),
(415, 22, 'Amadeo', NULL),
(416, 22, 'Bacoor', NULL),
(417, 22, 'Carmona', NULL),
(418, 22, 'Cavite City', NULL),
(419, 22, 'Dasmariñas*', NULL),
(420, 22, 'General Emilio Aguinaldo', NULL),
(421, 22, 'General Mariano Alvarez', NULL),
(422, 22, 'General Trias', NULL),
(423, 22, 'Imus', NULL),
(424, 22, 'Indang', NULL),
(425, 22, 'Kawit', NULL),
(426, 22, 'Magallanes', NULL),
(427, 22, 'Maragondon', NULL),
(428, 22, 'Mendez', NULL),
(429, 22, 'Naic', NULL),
(430, 22, 'Noveleta', NULL),
(431, 22, 'Rosario', NULL),
(432, 22, 'Silang', NULL),
(433, 22, 'Tagaytay', NULL),
(434, 22, 'Tanza', NULL),
(435, 22, 'Ternate', NULL),
(436, 22, 'Trece Martires', NULL),
(437, 48, 'Alcantara', NULL),
(438, 48, 'Alcoy', NULL),
(439, 48, 'Alegria', NULL),
(440, 48, 'Aloguinsan', NULL),
(441, 48, 'Argao', NULL),
(442, 48, 'Asturias', NULL),
(443, 48, 'Badian', NULL),
(444, 48, 'Balamban', NULL),
(445, 48, 'Bantayan', NULL),
(446, 48, 'Barili', NULL),
(447, 48, 'Bogo', NULL),
(448, 48, 'Boljoon', NULL),
(449, 48, 'Borbon', NULL),
(450, 48, 'Carcar', NULL),
(451, 48, 'Carmen', NULL),
(452, 48, 'Catmon', NULL),
(453, 48, 'Cebu City*', NULL),
(454, 48, 'Compostela', NULL),
(455, 48, 'Consolacion', NULL),
(456, 48, 'Cordova', NULL),
(457, 48, 'Daanbantayan', NULL),
(458, 48, 'Dalaguete', NULL),
(459, 48, 'Danao', NULL),
(460, 48, 'Dumanjug', NULL),
(461, 48, 'Ginatilan', NULL),
(462, 48, 'Lapu-Lapu', NULL),
(463, 48, 'Liloan', NULL),
(464, 48, 'Madridejos', NULL),
(465, 48, 'Malabuyoc', NULL),
(466, 48, 'Mandaue', NULL),
(467, 48, 'Medellin', NULL),
(468, 48, 'Minglanilla', NULL),
(469, 48, 'Moalboal', NULL),
(470, 48, 'Naga', NULL),
(471, 48, 'Oslob', NULL),
(472, 48, 'Pilar', NULL),
(473, 48, 'Pinamungajan', NULL),
(474, 48, 'Poro', NULL),
(475, 48, 'Ronda', NULL),
(476, 48, 'Samboan', NULL),
(477, 48, 'San Fernando', NULL),
(478, 48, 'San Francisco', NULL),
(479, 48, 'San Remigio', NULL),
(480, 48, 'Santa Fe', NULL),
(481, 48, 'Santander', NULL),
(482, 48, 'Sibonga', NULL),
(483, 48, 'Sogod', NULL),
(484, 48, 'Tabogon', NULL),
(485, 48, 'Tabuelan', NULL),
(486, 48, 'Talisay', NULL),
(487, 48, 'Toledo', NULL),
(488, 48, 'Tuburan', NULL),
(489, 48, 'Tudela', NULL),
(490, 79, 'Alamada', NULL),
(491, 79, 'Aleosan', NULL),
(492, 79, 'Antipas', NULL),
(493, 79, 'Arakan', NULL),
(494, 79, 'Banisilan', NULL),
(495, 79, 'Carmen', NULL),
(496, 79, 'Kabacan', NULL),
(497, 79, 'Kadayangan', NULL),
(498, 79, 'Kapalawan', NULL),
(499, 79, 'Kidapawan*', NULL),
(500, 79, 'Libungan', NULL),
(501, 79, 'Ligawasan', NULL),
(502, 79, 'M\'lang', NULL),
(503, 79, 'Magpet', NULL),
(504, 79, 'Makilala', NULL),
(505, 79, 'Malidegao', NULL),
(506, 79, 'Matalam', NULL),
(507, 79, 'Midsayap', NULL),
(508, 79, 'Nabalawag', NULL),
(509, 79, 'Old Kaabakan', NULL),
(510, 79, 'Pahamuddin', NULL),
(511, 79, 'Pigcawayan', NULL),
(512, 79, 'Pikit', NULL),
(513, 79, 'President Roxas', NULL),
(514, 79, 'Tugunan', NULL),
(515, 79, 'Tulunan', NULL),
(516, 73, 'Compostela', NULL),
(517, 73, 'Laak', NULL),
(518, 73, 'Mabini', NULL),
(519, 73, 'Maco', NULL),
(520, 73, 'Maragusan', NULL),
(521, 73, 'Mawab', NULL),
(522, 73, 'Monkayo*', NULL),
(523, 73, 'Montevista', NULL),
(524, 73, 'Nabunturan', NULL),
(525, 73, 'New Bataan', NULL),
(526, 73, 'Pantukan', NULL),
(527, 75, 'Asuncion', NULL),
(528, 75, 'Braulio E. Dujali', NULL),
(529, 75, 'Carmen', NULL),
(530, 75, 'Kapalong', NULL),
(531, 75, 'New Corella', NULL),
(532, 75, 'Panabo', NULL),
(533, 75, 'Samal', NULL),
(534, 75, 'San Isidro', NULL),
(535, 75, 'Santo Tomas', NULL),
(536, 75, 'Tagum*', NULL),
(537, 75, 'Talaingod', NULL),
(538, 76, 'Bansalan', NULL),
(539, 76, 'Davao City*', NULL),
(540, 76, 'Digos', NULL),
(541, 76, 'Hagonoy', NULL),
(542, 76, 'Kiblawan', NULL),
(543, 76, 'Magsaysay', NULL),
(544, 76, 'Malalag', NULL),
(545, 76, 'Matanao', NULL),
(546, 76, 'Padada', NULL),
(547, 76, 'Santa Cruz', NULL),
(548, 76, 'Sulop', NULL),
(549, 77, 'Don Marcelino', NULL),
(550, 77, 'Jose Abad Santos', NULL),
(551, 77, 'Malita*', NULL),
(552, 77, 'Santa Maria', NULL),
(553, 77, 'Sarangani', NULL),
(554, 78, 'Baganga', NULL),
(555, 78, 'Banaybanay', NULL),
(556, 78, 'Boston', NULL),
(557, 78, 'Caraga', NULL),
(558, 78, 'Cateel', NULL),
(559, 78, 'Governor Generoso', NULL),
(560, 78, 'Lupon', NULL),
(561, 78, 'Manay', NULL),
(562, 78, 'Mati*', NULL),
(563, 78, 'San Isidro', NULL),
(564, 78, 'Tarragona', NULL),
(565, 88, 'Basilisa*', NULL),
(566, 88, 'Cagdianao', NULL),
(567, 88, 'Dinagat', NULL),
(568, 88, 'Libjo', NULL),
(569, 88, 'Loreto', NULL),
(570, 88, 'San Jose', NULL),
(571, 88, 'Tubajon', NULL),
(572, 55, 'Arteche', NULL),
(573, 55, 'Balangiga', NULL),
(574, 55, 'Balangkayan', NULL),
(575, 55, 'Borongan*', NULL),
(576, 55, 'Can-avid', NULL),
(577, 55, 'Dolores', NULL),
(578, 55, 'General MacArthur', NULL),
(579, 55, 'Giporlos', NULL),
(580, 55, 'Guiuan', NULL),
(581, 55, 'Hernani', NULL),
(582, 55, 'Jipapad', NULL),
(583, 55, 'Lawaan', NULL),
(584, 55, 'Llorente', NULL),
(585, 55, 'Maslog', NULL),
(586, 55, 'Maydolong', NULL),
(587, 55, 'Mercedes', NULL),
(588, 55, 'Oras', NULL),
(589, 55, 'Quinapondan', NULL),
(590, 55, 'Salcedo', NULL),
(591, 55, 'San Julian', NULL),
(592, 55, 'San Policarpo', NULL),
(593, 55, 'Sulat', NULL),
(594, 55, 'Taft', NULL),
(595, 43, 'Buenavista*', NULL),
(596, 43, 'Jordan', NULL),
(597, 43, 'Nueva Valencia', NULL),
(598, 43, 'San Lorenzo', NULL),
(599, 43, 'Sibunag', NULL),
(600, 112, 'Aguinaldo', NULL),
(601, 112, 'Alfonso Lista*', NULL),
(602, 112, 'Asipulo', NULL),
(603, 112, 'Banaue', NULL),
(604, 112, 'Hingyon', NULL),
(605, 112, 'Hungduan', NULL),
(606, 112, 'Kiangan', NULL),
(607, 112, 'Lagawe', NULL),
(608, 112, 'Lamut', NULL),
(609, 112, 'Mayoyao', NULL),
(610, 112, 'Tinoc', NULL),
(611, 1, 'Adams', NULL),
(612, 1, 'Bacarra', NULL),
(613, 1, 'Badoc', NULL),
(614, 1, 'Bangui', NULL),
(615, 1, 'Banna', NULL),
(616, 1, 'Batac', NULL),
(617, 1, 'Burgos', NULL),
(618, 1, 'Carasi', NULL),
(619, 1, 'Currimao', NULL),
(620, 1, 'Dingras', NULL),
(621, 1, 'Dumalneg', NULL),
(622, 1, 'Laoag*', NULL),
(623, 1, 'Marcos', NULL),
(624, 1, 'Nueva Era', NULL),
(625, 1, 'Pagudpud', NULL),
(626, 1, 'Paoay', NULL),
(627, 1, 'Pasuquin', NULL),
(628, 1, 'Piddig', NULL),
(629, 1, 'Pinili', NULL),
(630, 1, 'San Nicolas', NULL),
(631, 1, 'Sarrat', NULL),
(632, 1, 'Solsona', NULL),
(633, 1, 'Vintar', NULL),
(634, 2, 'Alilem', NULL),
(635, 2, 'Banayoyo', NULL),
(636, 2, 'Bantay', NULL),
(637, 2, 'Burgos', NULL),
(638, 2, 'Cabugao', NULL),
(639, 2, 'Candon*', NULL),
(640, 2, 'Caoayan', NULL),
(641, 2, 'Cervantes', NULL),
(642, 2, 'Galimuyod', NULL),
(643, 2, 'Gregorio del Pilar', NULL),
(644, 2, 'Lidlidda', NULL),
(645, 2, 'Magsingal', NULL),
(646, 2, 'Nagbukel', NULL),
(647, 2, 'Narvacan', NULL),
(648, 2, 'Quirino', NULL),
(649, 2, 'Salcedo', NULL),
(650, 2, 'San Emilio', NULL),
(651, 2, 'San Esteban', NULL),
(652, 2, 'San Ildefonso', NULL),
(653, 2, 'San Juan', NULL),
(654, 2, 'San Vicente', NULL),
(655, 2, 'Santa Catalina', NULL),
(656, 2, 'Santa Cruz', NULL),
(657, 2, 'Santa Lucia', NULL),
(658, 2, 'Santa Maria', NULL),
(659, 2, 'Santa', NULL),
(660, 2, 'Santiago', NULL),
(661, 2, 'Santo Domingo', NULL),
(662, 2, 'Sigay', NULL),
(663, 2, 'Sinait', NULL),
(664, 2, 'Sugpon', NULL),
(665, 2, 'Suyo', NULL),
(666, 2, 'Tagudin', NULL),
(667, 2, 'Vigan', NULL),
(668, 44, 'Ajuy', NULL),
(669, 44, 'Alimodian', NULL),
(670, 44, 'Anilao', NULL),
(671, 44, 'Badiangan', NULL),
(672, 44, 'Balasan', NULL),
(673, 44, 'Banate', NULL),
(674, 44, 'Barotac Nuevo', NULL),
(675, 44, 'Barotac Viejo', NULL),
(676, 44, 'Batad', NULL),
(677, 44, 'Bingawan', NULL),
(678, 44, 'Cabatuan', NULL),
(679, 44, 'Calinog', NULL),
(680, 44, 'Carles', NULL),
(681, 44, 'Concepcion', NULL),
(682, 44, 'Dingle', NULL),
(683, 44, 'Dueñas', NULL),
(684, 44, 'Dumangas', NULL),
(685, 44, 'Estancia', NULL),
(686, 44, 'Guimbal', NULL),
(687, 44, 'Igbaras', NULL),
(688, 44, 'Iloilo City*', NULL),
(689, 44, 'Janiuay', NULL),
(690, 44, 'Lambunao', NULL),
(691, 44, 'Leganes', NULL),
(692, 44, 'Lemery', NULL),
(693, 44, 'Leon', NULL),
(694, 44, 'Maasin', NULL),
(695, 44, 'Miagao', NULL),
(696, 44, 'Mina', NULL),
(697, 44, 'New Lucena', NULL),
(698, 44, 'Oton', NULL),
(699, 44, 'Passi', NULL),
(700, 44, 'Pavia', NULL),
(701, 44, 'Pototan', NULL),
(702, 44, 'San Dionisio', NULL),
(703, 44, 'San Enrique', NULL),
(704, 44, 'San Joaquin', NULL),
(705, 44, 'San Miguel', NULL),
(706, 44, 'San Rafael', NULL),
(707, 44, 'Santa Barbara', NULL),
(708, 44, 'Sara', NULL),
(709, 44, 'Tigbauan', NULL),
(710, 44, 'Tubungan', NULL),
(711, 44, 'Zarraga', NULL),
(712, 7, 'Alicia', NULL),
(713, 7, 'Angadanan', NULL),
(714, 7, 'Aurora', NULL),
(715, 7, 'Benito Soliven', NULL),
(716, 7, 'Burgos', NULL),
(717, 7, 'Cabagan', NULL),
(718, 7, 'Cabatuan', NULL),
(719, 7, 'Cauayan', NULL),
(720, 7, 'Cordon', NULL),
(721, 7, 'Delfin Albano', NULL),
(722, 7, 'Dinapigue', NULL),
(723, 7, 'Divilacan', NULL),
(724, 7, 'Echague', NULL),
(725, 7, 'Gamu', NULL),
(726, 7, 'Ilagan*', NULL),
(727, 7, 'Jones', NULL),
(728, 7, 'Luna', NULL),
(729, 7, 'Maconacon', NULL),
(730, 7, 'Mallig', NULL),
(731, 7, 'Naguilian', NULL),
(732, 7, 'Palanan', NULL),
(733, 7, 'Quezon', NULL),
(734, 7, 'Quirino', NULL),
(735, 7, 'Ramon', NULL),
(736, 7, 'Reina Mercedes', NULL),
(737, 7, 'Roxas', NULL),
(738, 7, 'San Agustin', NULL),
(739, 7, 'San Guillermo', NULL),
(740, 7, 'San Isidro', NULL),
(741, 7, 'San Manuel', NULL),
(742, 7, 'San Mariano', NULL),
(743, 7, 'San Mateo', NULL),
(744, 7, 'San Pablo', NULL),
(745, 7, 'Santa Maria', NULL),
(746, 7, 'Santiago', NULL),
(747, 7, 'Santo Tomas', NULL),
(748, 7, 'Tumauini', NULL),
(749, 113, 'Balbalan', NULL),
(750, 113, 'Lubuagan', NULL),
(751, 113, 'Pasil', NULL),
(752, 113, 'Pinukpuk', NULL),
(753, 113, 'Rizal', NULL),
(754, 113, 'Tabuk*', NULL),
(755, 113, 'Tanudan', NULL),
(756, 113, 'Tinglayan', NULL),
(757, 3, 'Agoo', NULL),
(758, 3, 'Aringay', NULL),
(759, 3, 'Bacnotan', NULL),
(760, 3, 'Bagulin', NULL),
(761, 3, 'Balaoan', NULL),
(762, 3, 'Bangar', NULL),
(763, 3, 'Bauang', NULL),
(764, 3, 'Burgos', NULL),
(765, 3, 'Caba', NULL),
(766, 3, 'Luna', NULL),
(767, 3, 'Naguilian', NULL),
(768, 3, 'Pugo', NULL),
(769, 3, 'Rosario', NULL),
(770, 3, 'San Fernando*', NULL),
(771, 3, 'San Gabriel', NULL),
(772, 3, 'San Juan', NULL),
(773, 3, 'Santo Tomas', NULL),
(774, 3, 'Santol', NULL),
(775, 3, 'Sudipen', NULL),
(776, 3, 'Tubao', NULL),
(777, 24, 'Alaminos', NULL),
(778, 24, 'Bay', NULL),
(779, 24, 'Biñan', NULL),
(780, 24, 'Cabuyao', NULL),
(781, 24, 'Calamba*', NULL),
(782, 24, 'Calauan', NULL),
(783, 24, 'Cavinti', NULL),
(784, 24, 'Famy', NULL),
(785, 24, 'Kalayaan', NULL),
(786, 24, 'Liliw', NULL),
(787, 24, 'Los Baños', NULL),
(788, 24, 'Luisiana', NULL),
(789, 24, 'Lumban', NULL),
(790, 24, 'Mabitac', NULL),
(791, 24, 'Magdalena', NULL),
(792, 24, 'Majayjay', NULL),
(793, 24, 'Nagcarlan', NULL),
(794, 24, 'Paete', NULL),
(795, 24, 'Pagsanjan', NULL),
(796, 24, 'Pakil', NULL),
(797, 24, 'Pangil', NULL),
(798, 24, 'Pila', NULL),
(799, 24, 'Rizal', NULL),
(800, 24, 'San Pablo', NULL),
(801, 24, 'San Pedro', NULL),
(802, 24, 'Santa Cruz', NULL),
(803, 24, 'Santa Maria', NULL),
(804, 24, 'Santa Rosa', NULL),
(805, 24, 'Siniloan', NULL),
(806, 24, 'Victoria', NULL),
(807, 70, 'Bacolod', NULL),
(808, 70, 'Balo-i', NULL),
(809, 70, 'Baroy', NULL),
(810, 70, 'Iligan*', NULL),
(811, 70, 'Kapatagan', NULL),
(812, 70, 'Kauswagan', NULL),
(813, 70, 'Kolambugan', NULL),
(814, 70, 'Lala', NULL),
(815, 70, 'Linamon', NULL),
(816, 70, 'Magsaysay', NULL),
(817, 70, 'Maigo', NULL),
(818, 70, 'Matungao', NULL),
(819, 70, 'Munai', NULL),
(820, 70, 'Nunungan', NULL),
(821, 70, 'Pantao Ragat', NULL),
(822, 70, 'Pantar', NULL),
(823, 70, 'Poona Piagapo', NULL),
(824, 70, 'Salvador', NULL),
(825, 70, 'Sapad', NULL),
(826, 70, 'Sultan Naga Dimaporo', NULL),
(827, 70, 'Tagoloan', NULL),
(828, 70, 'Tangcal', NULL),
(829, 70, 'Tubod', NULL),
(830, 116, 'Amai Manabilang', NULL),
(831, 116, 'Bacolod-Kalawi', NULL),
(832, 116, 'Balabagan', NULL),
(833, 116, 'Balindong', NULL),
(834, 116, 'Bayang', NULL),
(835, 116, 'Binidayan', NULL),
(836, 116, 'Buadiposo-Buntong', NULL),
(837, 116, 'Bubong', NULL),
(838, 116, 'Butig', NULL),
(839, 116, 'Calanogas', NULL),
(840, 116, 'Ditsaan-Ramain', NULL),
(841, 116, 'Ganassi', NULL),
(842, 116, 'Kapai', NULL),
(843, 116, 'Kapatagan', NULL),
(844, 116, 'Lumba-Bayabao', NULL),
(845, 116, 'Lumbaca-Unayan', NULL),
(846, 116, 'Lumbatan', NULL),
(847, 116, 'Lumbayanague', NULL),
(848, 116, 'Madalum', NULL),
(849, 116, 'Madamba', NULL),
(850, 116, 'Maguing', NULL),
(851, 116, 'Malabang', NULL),
(852, 116, 'Marantao', NULL),
(853, 116, 'Marawi*', NULL),
(854, 116, 'Marogong', NULL),
(855, 116, 'Masiu', NULL),
(856, 116, 'Mulondo', NULL),
(857, 116, 'Pagayawan', NULL),
(858, 116, 'Piagapo', NULL),
(859, 116, 'Picong', NULL),
(860, 116, 'Poona Bayabao', NULL),
(861, 116, 'Pualas', NULL),
(862, 116, 'Saguiaran', NULL),
(863, 116, 'Sultan Dumalondong', NULL),
(864, 116, 'Tagoloan II', NULL),
(865, 116, 'Tamparan', NULL),
(866, 116, 'Taraka', NULL),
(867, 116, 'Tubaran', NULL),
(868, 116, 'Tugaya', NULL),
(869, 116, 'Wao', NULL),
(870, 56, 'Abuyog', NULL),
(871, 56, 'Alangalang', NULL),
(872, 56, 'Albuera', NULL),
(873, 56, 'Babatngon', NULL),
(874, 56, 'Barugo', NULL),
(875, 56, 'Bato', NULL),
(876, 56, 'Baybay', NULL),
(877, 56, 'Burauen', NULL),
(878, 56, 'Calubian', NULL),
(879, 56, 'Capoocan', NULL),
(880, 56, 'Carigara', NULL),
(881, 56, 'Dagami', NULL),
(882, 56, 'Dulag', NULL),
(883, 56, 'Hilongos', NULL),
(884, 56, 'Hindang', NULL),
(885, 56, 'Inopacan', NULL),
(886, 56, 'Isabel', NULL),
(887, 56, 'Jaro', NULL),
(888, 56, 'Javier', NULL),
(889, 56, 'Julita', NULL),
(890, 56, 'Kananga', NULL),
(891, 56, 'La Paz', NULL),
(892, 56, 'Leyte', NULL),
(893, 56, 'MacArthur', NULL),
(894, 56, 'Mahaplag', NULL),
(895, 56, 'Matag-ob', NULL),
(896, 56, 'Matalom', NULL),
(897, 56, 'Mayorga', NULL),
(898, 56, 'Merida', NULL),
(899, 56, 'Ormoc', NULL),
(900, 56, 'Palo', NULL),
(901, 56, 'Palompon', NULL),
(902, 56, 'Pastrana', NULL),
(903, 56, 'San Isidro', NULL),
(904, 56, 'San Miguel', NULL),
(905, 56, 'Santa Fe', NULL),
(906, 56, 'Tabango', NULL),
(907, 56, 'Tabontabon', NULL),
(908, 56, 'Tacloban*', NULL),
(909, 56, 'Tanauan', NULL),
(910, 56, 'Tolosa', NULL),
(911, 56, 'Tunga', NULL),
(912, 56, 'Villaba', NULL),
(913, 117, 'Barira', NULL),
(914, 117, 'Buldon', NULL),
(915, 117, 'Cotabato City*', NULL),
(916, 117, 'Datu Blah T. Sinsuat', NULL),
(917, 117, 'Datu Odin Sinsuat', NULL),
(918, 117, 'Kabuntalan', NULL),
(919, 117, 'Matanog', NULL),
(920, 117, 'Northern Kabuntalan', NULL),
(921, 117, 'Parang', NULL),
(922, 117, 'Sultan Kudarat', NULL),
(923, 117, 'Sultan Mastura', NULL),
(924, 117, 'Talitay', NULL),
(925, 117, 'Upi', NULL),
(926, 118, 'Ampatuan', NULL),
(927, 118, 'Buluan*', NULL),
(928, 118, 'Datu Abdullah Sangki', NULL),
(929, 118, 'Datu Anggal Midtimbang', NULL),
(930, 118, 'Datu Hoffer Ampatuan', NULL),
(931, 118, 'Datu Montawal', NULL),
(932, 118, 'Datu Paglas', NULL),
(933, 118, 'Datu Piang', NULL),
(934, 118, 'Datu Salibo', NULL),
(935, 118, 'Datu Saudi-Ampatuan', NULL),
(936, 118, 'Datu Unsay', NULL),
(937, 118, 'General Salipada K. Pendatun', NULL),
(938, 118, 'Guindulungan', NULL),
(939, 118, 'Mamasapano', NULL),
(940, 118, 'Mangudadatu', NULL),
(941, 118, 'Pagalungan', NULL),
(942, 118, 'Paglat', NULL),
(943, 118, 'Pandag', NULL),
(944, 118, 'Rajah Buayan', NULL),
(945, 118, 'Shariff Aguak', NULL),
(946, 118, 'Shariff Saydona Mustapha', NULL),
(947, 118, 'South Upi', NULL),
(948, 118, 'Sultan sa Barongis', NULL),
(949, 118, 'Talayan', NULL),
(950, 27, 'Boac*', NULL),
(951, 27, 'Buenavista', NULL),
(952, 27, 'Gasan', NULL),
(953, 27, 'Mogpog', NULL),
(954, 27, 'Santa Cruz', NULL),
(955, 27, 'Torrijos', NULL),
(956, 37, 'Aroroy', NULL),
(957, 37, 'Baleno', NULL),
(958, 37, 'Balud', NULL),
(959, 37, 'Batuan', NULL),
(960, 37, 'Cataingan', NULL),
(961, 37, 'Cawayan', NULL),
(962, 37, 'Claveria', NULL),
(963, 37, 'Dimasalang', NULL),
(964, 37, 'Esperanza', NULL),
(965, 37, 'Mandaon', NULL),
(966, 37, 'Masbate City*', NULL),
(967, 37, 'Milagros', NULL),
(968, 37, 'Mobo', NULL),
(969, 37, 'Monreal', NULL),
(970, 37, 'Palanas', NULL),
(971, 37, 'Pio V. Corpus', NULL),
(972, 37, 'Placer', NULL),
(973, 37, 'San Fernando', NULL),
(974, 37, 'San Jacinto', NULL),
(975, 37, 'San Pascual', NULL),
(976, 37, 'Uson', NULL),
(977, 96, 'Caloocan', NULL),
(978, 96, 'Las Piñas', NULL),
(979, 96, 'Makati', NULL),
(980, 96, 'Malabon', NULL),
(981, 96, 'Mandaluyong', NULL),
(982, 96, 'Manila', NULL),
(983, 96, 'Marikina', NULL),
(984, 96, 'Muntinlupa', NULL),
(985, 96, 'Navotas', NULL),
(986, 96, 'Parañaque', NULL),
(987, 96, 'Pasay', NULL),
(988, 96, 'Pasig', NULL),
(989, 96, 'Pateros', NULL),
(990, 96, 'Quezon City**', NULL),
(991, 96, 'San Juan', NULL),
(992, 96, 'Taguig', NULL),
(993, 96, 'Valenzuela', NULL),
(994, 71, 'Aloran', NULL),
(995, 71, 'Baliangao', NULL),
(996, 71, 'Bonifacio', NULL),
(997, 71, 'Calamba', NULL),
(998, 71, 'Clarin', NULL),
(999, 71, 'Concepcion', NULL),
(1000, 71, 'Don Victoriano Chiongbian', NULL),
(1001, 71, 'Jimenez', NULL),
(1002, 71, 'Lopez Jaena', NULL),
(1003, 71, 'Oroquieta', NULL),
(1004, 71, 'Ozamiz*', NULL),
(1005, 71, 'Panaon', NULL),
(1006, 71, 'Plaridel', NULL),
(1007, 71, 'Sapang Dalaga', NULL),
(1008, 71, 'Sinacaban', NULL),
(1009, 71, 'Tangub', NULL),
(1010, 71, 'Tudela', NULL),
(1011, 72, 'Alubijid', NULL),
(1012, 72, 'Balingasag', NULL),
(1013, 72, 'Balingoan', NULL),
(1014, 72, 'Binuangan', NULL),
(1015, 72, 'Cagayan de Oro*', NULL),
(1016, 72, 'Claveria', NULL),
(1017, 72, 'El Salvador', NULL),
(1018, 72, 'Gingoog', NULL),
(1019, 72, 'Gitagum', NULL),
(1020, 72, 'Initao', NULL),
(1021, 72, 'Jasaan', NULL),
(1022, 72, 'Kinoguitan', NULL),
(1023, 72, 'Lagonglong', NULL),
(1024, 72, 'Laguindingan', NULL),
(1025, 72, 'Libertad', NULL),
(1026, 72, 'Lugait', NULL),
(1027, 72, 'Magsaysay', NULL),
(1028, 72, 'Manticao', NULL),
(1029, 72, 'Medina', NULL),
(1030, 72, 'Naawan', NULL),
(1031, 72, 'Opol', NULL),
(1032, 72, 'Salay', NULL),
(1033, 72, 'Sugbongcogon', NULL),
(1034, 72, 'Tagoloan', NULL),
(1035, 72, 'Talisayan', NULL),
(1036, 72, 'Villanueva', NULL),
(1037, 114, 'Barlig', NULL),
(1038, 114, 'Bauko*', NULL),
(1039, 114, 'Besao', NULL),
(1040, 114, 'Bontoc', NULL),
(1041, 114, 'Natonin', NULL),
(1042, 114, 'Paracelis', NULL),
(1043, 114, 'Sabangan', NULL),
(1044, 114, 'Sadanga', NULL),
(1045, 114, 'Sagada', NULL),
(1046, 114, 'Tadian', NULL),
(1047, 46, 'Bacolod*', NULL),
(1048, 46, 'Bago', NULL),
(1049, 46, 'Binalbagan', NULL),
(1050, 46, 'Cadiz', NULL),
(1051, 46, 'Calatrava', NULL),
(1052, 46, 'Candoni', NULL),
(1053, 46, 'Cauayan', NULL),
(1054, 46, 'Don Salvador Benedicto', NULL),
(1055, 46, 'Enrique B. Magalona', NULL),
(1056, 46, 'Escalante', NULL),
(1057, 46, 'Himamaylan', NULL),
(1058, 46, 'Hinigaran', NULL),
(1059, 46, 'Hinoba-an', NULL),
(1060, 46, 'Ilog', NULL),
(1061, 46, 'Isabela', NULL),
(1062, 46, 'Kabankalan', NULL),
(1063, 46, 'La Carlota', NULL),
(1064, 46, 'La Castellana', NULL),
(1065, 46, 'Manapla', NULL),
(1066, 46, 'Moises Padilla', NULL),
(1067, 46, 'Murcia', NULL),
(1068, 46, 'Pontevedra', NULL),
(1069, 46, 'Pulupandan', NULL),
(1070, 46, 'Sagay', NULL),
(1071, 46, 'San Carlos', NULL),
(1072, 46, 'San Enrique', NULL),
(1073, 46, 'Silay', NULL),
(1074, 46, 'Sipalay', NULL),
(1075, 46, 'Talisay', NULL),
(1076, 46, 'Toboso', NULL),
(1077, 46, 'Valladolid', NULL),
(1078, 46, 'Victorias', NULL),
(1079, 52, 'Amlan', NULL),
(1080, 52, 'Ayungon', NULL),
(1081, 52, 'Bacong', NULL),
(1082, 52, 'Bais', NULL),
(1083, 52, 'Basay', NULL),
(1084, 52, 'Bayawan', NULL),
(1085, 52, 'Bindoy', NULL),
(1086, 52, 'Canlaon', NULL),
(1087, 52, 'Dauin', NULL),
(1088, 52, 'Dumaguete*', NULL),
(1089, 52, 'Guihulngan', NULL),
(1090, 52, 'Jimalalud', NULL),
(1091, 52, 'La Libertad', NULL),
(1092, 52, 'Mabinay', NULL),
(1093, 52, 'Manjuyod', NULL),
(1094, 52, 'Pamplona', NULL),
(1095, 52, 'San Jose', NULL),
(1096, 52, 'Santa Catalina', NULL),
(1097, 52, 'Siaton', NULL),
(1098, 52, 'Sibulan', NULL),
(1099, 52, 'Tanjay', NULL),
(1100, 52, 'Tayasan', NULL),
(1101, 52, 'Valencia', NULL),
(1102, 52, 'Vallehermoso', NULL),
(1103, 52, 'Zamboanguita', NULL),
(1104, 57, 'Allen', NULL),
(1105, 57, 'Biri', NULL),
(1106, 57, 'Bobon', NULL),
(1107, 57, 'Capul', NULL),
(1108, 57, 'Catarman*', NULL),
(1109, 57, 'Catubig', NULL),
(1110, 57, 'Gamay', NULL),
(1111, 57, 'Laoang', NULL),
(1112, 57, 'Lapinig', NULL),
(1113, 57, 'Las Navas', NULL),
(1114, 57, 'Lavezares', NULL),
(1115, 57, 'Lope de Vega', NULL),
(1116, 57, 'Mapanas', NULL),
(1117, 57, 'Mondragon', NULL),
(1118, 57, 'Palapag', NULL),
(1119, 57, 'Pambujan', NULL),
(1120, 57, 'Rosario', NULL),
(1121, 57, 'San Antonio', NULL),
(1122, 57, 'San Isidro', NULL),
(1123, 57, 'San Jose', NULL),
(1124, 57, 'San Roque', NULL),
(1125, 57, 'San Vicente', NULL),
(1126, 57, 'Silvino Lobos', NULL),
(1127, 57, 'Victoria', NULL),
(1128, 15, 'Aliaga', NULL),
(1129, 15, 'Bongabon', NULL),
(1130, 15, 'Cabanatuan*', NULL),
(1131, 15, 'Cabiao', NULL),
(1132, 15, 'Carranglan', NULL),
(1133, 15, 'Cuyapo', NULL),
(1134, 15, 'Gabaldon', NULL),
(1135, 15, 'Gapan', NULL),
(1136, 15, 'General Mamerto Natividad', NULL),
(1137, 15, 'General Tinio', NULL),
(1138, 15, 'Guimba', NULL),
(1139, 15, 'Jaen', NULL),
(1140, 15, 'Laur', NULL),
(1141, 15, 'Licab', NULL),
(1142, 15, 'Llanera', NULL),
(1143, 15, 'Lupao', NULL),
(1144, 15, 'Muñoz', NULL),
(1145, 15, 'Nampicuan', NULL),
(1146, 15, 'Palayan', NULL),
(1147, 15, 'Pantabangan', NULL),
(1148, 15, 'Peñaranda', NULL),
(1149, 15, 'Quezon', NULL),
(1150, 15, 'Rizal', NULL),
(1151, 15, 'San Antonio', NULL),
(1152, 15, 'San Isidro', NULL),
(1153, 15, 'San Jose', NULL),
(1154, 15, 'San Leonardo', NULL),
(1155, 15, 'Santa Rosa', NULL),
(1156, 15, 'Santo Domingo', NULL),
(1157, 15, 'Talavera', NULL),
(1158, 15, 'Talugtug', NULL),
(1159, 15, 'Zaragoza', NULL),
(1160, 8, 'Alfonso Castañeda', NULL),
(1161, 8, 'Ambaguio', NULL),
(1162, 8, 'Aritao', NULL),
(1163, 8, 'Bagabag', NULL),
(1164, 8, 'Bambang', NULL),
(1165, 8, 'Bayombong*', NULL),
(1166, 8, 'Diadi', NULL),
(1167, 8, 'Dupax del Norte', NULL),
(1168, 8, 'Dupax del Sur', NULL),
(1169, 8, 'Kasibu', NULL),
(1170, 8, 'Kayapa', NULL),
(1171, 8, 'Quezon', NULL),
(1172, 8, 'Santa Fe', NULL),
(1173, 8, 'Solano', NULL),
(1174, 8, 'Villaverde', NULL),
(1175, 28, 'Abra de Ilog', NULL),
(1176, 28, 'Calintaan', NULL),
(1177, 28, 'Looc', NULL),
(1178, 28, 'Lubang', NULL),
(1179, 28, 'Magsaysay', NULL),
(1180, 28, 'Mamburao', NULL),
(1181, 28, 'Paluan', NULL),
(1182, 28, 'Rizal', NULL),
(1183, 28, 'Sablayan', NULL),
(1184, 28, 'San Jose*', NULL),
(1185, 28, 'Santa Cruz', NULL),
(1186, 29, 'Baco', NULL),
(1187, 29, 'Bansud', NULL),
(1188, 29, 'Bongabong', NULL),
(1189, 29, 'Bulalacao', NULL),
(1190, 29, 'Calapan*', NULL),
(1191, 29, 'Gloria', NULL),
(1192, 29, 'Mansalay', NULL),
(1193, 29, 'Naujan', NULL),
(1194, 29, 'Pinamalayan', NULL),
(1195, 29, 'Pola', NULL),
(1196, 29, 'Puerto Galera', NULL),
(1197, 29, 'Roxas', NULL),
(1198, 29, 'San Teodoro', NULL),
(1199, 29, 'Socorro', NULL),
(1200, 29, 'Victoria', NULL),
(1201, 30, 'Aborlan', NULL),
(1202, 30, 'Agutaya', NULL),
(1203, 30, 'Araceli', NULL),
(1204, 30, 'Balabac', NULL),
(1205, 30, 'Bataraza', NULL),
(1206, 30, 'Brooke\'s Point', NULL),
(1207, 30, 'Busuanga', NULL),
(1208, 30, 'Cagayancillo', NULL),
(1209, 30, 'Coron', NULL),
(1210, 30, 'Culion', NULL),
(1211, 30, 'Cuyo', NULL),
(1212, 30, 'Dumaran', NULL),
(1213, 30, 'El Nido', NULL),
(1214, 30, 'Kalayaan', NULL),
(1215, 30, 'Linapacan', NULL),
(1216, 30, 'Magsaysay', NULL),
(1217, 30, 'Narra', NULL),
(1218, 30, 'Puerto Princesa*', NULL),
(1219, 30, 'Quezon', NULL),
(1220, 30, 'Rizal', NULL),
(1221, 30, 'Roxas', NULL),
(1222, 30, 'San Vicente', NULL),
(1223, 30, 'Sofronio Española', NULL),
(1224, 30, 'Taytay', NULL),
(1225, 17, 'Angeles*', NULL),
(1226, 17, 'Apalit', NULL),
(1227, 17, 'Arayat', NULL),
(1228, 17, 'Bacolor', NULL),
(1229, 17, 'Candaba', NULL),
(1230, 17, 'Floridablanca', NULL),
(1231, 17, 'Guagua', NULL),
(1232, 17, 'Lubao', NULL),
(1233, 17, 'Mabalacat', NULL),
(1234, 17, 'Macabebe', NULL),
(1235, 17, 'Magalang', NULL),
(1236, 17, 'Masantol', NULL),
(1237, 17, 'Mexico', NULL),
(1238, 17, 'Minalin', NULL),
(1239, 17, 'Porac', NULL),
(1240, 17, 'San Fernando', NULL),
(1241, 17, 'San Luis', NULL),
(1242, 17, 'San Simon', NULL),
(1243, 17, 'Santa Ana', NULL),
(1244, 17, 'Santa Rita', NULL),
(1245, 17, 'Santo Tomas', NULL),
(1246, 17, 'Sasmuan', NULL),
(1247, 4, 'Agno', NULL),
(1248, 4, 'Aguilar', NULL),
(1249, 4, 'Alaminos', NULL),
(1250, 4, 'Alcala', NULL),
(1251, 4, 'Anda', NULL),
(1252, 4, 'Asingan', NULL),
(1253, 4, 'Balungao', NULL),
(1254, 4, 'Bani', NULL),
(1255, 4, 'Basista', NULL),
(1256, 4, 'Bautista', NULL),
(1257, 4, 'Bayambang', NULL),
(1258, 4, 'Binalonan', NULL),
(1259, 4, 'Binmaley', NULL),
(1260, 4, 'Bolinao', NULL),
(1261, 4, 'Bugallon', NULL),
(1262, 4, 'Burgos', NULL),
(1263, 4, 'Calasiao', NULL),
(1264, 4, 'Dagupan', NULL),
(1265, 4, 'Dasol', NULL),
(1266, 4, 'Infanta', NULL),
(1267, 4, 'Labrador', NULL),
(1268, 4, 'Laoac', NULL),
(1269, 4, 'Lingayen', NULL),
(1270, 4, 'Mabini', NULL),
(1271, 4, 'Malasiqui', NULL),
(1272, 4, 'Manaoag', NULL),
(1273, 4, 'Mangaldan', NULL),
(1274, 4, 'Mangatarem', NULL),
(1275, 4, 'Mapandan', NULL),
(1276, 4, 'Natividad', NULL),
(1277, 4, 'Pozorrubio', NULL),
(1278, 4, 'Rosales', NULL),
(1279, 4, 'San Carlos*', NULL),
(1280, 4, 'San Fabian', NULL),
(1281, 4, 'San Jacinto', NULL),
(1282, 4, 'San Manuel', NULL),
(1283, 4, 'San Nicolas', NULL),
(1284, 4, 'San Quintin', NULL),
(1285, 4, 'Santa Barbara', NULL),
(1286, 4, 'Santa Maria', NULL),
(1287, 4, 'Santo Tomas', NULL),
(1288, 4, 'Sison', NULL),
(1289, 4, 'Sual', NULL),
(1290, 4, 'Tayug', NULL),
(1291, 4, 'Umingan', NULL),
(1292, 4, 'Urbiztondo', NULL),
(1293, 4, 'Urdaneta', NULL),
(1294, 4, 'Villasis', NULL),
(1295, 25, 'Agdangan', NULL),
(1296, 25, 'Alabat', NULL),
(1297, 25, 'Atimonan', NULL),
(1298, 25, 'Buenavista', NULL),
(1299, 25, 'Burdeos', NULL),
(1300, 25, 'Calauag', NULL),
(1301, 25, 'Candelaria', NULL),
(1302, 25, 'Catanauan', NULL),
(1303, 25, 'Dolores', NULL),
(1304, 25, 'General Luna', NULL),
(1305, 25, 'General Nakar', NULL),
(1306, 25, 'Guinayangan', NULL),
(1307, 25, 'Gumaca', NULL),
(1308, 25, 'Infanta', NULL),
(1309, 25, 'Jomalig', NULL),
(1310, 25, 'Lopez', NULL),
(1311, 25, 'Lucban', NULL),
(1312, 25, 'Lucena*', NULL),
(1313, 25, 'Macalelon', NULL),
(1314, 25, 'Mauban', NULL),
(1315, 25, 'Mulanay', NULL),
(1316, 25, 'Padre Burgos', NULL),
(1317, 25, 'Pagbilao', NULL),
(1318, 25, 'Panukulan', NULL),
(1319, 25, 'Patnanungan', NULL),
(1320, 25, 'Perez', NULL),
(1321, 25, 'Pitogo', NULL),
(1322, 25, 'Plaridel', NULL),
(1323, 25, 'Polillo', NULL),
(1324, 25, 'Quezon', NULL),
(1325, 25, 'Real', NULL),
(1326, 25, 'Sampaloc', NULL),
(1327, 25, 'San Andres', NULL),
(1328, 25, 'San Antonio', NULL),
(1329, 25, 'San Francisco', NULL),
(1330, 25, 'San Narciso', NULL),
(1331, 25, 'Sariaya', NULL),
(1332, 25, 'Tagkawayan', NULL),
(1333, 25, 'Tayabas', NULL),
(1334, 25, 'Tiaong', NULL),
(1335, 25, 'Unisan', NULL),
(1336, 9, 'Aglipay', NULL),
(1337, 9, 'Cabarroguis', NULL),
(1338, 9, 'Diffun*', NULL),
(1339, 9, 'Maddela', NULL),
(1340, 9, 'Nagtipunan', NULL),
(1341, 9, 'Saguday', NULL),
(1342, 26, 'Angono', NULL),
(1343, 26, 'Antipolo*', NULL),
(1344, 26, 'Baras', NULL),
(1345, 26, 'Binangonan', NULL),
(1346, 26, 'Cainta', NULL),
(1347, 26, 'Cardona', NULL),
(1348, 26, 'Jalajala', NULL),
(1349, 26, 'Morong', NULL),
(1350, 26, 'Pililla', NULL),
(1351, 26, 'Rodriguez', NULL),
(1352, 26, 'San Mateo', NULL),
(1353, 26, 'Tanay', NULL),
(1354, 26, 'Taytay', NULL),
(1355, 26, 'Teresa', NULL),
(1356, 32, 'Alcantara', NULL),
(1357, 32, 'Banton', NULL),
(1358, 32, 'Cajidiocan', NULL),
(1359, 32, 'Calatrava', NULL),
(1360, 32, 'Concepcion', NULL),
(1361, 32, 'Corcuera', NULL),
(1362, 32, 'Ferrol', NULL),
(1363, 32, 'Looc', NULL),
(1364, 32, 'Magdiwang', NULL),
(1365, 32, 'Odiongan*', NULL),
(1366, 32, 'Romblon', NULL),
(1367, 32, 'San Agustin', NULL),
(1368, 32, 'San Andres', NULL),
(1369, 32, 'San Fernando', NULL),
(1370, 32, 'San Jose', NULL),
(1371, 32, 'Santa Fe', NULL),
(1372, 32, 'Santa Maria', NULL),
(1373, 58, 'Almagro', NULL),
(1374, 58, 'Basey', NULL),
(1375, 58, 'Calbayog*', NULL),
(1376, 58, 'Calbiga', NULL),
(1377, 58, 'Catbalogan', NULL),
(1378, 58, 'Daram', NULL),
(1379, 58, 'Gandara', NULL),
(1380, 58, 'Hinabangan', NULL),
(1381, 58, 'Jiabong', NULL),
(1382, 58, 'Marabut', NULL),
(1383, 58, 'Matuguinao', NULL),
(1384, 58, 'Motiong', NULL),
(1385, 58, 'Pagsanghan', NULL),
(1386, 58, 'Paranas', NULL),
(1387, 58, 'Pinabacdao', NULL),
(1388, 58, 'San Jorge', NULL),
(1389, 58, 'San Jose de Buan', NULL),
(1390, 58, 'San Sebastian', NULL),
(1391, 58, 'Santa Margarita', NULL),
(1392, 58, 'Santa Rita', NULL),
(1393, 58, 'Santo Niño', NULL),
(1394, 58, 'Tagapul-an', NULL),
(1395, 58, 'Talalora', NULL),
(1396, 58, 'Tarangnan', NULL),
(1397, 58, 'Villareal', NULL),
(1398, 58, 'Zumarraga', NULL),
(1399, 82, 'Alabel', NULL),
(1400, 82, 'Glan*', NULL),
(1401, 82, 'Kiamba', NULL),
(1402, 82, 'Maasim', NULL),
(1403, 82, 'Maitum', NULL),
(1404, 82, 'Malapatan', NULL),
(1405, 82, 'Malungon', NULL),
(1406, 53, 'Enrique Villanueva', NULL),
(1407, 53, 'Larena', NULL),
(1408, 53, 'Lazi', NULL),
(1409, 53, 'Maria', NULL),
(1410, 53, 'San Juan', NULL),
(1411, 53, 'Siquijor*', NULL),
(1412, 38, 'Barcelona', NULL),
(1413, 38, 'Bulan', NULL),
(1414, 38, 'Bulusan', NULL),
(1415, 38, 'Casiguran', NULL),
(1416, 38, 'Castilla', NULL),
(1417, 38, 'Donsol', NULL),
(1418, 38, 'Gubat', NULL),
(1419, 38, 'Irosin', NULL),
(1420, 38, 'Juban', NULL),
(1421, 38, 'Magallanes', NULL),
(1422, 38, 'Matnog', NULL),
(1423, 38, 'Pilar', NULL),
(1424, 38, 'Prieto Diaz', NULL),
(1425, 38, 'Santa Magdalena', NULL),
(1426, 38, 'Sorsogon City*', NULL),
(1427, 83, 'Banga', NULL),
(1428, 83, 'General Santos*', NULL),
(1429, 83, 'Koronadal', NULL),
(1430, 83, 'Lake Sebu', NULL),
(1431, 83, 'Norala', NULL),
(1432, 83, 'Polomolok', NULL),
(1433, 83, 'Santo Niño', NULL),
(1434, 83, 'Surallah', NULL),
(1435, 83, 'T\'Boli', NULL),
(1436, 83, 'Tampakan', NULL),
(1437, 83, 'Tantangan', NULL),
(1438, 83, 'Tupi', NULL),
(1439, 59, 'Anahawan', NULL),
(1440, 59, 'Bontoc', NULL),
(1441, 59, 'Hinunangan', NULL),
(1442, 59, 'Hinundayan', NULL),
(1443, 59, 'Libagon', NULL),
(1444, 59, 'Liloan', NULL),
(1445, 59, 'Limasawa', NULL),
(1446, 59, 'Maasin*', NULL),
(1447, 59, 'Macrohon', NULL),
(1448, 59, 'Malitbog', NULL),
(1449, 59, 'Padre Burgos', NULL),
(1450, 59, 'Pintuyan', NULL),
(1451, 59, 'Saint Bernard', NULL),
(1452, 59, 'San Francisco', NULL),
(1453, 59, 'San Juan', NULL),
(1454, 59, 'San Ricardo', NULL),
(1455, 59, 'Silago', NULL),
(1456, 59, 'Sogod', NULL),
(1457, 59, 'Tomas Oppus', NULL),
(1458, 84, 'Bagumbayan', NULL),
(1459, 84, 'Columbio', NULL),
(1460, 84, 'Esperanza', NULL),
(1461, 84, 'Isulan', NULL),
(1462, 84, 'Kalamansig', NULL),
(1463, 84, 'Lambayong', NULL),
(1464, 84, 'Lebak', NULL),
(1465, 84, 'Lutayan', NULL),
(1466, 84, 'Palimbang', NULL),
(1467, 84, 'President Quirino', NULL),
(1468, 84, 'Senator Ninoy Aquino', NULL),
(1469, 84, 'Tacurong*', NULL),
(1470, 119, 'Banguingui', NULL),
(1471, 119, 'Hadji Panglima Tahil', NULL),
(1472, 119, 'Indanan', NULL),
(1473, 119, 'Jolo*', NULL),
(1474, 119, 'Kalingalan Caluang', NULL),
(1475, 119, 'Lugus', NULL),
(1476, 119, 'Luuk', NULL),
(1477, 119, 'Maimbung', NULL),
(1478, 119, 'Omar', NULL),
(1479, 119, 'Panamao', NULL),
(1480, 119, 'Pandami', NULL),
(1481, 119, 'Panglima Estino', NULL),
(1482, 119, 'Pangutaran', NULL),
(1483, 119, 'Parang', NULL),
(1484, 119, 'Pata', NULL),
(1485, 119, 'Patikul', NULL),
(1486, 119, 'Siasi', NULL),
(1487, 119, 'Talipao', NULL),
(1488, 119, 'Tapul', NULL),
(1489, 89, 'Alegria', NULL),
(1490, 89, 'Bacuag', NULL),
(1491, 89, 'Burgos', NULL),
(1492, 89, 'Claver', NULL),
(1493, 89, 'Dapa', NULL),
(1494, 89, 'Del Carmen', NULL),
(1495, 89, 'General Luna', NULL),
(1496, 89, 'Gigaquit', NULL),
(1497, 89, 'Mainit', NULL),
(1498, 89, 'Malimono', NULL),
(1499, 89, 'Pilar', NULL),
(1500, 89, 'Placer', NULL),
(1501, 89, 'San Benito', NULL),
(1502, 89, 'San Francisco', NULL),
(1503, 89, 'San Isidro', NULL),
(1504, 89, 'Santa Monica', NULL),
(1505, 89, 'Sison', NULL),
(1506, 89, 'Socorro', NULL),
(1507, 89, 'Surigao City*', NULL),
(1508, 89, 'Tagana-an', NULL),
(1509, 89, 'Tubod', NULL),
(1510, 90, 'Barobo', NULL),
(1511, 90, 'Bayabas', NULL),
(1512, 90, 'Bislig*', NULL),
(1513, 90, 'Cagwait', NULL),
(1514, 90, 'Cantilan', NULL),
(1515, 90, 'Carmen', NULL),
(1516, 90, 'Carrascal', NULL),
(1517, 90, 'Cortes', NULL),
(1518, 90, 'Hinatuan', NULL),
(1519, 90, 'Lanuza', NULL),
(1520, 90, 'Lianga', NULL),
(1521, 90, 'Lingig', NULL),
(1522, 90, 'Madrid', NULL),
(1523, 90, 'Marihatag', NULL),
(1524, 90, 'San Agustin', NULL),
(1525, 90, 'San Miguel', NULL),
(1526, 90, 'Tagbina', NULL),
(1527, 90, 'Tago', NULL),
(1528, 90, 'Tandag', NULL),
(1529, 18, 'Anao', NULL),
(1530, 18, 'Bamban', NULL),
(1531, 18, 'Camiling', NULL),
(1532, 18, 'Capas', NULL),
(1533, 18, 'Concepcion', NULL),
(1534, 18, 'Gerona', NULL),
(1535, 18, 'La Paz', NULL),
(1536, 18, 'Mayantoc', NULL),
(1537, 18, 'Moncada', NULL),
(1538, 18, 'Paniqui', NULL),
(1539, 18, 'Pura', NULL),
(1540, 18, 'Ramos', NULL),
(1541, 18, 'San Clemente', NULL),
(1542, 18, 'San Jose', NULL),
(1543, 18, 'San Manuel', NULL),
(1544, 18, 'Santa Ignacia', NULL),
(1545, 18, 'Tarlac City*', NULL),
(1546, 18, 'Victoria', NULL),
(1547, 120, 'Bongao*', NULL),
(1548, 120, 'Languyan', NULL),
(1549, 120, 'Mapun', NULL),
(1550, 120, 'Panglima Sugala', NULL),
(1551, 120, 'Sapa-Sapa', NULL),
(1552, 120, 'Sibutu', NULL),
(1553, 120, 'Simunul', NULL),
(1554, 120, 'Sitangkai', NULL),
(1555, 120, 'South Ubian', NULL),
(1556, 120, 'Tandubas', NULL),
(1557, 120, 'Turtle Islands', NULL),
(1558, 19, 'Botolan', NULL),
(1559, 19, 'Cabangan', NULL),
(1560, 19, 'Candelaria', NULL),
(1561, 19, 'Castillejos', NULL),
(1562, 19, 'Iba', NULL),
(1563, 19, 'Masinloc', NULL),
(1564, 19, 'Olongapo*', NULL),
(1565, 19, 'Palauig', NULL),
(1566, 19, 'San Antonio', NULL),
(1567, 19, 'San Felipe', NULL),
(1568, 19, 'San Marcelino', NULL),
(1569, 19, 'San Narciso', NULL),
(1570, 19, 'Santa Cruz', NULL),
(1571, 19, 'Subic', NULL),
(1572, 63, 'Baliguian', NULL),
(1573, 63, 'Dapitan', NULL),
(1574, 63, 'Dipolog*', NULL),
(1575, 63, 'Godod', NULL),
(1576, 63, 'Gutalac', NULL),
(1577, 63, 'Jose Dalman', NULL),
(1578, 63, 'Kalawit', NULL),
(1579, 63, 'Katipunan', NULL),
(1580, 63, 'La Libertad', NULL),
(1581, 63, 'Labason', NULL),
(1582, 63, 'Leon B. Postigo', NULL),
(1583, 63, 'Liloy', NULL),
(1584, 63, 'Manukan', NULL),
(1585, 63, 'Mutia', NULL),
(1586, 63, 'Piñan', NULL),
(1587, 63, 'Polanco', NULL),
(1588, 63, 'Rizal', NULL),
(1589, 63, 'Roxas', NULL),
(1590, 63, 'Salug', NULL),
(1591, 63, 'Sergio Osmeña', NULL),
(1592, 63, 'Siayan', NULL),
(1593, 63, 'Sibuco', NULL),
(1594, 63, 'Sibutad', NULL),
(1595, 63, 'Sindangan', NULL),
(1596, 63, 'Siocon', NULL),
(1597, 63, 'Sirawai', NULL),
(1598, 63, 'Tampilisan', NULL),
(1599, 64, 'Aurora', NULL),
(1600, 64, 'Bayog', NULL),
(1601, 64, 'Dimataling', NULL),
(1602, 64, 'Dinas', NULL),
(1603, 64, 'Dumalinao', NULL),
(1604, 64, 'Dumingag', NULL),
(1605, 64, 'Guipos', NULL),
(1606, 64, 'Josefina', NULL),
(1607, 64, 'Kumalarang', NULL),
(1608, 64, 'Labangan', NULL),
(1609, 64, 'Lakewood', NULL),
(1610, 64, 'Lapuyan', NULL),
(1611, 64, 'Mahayag', NULL),
(1612, 64, 'Margosatubig', NULL),
(1613, 64, 'Midsalip', NULL),
(1614, 64, 'Molave', NULL),
(1615, 64, 'Pagadian', NULL),
(1616, 64, 'Pitogo', NULL),
(1617, 64, 'Ramon Magsaysay', NULL),
(1618, 64, 'San Miguel', NULL),
(1619, 64, 'San Pablo', NULL),
(1620, 64, 'Sominot', NULL),
(1621, 64, 'Tabina', NULL),
(1622, 64, 'Tambulig', NULL),
(1623, 64, 'Tigbao', NULL),
(1624, 64, 'Tukuran', NULL),
(1625, 64, 'Vincenzo A. Sagun', NULL),
(1626, 64, 'Zamboanga City*', NULL),
(1627, 65, 'Alicia', NULL),
(1628, 65, 'Buug', NULL),
(1629, 65, 'Diplahan', NULL),
(1630, 65, 'Imelda', NULL),
(1631, 65, 'Ipil*', NULL),
(1632, 65, 'Kabasalan', NULL),
(1633, 65, 'Mabuhay', NULL),
(1634, 65, 'Malangas', NULL),
(1635, 65, 'Naga', NULL),
(1636, 65, 'Olutanga', NULL),
(1637, 65, 'Payao', NULL),
(1638, 65, 'Roseller Lim', NULL),
(1639, 65, 'Siay', NULL),
(1640, 65, 'Talusan', NULL),
(1641, 65, 'Titay', NULL),
(1642, 65, 'Tungawan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nature_of_appointment`
--

CREATE TABLE `nature_of_appointment` (
  `nature_of_appointment_id` int(11) NOT NULL,
  `nature_of_appointment_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `office_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `part_of_name`
--

CREATE TABLE `part_of_name` (
  `part_of_name_id` int(11) NOT NULL,
  `part_of_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `personnel_id` int(11) NOT NULL,
  `personnel_last_name` varchar(255) NOT NULL,
  `personnel_first_name` varchar(255) NOT NULL,
  `personnel_middle_name` varchar(255) DEFAULT NULL,
  `employee_no` varchar(50) NOT NULL,
  `personnel_birthdate` date NOT NULL,
  `sex_id_personnel_fk` int(11) NOT NULL,
  `civil_status_id_personnel_fk` int(11) NOT NULL,
  `birth_place` int(11) NOT NULL,
  `permanent_address_barangay_id` int(11) NOT NULL,
  `permanent_address_street` varchar(255) DEFAULT NULL,
  `permanent_address_subdivision_village` varchar(255) DEFAULT NULL,
  `permanent_address_house_block_lot_no` int(255) DEFAULT NULL,
  `present_address_barangay_id` int(11) NOT NULL,
  `present_address_street` varchar(255) DEFAULT NULL,
  `present_address_subdivision_village` varchar(255) DEFAULT NULL,
  `present_address_house_block_lot_no` varchar(255) DEFAULT NULL,
  `umid_id_no` varchar(100) NOT NULL,
  `pag_ibig_no` varchar(100) NOT NULL,
  `phil_health_no` varchar(100) NOT NULL,
  `phil_sys_no` varchar(100) NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`personnel_id`, `personnel_last_name`, `personnel_first_name`, `personnel_middle_name`, `employee_no`, `personnel_birthdate`, `sex_id_personnel_fk`, `civil_status_id_personnel_fk`, `birth_place`, `permanent_address_barangay_id`, `permanent_address_street`, `permanent_address_subdivision_village`, `permanent_address_house_block_lot_no`, `present_address_barangay_id`, `present_address_street`, `present_address_subdivision_village`, `present_address_house_block_lot_no`, `umid_id_no`, `pag_ibig_no`, `phil_health_no`, `phil_sys_no`, `tin_no`, `created_at`, `updated_at`) VALUES
(1, 'Quitasol', 'Kitz', 'Sayson', '6666666', '1992-01-12', 2, 2, 78, 1, 'Purok 3', 'Mayon Vista', 123, 1, 'Purok 3', 'Mayon Vista', '123', '111111', '222222', '333333', '4444444', '555555', '2026-05-21 05:47:23', '2026-05-21 05:47:23'),
(2, 'Greogorio', 'Angelica', 'Marchan', '777777', '1994-09-14', 1, 2, 78, 2, 'Purok 3', 'Riverside', 143, 2, 'Purok 3', 'Riverside', '143', '11212', '232434', '555555', '66666', '777777', '2026-05-21 05:50:37', '2026-05-21 05:50:37'),
(3, 'Quitasol', 'Emmanual', 'Sayson', '657778', '1994-01-12', 2, 1, 1197, 1, 'purok 6', 'Riverside', 245, 1, 'purok 6', 'Riverside', '245', '1111', '22222', '33333', '44444', '55555', '2026-05-21 05:54:37', '2026-05-21 05:54:37'),
(4, 'Padilla', 'Robin', 'Reyes', '76545346', '1972-02-08', 2, 2, 78, 1, 'Bato Street', 'SC', 12, 1, 'Bata Street', 'SC', '12', '3344', '45456', '5344234', '98865765', '345665', '2026-05-21 07:19:59', '2026-05-21 07:19:59'),
(5, 'Dela Rosa', 'Bato', 'Duterte', '6543222', '1970-11-01', 2, 1, 554, 1, 'Pedro Street', 'ICC', 911, 1, 'Pedro Street', 'ICC', '911', '654543534', '5643536', '5643435356', '34542', '65436', '2026-05-21 07:43:03', '2026-05-21 07:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `personnel_address`
--

CREATE TABLE `personnel_address` (
  `personnel_address_id` int(11) NOT NULL,
  `personnel_id_personnel_address_fk` int(11) NOT NULL,
  `barangay_id_personnel_address_fk` int(11) NOT NULL,
  `personnel_address_street` varchar(255) NOT NULL,
  `personnel_address_house_unit_no` varchar(50) DEFAULT NULL,
  `address_type_id_personnel_address_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_address_history`
--

CREATE TABLE `personnel_address_history` (
  `personnel_address_history_id` int(11) NOT NULL,
  `personnel_address_id_personnel_address_history_fk` int(11) NOT NULL,
  `barangay_id_personnel_address_history_fk` int(11) NOT NULL,
  `personnel_address_history_street` varchar(255) NOT NULL,
  `personnel_address_history_house_unit_no` varchar(50) DEFAULT NULL,
  `address_type_personnel_address_history_fk` int(11) NOT NULL,
  `personnel_address_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_ipcrf_rating`
--

CREATE TABLE `personnel_ipcrf_rating` (
  `personnel_ipcrf_rating_id` int(11) NOT NULL,
  `personnel_id_personnel_ipcrf_rating_fk` int(11) NOT NULL,
  `record_of_appontment_id_personnel_ipcrf_rating_fk` int(11) NOT NULL,
  `school_year_id_personnel_ipcrf_rating_fk` int(11) NOT NULL,
  `personnel_ipcrf_rating_value` decimal(4,3) DEFAULT NULL,
  `ipcrf_rating_scale_id_personnel_ipcrf_rating_fk` int(11) DEFAULT NULL,
  `ipcrf_rating_status_id_personnel_ipcrf_rating_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_separation_records`
--

CREATE TABLE `personnel_separation_records` (
  `personnel_separation_record_id` int(11) NOT NULL,
  `personnel_id_personnel_separation_record_fk` int(11) NOT NULL,
  `record_of_appointment_id_personnel_separation_record_fk` int(11) NOT NULL,
  `mode_of_separation_id_personnel_separation_record_fk` int(11) NOT NULL,
  `separation_status_id_personnel_separation_record_fk` int(11) NOT NULL,
  `separation_effectivity_date` datetime NOT NULL,
  `separation_processed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `job_position_id` int(11) NOT NULL,
  `job_position_title` varchar(255) NOT NULL,
  `salary_grade_id_job_position_fk` int(11) NOT NULL,
  `type_of_personnel_id_job_position_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL,
  `region_id_province_fk` int(11) NOT NULL,
  `province_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`province_id`, `region_id_province_fk`, `province_name`) VALUES
(1, 1, 'Ilocos Norte'),
(2, 1, 'Ilocos Sur'),
(3, 1, 'La Union'),
(4, 1, 'Pangasinan'),
(5, 2, 'Batanes'),
(6, 2, 'Cagayan'),
(7, 2, 'Isabela'),
(8, 2, 'Nueva Vizcaya'),
(9, 2, 'Quirino'),
(10, 2, 'Cagayan Valley Total'),
(11, 3, 'Angeles'),
(12, 3, 'Aurora'),
(13, 3, 'Bataan'),
(14, 3, 'Bulacan'),
(15, 3, 'Nueva Ecija'),
(16, 3, 'Olongapo'),
(17, 3, 'Pampanga'),
(18, 3, 'Tarlac'),
(19, 3, 'Zambales'),
(20, 3, 'Central Luzon Total'),
(21, 4, 'Batangas'),
(22, 4, 'Cavite'),
(23, 4, 'Lucena'),
(24, 4, 'Laguna'),
(25, 4, 'Quezon'),
(26, 4, 'Rizal'),
(27, 5, 'Marinduque'),
(28, 5, 'Occidental Mindoro'),
(29, 5, 'Oriental Mindoro'),
(30, 5, 'Palawan'),
(31, 5, 'Puerto Princesa'),
(32, 5, 'Romblon'),
(33, 6, 'Albay'),
(34, 6, 'Camarines Norte'),
(35, 6, 'Camarines Sur'),
(36, 6, 'Catanduanes'),
(37, 6, 'Masbate'),
(38, 6, 'Sorsogon'),
(39, 7, 'Aklan'),
(40, 7, 'Antique'),
(41, 7, 'Bacolod'),
(42, 7, 'Capiz'),
(43, 7, 'Guimaras'),
(44, 7, 'Iloilo'),
(45, 7, 'Iloilo City'),
(46, 7, 'Negros Occidental'),
(47, 8, 'Bohol'),
(48, 8, 'Cebu'),
(49, 8, 'Cebu City'),
(50, 8, 'Lapu-Lapu'),
(51, 8, 'Mandaue'),
(52, 8, 'Negros Oriental'),
(53, 8, 'Siquijor'),
(54, 9, 'Biliran'),
(55, 9, 'Eastern Samar'),
(56, 9, 'Leyte'),
(57, 9, 'Northern Samar'),
(58, 9, 'Samar'),
(59, 9, 'Southern Leyte'),
(60, 9, 'Tacloban'),
(61, 10, 'Isabela City'),
(62, 10, 'Zamboanga City'),
(63, 10, 'Zamboanga del Norte'),
(64, 10, 'Zamboanga del Sur'),
(65, 10, 'Zamboanga Sibugay'),
(66, 11, 'Bukidnon'),
(67, 11, 'Cagayan de Oro'),
(68, 11, 'Camiguin'),
(69, 11, 'Iligan'),
(70, 11, 'Lanao del Norte'),
(71, 11, 'Misamis Occidental'),
(72, 11, 'Misamis Oriental'),
(73, 12, 'Davao de Oro'),
(74, 12, 'Davao City'),
(75, 12, 'Davao del Norte'),
(76, 12, 'Davao del Sur'),
(77, 12, 'Davao Occidental'),
(78, 12, 'Davao Oriental'),
(79, 13, 'Cotabato'),
(80, 13, 'Cotabato City'),
(81, 13, 'General Santos'),
(82, 13, 'Sarangani'),
(83, 13, 'South Cotabato'),
(84, 13, 'Sultan Kudarat'),
(85, 14, 'Agusan del Norte'),
(86, 14, 'Agusan del Sur'),
(87, 14, 'Butuan'),
(88, 14, 'Dinagat Islands'),
(89, 14, 'Surigao del Norte'),
(90, 14, 'Surigao del Sur'),
(91, 15, 'Caloocan'),
(92, 15, 'Las Piñas'),
(93, 15, 'Makati'),
(94, 15, 'Malabon'),
(95, 15, 'Mandaluyong'),
(96, 15, 'Metro Manila'),
(97, 15, 'Marikina'),
(98, 15, 'Muntinlupa'),
(99, 15, 'Navotas'),
(100, 15, 'Parañaque'),
(101, 15, 'Pasay'),
(102, 15, 'Pasig'),
(103, 15, 'Pateros'),
(104, 15, 'Quezon City'),
(105, 15, 'San Juan'),
(106, 15, 'Taguig'),
(107, 15, 'Valenzuela'),
(108, 16, 'Abra'),
(109, 16, 'Apayao'),
(110, 16, 'Baguio'),
(111, 16, 'Benguet'),
(112, 16, 'Ifugao'),
(113, 16, 'Kalinga'),
(114, 16, 'Mountain Province'),
(115, 17, 'Basilan'),
(116, 17, 'Lanao del Sur'),
(117, 17, 'Maguindanao del Norte'),
(118, 17, 'Maguindanao del Sur'),
(119, 17, 'Sulu'),
(120, 17, 'Tawi-Tawi');

-- --------------------------------------------------------

--
-- Table structure for table `reason_for_change_correction_of_name`
--

CREATE TABLE `reason_for_change_correction_of_name` (
  `reason_for_change_correction_of_name_id` int(11) NOT NULL,
  `reason_for_change_correction_of_name_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `record_of_appointment`
--

CREATE TABLE `record_of_appointment` (
  `record_of_appointment_id` int(11) NOT NULL,
  `personnel_id_record_of_appointment_fk` int(11) NOT NULL,
  `job_position_id_record_of_appointment_fk` int(11) NOT NULL,
  `employment_status_id_record_of_appointment_fk` int(11) NOT NULL,
  `division_id_record_of_appointment_fk` int(11) NOT NULL,
  `station_id_record_of_appointment_fk` int(11) NOT NULL,
  `department_id_record_of_appointment_fk` int(11) NOT NULL,
  `unit_id_record_of_appointment_fk` int(11) NOT NULL,
  `school_id_record_of_appointment_fk` int(11) NOT NULL,
  `nature_of_appointment_id_record_of_appointment_fk` int(11) NOT NULL,
  `vice_type_id_record_of_appointment_fk` int(11) NOT NULL,
  `date_of_appointment` datetime NOT NULL,
  `plantilla_item_no` varchar(255) NOT NULL,
  `appointment_status_id_record_of_appointment_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `country_id_fk` int(11) NOT NULL,
  `region_name` varchar(255) NOT NULL,
  `region_code` varchar(50) DEFAULT NULL,
  `region_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `country_id_fk`, `region_name`, `region_code`, `region_no`) VALUES
(1, 1, 'Region I – Ilocos Region', NULL, NULL),
(2, 1, 'Region II – Cagayan Valley', NULL, NULL),
(3, 1, 'Region III – Central Luzon', NULL, NULL),
(4, 1, 'Region IV‑A – CALABARZON', NULL, NULL),
(5, 1, 'MIMAROPA Region', NULL, NULL),
(6, 1, 'Region V – Bicol Region', NULL, NULL),
(7, 1, 'Region VI – Western Visayas', NULL, NULL),
(8, 1, 'Region VII – Central Visayas', NULL, NULL),
(9, 1, 'Region VIII – Eastern Visayas', NULL, NULL),
(10, 1, 'Region IX – Zamboanga Peninsula', NULL, NULL),
(11, 1, 'Region X – Northern Mindanao', NULL, NULL),
(12, 1, 'Region XI – Davao Region', NULL, NULL),
(13, 1, 'Region XII – SOCCSKSARGEN', NULL, NULL),
(14, 1, 'Region XIII – Caraga', NULL, NULL),
(15, 1, 'NCR – National Capital Region', NULL, NULL),
(16, 1, 'CAR – Cordillera Administrative Region', NULL, NULL),
(17, 1, 'BARMM – Bangsamoro Autonomous Region in Muslim Mindanao', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary_grade`
--

CREATE TABLE `salary_grade` (
  `salary_grade_id` int(11) NOT NULL,
  `salary_grade_level` int(11) NOT NULL,
  `salary_grade_max_step` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_grade_step`
--

CREATE TABLE `salary_grade_step` (
  `salary_grade_step_id` int(11) NOT NULL,
  `salary_grade_id_salary_grade_step_fk` int(11) NOT NULL,
  `step_no` int(11) NOT NULL,
  `salary_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL,
  `school_id_no` varchar(50) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `division_id_school_fk` int(11) NOT NULL,
  `barangay_id_school_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_year`
--

CREATE TABLE `school_year` (
  `school_year_id` int(11) NOT NULL,
  `school_year_name` varchar(50) NOT NULL,
  `school_year_start` datetime NOT NULL,
  `school_year_end` datetime NOT NULL,
  `performance_evaluation_close_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `separation_status`
--

CREATE TABLE `separation_status` (
  `separation_status_id` int(11) NOT NULL,
  `separation_status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `separation_status`
--

INSERT INTO `separation_status` (`separation_status_id`, `separation_status_name`) VALUES
(1, 'Executory'),
(2, 'Final & Executory'),
(3, 'Overturned - Penalty Modified'),
(4, 'Exonerated/Voided');

-- --------------------------------------------------------

--
-- Table structure for table `service_gap`
--

CREATE TABLE `service_gap` (
  `service_gap_id` int(11) NOT NULL,
  `step_increment_id_service_gap_fk` int(11) NOT NULL,
  `service_gap_type_id_fk` int(11) NOT NULL,
  `service_gap_date_from` datetime NOT NULL,
  `service_gap_date_to` datetime NOT NULL,
  `service_gap_number_of_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_gap_type`
--

CREATE TABLE `service_gap_type` (
  `service_gap_type_id` int(11) NOT NULL,
  `service_gap_type_name` int(11) NOT NULL,
  `with_pay` tinyint(1) NOT NULL,
  `max_allowable_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('LCSSIKbADC7gaEtp3v1R1llYeov7FdfofIleNdCZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3dOaTdmNWxtT0pONTFVZ0M0ZDdjYjI4RFZjdGVlN1NFWFlCUGhjVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZXJzb25uZWwiO3M6NToicm91dGUiO3M6MTU6InBlcnNvbm5lbC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1779380836);

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

CREATE TABLE `sex` (
  `sex_id` int(11) NOT NULL,
  `sex_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`sex_id`, `sex_name`) VALUES
(1, 'Female'),
(2, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `station_code` varchar(50) NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `division_id_station_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `step_increment`
--

CREATE TABLE `step_increment` (
  `step_increment_id` int(11) NOT NULL,
  `record_of_appointment_id_step_increment_fk` int(11) NOT NULL,
  `step_no` int(11) NOT NULL,
  `step_increment_status_id_fk` int(11) NOT NULL,
  `original_effectivity_date` datetime NOT NULL,
  `actual_effectivity_date` datetime NOT NULL,
  `step_increment_processing_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `step_increment_history`
--

CREATE TABLE `step_increment_history` (
  `step_increment_history_id` int(11) NOT NULL,
  `step_increment_id_history_fk` int(11) NOT NULL,
  `actual_effectivity_date` datetime NOT NULL,
  `step_increment_status_id_history_fk` int(11) NOT NULL,
  `step_increment_processing_date` datetime DEFAULT NULL,
  `total_days_of_service_gap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `step_increment_status`
--

CREATE TABLE `step_increment_status` (
  `step_increment_status_id` int(11) NOT NULL,
  `step_increment_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `step_increment_status`
--

INSERT INTO `step_increment_status` (`step_increment_status_id`, `step_increment_status_name`) VALUES
(1, 'Not Yet Due'),
(2, 'Effective (Due)'),
(3, 'Issued'),
(4, 'Deferred'),
(5, 'NOSI Generated'),
(6, 'Overdue'),
(7, 'On Hold - Missing IPCRF Rating'),
(8, 'Superseded');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_personnel`
--

CREATE TABLE `type_of_personnel` (
  `type_of_personnel_id` int(11) NOT NULL,
  `type_of_personnel_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `department_id_unit_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vice_type`
--

CREATE TABLE `vice_type` (
  `vice_type_id` int(11) NOT NULL,
  `vice_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`address_type_id`);

--
-- Indexes for table `appointment_status`
--
ALTER TABLE `appointment_status`
  ADD PRIMARY KEY (`appointment_status_id`);

--
-- Indexes for table `barangay`
--
ALTER TABLE `barangay`
  ADD PRIMARY KEY (`barangay_id`),
  ADD KEY `municipality_id_barangay_fk` (`municipality_id_barangay_fk`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `change_of_civil_status`
--
ALTER TABLE `change_of_civil_status`
  ADD PRIMARY KEY (`change_of_civil_status_id`),
  ADD KEY `personnel_id_change_of_civil_status_fk` (`personnel_id_change_of_civil_status_fk`),
  ADD KEY `change_of_civil_status_from` (`change_of_civil_status_from`),
  ADD KEY `change_of_civil_status_to` (`change_of_civil_status_to`);

--
-- Indexes for table `change_of_name`
--
ALTER TABLE `change_of_name`
  ADD PRIMARY KEY (`change_of_name_id`),
  ADD KEY `part_of_name_id_change_of_name_fk` (`part_of_name_id_change_of_name_fk`),
  ADD KEY `personnel_id_change_of_name_fk` (`personnel_id_change_of_name_fk`),
  ADD KEY `reason_for_change_correction_of_name__id_fk` (`reason_for_change_correction_of_name__id_fk`);

--
-- Indexes for table `civil_status`
--
ALTER TABLE `civil_status`
  ADD PRIMARY KEY (`civil_status_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`division_id`),
  ADD KEY `region_id_division_fk` (`region_id_division_fk`);

--
-- Indexes for table `employment_status`
--
ALTER TABLE `employment_status`
  ADD PRIMARY KEY (`employment_status_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ipcrf_rating_scales`
--
ALTER TABLE `ipcrf_rating_scales`
  ADD PRIMARY KEY (`ipcrf_rating_scale_id`);

--
-- Indexes for table `ipcrf_rating_status`
--
ALTER TABLE `ipcrf_rating_status`
  ADD PRIMARY KEY (`ipcrf_rating_status_id`);

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
-- Indexes for table `mode_of_separation`
--
ALTER TABLE `mode_of_separation`
  ADD PRIMARY KEY (`mode_of_separation_id`);

--
-- Indexes for table `municipality`
--
ALTER TABLE `municipality`
  ADD PRIMARY KEY (`municipality_id`),
  ADD KEY `province_id_municipality_fk` (`province_id_municipality_fk`);

--
-- Indexes for table `nature_of_appointment`
--
ALTER TABLE `nature_of_appointment`
  ADD PRIMARY KEY (`nature_of_appointment_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `part_of_name`
--
ALTER TABLE `part_of_name`
  ADD PRIMARY KEY (`part_of_name_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`personnel_id`),
  ADD KEY `civil_status_id_personnel_fk` (`civil_status_id_personnel_fk`),
  ADD KEY `sex_id_personnel_fk` (`sex_id_personnel_fk`),
  ADD KEY `birth_place` (`birth_place`),
  ADD KEY `permanent_address_barangay_id` (`permanent_address_barangay_id`),
  ADD KEY `present_address_barangay_id` (`present_address_barangay_id`);

--
-- Indexes for table `personnel_address`
--
ALTER TABLE `personnel_address`
  ADD PRIMARY KEY (`personnel_address_id`),
  ADD KEY `address_type_id_personnel_address_fk` (`address_type_id_personnel_address_fk`),
  ADD KEY `barangay_id_personnel_address_fk` (`barangay_id_personnel_address_fk`),
  ADD KEY `personnel_id_personnel_address_fk` (`personnel_id_personnel_address_fk`);

--
-- Indexes for table `personnel_address_history`
--
ALTER TABLE `personnel_address_history`
  ADD PRIMARY KEY (`personnel_address_history_id`),
  ADD KEY `address_type_personnel_address_history_fk` (`address_type_personnel_address_history_fk`),
  ADD KEY `barangay_id_personnel_address_history_fk` (`barangay_id_personnel_address_history_fk`),
  ADD KEY `personnel_address_id_personnel_address_history_fk` (`personnel_address_id_personnel_address_history_fk`);

--
-- Indexes for table `personnel_ipcrf_rating`
--
ALTER TABLE `personnel_ipcrf_rating`
  ADD PRIMARY KEY (`personnel_ipcrf_rating_id`),
  ADD KEY `personnel_id_personnel_ipcrf_rating_fk` (`personnel_id_personnel_ipcrf_rating_fk`),
  ADD KEY `ipcrf_rating_scale_id_personnel_ipcrf_rating_fk` (`ipcrf_rating_scale_id_personnel_ipcrf_rating_fk`),
  ADD KEY `school_year_id_personnel_ipcrf_rating_fk` (`school_year_id_personnel_ipcrf_rating_fk`),
  ADD KEY `record_of_appontment_id_personnel_ipcrf_rating_fk` (`record_of_appontment_id_personnel_ipcrf_rating_fk`),
  ADD KEY `ipcrf_rating_status_id_personnel_ipcrf_rating_fk` (`ipcrf_rating_status_id_personnel_ipcrf_rating_fk`);

--
-- Indexes for table `personnel_separation_records`
--
ALTER TABLE `personnel_separation_records`
  ADD PRIMARY KEY (`personnel_separation_record_id`),
  ADD KEY `personnel_id_personnel_separation_record_fk` (`personnel_id_personnel_separation_record_fk`),
  ADD KEY `record_of_appointment_id_personnel_separation_record_fk` (`record_of_appointment_id_personnel_separation_record_fk`),
  ADD KEY `mode_of_separation_id_personnel_separation_record_fk` (`mode_of_separation_id_personnel_separation_record_fk`),
  ADD KEY `separation_status_id_personnel_separation_record_fk` (`separation_status_id_personnel_separation_record_fk`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`job_position_id`),
  ADD KEY `salary_grade_id_job_position_fk` (`salary_grade_id_job_position_fk`),
  ADD KEY `type_of_personnel_id_job_position_fk` (`type_of_personnel_id_job_position_fk`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`province_id`),
  ADD KEY `region_id_province_fk` (`region_id_province_fk`);

--
-- Indexes for table `reason_for_change_correction_of_name`
--
ALTER TABLE `reason_for_change_correction_of_name`
  ADD PRIMARY KEY (`reason_for_change_correction_of_name_id`);

--
-- Indexes for table `record_of_appointment`
--
ALTER TABLE `record_of_appointment`
  ADD PRIMARY KEY (`record_of_appointment_id`),
  ADD KEY `appointment_status_id_record_of_appointment_fk` (`appointment_status_id_record_of_appointment_fk`),
  ADD KEY `department_id_record_of_appointment_fk` (`department_id_record_of_appointment_fk`),
  ADD KEY `division_id_record_of_appointment_fk` (`division_id_record_of_appointment_fk`),
  ADD KEY `employment_status_id_record_of_appointment_fk` (`employment_status_id_record_of_appointment_fk`),
  ADD KEY `job_position_id_record_of_appointment_fk` (`job_position_id_record_of_appointment_fk`),
  ADD KEY `nature_of_appointment_id_record_of_appointment_fk` (`nature_of_appointment_id_record_of_appointment_fk`),
  ADD KEY `personnel_idrecord_of_appointment_fk` (`personnel_id_record_of_appointment_fk`),
  ADD KEY `school_id_record_of_appointment_fk` (`school_id_record_of_appointment_fk`),
  ADD KEY `station_id_record_of_appointment_fk` (`station_id_record_of_appointment_fk`),
  ADD KEY `unit_id_record_of_appointment_fk` (`unit_id_record_of_appointment_fk`),
  ADD KEY `vice_type_id_record_of_appointment_fk` (`vice_type_id_record_of_appointment_fk`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `country_id_fk` (`country_id_fk`);

--
-- Indexes for table `salary_grade`
--
ALTER TABLE `salary_grade`
  ADD PRIMARY KEY (`salary_grade_id`);

--
-- Indexes for table `salary_grade_step`
--
ALTER TABLE `salary_grade_step`
  ADD PRIMARY KEY (`salary_grade_step_id`),
  ADD KEY `salary_grade_id_salary_grade_step_fk` (`salary_grade_id_salary_grade_step_fk`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`school_id`),
  ADD KEY `barangay_id_school_fk` (`barangay_id_school_fk`),
  ADD KEY `division_id_school_fk` (`division_id_school_fk`);

--
-- Indexes for table `school_year`
--
ALTER TABLE `school_year`
  ADD PRIMARY KEY (`school_year_id`);

--
-- Indexes for table `separation_status`
--
ALTER TABLE `separation_status`
  ADD PRIMARY KEY (`separation_status_id`);

--
-- Indexes for table `service_gap`
--
ALTER TABLE `service_gap`
  ADD PRIMARY KEY (`service_gap_id`),
  ADD KEY `service_gap_type_id_fk` (`service_gap_type_id_fk`),
  ADD KEY `step_increment_id_service_gap_fk` (`step_increment_id_service_gap_fk`);

--
-- Indexes for table `service_gap_type`
--
ALTER TABLE `service_gap_type`
  ADD PRIMARY KEY (`service_gap_type_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`station_id`),
  ADD KEY `division_id_station_fk` (`division_id_station_fk`);

--
-- Indexes for table `step_increment`
--
ALTER TABLE `step_increment`
  ADD PRIMARY KEY (`step_increment_id`),
  ADD KEY `record_of_appointment_id_step_increment_fk` (`record_of_appointment_id_step_increment_fk`),
  ADD KEY `step_increment_status_id_fk` (`step_increment_status_id_fk`);

--
-- Indexes for table `step_increment_history`
--
ALTER TABLE `step_increment_history`
  ADD PRIMARY KEY (`step_increment_history_id`),
  ADD KEY `step_increment_id_history_fk` (`step_increment_id_history_fk`),
  ADD KEY `step_increment_status_id_history_fk` (`step_increment_status_id_history_fk`);

--
-- Indexes for table `step_increment_status`
--
ALTER TABLE `step_increment_status`
  ADD PRIMARY KEY (`step_increment_status_id`);

--
-- Indexes for table `type_of_personnel`
--
ALTER TABLE `type_of_personnel`
  ADD PRIMARY KEY (`type_of_personnel_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vice_type`
--
ALTER TABLE `vice_type`
  ADD PRIMARY KEY (`vice_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_type`
--
ALTER TABLE `address_type`
  MODIFY `address_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment_status`
--
ALTER TABLE `appointment_status`
  MODIFY `appointment_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `barangay`
--
ALTER TABLE `barangay`
  MODIFY `barangay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `change_of_civil_status`
--
ALTER TABLE `change_of_civil_status`
  MODIFY `change_of_civil_status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_of_name`
--
ALTER TABLE `change_of_name`
  MODIFY `change_of_name_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `civil_status`
--
ALTER TABLE `civil_status`
  MODIFY `civil_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `division_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employment_status`
--
ALTER TABLE `employment_status`
  MODIFY `employment_status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipcrf_rating_scales`
--
ALTER TABLE `ipcrf_rating_scales`
  MODIFY `ipcrf_rating_scale_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipcrf_rating_status`
--
ALTER TABLE `ipcrf_rating_status`
  MODIFY `ipcrf_rating_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mode_of_separation`
--
ALTER TABLE `mode_of_separation`
  MODIFY `mode_of_separation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipality`
--
ALTER TABLE `municipality`
  MODIFY `municipality_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2048;

--
-- AUTO_INCREMENT for table `nature_of_appointment`
--
ALTER TABLE `nature_of_appointment`
  MODIFY `nature_of_appointment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `part_of_name`
--
ALTER TABLE `part_of_name`
  MODIFY `part_of_name_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `personnel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personnel_address`
--
ALTER TABLE `personnel_address`
  MODIFY `personnel_address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_address_history`
--
ALTER TABLE `personnel_address_history`
  MODIFY `personnel_address_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_ipcrf_rating`
--
ALTER TABLE `personnel_ipcrf_rating`
  MODIFY `personnel_ipcrf_rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_separation_records`
--
ALTER TABLE `personnel_separation_records`
  MODIFY `personnel_separation_record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `job_position_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `reason_for_change_correction_of_name`
--
ALTER TABLE `reason_for_change_correction_of_name`
  MODIFY `reason_for_change_correction_of_name_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record_of_appointment`
--
ALTER TABLE `record_of_appointment`
  MODIFY `record_of_appointment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `salary_grade`
--
ALTER TABLE `salary_grade`
  MODIFY `salary_grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_grade_step`
--
ALTER TABLE `salary_grade_step`
  MODIFY `salary_grade_step_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_year`
--
ALTER TABLE `school_year`
  MODIFY `school_year_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `separation_status`
--
ALTER TABLE `separation_status`
  MODIFY `separation_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_gap`
--
ALTER TABLE `service_gap`
  MODIFY `service_gap_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_gap_type`
--
ALTER TABLE `service_gap_type`
  MODIFY `service_gap_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `sex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `step_increment`
--
ALTER TABLE `step_increment`
  MODIFY `step_increment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `step_increment_history`
--
ALTER TABLE `step_increment_history`
  MODIFY `step_increment_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `step_increment_status`
--
ALTER TABLE `step_increment_status`
  MODIFY `step_increment_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `type_of_personnel`
--
ALTER TABLE `type_of_personnel`
  MODIFY `type_of_personnel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vice_type`
--
ALTER TABLE `vice_type`
  MODIFY `vice_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangay`
--
ALTER TABLE `barangay`
  ADD CONSTRAINT `barangay_ibfk_1` FOREIGN KEY (`municipality_id_barangay_fk`) REFERENCES `municipality` (`municipality_id`);

--
-- Constraints for table `change_of_civil_status`
--
ALTER TABLE `change_of_civil_status`
  ADD CONSTRAINT `change_of_civil_status_ibfk_1` FOREIGN KEY (`personnel_id_change_of_civil_status_fk`) REFERENCES `personnel` (`personnel_id`),
  ADD CONSTRAINT `change_of_civil_status_ibfk_2` FOREIGN KEY (`change_of_civil_status_from`) REFERENCES `civil_status` (`civil_status_id`),
  ADD CONSTRAINT `change_of_civil_status_ibfk_3` FOREIGN KEY (`change_of_civil_status_to`) REFERENCES `civil_status` (`civil_status_id`);

--
-- Constraints for table `change_of_name`
--
ALTER TABLE `change_of_name`
  ADD CONSTRAINT `change_of_name_ibfk_1` FOREIGN KEY (`part_of_name_id_change_of_name_fk`) REFERENCES `part_of_name` (`part_of_name_id`),
  ADD CONSTRAINT `change_of_name_ibfk_2` FOREIGN KEY (`personnel_id_change_of_name_fk`) REFERENCES `personnel` (`personnel_id`),
  ADD CONSTRAINT `change_of_name_ibfk_3` FOREIGN KEY (`reason_for_change_correction_of_name__id_fk`) REFERENCES `reason_for_change_correction_of_name` (`reason_for_change_correction_of_name_id`);

--
-- Constraints for table `division`
--
ALTER TABLE `division`
  ADD CONSTRAINT `division_ibfk_1` FOREIGN KEY (`region_id_division_fk`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `municipality`
--
ALTER TABLE `municipality`
  ADD CONSTRAINT `municipality_ibfk_1` FOREIGN KEY (`province_id_municipality_fk`) REFERENCES `province` (`province_id`);

--
-- Constraints for table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`civil_status_id_personnel_fk`) REFERENCES `civil_status` (`civil_status_id`),
  ADD CONSTRAINT `personnel_ibfk_2` FOREIGN KEY (`sex_id_personnel_fk`) REFERENCES `sex` (`sex_id`),
  ADD CONSTRAINT `personnel_ibfk_3` FOREIGN KEY (`birth_place`) REFERENCES `municipality` (`municipality_id`),
  ADD CONSTRAINT `personnel_ibfk_4` FOREIGN KEY (`permanent_address_barangay_id`) REFERENCES `barangay` (`barangay_id`),
  ADD CONSTRAINT `personnel_ibfk_5` FOREIGN KEY (`present_address_barangay_id`) REFERENCES `barangay` (`barangay_id`);

--
-- Constraints for table `personnel_address`
--
ALTER TABLE `personnel_address`
  ADD CONSTRAINT `personnel_address_ibfk_1` FOREIGN KEY (`address_type_id_personnel_address_fk`) REFERENCES `address_type` (`address_type_id`),
  ADD CONSTRAINT `personnel_address_ibfk_2` FOREIGN KEY (`barangay_id_personnel_address_fk`) REFERENCES `barangay` (`barangay_id`),
  ADD CONSTRAINT `personnel_address_ibfk_3` FOREIGN KEY (`personnel_id_personnel_address_fk`) REFERENCES `personnel` (`personnel_id`);

--
-- Constraints for table `personnel_address_history`
--
ALTER TABLE `personnel_address_history`
  ADD CONSTRAINT `personnel_address_history_ibfk_1` FOREIGN KEY (`address_type_personnel_address_history_fk`) REFERENCES `address_type` (`address_type_id`),
  ADD CONSTRAINT `personnel_address_history_ibfk_2` FOREIGN KEY (`barangay_id_personnel_address_history_fk`) REFERENCES `barangay` (`barangay_id`),
  ADD CONSTRAINT `personnel_address_history_ibfk_3` FOREIGN KEY (`personnel_address_id_personnel_address_history_fk`) REFERENCES `personnel_address` (`personnel_address_id`);

--
-- Constraints for table `personnel_ipcrf_rating`
--
ALTER TABLE `personnel_ipcrf_rating`
  ADD CONSTRAINT `personnel_ipcrf_rating_ibfk_1` FOREIGN KEY (`personnel_id_personnel_ipcrf_rating_fk`) REFERENCES `personnel` (`personnel_id`),
  ADD CONSTRAINT `personnel_ipcrf_rating_ibfk_2` FOREIGN KEY (`ipcrf_rating_scale_id_personnel_ipcrf_rating_fk`) REFERENCES `ipcrf_rating_scales` (`ipcrf_rating_scale_id`),
  ADD CONSTRAINT `personnel_ipcrf_rating_ibfk_3` FOREIGN KEY (`school_year_id_personnel_ipcrf_rating_fk`) REFERENCES `school_year` (`school_year_id`),
  ADD CONSTRAINT `personnel_ipcrf_rating_ibfk_4` FOREIGN KEY (`record_of_appontment_id_personnel_ipcrf_rating_fk`) REFERENCES `record_of_appointment` (`record_of_appointment_id`),
  ADD CONSTRAINT `personnel_ipcrf_rating_ibfk_5` FOREIGN KEY (`ipcrf_rating_status_id_personnel_ipcrf_rating_fk`) REFERENCES `ipcrf_rating_status` (`ipcrf_rating_status_id`);

--
-- Constraints for table `personnel_separation_records`
--
ALTER TABLE `personnel_separation_records`
  ADD CONSTRAINT `personnel_separation_records_ibfk_1` FOREIGN KEY (`personnel_id_personnel_separation_record_fk`) REFERENCES `personnel` (`personnel_id`),
  ADD CONSTRAINT `personnel_separation_records_ibfk_2` FOREIGN KEY (`record_of_appointment_id_personnel_separation_record_fk`) REFERENCES `record_of_appointment` (`record_of_appointment_id`),
  ADD CONSTRAINT `personnel_separation_records_ibfk_3` FOREIGN KEY (`mode_of_separation_id_personnel_separation_record_fk`) REFERENCES `mode_of_separation` (`mode_of_separation_id`),
  ADD CONSTRAINT `personnel_separation_records_ibfk_4` FOREIGN KEY (`separation_status_id_personnel_separation_record_fk`) REFERENCES `separation_status` (`separation_status_id`);

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`salary_grade_id_job_position_fk`) REFERENCES `salary_grade` (`salary_grade_id`),
  ADD CONSTRAINT `position_ibfk_2` FOREIGN KEY (`type_of_personnel_id_job_position_fk`) REFERENCES `type_of_personnel` (`type_of_personnel_id`);

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `province_ibfk_1` FOREIGN KEY (`region_id_province_fk`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `record_of_appointment`
--
ALTER TABLE `record_of_appointment`
  ADD CONSTRAINT `record_of_appointment_ibfk_1` FOREIGN KEY (`appointment_status_id_record_of_appointment_fk`) REFERENCES `appointment_status` (`appointment_status_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_10` FOREIGN KEY (`unit_id_record_of_appointment_fk`) REFERENCES `unit` (`unit_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_11` FOREIGN KEY (`vice_type_id_record_of_appointment_fk`) REFERENCES `vice_type` (`vice_type_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_2` FOREIGN KEY (`department_id_record_of_appointment_fk`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_3` FOREIGN KEY (`division_id_record_of_appointment_fk`) REFERENCES `division` (`division_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_4` FOREIGN KEY (`employment_status_id_record_of_appointment_fk`) REFERENCES `employment_status` (`employment_status_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_5` FOREIGN KEY (`job_position_id_record_of_appointment_fk`) REFERENCES `position` (`job_position_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_6` FOREIGN KEY (`nature_of_appointment_id_record_of_appointment_fk`) REFERENCES `nature_of_appointment` (`nature_of_appointment_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_7` FOREIGN KEY (`personnel_id_record_of_appointment_fk`) REFERENCES `personnel` (`personnel_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_8` FOREIGN KEY (`school_id_record_of_appointment_fk`) REFERENCES `school` (`school_id`),
  ADD CONSTRAINT `record_of_appointment_ibfk_9` FOREIGN KEY (`station_id_record_of_appointment_fk`) REFERENCES `station` (`station_id`);

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`country_id_fk`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `salary_grade_step`
--
ALTER TABLE `salary_grade_step`
  ADD CONSTRAINT `salary_grade_step_ibfk_1` FOREIGN KEY (`salary_grade_id_salary_grade_step_fk`) REFERENCES `salary_grade` (`salary_grade_id`);

--
-- Constraints for table `school`
--
ALTER TABLE `school`
  ADD CONSTRAINT `school_ibfk_1` FOREIGN KEY (`barangay_id_school_fk`) REFERENCES `barangay` (`barangay_id`),
  ADD CONSTRAINT `school_ibfk_2` FOREIGN KEY (`division_id_school_fk`) REFERENCES `division` (`division_id`);

--
-- Constraints for table `service_gap`
--
ALTER TABLE `service_gap`
  ADD CONSTRAINT `service_gap_ibfk_1` FOREIGN KEY (`service_gap_type_id_fk`) REFERENCES `service_gap_type` (`service_gap_type_id`),
  ADD CONSTRAINT `service_gap_ibfk_2` FOREIGN KEY (`step_increment_id_service_gap_fk`) REFERENCES `step_increment` (`step_increment_id`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_1` FOREIGN KEY (`division_id_station_fk`) REFERENCES `division` (`division_id`);

--
-- Constraints for table `step_increment`
--
ALTER TABLE `step_increment`
  ADD CONSTRAINT `step_increment_ibfk_1` FOREIGN KEY (`record_of_appointment_id_step_increment_fk`) REFERENCES `record_of_appointment` (`record_of_appointment_id`),
  ADD CONSTRAINT `step_increment_ibfk_2` FOREIGN KEY (`step_increment_status_id_fk`) REFERENCES `step_increment_status` (`step_increment_status_id`);

--
-- Constraints for table `step_increment_history`
--
ALTER TABLE `step_increment_history`
  ADD CONSTRAINT `step_increment_history_ibfk_1` FOREIGN KEY (`step_increment_id_history_fk`) REFERENCES `step_increment` (`step_increment_id`),
  ADD CONSTRAINT `step_increment_history_ibfk_2` FOREIGN KEY (`step_increment_status_id_history_fk`) REFERENCES `step_increment_status` (`step_increment_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
