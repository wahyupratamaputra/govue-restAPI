-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20 Mei 2018 pada 07.09
-- Versi Server: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `golang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'wahyu', 'wahyumacho666@yahoo.com', 'wahyu', NULL, NULL, '2018-05-18 07:17:30'),
(2, 'user', 'user@user.user', 'user', NULL, NULL, '2018-05-18 07:17:30'),
(3, 'wahyuu', 'wahyuu@wa.com', 'password', '2018-05-18 01:13:00', '2018-05-18 01:13:00', '2018-05-18 07:17:30'),
(5, '', '', '', '2018-05-18 01:18:13', '2018-05-18 01:18:13', '2018-05-18 07:17:30'),
(16, 'nama', 'email@aas', 'password', '2018-05-18 02:09:54', '2018-05-18 02:09:54', '2018-05-18 07:17:29'),
(17, 'sadas', 'dasd@asas', 'asd', '2018-05-18 02:10:52', '2018-05-18 02:10:52', '2018-05-18 07:16:29'),
(18, 'qwqw', 'asd@sa', 'asd', '2018-05-18 02:12:40', '2018-05-18 02:12:40', '2018-05-18 07:16:27'),
(19, 'Wahyu', 'wahyu@wahyu.com', 'wahyu', '2018-05-18 07:17:46', '2018-05-18 07:17:46', NULL),
(20, 'Wahyu2', 'wahyu2@wahyu.com', 'wahyu2', '2018-05-18 07:18:00', '2018-05-18 07:18:00', NULL),
(21, 'aaa', 'aaa@aa.a', 'aaa', '2018-05-18 07:19:22', '2018-05-18 07:19:22', '2018-05-18 08:34:02'),
(23, 'Nama Baru', 'wahyu2@wahyu.coms', 'wahyu22', '2018-05-18 08:46:29', '2018-05-18 15:28:53', NULL),
(24, 'Wahyu22z', 'wahyu2@wahyu.comsz', 'wahyu22z', '2018-05-18 08:47:14', '2018-05-18 08:47:14', '2018-05-18 15:26:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uix_users_email` (`email`),
  ADD KEY `idx_users_deleted_at` (`deleted_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
