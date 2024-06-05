-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Agu 2022 pada 18.00
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_2021`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkey`
--

CREATE TABLE `tblkey` (
  `id` int(11) NOT NULL,
  `nama` varchar(300) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblkey`
--

INSERT INTO `tblkey` (`id`, `nama`, `flag`) VALUES
(2, 'AAAA0-NerMk:APA91bEAfNEYDQKNYnGKnRcLyO6LAHVgmF3XYkxtEVhWRHZJg1ptROO4IC3lHS7lyIXLi2oG2X_uLkoB8trSI4UkMRzwl7Zj5fEExjhb_Dv6DKtuCIxWrxxpXaA6_KkCE4dzlN9r5osb', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tblkey`
--
ALTER TABLE `tblkey`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tblkey`
--
ALTER TABLE `tblkey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
