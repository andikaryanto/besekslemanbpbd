-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Apr 2022 pada 10.51
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

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spa_getlogin` (IN `pUser` VARCHAR(200), IN `pPass` VARCHAR(200))  BEGIN
	declare vUser int;
	declare vUserPass int;
	DECLARE vPesan text;
	
	
	-- cek user terdaftar
	set vUser = ifnull((select count(1) from `tbluser` where telp = pUser),0);
	if vUser > 0 then
		SET vUserPass = IFNULL((SELECT COUNT(1) FROM `tbluser` WHERE telp = pUser and `password` = pPass),0);
		if vUserPass > 0 then
			SET vPesan = "ok";
			select vPesan as pesan, idtbluser,fb_token FROM `tbluser` WHERE telp = pUser AND `password` = pPass limit 1; 
		else
			SET vPesan = "Password tidak benar";
			SELECT vPesan AS pesan;
		end if;
	else
		set vPesan = "No HP belum terdaftar";
		SELECT vPesan AS pesan;
	end if;
	
	
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertlaporan` (IN `Vnir` VARCHAR(200), IN `VNama` VARCHAR(200), IN `VNotelp` VARCHAR(200), IN `vKelurahan` VARCHAR(200), IN `vDusun` VARCHAR(200), IN `vBencana` VARCHAR(200), IN `vRT` VARCHAR(200), IN `vRW` VARCHAR(200), IN `vLat` VARCHAR(200), IN `VLon` VARCHAR(200), IN `vImei` VARCHAR(200), OUT `lastid` INT)  BEGIN
		INSERT INTO tbllaporan (nir,nama,notelp,kelurahan,dusun,bencana,rt,rw,latitude,longitude,imei,create_time,tgl_kejadian) VALUES
		 (Vnir,VNama,VNotelp,vKelurahan,vDusun,vBencana,vRT,vRW,vLat,VLon,vImei,now(),now());
		SET lastid = LAST_INSERT_ID();
	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_access`
--

CREATE TABLE `admin_access` (
  `id` int(12) NOT NULL,
  `idtblgroup` int(12) DEFAULT NULL,
  `idtblmenu` int(12) DEFAULT NULL,
  `view` tinyint(1) DEFAULT 0,
  `add` tinyint(1) DEFAULT 0,
  `update` tinyint(1) DEFAULT 0,
  `delete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin_access`
--

INSERT INTO `admin_access` (`id`, `idtblgroup`, `idtblmenu`, `view`, `add`, `update`, `delete`) VALUES
(215, 4, 1, 1, 1, 1, 0),
(216, 4, 20, 1, 1, 1, 0),
(217, 4, 22, 1, 1, 1, 0),
(218, 4, 27, 1, 1, 1, 0),
(219, 4, 28, 1, 1, 1, 0),
(1197, 2, 1, 1, 1, 1, 0),
(1198, 2, 2, 1, 1, 1, 0),
(1199, 2, 3, 1, 0, 0, 0),
(1200, 2, 4, 1, 1, 1, 1),
(1201, 2, 5, 1, 1, 1, 1),
(1202, 2, 6, 1, 1, 1, 0),
(1203, 2, 7, 1, 0, 0, 0),
(1204, 2, 8, 1, 1, 1, 1),
(1205, 2, 9, 1, 1, 1, 0),
(1206, 2, 10, 1, 1, 1, 0),
(1207, 2, 11, 1, 1, 1, 0),
(1208, 2, 12, 1, 1, 1, 0),
(1209, 2, 13, 1, 1, 1, 0),
(1210, 2, 14, 1, 1, 1, 0),
(1211, 2, 17, 1, 1, 1, 0),
(1212, 2, 18, 1, 1, 1, 0),
(1213, 2, 19, 1, 1, 1, 0),
(1214, 2, 20, 1, 1, 1, 0),
(1215, 2, 22, 1, 1, 1, 1),
(1216, 2, 23, 1, 1, 1, 1),
(1217, 2, 24, 1, 1, 1, 1),
(1218, 2, 25, 1, 1, 1, 1),
(1219, 2, 26, 1, 1, 1, 1),
(1220, 2, 27, 1, 1, 1, 1),
(1221, 2, 28, 1, 1, 0, 0),
(1222, 2, 29, 1, 1, 1, 0),
(1223, 2, 32, 1, 1, 1, 1),
(1224, 2, 33, 1, 1, 1, 1),
(1225, 2, 34, 1, 1, 1, 1),
(1226, 2, 35, 1, 0, 0, 0),
(1227, 2, 36, 1, 0, 0, 0),
(1228, 2, 37, 1, 1, 1, 1),
(1229, 2, 38, 1, 1, 1, 1),
(1230, 2, 39, 1, 1, 1, 1),
(1231, 2, 40, 1, 1, 1, 1),
(1238, 5, 1, 1, 1, 1, 0),
(1239, 5, 19, 1, 0, 0, 0),
(1240, 5, 20, 1, 0, 0, 0),
(1241, 5, 25, 1, 0, 0, 0),
(1274, 6, 2, 1, 1, 1, 1),
(1275, 6, 3, 1, 1, 1, 1),
(1276, 6, 4, 1, 1, 1, 1),
(1277, 6, 6, 1, 1, 1, 1),
(1278, 6, 12, 1, 1, 1, 1),
(1279, 6, 17, 1, 1, 1, 1),
(1280, 6, 18, 1, 1, 1, 1),
(1281, 6, 19, 1, 1, 1, 1),
(1282, 6, 20, 1, 1, 1, 1),
(1283, 6, 25, 1, 1, 1, 1),
(1284, 6, 36, 1, 1, 1, 1),
(1285, 6, 40, 1, 1, 1, 1),
(1465, 1, 1, 1, 1, 1, 1),
(1466, 1, 2, 1, 1, 1, 1),
(1467, 1, 3, 1, 1, 1, 1),
(1468, 1, 4, 1, 1, 1, 1),
(1469, 1, 5, 1, 1, 1, 1),
(1470, 1, 6, 1, 1, 1, 1),
(1471, 1, 7, 1, 1, 1, 1),
(1472, 1, 8, 1, 1, 1, 1),
(1473, 1, 9, 1, 1, 1, 1),
(1474, 1, 10, 1, 1, 1, 1),
(1475, 1, 11, 1, 1, 1, 1),
(1476, 1, 12, 1, 1, 1, 1),
(1477, 1, 13, 1, 1, 1, 1),
(1478, 1, 14, 1, 1, 1, 1),
(1479, 1, 15, 1, 1, 1, 1),
(1480, 1, 16, 1, 1, 1, 1),
(1481, 1, 17, 1, 1, 1, 1),
(1482, 1, 18, 1, 1, 1, 1),
(1483, 1, 19, 1, 1, 1, 1),
(1484, 1, 20, 1, 1, 1, 1),
(1485, 1, 21, 1, 1, 1, 1),
(1486, 1, 22, 1, 1, 1, 1),
(1487, 1, 23, 1, 1, 1, 1),
(1488, 1, 24, 1, 1, 1, 1),
(1489, 1, 25, 1, 1, 1, 1),
(1490, 1, 26, 1, 1, 1, 1),
(1491, 1, 27, 1, 1, 1, 1),
(1492, 1, 28, 1, 1, 1, 1),
(1493, 1, 29, 1, 1, 1, 1),
(1494, 1, 30, 1, 1, 1, 1),
(1495, 1, 31, 1, 1, 1, 1),
(1496, 1, 32, 1, 1, 1, 1),
(1497, 1, 33, 1, 1, 1, 1),
(1498, 1, 34, 1, 1, 1, 1),
(1499, 1, 35, 1, 1, 1, 1),
(1500, 1, 36, 1, 1, 1, 1),
(1501, 1, 37, 1, 1, 1, 1),
(1502, 1, 38, 1, 1, 1, 1),
(1503, 1, 39, 1, 1, 1, 1),
(1504, 1, 40, 1, 1, 1, 1),
(1505, 1, 41, 1, 1, 1, 1),
(1506, 1, 42, 1, 1, 1, 1),
(1507, 1, 43, 1, 1, 1, 1),
(1508, 1, 44, 1, 1, 1, 1),
(1509, 1, 45, 1, 1, 1, 1),
(1510, 1, 46, 1, 1, 1, 1),
(1511, 1, 47, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `city`
--

CREATE TABLE `city` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `province_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `city`
--

INSERT INTO `city` (`id`, `name`, `province_id`) VALUES
(1, ' Aceh Barat', 1),
(2, ' Aceh Barat Daya', 1),
(3, ' Aceh Besar', 1),
(4, ' Aceh Jaya', 1),
(5, ' Aceh Selatan', 1),
(6, ' Aceh Singkil', 1),
(7, ' Aceh Tamiang', 1),
(8, ' Aceh Tengah', 1),
(9, ' Aceh Tenggara', 1),
(10, ' Aceh Timur', 1),
(11, ' Aceh Utara', 1),
(12, ' Bener Meriah', 1),
(13, ' Bireuen', 1),
(14, ' Gayo Lues', 1),
(15, ' Nagan Raya', 1),
(16, ' Pidie', 1),
(17, ' Pidie Jaya', 1),
(18, ' Simeulue', 1),
(19, 'Banda Aceh', 1),
(20, 'Langsa', 1),
(21, 'Lhokseumawe', 1),
(22, 'Sabang', 1),
(23, 'Subulussalam', 1),
(24, ' Asahan', 2),
(25, ' Batu Bara', 2),
(26, ' Dairi', 2),
(27, ' Deli Serdang', 2),
(28, ' Humbang Hasundutan', 2),
(29, ' Karo', 2),
(30, ' Labuhanbatu', 2),
(31, ' Labuhanbatu Selatan', 2),
(32, ' Labuhanbatu Utara', 2),
(33, ' Langkat', 2),
(34, ' Mandailing Natal', 2),
(35, ' Nias', 2),
(36, ' Nias Barat', 2),
(37, ' Nias Selatan', 2),
(38, ' Nias Utara', 2),
(39, ' Padang Lawas', 2),
(40, ' Padang Lawas Utara', 2),
(41, ' Pakpak Bharat', 2),
(42, ' Samosir', 2),
(43, ' Serdang Bedagai', 2),
(44, ' Simalungun', 2),
(45, ' Tapanuli Selatan', 2),
(46, ' Tapanuli Tengah', 2),
(47, ' Tapanuli Utara', 2),
(48, ' Toba Samosir', 2),
(49, 'Binjai', 2),
(50, 'Gunung Sitoli', 2),
(51, 'Medan', 2),
(52, 'Padang Sidempuan', 2),
(53, 'Pematangsiantar', 2),
(54, 'Sibolga', 2),
(55, 'Tanjung Balai', 2),
(56, 'Tebing Tinggi', 2),
(57, ' Bengkulu Selatan', 3),
(58, ' Bengkulu Tengah', 3),
(59, ' Bengkulu Utara', 3),
(60, ' Benteng', 3),
(61, ' Kaur', 3),
(62, ' Kepahiang', 3),
(63, ' Lebong', 3),
(64, ' Mukomuko', 3),
(65, ' Rejang Lebong', 3),
(66, ' Seluma', 3),
(67, 'Bengkulu', 3),
(68, ' Batang Hari', 4),
(69, ' Bungo', 4),
(70, ' Kerinci', 4),
(71, ' Merangin', 4),
(72, ' Muaro Jambi', 4),
(73, ' Sarolangun', 4),
(74, ' Tjg Jabung Barat', 4),
(75, ' Tjg Jabung Timur', 4),
(76, ' Tebo', 4),
(77, 'Jambi', 4),
(78, 'Sungai Penuh', 4),
(79, ' Bengkalis', 5),
(80, ' Indragiri Hilir', 5),
(81, ' Indragiri Hulu', 5),
(82, ' Kampar', 5),
(83, ' Kuantan Singingi', 5),
(84, ' Pelalawan', 5),
(85, ' Rokan Hilir', 5),
(86, ' Rokan Hulu', 5),
(87, ' Siak', 5),
(88, 'Pekanbaru', 5),
(89, 'Dumai', 5),
(90, ' Kepulauan Meranti', 5),
(91, ' Agam', 6),
(92, ' Dharmasraya', 6),
(93, ' Kepulauan Mentawai', 6),
(94, ' Lima Puluh Kota', 6),
(95, ' Padang Pariaman', 6),
(96, ' Pasaman', 6),
(97, ' Pasaman Barat', 6),
(98, ' Pesisir Selatan', 6),
(99, ' Sijunjung', 6),
(100, ' Solok', 6),
(101, ' Solok Selatan', 6),
(102, ' Tanah Datar', 6),
(103, 'Bukittinggi', 6),
(104, 'Padang', 6),
(105, 'Padangpanjang', 6),
(106, 'Pariaman', 6),
(107, 'Payakumbuh', 6),
(108, 'Sawahlunto', 6),
(109, 'Solok', 6),
(110, ' Banyuasin', 7),
(111, ' Empat Lawang', 7),
(112, ' Lahat', 7),
(113, ' Muara Enim', 7),
(114, ' Musi Banyuasin', 7),
(115, ' Musi Rawas', 7),
(116, ' Ogan Ilir', 7),
(117, ' Ogan Komering Ilir', 7),
(118, ' Ogan Komering Ulu', 7),
(119, ' Ogan Kmrg Ulu Sel', 7),
(120, ' Ogan Kom. Ulu Timur', 7),
(121, 'Lubuklinggau', 7),
(122, 'Pagar Alam', 7),
(123, 'Palembang', 7),
(124, 'Prabumulih', 7),
(125, ' Lampung Barat', 8),
(126, ' Lampung Selatan', 8),
(127, ' Lampung Tengah', 8),
(128, ' Lampung Timur', 8),
(129, ' Lampung Utara', 8),
(130, ' Mesuji', 8),
(131, ' Pesawaran', 8),
(132, ' Pringsewu', 8),
(133, ' Tanggamus', 8),
(134, ' Tulang Bawang', 8),
(135, ' Tulang Bawang Barat', 8),
(136, ' Way Kanan', 8),
(137, 'Bandar Lampung', 8),
(138, 'Metro', 8),
(139, ' Bangka', 9),
(140, ' Bangka Barat', 9),
(141, ' Bangka Selatan', 9),
(142, ' Bangka Tengah', 9),
(143, ' Belitung', 9),
(144, ' Belitung Timur', 9),
(145, 'Pangkal Pinang', 9),
(146, ' Bintan', 10),
(147, ' Karimun', 10),
(148, ' Kepulauan Anambas', 10),
(149, ' Lingga', 10),
(150, ' Natuna', 10),
(151, 'Batam', 10),
(152, 'Tanjung Pinang', 10),
(153, ' Lebak', 11),
(154, ' Pandeglang', 11),
(155, ' Serang', 11),
(156, ' Tangerang', 11),
(157, 'Cilegon', 11),
(158, 'Serang', 11),
(159, 'Tangerang', 11),
(160, 'Tangerang Selatan', 11),
(161, ' Bandung', 12),
(162, ' Bandung Barat', 12),
(163, ' Bekasi', 12),
(164, ' Bogor', 12),
(165, ' Ciamis', 12),
(166, ' Cianjur', 12),
(167, ' Cirebon', 12),
(168, ' Garut', 12),
(169, ' Indramayu', 12),
(170, ' Karawang', 12),
(171, ' Kuningan', 12),
(172, ' Majalengka', 12),
(173, ' Purwakarta', 12),
(174, ' Subang', 12),
(175, ' Sukabumi', 12),
(176, ' Sumedang', 12),
(177, ' Tasikmalaya', 12),
(178, 'Bandung', 12),
(179, 'Banjar', 12),
(180, 'Bekasi', 12),
(181, 'Bogor', 12),
(182, 'Cimahi', 12),
(183, 'Cirebon', 12),
(184, 'Depok', 12),
(185, 'Sukabumi', 12),
(186, 'Tasikmalaya', 12),
(187, '  Kepulauan Seribu', 13),
(188, ' Jakarta Barat', 13),
(189, ' Jakarta Pusat', 13),
(190, ' Jakarta Selatan', 13),
(191, ' Jakarta Timur', 13),
(192, ' Jakarta Utara', 13),
(193, ' Banjarnegara', 14),
(194, ' Banyumas', 14),
(195, ' Batang', 14),
(196, ' Blora', 14),
(197, ' Boyolali', 14),
(198, ' Brebes', 14),
(199, ' Cilacap', 14),
(200, ' Demak', 14),
(201, ' Grobogan', 14),
(202, ' Jepara', 14),
(203, ' Karanganyar', 14),
(204, ' Kebumen', 14),
(205, ' Kendal', 14),
(206, ' Klaten', 14),
(207, ' Kudus', 14),
(208, ' Magelang', 14),
(209, ' Pati', 14),
(210, ' Pekalongan', 14),
(211, ' Pemalang', 14),
(212, ' Purbalingga', 14),
(213, ' Purworejo', 14),
(214, ' Rembang', 14),
(215, ' Semarang', 14),
(216, ' Sragen', 14),
(217, ' Sukoharjo', 14),
(218, ' Tegal', 14),
(219, ' Temanggung', 14),
(220, ' Wonogiri', 14),
(221, ' Wonosobo', 14),
(222, 'Magelang', 14),
(223, 'Pekalongan', 14),
(224, 'Salatiga', 14),
(225, 'Semarang', 14),
(226, 'Surakarta', 14),
(227, 'Tegal', 14),
(228, ' Bangkalan', 15),
(229, ' Banyuwangi', 15),
(230, ' Blitar', 15),
(231, ' Bojonegoro', 15),
(232, ' Bondowoso', 15),
(233, ' Gresik', 15),
(234, ' Jember', 15),
(235, ' Jombang', 15),
(236, ' Kediri', 15),
(237, ' Lamongan', 15),
(238, ' Lumajang', 15),
(239, ' Madiun', 15),
(240, ' Magetan', 15),
(241, ' Malang', 15),
(242, ' Mojokerto', 15),
(243, ' Nganjuk', 15),
(244, ' Ngawi', 15),
(245, ' Pacitan', 15),
(246, ' Pamekasan', 15),
(247, ' Pasuruan', 15),
(248, ' Ponorogo', 15),
(249, ' Probolinggo', 15),
(250, ' Sampang', 15),
(251, ' Sidoarjo', 15),
(252, ' Situbondo', 15),
(253, ' Sumenep', 15),
(254, ' Trenggalek', 15),
(255, ' Tuban', 15),
(256, ' Tulungagung', 15),
(257, 'Batu', 15),
(258, 'Blitar', 15),
(259, 'Kediri', 15),
(260, 'Madiun', 15),
(261, 'Malang', 15),
(262, 'Mojokerto', 15),
(263, 'Pasuruan', 15),
(264, 'Probolinggo', 15),
(265, 'Surabaya', 15),
(266, ' Bantul', 16),
(267, ' Gunung Kidul', 16),
(268, ' Kulon Progo', 16),
(269, ' Sleman', 16),
(270, 'Yogyakarta', 16),
(271, ' Badung', 17),
(272, ' Bangli', 17),
(273, ' Buleleng', 17),
(274, ' Gianyar', 17),
(275, ' Jembrana', 17),
(276, ' Karangasem', 17),
(277, ' Klungkung', 17),
(278, ' Tabanan', 17),
(279, 'Denpasar', 17),
(280, ' Bima', 18),
(281, ' Dompu', 18),
(282, ' Lombok Barat', 18),
(283, ' Lombok Tengah', 18),
(284, ' Lombok Timur', 18),
(285, ' Lombok Utara', 18),
(286, ' Sumbawa', 18),
(287, ' Sumbawa Barat', 18),
(288, 'Bima', 18),
(289, 'Mataram', 18),
(290, ' Kupang', 19),
(291, ' Timor Tengah Sel', 19),
(292, ' Timor Tengah Utara', 19),
(293, ' Belu', 19),
(294, ' Alor', 19),
(295, ' Flores Timur', 19),
(296, ' Sikka', 19),
(297, ' Ende', 19),
(298, ' Ngada', 19),
(299, ' Manggarai', 19),
(300, ' Sumba Timur', 19),
(301, ' Sumba Barat', 19),
(302, ' Lembata', 19),
(303, ' Rote Ndao', 19),
(304, ' Manggarai Barat', 19),
(305, ' Nagekeo', 19),
(306, ' Sumba Tengah', 19),
(307, ' Sumba Barat Daya', 19),
(308, ' Manggarai Timur', 19),
(309, ' Sabu Raijua', 19),
(310, 'Kupang', 19),
(311, ' Bengkayang', 20),
(312, ' Kapuas Hulu', 20),
(313, ' Kayong Utara', 20),
(314, ' Ketapang', 20),
(315, ' Kubu Raya', 20),
(316, ' Landak', 20),
(317, ' Melawi', 20),
(318, ' Pontianak', 20),
(319, ' Sambas', 20),
(320, ' Sanggau', 20),
(321, ' Sekadau', 20),
(322, ' Sintang', 20),
(323, 'Pontianak', 20),
(324, 'Singkawang', 20),
(325, ' Balangan', 21),
(326, ' Banjar', 21),
(327, ' Barito Kuala', 21),
(328, ' Hulu Sungai Selatan', 21),
(329, ' Hulu Sungai Tengah', 21),
(330, ' Hulu Sungai Utara', 21),
(331, ' Kotabaru', 21),
(332, ' Tabalong', 21),
(333, ' Tanah Bumbu', 21),
(334, ' Tanah Laut', 21),
(335, ' Tapin', 21),
(336, 'Banjarbaru', 21),
(337, 'Banjarmasin', 21),
(338, ' Barito Selatan', 22),
(339, ' Barito Timur', 22),
(340, ' Barito Utara', 22),
(341, ' Gunung Mas', 22),
(342, ' Kapuas', 22),
(343, ' Katingan', 22),
(344, ' Kotawaringin Barat', 22),
(345, ' Kotawaringin Timur', 22),
(346, ' Lamandau', 22),
(347, ' Murung Raya', 22),
(348, ' Pulang Pisau', 22),
(349, ' Sukamara', 22),
(350, ' Seruyan', 22),
(351, 'Palangka Raya', 22),
(352, ' Berau', 23),
(353, ' Bulungan', 23),
(354, ' Kutai Barat', 23),
(355, ' Kutai Kartanegara', 23),
(356, ' Kutai Timur', 23),
(357, ' Malinau', 23),
(358, ' Nunukan', 23),
(359, ' Paser', 23),
(360, ' Penajam Paser Utara', 23),
(361, ' Tana Tidung', 23),
(362, 'Balikpapan', 23),
(363, 'Bontang', 23),
(364, 'Samarinda', 23),
(365, 'Tarakan', 23),
(366, ' Boalemo', 24),
(367, ' Bone Bolango', 24),
(368, ' Gorontalo', 24),
(369, ' Gorontalo Utara', 24),
(370, ' Pohuwato', 24),
(371, 'Gorontalo', 24),
(372, ' Bantaeng', 25),
(373, ' Barru', 25),
(374, ' Bone', 25),
(375, ' Bulukumba', 25),
(376, ' Enrekang', 25),
(377, ' Gowa', 25),
(378, ' Jeneponto', 25),
(379, ' Kepulauan Selayar', 25),
(380, ' Luwu', 25),
(381, ' Luwu Timur', 25),
(382, ' Luwu Utara', 25),
(383, ' Maros', 25),
(384, ' Pangkajene & Kep', 25),
(385, ' Pinrang', 25),
(386, ' Sidenreng Rappang', 25),
(387, ' Sinjai', 25),
(388, ' Soppeng', 25),
(389, ' Takalar', 25),
(390, ' Tana Toraja', 25),
(391, ' Toraja Utara', 25),
(392, ' Wajo', 25),
(393, 'Makassar', 25),
(394, 'Palopo', 25),
(395, 'Parepare', 25),
(396, ' Bombana', 26),
(397, ' Buton', 26),
(398, ' Buton Utara', 26),
(399, ' Kolaka', 26),
(400, ' Kolaka Utara', 26),
(401, ' Konawe', 26),
(402, ' Konawe Selatan', 26),
(403, ' Konawe Utara', 26),
(404, ' Muna', 26),
(405, ' Wakatobi', 26),
(406, 'Bau-Bau', 26),
(407, 'Kendari', 26),
(408, ' Banggai', 27),
(409, ' Banggai Kepulauan', 27),
(410, ' Buol', 27),
(411, ' Donggala', 27),
(412, ' Morowali', 27),
(413, ' Parigi Moutong', 27),
(414, ' Poso', 27),
(415, ' Tojo Una-Una', 27),
(416, ' Toli-Toli', 27),
(417, ' Sigi', 27),
(418, 'Palu', 27),
(419, ' Bolaang Mongondow', 28),
(420, ' Bolaang Mngndw Sel', 28),
(421, ' Bolaang Mong. Timur', 28),
(422, ' Bolaang Mong Utara', 28),
(423, ' Kepulauan Sangihe', 28),
(424, 'Siau Tagul. Biaro', 28),
(425, ' Kepulauan Talaud', 28),
(426, ' Minahasa', 28),
(427, ' Minahasa Selatan', 28),
(428, ' Minahasa Tenggara', 28),
(429, ' Minahasa Utara', 28),
(430, 'Bitung', 28),
(431, 'Kotamobagu', 28),
(432, 'Manado', 28),
(433, 'Tomohon', 28),
(434, ' Majene', 29),
(435, ' Mamasa', 29),
(436, ' Mamuju', 29),
(437, ' Mamuju Utara', 29),
(438, ' Polewali Mandar', 29),
(439, ' Buru', 30),
(440, ' Buru Selatan', 30),
(441, ' Kepulauan Aru', 30),
(442, ' Maluku Barat Daya', 30),
(443, ' Maluku Tengah', 30),
(444, ' Maluku Tenggara', 30),
(445, ' Maluku Tenggr Brt', 30),
(446, ' Seram Bagian Barat', 30),
(447, ' Seram Bagian Timur', 30),
(448, 'Ambon', 30),
(449, 'Tual', 30),
(450, ' Halmahera Barat', 31),
(451, ' Halmahera Tengah', 31),
(452, ' Halmahera Utara', 31),
(453, ' Halmahera Selatan', 31),
(454, ' Kepulauan Sula', 31),
(455, ' Halmahera Timur', 31),
(456, ' Pulau Morotai', 31),
(457, 'Ternate', 31),
(458, 'Tidore Kepulauan', 31),
(459, ' Asmat', 32),
(460, ' Biak Numfor', 32),
(461, ' Boven Digoel', 32),
(462, ' Deiyai', 32),
(463, ' Dogiyai', 32),
(464, ' Intan Jaya', 32),
(465, ' Jayapura', 32),
(466, ' Jayawijaya', 32),
(467, ' Keerom', 32),
(468, ' Kepulauan Yapen', 32),
(469, ' Lanny Jaya', 32),
(470, ' Mamberamo Raya', 32),
(471, ' Mamberamo Tengah', 32),
(472, ' Mappi', 32),
(473, ' Merauke', 32),
(474, ' Mimika', 32),
(475, ' Nabire', 32),
(476, ' Nduga', 32),
(477, ' Paniai', 32),
(478, ' Pegunungan Bintang', 32),
(479, ' Puncak', 32),
(480, ' Puncak Jaya', 32),
(481, ' Sarmi', 32),
(482, ' Supiori', 32),
(483, ' Tolikara', 32),
(484, ' Waropen', 32),
(485, ' Yahukimo', 32),
(486, ' Yalimo', 32),
(487, 'Jayapura', 32),
(488, ' Fakfak', 33),
(489, ' Kaimana', 33),
(490, ' Manokwari', 33),
(491, ' Maybrat', 33),
(492, ' Raja Ampat', 33),
(493, ' Sorong', 33),
(494, ' Sorong Selatan', 33),
(495, ' Tambrauw', 33),
(496, ' Teluk Bintuni', 33),
(497, ' Teluk Wondama', 33),
(498, 'Sorong', 33);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_kota`
--

CREATE TABLE `ms_kota` (
  `kode_prov` varchar(5) NOT NULL COMMENT 'Kode Provinsi',
  `kode_kota` varchar(5) NOT NULL COMMENT 'Kode Kota',
  `nama_kota` varchar(50) NOT NULL COMMENT 'Nama Kota',
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `sinkron` int(1) DEFAULT 0,
  `flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Master Kota';

--
-- Dumping data untuk tabel `ms_kota`
--

INSERT INTO `ms_kota` (`kode_prov`, `kode_kota`, `nama_kota`, `create_user`, `create_time`, `sinkron`, `flag`) VALUES
('1', '1', 'Aceh Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '10', 'Aceh Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '100', 'Solok', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '101', 'Solok Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '102', 'Tanah Datar', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '103', 'Bukittinggi', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '104', 'Padang', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '105', 'Padangpanjang', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '106', 'Pariaman', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '107', 'Payakumbuh', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '108', 'Sawahlunto', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '109', 'Solok', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '11', 'Aceh Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '110', 'Banyuasin', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '111', 'Empat Lawang', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '112', 'Lahat', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '113', 'Muara Enim', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '114', 'Musi Banyuasin', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '115', 'Musi Rawas', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '116', 'Ogan Ilir', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '117', 'Ogan Komering Ilir', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '118', 'Ogan Komering Ulu', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '119', 'Ogan Kmrg Ulu Sel', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '12', 'Bener Meriah', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '120', 'Ogan Kom. Ulu Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '121', 'Lubuklinggau', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '122', 'Pagar Alam', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '123', 'Palembang', 'admin', '2016-04-30 10:08:37', 0, 0),
('7', '124', 'Prabumulih', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '125', 'Lampung Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '126', 'Lampung Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '127', 'Lampung Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '128', 'Lampung Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '129', 'Lampung Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '13', 'Bireuen', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '130', 'Mesuji', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '131', 'Pesawaran', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '132', 'Pringsewu', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '133', 'Tanggamus', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '134', 'Tulang Bawang', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '135', 'Tulang Bawang Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '136', 'Way Kanan', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '137', 'Bandar Lampung', 'admin', '2016-04-30 10:08:37', 0, 0),
('8', '138', 'Metro', 'admin', '2016-04-30 10:08:37', 0, 0),
('9', '139', 'Bangka', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '14', 'Gayo Lues', 'admin', '2016-04-30 10:08:37', 0, 0),
('9', '140', 'Bangka Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('9', '141', 'Bangka Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('9', '142', 'Bangka Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('9', '143', 'Belitung', 'admin', '2016-04-30 10:08:37', 0, 0),
('9', '144', 'Belitung Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('9', '145', 'Pangkal Pinang', 'admin', '2016-04-30 10:08:37', 0, 0),
('10', '146', 'Bintan', 'admin', '2016-04-30 10:08:37', 0, 0),
('10', '147', 'Karimun', 'admin', '2016-04-30 10:08:37', 0, 0),
('10', '148', 'Kepulauan Anambas', 'admin', '2016-04-30 10:08:37', 0, 0),
('10', '149', 'Lingga', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '15', 'Nagan Raya', 'admin', '2016-04-30 10:08:37', 0, 0),
('10', '150', 'Natuna', 'admin', '2016-04-30 10:08:37', 0, 0),
('10', '151', 'Batam', 'admin', '2016-04-30 10:08:37', 0, 0),
('10', '152', 'Tanjung Pinang', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '153', 'Lebak', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '154', 'Pandeglang', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '155', 'Serang', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '156', 'Tangerang', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '157', 'Cilegon', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '158', 'Serang', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '159', 'Tangerang', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '16', 'Pidie', 'admin', '2016-04-30 10:08:37', 0, 0),
('11', '160', 'Tangerang Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '161', 'Bandung', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '162', 'Bandung Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '163', 'Bekasi', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '164', 'Bogor', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '165', 'Ciamis', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '166', 'Cianjur', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '167', 'Cirebon', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '168', 'Garut', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '169', 'Indramayu', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '17', 'Pidie Jaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '170', 'Karawang', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '171', 'Kuningan', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '172', 'Majalengka', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '173', 'Purwakarta', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '174', 'Subang', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '175', 'Sukabumi', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '176', 'Sumedang', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '177', 'Tasikmalaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '178', 'Bandung', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '179', 'Banjar', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '18', 'Simeulue', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '180', 'Bekasi', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '181', 'Bogor', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '182', 'Cimahi', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '183', 'Cirebon', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '184', 'Depok', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '185', 'Sukabumi', 'admin', '2016-04-30 10:08:37', 0, 0),
('12', '186', 'Tasikmalaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('13', '187', 'Kepulauan Seribu', 'admin', '2016-04-30 10:08:37', 0, 0),
('13', '188', 'Jakarta Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('13', '189', 'Jakarta Pusat', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '19', 'Banda Aceh', 'admin', '2016-04-30 10:08:37', 0, 0),
('13', '190', 'Jakarta Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('13', '191', 'Jakarta Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('13', '192', 'Jakarta Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '193', 'Banjarnegara', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '194', 'Banyumas', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '195', 'Batang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '196', 'Blora', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '197', 'Boyolali', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '198', 'Brebes', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '199', 'Cilacap', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '2', 'Aceh Barat Daya', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '20', 'Langsa', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '200', 'Demak', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '201', 'Grobogan', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '202', 'Jepara', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '203', 'Karanganyar', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '204', 'Kebumen', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '205', 'Kendal', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '206', 'Klaten', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '207', 'Kudus', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '208', 'Magelang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '209', 'Pati', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '21', 'Lhokseumawe', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '210', 'Pekalongan', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '211', 'Pemalang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '212', 'Purbalingga', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '213', 'Purworejo', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '214', 'Rembang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '215', 'Semarang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '216', 'Sragen', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '217', 'Sukoharjo', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '218', 'Tegal', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '219', 'Temanggung', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '22', 'Sabang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '220', 'Wonogiri', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '221', 'Wonosobo', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '222', 'Magelang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '223', 'Pekalongan', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '224', 'Salatiga', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '225', 'Semarang', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '226', 'Surakarta', 'admin', '2016-04-30 10:08:37', 0, 0),
('14', '227', 'Tegal', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '228', 'Bangkalan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '229', 'Banyuwangi', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '23', 'Subulussalam', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '230', 'Blitar', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '231', 'Bojonegoro', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '232', 'Bondowoso', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '233', 'Gresik', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '234', 'Jember', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '235', 'Jombang', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '236', 'Kediri', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '237', 'Lamongan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '238', 'Lumajang', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '239', 'Madiun', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '24', 'Asahan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '240', 'Magetan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '241', 'Malang', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '242', 'Mojokerto', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '243', 'Nganjuk', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '244', 'Ngawi', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '245', 'Pacitan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '246', 'Pamekasan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '247', 'Pasuruan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '248', 'Ponorogo', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '249', 'Probolinggo', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '25', 'Batu Bara', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '250', 'Sampang', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '251', 'Sidoarjo', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '252', 'Situbondo', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '253', 'Sumenep', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '254', 'Trenggalek', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '255', 'Tuban', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '256', 'Tulungagung', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '257', 'Batu', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '258', 'Blitar', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '259', 'Kediri', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '26', 'Dairi', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '260', 'Madiun', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '261', 'Malang', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '262', 'Mojokerto', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '263', 'Pasuruan', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '264', 'Probolinggo', 'admin', '2016-04-30 10:08:37', 0, 0),
('15', '265', 'Surabaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('16', '266', 'Bantul', 'admin', '2016-04-30 10:08:37', 0, 0),
('16', '267', 'Gunung Kidul', 'admin', '2016-04-30 10:08:37', 0, 0),
('16', '268', 'Kulon Progo', 'admin', '2016-04-30 10:08:37', 0, 0),
('16', '269', 'Sleman', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '27', 'Deli Serdang', 'admin', '2016-04-30 10:08:37', 0, 0),
('16', '270', 'Yogyakarta', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '271', 'Badung', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '272', 'Bangli', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '273', 'Buleleng', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '274', 'Gianyar', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '275', 'Jembrana', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '276', 'Karangasem', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '277', 'Klungkung', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '278', 'Tabanan', 'admin', '2016-04-30 10:08:37', 0, 0),
('17', '279', 'Denpasar', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '28', 'Humbang Hasundutan', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '280', 'Bima', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '281', 'Dompu', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '282', 'Lombok Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '283', 'Lombok Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '284', 'Lombok Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '285', 'Lombok Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '286', 'Sumbawa', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '287', 'Sumbawa Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '288', 'Bima', 'admin', '2016-04-30 10:08:37', 0, 0),
('18', '289', 'Mataram', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '29', 'Karo', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '290', 'Kupang', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '291', 'Timor Tengah Sel', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '292', 'Timor Tengah Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '293', 'Belu', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '294', 'Alor', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '295', 'Flores Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '296', 'Sikka', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '297', 'Ende', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '298', 'Ngada', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '299', 'Manggarai', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '3', 'Aceh Besar', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '30', 'Labuhanbatu', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '300', 'Sumba Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '301', 'Sumba Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '302', 'Lembata', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '303', 'Rote Ndao', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '304', 'Manggarai Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '305', 'Nagekeo', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '306', 'Sumba Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '307', 'Sumba Barat Daya', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '308', 'Manggarai Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '309', 'Sabu Raijua', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '31', 'Labuhanbatu Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('19', '310', 'Kupang', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '311', 'Bengkayang', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '312', 'Kapuas Hulu', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '313', 'Kayong Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '314', 'Ketapang', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '315', 'Kubu Raya', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '316', 'Landak', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '317', 'Melawi', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '318', 'Pontianak', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '319', 'Sambas', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '32', 'Labuhanbatu Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '320', 'Sanggau', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '321', 'Sekadau', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '322', 'Sintang', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '323', 'Pontianak', 'admin', '2016-04-30 10:08:37', 0, 0),
('20', '324', 'Singkawang', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '325', 'Balangan', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '326', 'Banjar', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '327', 'Barito Kuala', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '328', 'Hulu Sungai Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '329', 'Hulu Sungai Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '33', 'Langkat', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '330', 'Hulu Sungai Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '331', 'Kotabaru', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '332', 'Tabalong', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '333', 'Tanah Bumbu', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '334', 'Tanah Laut', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '335', 'Tapin', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '336', 'Banjarbaru', 'admin', '2016-04-30 10:08:37', 0, 0),
('21', '337', 'Banjarmasin', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '338', 'Barito Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '339', 'Barito Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '34', 'Mandailing Natal', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '340', 'Barito Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '341', 'Gunung Mas', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '342', 'Kapuas', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '343', 'Katingan', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '344', 'Kotawaringin Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '345', 'Kotawaringin Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '346', 'Lamandau', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '347', 'Murung Raya', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '348', 'Pulang Pisau', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '349', 'Sukamara', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '35', 'Nias', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '350', 'Seruyan', 'admin', '2016-04-30 10:08:37', 0, 0),
('22', '351', 'Palangka Raya', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '352', 'Berau', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '353', 'Bulungan', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '354', 'Kutai Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '355', 'Kutai Kartanegara', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '356', 'Kutai Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '357', 'Malinau', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '358', 'Nunukan', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '359', 'Paser', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '36', 'Nias Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '360', 'Penajam Paser Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '361', 'Tana Tidung', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '362', 'Balikpapan', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '363', 'Bontang', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '364', 'Samarinda', 'admin', '2016-04-30 10:08:37', 0, 0),
('23', '365', 'Tarakan', 'admin', '2016-04-30 10:08:37', 0, 0),
('24', '366', 'Boalemo', 'admin', '2016-04-30 10:08:37', 0, 0),
('24', '367', 'Bone Bolango', 'admin', '2016-04-30 10:08:37', 0, 0),
('24', '368', 'Gorontalo', 'admin', '2016-04-30 10:08:37', 0, 0),
('24', '369', 'Gorontalo Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '37', 'Nias Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('24', '370', 'Pohuwato', 'admin', '2016-04-30 10:08:37', 0, 0),
('24', '371', 'Gorontalo', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '372', 'Bantaeng', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '373', 'Barru', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '374', 'Bone', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '375', 'Bulukumba', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '376', 'Enrekang', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '377', 'Gowa', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '378', 'Jeneponto', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '379', 'Kepulauan Selayar', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '38', 'Nias Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '380', 'Luwu', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '381', 'Luwu Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '382', 'Luwu Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '383', 'Maros', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '384', 'Pangkajene & Kep', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '385', 'Pinrang', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '386', 'Sidenreng Rappang', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '387', 'Sinjai', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '388', 'Soppeng', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '389', 'Takalar', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '39', 'Padang Lawas', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '390', 'Tana Toraja', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '391', 'Toraja Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '392', 'Wajo', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '393', 'Makassar', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '394', 'Palopo', 'admin', '2016-04-30 10:08:37', 0, 0),
('25', '395', 'Parepare', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '396', 'Bombana', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '397', 'Buton', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '398', 'Buton Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '399', 'Kolaka', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '4', 'Aceh Jaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '40', 'Padang Lawas Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '400', 'Kolaka Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '401', 'Konawe', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '402', 'Konawe Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '403', 'Konawe Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '404', 'Muna', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '405', 'Wakatobi', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '406', 'Bau-Bau', 'admin', '2016-04-30 10:08:37', 0, 0),
('26', '407', 'Kendari', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '408', 'Banggai', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '409', 'Banggai Kepulauan', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '41', 'Pakpak Bharat', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '410', 'Buol', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '411', 'Donggala', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '412', 'Morowali', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '413', 'Parigi Moutong', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '414', 'Poso', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '415', 'Tojo Una-Una', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '416', 'Toli-Toli', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '417', 'Sigi', 'admin', '2016-04-30 10:08:37', 0, 0),
('27', '418', 'Palu', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '419', 'Bolaang Mongondow', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '42', 'Samosir', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '420', 'Bolaang Mngndw Sel', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '421', 'Bolaang Mong. Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '422', 'Bolaang Mong Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '423', 'Kepulauan Sangihe', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '424', 'Siau Tagul. Biaro', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '425', 'Kepulauan Talaud', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '426', 'Minahasa', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '427', 'Minahasa Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '428', 'Minahasa Tenggara', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '429', 'Minahasa Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '43', 'Serdang Bedagai', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '430', 'Bitung', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '431', 'Kotamobagu', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '432', 'Manado', 'admin', '2016-04-30 10:08:37', 0, 0),
('28', '433', 'Tomohon', 'admin', '2016-04-30 10:08:37', 0, 0),
('29', '434', 'Majene', 'admin', '2016-04-30 10:08:37', 0, 0),
('29', '435', 'Mamasa', 'admin', '2016-04-30 10:08:37', 0, 0),
('29', '436', 'Mamuju', 'admin', '2016-04-30 10:08:37', 0, 0),
('29', '437', 'Mamuju Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('29', '438', 'Polewali Mandar', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '439', 'Buru', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '44', 'Simalungun', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '440', 'Buru Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '441', 'Kepulauan Aru', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '442', 'Maluku Barat Daya', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '443', 'Maluku Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '444', 'Maluku Tenggara', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '445', 'Maluku Tenggr Brt', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '446', 'Seram Bagian Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '447', 'Seram Bagian Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '448', 'Ambon', 'admin', '2016-04-30 10:08:37', 0, 0),
('30', '449', 'Tual', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '45', 'Tapanuli Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '450', 'Halmahera Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '451', 'Halmahera Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '452', 'Halmahera Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '453', 'Halmahera Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '454', 'Kepulauan Sula', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '455', 'Halmahera Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '456', 'Pulau Morotai', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '457', 'Ternate', 'admin', '2016-04-30 10:08:37', 0, 0),
('31', '458', 'Tidore Kepulauan', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '459', 'Asmat', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '46', 'Tapanuli Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '460', 'Biak Numfor', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '461', 'Boven Digoel', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '462', 'Deiyai', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '463', 'Dogiyai', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '464', 'Intan Jaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '465', 'Jayapura', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '466', 'Jayawijaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '467', 'Keerom', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '468', 'Kepulauan Yapen', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '469', 'Lanny Jaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '47', 'Tapanuli Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '470', 'Mamberamo Raya', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '471', 'Mamberamo Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '472', 'Mappi', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '473', 'Merauke', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '474', 'Mimika', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '475', 'Nabire', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '476', 'Nduga', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '477', 'Paniai', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '478', 'Pegunungan Bintang', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '479', 'Puncak', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '48', 'Toba Samosir', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '480', 'Puncak Jaya', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '481', 'Sarmi', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '482', 'Supiori', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '483', 'Tolikara', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '484', 'Waropen', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '485', 'Yahukimo', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '486', 'Yalimo', 'admin', '2016-04-30 10:08:37', 0, 0),
('32', '487', 'Jayapura', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '488', 'Fakfak', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '489', 'Kaimana', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '49', 'Binjai', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '490', 'Manokwari', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '491', 'Maybrat', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '492', 'Raja Ampat', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '493', 'Sorong', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '494', 'Sorong Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '495', 'Tambrauw', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '496', 'Teluk Bintuni', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '497', 'Teluk Wondama', 'admin', '2016-04-30 10:08:37', 0, 0),
('33', '498', 'Sorong', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '5', 'Aceh Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '50', 'Gunung Sitoli', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '51', 'Medan', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '52', 'Padang Sidempuan', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '53', 'Pematangsiantar', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '54', 'Sibolga', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '55', 'Tanjung Balai', 'admin', '2016-04-30 10:08:37', 0, 0),
('2', '56', 'Tebing Tinggi', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '57', 'Bengkulu Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '58', 'Bengkulu Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '59', 'Bengkulu Utara', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '6', 'Aceh Singkil', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '60', 'Benteng', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '61', 'Kaur', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '62', 'Kepahiang', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '63', 'Lebong', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '64', 'Mukomuko', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '65', 'Rejang Lebong', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '66', 'Seluma', 'admin', '2016-04-30 10:08:37', 0, 0),
('3', '67', 'Bengkulu', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '68', 'Batang Hari', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '69', 'Bungo', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '7', 'Aceh Tamiang', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '70', 'Kerinci', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '71', 'Merangin', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '72', 'Muaro Jambi', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '73', 'Sarolangun', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '74', 'Tjg Jabung Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '75', 'Tjg Jabung Timur', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '76', 'Tebo', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '77', 'Jambi', 'admin', '2016-04-30 10:08:37', 0, 0),
('4', '78', 'Sungai Penuh', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '79', 'Bengkalis', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '8', 'Aceh Tengah', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '80', 'Indragiri Hilir', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '81', 'Indragiri Hulu', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '82', 'Kampar', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '83', 'Kuantan Singingi', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '84', 'Pelalawan', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '85', 'Rokan Hilir', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '86', 'Rokan Hulu', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '87', 'Siak', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '88', 'Pekanbaru', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '89', 'Dumai', 'admin', '2016-04-30 10:08:37', 0, 0),
('1', '9', 'Aceh Tenggara', 'admin', '2016-04-30 10:08:37', 0, 0),
('5', '90', 'Kepulauan Meranti', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '91', 'Agam', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '92', 'Dharmasraya', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '93', 'Kepulauan Mentawai', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '94', 'Lima Puluh Kota', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '95', 'Padang Pariaman', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '96', 'Pasaman', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '97', 'Pasaman Barat', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '98', 'Pesisir Selatan', 'admin', '2016-04-30 10:08:37', 0, 0),
('6', '99', 'Sijunjung', 'admin', '2016-04-30 10:08:37', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_provinsi`
--

CREATE TABLE `ms_provinsi` (
  `kode_prov` varchar(5) NOT NULL COMMENT 'Kode Provinsi',
  `nama_prov` varchar(50) NOT NULL COMMENT 'Nama Provinsi',
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `sinkron` int(1) DEFAULT 0,
  `flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Master Provinsi';

--
-- Dumping data untuk tabel `ms_provinsi`
--

INSERT INTO `ms_provinsi` (`kode_prov`, `nama_prov`, `create_user`, `create_time`, `sinkron`, `flag`) VALUES
('1', 'Aceh', 'admin', '2016-04-30 10:04:04', 0, 0),
('10', 'Kepulauan Riau', 'admin', '2016-04-30 10:04:04', 0, 0),
('11', 'Banten', 'admin', '2016-04-30 10:04:04', 0, 0),
('12', 'Jawa Barat', 'admin', '2016-04-30 10:04:04', 0, 0),
('13', 'Jakarta Raya', 'admin', '2016-04-30 10:04:04', 0, 0),
('14', 'Jawa Tengah', 'admin', '2016-04-30 10:04:04', 0, 0),
('15', 'Jawa Timur', 'admin', '2016-04-30 10:04:04', 0, 0),
('16', 'Daerah Istimewa Yogyakarta', 'admin', '2016-04-30 10:04:04', 0, 0),
('17', 'Bali', 'admin', '2016-04-30 10:04:04', 0, 0),
('18', 'Nusa Tenggara Barat', 'admin', '2016-04-30 10:04:04', 0, 0),
('19', 'Nusa Tenggara Timur', 'admin', '2016-04-30 10:04:04', 0, 0),
('2', 'Sumatera Utara', 'admin', '2016-04-30 10:04:04', 0, 0),
('20', 'Kalimantan Barat', 'admin', '2016-04-30 10:04:04', 0, 0),
('21', 'Kalimantan Selatan', 'admin', '2016-04-30 10:04:04', 0, 0),
('22', 'Kalimantan Tengah', 'admin', '2016-04-30 10:04:04', 0, 0),
('23', 'Kalimantan Timur', 'admin', '2016-04-30 10:04:04', 0, 0),
('24', 'Gorontalo', 'admin', '2016-04-30 10:04:04', 0, 0),
('25', 'Sulawesi Selatan', 'admin', '2016-04-30 10:04:04', 0, 0),
('26', 'Sulawesi Tenggara', 'admin', '2016-04-30 10:04:04', 0, 0),
('27', 'Sulawesi Tengah', 'admin', '2016-04-30 10:04:04', 0, 0),
('28', 'Sulawesi Utara', 'admin', '2016-04-30 10:04:04', 0, 0),
('29', 'Sulawesi Barat', 'admin', '2016-04-30 10:04:04', 0, 0),
('3', 'Bengkulu', 'admin', '2016-04-30 10:04:04', 0, 0),
('30', 'Maluku', 'admin', '2016-04-30 10:04:04', 0, 0),
('31', 'Maluku Utara', 'admin', '2016-04-30 10:04:04', 0, 0),
('32', 'Papua', 'admin', '2016-04-30 10:04:04', 0, 0),
('33', 'Papua Barat', 'admin', '2016-04-30 10:04:04', 0, 0),
('4', 'Jambi', 'admin', '2016-04-30 10:04:04', 0, 0),
('5', 'Riau', 'admin', '2016-04-30 10:04:04', 0, 0),
('6', 'Sumatera Barat', 'admin', '2016-04-30 10:04:04', 0, 0),
('7', 'Sumatera Selatan', 'admin', '2016-04-30 10:04:04', 0, 0),
('8', 'Lampung', 'admin', '2016-04-30 10:04:04', 0, 0),
('9', 'Kepulauan Bangka Belitung', 'admin', '2016-04-30 10:04:04', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_satuan`
--

CREATE TABLE `ms_satuan` (
  `id` int(2) NOT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `flag` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_satuan`
--

INSERT INTO `ms_satuan` (`id`, `nama`, `flag`) VALUES
(1, 'roll ', 0),
(2, 'meter', 0),
(3, 'gallon', 0),
(4, 'tube', 0),
(5, 'kaleng', 0),
(6, 'kg', 0),
(7, 'bungkus', 0),
(8, 'dirigen', 0),
(9, 'pcs', 0),
(10, 'lembar', 0),
(11, 'dus', 0),
(12, 'sak', 0),
(13, 'btl', 0),
(14, 'ktg', 0),
(15, 'btg', 0),
(16, 'pail', 0),
(17, 'psg', 0),
(18, 'ikat', 0),
(19, 'set', 0),
(20, 'lain', 0),
(32, 'asd', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `province`
--

CREATE TABLE `province` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `province`
--

INSERT INTO `province` (`id`, `name`) VALUES
(1, 'Aceh'),
(2, 'Sumatera Utara'),
(3, 'Bengkulu'),
(4, 'Jambi'),
(5, 'Riau'),
(6, 'Sumatera Barat'),
(7, 'Sumatera Selatan'),
(8, 'Lampung'),
(9, 'Kepulauan Bangka Belitung'),
(10, 'Kepulauan Riau'),
(11, 'Banten'),
(12, 'Jawa Barat'),
(13, 'Jakarta Raya'),
(14, 'Jawa Tengah'),
(15, 'Jawa Timur'),
(16, 'Daerah Istimewa Yogyakarta'),
(17, 'Bali'),
(18, 'Nusa Tenggara Barat'),
(19, 'Nusa Tenggara Timur'),
(20, 'Kalimantan Barat'),
(21, 'Kalimantan Selatan'),
(22, 'Kalimantan Tengah'),
(23, 'Kalimantan Timur'),
(24, 'Gorontalo'),
(25, 'Sulawesi Selatan'),
(26, 'Sulawesi Tenggara'),
(27, 'Sulawesi Tengah'),
(28, 'Sulawesi Utara'),
(29, 'Sulawesi Barat'),
(30, 'Maluku'),
(31, 'Maluku Utara'),
(32, 'Papua'),
(33, 'Papua Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblabsensi`
--

CREATE TABLE `tblabsensi` (
  `idtblabsensi` int(11) NOT NULL,
  `no_induk` varchar(20) DEFAULT NULL,
  `kegiatan` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblagama`
--

CREATE TABLE `tblagama` (
  `idtblagama` int(2) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblagama`
--

INSERT INTO `tblagama` (`idtblagama`, `nama`, `deskripsi`, `flag`) VALUES
(1, 'Islam', 'islam', 0),
(2, 'Protestan', 'kristen protestan', 0),
(3, 'Katolik', 'Katolik', 0),
(4, 'Hindu', 'Hindu', 0),
(5, 'Buddha ', 'Buddha ', 0),
(6, 'Khonghucu', 'Khonghucu', 0),
(7, 'Lainnya', 'Lainnya', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblatensi`
--

CREATE TABLE `tblatensi` (
  `idtblatensi` int(11) NOT NULL,
  `idtbluser` int(11) DEFAULT NULL,
  `idcuaca` int(11) DEFAULT NULL,
  `atensi` varchar(500) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `flag` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblbarak`
--

CREATE TABLE `tblbarak` (
  `idtblbarak` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `penanggung_jawab` varchar(50) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `tampung` int(6) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `picture_name` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblbarak`
--

INSERT INTO `tblbarak` (`idtblbarak`, `nama`, `alamat`, `penanggung_jawab`, `tlpn`, `tampung`, `latitude`, `longitude`, `picture_name`, `deskripsi`, `create_time`, `create_user`, `flag`) VALUES
(1, 'TEMPAT EVAKUASI AKHIR UMBULMARTANI / BARAK UMBULMARTANI', 'Grogolan,Umbulmartani, Ngemplak,Sleman', 'Ngadiman Supri Utomo', '081931718802', 300, '-7.683516266401151', '110.43502559096339', '1_rsz_img-20190530-wa0038.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Umbulmartani Ngemplak Sleman.', '2019-09-21 15:58:56', NULL, 1),
(2, 'TEMPAT EVAKUASI AKHIR PANDANPURO / BARAK PANDANPURO', 'Pandanpuro,Hargobinangun, Pakem, Sleman', 'Kamijo', '087838951335', 300, '-7.641749558330131', '110.41613429395068', '', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Hargobinangun Pakem Sleman.', '2019-09-21 10:24:43', NULL, 1),
(3, 'TEMPAT EVAKUASI AKHIR PURWOBINANGUN / BARAK PURWOBINANGUN', 'Watuadeg, Purwobinangun, Pakem, Sleman', 'Eko Tri Widaryanto', '081328737304', 300, '-7.648275851145598', '110.39272933808672', '3_IMG_20190530_132632-compressed.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Purwobinangun Pakem Sleman.', '2019-09-21 10:17:44', NULL, 0),
(4, 'TEMPAT EVAKUASI AKHIR GIRIKERTO / BARAK GIRIKERTO', 'Soprayan, Girikerto, Turi, Sleman', 'Imam Yoga Purwoko', '085786663743', 300, '-7.6253031241003315', '110.39032741991389', '4_IMG-20190530-WA0055.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Girikerto Turi Sleman', '2019-09-21 10:11:50', NULL, 0),
(5, 'TEMPAT EVAKUASI AKHIR PONDOKREJO / BARAK PONDOKREJO', 'Banjarharjo,Pondokrejo, Tempel, Sleman', 'Mifthahudin', '082241616139', 300, '-7.664273485797294', '110.30727684108126', '5_MVIMG_20190530_130127-compressed.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Pondokrejo Tempel', '2019-09-21 10:04:44', NULL, 0),
(6, 'TEMPAT EVAKUASI AKHIR BRAYUT / BARAK BRAYUT', 'Brayut, Wukirsari, Cangkringan, Sleman', 'Agus Kiswanto', '085640964412', 300, '-7.653339972921873', '110.4325453898083', '6_rsz_img-20190530-wa0050.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Eukirsari Cangkringan Sleman.', '2019-09-21 10:40:24', NULL, 0),
(7, 'TEMPAT EVAKUASI AKHIR KIYARAN / BARAK KIYARAN', 'Kiyaran, Wukirsari, Cangkringan, Sleman', 'Yulianto', '085229798841', 300, '-7.658489099641041', '110.44015347567904', '7_rsz_img-20190530-wa0047.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Wukirsari Cangkringan Sleman.', '2019-09-21 10:44:52', NULL, 0),
(8, 'TEMPAT EVAKUASI AKHIR RANDUSARI / BARAK RANDUSARI', 'Randusari, Argomulyo, Cangkringan,Sleman', 'Sugeng Purwo Harsono', '081392508420', 300, '-7.678429748138064', '110.44951840845454', '8_rsz_img-20190530-wa0045.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Argomulyo Cangkringan Sleman.', '2019-09-21 10:48:48', NULL, 0),
(9, 'TEMPAT EVAKUASI AKHIR GAYAM / BARAK GAYAM', 'Gayam, Argomulyo, Cangkringan, Sleman', 'Sukartono', '082253429980', 300, '-7.6598368473681315', '110.46993404237139', '9_rsz_img-20190530-wa0044.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Argomulyo Cangkringan Sleman.', '2019-09-21 13:07:12', NULL, 0),
(10, 'TEMPAT EVAKUASI AKHIR TIRTOMARTANI / BARAK TIRTOMARTANI', 'Kedulan, Tirtomartani, Kalasan, Sleman', 'Sutrisno', '081578467414', 300, '-7.7437197402289515', '110.46922862140048', '10_rsz_img-20190530-wa0040.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Tirtomartani Kalasan Sleman', '2019-09-21 13:12:19', NULL, 0),
(11, 'TEMPAT EVAKUASI AKHIR PLOSOKEREP / BARAK PLOSOKEREP', 'Sambisari, Plosokerep, Umbulharjo, Cangkringan, Sleman', 'Suprihana', '085221722655', 300, '-7.6392054733745045', '110.44549107161868', '11_rsz_img-20190530-wa0051.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Umbulharjo Cangkringan Sleman', '2019-09-21 13:21:30', NULL, 0),
(12, 'TEMPAT EVAKUASI AKHIR KORIPAN / BARAK KORIPAN', 'Koripan, Sindumartani, Ngemplak, Sleman', 'Iqbal Ahkmad Wakhid', '081329366618', 300, '-7.697574708021959', '110.481569465078', '12_rsz_img-20190530-wa0042.jpg', 'Barak pengungsi / tempat evakuasi akhir yang berada di Desa Sindumartani Ngemplak Sleman', '2019-09-21 13:25:29', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblbarang`
--

CREATE TABLE `tblbarang` (
  `idtblbarang` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `uom` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblbarang`
--

INSERT INTO `tblbarang` (`idtblbarang`, `nama`, `deskripsi`, `uom`, `create_date`, `flag`) VALUES
(1, 'beras', 'beras kiloan', 'kg', '2017-10-12 16:27:55', 0),
(2, 'mie instan', 'mie dus dusan', 'dus', '2017-10-12 16:28:24', 0),
(3, 'uang', 'uang', 'rupiah', '2017-10-12 16:28:37', 0),
(4, 'Asbes', 'Penutup Atap Gelombang', 'pcs', '2017-11-05 15:07:10', 0),
(5, 'Seng', 'Penutup Atap Gelombang', 'pcs', '2017-11-05 15:07:29', 0),
(6, 'Angkong', 'Pengangkut alat dan material', 'pcs', '2017-11-05 15:07:49', 0),
(7, 'Daster', 'Pakaian Ibu', 'pcs', '2017-12-03 14:17:35', 0),
(8, 'Sarung', 'Sarung Selimut', 'pcs', '2017-12-03 14:17:56', 0),
(9, 'Jarik', 'Jarik', 'pcs', '2017-12-03 14:18:16', 0),
(10, 'Tikar', 'Alas Tidur', 'pcs', '2017-12-03 14:51:10', 0),
(11, 'Selimut', 'Selimut Tidur', 'pcs', '2017-12-03 14:51:37', 0),
(12, 'Kaos', 'Kaos Oblong', 'pcs', '2017-12-03 14:52:20', 0),
(13, 'Logistik Pangan DIY', 'mie goreng 6 pcs, mi rebus, 6 pcs, minyak goreng 1 liter, sarden 1 kaleng, kecap 1 botol, teh celup ', 'pcs', '2019-09-18 13:29:48', 0),
(14, 'Paket Lauk Pauk (DIY)', 'Sate ayam, balado daging, ikan marlin dalam saus tomat,ayam bumbu rujak, semur daging, ikan asam man', 'pcs', '2019-09-18 18:37:23', 0),
(15, 'Paket tambahan gizi (DIY)', 'Bubur kacang merah, minuman susu moka, koktail buah dalam sirup', 'pcs', '2019-09-18 18:41:10', 0),
(16, 'Paket Kids ware (DIY)', 'Minyak telon , Minyak kayu putih, sabun mandi bayi plus shampo, handuk bayi, bedak bayi, sikat gigi ', 'pcs', '2019-09-18 18:48:37', 0),
(17, 'Paket Sandang (DIY)', 'n perempuan dewasa, pakaian anak laki -laki  dan anak perempuan.', 'pcs', '2019-09-18 19:44:34', 0),
(18, 'Paket perlengkapan sekolah (DIY)', 'Botol air minm anak, tempat makan anak, kotak pensil, krayon, buku tulis, penggaris, pensil, rautan ', 'pcs', '2019-09-18 22:05:32', 0),
(19, 'Paket perlengkapan  makan (DIY)', 'Teko plastik, piring plastik, gelas plastik, mangkok plastik kecil, mangkok plastik besar, sendok pl', 'pcs', '2019-09-18 22:16:40', 0),
(20, 'Paket Rekreasional (DIY)', 'Bola sepak no.4, pompa bola, ring donat plastik, balok susun angka, monopoli & ular tangga, puzzle k', 'pcs', '2019-09-18 22:20:50', 0),
(21, 'Masker  (BPBD SLEMAN)', 'Masker karet/tali', 'pcs', '2019-09-18 22:24:20', 0),
(22, 'Masker (Lain-lain)', 'masker tali/karet', 'pcs', '2019-09-18 22:25:36', 0),
(23, 'Masker moncong babi (DIY)', 'masker moncong', 'pcs', '2019-09-18 22:26:40', 0),
(24, 'Kaca mata gogle', 'kacamata anti debu', 'pcs', '2019-09-18 22:27:25', 0),
(25, 'Seng (DIY)', 'penutup atap gelombang', 'pcs', '2019-09-18 22:28:32', 0),
(26, 'Seng (BPBD Sleman)', 'penutup atap gelombang', 'pcs', '2019-09-18 22:29:15', 0),
(27, 'Asbes (BPBD Sleman)', 'asbes', 'pcs', '2019-09-18 22:29:59', 0),
(28, 'Terpal (DIY)', 'terpal/tenda gulung', 'pcs', '2019-09-18 22:30:50', 0),
(29, 'Terpal (BPBD Sleman)', 'terpal/tenda gulung', 'pcs', '2019-09-18 22:31:46', 0),
(30, 'Terpal (lain-lain)', 'terpal/tenda gulung/atap darurat', 'pcs', '2019-09-18 22:32:45', 0),
(31, 'Bagor (DIY)', 'karung bagor', 'pcs', '2019-09-18 22:33:33', 0),
(32, 'Bagor (BPBD Sleman)', 'karung bagor', 'pcs', '2019-09-18 22:34:13', 0),
(33, 'Angkong (DIY)', 'pengangkut alat dan material', 'pcs', '2019-09-18 22:35:13', 0),
(34, 'Sekop (DIY)', 'sekop ', 'pcs', '2019-09-18 22:36:36', 0),
(35, 'Sekop (BPBD Sleman)', 'sekop', 'pcs', '2019-09-18 22:37:08', 0),
(36, 'Cangkul (BPBD Sleman)', 'cangkul', 'pcs', '2019-09-18 22:37:56', 0),
(37, 'Senggrong (DIY)', 'senggrong', 'pcs', '2019-09-18 22:38:36', 0),
(38, 'Senggrong (BPBD Sleman)', 'senggrong', 'pcs', '2019-09-18 22:39:08', 0),
(39, 'Sabit (DIY)', 'sabit ', 'pcs', '2019-09-18 22:40:52', 0),
(40, 'Sabit (BPBD Sleman)', 'arit besar/sabit', 'pcs', '2019-09-18 22:41:45', 0),
(41, 'Plancong (DIY)', 'plancong', 'pcs', '2019-09-18 22:42:19', 0),
(42, 'Parang/bendo (DIY)', 'parang/bendo', 'pcs', '2019-09-18 22:43:07', 0),
(43, 'Parang/bendo (BPBD Sleman)', 'parang/bendo', 'pcs', '2019-09-18 22:43:50', 0),
(44, 'Mata garu (DIY)', 'mata garu', 'pcs', '2019-09-18 22:44:25', 0),
(45, 'Palu (DIY)', 'palu', 'pcs', '2019-09-18 22:45:05', 0),
(46, 'Ember (DIY)', 'ember', 'pcs', '2019-09-18 22:45:39', 0),
(47, 'Bronjong (DIY)', 'bronjong', 'pcs', '2019-09-18 22:46:50', 0),
(48, 'Tikar(DIY)', 'tikar/alas tidur pengungsi', 'pcs', '2019-09-18 22:47:17', 0),
(49, 'Bodem (BPBD Sleman)', 'bodem/alat pemecah batu', 'pcs', '2019-09-18 22:47:49', 0),
(50, 'Kampak (BPBD Sleman)', 'kampak', 'pcs', '2019-09-18 22:48:28', 0),
(51, 'Matras (DIY)', 'matras/alas tidur', 'pcs', '2019-09-18 22:48:57', 0),
(52, 'Arit Besar', '-', 'pcs', '2019-09-25 08:49:05', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblbencana`
--

CREATE TABLE `tblbencana` (
  `id` int(9) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblbencana`
--

INSERT INTO `tblbencana` (`id`, `nama`, `deskripsi`, `icon`, `create_user`, `create_time`, `flag`) VALUES
(1, 'ANGIN KENCANG', 'Angin Kencang yang menyebabkan pohon tumbang', '1_img_20170329_wa0001_copy_Iee_icon.ico', 'trial', '2017-09-13 14:06:27', 0),
(2, 'GUNUNG MERAPI', 'Erupsi Gunung Merapi', '2_merapi_6_Hk4_icon.ico', 'trial', '2017-09-13 14:07:09', 0),
(3, 'BANJIR', 'banjir', '3_006-flood.png', NULL, '2017-09-13 14:07:09', 0),
(4, 'TANAH LONGSOR', 'Longsoran tanah berupa batuan maupun tanah', '4_longsor_VO3_icon.ico', NULL, NULL, 0),
(5, 'KEBAKARAN LAHAN', 'kebakaran Lahan dan Hutan', '5_lahan_sOs_icon.ico', NULL, NULL, 0),
(6, 'GEMPA BUMI', 'Gempa bumi', '6_gempa_LGh_icon.ico', NULL, NULL, 0),
(7, 'KECELAKAAN ', 'kecelakaan', '7_003-engine-problems.png', NULL, NULL, 0),
(10, 'LAINNYA/ NON KEBENCANAAN', 'Kejadian Non kebencanaan alam', '10_laka_131582436003038704.ico', NULL, '2017-11-05 15:17:10', 0),
(11, 'KEBAKARAN', 'Kebakaran permukiman, Gedung dan infrastruktur bangunan', '11_rumah_8xZ_icon.ico', NULL, '2018-02-07 01:56:45', 0),
(12, 'PETIR', 'Objek terkena petir', '12_petir_YnZ_icon.ico', NULL, '2018-02-07 16:44:54', 0),
(13, 'KEKERINGAN', 'Keadaan kekurangan pasokan air pada suatu daerah dalam masa yang berkepanjangan', '13_491241.png', NULL, '2019-11-24 11:36:04', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblcuaca`
--

CREATE TABLE `tblcuaca` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `ket` varchar(300) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tblcuaca`
--

INSERT INTO `tblcuaca` (`id`, `nama`, `ket`, `icon`, `create_user`, `create_time`, `flag`) VALUES
(1, 'Cerah', 'Cuaca Cerah tanpa adanya awan, mendung dan kabut.', '1_cerah.png', NULL, '2022-01-24 23:14:35', 0),
(2, 'Cerah Berawan', 'Cuaca cerah dengan dominasi awan lebih dari 50 %', '2_cerah_berawan.png', NULL, '2022-01-24 23:15:53', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbldampak`
--

CREATE TABLE `tbldampak` (
  `idtbldampak` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `satuan` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbldampak`
--

INSERT INTO `tbldampak` (`idtbldampak`, `nama`, `satuan`, `create_date`, `flag`) VALUES
(29, 'ANAK MENINGGAL LAKI LAKI', 'Jiwa', '2018-02-07 14:33:25', 0),
(30, 'ANAK MENINGGAL PEREMPUAN', 'jiwa', '2018-02-07 14:33:44', 0),
(31, 'DEWASA MENINGGAL LAKI LAKI', 'jiwa', '2018-02-07 14:34:09', 0),
(32, 'DEWASA MENINGGAL PEREMPUAN', 'Jiwa', '2018-02-07 14:34:33', 0),
(33, 'HILANG/HANYUT ANAK LAKI LAKI', 'Jiwa', '2018-02-07 14:35:17', 0),
(34, 'HILANG/HANYUT ANAK PEREMPUAN', 'Jiwa', '2018-02-07 14:35:43', 0),
(35, 'HILANG/HANYUT DEWASA LAKI LAKI', 'Jiwa', '2018-02-07 14:36:07', 0),
(36, 'HILANG/HANYUT DEWASA PEREMPUAN', 'Jiwa', '2018-02-07 14:36:27', 0),
(37, 'ANAK LUKA RINGAN LAKI LAKI', 'Jiwa', '2018-02-07 14:37:08', 0),
(38, 'ANAK LUKA RINGAN PEREMPUAN', 'Jiwa', '2018-02-07 14:37:31', 0),
(39, 'DEWASA LUKA RINGAN LAKI LAKI', 'Jiwa', '2018-02-07 14:37:57', 0),
(40, 'DEWASA LUKA RINGAN PEREMPUAN', 'Jiwa', '2018-02-07 14:38:13', 0),
(41, 'LANSIA LUKA RINGAN LAKI LAKI', 'Jiwa', '2018-02-07 14:38:33', 0),
(42, 'LANSIA LUKA RINGAN PEREMPUAN', 'Jiwa', '2018-02-07 14:39:09', 0),
(43, 'IBU HAMIL LUKA RINGAN', 'Jiwa', '2018-02-07 14:39:36', 0),
(44, 'ANAK LUKA BERAT LAKI LAKI', 'Jiwa', '2018-02-07 14:40:01', 0),
(45, 'ANAK LUKA BERAT PEREMPUAN', 'Jiwa', '2018-02-07 14:40:19', 0),
(46, 'DEWASA LUKA BERAT LAKI LAKI', 'Jiwa', '2018-02-07 14:40:36', 0),
(47, 'DEWASA LUKA BERAT PEREMPUAN', 'Jiwa', '2018-02-07 14:40:51', 0),
(48, 'LANSIA LUKA BERAT LAKI LAKI', 'Jiwa', '2018-02-07 14:41:11', 0),
(49, 'LANSIA LUKA BERAT PEREMPUAN', 'Jiwa', '2018-02-07 14:41:39', 0),
(50, 'IBU HAMIL LUKA BERAT', 'Jiwa', '2018-02-07 14:41:56', 0),
(51, 'BAYI TERDAMPAK', 'Jiwa', '2018-02-07 14:42:37', 0),
(52, 'BALITA TERDAMPAK', 'Jiwa', '2018-02-07 14:42:53', 0),
(53, 'ANAK TERDAMPAK LAKI LAKI', 'Jiwa', '2018-02-07 14:43:13', 0),
(54, 'ANAK TERDAMPAK PEREMPUAN', 'Jiwa', '2018-02-07 14:43:33', 0),
(55, 'DEWASA TERDAMPAK LAKI LAKI', 'Jiwa', '2018-02-07 14:44:07', 0),
(56, 'DEWASA TERDAMPAK PEREMPUAN', 'Jiwa', '2018-02-07 14:44:27', 0),
(57, 'LANSIA TERDAMPAK LAKI LAKI', 'Jiwa', '2018-02-07 14:44:45', 0),
(58, 'LANSIA TERDAMPAK PEREMPUAN', 'Jiwa', '2018-02-07 14:45:03', 0),
(59, 'IBU HAMIL TERDAMPAK', 'Jiwa', '2018-02-07 14:45:22', 0),
(60, 'IBU MENYUSUI TERDAMPAK', 'Jiwa', '2018-02-07 14:45:47', 0),
(61, 'BAYI MENGUNGSI', 'Jiwa', '2018-02-07 14:46:24', 0),
(62, 'BALITA MENGUNGSI', 'Jiwa', '2018-02-07 14:46:35', 0),
(63, 'ANAK MENGUNGSI LAKI LAKI', 'Jiwa', '2018-02-07 14:46:51', 0),
(64, 'ANAK MENGUNGSI PEREMPUAN', 'Jiwa', '2018-02-07 14:47:07', 0),
(65, 'DEWASA MENGUNGSI LAKI LAKI', 'Jiwa', '2018-02-07 14:47:27', 0),
(66, 'DEWASA MENGUNGSI PEREMPUAN', 'Jiwa', '2018-02-07 14:47:43', 0),
(67, 'LANSIA MENGUNGSI LAKI LAKI', 'Jiwa', '2018-02-07 14:47:57', 0),
(68, 'LANSIA MENGUNGSI PEREMPUAN', 'Jiwa', '2018-02-07 14:48:13', 0),
(69, 'IBU HAMIL MENGUNGSI', 'Jiwa', '2018-02-07 14:48:29', 0),
(70, 'IBU MENYUSUI MENGUNGSI', 'Jiwa', '2018-02-07 14:48:50', 0),
(71, 'DIFABEL MENGUNGSI', 'Jiwa', '2018-02-07 14:49:05', 0),
(72, 'RUMAH RUSAK RINGAN (RR)', 'Unit', '2018-02-07 14:49:48', 0),
(73, 'RUMAH RUSAK SEDANG (RS)', 'Unit', '2018-02-07 14:50:09', 0),
(74, 'RUMAH RUSAK BERAT (RB)', 'Unit', '2018-02-07 14:50:28', 0),
(75, 'RUMAH TERENDAM (TR)', 'Unit', '2018-02-07 14:50:48', 0),
(76, 'KANDANG', 'Unit', '2018-02-07 14:50:59', 0),
(77, 'TERNAK BESAR', 'Ekor', '2018-02-07 14:51:12', 0),
(78, 'TERNAK KECIL', 'Ekor', '2018-02-07 14:51:23', 0),
(79, 'POHON ', 'Batang', '2018-02-07 14:51:45', 0),
(80, 'TEMPAT USAHA', 'Unit', '2018-02-07 14:51:55', 0),
(81, 'JARINGAN LISTRIK', 'Titik', '2018-02-07 14:52:22', 0),
(82, 'JARINGAN TELEPHONE', 'Titik', '2018-02-07 14:52:33', 0),
(83, 'JARINGAN AIR', 'Titik', '2018-02-07 14:52:46', 0),
(84, 'F. UMUM RUSAK RINGAN ', 'Unit', '2018-02-07 14:58:11', 0),
(85, 'F. UMUM RUSAK SEDANG', 'Unit', '2018-02-07 14:58:26', 0),
(86, 'F. UMUM RUSAK BERAT', 'Unit', '2018-02-07 14:58:37', 0),
(87, 'F. PENDIDIKAN RUSAK RINGAN', 'Unit', '2018-02-07 14:58:53', 0),
(88, 'F. PENDIDIKAN RUSAK SEDANG', 'Unit', '2018-02-07 14:59:08', 0),
(89, 'F. PENDIDIKAN RUSAK BERAT', 'Unit', '2018-02-07 14:59:20', 0),
(90, 'F. KESEHATAN RUSAK RINGAN', 'Unit', '2018-02-07 14:59:42', 0),
(91, 'F. KESEHATAN RUSAK SEDANG', 'Unit', '2018-02-07 14:59:55', 0),
(92, 'F. KESEHATAN RUSAK BERAT', 'Unit', '2018-02-07 15:00:08', 0),
(93, 'F. IBADAH RUSAK RINGAN', 'Unit', '2018-02-07 15:00:26', 0),
(94, 'F. IBADAH RUSAK SEDANG', 'Unit', '2018-02-07 15:00:39', 0),
(95, 'F. IBADAH RUSAK BERAT', 'Unit', '2018-02-07 15:00:53', 0),
(96, 'KOLAM (TITIK)', 'Titik', '2018-02-07 15:02:09', 0),
(97, 'KOLAM ( LUAS )', 'M2', '2018-02-07 15:02:31', 0),
(98, 'SAWAH (TITIK)', 'Titik', '2018-02-07 15:04:34', 0),
(99, 'SAWAH (LUAS)', 'M2', '2018-02-07 15:05:05', 0),
(100, 'LAHAN (TITIK)', 'Titik', '2018-02-07 15:05:20', 0),
(101, 'LAHAN (LUAS)', 'M2', '2018-02-07 15:05:32', 0),
(102, 'HUTAN (TITIK)', 'Titik', '2018-02-07 15:06:00', 0),
(103, 'HUTAN (LUAS)', 'M2', '2018-02-07 15:06:17', 0),
(104, 'TALUD (TITIK)', 'Titik', '2018-02-07 15:06:39', 0),
(105, 'TALUD (VOLUME)', 'M3', '2018-02-07 15:07:04', 0),
(106, 'TEBING (TITIK)', 'Titik', '2018-02-07 15:07:19', 0),
(107, 'TEBING (VOLUME)', 'M3', '2018-02-07 15:07:31', 0),
(108, 'JEMBATAN', 'Titik', '2018-02-07 15:07:44', 0),
(109, 'JALAN (TITIK)', 'Titik', '2018-02-07 15:07:55', 0),
(110, 'JALAN (LUAS)', 'M2', '2018-02-07 15:08:17', 0),
(111, 'IRIGASI (TITIK)', 'Titik', '2018-02-07 15:08:32', 0),
(112, 'IRIGASI (VOLUME)', 'M3', '2018-02-07 15:08:53', 0),
(113, 'DAM/ BENDUNGAN', 'Titik', '2018-02-07 15:09:06', 0),
(114, 'KENDARAAN RODA DUA (R2)', 'Unit', '2018-02-07 15:09:31', 0),
(115, 'MOBIL (R4)', 'Unit', '2018-02-07 15:09:58', 0),
(116, 'MASAL', 'Unit', '2018-02-07 15:10:11', 0),
(117, 'TAKSIRAN KERUSAKAN', 'Rp', '2018-02-07 15:10:25', 0),
(118, 'TOWER', 'Unit', '2019-03-13 19:15:29', 0),
(119, 'WARGA MASYARAKAT', 'jiwa', '2019-11-24 11:41:49', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbldesa`
--

CREATE TABLE `tbldesa` (
  `idtbldesa` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `kecamatan` int(11) DEFAULT NULL,
  `radius_merapi` int(11) DEFAULT NULL,
  `fasilitas` varchar(100) DEFAULT NULL,
  `penanggung_jawab` varchar(50) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `tampung` int(6) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbldusun`
--

CREATE TABLE `tbldusun` (
  `idtbldusun` int(11) NOT NULL,
  `id_kel` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `radius_merapi` int(11) DEFAULT NULL,
  `nama_pejabat` tinytext DEFAULT NULL,
  `alamat` tinytext DEFAULT NULL,
  `notelp` varchar(16) DEFAULT NULL,
  `idtblkrb` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbldusun`
--

INSERT INTO `tbldusun` (`idtbldusun`, `id_kel`, `nama`, `radius_merapi`, `nama_pejabat`, `alamat`, `notelp`, `idtblkrb`, `create_time`) VALUES
(1, 1, 'pasekan Kidul', 0, '', '', '', NULL, NULL),
(2, 1, 'Pasekan Lor', 0, '', '', '', NULL, NULL),
(3, 1, 'Nyamplung Kidul', 0, '', '', '', NULL, NULL),
(4, 1, 'Nyamplung Lor', 0, '', '', '', NULL, NULL),
(5, 1, 'Kluwih', 0, '', '', '', NULL, NULL),
(6, 1, 'Sumber', 0, '', '', '', NULL, NULL),
(7, 1, 'Sumber Gamol', 0, '', '', '', NULL, NULL),
(8, 1, 'Gamol', 0, '', '', '', NULL, NULL),
(9, 1, 'Ngaran', 0, '', '', '', NULL, NULL),
(10, 1, 'Pereng Kembang', 0, '', '', '', NULL, NULL),
(11, 1, 'Pereng Dawe', 0, '', '', '', NULL, NULL),
(12, 1, 'Jatisawit', 0, '', '', '', NULL, NULL),
(13, 1, 'Jitengan', 0, '', '', '', NULL, NULL),
(14, 1, 'Sembung', 0, '', '', '', NULL, NULL),
(15, 1, 'Temuwuh Kidul', 0, '', '', '', NULL, NULL),
(16, 1, 'Temuwuh Lor', 0, '', '', '', NULL, NULL),
(17, 1, 'Gejawan Kulon', 0, '', '', '', NULL, NULL),
(18, 1, 'Gejawan Lor', 0, '', '', '', NULL, NULL),
(19, 2, 'Mejing Lor', 0, '', '', '', NULL, NULL),
(20, 2, 'Mejing Wetan', 0, '', '', '', NULL, NULL),
(21, 2, 'Mejing Kidul', 0, '', '', '', NULL, NULL),
(22, 2, 'Gamping Lor', 0, '', '', '', NULL, NULL),
(23, 2, 'Gamping Tengah', 0, '', '', '', NULL, NULL),
(24, 2, 'Gamping Kidul', 0, '', '', '', NULL, NULL),
(25, 2, 'Patukan', 0, '', '', '', NULL, NULL),
(26, 2, 'Bodeh', 0, '', '', '', NULL, NULL),
(27, 2, 'Tlogo', 0, '', '', '', NULL, NULL),
(28, 2, 'Depok', 0, '', '', '', NULL, NULL),
(29, 2, 'Kalimanjung', 0, '', '', '', NULL, NULL),
(30, 2, 'Mancasan', 0, '', '', '', NULL, NULL),
(31, 2, 'Watulangkah', 0, '', '', '', NULL, NULL),
(32, 3, 'Banyumeneng', 0, '', '', '', NULL, NULL),
(33, 3, 'Kanoman', 0, '', '', '', NULL, NULL),
(34, 3, 'Dukuh', 0, '', '', '', NULL, NULL),
(35, 3, 'Somodaran', 0, '', '', '', NULL, NULL),
(36, 3, 'Kaliabu', 0, '', '', '', NULL, NULL),
(37, 3, 'Dowangan', 0, '', '', '', NULL, NULL),
(38, 3, 'Sukunan', 0, '', '', '', NULL, NULL),
(39, 3, 'Modinan', 0, '', '', '', NULL, NULL),
(40, 4, 'Kajor', 0, '', '', '', NULL, NULL),
(41, 4, 'Kwarasan', 0, '', '', '', NULL, NULL),
(42, 4, 'Karang Tengah', 0, '', '', '', NULL, NULL),
(43, 4, 'Ponowaren', 0, '', '', '', NULL, NULL),
(44, 4, 'Nogosaren', 0, '', '', '', NULL, NULL),
(45, 4, 'Cambahan', 0, '', '', '', NULL, NULL),
(46, 4, 'Sawahan', 0, '', '', '', NULL, NULL),
(47, 4, 'Mlangi', 0, '', '', '', NULL, NULL),
(48, 5, 'Kronggahan I', 0, '', '', '', NULL, NULL),
(49, 5, 'Kronggahan II', 0, '', '', '', NULL, NULL),
(50, 5, 'Ngawen', 0, '', '', '', NULL, NULL),
(51, 5, 'Mayangan', 0, '', '', '', NULL, NULL),
(52, 5, 'Trini', 0, '', '', '', NULL, NULL),
(53, 5, 'Baturan', 0, '', '', '', NULL, NULL),
(54, 5, 'Jambon', 0, '', '', '', NULL, NULL),
(55, 5, 'Bedog', 0, '', '', '', NULL, NULL),
(56, 5, 'Salakan', 0, '', '', '', NULL, NULL),
(57, 5, 'Nusupan', 0, '', '', '', NULL, NULL),
(58, 5, 'Biru ', 0, '', '', '', NULL, NULL),
(59, 5, 'Panggungan', 0, '', '', '', NULL, NULL),
(60, 6, 'Kwangon ', 0, '', '', '', NULL, NULL),
(61, 6, 'Pare Dukuh', 0, '', '', '', NULL, NULL),
(62, 6, 'Pare Tengah', 0, '', '', '', NULL, NULL),
(63, 6, 'Pare Kulon', 0, '', '', '', NULL, NULL),
(64, 6, 'Bantut', 0, '', '', '', NULL, NULL),
(65, 6, 'Jering VI', 0, '', '', '', NULL, NULL),
(66, 6, 'Kleben', 0, '', '', '', NULL, NULL),
(67, 6, 'Jering VIII', 0, '', '', '', NULL, NULL),
(68, 6, 'Kliwonan', 0, '', '', '', NULL, NULL),
(69, 6, 'Ganjuran', 0, '', '', '', NULL, NULL),
(70, 6, 'Sangonan', 0, '', '', '', NULL, NULL),
(71, 6, 'Kemirisewu', 0, '', '', '', NULL, NULL),
(72, 6, 'Dongkelan', 0, '', '', '', NULL, NULL),
(73, 7, 'Sokonilo', 0, '', '', '', NULL, NULL),
(74, 7, 'Berjo Kulon', 0, '', '', '', NULL, NULL),
(75, 7, 'Berjo Kidul', 0, '', '', '', NULL, NULL),
(76, 7, 'Berjo Wetan', 0, '', '', '', NULL, NULL),
(77, 7, 'Ngabangan', 0, '', '', '', NULL, NULL),
(78, 7, 'Jowah', 0, '', '', '', NULL, NULL),
(79, 7, 'Pandean', 0, '', '', '', NULL, NULL),
(80, 7, 'Kunden', 0, '', '', '', NULL, NULL),
(81, 7, 'Gathak', 0, '', '', '', NULL, NULL),
(82, 7, 'Dadapan', 0, '', '', '', NULL, NULL),
(83, 7, 'Serangan', 0, '', '', '', NULL, NULL),
(84, 7, 'Mertosutan', 0, '', '', '', NULL, NULL),
(85, 7, 'Tebon', 0, '', '', '', NULL, NULL),
(86, 7, 'Kragilan', 0, '', '', '', NULL, NULL),
(87, 7, 'Krajan', 0, '', '', '', NULL, NULL),
(88, 8, 'Pirak Bulus', 0, '', '', '', NULL, NULL),
(89, 8, 'Brongkol', 0, '', '', '', NULL, NULL),
(90, 8, 'Sembuh Lor', 0, '', '', '', NULL, NULL),
(91, 8, 'Sembuh Kidul', 0, '', '', '', NULL, NULL),
(92, 8, 'Gancahan V', 0, '', '', '', NULL, NULL),
(93, 8, 'Gancahan VI', 0, '', '', '', NULL, NULL),
(94, 8, 'Gancahan VII', 0, '', '', '', NULL, NULL),
(95, 8, 'Gancahan VIII', 0, '', '', '', NULL, NULL),
(96, 9, 'Senuko', 0, '', '', '', NULL, NULL),
(97, 9, 'Sentul Geneng', 0, '', '', '', NULL, NULL),
(98, 9, 'Gentingan', 0, '', '', '', NULL, NULL),
(99, 9, 'Godean', 0, '', '', '', NULL, NULL),
(100, 9, 'Jowah', 0, '', '', '', NULL, NULL),
(101, 9, 'Kramen', 0, '', '', '', NULL, NULL),
(102, 9, 'Bendungan', 0, '', '', '', NULL, NULL),
(103, 9, 'Genitem', 0, '', '', '', NULL, NULL),
(104, 10, 'Jethak I', 0, '', '', '', NULL, NULL),
(105, 10, 'Jethak II', 0, '', '', '', NULL, NULL),
(106, 10, 'Klajuran', 0, '', '', '', NULL, NULL),
(107, 10, 'Semarangan', 0, '', '', '', NULL, NULL),
(108, 10, 'Ngawen', 0, '', '', '', NULL, NULL),
(109, 10, 'Wirokraman', 0, '', '', '', NULL, NULL),
(110, 10, 'Sorolaten', 0, '', '', '', NULL, NULL),
(111, 10, 'Prenggan', 0, '', '', '', NULL, NULL),
(112, 10, 'Rewulu Wetan', 0, '', '', '', NULL, NULL),
(113, 10, 'Rewulu Kulon', 0, '', '', '', NULL, NULL),
(114, 10, 'Sembuh Wetan', 0, '', '', '', NULL, NULL),
(115, 10, 'Nogosari', 0, '', '', '', NULL, NULL),
(116, 10, 'Dukuh', 0, '', '', '', NULL, NULL),
(117, 11, 'Cokrokonteng', 0, '', '', '', NULL, NULL),
(118, 11, 'Bantulan', 0, '', '', '', NULL, NULL),
(119, 11, 'Beji ', 0, '', '', '', NULL, NULL),
(120, 11, 'Cokrobedog', 0, '', '', '', NULL, NULL),
(121, 11, 'Kramat', 0, '', '', '', NULL, NULL),
(122, 11, 'Potrowangsan', 0, '', '', '', NULL, NULL),
(123, 11, 'Tangkilan', 0, '', '', '', NULL, NULL),
(124, 11, 'Sebaran', 0, '', '', '', NULL, NULL),
(125, 12, 'Simping', 0, '', '', '', NULL, NULL),
(126, 12, 'Beluran', 0, '', '', '', NULL, NULL),
(127, 12, 'Karanglo', 0, '', '', '', NULL, NULL),
(128, 12, 'Dukuh', 0, '', '', '', NULL, NULL),
(129, 12, 'Tegalan', 0, '', '', '', NULL, NULL),
(130, 12, 'Karakan', 0, '', '', '', NULL, NULL),
(131, 12, 'Krandon', 0, '', '', '', NULL, NULL),
(132, 12, 'Pete /', 0, '', '', '', NULL, NULL),
(133, 12, 'Sawahan', 0, '', '', '', NULL, NULL),
(134, 12, 'Ngrenak Kidul', 0, '', '', '', NULL, NULL),
(135, 12, 'Ngrenak Lor', 0, '', '', '', NULL, NULL),
(136, 13, 'Gamplong I', 0, '', '', '', NULL, NULL),
(137, 13, 'Gamplong II', 0, '', '', '', NULL, NULL),
(138, 13, 'Gamplong III', 0, '', '', '', NULL, NULL),
(139, 13, 'Gamplong IV', 0, '', '', '', NULL, NULL),
(140, 13, 'Gamplong V', 0, '', '', '', NULL, NULL),
(141, 13, 'Goser', 0, '', '', '', NULL, NULL),
(142, 13, 'Moyudan', 0, '', '', '', NULL, NULL),
(143, 13, 'Barepan', 0, '', '', '', NULL, NULL),
(144, 13, 'Dagen', 0, '', '', '', NULL, NULL),
(145, 13, 'Kembangan I', 0, '', '', '', NULL, NULL),
(146, 13, 'Kembangan II', 0, '', '', '', NULL, NULL),
(147, 13, 'Betakan', 0, '', '', '', NULL, NULL),
(148, 13, 'Saren', 0, '', '', '', NULL, NULL),
(149, 13, 'Klampis', 0, '', '', '', NULL, NULL),
(150, 13, 'Sangubanyu', 0, '', '', '', NULL, NULL),
(151, 14, 'Tegalrejo', 0, '', '', '', NULL, NULL),
(152, 14, 'Klisat', 0, '', '', '', NULL, NULL),
(153, 14, 'Nasri', 0, '', '', '', NULL, NULL),
(154, 14, 'Semingin', 0, '', '', '', NULL, NULL),
(155, 14, 'Tumut', 0, '', '', '', NULL, NULL),
(156, 14, 'Menulis', 0, '', '', '', NULL, NULL),
(157, 14, 'Tiwir', 0, '', '', '', NULL, NULL),
(158, 14, 'Blendung', 0, '', '', '', NULL, NULL),
(159, 14, 'Bendosari', 0, '', '', '', NULL, NULL),
(160, 14, 'Ngaglik', 0, '', '', '', NULL, NULL),
(161, 14, 'Gesikan', 0, '', '', '', NULL, NULL),
(162, 14, 'Nglahar', 0, '', '', '', NULL, NULL),
(163, 14, 'Sombangan', 0, '', '', '', NULL, NULL),
(164, 15, 'Celungan', 0, '', '', '', NULL, NULL),
(165, 15, 'Kaliurang', 0, '', '', '', NULL, NULL),
(166, 15, 'Kruwet', 0, '', '', '', NULL, NULL),
(167, 15, 'Sumberan', 0, '', '', '', NULL, NULL),
(168, 15, 'Ngento - ento', 0, '', '', '', NULL, NULL),
(169, 15, 'Nulisan', 0, '', '', '', NULL, NULL),
(170, 15, 'Ponggok', 0, '', '', '', NULL, NULL),
(171, 15, 'Kedung Banteng', 0, '', '', '', NULL, NULL),
(172, 15, 'Kaliduren I', 0, '', '', '', NULL, NULL),
(173, 15, 'Pendulan', 0, '', '', '', NULL, NULL),
(174, 15, 'Kaliduren II', 0, '', '', '', NULL, NULL),
(175, 15, 'Jowahan', 0, '', '', '', NULL, NULL),
(176, 15, 'Karang', 0, '', '', '', NULL, NULL),
(177, 15, 'Mergan', 0, '', '', '', NULL, NULL),
(178, 15, 'Pajangan', 0, '', '', '', NULL, NULL),
(179, 15, 'Pucunganom', 0, '', '', '', NULL, NULL),
(180, 15, 'Turganen', 0, '', '', '', NULL, NULL),
(181, 15, 'Gatak', 0, '', '', '', NULL, NULL),
(182, 15, 'Malangan', 0, '', '', '', NULL, NULL),
(183, 15, 'Gedongan', 0, '', '', '', NULL, NULL),
(184, 16, 'Jetis', 0, '', '', '', NULL, NULL),
(185, 16, 'Puluhan', 0, '', '', '', NULL, NULL),
(186, 16, 'Pingitan', 0, '', '', '', NULL, NULL),
(187, 16, 'Jitar', 0, '', '', '', NULL, NULL),
(188, 16, 'Jitar Dukuh', 0, '', '', '', NULL, NULL),
(189, 16, 'Jitar Ngemplak', 0, '', '', '', NULL, NULL),
(190, 16, 'Karangajir', 0, '', '', '', NULL, NULL),
(191, 16, 'Sejati Pasar', 0, '', '', '', NULL, NULL),
(192, 16, 'Sejati Deso', 0, '', '', '', NULL, NULL),
(193, 16, 'Sejati Dukuh', 0, '', '', '', NULL, NULL),
(194, 16, 'Pakelan', 0, '', '', '', NULL, NULL),
(195, 16, 'Setran', 0, '', '', '', NULL, NULL),
(196, 16, 'Donon', 0, '', '', '', NULL, NULL),
(197, 16, 'Tegal Donon', 0, '', '', '', NULL, NULL),
(198, 16, 'Sermo', 0, '', '', '', NULL, NULL),
(199, 17, 'Daratan I', 0, '', '', '', NULL, NULL),
(200, 17, 'Daratan II', 0, '', '', '', NULL, NULL),
(201, 17, 'Daratan III', 0, '', '', '', NULL, NULL),
(202, 17, 'Soromintan', 0, '', '', '', NULL, NULL),
(203, 17, 'Toglengan', 0, '', '', '', NULL, NULL),
(204, 17, 'Sanan', 0, '', '', '', NULL, NULL),
(205, 17, 'Ngijon', 0, '', '', '', NULL, NULL),
(206, 17, 'Singojayan', 0, '', '', '', NULL, NULL),
(207, 17, 'Tinggen', 0, '', '', '', NULL, NULL),
(208, 18, 'Prapak Kulon', 0, '', '', '', NULL, NULL),
(209, 18, 'Mergan', 0, '', '', '', NULL, NULL),
(210, 18, 'Prapak Wetan', 0, '', '', '', NULL, NULL),
(211, 18, 'Sembuhan Kidul', 0, '', '', '', NULL, NULL),
(212, 18, 'Sembuhan Lor', 0, '', '', '', NULL, NULL),
(213, 18, 'Sumber', 0, '', '', '', NULL, NULL),
(214, 18, 'Slarongan', 0, '', '', '', NULL, NULL),
(215, 18, 'Blimbingan', 0, '', '', '', NULL, NULL),
(216, 18, 'Dondongan', 0, '', '', '', NULL, NULL),
(217, 18, 'Klepu Kidul', 0, '', '', '', NULL, NULL),
(218, 18, 'Klepu Lor', 0, '', '', '', NULL, NULL),
(219, 18, 'Jetis', 0, '', '', '', NULL, NULL),
(220, 18, 'Kwayuhan', 0, '', '', '', NULL, NULL),
(221, 18, 'Krompakan', 0, '', '', '', NULL, NULL),
(222, 18, 'Sragan Banaran', 0, '', '', '', NULL, NULL),
(223, 18, 'Diro /', 0, '', '', '', NULL, NULL),
(224, 19, 'Kisik', 0, '', '', '', NULL, NULL),
(225, 19, 'Minggir II', 0, '', '', '', NULL, NULL),
(226, 19, 'Minggir III', 0, '', '', '', NULL, NULL),
(227, 19, 'Pojok IV', 0, '', '', '', NULL, NULL),
(228, 19, 'Pojok V', 0, '', '', '', NULL, NULL),
(229, 19, 'Watugajah', 0, '', '', '', NULL, NULL),
(230, 19, 'Bontitan', 0, '', '', '', NULL, NULL),
(231, 19, 'Brajan', 0, '', '', '', NULL, NULL),
(232, 19, 'Kliran', 0, '', '', '', NULL, NULL),
(233, 19, 'Bekelan', 0, '', '', '', NULL, NULL),
(234, 19, 'Tengahan XI', 0, '', '', '', NULL, NULL),
(235, 19, 'Tengahan XII', 0, '', '', '', NULL, NULL),
(236, 19, 'Dukuhan', 0, '', '', '', NULL, NULL),
(237, 19, 'Nanggulan', 0, '', '', '', NULL, NULL),
(238, 19, 'Jomboran', 0, '', '', '', NULL, NULL),
(239, 20, 'Pranan', 0, '', '', '', NULL, NULL),
(240, 20, 'Jetis Depok', 0, '', '', '', NULL, NULL),
(241, 20, 'Jogorejo', 0, '', '', '', NULL, NULL),
(242, 20, 'Badran Kidul', 0, '', '', '', NULL, NULL),
(243, 20, 'Dalangan', 0, '', '', '', NULL, NULL),
(244, 20, 'Plembon', 0, '', '', '', NULL, NULL),
(245, 20, 'Bandan', 0, '', '', '', NULL, NULL),
(246, 20, 'Parakan Kulon', 0, '', '', '', NULL, NULL),
(247, 20, 'Parakan Wetan', 0, '', '', '', NULL, NULL),
(248, 20, 'Gatak', 0, '', '', '', NULL, NULL),
(249, 20, 'Sutan', 0, '', '', '', NULL, NULL),
(250, 20, 'Denokan', 0, '', '', '', NULL, NULL),
(251, 21, 'Jonggrangan', 0, '', '', '', NULL, NULL),
(252, 21, 'Ngepringan II', 0, '', '', '', NULL, NULL),
(253, 21, 'Nyangkringan', 0, '', '', '', NULL, NULL),
(254, 21, 'Ngepringan IV', 0, '', '', '', NULL, NULL),
(255, 21, 'Sunggingan', 0, '', '', '', NULL, NULL),
(256, 21, 'Kedungprahu', 0, '', '', '', NULL, NULL),
(257, 21, 'Nglengking', 0, '', '', '', NULL, NULL),
(258, 21, 'Butuhan', 0, '', '', '', NULL, NULL),
(259, 21, 'Botokan', 0, '', '', '', NULL, NULL),
(260, 21, 'Jaten', 0, '', '', '', NULL, NULL),
(261, 21, 'Sidomulyo', 0, '', '', '', NULL, NULL),
(262, 21, 'Tobayan', 0, '', '', '', NULL, NULL),
(263, 21, 'Padon', 0, '', '', '', NULL, NULL),
(264, 21, 'Ngaranan', 0, '', '', '', NULL, NULL),
(265, 21, 'Ngagul Agulan', 0, '', '', '', NULL, NULL),
(266, 21, 'Soronandan', 0, '', '', '', NULL, NULL),
(267, 22, 'Klinyo', 0, '', '', '', NULL, NULL),
(268, 22, 'Klangkapan I', 0, '', '', '', NULL, NULL),
(269, 22, 'Klangkapan II', 0, '', '', '', NULL, NULL),
(270, 22, 'Klaci I', 0, '', '', '', NULL, NULL),
(271, 22, 'Klaci II', 0, '', '', '', NULL, NULL),
(272, 22, 'Klaci III', 0, '', '', '', NULL, NULL),
(273, 22, 'Barak I', 0, '', '', '', NULL, NULL),
(274, 22, 'Barak II', 0, '', '', '', NULL, NULL),
(275, 22, 'Cibuk Lor I', 0, '', '', '', NULL, NULL),
(276, 22, 'Cibuk Lor II', 0, '', '', '', NULL, NULL),
(277, 22, 'Cibuk Kidul', 0, '', '', '', NULL, NULL),
(278, 22, 'Mandungan I', 0, '', '', '', NULL, NULL),
(279, 22, 'Mandungan II', 0, '', '', '', NULL, NULL),
(280, 22, 'Ngentak', 0, '', '', '', NULL, NULL),
(281, 23, 'Beran', 0, '', '', '', NULL, NULL),
(282, 23, 'Kandangan', 0, '', '', '', NULL, NULL),
(283, 23, 'Kurahan III', 0, '', '', '', NULL, NULL),
(284, 23, 'Kurahan IV', 0, '', '', '', NULL, NULL),
(285, 23, 'Pendekan', 0, '', '', '', NULL, NULL),
(286, 23, 'Jlegongan', 0, '', '', '', NULL, NULL),
(287, 23, 'Jagalan', 0, '', '', '', NULL, NULL),
(288, 23, 'Japanan', 0, '', '', '', NULL, NULL),
(289, 23, 'Grogol', 0, '', '', '', NULL, NULL),
(290, 23, 'Kadipiro', 0, '', '', '', NULL, NULL),
(291, 23, 'Mranggen', 0, '', '', '', NULL, NULL),
(292, 23, 'Druju', 0, '', '', '', NULL, NULL),
(293, 23, 'Pete /', 0, '', '', '', NULL, NULL),
(294, 23, 'Kasuran', 0, '', '', '', NULL, NULL),
(295, 23, 'Terwilen', 0, '', '', '', NULL, NULL),
(296, 23, 'Tegalweru', 0, '', '', '', NULL, NULL),
(297, 25, 'Susukan I', 0, '', '', '', NULL, NULL),
(298, 25, 'Susukan II', 0, '', '', '', NULL, NULL),
(299, 25, 'Susukan III', 0, '', '', '', NULL, NULL),
(300, 25, 'somokaton', 0, '', '', '', NULL, NULL),
(301, 25, 'Ngaran', 0, '', '', '', NULL, NULL),
(302, 25, 'Planggok', 0, '', '', '', NULL, NULL),
(303, 25, 'Grajegan', 0, '', '', '', NULL, NULL),
(304, 25, 'Bolu /', 0, '', '', '', NULL, NULL),
(305, 25, 'Nyamplung', 0, '', '', '', NULL, NULL),
(306, 25, 'Seyegan', 0, '', '', '', NULL, NULL),
(307, 25, 'Sonoharjo', 0, '', '', '', NULL, NULL),
(308, 25, 'Bantulan', 0, '', '', '', NULL, NULL),
(309, 24, 'Sawahan', 0, '', '', '', NULL, NULL),
(310, 24, 'Jumeneng', 0, '', '', '', NULL, NULL),
(311, 24, 'Dukuh Gerjen', 0, '', '', '', NULL, NULL),
(312, 24, 'Ngemplak', 0, '', '', '', NULL, NULL),
(313, 24, 'Kamal', 0, '', '', '', NULL, NULL),
(314, 24, 'Sompokan', 0, '', '', '', NULL, NULL),
(315, 24, 'Kregolan', 0, '', '', '', NULL, NULL),
(316, 24, 'Mangsel', 0, '', '', '', NULL, NULL),
(317, 24, 'Daplokan', 0, '', '', '', NULL, NULL),
(318, 24, 'Kasuran', 0, '', '', '', NULL, NULL),
(319, 24, 'Mriyan', 0, '', '', '', NULL, NULL),
(320, 24, 'Jingin', 0, '', '', '', NULL, NULL),
(321, 24, 'Jamblangan', 0, '', '', '', NULL, NULL),
(322, 26, 'Watukarung', 0, '', '', '', NULL, NULL),
(323, 26, 'Dukuh', 0, '', '', '', NULL, NULL),
(324, 26, 'Banyu Urip', 0, '', '', '', NULL, NULL),
(325, 26, 'Beteng', 0, '', '', '', NULL, NULL),
(326, 26, 'Somorai', 0, '', '', '', NULL, NULL),
(327, 26, 'Tegalgenten', 0, '', '', '', NULL, NULL),
(328, 26, 'Nganggrung', 0, '', '', '', NULL, NULL),
(329, 26, 'Gondang', 0, '', '', '', NULL, NULL),
(330, 26, 'Krapyak', 0, '', '', '', NULL, NULL),
(331, 26, 'Barepan', 0, '', '', '', NULL, NULL),
(332, 26, 'Klawisan', 0, '', '', '', NULL, NULL),
(333, 26, 'Nglino', 0, '', '', '', NULL, NULL),
(334, 27, 'Jetis', 0, '', '', '', NULL, NULL),
(335, 27, 'Gedongan', 0, '', '', '', NULL, NULL),
(336, 27, 'Ngaglik', 0, '', '', '', NULL, NULL),
(337, 27, 'Kragilan', 0, '', '', '', NULL, NULL),
(338, 27, 'Rogoyudan', 0, '', '', '', NULL, NULL),
(339, 27, 'Patran', 0, '', '', '', NULL, NULL),
(340, 27, 'Kutuasem', 0, '', '', '', NULL, NULL),
(341, 27, 'Jombor Lor', 0, '', '', '', NULL, NULL),
(342, 27, 'Jombor Kidul', 0, '', '', '', NULL, NULL),
(343, 27, 'Kutu Tegal', 0, '', '', '', NULL, NULL),
(344, 27, 'Kutu Dukuh', 0, '', '', '', NULL, NULL),
(345, 27, 'Mesan Mblunyah', 0, '', '', '', NULL, NULL),
(346, 27, 'Karangjati', 0, '', '', '', NULL, NULL),
(347, 27, 'Gemawang', 0, '', '', '', NULL, NULL),
(348, 27, 'Pogung Lor', 0, '', '', '', NULL, NULL),
(349, 27, 'Pogung Kidul', 0, '', '', '', NULL, NULL),
(350, 27, 'Sendowo', 0, '', '', '', NULL, NULL),
(351, 27, 'Purwosari', 0, '', '', '', NULL, NULL),
(352, 28, 'Mlati Krajan', 0, '', '', '', NULL, NULL),
(353, 28, 'Mlati Dukuh', 0, '', '', '', NULL, NULL),
(354, 28, 'Ngemplak Nganti', 0, '', '', '', NULL, NULL),
(355, 28, 'Mraen', 0, '', '', '', NULL, NULL),
(356, 28, 'Karanggeneng', 0, '', '', '', NULL, NULL),
(357, 28, 'Banaran', 0, '', '', '', NULL, NULL),
(358, 28, 'Mulungan Wetan', 0, '', '', '', NULL, NULL),
(359, 28, 'Mlati Glondong', 0, '', '', '', NULL, NULL),
(360, 28, 'Jatirejo', 0, '', '', '', NULL, NULL),
(361, 28, 'Jongke Tengah', 0, '', '', '', NULL, NULL),
(362, 28, 'Jongke Lor', 0, '', '', '', NULL, NULL),
(363, 28, 'Jomblang', 0, '', '', '', NULL, NULL),
(364, 28, 'Jaten', 0, '', '', '', NULL, NULL),
(365, 28, 'Duwet', 0, '', '', '', NULL, NULL),
(366, 29, 'Cebongan Kidul', 0, '', '', '', NULL, NULL),
(367, 29, 'Cebongan Lor', 0, '', '', '', NULL, NULL),
(368, 29, 'Toragan', 0, '', '', '', NULL, NULL),
(369, 29, 'Gandekan', 0, '', '', '', NULL, NULL),
(370, 29, 'Kalongan', 0, '', '', '', NULL, NULL),
(371, 29, 'Sanggrahan', 0, '', '', '', NULL, NULL),
(372, 29, 'Plaosan', 0, '', '', '', NULL, NULL),
(373, 29, 'Bolawen', 0, '', '', '', NULL, NULL),
(374, 29, 'Karanglo', 0, '', '', '', NULL, NULL),
(375, 29, 'Karang Bajang', 0, '', '', '', NULL, NULL),
(376, 29, 'Nglarang', 0, '', '', '', NULL, NULL),
(377, 29, 'Nambongan', 0, '', '', '', NULL, NULL),
(378, 30, 'Pundong I', 0, '', '', '', NULL, NULL),
(379, 30, 'Pundong II', 0, '', '', '', NULL, NULL),
(380, 30, 'Pundong III', 0, '', '', '', NULL, NULL),
(381, 30, 'Jembangan', 0, '', '', '', NULL, NULL),
(382, 30, 'Pundong V', 0, '', '', '', NULL, NULL),
(383, 30, 'Janturan', 0, '', '', '', NULL, NULL),
(384, 30, 'Sanggrahan', 0, '', '', '', NULL, NULL),
(385, 30, 'Kwaden', 0, '', '', '', NULL, NULL),
(386, 30, 'Sendari', 0, '', '', '', NULL, NULL),
(387, 30, 'Ketingan', 0, '', '', '', NULL, NULL),
(388, 30, 'Gombang', 0, '', '', '', NULL, NULL),
(389, 30, 'Rajeg Lor', 0, '', '', '', NULL, NULL),
(390, 30, 'Rajeg Wetan', 0, '', '', '', NULL, NULL),
(391, 30, 'Rajeg Ngemplak', 0, '', '', '', NULL, NULL),
(392, 30, 'Jetis', 0, '', '', '', NULL, NULL),
(393, 31, 'Kebonan', 0, '', '', '', NULL, NULL),
(394, 31, 'Burikan', 0, '', '', '', NULL, NULL),
(395, 31, 'Warak Lor', 0, '', '', '', NULL, NULL),
(396, 31, 'Warak Kidul', 0, '', '', '', NULL, NULL),
(397, 31, 'Jodak', 0, '', '', '', NULL, NULL),
(398, 31, 'Gabahan', 0, '', '', '', NULL, NULL),
(399, 31, 'Konteng', 0, '', '', '', NULL, NULL),
(400, 31, 'Jumeneng Lor', 0, '', '', '', NULL, NULL),
(401, 31, 'Jumeneng Kidul', 0, '', '', '', NULL, NULL),
(402, 31, 'Sayidan', 0, '', '', '', NULL, NULL),
(403, 31, 'Bakalan', 0, '', '', '', NULL, NULL),
(404, 31, 'Brengosan', 0, '', '', '', NULL, NULL),
(405, 31, 'Cabakan', 0, '', '', '', NULL, NULL),
(406, 31, 'Tokerten', 0, '', '', '', NULL, NULL),
(407, 31, 'Bedingin', 0, '', '', '', NULL, NULL),
(408, 32, 'Manggung', 0, '', '', '', NULL, NULL),
(409, 32, 'karangwuni', 0, '', '', '', NULL, NULL),
(410, 32, 'Kocoran', 0, '', '', '', NULL, NULL),
(411, 32, 'Blimbingsari', 0, '', '', '', NULL, NULL),
(412, 32, 'Sagan', 0, '', '', '', NULL, NULL),
(413, 32, 'Samirono', 0, '', '', '', NULL, NULL),
(414, 32, 'Karangmalang', 0, '', '', '', NULL, NULL),
(415, 32, 'Karanggayam', 0, '', '', '', NULL, NULL),
(416, 32, 'Mrican', 0, '', '', '', NULL, NULL),
(417, 32, 'Santren', 0, '', '', '', NULL, NULL),
(418, 32, 'Papringan', 0, '', '', '', NULL, NULL),
(419, 32, 'Ambarukmo', 0, '', '', '', NULL, NULL),
(420, 32, 'Gowok', 0, '', '', '', NULL, NULL),
(421, 32, 'Nologaten', 0, '', '', '', NULL, NULL),
(422, 32, 'Tempel', 0, '', '', '', NULL, NULL),
(423, 32, 'Janti', 0, '', '', '', NULL, NULL),
(424, 32, 'Ngentak', 0, '', '', '', NULL, NULL),
(425, 32, 'Tambakbayan', 0, '', '', '', NULL, NULL),
(426, 32, 'Kledokan', 0, '', '', '', NULL, NULL),
(427, 32, 'Seturan', 0, '', '', '', NULL, NULL),
(428, 33, 'Denokan', 0, '', '', '', NULL, NULL),
(429, 33, 'Krodan', 0, '', '', '', NULL, NULL),
(430, 33, 'Jenengan', 0, '', '', '', NULL, NULL),
(431, 33, 'Pugeran', 0, '', '', '', NULL, NULL),
(432, 33, 'Sanggrahan', 0, '', '', '', NULL, NULL),
(433, 33, 'Naggulan', 0, '', '', '', NULL, NULL),
(434, 33, 'Demangan', 0, '', '', '', NULL, NULL),
(435, 33, 'Corongan', 0, '', '', '', NULL, NULL),
(436, 33, 'Nayan', 0, '', '', '', NULL, NULL),
(437, 33, 'Kalongan', 0, '', '', '', NULL, NULL),
(438, 33, 'Tajem', 0, '', '', '', NULL, NULL),
(439, 33, 'Banjeng', 0, '', '', '', NULL, NULL),
(440, 33, 'Sambego', 0, '', '', '', NULL, NULL),
(441, 33, 'Setan', 0, '', '', '', NULL, NULL),
(442, 33, 'Meguwo', 0, '', '', '', NULL, NULL),
(443, 33, 'Ringinsari', 0, '', '', '', NULL, NULL),
(444, 33, 'Sambilegi Lor', 0, '', '', '', NULL, NULL),
(445, 33, 'Sambilegi Kidul', 0, '', '', '', NULL, NULL),
(446, 33, 'Karangploso', 0, '', '', '', NULL, NULL),
(447, 33, 'Kembang', 0, '', '', '', NULL, NULL),
(448, 34, 'Tiyasan', 0, '', '', '', NULL, NULL),
(449, 34, 'Manukan', 0, '', '', '', NULL, NULL),
(450, 34, 'Pondok', 0, '', '', '', NULL, NULL),
(451, 34, 'Sanggrahan', 0, '', '', '', NULL, NULL),
(452, 34, 'Gempol', 0, '', '', '', NULL, NULL),
(453, 34, 'Dero /', 0, '', '', '', NULL, NULL),
(454, 34, 'Ngringin', 0, '', '', '', NULL, NULL),
(455, 34, 'Ngropoh', 0, '', '', '', NULL, NULL),
(456, 34, 'Dabag', 0, '', '', '', NULL, NULL),
(457, 34, 'Gejayan', 0, '', '', '', NULL, NULL),
(458, 34, 'Kaliwaru', 0, '', '', '', NULL, NULL),
(459, 34, 'Soropadan', 0, '', '', '', NULL, NULL),
(460, 34, 'Pringwulung', 0, '', '', '', NULL, NULL),
(461, 34, 'Kayen', 0, '', '', '', NULL, NULL),
(462, 34, 'Kentungan', 0, '', '', '', NULL, NULL),
(463, 34, 'Pikgondang', 0, '', '', '', NULL, NULL),
(464, 34, 'Gandok', 0, '', '', '', NULL, NULL),
(465, 34, 'Joho /', 0, '', '', '', NULL, NULL),
(466, 35, 'Cepor', 0, '', '', '', NULL, NULL),
(467, 35, 'Dawukan', 0, '', '', '', NULL, NULL),
(468, 35, 'Gandu', 0, '', '', '', NULL, NULL),
(469, 35, 'Minggiran', 0, '', '', '', NULL, NULL),
(470, 35, 'Sribit', 0, '', '', '', NULL, NULL),
(471, 35, 'Sendang', 0, '', '', '', NULL, NULL),
(472, 35, 'Klakah', 0, '', '', '', NULL, NULL),
(473, 35, 'Kemasan', 0, '', '', '', NULL, NULL),
(474, 35, 'Munggon', 0, '', '', '', NULL, NULL),
(475, 35, 'Sekarsuli', 0, '', '', '', NULL, NULL),
(476, 35, 'Karang Ngasem', 0, '', '', '', NULL, NULL),
(477, 35, 'Klodangan', 0, '', '', '', NULL, NULL),
(478, 35, 'Gamelan', 0, '', '', '', NULL, NULL),
(479, 35, 'Jetak', 0, '', '', '', NULL, NULL),
(480, 35, 'Tampungan', 0, '', '', '', NULL, NULL),
(481, 35, 'Kadipolo', 0, '', '', '', NULL, NULL),
(482, 35, 'Noyokerten', 0, '', '', '', NULL, NULL),
(483, 35, 'Maredan', 0, '', '', '', NULL, NULL),
(484, 36, 'Jagalan', 0, '', '', '', NULL, NULL),
(485, 36, 'Tlogowono', 0, '', '', '', NULL, NULL),
(486, 36, 'Blendangan', 0, '', '', '', NULL, NULL),
(487, 36, 'Berbah', 0, '', '', '', NULL, NULL),
(488, 36, 'Krikilan', 0, '', '', '', NULL, NULL),
(489, 36, 'Kadisono', 0, '', '', '', NULL, NULL),
(490, 36, 'Kuton', 0, '', '', '', NULL, NULL),
(491, 36, 'Tegalsari', 0, '', '', '', NULL, NULL),
(492, 36, 'Pendem', 0, '', '', '', NULL, NULL),
(493, 36, 'Kuncen', 0, '', '', '', NULL, NULL),
(494, 36, 'Sompilan', 0, '', '', '', NULL, NULL),
(495, 36, 'Karang Wetan', 0, '', '', '', NULL, NULL),
(496, 36, 'Candirejo', 0, '', '', '', NULL, NULL),
(497, 36, 'Semoyo', 0, '', '', '', NULL, NULL),
(498, 37, 'Mangunan', 0, '', '', '', NULL, NULL),
(499, 37, 'Kalipentung', 0, '', '', '', NULL, NULL),
(500, 37, 'Teguhan', 0, '', '', '', NULL, NULL),
(501, 37, 'Jebresan', 0, '', '', '', NULL, NULL),
(502, 37, 'Tanjung', 0, '', '', '', NULL, NULL),
(503, 37, 'Pondok', 0, '', '', '', NULL, NULL),
(504, 37, 'Karang', 0, '', '', '', NULL, NULL),
(505, 37, 'Sumber Lor', 0, '', '', '', NULL, NULL),
(506, 37, 'Sumber Kulon', 0, '', '', '', NULL, NULL),
(507, 37, 'Sumber Kidul', 0, '', '', '', NULL, NULL),
(508, 37, 'Berbah', 0, '', '', '', NULL, NULL),
(509, 37, 'Demangan', 0, '', '', '', NULL, NULL),
(510, 37, 'Baran', 0, '', '', '', NULL, NULL),
(511, 37, 'Bedilan', 0, '', '', '', NULL, NULL),
(512, 37, 'Kaliajir Kidul', 0, '', '', '', NULL, NULL),
(513, 37, 'Kaliajir Lor', 0, '', '', '', NULL, NULL),
(514, 38, 'Jragung', 0, '', '', '', NULL, NULL),
(515, 38, 'Blambangan', 0, '', '', '', NULL, NULL),
(516, 38, 'Morobangun', 0, '', '', '', NULL, NULL),
(517, 38, 'Karongan', 0, '', '', '', NULL, NULL),
(518, 38, 'Rejosari', 0, '', '', '', NULL, NULL),
(519, 38, 'Krasakan', 0, '', '', '', NULL, NULL),
(520, 38, 'Jlatren', 0, '', '', '', NULL, NULL),
(521, 38, 'Bulu /', 0, '', '', '', NULL, NULL),
(522, 38, 'Kranggan I', 0, '', '', '', NULL, NULL),
(523, 38, 'Kranggan II', 0, '', '', '', NULL, NULL),
(524, 39, 'Dinginan', 0, '', '', '', NULL, NULL),
(525, 39, 'Daleman', 0, '', '', '', NULL, NULL),
(526, 39, 'Polangan', 0, '', '', '', NULL, NULL),
(527, 39, 'Ngeburan', 0, '', '', '', NULL, NULL),
(528, 39, 'Jurugan', 0, '', '', '', NULL, NULL),
(529, 39, 'Berjo', 0, '', '', '', NULL, NULL),
(530, 39, 'Melikan', 0, '', '', '', NULL, NULL),
(531, 39, 'Gunung Gebang', 0, '', '', '', NULL, NULL),
(532, 39, 'Klero', 0, '', '', '', NULL, NULL),
(533, 39, 'Dayakan', 0, '', '', '', NULL, NULL),
(534, 39, 'Sengir', 0, '', '', '', NULL, NULL),
(535, 39, 'Gamparan', 0, '', '', '', NULL, NULL),
(536, 39, 'Bendungan', 0, '', '', '', NULL, NULL),
(537, 39, 'Sawo /', 0, '', '', '', NULL, NULL),
(538, 39, 'Kenaran', 0, '', '', '', NULL, NULL),
(539, 39, 'Perang', 0, '', '', '', NULL, NULL),
(540, 39, 'Umbulsari A', 0, '', '', '', NULL, NULL),
(541, 39, 'Umbulsari B', 0, '', '', '', NULL, NULL),
(542, 40, 'Klumprit I', 0, '', '', '', NULL, NULL),
(543, 40, 'Klumprit II', 0, '', '', '', NULL, NULL),
(544, 40, 'Candisari', 0, '', '', '', NULL, NULL),
(545, 40, 'Losari I', 0, '', '', '', NULL, NULL),
(546, 40, 'Losari II', 0, '', '', '', NULL, NULL),
(547, 40, 'Watukangsi', 0, '', '', '', NULL, NULL),
(548, 41, 'Jali /', 0, '', '', '', NULL, NULL),
(549, 41, 'Gayam', 0, '', '', '', NULL, NULL),
(550, 41, 'Lemahbang', 0, '', '', '', NULL, NULL),
(551, 41, 'Nawung', 0, '', '', '', NULL, NULL),
(552, 41, 'Kalinongko Lor', 0, '', '', '', NULL, NULL),
(553, 41, 'Kalinongko Kidul', 0, '', '', '', NULL, NULL),
(554, 41, 'Jontro', 0, '', '', '', NULL, NULL),
(555, 42, 'Sumberwatu', 0, '', '', '', NULL, NULL),
(556, 42, 'Dawangsari', 0, '', '', '', NULL, NULL),
(557, 42, 'Kikis', 0, '', '', '', NULL, NULL),
(558, 42, 'Gedang', 0, '', '', '', NULL, NULL),
(559, 42, 'Mlakan', 0, '', '', '', NULL, NULL),
(560, 42, 'Gunung Cilik', 0, '', '', '', NULL, NULL),
(561, 42, 'Gunungsari', 0, '', '', '', NULL, NULL),
(562, 42, 'Nglengkong', 0, '', '', '', NULL, NULL),
(563, 43, 'Kembang', 0, '', '', '', NULL, NULL),
(564, 43, 'Mutihan', 0, '', '', '', NULL, NULL),
(565, 43, 'Kebondalem', 0, '', '', '', NULL, NULL),
(566, 43, 'Gangsiran', 0, '', '', '', NULL, NULL),
(567, 43, 'Nogosari', 0, '', '', '', NULL, NULL),
(568, 43, 'Dukuh', 0, '', '', '', NULL, NULL),
(569, 43, 'Beloran', 0, '', '', '', NULL, NULL),
(570, 43, 'Potrojayan', 0, '', '', '', NULL, NULL),
(571, 43, 'Serut', 0, '', '', '', NULL, NULL),
(572, 43, 'Candisingo', 0, '', '', '', NULL, NULL),
(573, 43, 'Majasem', 0, '', '', '', NULL, NULL),
(574, 43, 'Tinjon', 0, '', '', '', NULL, NULL),
(575, 43, 'Ketandan', 0, '', '', '', NULL, NULL),
(576, 43, 'Sorogedug Lor', 0, '', '', '', NULL, NULL),
(577, 43, 'Sorogedug Kidul', 0, '', '', '', NULL, NULL),
(578, 43, 'Sembir', 0, '', '', '', NULL, NULL),
(579, 44, 'Pulerejo', 0, '', '', '', NULL, NULL),
(580, 44, 'Klurak Baru', 0, '', '', '', NULL, NULL),
(581, 44, 'Kranggan', 0, '', '', '', NULL, NULL),
(582, 44, 'Gatak', 0, '', '', '', NULL, NULL),
(583, 44, 'Ringinsari', 0, '', '', '', NULL, NULL),
(584, 44, 'Dawung', 0, '', '', '', NULL, NULL),
(585, 44, 'Cepit', 0, '', '', '', NULL, NULL),
(586, 44, 'Marangan', 0, '', '', '', NULL, NULL),
(587, 44, 'Majasem', 0, '', '', '', NULL, NULL),
(588, 44, 'Jobohan', 0, '', '', '', NULL, NULL),
(589, 44, 'Pelemsari', 0, '', '', '', NULL, NULL),
(590, 44, 'Jirak', 0, '', '', '', NULL, NULL),
(591, 44, 'Jamusan', 0, '', '', '', NULL, NULL),
(592, 45, 'Sorogenen I', 0, '', '', '', NULL, NULL),
(593, 45, 'Sorogenen II', 0, '', '', '', NULL, NULL),
(594, 45, 'Juwangen', 0, '', '', '', NULL, NULL),
(595, 45, 'Karanglo', 0, '', '', '', NULL, NULL),
(596, 45, 'Kadirojo I', 0, '', '', '', NULL, NULL),
(597, 45, 'Kadirojo II', 0, '', '', '', NULL, NULL),
(598, 45, 'Sambisari', 0, '', '', '', NULL, NULL),
(599, 45, 'Sidokerto', 0, '', '', '', NULL, NULL),
(600, 45, 'Tundan', 0, '', '', '', NULL, NULL),
(601, 45, 'Karangmojo', 0, '', '', '', NULL, NULL),
(602, 45, 'Somodaran', 0, '', '', '', NULL, NULL),
(603, 45, 'Bayen', 0, '', '', '', NULL, NULL),
(604, 45, 'Babadan', 0, '', '', '', NULL, NULL),
(605, 45, 'Sanggrahan', 0, '', '', '', NULL, NULL),
(606, 45, 'Sambiroto', 0, '', '', '', NULL, NULL),
(607, 45, 'Bromonilan', 0, '', '', '', NULL, NULL),
(608, 45, 'Temanggal I', 0, '', '', '', NULL, NULL),
(609, 45, 'Temanggal II', 0, '', '', '', NULL, NULL),
(610, 45, 'Cupuwatu I', 0, '', '', '', NULL, NULL),
(611, 45, 'Cupuwatu II', 0, '', '', '', NULL, NULL),
(612, 45, 'Kadisoka', 0, '', '', '', NULL, NULL),
(613, 46, 'Glondong', 0, '', '', '', NULL, NULL),
(614, 46, 'Krajan', 0, '', '', '', NULL, NULL),
(615, 46, 'Karang Kalasan', 0, '', '', '', NULL, NULL),
(616, 46, 'Kringinan', 0, '', '', '', NULL, NULL),
(617, 46, 'Jarakan', 0, '', '', '', NULL, NULL),
(618, 46, 'Sembur', 0, '', '', '', NULL, NULL),
(619, 46, 'Brintikan', 0, '', '', '', NULL, NULL),
(620, 46, 'Kalibening', 0, '', '', '', NULL, NULL),
(621, 46, 'Dhuri', 0, '', '', '', NULL, NULL),
(622, 46, 'Bendhan', 0, '', '', '', NULL, NULL),
(623, 46, 'Ngajeg', 0, '', '', '', NULL, NULL),
(624, 46, 'Karangnongko', 0, '', '', '', NULL, NULL),
(625, 46, 'Kedulan', 0, '', '', '', NULL, NULL),
(626, 46, 'Pundung', 0, '', '', '', NULL, NULL),
(627, 46, 'Kalimati', 0, '', '', '', NULL, NULL),
(628, 46, 'Jetis', 0, '', '', '', NULL, NULL),
(629, 46, 'Tegalsari', 0, '', '', '', NULL, NULL),
(630, 47, 'Pucung', 0, '', '', '', NULL, NULL),
(631, 47, 'Caturharjo', 0, '', '', '', NULL, NULL),
(632, 47, 'Cageran', 0, '', '', '', NULL, NULL),
(633, 47, 'Daleman', 0, '', '', '', NULL, NULL),
(634, 47, 'Kebon', 0, '', '', '', NULL, NULL),
(635, 47, 'Kenaji', 0, '', '', '', NULL, NULL),
(636, 47, 'Tamanan Pabrik', 0, '', '', '', NULL, NULL),
(637, 47, 'Tamanan', 0, '', '', '', NULL, NULL),
(638, 47, 'Carikan', 0, '', '', '', NULL, NULL),
(639, 47, 'Klurak', 0, '', '', '', NULL, NULL),
(640, 47, 'Karangmojo', 0, '', '', '', NULL, NULL),
(641, 47, 'Bogem', 0, '', '', '', NULL, NULL),
(642, 47, 'Kepatihan', 0, '', '', '', NULL, NULL),
(643, 47, 'Randugunting', 0, '', '', '', NULL, NULL),
(644, 47, 'Kowang', 0, '', '', '', NULL, NULL),
(645, 47, 'Keniten', 0, '', '', '', NULL, NULL),
(646, 47, 'Pakem', 0, '', '', '', NULL, NULL),
(647, 47, 'Jongkangan', 0, '', '', '', NULL, NULL),
(648, 47, 'Tegalrejo', 0, '', '', '', NULL, NULL),
(649, 47, 'Ringinsari', 0, '', '', '', NULL, NULL),
(650, 47, 'Tulung', 0, '', '', '', NULL, NULL),
(651, 47, 'Sentono', 0, '', '', '', NULL, NULL),
(652, 48, 'Sambirejo', 0, '', '', '', NULL, NULL),
(653, 48, 'Sindon', 0, '', '', '', NULL, NULL),
(654, 48, 'Kauman', 0, '', '', '', NULL, NULL),
(655, 48, 'Demangan', 0, '', '', '', NULL, NULL),
(656, 48, 'Ngrangsan', 0, '', '', '', NULL, NULL),
(657, 48, 'Salakan', 0, '', '', '', NULL, NULL),
(658, 48, 'Jetak', 0, '', '', '', NULL, NULL),
(659, 48, 'Trukan Dukuh', 0, '', '', '', NULL, NULL),
(660, 48, 'Grumbulgede', 0, '', '', '', NULL, NULL),
(661, 48, 'Tempel', 0, '', '', '', NULL, NULL),
(662, 48, 'Ngasem', 0, '', '', '', NULL, NULL),
(663, 48, 'Pondok', 0, '', '', '', NULL, NULL),
(664, 48, 'Senden I', 0, '', '', '', NULL, NULL),
(665, 48, 'Senden II', 0, '', '', '', NULL, NULL),
(666, 48, 'Timur', 0, '', '', '', NULL, NULL),
(667, 48, 'Gatak I', 0, '', '', '', NULL, NULL),
(668, 48, 'Gatak II', 0, '', '', '', NULL, NULL),
(669, 48, 'Kiyudan', 0, '', '', '', NULL, NULL),
(670, 48, 'Surokerten', 0, '', '', '', NULL, NULL),
(671, 48, 'Kaliwaru', 0, '', '', '', NULL, NULL),
(672, 49, 'Jelapan', 0, '', '', '', NULL, NULL),
(673, 49, 'Pencar', 0, '', '', '', NULL, NULL),
(674, 49, 'Kentingan', 0, '', '', '', NULL, NULL),
(675, 49, 'Morangan', 0, '', '', '', NULL, NULL),
(676, 49, 'Tambakan', 0, '', '', '', NULL, NULL),
(677, 49, 'Kejambon Lor', 0, '', '', '', NULL, NULL),
(678, 49, 'Kejambon Kidul', 0, '', '', '', NULL, NULL),
(679, 49, 'Ngasem', 0, '', '', '', NULL, NULL),
(680, 49, 'Koripan', 0, '', '', '', NULL, NULL),
(681, 49, 'Bokesan', 0, '', '', '', NULL, NULL),
(682, 49, 'Kayen', 0, '', '', '', NULL, NULL),
(683, 50, 'Krebet', 0, '', '', '', NULL, NULL),
(684, 50, 'Rogobangsan', 0, '', '', '', NULL, NULL),
(685, 50, 'Kalibulus', 0, '', '', '', NULL, NULL),
(686, 50, 'Macanan', 0, '', '', '', NULL, NULL),
(687, 50, 'Cokrogaten', 0, '', '', '', NULL, NULL),
(688, 50, 'Pondok Suruh', 0, '', '', '', NULL, NULL),
(689, 50, 'Koroulon Lor', 0, '', '', '', NULL, NULL),
(690, 50, 'Balong', 0, '', '', '', NULL, NULL),
(691, 50, 'Banjarharjo', 0, '', '', '', NULL, NULL),
(692, 50, 'Kragilan', 0, '', '', '', NULL, NULL),
(693, 50, 'Sorasan', 0, '', '', '', NULL, NULL),
(694, 50, 'Koroulon Kidul', 0, '', '', '', NULL, NULL),
(695, 51, 'Blambangan', 0, '', '', '', NULL, NULL),
(696, 51, 'Kalijeruk I', 0, '', '', '', NULL, NULL),
(697, 51, 'Kalijeruk II', 0, '', '', '', NULL, NULL),
(698, 51, 'Ganjuran', 0, '', '', '', NULL, NULL),
(699, 51, 'Klancingan', 0, '', '', '', NULL, NULL),
(700, 51, 'Jimat', 0, '', '', '', NULL, NULL),
(701, 51, 'Jangkang', 0, '', '', '', NULL, NULL),
(702, 51, 'Dalem', 0, '', '', '', NULL, NULL),
(703, 51, 'Jetis', 0, '', '', '', NULL, NULL),
(704, 51, 'Banglen', 0, '', '', '', NULL, NULL),
(705, 51, 'Kabunan', 0, '', '', '', NULL, NULL),
(706, 51, 'Kemasan', 0, '', '', '', NULL, NULL),
(707, 51, 'Karang', 0, '', '', '', NULL, NULL),
(708, 51, 'Ngalian', 0, '', '', '', NULL, NULL),
(709, 51, 'Kwadungan', 0, '', '', '', NULL, NULL),
(710, 51, 'Karanganyar', 0, '', '', '', NULL, NULL),
(711, 51, 'Pucangan', 0, '', '', '', NULL, NULL),
(712, 51, 'Pondok I', 0, '', '', '', NULL, NULL),
(713, 51, 'Pondok II', 0, '', '', '', NULL, NULL),
(714, 52, 'Gedongan Lor', 0, '', '', '', NULL, NULL),
(715, 52, 'Sawahan Lor', 0, '', '', '', NULL, NULL),
(716, 52, 'Sawangan Kidul', 0, '', '', '', NULL, NULL),
(717, 52, 'Demangan', 0, '', '', '', NULL, NULL),
(718, 52, 'Tonggalan', 0, '', '', '', NULL, NULL),
(719, 52, 'Saren', 0, '', '', '', NULL, NULL),
(720, 52, 'Babadan', 0, '', '', '', NULL, NULL),
(721, 52, 'Wonosari', 0, '', '', '', NULL, NULL),
(722, 52, 'Pokoh', 0, '', '', '', NULL, NULL),
(723, 52, 'Gondang Legi', 0, '', '', '', NULL, NULL),
(724, 52, 'Sempu', 0, '', '', '', NULL, NULL),
(725, 52, 'Pucunganom', 0, '', '', '', NULL, NULL),
(726, 52, 'Kenayan', 0, '', '', '', NULL, NULL),
(727, 52, 'Karangsari', 0, '', '', '', NULL, NULL),
(728, 52, 'Malangrejo', 0, '', '', '', NULL, NULL),
(729, 52, 'Kregan', 0, '', '', '', NULL, NULL),
(730, 52, 'Tegalsari', 0, '', '', '', NULL, NULL),
(731, 52, 'Blotan', 0, '', '', '', NULL, NULL),
(732, 52, 'Jetis', 0, '', '', '', NULL, NULL),
(733, 52, 'Karanganyar', 0, '', '', '', NULL, NULL),
(734, 52, 'Ceper', 0, '', '', '', NULL, NULL),
(735, 52, 'Krandon', 0, '', '', '', NULL, NULL),
(736, 52, 'Krapyak', 0, '', '', '', NULL, NULL),
(737, 52, 'Bakungan', 0, '', '', '', NULL, NULL),
(738, 52, 'Krajan', 0, '', '', '', NULL, NULL),
(739, 53, 'Kopatan', 0, '', '', '', NULL, NULL),
(740, 53, 'Degolan', 0, '', '', '', NULL, NULL),
(741, 53, 'Lodadi', 0, '', '', '', NULL, NULL),
(742, 53, 'Kledokan', 0, '', '', '', NULL, NULL),
(743, 53, 'Cilikan', 0, '', '', '', NULL, NULL),
(744, 53, 'Meces', 0, '', '', '', NULL, NULL),
(745, 53, 'Ngemplak I', 0, '', '', '', NULL, NULL),
(746, 53, 'Ngemplak II', 0, '', '', '', NULL, NULL),
(747, 53, 'Puntuk', 0, '', '', '', NULL, NULL),
(748, 53, 'Sapen', 0, '', '', '', NULL, NULL),
(749, 53, 'Kalisoro', 0, '', '', '', NULL, NULL),
(750, 53, 'Grogolan', 0, '', '', '', NULL, NULL),
(751, 53, 'Ngemplak Asem', 0, '', '', '', NULL, NULL),
(752, 53, 'Tanjung', 0, '', '', '', NULL, NULL),
(753, 53, 'Medelan', 0, '', '', '', NULL, NULL),
(754, 54, 'Rejodani I', 0, '', '', '', NULL, NULL),
(755, 54, 'Rejodani II', 0, '', '', '', NULL, NULL),
(756, 54, 'Ngetiran', 0, '', '', '', NULL, NULL),
(757, 54, 'Wonorejo', 0, '', '', '', NULL, NULL),
(758, 54, 'Tegalrejo', 0, '', '', '', NULL, NULL),
(759, 54, 'Tambakrejo', 0, '', '', '', NULL, NULL),
(760, 54, 'Gondang Legi', 0, '', '', '', NULL, NULL),
(761, 54, 'Randugowang', 0, '', '', '', NULL, NULL),
(762, 54, 'Karangmloko', 0, '', '', '', NULL, NULL),
(763, 54, 'Mudal', 0, '', '', '', NULL, NULL),
(764, 54, 'Sumberan', 0, '', '', '', NULL, NULL),
(765, 54, 'Nglempong Sari', 0, '', '', '', NULL, NULL),
(766, 54, 'Tegal Waras', 0, '', '', '', NULL, NULL),
(767, 54, 'Sedan', 0, '', '', '', NULL, NULL),
(768, 54, 'Jongkang', 0, '', '', '', NULL, NULL),
(769, 54, 'Nandan', 0, '', '', '', NULL, NULL),
(770, 55, 'Gantalan', 0, '', '', '', NULL, NULL),
(771, 55, 'Plosokuning II', 0, '', '', '', NULL, NULL),
(772, 55, 'Plosokuning III', 0, '', '', '', NULL, NULL),
(773, 55, 'Plosokuning IV', 0, '', '', '', NULL, NULL),
(774, 55, 'Plosokuning V', 0, '', '', '', NULL, NULL),
(775, 55, 'Mlandangan', 0, '', '', '', NULL, NULL),
(776, 56, 'Taraman', 0, '', '', '', NULL, NULL),
(777, 56, 'Ngemplak', 0, '', '', '', NULL, NULL),
(778, 56, 'Gadingan', 0, '', '', '', NULL, NULL),
(779, 56, 'Pedak', 0, '', '', '', NULL, NULL),
(780, 56, 'Dukuh', 0, '', '', '', NULL, NULL),
(781, 56, 'Gentan', 0, '', '', '', NULL, NULL),
(782, 56, 'Nglaban', 0, '', '', '', NULL, NULL),
(783, 56, 'Palgading', 0, '', '', '', NULL, NULL),
(784, 56, 'Tambakan', 0, '', '', '', NULL, NULL),
(785, 56, 'Lojajar', 0, '', '', '', NULL, NULL),
(786, 56, 'Ngentak', 0, '', '', '', NULL, NULL),
(787, 56, 'Jaban', 0, '', '', '', NULL, NULL),
(788, 56, 'Dayu /', 0, '', '', '', NULL, NULL),
(789, 56, 'Banteng', 0, '', '', '', NULL, NULL),
(790, 56, 'Prujakan', 0, '', '', '', NULL, NULL),
(791, 56, 'Ngabean Kulon', 0, '', '', '', NULL, NULL),
(792, 56, 'Ngabean Wetan', 0, '', '', '', NULL, NULL),
(793, 57, 'Yapah', 0, '', '', '', NULL, NULL),
(794, 57, 'Karanglo', 0, '', '', '', NULL, NULL),
(795, 57, 'Tanjungsari', 0, '', '', '', NULL, NULL),
(796, 57, 'Wonosalam', 0, '', '', '', NULL, NULL),
(797, 57, 'Losari', 0, '', '', '', NULL, NULL),
(798, 57, 'Purworejo', 0, '', '', '', NULL, NULL),
(799, 57, 'Bandulan', 0, '', '', '', NULL, NULL),
(800, 57, 'Siwil', 0, '', '', '', NULL, NULL),
(801, 57, 'Ngebo', 0, '', '', '', NULL, NULL),
(802, 57, 'Nglengkong', 0, '', '', '', NULL, NULL),
(803, 57, 'Mendiro', 0, '', '', '', NULL, NULL),
(804, 57, 'Sembung', 0, '', '', '', NULL, NULL),
(805, 57, 'Besi /', 0, '', '', '', NULL, NULL),
(806, 57, 'Klidon', 0, '', '', '', NULL, NULL),
(807, 59, 'Balong', 0, '', '', '', NULL, NULL),
(808, 59, 'Wonosari', 0, '', '', '', NULL, NULL),
(809, 59, 'Kayunan', 0, '', '', '', NULL, NULL),
(810, 59, 'Brengosan', 0, '', '', '', NULL, NULL),
(811, 59, 'Suruh', 0, '', '', '', NULL, NULL),
(812, 59, 'Jetis Suruh', 0, '', '', '', NULL, NULL),
(813, 59, 'Ngepas Lor', 0, '', '', '', NULL, NULL),
(814, 59, 'Ngepas Kidul', 0, '', '', '', NULL, NULL),
(815, 59, 'Gondang Lutung', 0, '', '', '', NULL, NULL),
(816, 59, 'Donolayan', 0, '', '', '', NULL, NULL),
(817, 59, 'Banteran', 0, '', '', '', NULL, NULL),
(818, 59, 'Panasan', 0, '', '', '', NULL, NULL),
(819, 59, 'Bantarjo', 0, '', '', '', NULL, NULL),
(820, 59, 'Jetis Donolayan', 0, '', '', '', NULL, NULL),
(821, 59, 'Ngemplak', 0, '', '', '', NULL, NULL),
(822, 59, 'Penen', 0, '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblews`
--

CREATE TABLE `tblews` (
  `idtblews` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_kel` varchar(4) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `picture_name` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0,
  `Kondisi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblews`
--

INSERT INTO `tblews` (`idtblews`, `nama`, `alamat`, `id_kel`, `tlpn`, `latitude`, `longitude`, `picture_name`, `deskripsi`, `create_time`, `create_user`, `flag`, `Kondisi`) VALUES
(1, 'EWS Turgo I', 'Turgo', '77', '-', ' -7.588559', '110.423988', '', 'EWS Banjir lahar (Mati)', '2019-09-24 13:28:21', NULL, 1, NULL),
(2, 'EWS Turgo II', 'Turgo', '77', '-', ' -7.595493', '110.421472', '2_EWSTurgo2.jpg', 'EWS banjir lahar ', '2019-09-24 13:27:33', NULL, 0, NULL),
(3, 'EWS Kemiri', 'Kemiri', '77', '-', '  -7.616311', '110.415343', '3_EWSKemiri1.jpg', 'EWS Banjir Lahar ', '2019-09-24 13:29:17', NULL, 1, NULL),
(4, 'Ews Pulowatu', 'Pulowatu', '77', '09340349304903', ' -7.65949', '110.39589', '4_EWSPurwobinangun1.jpg', 'EWS Banjir Lahar', '2019-09-24 13:31:35', NULL, 0, NULL),
(5, 'EWS Kalitengah Lor', 'Kalitengah Lor', '84', '-', ' -7.585509', '110.457804', '5_EWSKalitengah1.jpg', 'EWS Awan Panas', '2019-09-24 13:36:29', NULL, 0, NULL),
(6, 'EWS Srunen', 'Srunen', '84', '-', ' -7.60261', '110.46089', '6_EWSSrunen2.3.jpg', 'EWS Awan Panas', '2019-09-24 13:37:15', NULL, 0, NULL),
(7, 'EWS Huntap Batur', 'Batur', '85', '-', ' -7.617185', '110.452939', '7_EWSBatur1.jpg', 'EWS Awan Panas', '2019-09-24 13:38:17', NULL, 0, NULL),
(8, 'EWS Tangkisan', 'Tangkisan', '86', '-', ' -7.60755', '110.440294', '8_EWSTangkisan1.jpg', 'EWS Awan Panas', '2019-09-24 13:39:42', NULL, 0, NULL),
(9, 'EWS Bronggang', 'Bronggang', '82', '-', '-7.66406', '110.463845', '9_EWSBronggang1.jpg', 'EWS Banjir Lahar', '2019-09-24 13:40:39', NULL, 0, NULL),
(10, 'EWS Kliwang', 'Kliwang', '82', '-', ' -7.66951', '110.456472', '10_EWSKliwang.jpg', 'EWS Banjir Lahar', '2019-09-24 13:42:22', NULL, 0, NULL),
(11, 'EWS Jaranan', 'Jaranan', '82', '-', ' -7.672734', '110.465459', '11_EWSJaranan1.jpg', 'EWS Banjir Lahar', '2019-09-24 13:43:09', NULL, 0, NULL),
(12, 'EWS Kejambon Lor', 'Kejambon Lor', '49', '-', ' -7.693979', '110.474064', '12_EWSKejambon.jpg', 'EWS Banjir Lahar', '2019-09-24 13:44:26', NULL, 0, NULL),
(13, 'EWS Ngerdi', 'Ngerdi', '49', '-', '-7.709381', '110.477164', '13_EWSNgerdi1.jpg', 'EWS Banjir Lahar', '2019-09-24 13:47:34', NULL, 0, NULL),
(14, 'EWS Watukangsi', 'Watukangsi', '40', '-', ' -7.820288', '110.515943', '14_EWSWatukangsi1.jpg', 'EWS Tanah Longsor (Mati)', '2019-09-24 13:48:33', NULL, 0, NULL),
(15, 'EWS Gunung Cilik', 'Gunung Cilik', '42', '-', ' -7.794255', '110.502542', '15_EWSGunungCilik2.jpg', 'EWS Tanah Longsor (Hilang)', '2019-09-24 13:05:51', NULL, 1, NULL),
(16, 'EWS Puntuk Gayam', 'Gayamharjo', '96', '-', ' -7.803958', '110.531947', '16_EWSGayamharjo1.jpg', 'EWS Tanah Longsor (Mati)', '2019-09-24 13:09:14', NULL, 0, NULL),
(17, 'EWS Ngandong', 'Ngandong', '75', '-', ' -7.595568', '110.410000', '17_ramadan.jpg', 'EWS Awan Panas', '2019-09-24 13:13:19', NULL, 0, NULL),
(18, 'EWS Kaliurang Timur', 'Kaliurang Timur', '81', '-', '-7.596633', '110.430715', '18_EWSKaliurangTimur1.jpg', 'EWS Awan Panas', '2019-09-24 13:16:06', NULL, 0, NULL),
(19, 'EWS Ngrangkah', 'Ngrangkah', '86', '-', '-7.589989', '110.442171', '19_EWSNgrangkah1.jpg', 'EWS Awan Panas', '2019-09-24 13:18:16', NULL, 0, NULL),
(20, 'EWS Anur', 'Kepuh', '85', '-', '-7.625944', '110.454898', '20_EWSAnnur1.jpg', 'EWS Awan Panas', '2019-09-24 13:20:36', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblgalery`
--

CREATE TABLE `tblgalery` (
  `id` int(11) NOT NULL,
  `idtbl` int(11) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '1 = ssb, 2 = desa, 3 = ews',
  `picture_name` varchar(100) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblgroup`
--

CREATE TABLE `tblgroup` (
  `idtblgroup` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblgroup`
--

INSERT INTO `tblgroup` (`idtblgroup`, `nama`, `deskripsi`, `create_date`, `flag`) VALUES
(1, 'admin', 'Administrasi website', '2017-10-17 09:53:40', 0),
(2, 'Operator', 'Pusdalops Sleman', '2018-02-07 01:03:03', 0),
(3, 'Relawan', 'Relawan Sleman', '2017-11-10 00:28:05', 0),
(4, 'TRC', 'Team Reaksi Cepat BPBD Sleman', '2017-11-19 22:15:11', 0),
(5, 'Guest', 'Pengunjung', '2018-02-07 01:09:12', 0),
(6, 'Gudang', 'Petugas Gudang BPBD Sleman', '2019-09-16 17:02:14', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblgudang`
--

CREATE TABLE `tblgudang` (
  `idtblgudang` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `id_kel` int(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblgudang`
--

INSERT INTO `tblgudang` (`idtblgudang`, `nama`, `deskripsi`, `id_kel`, `create_date`, `flag`) VALUES
(1, 'Gudang Posko Utama', 'Gudang Logistik BPBD Sleman', 80, '2019-11-13 13:33:49', 0),
(2, 'Gudang Nakersos', 'Gudang Peralatan BPBD Sleman', 62, '2019-11-13 12:14:49', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblinstansi`
--

CREATE TABLE `tblinstansi` (
  `idtblinstansi` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblinstansi`
--

INSERT INTO `tblinstansi` (`idtblinstansi`, `nama`, `alamat`, `tlpn`, `deskripsi`, `create_date`, `flag`) VALUES
(1, 'Bayu Induk', 'Komplek Pemda Sleman, Jl. Prasamya Sleman', '0274 869375', 'BPBD Sleman', '2017-09-29 15:35:27', 1),
(2, 'PUSDALOPS Sleman', 'Jl. Kaliurang Km17.5, Pakem', '0274 2860051', 'BPBD Sleman', '2017-09-29 15:38:25', 1),
(3, 'DLH', 'Jl. KRT. Pringgodiningrat, NO.9, Beran, Tridadi, Sleman', '081392125525', 'Bp. Karman ( Crane )', '2017-11-10 00:01:53', 0),
(4, 'TELKOM', '-', '0811252767', 'Bagus', '2017-11-10 00:02:50', 0),
(5, 'TELKOM', '-', '08124803321', 'Ibu Utami', '2017-11-10 00:03:31', 0),
(6, 'PLN Sleman', '-', '0274 869455', 'Kantor UPJ Sleman', '2017-11-10 00:04:45', 1),
(7, 'POSKO UTAMA PAKEM', 'Jl. Kaliurang Km17.5, Pakem', '0274 898350', 'TRC BPBD Sleman', '2017-11-10 00:05:43', 1),
(8, 'AGNI Induk', 'Komplek Pemda Sleman, Jl. Prasamya Sleman', '0274 868351', 'PEMADAM KEBAKARAN SLEMAN', '2017-11-10 00:07:04', 1),
(9, 'AGNI Godean', 'Jl. Godean', '0274 2821346', 'PEMADAM KEBAKARAN SLEMAN POS GODEAN', '2017-11-10 00:07:57', 1),
(10, 'PGM Kaliurang', 'Kaliurang', '0274 895209', 'POS PANTAU KALIURANG', '2017-11-10 00:09:03', 0),
(11, 'SAR KALIURANG', 'Kaliurang', '0274 868352', 'Pos Sar Kaliurang', '2017-11-10 00:09:56', 1),
(12, 'PMI Sleman', '-', '0274 868900', 'Markas PMI Sleman', '2017-11-10 00:10:59', 1),
(13, 'BASARNAS', 'Jl. Wates', '0274 6498080', 'Kantor BASARNAS', '2017-11-10 00:12:01', 1),
(14, 'SAR POLDA', 'Jl. Ringroad Utara', '0851 0770 0767', '-', '2017-11-10 00:13:07', 0),
(15, 'SAR POLDA', 'Jl. Ringroad Utara', '0274 7007606', '-', '2017-11-10 00:13:42', 0),
(16, 'PLN Kalasan', '-', '0274 496317', 'Kantor PLN Kalasan', '2017-11-10 00:14:40', 1),
(17, 'PLN Sedayu', '-', '0274 6497977', 'Kantor PLN Sedayu', '2017-11-10 00:15:16', 1),
(18, 'PLN Sedayu', '-', '0274563348', 'Kantor PLN Sedayu', '2017-11-10 00:15:44', 1),
(19, 'SES', 'Dinkes Sleman', '0274 8609000', '-', '2017-11-10 00:16:59', 0),
(20, 'SES', 'Dinkes Sleman', '08112668900', '-', '2017-11-10 00:17:39', 0),
(21, 'PLN Kota', '-', '0274 387365', 'Kantor PLN Kota', '2017-11-10 00:19:16', 1),
(22, 'BPPTKG', '-', '0274 514192', 'Kantor BPPTKG', '2017-11-10 00:19:55', 1),
(23, 'BMKG Iklim', '-', '0274 2880151', '-', '2017-11-10 00:20:39', 0),
(24, 'BMKG Iklim', '-', '0274 2880152', '-', '2017-11-10 00:21:02', 0),
(25, 'BMKG Gempa', '-', '0274 6498383', '-', '2017-11-10 00:21:34', 0),
(26, 'PUSDALOPS DIY', 'Jl. Kenari, No.14A, Semaki, Umbulharjo, Yogyakarta', '0274 555584', 'BPBD DIY', '2017-11-10 00:23:44', 1),
(27, 'PUSDALOPS DIY', 'Jl. Kenari, No.14A, Semaki, Umbulharjo, Yogyakarta', '0274 555585', 'BPBD DIY', '2017-11-10 00:24:17', 0),
(28, 'PLN Sleman', '-', '085722260237', 'ANDRI/ ARDI', '2017-11-11 13:29:10', 0),
(29, 'SRIYONO', 'Balong, Umbulharjo, Cangkringan', '085878212444', 'TAGANA', '2017-12-03 18:09:53', 0),
(30, 'Juwaryono (Dukuh Kemiri Sewu)', 'Kemiri Sewu/Brongkol Sidorejo Godean', '085878711196', 'Dukuh Kemiri Sewu / Brongkol', '2018-03-28 00:44:43', 0),
(31, 'POLDA DIY', 'Jl. Ringroad Utara Condong Catur Depok', '(0274) 886000', 'Kantor', '2018-03-28 00:47:39', 0),
(32, 'POLRES SLEMAN', 'Jl. Magelang Km. 12 Kec. Sleman', '(0274) 868424', 'Kantor', '2018-03-28 00:50:11', 0),
(33, 'PMI Sleman', 'Jl. Dr. Rajimin Sucen', '(0274) 869909', 'Unit Donor Darah', '2018-03-28 00:52:45', 1),
(34, 'Agustha Purwa Aji K', 'Pete, Selomartani, Kalasan', NULL, NULL, '2019-01-08 03:55:34', 0),
(35, 'PLN Sleman', '-', '085227593875', 'TEGAR', '2019-11-30 18:35:55', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblinventaris`
--

CREATE TABLE `tblinventaris` (
  `idinventaris` int(9) NOT NULL,
  `barcode` int(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `idkategori` int(9) DEFAULT NULL,
  `idlokasi` int(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbljarak`
--

CREATE TABLE `tbljarak` (
  `idjarak` int(11) NOT NULL,
  `jarakaman` int(11) DEFAULT NULL,
  `statusaktivitas` varchar(100) DEFAULT NULL,
  `Rekomendasi` varchar(300) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbljarak`
--

INSERT INTO `tbljarak` (`idjarak`, `jarakaman`, `statusaktivitas`, `Rekomendasi`, `flag`) VALUES
(1, 3, 'SIAGA \"LEVEL 3\"', 'Radius bahaya dikosongkan 3 KM, Dari Puncak Merapi, Patuhi arahan petugas di lapangan, Bila membutuhkan informasi Silahkan menghubungi WA/Tlp : 02742860051. Update 05 Januari 2020', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkaryawan`
--

CREATE TABLE `tblkaryawan` (
  `idtblkaryawan` int(11) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `golongan` varchar(50) DEFAULT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblkaryawan`
--

INSERT INTO `tblkaryawan` (`idtblkaryawan`, `nama`, `telephone`, `alamat`, `nip`, `jabatan`, `golongan`, `keterangan`, `departemen`, `flag`) VALUES
(8, 'Agustha Purwa Aji K', '089786776273', 'Pete, Selomartani, Kalasan', '-', 'Operator IT', '3A', 'Non PNS', 'Pusdalops', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkategori_inventaris`
--

CREATE TABLE `tblkategori_inventaris` (
  `idkategori` int(9) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkecakapan`
--

CREATE TABLE `tblkecakapan` (
  `idtblkecakapan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblkecakapan`
--

INSERT INTO `tblkecakapan` (`idtblkecakapan`, `nama`, `deskripsi`, `create_date`, `flag`) VALUES
(1, 'Perencanaan', 'Perencanaan', NULL, 0),
(2, 'Pendidikan', 'Pendidikan', NULL, 0),
(3, 'Sistem Informasi Geografis (GIS) dan Pemetaan', 'Sistem Informasi Geografis (GIS) dan Pemetaan', NULL, 0),
(4, 'Pelatihan, Geladi dan Simulasi Bencana1', 'Pelatihan, Geladi dan Simulasi Bencana1', '2017-10-26 13:57:07', 0),
(5, 'Kaji Cepat Bencana', 'Kaji Cepat Bencana', '2018-10-16 12:19:36', 0),
(6, 'Pencarian dan Penyelamatan (SAR) dan Evakuasi', 'Pencarian dan Penyelamatan (SAR) dan Evakuasi', NULL, 0),
(7, 'Transportasi', 'Transportasi', NULL, 0),
(8, 'Logistik', 'Logistik', NULL, 0),
(9, 'Keamanan Pangan dan Nutrisi', 'Keamanan Pangan dan Nutrisi', NULL, 0),
(10, 'Dapur Umum', 'Dapur Umum', NULL, 0),
(11, 'Pengelolaan Lokasi Pengungsian dan Huntara', 'Pengelolaan Lokasi Pengungsian dan Huntara', NULL, 0),
(12, 'Pengelolaan Posko Penanggulangan Bencana (PB)', 'Pengelolaan Posko Penanggulangan Bencana (PB)', NULL, 0),
(13, 'Kesehatan/ Medis', 'Kesehatan/ Medis', NULL, 0),
(14, 'Air Bersih, Sanitasi, dan Kesehatan Lingkungan', 'Air Bersih, Sanitasi, dan Kesehatan Lingkungan', NULL, 0),
(15, 'Keamanan dan Perlindungan', 'Keamanan dan Perlindungan', NULL, 0),
(16, 'Gender dan Kelompok Rentan', 'Gender dan Kelompok Rentan', NULL, 0),
(17, 'Psikososial/ Konseling/ Penyembuhan Trauma', 'Psikososial/ Konseling/ Penyembuhan Trauma', NULL, 0),
(18, 'Pertukangan dan Perekayasaan', 'Pertukangan dan Perekayasaan', NULL, 0),
(19, 'Pertanian, Peternakan dan Penghidupan', 'Pertanian, Peternakan dan Penghidupan', NULL, 0),
(20, 'Administrasi', 'Administrasi', NULL, 0),
(21, 'Pengelolaan Keuangan', 'Pengelolaan Keuangan', NULL, 0),
(22, 'Bahasa Asing', 'Bahasa Asing', NULL, 0),
(23, 'Informasi dan Komunikasi', 'Informasi dan Komunikasi', NULL, 0),
(24, 'Hubungan Media dan Masyarakat', 'Hubungan Media dan Masyarakat', NULL, 0),
(25, 'Pantauan, Evaluasi dan Pelaporan', 'Pantauan, Evaluasi dan Pelaporan', NULL, 0),
(26, 'Promosi dan Mobilisasi Relawan', 'Promosi dan Mobilisasi Relawan', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkecamatan`
--

CREATE TABLE `tblkecamatan` (
  `id_kec` char(6) NOT NULL,
  `id_kab` char(4) NOT NULL,
  `nama` tinytext NOT NULL,
  `nama_pejabat` tinytext DEFAULT NULL,
  `alamat` tinytext DEFAULT NULL,
  `notelp` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblkecamatan`
--

INSERT INTO `tblkecamatan` (`id_kec`, `id_kab`, `nama`, `nama_pejabat`, `alamat`, `notelp`) VALUES
('340401', '3404', 'Gamping ', 'wakiran', 'dasasasa', '32323232323'),
('340402', '3404', 'Godean', 'Paijo', 'fdfdfdfd', '111111111111111'),
('340403', '3404', 'Moyudan', 'Sarjono', '', '2222222222222222'),
('340404', '3404', 'Minggir', NULL, NULL, '333333333333'),
('340405', '3404', 'Seyegan', NULL, NULL, NULL),
('340406', '3404', 'Mlati', NULL, NULL, NULL),
('340407', '3404', 'Depok', 'Abu Bakar, S.Sos, M.Si', '', ''),
('340408', '3404', 'Berbah', 'Joni Suhartana, SH', 'Brayut RT. RW. Pandowoharjo Sleman Sleman D.I. Yogyakarta', '085878502000'),
('340409', '3404', 'Prambanan', '', '', ''),
('340410', '3404', 'Kalasan', NULL, NULL, NULL),
('340411', '3404', 'Ngemplak', NULL, NULL, NULL),
('340412', '3404', 'Ngaglik', NULL, NULL, NULL),
('340413', '3404', 'Sleman', NULL, NULL, NULL),
('340414', '3404', 'Tempel', NULL, NULL, NULL),
('340415', '3404', 'Turi', NULL, NULL, NULL),
('340416', '3404', 'Pakem', NULL, NULL, NULL),
('340417', '3404', 'Cangkringan', 'Edi Harmana SH, M.Hum', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkegiatan`
--

CREATE TABLE `tblkegiatan` (
  `idtblkegiatan` int(12) NOT NULL,
  `nama_kegiatan` varchar(50) DEFAULT NULL,
  `komunitas` int(11) DEFAULT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `kecamatan` int(11) DEFAULT NULL,
  `desa` int(11) DEFAULT NULL,
  `provinsi` varchar(10) DEFAULT 'DIY',
  `tanggal_kegiatan` datetime DEFAULT NULL,
  `penanggung_jawab` varchar(50) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkelurahan`
--

CREATE TABLE `tblkelurahan` (
  `id_kel` int(9) NOT NULL,
  `id_kec` char(6) DEFAULT NULL,
  `nama` tinytext DEFAULT NULL,
  `nama_pejabat` tinytext DEFAULT NULL,
  `alamat` tinytext DEFAULT NULL,
  `notelp` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblkelurahan`
--

INSERT INTO `tblkelurahan` (`id_kel`, `id_kec`, `nama`, `nama_pejabat`, `alamat`, `notelp`) VALUES
(1, '340401', 'Balecatur', 'Paijo', 'kolpalkkjsj', '093020930232'),
(2, '340401', 'Ambarketawang', NULL, NULL, NULL),
(3, '340401', 'Banyuraden', NULL, NULL, NULL),
(4, '340401', 'Nogotirto', NULL, NULL, NULL),
(5, '340401', 'Trihanggo', NULL, NULL, NULL),
(6, '340402', 'Sidorejo', NULL, NULL, NULL),
(7, '340402', 'Sidoluhur', NULL, NULL, NULL),
(8, '340402', 'Sidomulyo', NULL, NULL, NULL),
(9, '340402', 'Sidoagung', NULL, NULL, NULL),
(10, '340402', 'Sidokarto', NULL, NULL, NULL),
(11, '340402', 'Sidoarum', NULL, NULL, NULL),
(12, '340402', 'Sidomoyo', NULL, NULL, NULL),
(13, '340403', 'Sumberahayu', NULL, NULL, NULL),
(14, '340403', 'Sumbersari', NULL, NULL, NULL),
(15, '340403', 'Sumberagung', NULL, NULL, NULL),
(16, '340403', 'Sumberarum', NULL, NULL, NULL),
(17, '340404', 'Sendangarum', NULL, NULL, NULL),
(18, '340404', 'Sendangmulyo', NULL, NULL, NULL),
(19, '340404', 'Sendangagung', NULL, NULL, NULL),
(20, '340404', 'Sendangsari', NULL, NULL, NULL),
(21, '340404', 'Sendangrejo', NULL, NULL, NULL),
(22, '340405', 'Margoluwih', NULL, NULL, NULL),
(23, '340405', 'Margodadi', NULL, NULL, NULL),
(24, '340405', 'Margomulyo', NULL, NULL, NULL),
(25, '340405', 'Margokaton', NULL, NULL, NULL),
(26, '340405', 'Margoagung', NULL, NULL, NULL),
(27, '340406', 'Sinduadi', NULL, NULL, NULL),
(28, '340406', 'Sendangadi', NULL, NULL, NULL),
(29, '340406', 'Tlogoadi', NULL, NULL, NULL),
(30, '340406', 'Tirtoadi', NULL, NULL, NULL),
(31, '340406', 'Sumberadi', NULL, NULL, NULL),
(32, '340407', 'Caturtunggal', NULL, NULL, NULL),
(33, '340407', 'Maguwoharjo', NULL, NULL, NULL),
(34, '340407', 'Condongcatur', NULL, NULL, NULL),
(35, '340408', 'Sendangtirto', NULL, NULL, NULL),
(36, '340408', 'Tegaltirto', NULL, NULL, NULL),
(37, '340408', 'Kalitirto', NULL, NULL, NULL),
(38, '340408', 'Jogotirto', NULL, NULL, NULL),
(39, '340409', 'Sumberharjo', NULL, NULL, NULL),
(40, '340409', 'Wukirharjo', NULL, NULL, NULL),
(41, '340409', 'Gayamharjo', NULL, NULL, NULL),
(42, '340409', 'Sambirejo', NULL, NULL, NULL),
(43, '340409', 'Madurejo', NULL, NULL, NULL),
(44, '340409', 'Bokoharjo', NULL, NULL, NULL),
(45, '340410', 'Purwomartani', NULL, NULL, NULL),
(46, '340410', 'Tirtomartani', NULL, NULL, NULL),
(47, '340410', 'Tamanmartani', NULL, NULL, NULL),
(48, '340410', 'Selomartani', NULL, NULL, NULL),
(49, '340411', 'Sindumartani', NULL, NULL, NULL),
(50, '340411', 'Bimomartani', NULL, NULL, NULL),
(51, '340411', 'Widodomartani', NULL, NULL, NULL),
(52, '340411', 'Wedomartani', NULL, NULL, NULL),
(53, '340411', 'Umbulmartani', NULL, NULL, NULL),
(54, '340412', 'Sariharjo', NULL, NULL, NULL),
(55, '340412', 'Minomartani', NULL, NULL, NULL),
(56, '340412', 'Sinduharjo', NULL, NULL, NULL),
(57, '340412', 'Sukoharjo', NULL, NULL, NULL),
(58, '340412', 'Sardonoharjo', NULL, NULL, NULL),
(59, '340412', 'Donoharjo', NULL, NULL, NULL),
(60, '340413', 'Caturharjo', NULL, NULL, NULL),
(61, '340413', 'Triharjo', NULL, NULL, NULL),
(62, '340413', 'Tridadi', NULL, NULL, NULL),
(63, '340413', 'Pandowoharjo', NULL, NULL, NULL),
(64, '340413', 'Trimulyo', NULL, NULL, NULL),
(65, '340414', 'Banyurejo', NULL, NULL, NULL),
(66, '340414', 'Tambakrejo', NULL, NULL, NULL),
(67, '340414', 'Sumberrejo', NULL, NULL, NULL),
(68, '340414', 'Pondokrejo', NULL, NULL, NULL),
(69, '340414', 'Mororejo', NULL, NULL, NULL),
(70, '340414', 'Margorejo', NULL, NULL, NULL),
(71, '340414', 'Lumbungrejo', NULL, NULL, NULL),
(72, '340414', 'Merdikorejo', NULL, NULL, NULL),
(73, '340415', 'Bangunkerto', NULL, NULL, NULL),
(74, '340415', 'Donokerto', NULL, NULL, NULL),
(75, '340415', 'Girikerto', NULL, NULL, NULL),
(76, '340415', 'Wonokerto', NULL, NULL, NULL),
(77, '340416', 'Purwobinangun', NULL, NULL, NULL),
(78, '340416', 'Candibinangun', NULL, NULL, NULL),
(79, '340416', 'Harjobinangun', NULL, NULL, NULL),
(80, '340416', 'Pakembinangun', NULL, NULL, NULL),
(81, '340416', 'Hargobinangun', NULL, NULL, NULL),
(82, '340417', 'Argomulyo', NULL, NULL, NULL),
(83, '340417', 'Wukirsari', NULL, NULL, NULL),
(84, '340417', 'Glagaharjo', NULL, NULL, NULL),
(85, '340417', 'Kepuharjo', NULL, NULL, NULL),
(86, '340417', 'Umbulharjo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkk`
--

CREATE TABLE `tblkk` (
  `idtblkk` int(11) NOT NULL,
  `nokk` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `ktp` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(40) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `idtblagama` int(2) DEFAULT NULL,
  `status_kawin` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `kelurahan` int(5) DEFAULT NULL,
  `idtbldusun` int(5) DEFAULT NULL,
  `rt` varchar(10) DEFAULT NULL,
  `rw` varchar(10) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `disabilitas` tinyint(1) DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkk_detail`
--

CREATE TABLE `tblkk_detail` (
  `id` int(20) NOT NULL,
  `idtblkk` int(11) NOT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1 = anggota kk, 2 = ternak',
  `idtblternak` int(11) DEFAULT NULL,
  `jml_ternak` int(10) DEFAULT NULL,
  `ktp` varchar(20) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(40) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `idtblagama` int(2) DEFAULT NULL,
  `status_kawin` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `kewarganegaraan` varchar(20) DEFAULT NULL,
  `disabilitas` tinyint(1) DEFAULT 0 COMMENT '0 = normal, 1 = difabel',
  `deskripsi` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkml`
--

CREATE TABLE `tblkml` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `flag` int(11) DEFAULT 1,
  `create_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tblkml`
--

INSERT INTO `tblkml` (`id`, `nama`, `type`, `file`, `flag`, `create_date`) VALUES
(1, 'krb1.kml', 'kml', 'http://kebencanaan.slemankab.go.id//kml/krb1.kml', 1, '2022-01-03 08:40:09'),
(2, 'krb2.kml', 'kml', 'http://kebencanaan.slemankab.go.id//kml/krb2.kml', 1, '2022-01-03 08:40:11'),
(3, 'krb3.kml', 'kml', 'http://kebencanaan.slemankab.go.id//kml/krb3.kml', 1, '2022-01-03 08:40:13'),
(4, 'Radius.kml', 'radius', 'http://kebencanaan.slemankab.go.id//kml/Radius.kml', 1, '2022-01-03 08:40:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkomunitas`
--

CREATE TABLE `tblkomunitas` (
  `idtblkomunitas` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `kecamatan` int(11) DEFAULT NULL,
  `desa` varchar(30) DEFAULT NULL,
  `masa_bakti` int(4) DEFAULT NULL,
  `tanggal_berakhir` varchar(20) DEFAULT NULL,
  `jml_pengurus` varchar(20) DEFAULT NULL,
  `jml_anggota` varchar(20) DEFAULT NULL,
  `kepemilikan_adart` varchar(30) DEFAULT NULL,
  `kemampuan` varchar(30) DEFAULT NULL,
  `tlpn_sekretariat` varchar(20) DEFAULT NULL,
  `tlpn_alternative` varchar(20) DEFAULT NULL,
  `pertemuan_rutin` varchar(4) DEFAULT NULL,
  `tanggal_berdiri` varchar(20) DEFAULT NULL,
  `pejabat` varchar(100) DEFAULT NULL,
  `frex_rx` varchar(50) DEFAULT NULL,
  `frex_tx` varchar(50) DEFAULT NULL,
  `tone` varchar(40) DEFAULT NULL,
  `peralatan` varchar(50) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblkomunitas`
--

INSERT INTO `tblkomunitas` (`idtblkomunitas`, `nama`, `alamat`, `kelurahan`, `kecamatan`, `desa`, `masa_bakti`, `tanggal_berakhir`, `jml_pengurus`, `jml_anggota`, `kepemilikan_adart`, `kemampuan`, `tlpn_sekretariat`, `tlpn_alternative`, `pertemuan_rutin`, `tanggal_berdiri`, `pejabat`, `frex_rx`, `frex_tx`, `tone`, `peralatan`, `ket`, `flag`, `create_time`, `create_user`) VALUES
(1, 'PEDULI MERAPI KOMISARIAT SLEMAN', 'SOKOTEGAL MERDIKOREJO TEMPEL', 0, 0, '', 3, '0000-00-00', '14', '86', 'ADA', 'SAR,  LOGISTIK, PSIKOLOG, BAHA', '85601998835', '87838802527', 'BULA', '0000-00-00', 'Suharno. S.Sos', '140', '150', '88,5', 'RPU, Tower, Chainsaw, Carmantel, Carabiner, Rig, H', 'xxxxxxxxxxxxxx', 0, '0000-00-00 00:00:00', 1),
(2, 'Forum Peduli Bumi (FPB)', 'Kejambon Lor (RT 04/ RW 13), Sindumartani, Ngemplak, Sleman, D.I. Yogyakarta', 0, 0, '', 2, '0000-00-00', '8', '57', 'Ada', 'Lingkungan Hidup, Mitigasi, Ko', '', 'Nanang Setyoaji (Ket', '35 h', '0000-00-00', '', '140,001', '150,001', '89,5', '', 'Iuran Anggota, Hibah', 0, '0000-00-00 00:00:00', 1),
(3, 'RAPI KAB.SLEMAN ( SRC - TB)', 'Kayen Gg.Cikal dempet,Condongcatur,Depok Sleman ', 0, 0, '', 2, '0000-00-00', '30', '66', 'ada', 'komunikasi/evakuasi', '0274.889793/7862597.', '087838326937.   0817', 'Tiap', '0000-00-00', 'Ketua RAPI kab.Sleman', '140,002', '150,002', '90,5', 'Chain saw 2 unit', '', 0, '0000-00-00 00:00:00', 1),
(4, 'TURGO ASRI 165.350 MHz \"\"Public Emergency Frequency\"\" Daerah Istimewa Yogyakarta', 'Jalan Kaliurang Km.8 Gang Banteng III Nomor 5 Ngaglik, Sleman, Yogyakarta.', 0, 0, '', 3, '0000-00-00', '41', '121', 'Ada', 'Informasi dan Komunikasi, Kaji', '628592741 0301', '628222623 7776', '1 Bu', '0000-00-00', 'Bupati Sleman - DISHUBKOMINFO SLEMAN - BALMON PROVINSI Tk.II - BPBD Kabupaten SLEMAN', '140,003', '150,003', '91,5', 'RPU, Sekretariat dan APD', '', 0, '0000-00-00 00:00:00', 1),
(5, 'RAGIL LOSAN', 'Ngelodadi Rt.02 Rw.13 Wonokerto Turi Sleman', 0, 0, 'Sleman', 2, '0000-00-00', '18', '43', 'ada', 'Bankom dan evakuasi', '085642390393, 081804', '', 'Tiap', '0000-00-00', 'Lurah Desa Wonokerto', '140,004', '150,004', '92,5', 'Sekretariat', '', 0, '0000-00-00 00:00:00', 1),
(6, 'MERAPI LOWO RESCUE INDONESIA', 'Jalan Godean KM 1 Sumberan RT 004 Desa Ngestiharjo kecamatan Kasihan kabupaten Bantul Daerah Istimewa Yogyakarta 55182', 0, 0, 'Sleman', 5, '0000-00-00', '11', '55', 'ada', 'MFR, SAR, Evakuasi, Jungle, HA', '8816119610', '08112537149, 0819010', 'Ming', '0000-00-00', 'Notaris', '140,005', '150,005', '93,5', 'Chainsaw, SRT', '', 0, '0000-00-00 00:00:00', 1),
(7, 'PASAG MERAPI FREQ: 151.060', 'Gondoarum,wonokerto,Turi,Sleman', 0, 0, 'Sleman', 5, '0000-00-00', '10', '47', 'Ada', 'Evakuasi, inf komunikasi ,PPGD', 'Dwi:081228348444', 'Kristanto:0821397421', 'Seti', '0000-00-00', 'Rohayati Sufiah,SH.M.HUM', '140,006', '150,006', '94,5', 'Sekretariat', '', 0, '0000-00-00 00:00:00', 1),
(8, 'RESCUE TAMAN', 'Balai Desa Tamanmartani', 0, 0, 'Sleman', 3, '0000-00-00', '32', '37', '', 'Pengelolaan Barak', '87738292565', '85643668152', '2 Bu', '0000-00-00', 'Kepala Desa Tamanmartani', '140,007', '150,007', '95,5', '', '', 0, '0000-00-00 00:00:00', 1),
(9, 'FKPM Paksi Katon Wil. Kab. Sleman', 'Prapak Wetan RT 03 RW 07  Sendangmulyo Minggir Sleman', 0, 0, 'Sleman', 3, '0000-00-00', '28', '110', 'ada', 'Pengamanan dan Rescue', '8783877750', '87739190146', '2 bl', '0000-00-00', 'KEPALA KESBANG  Drs. ARDANI', '140,008', '150,008', '96,5', '', '', 0, '0000-00-00 00:00:00', 1),
(10, 'SAR LINMAS KALIURANG WILAYAH VII', 'Jalan Boyong, Kaliurang, Pakem, Sleman', 0, 0, 'Sleman', 5, '0000-00-00', '9', '44', '01-Jan-05', 'SAR, EMS, medis, navigasi dara', '0274-898352', ' 0856 4300 1155', 'tang', '0000-00-00', 'Dinas Ketentraman dan Ketertiban DIY', '140,009', '150,009', '97,5', 'terlampir', '', 0, '0000-00-00 00:00:00', 1),
(11, 'KOMUNITAS SIAGA MERAPI', 'Banjarsari,glagaharjo,cangkringan ,sleman', 0, 0, 'Sleman', 0, '0000-00-00', '18', '30', 'ADA', 'SAR, Pemantauan Gunung, Pemant', '', '', 'Bula', '0000-00-00', '', '140,01', '150,01', '98,5', '', '', 0, '0000-00-00 00:00:00', 1),
(12, 'DJIEPHATSONG', 'Bromonilan Rt 007 Rw 003', 0, 0, 'Sleman', 5, '0000-00-00', '24', '25', ' Ada ', 'SAR_PB, Transportasi, Dapur Um', '081802753777 dan 085', '817.549.682', 'Tiap', '0000-00-00', 'Muhammad Haryanto, SH', '140,011', '150,011', '99,5', '', '', 0, '0000-00-00 00:00:00', 1),
(13, 'SATKORCAB BANSER KAB. SLEMAN', 'Jl. Pringgodiningrat, Pangukan, Tridadi, Sleman', 0, 0, 'Sleman', 4, '0000-00-00', '23', '0', 'ada', 'Keagamaan, Sosial Kemasyarakat', ': 0274 - 866625', ': 0877388122999', 'Mlm ', '0000-00-00', 'PC GP. Ansor Kab. Sleman', '140,012', '150,012', '100,5', '', '', 0, '0000-00-00 00:00:00', 1),
(14, 'CAKRA', 'Jl. Kaliurang KM.17 Daerah Istimewa, Yogyakarta', 0, 0, 'Sleman', 5, '0000-00-00', '7', '51', 'ada', 'Evakuasi, penyisir, kesehatan,', '81568451895', '', 'Sebu', '0000-00-00', '', '140,013', '150,013', '101,5', '', '', 0, '0000-00-00 00:00:00', 1),
(15, 'SAR HIDAYATULLAH JOGJA', 'Jl. Palagantentara Pelajar Km. 14,5 Balong, Donoharjo, Ngaglik, Sleman', 0, 0, 'Sleman', 3, '0000-00-00', '10', '34', 'Ada', 'SAR PB', '(0274)7827175', '087838270881/0888681', '1 X/', '0000-00-00', 'MENSOS RI', '140,014', '150,014', '102,5', '', '', 0, '0000-00-00 00:00:00', 1),
(16, 'MONJALI COMMUNITY', 'Pemerintah Desa Sariharjo, Jl. Palagan Tentara Pelajar  No.20 Ngaglik, Sleman, Yogyakarta 55581', 0, 0, 'Sleman', 5, '0000-00-00', '12', '67', 'Ada', 'Dapur Umum, Komunikasi, Barak', '0274 869723', '085228653058/ 081215', 'Bula', '0000-00-00', 'Pemerintah Desa', '140,015', '150,015', '103,5', 'chain saw, Repeater', 'Repeater ISR No.  01713461-000SU/2620142019', 0, '0000-00-00 00:00:00', 1),
(17, 'Jalin Komunikasi Mandiri', 'Jetis Depok Sendangsari Minggir Sleman', 0, 0, 'Sleman', 3, '0000-00-00', '0', '169', 'ADA', 'PPGD, Vertikal Rescue, Jungle ', '', '', 'Triw', '0000-00-00', '', '140,016', '150,016', '104,5', '', '', 0, '0000-00-00 00:00:00', 1),
(18, 'BOLO TETULUNG', 'CEBONGAN LOR RT 4 RW 5 TLOGOADI MLATI SLEMAN DIY', 0, 0, 'Sleman', 0, '0000-00-00', '21', '82', 'TERLAMPIR', 'EVAKUASI MERAPI', '081 754 665 55', '081 325 738 951', 'PER ', '0000-00-00', ' CHRISCENTIANA NUNING NUGRAHA, SH (Notaris dan PPAT Sleman), DRS. URIP BAHAGIA (Kepala Bakesbanglinm', '140,017', '150,017', '105,5', 'SENSO, SRT, GENSET, LAMPU SOROT, RAKOM, KOMPUTER, ', '', 0, '0000-00-00 00:00:00', 1),
(19, 'BKL (bantaran kali loro) gendol opak', 'Brongkol Argomulyo Cangkringan', 0, 0, 'Sleman', 4, '0000-00-00', '6', '36', 'TIDAK ADA', 'komunikasi & informasi', '85747955398', '81578717636', 'Mala', '0000-00-00', 'Lurah Desa', '140,018', '150,018', '106,5', 'HT, RPU, Chainsaw, tali, stiklamp, lampu. ', 'kondisi alat memprihatinkan', 0, '0000-00-00 00:00:00', 1),
(20, 'FPRB BANDUNG BONDOWOSO', 'GAYAM RT 007/007 GAYAMHARJO PRAMBANAN,SLEMAN', 0, 0, 'Sleman', 5, '0000-00-00', '32', '35', '', '', '81328781100', '', 'TGL ', '0000-00-00', 'CAMAT PRAMBANAN', '140,019', '150,019', '107,5', 'ANGGOTA', '', 0, '0000-00-00 00:00:00', 1),
(21, 'RELAWAN MINOMARTANI COMMUNITY', 'Komplek Bale Desa Minomartani', 0, 0, 'Sleman', 3, '0000-00-00', '32', '75', 'ada', 'Logistik', '', '85702067620', '2 bu', '0000-00-00', 'Kepala Desa Minomartani', '140,02', '150,02', '108,5', '', '', 0, '0000-00-00 00:00:00', 1),
(22, 'LAPBA', 'Gatep 03/30 Purwobinangun pakem Sleman Yogyakarta', 0, 0, 'Sleman', 3, '0000-00-00', '0', '0', 'Ada', 'SAR,Logistik,Kesehatan', '85.643.779.862', '', 'Bula', '0000-00-00', 'Kepala Desa', '140,021', '150,021', '109,5', '', '', 0, '0000-00-00 00:00:00', 1),
(23, 'WIDODO SOCIAL COMMUNITY (WSC)', 'Klancingan Widodomartani Ngemplak Sleman Yogyakarta', 0, 0, 'Sleman', 5, '0000-00-00', '22', '47', 'belum', 'Informasi dan komunikasi, SAR ', '8179419257', '85385654001', 'Tiap', '0000-00-00', 'Kepala Desa Widodomartani', '140,022', '150,022', '110,5', 'Chain saw, angkong, Lampu lalu lintas', '0', 0, '0000-00-00 00:00:00', 1),
(24, 'GEMOEK REPEATER', 'JL TURI KROMODANGSAN LUMBUNGREJO TEMPEL SLEMAN', 0, 0, 'Sleman', 2, '0000-00-00', '20', '30', 'ADA', '', '81392081282', '', '2 BU', '0000-00-00', '', '140,023', '150,023', '111,5', '', '', 0, '0000-00-00 00:00:00', 1),
(25, 'Harjo Komunikasi', 'Jl. Kaliurang Km. 16,5 Citra Nugraha', 0, 0, 'Sleman', 5, '0000-00-00', '15', '50', '', 'Komunikasi', '8157984013', '81328222288', 'Seti', '0000-00-00', 'Kades Harjobinangun', '140,024', '150,024', '112,5', '', '', 0, '0000-00-00 00:00:00', 1),
(26, 'GM FKPPI 1203 Sleman', 'Jl. Magelang Km. 14, Temulawak X  11/38, Triharjo, Sleman', 0, 0, 'Sleman', 5, '0000-00-00', '6', '11', 'Ada ', 'Divisi Rescue GM FKPPI, Tim SA', '(0274) 866619', '85611168302', 'On C', '0000-00-00', 'Pengurus Besar PEPABRI', '140,025', '150,025', '113,5', '', '', 0, '0000-00-00 00:00:00', 1),
(27, 'MERKURI', 'KARANGPAKIS, WUKIRSARI, CANGKRINGAN', 0, 0, 'Sleman', 5, '0000-00-00', '14', '25', '', 'KOMUNIKASI', '81328412451', '81328412451', '2 BU', '0000-00-00', 'SUPRAPTO (KETUA RAPI SLEMAN)', '140,026', '150,026', '114,5', 'SENSO, GENSET', '', 0, '0000-00-00 00:00:00', 1),
(28, 'komunitas muncar komunikasi', 'jl.pelajar rt 05/18 kaliurang,hargobinangun pakem sleman ,yogyakarta', 0, 0, 'Sleman', 3, '0000-00-00', '22', '30', 'ADA', 'komunikasi ', '', '087 839 031 573', 'seti', '0000-00-00', 'kepala desa hargobinangun', '140,027', '150,027', '115,5', '', '', 0, '0000-00-00 00:00:00', 1),
(29, 'PALAPA SLEMAN (PAGUYUBAN RELAWAN PANDAWA)', 'DESA PANDOWOHARJO, KECAMATAN SLEMAN, KABUPATEN SLEMAN 55512', 0, 0, 'Sleman', 3, '0000-00-00', '28', '114', 'ADA', 'PENGUNGSIAN DAN PERLINDUNGAN, ', '85601582825', '81578063643', '2 BL', '0000-00-00', 'KEPALA DESA PANDOWOHARJO', '140,028', '150,028', '116,5', 'IURAN ANGGOTA', 'TGL PENGESAHAN 24 AGUSTUS 2014 NOMOR: 01/VIII/PDW/2014', 0, '0000-00-00 00:00:00', 1),
(30, 'SARANA KOMUNIKASI BERSAMA ( S K B )', 'JL. TURI KM 2 BLUNYAH RT 01/15 TRIMULYO SLEMAN SLEMAN', 0, 0, 'Sleman', 2, '0000-00-00', '6', '150', 'ADA', 'Pertukangan', '8179418090', '87739376866', '2 BU', '0000-00-00', 'WIHANDRIATI, S.H. (NOTARIS)', '140,029', '150,029', '117,5', 'SINSO         1 BUAH      ', '', 0, '0000-00-00 00:00:00', 1),
(31, 'KORELASI', 'Jl.Kaliurang Km.10.5  Sinduharjo Ngaglik Sleman Jogja ', 0, 0, 'Sleman', 5, '0000-00-00', '31', '95', '', 'Rescue', '0274 882 723', '081 328 207 239', 'Per ', '0000-00-00', 'Bupati sleman', '140,03', '150,03', '118,5', 'Korelasi', '', 0, '0000-00-00 00:00:00', 1),
(32, 'Relawan Jogja Timur ( RJT )', 'Timur,Selomartani,Kalasan', 0, 0, 'Sleman', 3, '0000-00-00', '11', '0', 'AD/ART', 'Dapur umum,komunikasi', '85868166232', '85729616789', 'tang', '0000-00-00', 'camat kalasan', '140,031', '150,031', '119,5', 'peralatan dapur umum,peralatan kerja bakti,komunik', '', 0, '0000-00-00 00:00:00', 1),
(33, 'RELAWAN DONOHARJO(RELADO)', 'Balai Desa Donoharjo, Jl. Palagan Tentara Pelajar Km. 14, Donoharjo, Ngaglik, Sleman, Yk ', 0, 0, 'Sleman', 2, '0000-00-00', '18', '50', 'Ada', 'Supporting(Logistik, Infokom)', '8157972216', '081328842634 (Guno),', '3 bu', '0000-00-00', 'Kepala Desa Donoharjo, Kec. Ngaglik', '140,032', '150,032', '120,5', 'Terlampir', '', 0, '0000-00-00 00:00:00', 1),
(34, 'Argo Merapi Comunnity', 'Bronggang Argomulyo Cangkringan', 0, 0, 'Sleman', 0, '0000-00-00', '10', '62', 'ada', 'SAR-PB,Kesehatan,pengelolaan b', '81227806699', '81227806699', 'ada', '0000-00-00', 'camatcangkringan', '140,033', '150,033', '121,5', 'zenso, megapone, dragbar', '', 0, '0000-00-00 00:00:00', 1),
(35, 'SKSB (Saluran Komunikasi Soial Bersama)', '       Pager Jurang, Kepuharjo, Cangkringan, Sleman', 0, 0, 'Sleman', 2, '0000-00-00', '13', '29', 'Ada', 'Komunikasi, Evakuasi, Transpor', '        \"\"0852931446', '            \"\"087838', '3 Bu', '0000-00-00', 'Idris Kadir', '140,034', '150,034', '122,5', '          SKSB', 'AD/ART ada , tp terbakar saat erupsi 2010', 0, '0000-00-00 00:00:00', 1),
(36, 'RESCUE 920', 'Jalan Raya Pakem Turi KM.2, Baratan rt 03/ rw 014, Candibinangun, Pakem, Sleman', 0, 0, 'Sleman', 3, '0000-00-00', '43', '177', 'ADA', 'SAR PB,Medis,Komunikasi,Dapur ', '0274 8599971', '\'087839031666', '1 Bu', '0000-00-00', 'Wakil Bupati Sleman (Hj. Yuni Setia Rahayu, S.S., M.Hum)', '140,035', '150,035', '123,5', '', 'SIAP SIGAP TANGGAP IKHLAS', 0, '0000-00-00 00:00:00', 1),
(37, 'RESCUE TABAH (Tanggap Musibah)', 'jl. Palagan Tentara Pelajar Km 7 Gg. Punokawan No. 212D Panggungsari Rt 10/23 Sariharjo, Ngaglik, Sleman, Yk', 0, 0, 'Sleman', 2, '0000-00-00', '14', '42', 'ada', 'SAR', '0274-9136991', '81804155719', 'sebu', '0000-00-00', '', '140,036', '150,036', '124,5', 'TB-01/2015', 'Semua Legalitas dalam proses', 0, '0000-00-00 00:00:00', 1),
(38, 'RESCUE 328 YOGYAKARTA', 'Jln. Magelang Km 4,5, Komplek Balai Desa Sinduadi Kec. Mlati Sleman', 0, 0, 'Sleman', 3, '0000-00-00', '21', '52', 'ADA', 'HARD RESCUE,MFR, JUNGLE RESCUE', '', '', '', '0000-00-00', 'Kepala Desa Sinduadi(Drs. Damanhuri, M.Ba)', '140,037', '150,037', '125,5', 'Ambulance,Peralatan Vertical,', '', 0, '0000-00-00 00:00:00', 1),
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkrb`
--

CREATE TABLE `tblkrb` (
  `idtblkrb` int(2) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblkrb`
--

INSERT INTO `tblkrb` (`idtblkrb`, `nama`, `deskripsi`, `flag`) VALUES
(1, 'KRB 1', 'Level 1', 0),
(2, 'KRB 2', 'Level 2', 0),
(3, 'KRB 3', 'Level 3', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllaporan`
--

CREATE TABLE `tbllaporan` (
  `idtbllaporan` int(11) NOT NULL,
  `idtbluser` int(11) DEFAULT NULL,
  `nir` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `bencana` int(11) DEFAULT NULL,
  `tgl_kejadian` datetime DEFAULT NULL,
  `rt` varchar(10) DEFAULT NULL,
  `rw` varchar(10) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `flag` int(1) DEFAULT 0 COMMENT '0 = not approve, 1 = approve, 2 = hoax',
  `status` varchar(20) DEFAULT NULL COMMENT '0 = blm ditangani, 1 = proses, 2 = hold, 3 = selesai',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `dampak` text DEFAULT NULL,
  `rangkuman_korban` text DEFAULT NULL,
  `notelp` varchar(20) DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `flag_tracking` int(11) DEFAULT 0,
  `ditracking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllaporan_detail`
--

CREATE TABLE `tbllaporan_detail` (
  `idtbllaporan_det` int(11) NOT NULL,
  `idtbllaporan` int(11) DEFAULT NULL,
  `idtbldampak` int(11) DEFAULT NULL,
  `jumlah` int(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllaporan_galery`
--

CREATE TABLE `tbllaporan_galery` (
  `idgalery` int(20) NOT NULL,
  `idtbllaporan` int(11) NOT NULL,
  `picture_name` varchar(100) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1 = picture, 2 = video',
  `size` int(40) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllaporan_kk`
--

CREATE TABLE `tbllaporan_kk` (
  `idtbllaporan_kk` int(11) NOT NULL,
  `idtbllaporan` int(11) NOT NULL,
  `idtblkk` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllaporan_personil`
--

CREATE TABLE `tbllaporan_personil` (
  `idpersonil` int(11) NOT NULL,
  `idtbllaporan` int(11) DEFAULT NULL,
  `idtblkaryawan` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllokasi_inventaris`
--

CREATE TABLE `tbllokasi_inventaris` (
  `idlokasi` int(4) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `crate_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblmenu`
--

CREATE TABLE `tblmenu` (
  `idtblmenu` int(12) NOT NULL,
  `menu` varchar(30) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `parent` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `position` int(2) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0,
  `group` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblmenu`
--

INSERT INTO `tblmenu` (`idtblmenu`, `menu`, `icon`, `parent`, `url`, `position`, `flag`, `group`) VALUES
(1, 'Lapor', 'mdi-action-dashboard', '17', 'main/tambah', 2, 0, 'main_menu'),
(2, 'Master Data', 'mdi-action-dashboard', '0', '#', 0, 0, 'main_menu'),
(3, 'Master Barang', '', '36', 'ms_barang', 2, 0, 'main_menu'),
(4, 'Master Gudang', '', '36', 'ms_gudang', 1, 0, 'main_menu'),
(5, 'Master Bencana', '', '2', 'ms_bencana', 3, 0, 'main_menu'),
(6, 'Master Barak', '', '40', 'ms_barak', 1, 0, 'main_menu'),
(7, 'Master Ews', '', '40', 'ms_ews', 2, 0, 'main_menu'),
(8, 'Master Ssb', '', '2', 'ms_ssb', 6, 0, 'main_menu'),
(9, 'Master Area', '', '32', 'ms_area', 1, 0, 'main_menu'),
(10, 'Master Destana', '', '2', 'ms_desa', 8, 0, 'main_menu'),
(11, 'Master Instansi', '', '2', 'ms_instansi', 9, 0, 'main_menu'),
(12, 'Master Peralatan', '', '2', 'ms_peralatan', 10, 0, 'main_menu'),
(13, 'Master Ternak', '', '2', 'ms_ternak', 11, 0, 'main_menu'),
(14, 'Master Keluarga', '', '32', 'ms_kk', 2, 0, 'main_menu'),
(15, 'Master Menu', '', '41', 'ms_menu', 2, 0, 'main_menu'),
(16, 'Master User', '', '41', 'ms_user', 1, 0, 'main_menu'),
(17, 'Transaksi', 'mdi-editor-border-all', '0', '#', 0, 0, 'main_menu'),
(18, 'Keluar Masuk Barang', '', '17', 'tr_keluar_masuk', 1, 0, 'main_menu'),
(19, 'Laporan', 'mdi-editor-insert-comment', '0', '#', 0, 0, 'main_menu'),
(20, 'Peta Kejadian', '', '19', 'peta_kejadian', 1, 0, 'admin'),
(21, 'Master Group', NULL, '41', 'ms_group', 3, 0, NULL),
(22, 'Approval Kejadian', NULL, '17', 'tr_approval', 2, 0, NULL),
(23, 'Master Kecakapan', NULL, '35', 'ms_kecakapan', 2, 0, NULL),
(24, 'Master Komunitas', 'a', '35', 'ms_komunitas', 1, 0, NULL),
(25, 'Export Data', NULL, '19', 'lp_export', 1, 0, NULL),
(26, 'Master Relawan', NULL, '35', 'ms_relawan', 3, 0, NULL),
(27, 'Pelaporan Lengkap', 'a', '17', 'main/tambah_manual', 18, 0, NULL),
(28, 'Peta Koordinat Relawan', 'a', '19', 'lp_map', 18, 0, NULL),
(29, 'Master Dampak', 'a', '2', 'ms_dampak', 18, 0, NULL),
(30, 'Absensi Relawan', 'a', '35', 'tr_absensi', 5, 0, NULL),
(31, 'Kegiatan Komunitas Relawan', 'mdi-action-accessibility', '35', 'tr_kegiatan', 4, 0, NULL),
(32, 'Admin WILDUK', 'mdi-action-accessibility', '0', '#', 0, 0, 'main_menu'),
(33, 'Broadcast', 'mdi-av-volume-up', '0', '#', 0, 0, 'main_menu'),
(34, 'Informasi dan Peringatan Dini', '#', '33', 'ms_peringatandini', 19, 0, NULL),
(35, 'Relawan', 'mdi-action-face-unlock', '0', '#', 0, 0, 'main_menu'),
(36, 'Gudang Dan Barang', 'mdi-action-account-balance', '0', '#', 0, 0, 'main_menu'),
(37, 'Pengaturan Jarak ', 'mdi-action-perm-data-setting', '0', '#', 0, 0, 'main_menu'),
(38, 'Jarak Aku dan MERAPI', '#', '37', 'ms_jarak', 19, 0, NULL),
(39, 'Master Karyawan', '#', '2', 'ms_karyawan', 20, 0, NULL),
(40, 'Infrastruktur', 'mdi-action-home', '0', '#', 0, 0, 'main_menu'),
(41, 'Pengaturan System', 'mdi-action-settings-applications', '0', '#', 0, 0, 'main_menu'),
(42, 'Pengungsian', 'mdi-action-accessibility', '0', '#', 0, 0, 'main_menu'),
(43, 'Titik Pengungsian', '#', '42', 'Ms_pengungsian_detail', 1, 0, NULL),
(44, 'Covid', 'mdi-action-bug-report', '0', '#', 0, 0, 'main_menu'),
(45, 'Potensi Penanganan Covid', '#', '44', 'Ms_potensi', 1, 0, NULL),
(46, 'Master Cuaca', 'mdi-action-loyalty', '2', 'Ms_cuaca', 21, 0, NULL),
(47, 'Master KML', 'mdi-action-loyalty', '2', 'Ms_kml', 22, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpengungsian`
--

CREATE TABLE `tblpengungsian` (
  `idtblpengungsian` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `penanggung_jawab` varchar(50) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `tampungreguler` int(6) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `tampungprotokol` int(11) DEFAULT NULL,
  `bilik` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `picture_name` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpengungsian_detail`
--

CREATE TABLE `tblpengungsian_detail` (
  `id` int(11) NOT NULL,
  `idtblpengungsian` int(11) DEFAULT NULL,
  `jumlahlaki` int(11) DEFAULT NULL,
  `jumlahperempuan` int(11) DEFAULT NULL,
  `dewasalaki` int(11) DEFAULT NULL,
  `dewasaperempuan` int(11) DEFAULT NULL,
  `anaklaki` int(11) DEFAULT NULL,
  `anakperempuan` int(11) DEFAULT NULL,
  `balitalaki` int(11) DEFAULT NULL,
  `balitaperempuan` int(11) DEFAULT NULL,
  `bayilaki` int(11) DEFAULT NULL,
  `bayiperempuan` int(11) DEFAULT NULL,
  `lansialaki` int(11) DEFAULT NULL,
  `lansiaperempuan` int(11) DEFAULT NULL,
  `difabellaki` int(11) DEFAULT NULL,
  `difabelperempuan` int(11) DEFAULT NULL,
  `bumil` int(11) DEFAULT NULL,
  `busui` int(11) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `kebutuhan` text DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblperalatan`
--

CREATE TABLE `tblperalatan` (
  `idtblperalatan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblperalatan`
--

INSERT INTO `tblperalatan` (`idtblperalatan`, `nama`, `deskripsi`, `create_date`, `flag`) VALUES
(1, 'Truk Bak Terbuka', 'Truk angkut barang', NULL, 0),
(2, 'Truk Serbaguna', 'Pengangkutan Evakuasi', NULL, 0),
(3, 'Chainsaw Besar', 'Peralatan Perlengkapan Lapangan TRC', '2017-10-07 13:43:49', 0),
(4, 'Chainsaw Sedang', 'Peralatan Perlengkapan Lapangan TRC', '2017-10-07 13:44:12', 0),
(5, 'Water Treatment Portable', 'menjernihkan air untuk  menjadi layak minum', '2019-09-18 12:10:39', 0),
(6, 'Truk Tangki', 'Truk pengangkut air', '2019-09-22 19:30:14', 0),
(7, 'Grand Max Blind Van', 'Kendaraan pengangkut logistik', '2019-09-23 17:30:48', 0),
(8, 'Light Tower Portable', 'Tower lampu dan Genset', '2019-09-23 17:31:31', 0),
(9, 'Genset Bensin', 'Alat pembangkit listrik', '2019-09-23 17:32:58', 0),
(10, 'Genset 2 Tak Kecil', 'Alat pembangkit listrik', '2019-09-23 17:49:13', 0),
(11, 'Pompa Air', 'Alat pemompa air', '2019-09-23 17:52:58', 0),
(12, 'Pompa Air Apung', 'Alat pemompa air yang dapat mengapung.', '2019-09-23 17:55:52', 0),
(13, 'Perahu Karet', '-', '2019-09-23 17:56:15', 0),
(14, 'Mesin Perahu Karet Tohatsu', '-', '2019-09-23 17:58:18', 0),
(15, 'Dayung Perahu Karet', '-', '2019-09-23 18:03:25', 0),
(16, 'Pelampung Perahu Karet', '-', '2019-09-23 18:03:48', 0),
(17, 'Helm Perahu Karet', '-', '2019-09-23 18:04:51', 0),
(18, 'Perahu Fiber', '-', '2019-09-23 18:05:41', 0),
(19, 'Dayung Perahu Fiber', '-', '2019-09-23 18:06:07', 0),
(20, 'Pelampung Perahu Fiber', '-', '2019-09-23 18:06:27', 0),
(21, 'Tenda Pengungsi', '-', '2019-09-23 18:07:02', 0),
(22, 'Tenda Posko', '-', '2019-09-23 18:07:42', 0),
(23, 'Tenda Keluarga', '-', '2019-09-23 18:08:12', 0),
(24, 'Velbed', '-', '2019-09-23 18:08:49', 0),
(25, 'Dragbar', '-', '2019-09-23 18:10:05', 0),
(26, 'Solar Home System Lamp', '-', '2019-09-23 18:10:29', 0),
(27, 'Solar Handle Crank Lamp', '-', '2019-09-23 18:10:47', 0),
(28, 'Angkong', '-', '2019-09-23 18:11:03', 0),
(29, 'Tali Tambang', '-', '2019-09-23 18:11:39', 0),
(30, 'Karpet', '-', '2019-09-23 18:11:57', 0),
(31, 'RIG Alinco DR-135', '-', '2019-09-23 18:16:49', 0),
(32, 'Kompuiter Dekstop Gudang', '-', '2019-09-23 18:17:37', 0),
(33, 'Meja Administrasi Gudang', '-', '2019-09-23 18:21:55', 0),
(34, 'Kursi Administrasi Gudang', '-', '2019-09-23 18:22:27', 0),
(35, 'Filling Cabinet', '-', '2019-09-23 18:23:15', 0),
(36, 'LED TV 32 inc', '_', '2019-09-23 18:23:45', 0),
(37, 'Portable Wireless Amplifier', '-', '2019-09-23 18:25:00', 0),
(38, 'Water Road Barrier', '-', '2019-09-23 18:25:20', 0),
(39, 'Traffic Cone', '-', '2019-09-23 18:26:07', 0),
(40, 'Hand Forklift', '-', '2019-09-23 18:26:35', 0),
(41, 'Troli Barang', '-', '2019-09-23 18:27:38', 0),
(42, 'Tangga Lipat Aluminium', '-', '2019-09-23 18:27:56', 0),
(43, 'APAR AV 45P', '-', '2019-09-23 18:30:07', 0),
(44, 'Lampu Emergency', '-', '2019-09-23 18:30:45', 0),
(45, 'Vaccum Cleaner', '-', '2019-09-23 18:31:17', 0),
(46, 'Blower/Exhaust Fan', '-', '2019-09-23 18:31:48', 0),
(47, 'Rak Logistik', 'Tempat penyimpanan logistik', '2019-09-23 18:32:49', 0),
(48, 'Ruangan Pusat Pengendalian Operasi', 'Ruang kerja Pusdalops', '2019-09-23 18:34:41', 0),
(49, 'Air Conditioner (AC)', '-', '2019-09-23 18:35:38', 0),
(50, 'Meja Manager', '-', '2019-09-23 18:35:53', 0),
(51, 'Meja Samping Manager', '-', '2019-09-23 18:37:35', 0),
(52, 'Credenza', '-', '2019-09-23 18:46:29', 0),
(53, 'Kursi Operator', '-', '2019-09-23 18:47:04', 0),
(54, 'Meja Sudut', '-', '2019-09-23 18:47:42', 0),
(55, 'Sofa 2 seet', '-', '2019-09-23 18:48:27', 0),
(56, 'Sofa 1 seet', '-', '2019-09-23 18:48:43', 0),
(57, 'Lemari Whiteboard', '-', '2019-09-23 18:49:09', 0),
(58, 'Meja Kerja Pusdalops', '-', '2019-09-23 18:50:01', 0),
(59, 'File Server', '-', '2019-09-23 18:50:14', 0),
(60, 'Komputer Dekstoop Pusdalops', '-', '2019-09-23 18:50:47', 0),
(61, 'Switch', '-', '2019-09-23 18:53:52', 0),
(62, 'Multi Function Printer', '-', '2019-09-23 18:54:46', 0),
(63, 'Software', '-', '2019-09-23 18:55:25', 0),
(64, 'Radio Komunikasi HF/SSB', '-', '2019-09-23 18:56:04', 0),
(65, 'LED TV 40 inc', '-', '2019-09-23 18:56:23', 0),
(66, 'KVM Switch', '-', '2019-09-23 18:56:48', 0),
(67, 'LED TV 90 inc', '-', '2019-09-23 18:57:40', 0),
(68, 'Stabilizier', '-', '2019-09-23 18:58:01', 0),
(69, 'UPS', '-', '2019-09-23 18:58:19', 0),
(70, 'Telepon Analog', '-', '2019-09-23 18:58:43', 0),
(71, 'Projector dan Analog', '-', '2019-09-23 19:03:23', 0),
(72, 'Karmantel', 'Peralatan SRT TRC', '2019-09-23 19:29:40', 0),
(73, 'Webbing', 'Peralatan SRT TRC', '2019-09-23 19:29:53', 0),
(74, 'Foor Loop', 'Peralatan SRT TRC', '2019-09-23 19:30:06', 0),
(75, 'Cow Stail', 'Peralatan SRT TRC', '2019-09-23 19:30:49', 0),
(76, 'Harnes', 'Peralatan SRT TRC', '2019-09-23 19:31:03', 0),
(77, 'Carabiner', 'Peralatan SRT TRC', '2019-09-23 19:31:34', 0),
(78, 'Hand Jammer', 'Peralatan SRT TRC', '2019-09-23 19:31:54', 0),
(79, 'Basic Jammer', 'Peralatan SRT TRC', '2019-09-23 20:36:20', 0),
(80, 'Croll', 'Peralatan SRT TRC', '2019-09-23 20:36:39', 0),
(81, 'Descender', 'Peralatan SRT TRC', '2019-09-23 20:36:56', 0),
(82, 'Pulley', 'Peralatan SRT TRC', '2019-09-23 20:37:20', 0),
(83, 'Figure Eight', 'Peralatan SRT TRC', '2019-09-23 20:37:36', 0),
(84, 'Padding/Pelindung Tali', 'Peralatan SRT TRC', '2019-09-23 20:38:07', 0),
(85, 'Helm', 'Peralatan SRT TRC', '2019-09-23 20:38:24', 0),
(86, 'Dragbar', 'Peralatan SRT TRC', '2019-09-23 20:38:41', 0),
(87, 'Tas', 'Peralatan SRT TRC', '2019-09-23 20:38:52', 0),
(88, 'Genset', 'Peralatan Penerangan TRC', '2019-09-23 20:39:24', 0),
(89, 'Lampu Tembak', 'Peralatan Penerangan TRC', '2019-09-23 20:39:34', 0),
(90, 'Kabel Listrik', 'Peralatan Penerangan TRC', '2019-09-23 20:39:50', 0),
(91, 'Tiang Lampu', 'Peralatan Penerangan TRC', '2019-09-23 20:40:12', 0),
(92, 'Senter', 'Peralatan Penerangan TRC', '2019-09-23 20:40:21', 0),
(93, 'Komputer Dekstop TRC', 'Peralatan Posko TRC', '2019-09-23 20:42:07', 0),
(94, 'Printer', 'Peralatan Posko TRC', '2019-09-23 20:42:23', 0),
(95, 'Flashdrive HP 16 gb', 'Peralatan Posko TRC', '2019-09-23 20:42:49', 0),
(96, 'Kamera Nikon Coolpix ', 'Peralatan Posko TRC', '2019-09-23 20:43:23', 0),
(97, 'Handycam Sony HDCX290', 'Peralatan Posko TRC', '2019-09-23 20:47:00', 0),
(98, 'Pemotong beton Medco', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:49:45', 0),
(99, 'Chainsaw Kecil', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:50:42', 0),
(100, 'Tali Tambang Plastik Kecil', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:51:09', 0),
(101, 'Tali Tambang Plastik Besar', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:51:56', 0),
(102, 'Tali Tambang Jerami Besar', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:52:21', 0),
(103, 'Tali Seling', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:52:59', 0),
(104, 'Dandang', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:53:11', 0),
(105, 'Sekop', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:53:26', 0),
(106, 'Senggrong', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:53:45', 0),
(107, 'Kampak', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:54:38', 0),
(108, 'Bodem', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:57:52', 1),
(109, 'Palu Tanggung', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 20:58:12', 1),
(110, 'Linggis', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:01:59', 0),
(111, 'Cuplik/Betel', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:02:33', 0),
(112, 'Jangkar Besi', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:02:56', 0),
(113, 'Gergaji Manual', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:03:38', 0),
(114, 'Sabit dan Bendo', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:03:56', 0),
(115, 'Angkong', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:04:07', 0),
(116, 'Traffic Cone', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:04:21', 0),
(117, 'Sarung Tangan', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:04:36', 0),
(118, 'Kacamata Lapangan', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:04:48', 0),
(119, 'Tri Pod', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:05:00', 0),
(120, 'Derek Manual', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:05:17', 0),
(121, 'Rain Coat', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:05:40', 0),
(122, 'Ponco', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:05:53', 0),
(123, 'Sepatu Boot', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:06:18', 0),
(124, 'Pompa Air', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:06:45', 0),
(125, 'Selang Pompa Air', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:07:00', 0),
(126, 'Megaphone', 'Peralatan Komunikasi TRC', '2019-09-23 21:07:40', 0),
(127, 'Radio RIG', 'Peralatan Komunikasi TRC', '2019-09-23 21:07:57', 0),
(128, 'HT Icom V80', 'Peralatan Komunikasi TRC', '2019-09-23 21:08:41', 0),
(129, 'HT Firstcom FC 136', 'Peralatan Komunikasi TRC', '2019-09-23 21:09:00', 0),
(130, 'HT Firscom FC 08', 'Peralatan Komunikasi TRC', '2019-09-23 21:09:43', 0),
(131, 'HT Aicom V 80', 'Peralatan Komunikasi TRC', '2019-09-23 21:10:02', 0),
(132, 'Toyota Kijang', 'Armada Operasional TRC', '2019-09-23 21:11:37', 0),
(133, 'Mitsubishi Colt SS', 'Armada Operasional TRC', '2019-09-23 21:11:56', 0),
(134, 'Isuzu Panther', 'Armada Operasional TRC', '2019-09-23 21:12:18', 0),
(135, 'Kawasaki Trail KLX Putih', 'Armada Operasional TRC', '2019-09-23 21:12:54', 0),
(136, 'Kawasaki Trail KLX Orange', 'Armada Operasional TRC', '2019-09-23 21:13:20', 0),
(137, 'GPS Garmin Oregon 300', 'Peralatan Perlengkapan Lapangan TRC', '2019-09-23 21:14:25', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblperalatan_detail`
--

CREATE TABLE `tblperalatan_detail` (
  `id` int(11) NOT NULL,
  `idtblperalatan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `qty_baik` int(10) DEFAULT NULL,
  `qty_rusak` int(10) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblperalatan_detail`
--

INSERT INTO `tblperalatan_detail` (`id`, `idtblperalatan`, `nama`, `alamat`, `qty_baik`, `qty_rusak`, `tlpn`, `create_date`, `flag`) VALUES
(1, 1, 'BPBD Kab. Sleman', 'Jl. Candi Boko Beran Tridadi Sleman Yogyakarta 55511', 1, 0, '(0274) 868504, 86937', '2019-09-25 09:13:59', 0),
(2, 2, 'BPBD Kab. Sleman', 'Jl. Candi Boko Beran Tridadi Sleman Yogyakarta 55511', 1, 0, '(0274) 868504, 86937', '2019-09-25 09:19:23', 0),
(3, 5, 'BPBD Kab. Sleman', 'Jl. Candi Boko Beran Tridadi Sleman Yogyakarta 55511', 1, 0, '(0274) 868504, 86937', '2019-09-25 09:28:15', 0),
(4, 6, 'BPBD Kab. Sleman', 'Jl. Candi Boko Beran Tridadi Sleman Yogyakarta 55511', 1, 0, '(0274) 868504, 86937', '2019-09-25 09:34:43', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblperingatandini`
--

CREATE TABLE `tblperingatandini` (
  `idperingatan` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `keterangan` varchar(5000) DEFAULT NULL,
  `time_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpotensi`
--

CREATE TABLE `tblpotensi` (
  `idtblpotensi` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `kecamatan` int(11) DEFAULT NULL,
  `Penanggungjawab` varchar(100) DEFAULT NULL,
  `jml_anggota` varchar(20) DEFAULT NULL,
  `kemampuan` varchar(30) DEFAULT NULL,
  `tlpn_sekretariat` varchar(20) DEFAULT NULL,
  `tlpn_alternative` varchar(20) DEFAULT NULL,
  `peralatan` varchar(50) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblrelawan`
--

CREATE TABLE `tblrelawan` (
  `idtblrelawan` int(11) NOT NULL,
  `no_induk` varchar(20) NOT NULL,
  `nama_relawan` varchar(100) DEFAULT NULL,
  `nik` int(11) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `kecamatan` int(11) DEFAULT NULL,
  `desa` int(11) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `kecakapan` int(11) DEFAULT NULL,
  `komunitas` int(11) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblrelawan`
--

INSERT INTO `tblrelawan` (`idtblrelawan`, `no_induk`, `nama_relawan`, `nik`, `jenis_kelamin`, `alamat`, `kelurahan`, `kecamatan`, `desa`, `tempat_lahir`, `tgl_lahir`, `kecakapan`, `komunitas`, `create_user`, `create_time`) VALUES
(3405, '340410000106', 'AGUS DWI MARYANTO', 0, 'Laki - Lak', 'SURUH', 0, 0, 0, 'CILACAP', '1981-08-21', 6, 34, '1', '0000-00-00 00:00:00'),
(3406, '340410000206', 'AHMAD FATKURRAHMAN', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1995-03-21', 6, 34, '1', '0000-00-00 00:00:00'),
(3407, '340410000323', 'AHMAD ZIDNI NURI', 0, 'Laki - Lak', 'JARANAN', 0, 0, 0, 'SLEMAN', '1968-06-25', 23, 34, '1', '0000-00-00 00:00:00'),
(3408, '340410000406', 'ALEX S ABDURRAHMAN', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '0000-00-00', 6, 34, '1', '0000-00-00 00:00:00'),
(3409, '340410000506', 'ALIIEF DWI CAHYO', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1990-09-18', 6, 34, '1', '0000-00-00 00:00:00'),
(3410, '340410000606', 'ANGKEL PUTRA UTARA', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1988-10-15', 6, 34, '1', '0000-00-00 00:00:00'),
(3411, '340410000706', 'BUDI RAHMANTO', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1977-05-01', 6, 34, '1', '0000-00-00 00:00:00'),
(3412, '340410000823', 'DARJANA', 0, 'Laki - Lak', 'PANGGUNG', 0, 0, 0, 'SLEMAN', '1956-06-26', 23, 34, '1', '0000-00-00 00:00:00'),
(3413, '340410000906', 'EDI SUYONO', 0, 'Laki - Lak', 'JARANAN', 0, 0, 0, 'SLEMAN', '1975-07-08', 6, 34, '1', '0000-00-00 00:00:00'),
(3414, '340410001012', 'ERY', 0, 'Laki - Lak', 'SURUH', 0, 0, 0, 'SLEMAN', '0000-00-00', 5, 34, '1', '0000-00-00 00:00:00'),
(3415, '340410001123', 'ETIK RATNAWATI', 0, 'Laki - Lak', 'KUWANG ', 0, 0, 0, 'SLEMAN', '1973-05-02', 23, 34, '1', '0000-00-00 00:00:00'),
(3416, '340410001206', 'FAUZAN KURNIA AKBAR, ST', 0, 'Laki - Lak', 'RANDUSARI ', 0, 0, 0, 'SLLEMAN', '1976-06-27', 6, 34, '1', '0000-00-00 00:00:00'),
(3417, '340410001306', 'FX. SUHARI', 0, 'Laki - Lak', 'KORIPAN', 0, 0, 0, 'SLEMAN', '1968-06-08', 6, 34, '1', '0000-00-00 00:00:00'),
(3418, '340410001423', 'HARIS PURWANTA', 0, 'Laki - Lak', 'TAWANGRENGGO', 0, 0, 0, 'SLEMAN', '1966-08-11', 23, 34, '1', '0000-00-00 00:00:00'),
(3419, '340410001505', 'HARIYADI NOLOYUDO', 0, 'Laki - Lak', 'TEPLOK', 0, 0, 0, 'SLEMAN', '1976-10-05', 5, 34, '1', '0000-00-00 00:00:00'),
(3420, '340410001605', 'HERU PRASETYO', 0, 'Laki - Lak', 'BRONGGANG ', 0, 0, 0, 'SLEMAN', '1970-07-03', 5, 34, '1', '0000-00-00 00:00:00'),
(3421, '340410001706', 'HERU SUSANTO', 0, 'Laki - Lak', 'KUWANG ', 0, 0, 0, 'SLEMAN', '1982-07-20', 6, 34, '1', '0000-00-00 00:00:00'),
(3422, '340410001812', 'HERY WIBOWO', 0, 'Laki - Lak', 'BAKALAN  2/29', 0, 0, 0, 'SLEMAN', '0000-00-00', 5, 34, '1', '0000-00-00 00:00:00'),
(3423, '340410001906', 'IDUL RIYADI', 0, 'Laki - Lak', 'BAKALAN ', 0, 0, 0, 'SLEMAN', '1983-06-24', 6, 34, '1', '0000-00-00 00:00:00'),
(3424, '340410002006', 'IR. HARYADI', 0, 'Laki - Lak', 'RANDUSARI ', 0, 0, 0, 'SLEMAN', '1970-02-25', 6, 34, '1', '0000-00-00 00:00:00'),
(3425, '340410002106', 'IRPAN ABDULRAHMAN', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1990-08-07', 6, 34, '1', '0000-00-00 00:00:00'),
(3426, '340410002223', 'JAKA SUTRISNA, S.PD.I', 0, 'Laki - Lak', 'TAWANGRENGGO', 0, 0, 0, 'SLEMAN', '1968-07-25', 23, 34, '1', '0000-00-00 00:00:00'),
(3427, '340410002306', 'MAKRUF WINARTO', 0, 'Laki - Lak', 'KLIWANG', 0, 0, 0, 'SLEMAN', '1966-10-10', 6, 34, '1', '0000-00-00 00:00:00'),
(3428, '340410002423', 'MARCELLIUS RADITYA CAHYA S', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1989-06-03', 23, 34, '1', '0000-00-00 00:00:00'),
(3429, '340410002506', 'MUH. FAJARUDIN', 0, 'Laki - Lak', 'GADINGAN ', 0, 0, 0, 'SLEMAN', '1995-03-14', 6, 34, '1', '0000-00-00 00:00:00'),
(3430, '340410002623', 'MUHAMMAD ALI SIGIT WIDADA', 0, 'Laki - Lak', 'KLIWANG', 0, 0, 0, 'SLEMAN', '1975-04-16', 23, 34, '1', '0000-00-00 00:00:00'),
(3431, '340410002706', 'MUJIYANTA', 0, 'Laki - Lak', 'KEBURLOR', 0, 0, 0, 'SLEMAN', '1970-05-18', 6, 34, '1', '0000-00-00 00:00:00'),
(3432, '340410002806', 'PARJIYANA', 0, 'Laki - Lak', 'GADINGAN ', 0, 0, 0, 'SLEMAN', '1978-07-01', 6, 34, '1', '0000-00-00 00:00:00'),
(3433, '340410002906', 'PARTONO', 0, 'Laki - Lak', 'BAKALAN ', 0, 0, 0, 'SLEMAN', '1972-04-04', 6, 34, '1', '0000-00-00 00:00:00'),
(3434, '340410003006', 'RAPIH SAPTA', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1990-09-24', 6, 34, '1', '0000-00-00 00:00:00'),
(3435, '340410003106', 'RIDWAN NURSALIM', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'SLEMAN', '1968-02-07', 6, 34, '1', '0000-00-00 00:00:00'),
(3436, '340410003206', 'RIYANTA', 0, 'Laki - Lak', 'PANGGUNG', 0, 0, 0, 'SLEMAN', '1961-02-25', 6, 34, '1', '0000-00-00 00:00:00'),
(3437, '340410003306', 'SARJU MANGKU SENGOJO', 0, 'Laki - Lak', 'RANDUSARI ', 0, 0, 0, 'SLEMAN', '1965-12-31', 6, 34, '1', '0000-00-00 00:00:00'),
(3438, '340410003406', 'SRIYANTO', 0, 'Laki - Lak', 'BANARAN', 0, 0, 0, 'SLEMAN', '1963-10-04', 6, 34, '1', '0000-00-00 00:00:00'),
(3439, '3404100034408', 'ABDUL ROHMAN', 0, 'Laki - Lak', 'KROMODANGSAN 03/18 ', 0, 0, 0, 'MAGELANG', '1976-08-18', 8, 24, '1', '0000-00-00 00:00:00'),
(3440, '3404100034506', 'ANGGI BAGUS FERDYAWAN', 0, 'Laki - Lak', 'KROMODANGSAN 01/17 ', 0, 0, 0, 'YOGYAKARTA', '1991-02-03', 6, 24, '1', '0000-00-00 00:00:00'),
(3441, '3404100034606', 'ARIS GIYATNO', 0, 'Laki - Lak', 'KROMODANGSAN 03/18 ', 0, 0, 0, 'SLEMAN', '1983-08-10', 6, 24, '1', '0000-00-00 00:00:00'),
(3442, '3404100034706', 'ARWIN SUTIKNO', 0, 'Laki - Lak', 'KROMODANGSAN 01/17 ', 0, 0, 0, 'SLEMAN', '1986-09-18', 6, 24, '1', '0000-00-00 00:00:00'),
(3443, '3404100034807', 'DANI WIBOWO', 0, 'Laki - Lak', 'KROMODANGSAN 04/18 ', 0, 0, 0, 'TEMANGGUNG', '1983-04-02', 7, 24, '1', '0000-00-00 00:00:00'),
(3444, '3404100034910', 'GUNANTORO', 0, 'Laki - Lak', 'KOPEN 06/20 ', 0, 0, 0, 'SLEMAN', '1975-10-26', 10, 24, '1', '0000-00-00 00:00:00'),
(3445, '3404100035001', 'HENDRO YUWONO', 0, 'Laki - Lak', 'KROMODANGSAN 01/17 ', 0, 0, 0, 'TEMANGGUNG', '1961-04-13', 1, 24, '1', '0000-00-00 00:00:00'),
(3446, '340410003506', 'SUBARJA', 0, 'Laki - Lak', 'JIWAN', 0, 0, 0, 'SLEMAN', '1967-07-30', 6, 34, '1', '0000-00-00 00:00:00'),
(3447, '3404100035106', 'IMAM SUHADI', 0, 'Laki - Lak', 'KROMODANGSAN 02/17 ', 0, 0, 0, 'SLEMAN', '1966-09-05', 6, 24, '1', '0000-00-00 00:00:00'),
(3448, '3404100035223', 'KAWITNA', 0, 'Laki - Lak', 'KROMODANGSAN 03/18 ', 0, 0, 0, '', '0000-00-00', 23, 24, '1', '0000-00-00 00:00:00'),
(3449, '3404100035312', 'LUQMAN HAKIM', 0, 'Laki - Lak', 'KRICAKAN MESIR 03/06 ', 0, 0, 0, 'MAGELANG', '1989-03-25', 5, 24, '1', '0000-00-00 00:00:00'),
(3450, '3404100035423', 'MOMON BANDONO', 0, 'Laki - Lak', 'PATEN 05/05', 0, 0, 0, 'YOGYAKARTA', '1955-07-12', 23, 24, '1', '0000-00-00 00:00:00'),
(3451, '3404100035506', 'MUHAMMAD ALWI', 0, 'Laki - Lak', 'NGEBONG', 0, 0, 0, 'SLEMAN', '1960-12-18', 6, 24, '1', '0000-00-00 00:00:00'),
(3452, '3404100035617', 'MURYANTI', 0, 'Perempuan', 'KROMODANGSAN 01/17 ', 0, 0, 0, 'SLEMAN', '1962-04-15', 17, 24, '1', '0000-00-00 00:00:00'),
(3453, '3404100035701', 'NUGROHO SUBAGYO', 0, 'Laki - Lak', 'NGEPOS 5/25 ', 0, 0, 0, 'SLEMAN', '1970-02-11', 1, 24, '1', '0000-00-00 00:00:00'),
(3454, '3404100035801', 'NURKHOLIS', 0, 'Laki - Lak', 'KRASAKAN 02/13 ', 0, 0, 0, 'SLEMAN', '1966-01-01', 1, 24, '1', '0000-00-00 00:00:00'),
(3455, '3404100035907', 'PARYADI', 0, 'Laki - Lak', 'KROMODANGSAN 03/18 ', 0, 0, 0, 'SLEMAN', '1987-10-01', 7, 24, '1', '0000-00-00 00:00:00'),
(3456, '3404100036006', 'PUTUT PURWANDITO', 0, 'Laki - Lak', 'KROMODANGSAN 02/17 ', 0, 0, 0, 'SLEMAN', '1977-05-14', 6, 24, '1', '0000-00-00 00:00:00'),
(3457, '340410003606', 'SUMARNO', 0, 'Laki - Lak', 'DAWUNG', 0, 0, 0, 'SLEMAN', '1973-06-18', 6, 34, '1', '0000-00-00 00:00:00'),
(3458, '3404100036106', 'RONALDO FEBRIANTO KURNIAWAN', 0, 'Laki - Lak', 'KROMODANGSAN 01/17 ', 0, 0, 0, 'SLEMAN', '1991-02-19', 6, 24, '1', '0000-00-00 00:00:00'),
(3459, '3404100036207', 'SARI MURWADI', 0, 'Laki - Lak', 'KROMODANGSAN 03/18 ', 0, 0, 0, 'SLEMAN', '1965-08-03', 7, 24, '1', '0000-00-00 00:00:00'),
(3460, '3404100036306', 'SARIYONO', 0, 'Laki - Lak', 'KROMODANGSAN 03/18 ', 0, 0, 0, 'SLEMAN', '1981-10-26', 6, 24, '1', '0000-00-00 00:00:00'),
(3461, '3404100036407', 'SUGENG RIYANTO', 0, 'Laki - Lak', 'KROMODANGSAN 03/18 ', 0, 0, 0, '', '0000-00-00', 7, 24, '1', '0000-00-00 00:00:00'),
(3462, '3404100036523', 'SUHARJASA', 0, 'Laki - Lak', 'KOPEN 02/19 ', 0, 0, 0, 'SLEMAN', '1962-11-02', 23, 24, '1', '0000-00-00 00:00:00'),
(3463, '3404100036608', 'SUMARI RAHAYU', 0, 'Perempuan', 'KROMODANGSAN 001/017', 0, 0, 0, 'SLEMAN', '1978-11-15', 8, 24, '1', '0000-00-00 00:00:00'),
(3464, '3404100036723', 'SUPARNO', 0, 'Laki - Lak', 'KOPEN 01/19 ', 0, 0, 0, 'SLEMAN', '1955-05-05', 23, 24, '1', '0000-00-00 00:00:00'),
(3465, '3404100036805', 'SUPRIYONO', 0, 'Laki - Lak', 'TEMPEL 02/25', 0, 0, 0, 'SLEMAN', '1960-10-30', 5, 24, '1', '0000-00-00 00:00:00'),
(3466, '3404100036907', 'SUSILA', 0, 'Laki - Lak', '', 0, 0, 0, '', '0000-00-00', 7, 24, '1', '0000-00-00 00:00:00'),
(3467, '3404100037006', 'SUWANTO', 0, 'Laki - Lak', 'TEMPEL', 0, 0, 0, 'SLEMAN', '1966-03-23', 6, 24, '1', '0000-00-00 00:00:00'),
(3468, '3404100037123', 'SUYANTO', 0, 'Laki - Lak', 'NGELEBENG 03/08 ', 0, 0, 0, 'SLEMAN', '1965-02-17', 23, 24, '1', '0000-00-00 00:00:00'),
(3469, '3404100037223', 'TOTOK SUROTO', 0, 'Laki - Lak', 'KROMODANGSAN 01/17 ', 0, 0, 0, 'SLEMAN', '1951-05-30', 23, 24, '1', '0000-00-00 00:00:00'),
(3470, '340410003723', 'SUNANDAR', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1982-06-17', 23, 34, '1', '0000-00-00 00:00:00'),
(3471, '3404100037305', 'TRI WAHYU UTAMA', 0, 'Laki - Lak', 'KROMODANGSAN 02/17 ', 0, 0, 0, 'SLEMAN', '1990-12-15', 6, 24, '1', '0000-00-00 00:00:00'),
(3472, '3404100037406', 'TUKIJO', 0, 'Laki - Lak', 'CUNGKUK 02/19 ', 0, 0, 0, 'SLEMAN', '1974-06-05', 6, 24, '1', '0000-00-00 00:00:00'),
(3473, '3404100037506', 'WAKIDI WIDIARSO', 0, 'Laki - Lak', 'NGEPOS 5/25 ', 0, 0, 0, 'SLEMAN', '1953-08-08', 6, 24, '1', '0000-00-00 00:00:00'),
(3474, '3404100037606', 'YANI SUTRISNO', 0, 'Laki - Lak', 'PANGGUNG 10/17 ', 0, 0, 0, 'SLEMAN', '1967-02-07', 6, 24, '1', '0000-00-00 00:00:00'),
(3475, '340410003823', 'SUPENO', 0, 'Laki - Lak', 'BAKALAN  2/29', 0, 0, 0, 'SLEMAN', '0000-00-00', 23, 34, '1', '0000-00-00 00:00:00'),
(3476, '340410003906', 'SUPRIYANTO', 0, 'Laki - Lak', 'JARANAN', 0, 0, 0, 'SLEMAN', '1978-06-27', 6, 34, '1', '0000-00-00 00:00:00'),
(3477, '340410004006', 'SUYATNO', 0, 'Laki - Lak', 'JARANAN', 0, 0, 0, 'SLEMAN', '1959-06-20', 6, 34, '1', '0000-00-00 00:00:00'),
(3478, '340410004106', 'SUYUDI', 0, 'Laki - Lak', 'BRONGGANG ', 0, 0, 0, 'SLEMAN', '1965-07-02', 6, 34, '1', '0000-00-00 00:00:00'),
(3479, '340410004206', 'SYAHRIL FATONI', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1994-12-06', 6, 34, '1', '0000-00-00 00:00:00'),
(3480, '340410004306', 'THEO EDI MARYONO', 0, 'Laki - Lak', 'BAKALAN ', 0, 0, 0, 'SLEMAN', '1977-09-23', 6, 34, '1', '0000-00-00 00:00:00'),
(3481, '340410004406', 'TOPO HARDONO', 0, 'Laki - Lak', 'KUWANG ', 0, 0, 0, 'SLEMAN', '1963-03-06', 6, 34, '1', '0000-00-00 00:00:00'),
(3482, '340410004512', 'TOTO SUKMONO', 0, 'Laki - Lak', 'SURUH ', 0, 0, 0, 'SLEMAN', '1972-03-10', 5, 34, '1', '0000-00-00 00:00:00'),
(3483, '340410004606', 'TRI WIDIANTARA', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1991-08-20', 6, 34, '1', '0000-00-00 00:00:00'),
(3484, '340410004706', 'UNTUNG SLAMET RIYANTO', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1971-03-22', 6, 34, '1', '0000-00-00 00:00:00'),
(3485, '340410004823', 'WIJIYANTO', 0, 'Laki - Lak', 'RANDUSARI ', 0, 0, 0, 'SLEMAN', '1956-06-08', 23, 34, '1', '0000-00-00 00:00:00'),
(3486, '340410004906', 'YAFIE AHMACH', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1989-07-05', 6, 34, '1', '0000-00-00 00:00:00'),
(3487, '340410005006', 'YUSAFAT SUGIANTORO', 0, 'Laki - Lak', 'KUWANG ', 0, 0, 0, 'SLEMAN', '1971-06-11', 6, 34, '1', '0000-00-00 00:00:00'),
(3488, '3404110037708', 'AN. SIGIT PRASETYO', 0, 'Laki - Lak', 'POJOK, RT/RW 001/015', 0, 0, 0, 'SOLO', '1977-10-29', 8, 25, '1', '0000-00-00 00:00:00'),
(3489, '3404110037810', 'CAHYO PRAMONO', 0, 'Laki - Lak', 'TURGOREJO, RT/RW 001/021', 0, 0, 0, 'SLEMAN', '1983-10-10', 10, 25, '1', '0000-00-00 00:00:00'),
(3490, '3404110037911', 'EKO SUSILO NUGROHO', 0, 'Laki - Lak', 'KATEN, RT/RW 02/13', 0, 0, 0, '', '1975-02-16', 11, 25, '1', '0000-00-00 00:00:00'),
(3491, '3404110038006', 'HANDIKA RAKHMAWAN. H.', 0, 'Laki - Lak', 'CEPIT', 0, 0, 0, 'SLEMAN', '1986-01-02', 6, 25, '1', '0000-00-00 00:00:00'),
(3492, '3404110038111', 'HARYONO', 0, 'Laki - Lak', 'KEMBANGAN', 0, 0, 0, '', '1972-01-14', 11, 25, '1', '0000-00-00 00:00:00'),
(3493, '3404110038213', 'HERDIAN LARASATI', 0, 'Perempuan', 'KALIWANGLU WETAN RT/RW 01/19', 0, 0, 0, 'SLEMAN', '1991-09-30', 13, 25, '1', '0000-00-00 00:00:00'),
(3494, '3404110038308', 'RACHMAD TRIWIBOWO', 0, 'Laki - Lak', 'PELEM RT/RW 05/024', 0, 0, 0, 'SLEMAN', '1978-08-16', 8, 25, '1', '0000-00-00 00:00:00'),
(3495, '3404110038408', 'SIGIT MUJIARTO', 0, 'Laki - Lak', 'NGANGGRUNG', 0, 0, 0, 'YOGYAKARTA', '1974-01-25', 8, 25, '1', '0000-00-00 00:00:00'),
(3496, '3404110038508', 'SIHONO', 0, 'Laki - Lak', 'BENDOSARI', 0, 0, 0, 'SLEMAN', '1977-06-16', 8, 25, '1', '0000-00-00 00:00:00'),
(3497, '3404110038606', 'SUPRIHONO', 0, 'Laki - Lak', 'KATEN, RT/RW 02/13', 0, 0, 0, 'SLEMAN', '1968-10-25', 6, 25, '1', '0000-00-00 00:00:00'),
(3498, '3404120038713', 'AGUS BANDIANTO', 0, 'Laki - Lak', 'NAMBONGAN', 0, 0, 0, 'SLEMAN', '1984-08-15', 13, 17, '1', '0000-00-00 00:00:00'),
(3499, '3404120038813', 'AGUSTINUS S.SANTOSO', 0, 'Laki - Lak', 'JETIS DEPOK', 0, 0, 0, 'SLEMAN', '1978-06-02', 13, 17, '1', '0000-00-00 00:00:00'),
(3500, '3404120038913', 'ANGGA SURNA PRIHANTOKO', 0, 'Laki - Lak', 'JODAG', 0, 0, 0, 'SLEMAN', '1993-07-11', 13, 17, '1', '0000-00-00 00:00:00'),
(3501, '3404120039013', 'BAMBANG DJADMIKO', 0, 'Laki - Lak', 'SINGOJAYAN ', 0, 0, 0, 'SLEMAN', '1968-03-23', 13, 17, '1', '0000-00-00 00:00:00'),
(3502, '3404120039107', 'BATI WAHYUDI', 0, 'Laki - Lak', 'PEDARAN RT 03/3', 0, 0, 0, 'SLEMAN', '1986-10-13', 7, 17, '1', '0000-00-00 00:00:00'),
(3503, '3404120039213', 'BASIRUN', 0, 'Laki - Lak', 'NANGGULAN ', 0, 0, 0, 'SLEMAN', '1979-03-30', 13, 17, '1', '0000-00-00 00:00:00'),
(3504, '3404120039313', 'DWI PURWANTO', 0, 'Laki - Lak', 'PARAKAN KULON', 0, 0, 0, 'SLEMAN', '1980-10-22', 13, 17, '1', '0000-00-00 00:00:00'),
(3505, '3404120039413', 'EKA WAHANA', 0, 'Laki - Lak', 'JETIS DEPOK', 0, 0, 0, 'KULON PROGO', '1982-08-04', 13, 17, '1', '0000-00-00 00:00:00'),
(3506, '3404120039513', 'EKO BUDI LESTARI', 0, 'Laki - Lak', ' MRIYAN', 0, 0, 0, 'SLEMAN', '1979-01-11', 13, 17, '1', '0000-00-00 00:00:00'),
(3507, '3404120039613', 'EKO WAHYUDI', 0, 'Laki - Lak', 'SUTAN', 0, 0, 0, 'SLEMAN', '1979-06-17', 13, 17, '1', '0000-00-00 00:00:00'),
(3508, '3404120039713', 'ERIK DANULARTA', 0, 'Laki - Lak', 'JETIS DEPOK', 0, 0, 0, 'GUNUNG KIDUL', '1967-02-15', 13, 17, '1', '0000-00-00 00:00:00'),
(3509, '3404120039813', 'FRANSISCUS HARYADI', 0, 'Laki - Lak', 'PINGITAN', 0, 0, 0, 'SLEMAN', '1974-10-10', 13, 17, '1', '0000-00-00 00:00:00'),
(3510, '3404120039913', 'GIDEON PANDU WINATA', 0, 'Laki - Lak', 'JL.KH.MUDI NO.172 DEPOK', 0, 0, 0, 'TEGAL', '1990-10-06', 13, 17, '1', '0000-00-00 00:00:00'),
(3511, '3404120040013', 'GUNTUR SAPUTRO', 0, 'Laki - Lak', 'WATUKARUNG', 0, 0, 0, 'SLEMAN', '1965-06-04', 13, 17, '1', '0000-00-00 00:00:00'),
(3512, '3404120040102', 'KARDONO', 0, 'Laki - Lak', 'KROMPAKAN', 0, 0, 0, 'SLEMAN', '1965-09-14', 2, 17, '1', '0000-00-00 00:00:00'),
(3513, '3404120040207', 'MUZNI SURURI', 0, 'Laki - Lak', 'NGIJON XX MALANGAN', 0, 0, 0, 'SLEMAN', '1976-05-26', 7, 17, '1', '0000-00-00 00:00:00'),
(3514, '3404120040313', 'NANANG EKA NUNGGRAHA', 0, 'Laki - Lak', 'BALAN ', 0, 0, 0, 'SEMARANG', '1994-02-05', 13, 17, '1', '0000-00-00 00:00:00'),
(3515, '3404120040413', 'NEVI TRIRATNO', 0, 'Laki - Lak', 'JATEN', 0, 0, 0, 'SLEMAN', '1967-06-06', 13, 17, '1', '0000-00-00 00:00:00'),
(3516, '3404120040513', 'PARNA', 0, 'Laki - Lak', 'PARAKAN KULON', 0, 0, 0, 'SLEMAN', '1969-05-01', 13, 17, '1', '0000-00-00 00:00:00'),
(3517, '3404120040613', 'SAPTO HARYANTO', 0, 'Laki - Lak', 'JODAG', 0, 0, 0, 'SLEMAN', '1986-09-25', 13, 17, '1', '0000-00-00 00:00:00'),
(3518, '3404120040713', 'SEPTIAN HIDAYAT', 0, 'Laki - Lak', 'KIYUDAN,', 0, 0, 0, 'SIEMAN', '1985-09-28', 13, 17, '1', '0000-00-00 00:00:00'),
(3519, '3404120040813', 'STEPANUS KUWADI', 0, 'Laki - Lak', 'MINGGIR III', 0, 0, 0, 'SLEMAN', '1974-07-07', 13, 17, '1', '0000-00-00 00:00:00'),
(3520, '3404120040913', 'SUPARYANTO', 0, 'Laki - Lak', 'TEGAL KLAGARAN', 0, 0, 0, 'GUNUNG KIDUL', '1966-01-15', 13, 17, '1', '0000-00-00 00:00:00'),
(3521, '3404120041013', 'TRI YUWANA', 0, 'Laki - Lak', 'TENGAHAN XII ', 0, 0, 0, 'SLEMAN', '1980-06-01', 13, 17, '1', '0000-00-00 00:00:00'),
(3522, '3404120041113', 'TRIYONO WINTOKO', 0, 'Laki - Lak', 'KLEBEN', 0, 0, 0, 'SLEMAN', '0000-00-00', 13, 17, '1', '0000-00-00 00:00:00'),
(3523, '3404120041213', 'WEMPI DANI SAPUTRA', 0, 'Laki - Lak', 'PULUHAN ', 0, 0, 0, 'SLEMAN', '1994-03-30', 13, 17, '1', '0000-00-00 00:00:00'),
(3524, '3404120041313', 'YUS SUSANTO', 0, 'Laki - Lak', 'GATAK', 0, 0, 0, 'SLEMAN', '1968-03-03', 13, 17, '1', '0000-00-00 00:00:00'),
(3525, '3404120041413', 'YUSUP ATIK FAJAR RIANTO', 0, 'Laki - Lak', 'NGARANAN', 0, 0, 0, 'SLEMAN', '1983-11-13', 13, 17, '1', '0000-00-00 00:00:00'),
(3526, '3404130041505', 'AG.PURWANTO', 0, 'Laki - Lak', 'GADINGAN 04/08 ', 0, 0, 0, 'SLEMAN', '1953-12-11', 5, 31, '1', '0000-00-00 00:00:00'),
(3527, '3404130041613', 'AGUS DAMAR S  A.MD.KEP', 0, 'Laki - Lak', 'BLOTAN 03/40 ', 0, 0, 0, 'SLEMAN', '1982-09-18', 13, 31, '1', '0000-00-00 00:00:00'),
(3528, '3404130041705', 'AGUS SETYADI', 0, 'Laki - Lak', 'GENTAN 02/11', 0, 0, 0, 'SLEMAN', '1980-08-07', 5, 31, '1', '0000-00-00 00:00:00'),
(3529, '3404130041805', 'AGUS WIDARYANTO', 0, 'Laki - Lak', 'TOINO 01/16 ', 0, 0, 0, 'SLEMAN', '1975-08-24', 5, 31, '1', '0000-00-00 00:00:00'),
(3530, '3404130041905', 'ALEX DWI SUPRIYANTO', 0, 'Laki - Lak', 'DUWET 04/33 ', 0, 0, 0, 'SLEMAN', '1989-07-06', 5, 31, '1', '0000-00-00 00:00:00'),
(3531, '3404130042005', 'AMBAR JOKO HERTANTO', 0, 'Laki - Lak', 'MINDI 02/13', 0, 0, 0, 'MAGELANG', '1983-04-29', 5, 31, '1', '0000-00-00 00:00:00'),
(3532, '3404130042110', 'ARINDYA LARAS', 0, 'Perempuan', 'GADINGAN 03/08', 0, 0, 0, 'SLEMAN', '1996-03-15', 10, 31, '1', '0000-00-00 00:00:00'),
(3533, '3404130042205', 'BAMBANG TRI UNTORO', 0, 'Laki - Lak', 'NGEBEL CILIK 05/45 ', 0, 0, 0, 'SLEMAN', '1987-06-29', 5, 31, '1', '0000-00-00 00:00:00'),
(3534, '3404130042323', 'BENNY NUGROHO', 0, 'Laki - Lak', 'DUKUH 04/10 ', 0, 0, 0, 'SLEMAN', '1989-05-13', 23, 31, '1', '0000-00-00 00:00:00'),
(3535, '3404130042405', 'CHRISTIAN AGUNG NUGROHO', 0, 'Laki - Lak', 'DUKUH 04/10', 0, 0, 0, 'SLEMAN', '1982-12-25', 5, 31, '1', '0000-00-00 00:00:00'),
(3536, '3404130042523', 'DADIYONO', 0, 'Laki - Lak', 'DUKUH 04/10 ', 0, 0, 0, 'SLEMAN', '1954-05-01', 23, 31, '1', '0000-00-00 00:00:00'),
(3537, '3404130042605', 'DENNY WAHYU UNTARA', 0, 'Laki - Lak', 'KENTUNGAN 05/49', 0, 0, 0, 'SLEMAN', '1983-10-15', 5, 31, '1', '0000-00-00 00:00:00'),
(3538, '3404130042705', 'DRS. MURWADI', 0, 'Laki - Lak', 'GADINGAN 03/08 ', 0, 0, 0, 'SLEMAN', '1965-11-19', 5, 31, '1', '0000-00-00 00:00:00'),
(3539, '3404130042815', 'DUL SALAM', 0, 'Laki - Lak', 'KARANGGAYAM 02/01 ', 0, 0, 0, 'SLEMAN', '1962-02-17', 15, 31, '1', '0000-00-00 00:00:00'),
(3540, '3404130042905', 'HERI PURWANTO', 0, 'Laki - Lak', 'KOLOMBO BARU 04/58 ', 0, 0, 0, 'SLEMAN', '1973-08-30', 5, 31, '1', '0000-00-00 00:00:00'),
(3541, '3404130043005', 'IBNU SARFIN MUKHOLIT', 0, 'Laki - Lak', 'PLOSOKUNING3 13/05 ', 0, 0, 0, 'SLEMAN', '1977-05-01', 5, 31, '1', '0000-00-00 00:00:00'),
(3542, '3404130043105', 'JAYUSMAN', 0, 'Laki - Lak', 'CANDIKARANG 01/08 ', 0, 0, 0, 'SLEMAN', '1973-06-06', 5, 31, '1', '0000-00-00 00:00:00'),
(3543, '3404130043205', 'JOKO PITOYO', 0, 'Laki - Lak', 'CARAN 04/04 ', 0, 0, 0, 'SLEMAN', '1974-08-09', 5, 31, '1', '0000-00-00 00:00:00'),
(3544, '3404130043312', 'M.BAHRUN NUR KHAMID', 0, 'Laki - Lak', 'PLOSOKUNING4 21/09 ', 0, 0, 0, 'SLEMAN', '1980-08-07', 5, 31, '1', '0000-00-00 00:00:00'),
(3545, '3404130043405', 'M.DARIS AFNAN', 0, 'Laki - Lak', 'NGABEAN KULON 04/35', 0, 0, 0, 'SLEMAN', '1971-11-17', 5, 31, '1', '0000-00-00 00:00:00'),
(3546, '3404130043523', 'MARGONO', 0, 'Laki - Lak', 'CANDIWINANGGUN 05/13 ', 0, 0, 0, 'SLEMAN', '1966-06-11', 23, 31, '1', '0000-00-00 00:00:00'),
(3547, '3404130043623', 'MUKIDI', 0, 'Laki - Lak', 'BANTENG 06/30 ', 0, 0, 0, 'SLEMAN', '1959-09-05', 23, 31, '1', '0000-00-00 00:00:00'),
(3548, '3404130043705', 'MURTANTO', 0, 'Laki - Lak', 'NGILO 02/19', 0, 0, 0, 'SLEMAN', '1980-07-09', 5, 31, '1', '0000-00-00 00:00:00'),
(3549, '3404130043805', 'NGADIYONO', 0, 'Laki - Lak', 'NGABEAN KULON05/35', 0, 0, 0, 'SLEMAN', '1965-10-17', 5, 31, '1', '0000-00-00 00:00:00'),
(3550, '3404130043905', 'NURGIYANTO', 0, 'Laki - Lak', 'MENDIRO 04/27', 0, 0, 0, 'SLEMAN', '1989-07-15', 5, 31, '1', '0000-00-00 00:00:00'),
(3551, '3404130044005', 'PARJIYONO', 0, 'Laki - Lak', 'SELOKERTO 03/18 ', 0, 0, 0, 'SLEMAN', '1977-08-14', 5, 31, '1', '0000-00-00 00:00:00'),
(3552, '3404130044110', 'PERWITA ARYANI', 0, 'Perempuan', 'GADINGAN 03/08', 0, 0, 0, 'SLEMAN', '1990-12-03', 10, 31, '1', '0000-00-00 00:00:00'),
(3553, '3404130044205', 'PRAPTO UTOMO /ASRAF', 0, 'Laki - Lak', 'KARANGJEMJEM', 0, 0, 0, 'SLEMAN', '0000-00-00', 5, 31, '1', '0000-00-00 00:00:00'),
(3554, '3404130044305', 'SAMUJARI', 0, 'Laki - Lak', 'BENDOLOLE 05/40 ', 0, 0, 0, 'SLEMAN', '1977-12-30', 5, 31, '1', '0000-00-00 00:00:00'),
(3555, '3404130044405', 'SARDI', 0, 'Laki - Lak', 'JAKAL,KM.6,7 04/59 ', 0, 0, 0, 'SLEMAN', '1975-03-19', 5, 31, '1', '0000-00-00 00:00:00'),
(3556, '3404130044505', 'SARJITO', 0, 'Laki - Lak', 'BLOTAN JL.MAWAR  01/40', 0, 0, 0, 'SLEMAN', '1975-12-27', 5, 31, '1', '0000-00-00 00:00:00'),
(3557, '3404130044605', 'SRI SUHARYADI', 0, 'Laki - Lak', 'PRUJAKAN 01/32 ', 0, 0, 0, 'SLEMAN', '1959-06-23', 5, 31, '1', '0000-00-00 00:00:00'),
(3558, '3404130044702', 'SRI SUYONO', 0, 'Laki - Lak', 'CANDIKARANG 01/08 ', 0, 0, 0, 'SLEMAN', '1969-06-17', 2, 31, '1', '0000-00-00 00:00:00'),
(3559, '3404130044823', 'SUGENG PURNOMO', 0, 'Laki - Lak', 'BABADAN BARU 09/51 ', 0, 0, 0, 'SLEMAN', '1954-06-10', 23, 31, '1', '0000-00-00 00:00:00'),
(3560, '3404130044905', 'SUGIYANTO', 0, 'Laki - Lak', 'BENDOLOLE 05/40', 0, 0, 0, 'SLEMAN', '1981-03-01', 5, 31, '1', '0000-00-00 00:00:00'),
(3561, '3404130045023', 'SUKMAWAN TRI PAMUNGKAS', 0, 'Laki - Lak', 'BARANSARI 04/42 ', 0, 0, 0, 'SLEMAN', '1990-02-22', 23, 31, '1', '0000-00-00 00:00:00'),
(3562, '3404130045105', 'SUPARDI', 0, 'Laki - Lak', 'NGENTAK 02/23 ', 0, 0, 0, 'SLEMAN', '1969-01-02', 5, 31, '1', '0000-00-00 00:00:00'),
(3563, '3404130045205', 'SUPARNO', 0, 'Laki - Lak', 'BANTENG 08/31 ', 0, 0, 0, 'SLEMAN', '1966-04-06', 5, 31, '1', '0000-00-00 00:00:00'),
(3564, '3404130045305', 'SUPRAPTO', 0, 'Laki - Lak', 'KADIREJO 05/26 ', 0, 0, 0, 'AIR BANG', '1985-08-08', 5, 31, '1', '0000-00-00 00:00:00'),
(3565, '3404130045410', 'SURYANTI', 0, 'Perempuan', ' DUKUH 04/10', 0, 0, 0, 'SLEMAN', '1962-01-09', 10, 31, '1', '0000-00-00 00:00:00'),
(3566, '3404130045505', 'TONY DONOVAN FERNANDA', 0, 'Laki - Lak', 'PRUJAKAN 01/32 ', 0, 0, 0, 'MAGETAN', '1994-09-17', 5, 31, '1', '0000-00-00 00:00:00'),
(3567, '3404130045605', 'UTORO', 0, 'Laki - Lak', 'BABADAN BARU09/51 ', 0, 0, 0, 'SLEMAN', '1965-02-12', 5, 31, '1', '0000-00-00 00:00:00'),
(3568, '3404130045707', 'WAHUDI', 0, 'Laki - Lak', 'PLOSOKUNING5 21/59 ', 0, 0, 0, 'SLEMAN', '1966-09-30', 7, 31, '1', '0000-00-00 00:00:00'),
(3569, '3404130045815', 'WAHYU SETIAWAN', 0, 'Laki - Lak', 'KOLOMBO BARU 04/58', 0, 0, 0, 'SLEMAN', '1983-05-20', 15, 31, '1', '0000-00-00 00:00:00'),
(3570, '3404130045923', 'WASPADA AMD', 0, 'Laki - Lak', 'DRONO 04/33 ', 0, 0, 0, 'MAGELANG', '1966-10-13', 23, 31, '1', '0000-00-00 00:00:00'),
(3571, '3404130046005', 'WIDIANTO', 0, 'Laki - Lak', 'TOINO 01/16', 0, 0, 0, 'MAGELANG', '1981-03-21', 5, 31, '1', '0000-00-00 00:00:00'),
(3572, '3404140046106', 'AGUS RIYANTO', 0, 'Laki - Lak', 'SRUNEN', 0, 0, 0, 'SLEMAN', '1987-08-05', 6, 11, '1', '0000-00-00 00:00:00'),
(3573, '3404140046223', 'ARI SUGIYANTO', 0, 'Laki - Lak', 'SRUNEN ', 0, 0, 0, 'SLEMAN', '1989-05-03', 23, 11, '1', '0000-00-00 00:00:00'),
(3574, '3404140046306', 'EKO JADIANTO RUDI SAPUTRO', 0, 'Laki - Lak', 'SRUNEN', 0, 0, 0, 'SLEMAN', '1988-10-28', 6, 11, '1', '0000-00-00 00:00:00'),
(3575, '3404140046423', 'ISTAMTOMO', 0, 'Laki - Lak', 'GADING  ', 0, 0, 0, 'SLEMAN', '1979-01-04', 23, 11, '1', '0000-00-00 00:00:00'),
(3576, '3404140046507', 'JAYADI', 0, 'Laki - Lak', 'BANJARSARI', 0, 0, 0, 'SLEMAN', '1972-07-16', 7, 11, '1', '0000-00-00 00:00:00'),
(3577, '3404140046623', 'JENARTO', 0, 'Laki - Lak', 'SRUNEN ', 0, 0, 0, 'SLEMAN', '1962-03-03', 23, 11, '1', '0000-00-00 00:00:00'),
(3578, '3404140046723', 'JOKO PURWANTO', 0, 'Laki - Lak', 'JETIS SUMUR', 0, 0, 0, 'SLEMAN', '1989-04-04', 23, 11, '1', '0000-00-00 00:00:00'),
(3579, '3404140046806', 'KUWAT', 0, 'Laki - Lak', 'KALITENGAH LOR', 0, 0, 0, 'SLEMAN', '1975-12-31', 6, 11, '1', '0000-00-00 00:00:00'),
(3580, '3404140046923', 'M.SAMSUDI', 0, 'Laki - Lak', 'SRUNEN', 0, 0, 0, 'SLEMAN', '1977-09-05', 23, 11, '1', '0000-00-00 00:00:00'),
(3581, '3404140047006', 'NGATIYAR', 0, 'Laki - Lak', 'NGANCAR  ', 0, 0, 0, 'SLEMAN', '1984-05-13', 6, 11, '1', '0000-00-00 00:00:00'),
(3582, '3404140047106', 'NUR BUDIYANTO', 0, 'Laki - Lak', 'NGANCAR ', 0, 0, 0, 'SLEMAN', '1984-02-08', 6, 11, '1', '0000-00-00 00:00:00'),
(3583, '3404140047206', 'PRAKOSO', 0, 'Laki - Lak', 'KALITENGAH LOR', 0, 0, 0, 'SLEMAN', '1997-12-10', 6, 11, '1', '0000-00-00 00:00:00'),
(3584, '3404140047323', 'PRASTOLO', 0, 'Laki - Lak', 'NGANCAR', 0, 0, 0, 'SLEMAN', '1986-06-11', 23, 11, '1', '0000-00-00 00:00:00'),
(3585, '3404140047423', 'RAMBAT WAHYUDI', 0, 'Laki - Lak', 'NGANCAR', 0, 0, 0, 'SLEMAN', '1981-12-21', 23, 11, '1', '0000-00-00 00:00:00'),
(3586, '3404140047523', 'RUBISO', 0, 'Laki - Lak', 'KALITENGAH KIDUL', 0, 0, 0, 'SLEMAN', '1977-12-09', 23, 11, '1', '0000-00-00 00:00:00'),
(3587, '3404140047623', 'SARYONO', 0, 'Laki - Lak', 'MUDAL ', 0, 0, 0, 'SLEMAN', '1984-10-05', 23, 11, '1', '0000-00-00 00:00:00'),
(3588, '3404140047706', 'SENEN RAHARJO', 0, 'Laki - Lak', 'MUDAL ', 0, 0, 0, 'SLEMAN', '1956-01-11', 6, 11, '1', '0000-00-00 00:00:00'),
(3589, '3404140047810', 'SIHONO', 0, 'Laki - Lak', 'SRUNEN', 0, 0, 0, 'SLEMAN', '1983-04-06', 10, 11, '1', '0000-00-00 00:00:00'),
(3590, '3404140047906', 'SLAMET', 0, 'Laki - Lak', 'KALITENGAH LOR', 0, 0, 0, 'SLEMAN', '1981-12-31', 6, 11, '1', '0000-00-00 00:00:00'),
(3591, '3404140048023', 'SRIYANTA', 0, 'Laki - Lak', 'NGANCAR', 0, 0, 0, 'SLEMAN', '1981-07-10', 23, 11, '1', '0000-00-00 00:00:00'),
(3592, '3404140048123', 'SRIYONO', 0, 'Laki - Lak', 'SINGLAR ', 0, 0, 0, 'SLEMAN', '1959-03-16', 23, 11, '1', '0000-00-00 00:00:00'),
(3593, '3404140048223', 'SUGIYONO', 0, 'Laki - Lak', 'KALITENGAH KIDUL', 0, 0, 0, 'SLEMAN', '1976-08-05', 23, 11, '1', '0000-00-00 00:00:00'),
(3594, '3404140048323', 'SUKEMI', 0, 'Laki - Lak', 'SINGLAR ', 0, 0, 0, 'SLEMAN', '1975-07-23', 23, 11, '1', '0000-00-00 00:00:00'),
(3595, '3404140048406', 'SUMARJI', 0, 'Laki - Lak', 'JETIS SUMUR ', 0, 0, 0, 'SLEMAN', '1975-08-17', 6, 11, '1', '0000-00-00 00:00:00'),
(3596, '3404140048523', 'SUMARNO', 0, 'Laki - Lak', 'JETIS SUMUR', 0, 0, 0, 'SLEMAN', '1975-03-20', 23, 11, '1', '0000-00-00 00:00:00'),
(3597, '3404140048606', 'SUPARDI', 0, 'Laki - Lak', 'SINGLAR ', 0, 0, 0, 'SLEMAN', '1972-05-06', 6, 11, '1', '0000-00-00 00:00:00'),
(3598, '3404140048723', 'SUPODO', 0, 'Laki - Lak', 'KALITENGAH KIDUL', 0, 0, 0, 'SLEMAN', '1973-02-13', 23, 11, '1', '0000-00-00 00:00:00'),
(3599, '3404140048823', 'SURONO', 0, 'Laki - Lak', 'BANJARSARI ', 0, 0, 0, 'SLEMAN', '1975-04-06', 23, 11, '1', '0000-00-00 00:00:00'),
(3600, '3404140048906', 'SUTARNO/MARDIWIYONO', 0, 'Laki - Lak', 'SINGLAR', 0, 0, 0, 'SLEMAN', '1972-01-10', 6, 11, '1', '0000-00-00 00:00:00'),
(3601, '3404140049006', 'SUWAJI', 0, 'Laki - Lak', 'KALITENGAH KIDUL', 0, 0, 0, 'SLEMAN', '1984-03-23', 6, 11, '1', '0000-00-00 00:00:00'),
(3602, '3404140049123', 'TEGUH WIDODO', 0, 'Laki - Lak', 'MUDAL ', 0, 0, 0, 'SLEMAN', '1971-03-06', 23, 11, '1', '0000-00-00 00:00:00'),
(3603, '3404140049206', 'TENTREM TRIYADI', 0, 'Laki - Lak', 'KALITENGAH KIDUL', 0, 0, 0, 'SLEMAN', '1985-07-12', 6, 11, '1', '0000-00-00 00:00:00'),
(3604, '3404140049323', 'TRI SUSANTO', 0, 'Laki - Lak', 'NGANCAR', 0, 0, 0, 'SLEMAN', '0000-00-00', 23, 11, '1', '0000-00-00 00:00:00'),
(3605, '3404140049407', 'TRUBUS/PONIJO', 0, 'Laki - Lak', 'KALI TENGAH LOR', 0, 0, 0, 'SLEMAN', '1978-12-31', 7, 11, '1', '0000-00-00 00:00:00'),
(3606, '3404140049523', 'WALUYO', 0, 'Laki - Lak', 'SRUNEN', 0, 0, 0, 'SLEMAN', '0000-00-00', 23, 11, '1', '0000-00-00 00:00:00'),
(3607, '3404140049606', 'YADIMIN', 0, 'Laki - Lak', 'SRUNEN ', 0, 0, 0, 'SLEMAN', '0000-00-00', 6, 11, '1', '0000-00-00 00:00:00'),
(3608, '3404150049715', 'AG.HENDRO SUSILO', 0, 'Laki - Lak', 'BENERAN01/23,', 0, 0, 0, 'SLEMAN', '1961-08-29', 15, 22, '1', '0000-00-00 00:00:00'),
(3609, '3404150049815', 'ANJAR SUKARNO', 0, 'Laki - Lak', 'NGEPRING,04/05 ', 0, 0, 0, 'SLEMAN', '1969-08-28', 15, 22, '1', '0000-00-00 00:00:00'),
(3610, '3404150049913', 'ARIYANTO', 0, 'Laki - Lak', 'NGEPRING,02/04,', 0, 0, 0, 'SLEMAN', '1985-09-27', 13, 22, '1', '0000-00-00 00:00:00'),
(3611, '3404150050015', 'BUDI SANTOSO', 0, 'Laki - Lak', 'KADILOBO,04/34 ', 0, 0, 0, 'SLEMAN', '1972-08-23', 15, 22, '1', '0000-00-00 00:00:00'),
(3612, '3404150050115', 'BUDI UTOMO', 0, 'Laki - Lak', 'NGEPRING,05/05 ', 0, 0, 0, 'SLEMAN', '1957-05-14', 15, 22, '1', '0000-00-00 00:00:00'),
(3613, '3404150050210', 'CH.SULYANTA', 0, 'Laki - Lak', 'TRITIS,01/01', 0, 0, 0, 'SLEMAN', '1973-02-07', 10, 22, '1', '0000-00-00 00:00:00'),
(3614, '3404150050312', 'DARWIS ARBIANTARA.S.SOS', 0, 'Laki - Lak', 'GATEP,03/30 ', 0, 0, 0, 'MAGELANG', '0000-00-00', 5, 22, '1', '0000-00-00 00:00:00'),
(3615, '3404150050412', 'DWI HARTANTO', 0, 'Laki - Lak', 'GANGGONG,01/06', 0, 0, 0, 'SLEMAN', '1978-08-31', 5, 22, '1', '0000-00-00 00:00:00'),
(3616, '3404150050506', 'EKO TRI WIDARYANTO', 0, 'Laki - Lak', 'PULOWATU,', 0, 0, 0, 'SLEMAN', '1984-04-03', 6, 22, '1', '0000-00-00 00:00:00'),
(3617, '3404150050606', 'HARSONO', 0, 'Laki - Lak', 'PELEM,05/36 ', 0, 0, 0, 'SLEMAN', '1964-05-19', 6, 22, '1', '0000-00-00 00:00:00'),
(3618, '3404150050706', 'KARJIYO', 0, 'Laki - Lak', 'NGEPRING,04/05 ', 0, 0, 0, 'SLEMAN', '1957-05-10', 6, 22, '1', '0000-00-00 00:00:00'),
(3619, '3404150050806', 'MARSIGIT', 0, 'Laki - Lak', 'KEMIRI,04/08', 0, 0, 0, 'SLEMAN', '1977-07-07', 6, 22, '1', '0000-00-00 00:00:00'),
(3620, '3404150050906', 'MUSDIANTORO', 0, 'Laki - Lak', 'TURGO,03/02 ', 0, 0, 0, 'TEMANGGUNG', '1970-04-02', 6, 22, '1', '0000-00-00 00:00:00'),
(3621, '3404150051015', 'NAHROWI', 0, 'Laki - Lak', 'POTRO,01/17 ', 0, 0, 0, 'NGAWI', '1970-01-08', 15, 22, '1', '0000-00-00 00:00:00'),
(3622, '3404150051107', 'NGADIYONO', 0, 'Laki - Lak', 'NGEPRING,05/05', 0, 0, 0, 'SLEMAN', '1966-01-16', 7, 22, '1', '0000-00-00 00:00:00'),
(3623, '3404150051212', 'NURHADI', 0, 'Laki - Lak', 'CANDI,05/13 ', 0, 0, 0, 'SLEMAN', '1980-04-24', 5, 22, '1', '0000-00-00 00:00:00'),
(3624, '3404150051312', 'PONIRAN', 0, 'Laki - Lak', 'TURGO,03/02,', 0, 0, 0, 'SLEMAN', '1966-10-28', 5, 22, '1', '0000-00-00 00:00:00'),
(3625, '3404150051413', 'PURNOMO RAHAYU', 0, 'Laki - Lak', 'KEMIRI,03/08 ', 0, 0, 0, 'SLEMAN', '1987-03-23', 13, 22, '1', '0000-00-00 00:00:00'),
(3626, '3404150051515', 'PURWANTO', 0, 'Laki - Lak', 'SENDEN,03/35 ', 0, 0, 0, 'SLEMAN', '1976-06-25', 15, 22, '1', '0000-00-00 00:00:00'),
(3627, '3404150051615', 'PURYANTO', 0, 'Laki - Lak', 'NGEPRING,03/05', 0, 0, 0, 'SLEMAN', '1965-11-08', 15, 22, '1', '0000-00-00 00:00:00'),
(3628, '3404150051712', 'R.HERI SUASANA', 0, 'Laki - Lak', 'SUMEDANG,02/27 ', 0, 0, 0, 'SLEMAN', '1967-06-29', 5, 22, '1', '0000-00-00 00:00:00'),
(3629, '3404150051815', 'SANTOSO', 0, 'Laki - Lak', 'NNGEPRING,03/05', 0, 0, 0, 'SLEMAN', '1978-06-01', 15, 22, '1', '0000-00-00 00:00:00'),
(3630, '3404150051910', 'SARIYEM', 0, 'Perempuan', 'TURGO,03/02', 0, 0, 0, 'SLEMAN', '1969-02-15', 10, 22, '1', '0000-00-00 00:00:00'),
(3631, '3404150052007', 'SIHADI', 0, 'Laki - Lak', 'KEMIRI,01/07 ', 0, 0, 0, 'SLEMAN', '1975-09-30', 7, 22, '1', '0000-00-00 00:00:00'),
(3632, '3404150052115', 'SISWO SARTONO', 0, 'Laki - Lak', 'KRATUAN,07/06 ', 0, 0, 0, 'SLEMAN', '1956-12-31', 15, 22, '1', '0000-00-00 00:00:00'),
(3633, '3404150052210', 'SRIKUSWANTI', 0, 'Laki - Lak', 'KRATUAN,07/06 ', 0, 0, 0, 'SLEMAN', '1976-04-12', 10, 22, '1', '0000-00-00 00:00:00'),
(3634, '3404150052315', 'SUBUR IRIONO', 0, 'Laki - Lak', 'NGELOSARI,02/10,', 0, 0, 0, 'KODYA', '1962-10-12', 15, 22, '1', '0000-00-00 00:00:00'),
(3635, '3404150052415', 'SUDIYANTO ', 0, 'Laki - Lak', 'TAWANGREJO,', 0, 0, 0, 'SLEMAN', '1962-03-23', 15, 22, '1', '0000-00-00 00:00:00'),
(3636, '3404150052515', 'SUGI PAWIRO', 0, 'Laki - Lak', 'RELOKASI TURGO,07/02', 0, 0, 0, 'SLEMAN', '1951-12-12', 15, 22, '1', '0000-00-00 00:00:00'),
(3637, '3404150052615', 'SUGIMAN UDI UTOMO', 0, 'Laki - Lak', 'KEMIRI,02/07 ', 0, 0, 0, 'SLEMAN', '1957-05-05', 15, 22, '1', '0000-00-00 00:00:00'),
(3638, '3404150052715', 'SUGIYANTO', 0, 'Laki - Lak', 'WRINGIN,03/16 ', 0, 0, 0, 'SLEMAN', '1959-06-13', 15, 22, '1', '0000-00-00 00:00:00'),
(3639, '3404150052812', 'SUGIYANTO PRAYITNO', 0, 'Laki - Lak', 'POTRO,01/17', 0, 0, 0, 'SLEMAN', '1972-10-19', 5, 22, '1', '0000-00-00 00:00:00'),
(3640, '3404150052913', 'SUHARSONO', 0, 'Laki - Lak', 'TURGO,04/02', 0, 0, 0, 'SLEMAN', '1983-05-03', 13, 22, '1', '0000-00-00 00:00:00'),
(3641, '3404150053006', 'SUKIMIN', 0, 'Laki - Lak', 'KEMIRI,01/07 ', 0, 0, 0, 'SLEMAN', '1972-01-04', 6, 22, '1', '0000-00-00 00:00:00'),
(3642, '3404150053106', 'SUPARJANA', 0, 'Laki - Lak', 'KARANGGENENG01/31 ', 0, 0, 0, 'SLEMAN', '1968-04-01', 6, 22, '1', '0000-00-00 00:00:00'),
(3643, '3404150053215', 'SUTARJO', 0, 'Laki - Lak', 'KARANGGENENG01/31 ', 0, 0, 0, 'SLEMAN', '1964-01-08', 15, 22, '1', '0000-00-00 00:00:00'),
(3644, '3404150053315', 'SUTRISNO', 0, 'Laki - Lak', 'NGELOSARI,02/10,', 0, 0, 0, 'SLEMAN', '1946-12-06', 15, 22, '1', '0000-00-00 00:00:00'),
(3645, '3404150053418', 'SUWANDI PRAYITNO', 0, 'Laki - Lak', 'NGEPRING,01/04 ', 0, 0, 0, 'SLEMAN', '1967-09-12', 18, 22, '1', '0000-00-00 00:00:00'),
(3646, '3404150053513', 'TEGUH SUTRISNO', 0, 'Laki - Lak', 'TURGO,04/02,', 0, 0, 0, 'SLEMAN', '1968-06-29', 13, 22, '1', '0000-00-00 00:00:00'),
(3647, '3404150053607', 'TRI WIHARTANTO', 0, 'Laki - Lak', 'SENDEN,03/35 ', 0, 0, 0, 'SLEMAN', '1976-03-30', 7, 22, '1', '0000-00-00 00:00:00'),
(3648, '3404150053715', 'TRIYONO SUWARNO', 0, 'Laki - Lak', 'NGEPRING,05/05', 0, 0, 0, 'SLEMAN', '1965-04-02', 15, 22, '1', '0000-00-00 00:00:00'),
(3649, '3404150053811', 'TUKIMUN', 0, 'Laki - Lak', 'TURGO,04/02,', 0, 0, 0, 'SLEMAN', '1965-04-01', 11, 22, '1', '0000-00-00 00:00:00'),
(3650, '3404150053910', 'TUKIRAH', 0, 'Perempuan', 'TURGO,03/02', 0, 0, 0, 'SLEMAN', '1975-10-05', 10, 22, '1', '0000-00-00 00:00:00'),
(3651, '3404150054007', 'WINARDI', 0, 'Laki - Lak', 'KOPATAN,04/02', 0, 0, 0, 'SLEMAN', '1967-08-10', 7, 22, '1', '0000-00-00 00:00:00'),
(3652, '3404150054115', 'WIYADI', 0, 'Laki - Lak', 'SUDIMORO,01/15 ', 0, 0, 0, 'SLEMAN', '1969-03-25', 15, 22, '1', '0000-00-00 00:00:00'),
(3653, '3404150054212', 'YOSEPH SUPADI', 0, 'Laki - Lak', 'PULOWATU,04/22', 0, 0, 0, 'SLEMAN', '1971-03-09', 5, 22, '1', '0000-00-00 00:00:00'),
(3654, '3404160054313', 'AGUS RIYANTO', 0, 'Laki - Lak', 'JETISHARJO JT II/507 RT 03/07 COKRODININGRATAN', 0, 0, 0, 'SRAGEN', '1969-08-07', 13, 6, '1', '0000-00-00 00:00:00'),
(3655, '3404160054406', 'ANTONIUS PUGUH SUPARDI', 0, 'Laki - Lak', 'SUMBERAN 2 B', 0, 0, 0, 'BANTUL', '1966-07-23', 6, 6, '1', '0000-00-00 00:00:00'),
(3656, '3404160054512', 'ARIS SUBIANTORO', 0, 'Laki - Lak', 'SEDAN RT 07/34', 0, 0, 0, 'SLEMAN', '1979-04-15', 5, 6, '1', '0000-00-00 00:00:00'),
(3657, '3404160054606', 'BAGUS PRIHANANTO DWI LAKSONO', 0, 'Laki - Lak', 'JL. KAKAP VI/14 MINOMARTANI', 0, 0, 0, 'YOGYAKARTA', '1977-10-25', 6, 6, '1', '0000-00-00 00:00:00'),
(3658, '3404160054706', 'BEJO SRIHANA', 0, 'Laki - Lak', 'CANDIWINANGUN', 0, 0, 0, 'SLEMAN', '1977-06-14', 6, 6, '1', '0000-00-00 00:00:00'),
(3659, '3404160054813', 'FA KUNTO PRIYAMBODO', 0, 'Laki - Lak', 'JL. CANTEL 31 UH I RT 09/03 SEMAKI', 0, 0, 0, 'YOGYAKARTA', '1969-09-07', 13, 6, '1', '0000-00-00 00:00:00'),
(3660, '3404160054917', 'INDAH PAMUNGKAS LESTARI', 0, 'Perempuan', 'BEDINGIN WETAN RT 05/35 ', 0, 0, 0, 'SLEMAN', '1984-12-10', 17, 6, '1', '0000-00-00 00:00:00'),
(3661, '3404160055006', 'IR. DANIEL SUPRIYANTA', 0, 'Laki - Lak', 'GANDEKAN LOR GT II/69', 0, 0, 0, 'YOGYAKARTA', '1967-09-27', 6, 6, '1', '0000-00-00 00:00:00'),
(3662, '3404160055106', 'MARTINUS PURWANTO KRISTIANTORO', 0, 'Laki - Lak', 'JL. TERATAI IV/85 PERUMNAS ', 0, 0, 0, 'YOGYAKARTA', '1972-03-04', 6, 6, '1', '0000-00-00 00:00:00'),
(3663, '3404160055213', 'SARTONO', 0, 'Laki - Lak', 'PANDANPURO RT 06/22 ', 0, 0, 0, 'SLEMAN', '1981-10-09', 13, 6, '1', '0000-00-00 00:00:00'),
(3664, '3404160055306', 'SLAMET BUDI SARONO', 0, 'Laki - Lak', 'KLASEMAN RT 04/38 ', 0, 0, 0, 'SLEMAN', '1969-03-05', 6, 6, '1', '0000-00-00 00:00:00'),
(3665, '3404160055412', 'SUKARMIN', 0, 'Laki - Lak', 'JATIREJO RT 03/21 ', 0, 0, 0, 'SLEMAN', '1963-04-27', 5, 6, '1', '0000-00-00 00:00:00'),
(3666, '3404160055506', 'WALJIANTO', 0, 'Laki - Lak', 'BANARAN RT 01/13 ', 0, 0, 0, 'SLEMAN', '1975-10-08', 6, 6, '1', '0000-00-00 00:00:00'),
(3667, '3404160055606', 'YOGA NUGROHO UTOMO', 0, 'Laki - Lak', 'JATIREJO RT 01/21', 0, 0, 0, 'CILACAP', '1977-04-07', 6, 6, '1', '0000-00-00 00:00:00'),
(3668, '3404170055723', 'AHMAD KHOIRUDDIN', 0, 'Laki - Lak', 'PURWOREJO ', 0, 0, 0, 'SLEMAN', '1987-12-29', 23, 27, '1', '0000-00-00 00:00:00'),
(3669, '3404170055823', 'EKO PURWANTORO', 0, 'Laki - Lak', 'GROGOL', 0, 0, 0, 'SLEMAN', '1988-04-20', 23, 27, '1', '0000-00-00 00:00:00'),
(3670, '3404170055923', 'FAHRUDDIN MASYHURI', 0, 'Laki - Lak', 'TEGALMANDING', 0, 0, 0, 'SLEMAN', '1973-04-30', 23, 27, '1', '0000-00-00 00:00:00'),
(3671, '3404170056023', 'MULYONO', 0, 'Laki - Lak', 'NGIPIKSARI', 0, 0, 0, 'SLEMAN', '1970-12-30', 23, 27, '1', '0000-00-00 00:00:00'),
(3672, '3404170056123', 'NANUK WULANDARI', 0, 'Perempuan', 'WONOKERSO GONDANGLIGI', 0, 0, 0, 'SLEMAN', '1974-01-04', 23, 27, '1', '0000-00-00 00:00:00'),
(3673, '3404170056223', 'RAHMAT PRASETYO', 0, 'Laki - Lak', 'PENTINGSARI ', 0, 0, 0, 'SLEMAN', '1990-09-26', 23, 27, '1', '0000-00-00 00:00:00'),
(3674, '3404170056323', 'RAMIJO', 0, 'Laki - Lak', 'GAMBRETAN ', 0, 0, 0, 'SLEMAN', '1975-10-16', 23, 27, '1', '0000-00-00 00:00:00'),
(3675, '3404170056413', 'RISDA FEBRIANTO', 0, 'Laki - Lak', 'PENTINGSARI ', 0, 0, 0, 'SLEMAN', '1987-02-28', 13, 27, '1', '0000-00-00 00:00:00'),
(3676, '3404170056523', 'SISWADI', 0, 'Laki - Lak', 'SIDOREJO', 0, 0, 0, 'SLEMAN', '1977-07-05', 23, 27, '1', '0000-00-00 00:00:00'),
(3677, '3404170056623', 'SUGENG RIYADI', 0, 'Laki - Lak', 'BENDOSARI', 0, 0, 0, 'SLEMAN', '1978-07-24', 23, 27, '1', '0000-00-00 00:00:00'),
(3678, '3404170056723', 'SUGIYANTO', 0, 'Laki - Lak', 'KALIURANG', 0, 0, 0, 'SLEMAN', '1980-08-07', 23, 27, '1', '0000-00-00 00:00:00'),
(3679, '3404170056823', 'SUHARDI', 0, 'Laki - Lak', 'NGIPIKSARI', 0, 0, 0, 'SLEMAN', '1979-02-20', 23, 27, '1', '0000-00-00 00:00:00'),
(3680, '3404170056923', 'SUNARYO', 0, 'Laki - Lak', 'PENTINGSARI', 0, 0, 0, 'SLEMAN', '1974-05-07', 23, 27, '1', '0000-00-00 00:00:00'),
(3681, '3404170057023', 'SUROTO', 0, 'Laki - Lak', 'KALIURANG ', 0, 0, 0, 'SLEMAN', '1963-12-31', 23, 27, '1', '0000-00-00 00:00:00'),
(3682, '3404170057123', 'SURYADI', 0, 'Laki - Lak', 'BUTUH', 0, 0, 0, 'KLATEN', '1979-01-25', 23, 27, '1', '0000-00-00 00:00:00'),
(3683, '3404170057223', 'WAGIMIN', 0, 'Laki - Lak', 'KALIURANG', 0, 0, 0, 'SLEMAN', '1967-01-17', 23, 27, '1', '0000-00-00 00:00:00'),
(3684, '3404170057323', 'WANIDI', 0, 'Laki - Lak', 'PLUPUH', 0, 0, 0, 'SLEMAN', '1976-10-22', 23, 27, '1', '0000-00-00 00:00:00'),
(3685, '3404180057410', 'ADITYA PUTRA T', 0, 'Laki - Lak', 'NGLEMPONG LOR, RT07/RW22', 0, 0, 0, 'SLEMAN', '1989-12-03', 10, 16, '1', '0000-00-00 00:00:00'),
(3686, '3404180057510', 'AGUNG SUHARTO', 0, 'Laki - Lak', 'WONOREJO', 0, 0, 0, 'SLEMAN', '1966-12-07', 10, 16, '1', '0000-00-00 00:00:00'),
(3687, '3404180057623', 'AGUS HARDIYO PANCORO', 0, 'Laki - Lak', 'BAKALAN, RT04/RW30', 0, 0, 0, 'SLEMAN', '1964-12-29', 23, 16, '1', '0000-00-00 00:00:00'),
(3688, '3404180057710', 'AHMAD WARSITO', 0, 'Laki - Lak', 'NGLEMPONGSARI', 0, 0, 0, 'JAKARTA', '1967-03-22', 10, 16, '1', '0000-00-00 00:00:00'),
(3689, '3404180057810', 'ANTON LEGOWO', 0, 'Laki - Lak', 'RANDUGOWANG, RT01/RW15', 0, 0, 0, 'SLEMAN', '1985-04-04', 10, 16, '1', '0000-00-00 00:00:00'),
(3690, '3404180057910', 'ARIS MARGONO', 0, 'Laki - Lak', 'REJODANI I, RT03/RW02', 0, 0, 0, 'SLEMAN', '0000-00-00', 10, 16, '1', '0000-00-00 00:00:00'),
(3691, '3404180058010', 'ARIS MAWARDHI', 0, 'Laki - Lak', 'SEDAN', 0, 0, 0, 'SLEMAN', '1968-12-30', 10, 16, '1', '0000-00-00 00:00:00'),
(3692, '3404180058113', 'BAKUH SETIAWAN', 0, 'Laki - Lak', 'KRIKILAN, RT06/RW22', 0, 0, 0, 'SLEMAN', '1988-11-11', 13, 16, '1', '0000-00-00 00:00:00'),
(3693, '3404180058210', 'BAMBANG PRAYITNO', 0, 'Laki - Lak', 'KAMDANEN, RT02/RW07', 0, 0, 0, 'SLEMAN', '1958-08-07', 10, 16, '1', '0000-00-00 00:00:00'),
(3694, '3404180058310', 'BAMBANG WIDIYANTO', 0, 'Laki - Lak', 'KRIKILAN, RT03/RW21', 0, 0, 0, 'SLEMAN', '1978-02-18', 10, 16, '1', '0000-00-00 00:00:00'),
(3695, '3404180058410', 'BIMANTO LEGOWO', 0, 'Laki - Lak', 'KAMDANEN, RT02/RW07', 0, 0, 0, 'SLEMAN', '0000-00-00', 10, 16, '1', '0000-00-00 00:00:00'),
(3696, '3404180058510', 'DARWIS SUKANDAR', 0, 'Laki - Lak', 'REJODANI 2, RT01/RW03', 0, 0, 0, 'SLEMAN', '1956-02-03', 10, 16, '1', '0000-00-00 00:00:00'),
(3697, '3404180058610', 'DWI PUTRANTO', 0, 'Laki - Lak', 'TAMBAKREJO, RT03/RW11', 0, 0, 0, 'SLEMAN', '1991-07-27', 10, 16, '1', '0000-00-00 00:00:00'),
(3698, '3404180058710', 'EDI MARWANTO MARIMIN', 0, 'Laki - Lak', 'BOYONG, RT02/RW10', 0, 0, 0, 'SLEMAN', '1970-09-02', 10, 16, '1', '0000-00-00 00:00:00'),
(3699, '3404180058823', 'EDY PRIYONO', 0, 'Laki - Lak', 'SEDAN', 0, 0, 0, 'SLEMAN', '1959-07-12', 23, 16, '1', '0000-00-00 00:00:00'),
(3700, '3404180058910', 'EDY SUSILO', 0, 'Laki - Lak', 'REJODANI 1, RT04/RW02', 0, 0, 0, 'BLITAR', '1965-01-28', 10, 16, '1', '0000-00-00 00:00:00'),
(3701, '3404180059010', 'EKO WIDODO', 0, 'Laki - Lak', 'SEDAN, RT02/RW33', 0, 0, 0, 'SLEMAN', '1972-10-15', 10, 16, '1', '0000-00-00 00:00:00'),
(3702, '3404180059110', 'H. GUNAWAN S.SOS', 0, 'Laki - Lak', 'JONGKANG', 0, 0, 0, 'SLEMAN', '1962-11-07', 10, 16, '1', '0000-00-00 00:00:00'),
(3703, '3404180059210', 'H. SUGENG SANYOTO SE.', 0, 'Laki - Lak', 'KARANGMLOKO', 0, 0, 0, 'SLEMAN', '1962-05-07', 10, 16, '1', '0000-00-00 00:00:00'),
(3704, '3404180059310', 'HARTONO', 0, 'Laki - Lak', 'WARAS, RT04/RW32', 0, 0, 0, 'SLEMAN', '1976-05-30', 10, 16, '1', '0000-00-00 00:00:00'),
(3705, '3404180059410', 'HARYONO SRINUGROHO, S.SOS.', 0, 'Laki - Lak', 'PERUM LEMPONGSARI BLOK C-20, RT12/RW28', 0, 0, 0, 'SLEMAN', '1966-06-03', 10, 16, '1', '0000-00-00 00:00:00'),
(3706, '3404180059523', 'IR. IMRAN KELANA NURUDIEN', 0, 'Laki - Lak', 'REJODANI 1, RT03/RW02', 0, 0, 0, 'PROBOLINGGO', '1965-04-27', 23, 16, '1', '0000-00-00 00:00:00'),
(3707, '3404180059610', 'ISMAN WARSONO', 0, 'Laki - Lak', 'JONGKANG,  RT01/RW35', 0, 0, 0, 'SLEMAN', '1962-11-22', 10, 16, '1', '0000-00-00 00:00:00'),
(3708, '3404180059710', 'ISNAWAN RISWANTORO', 0, 'Laki - Lak', 'NANDAN, RT06/RW39', 0, 0, 0, 'SLEMAN', '1972-06-26', 10, 16, '1', '0000-00-00 00:00:00'),
(3709, '3404180059810', 'JUMARI ARI WIJOYO', 0, 'Laki - Lak', 'TEGALWERU, RT05/RW14', 0, 0, 0, 'SLEMAN', '1967-08-04', 10, 16, '1', '0000-00-00 00:00:00'),
(3710, '3404180059910', 'KADARMADI', 0, 'Laki - Lak', 'WONOSOBO, RT04/RW19', 0, 0, 0, 'SLEMAN', '1967-07-06', 10, 16, '1', '0000-00-00 00:00:00'),
(3711, '3404180060010', 'KARDIYONO', 0, 'Laki - Lak', 'TAMBAKREJO', 0, 0, 0, 'SLEMAN', '1966-01-05', 10, 16, '1', '0000-00-00 00:00:00'),
(3712, '3404180060110', 'KASIDI', 0, 'Laki - Lak', 'NGEBEL GEDE, RT07/RW34', 0, 0, 0, 'SLEMAN', '1965-05-30', 10, 16, '1', '0000-00-00 00:00:00'),
(3713, '3404180060210', 'KUSNADI WIDODO, S.PD', 0, 'Laki - Lak', 'RANDUGOWANG,  RT02/RW15', 0, 0, 0, 'SLEMAN', '1971-08-31', 10, 16, '1', '0000-00-00 00:00:00'),
(3714, '3404180060310', 'LEGIMAN', 0, 'Laki - Lak', 'KRIKILAN, RT06/RW22', 0, 0, 0, 'SLEMAN', '1969-03-05', 10, 16, '1', '0000-00-00 00:00:00'),
(3715, '3404180060410', 'MARJUKI', 0, 'Perempuan', 'JATIREJO, RT02/RW21', 0, 0, 0, 'SLEMAN', '1970-10-05', 10, 16, '1', '0000-00-00 00:00:00'),
(3716, '3404180060510', 'MIYARNO', 0, 'Laki - Lak', 'SEDAN', 0, 0, 0, 'SLEMAN', '1967-03-15', 10, 16, '1', '0000-00-00 00:00:00'),
(3717, '3404180060610', 'MUHAMMAD NASIR, S.PD.', 0, 'Laki - Lak', 'BADRAN JT1/544 RT50/RW11', 0, 0, 0, 'KARAWANG', '1956-08-10', 10, 16, '1', '0000-00-00 00:00:00'),
(3718, '3404180060710', 'MUJIMIN', 0, 'Laki - Lak', 'TEGALREJO, RT02/RW09', 0, 0, 0, 'SLEMAN', '0000-00-00', 10, 16, '1', '0000-00-00 00:00:00'),
(3719, '3404180060810', 'MUJIRAH', 0, 'Perempuan', 'JABAN, RT03/RW25', 0, 0, 0, 'BANTUL', '1974-11-17', 10, 16, '1', '0000-00-00 00:00:00'),
(3720, '3404180060910', 'MULYONO', 0, 'Laki - Lak', 'KRIKILAN, RT05/RW22', 0, 0, 0, 'SLEMAN', '1972-05-31', 10, 16, '1', '0000-00-00 00:00:00'),
(3721, '3404180061010', 'MUSAHIR', 0, 'Laki - Lak', 'REJODANI I, RT04/RW02', 0, 0, 0, 'SLEMAN', '1962-08-09', 10, 16, '1', '0000-00-00 00:00:00'),
(3722, '3404180061110', 'NGADIYONO', 0, 'Laki - Lak', 'REJODANI 2, RT04/RW04', 0, 0, 0, 'SLEMAN', '1960-04-08', 10, 16, '1', '0000-00-00 00:00:00'),
(3723, '3404180061210', 'NUPIYONO', 0, 'Laki - Lak', 'KRIKILAN, RT06/RW22', 0, 0, 0, 'SLEMAN', '1966-11-11', 10, 16, '1', '0000-00-00 00:00:00'),
(3724, '3404180061310', 'NUR HANDOKO', 0, 'Laki - Lak', 'REJODANI 2, RT02/RW03', 0, 0, 0, 'SLEMAN', '1986-01-11', 10, 16, '1', '0000-00-00 00:00:00'),
(3725, '3404180061410', 'P. DARYANA ', 0, 'Laki - Lak', 'TAMBAKREJO', 0, 0, 0, 'SLEMAN', '1967-03-11', 10, 16, '1', '0000-00-00 00:00:00'),
(3726, '3404180061510', 'PARJONO', 0, 'Laki - Lak', 'PANGGUNGSARI, RT09/RW23', 0, 0, 0, 'SLEMAN', '1967-08-01', 10, 16, '1', '0000-00-00 00:00:00'),
(3727, '3404180061610', 'PONO', 0, 'Laki - Lak', 'PANGGUNGSARI', 0, 0, 0, 'SLEMAN', '1961-03-04', 10, 16, '1', '0000-00-00 00:00:00'),
(3728, '3404180061710', 'PRABAWA', 0, 'Laki - Lak', 'KARANGMLOKO', 0, 0, 0, 'SLEMAN', '1964-01-09', 10, 16, '1', '0000-00-00 00:00:00'),
(3729, '3404180061810', 'PRASETYO', 0, 'Laki - Lak', 'TEGALSARI, RT08/RW30', 0, 0, 0, 'SLEMAN', '1985-12-01', 10, 16, '1', '0000-00-00 00:00:00'),
(3730, '3404180061910', 'PRIYO SURYANTI', 0, 'Laki - Lak', 'NGETIRAN, RT02/RW05', 0, 0, 0, '', '0000-00-00', 10, 16, '1', '0000-00-00 00:00:00'),
(3731, '3404180062010', 'PURWANTO', 0, 'Laki - Lak', 'WONOREJO, RT04/RW08', 0, 0, 0, 'SLEMAN', '1966-03-23', 10, 16, '1', '0000-00-00 00:00:00'),
(3732, '3404180062110', 'R. WAHYUDI NUGROHO', 0, 'Laki - Lak', 'KARANGMLOKO, RT03/RW18', 0, 0, 0, 'SLEMAN', '1971-02-17', 10, 16, '1', '0000-00-00 00:00:00'),
(3733, '3404180062210', 'RIDONO', 0, 'Laki - Lak', 'SEDAN, RT02/RW33', 0, 0, 0, 'SLEMAN', '1965-08-14', 10, 16, '1', '0000-00-00 00:00:00'),
(3734, '3404180062310', 'RIPTONO', 0, 'Perempuan', 'JATIREJO, RT02/RW21', 0, 0, 0, 'SLEMAN', '1977-05-04', 10, 16, '1', '0000-00-00 00:00:00'),
(3735, '3404180062410', 'RIYADI', 0, 'Laki - Lak', 'JL. NGLEMPONGSARI RAYA NO. 114, RT07/RW26', 0, 0, 0, 'SLEMAN', '1981-09-26', 10, 16, '1', '0000-00-00 00:00:00'),
(3736, '3404180062510', 'RUSWIYADI', 0, 'Laki - Lak', 'NGLEMPONG LOR RT07/RW22', 0, 0, 0, 'SLEMAN', '1967-04-03', 10, 16, '1', '0000-00-00 00:00:00'),
(3737, '3404180062623', 'SAGIMIN', 0, 'Laki - Lak', 'KADILANGU, RT03/RW32', 0, 0, 0, 'SLEMAN', '1959-01-15', 23, 16, '1', '0000-00-00 00:00:00'),
(3738, '3404180062710', 'SAGIONO', 0, 'Laki - Lak', 'JOMBO LOR, RT01/RW18', 0, 0, 0, 'SLEMAN', '1957-12-31', 10, 16, '1', '0000-00-00 00:00:00'),
(3739, '3404180062810', 'SAMINO', 0, 'Laki - Lak', 'WONOREJO, RT04/RW08', 0, 0, 0, 'SLEMAN', '1968-08-12', 10, 16, '1', '0000-00-00 00:00:00'),
(3740, '3404180062910', 'SARBINI S.SOS', 0, 'Laki - Lak', 'POTON, RT05/RW06 NGETIRAN', 0, 0, 0, 'SLEMAN', '1955-08-22', 10, 16, '1', '0000-00-00 00:00:00'),
(3741, '3404180063010', 'NOORUDDIN', 0, 'Laki - Lak', 'WARAS, RT03/RW32', 0, 0, 0, 'SLEMAN', '1972-12-31', 10, 16, '1', '0000-00-00 00:00:00'),
(3742, '3404180063110', 'SENO PRAYITNO', 0, 'Laki - Lak', 'NGLEMPONG LOR, RT07/RW22', 0, 0, 0, 'SLEMAN', '1976-04-21', 10, 16, '1', '0000-00-00 00:00:00'),
(3743, '3404180063210', 'SETIYO BUDI SANTOSO', 0, 'Laki - Lak', 'POTON, RT05/RW05', 0, 0, 0, 'SLEMAN', '1967-01-05', 10, 16, '1', '0000-00-00 00:00:00'),
(3744, '3404180063310', 'SLAMET PURWANTO', 0, 'Laki - Lak', 'BANTARJO, RT02/RW27', 0, 0, 0, 'SLEMAN', '1974-03-25', 10, 16, '1', '0000-00-00 00:00:00'),
(3745, '3404180063410', 'SLAMET RAHARJO', 0, 'Laki - Lak', 'BANJARSARI, RT05/RW12', 0, 0, 0, 'SLEMAN', '1979-01-01', 10, 16, '1', '0000-00-00 00:00:00'),
(3746, '3404180063510', 'SRI YANTO', 0, 'Laki - Lak', 'TEGALWERU, RT05/RW14', 0, 0, 0, 'SLEMAN', '1976-08-18', 10, 16, '1', '0000-00-00 00:00:00'),
(3747, '3404180063610', 'SUBADI WIYONO', 0, 'Laki - Lak', 'TEGALREJO, RT02/RW09', 0, 0, 0, 'SLEMAN', '1961-01-15', 10, 16, '1', '0000-00-00 00:00:00'),
(3748, '3404180063710', 'SUDARSA ALOISIUS', 0, 'Laki - Lak', 'NANDAN, RT01/RW38', 0, 0, 0, 'SLEMAN', '1959-06-21', 10, 16, '1', '0000-00-00 00:00:00'),
(3749, '3404180063810', 'SUGIMAN', 0, 'Laki - Lak', 'TURGOGEDE, RT03/RW22', 0, 0, 0, 'SLEMAN', '1959-05-03', 10, 16, '1', '0000-00-00 00:00:00'),
(3750, '3404180063910', 'SUHARTOYO', 0, 'Laki - Lak', 'GG. POKSAI I, RT01/RW24, PLEMBURAN', 0, 0, 0, 'SLEMAN', '1966-06-17', 10, 16, '1', '0000-00-00 00:00:00'),
(3751, '3404180064010', 'SUKIMIN', 0, 'Laki - Lak', 'JONGKANG, RT02/RW35', 0, 0, 0, 'SLEMAN', '1954-01-12', 10, 16, '1', '0000-00-00 00:00:00'),
(3752, '3404180064110', 'SUKLIHONO', 0, 'Laki - Lak', 'JETIS DONOLAYAN, RT01/RW23', 0, 0, 0, 'SLEMAN', '1975-05-12', 10, 16, '1', '0000-00-00 00:00:00'),
(3753, '3404180064210', 'SULIYAH', 0, 'Perempuan', 'NGEBEL GEDE, RT07/RW34', 0, 0, 0, 'SLEMAN', '1968-02-01', 10, 16, '1', '0000-00-00 00:00:00'),
(3754, '3404180064310', 'SUMARJO HADI SISWANTO', 0, 'Laki - Lak', 'KAYEN, RT02/RW43', 0, 0, 0, 'SLEMAN', '1953-11-11', 10, 16, '1', '0000-00-00 00:00:00');
INSERT INTO `tblrelawan` (`idtblrelawan`, `no_induk`, `nama_relawan`, `nik`, `jenis_kelamin`, `alamat`, `kelurahan`, `kecamatan`, `desa`, `tempat_lahir`, `tgl_lahir`, `kecakapan`, `komunitas`, `create_user`, `create_time`) VALUES
(3755, '3404180064410', 'SUNARTO ST.', 0, 'Laki - Lak', 'NANDAN', 0, 0, 0, 'SLEMAN', '1963-03-28', 10, 16, '1', '0000-00-00 00:00:00'),
(3756, '3404180064510', 'SUNARYO', 0, 'Laki - Lak', 'PINGIT, JT I/193 RT10/RW03', 0, 0, 0, 'YOGYAKARTA', '1980-09-17', 10, 16, '1', '0000-00-00 00:00:00'),
(3757, '3404180064610', 'SUPARDI', 0, 'Laki - Lak', 'NGENTAK, RT02/RW23', 0, 0, 0, 'SLEMAN', '1969-01-02', 10, 16, '1', '0000-00-00 00:00:00'),
(3758, '3404180064710', 'SUPARGIYATI', 0, 'Perempuan', 'MUDAL', 0, 0, 0, 'SLEMAN', '1967-05-27', 10, 16, '1', '0000-00-00 00:00:00'),
(3759, '3404180064810', 'SUPARMAN', 0, 'Laki - Lak', 'SEDAN, GANG PISANG NO.35', 0, 0, 0, 'SLEMAN', '1950-09-11', 10, 16, '1', '0000-00-00 00:00:00'),
(3760, '3404180064910', 'SUPARMO RIPTOSUDARMO', 0, 'Laki - Lak', 'JONGKANG', 0, 0, 0, 'SLEMAN', '1956-01-15', 10, 16, '1', '0000-00-00 00:00:00'),
(3761, '3404180065010', 'SUPARNO', 0, 'Laki - Lak', 'WARAS', 0, 0, 0, 'SLEMAN', '1973-04-26', 10, 16, '1', '0000-00-00 00:00:00'),
(3762, '3404180065110', 'SUPARNO', 0, 'Laki - Lak', 'BANTENG, RTT08/RW31', 0, 0, 0, 'SLEMAN', '1966-04-06', 10, 16, '1', '0000-00-00 00:00:00'),
(3763, '3404180065210', 'SUPRIHATIN', 0, 'Laki - Lak', 'WARAS, RT03/RW32', 0, 0, 0, 'SLEMAN', '1973-03-20', 10, 16, '1', '0000-00-00 00:00:00'),
(3764, '3404180065310', 'SUPRIYADI', 0, 'Laki - Lak', 'TEGALWERU, RT05/RW14', 0, 0, 0, 'SLEMAN', '1976-02-13', 10, 16, '1', '0000-00-00 00:00:00'),
(3765, '3404180065410', 'SURANI', 0, 'Laki - Lak', 'KRIKILAN, RT06/RW22', 0, 0, 0, 'SLEMAN', '1975-02-10', 10, 16, '1', '0000-00-00 00:00:00'),
(3766, '3404180065510', 'SUSENO', 0, 'Laki - Lak', 'NGETIRAN, RT02/RW05', 0, 0, 0, 'SLEMAN', '1966-05-19', 10, 16, '1', '0000-00-00 00:00:00'),
(3767, '3404180065610', 'TEGUH SUPRANTO', 0, 'Laki - Lak', 'TEGALWERU, RT05/RW14', 0, 0, 0, 'SLEMAN', '1965-08-16', 10, 16, '1', '0000-00-00 00:00:00'),
(3768, '3404180065710', 'TRI FAJAR SAHARI', 0, 'Laki - Lak', 'KRIKILAN, RT05/RW22', 0, 0, 0, 'SLEMAN', '1981-07-03', 10, 16, '1', '0000-00-00 00:00:00'),
(3769, '3404180065810', 'TRI SUTRISNO', 0, 'Laki - Lak', 'GONDANGLEGI, RT03/RW13', 0, 0, 0, 'YOGYAKARTA', '1986-04-15', 10, 16, '1', '0000-00-00 00:00:00'),
(3770, '3404180065910', 'URIP SARWONO', 0, 'Laki - Lak', 'NGEPAS LOR, RT03/RW15', 0, 0, 0, 'SLEMAN', '1974-12-28', 10, 16, '1', '0000-00-00 00:00:00'),
(3771, '3404180066010', 'WAHADANI', 0, 'Laki - Lak', 'TEGALREJO, RT02/RW09', 0, 0, 0, 'SLEMAN', '1966-08-13', 10, 16, '1', '0000-00-00 00:00:00'),
(3772, '3404180066110', 'WAHYUNI', 0, 'Perempuan', 'JL. NGLEMPONGSARI RAYA NO. 114, RT07/RW26', 0, 0, 0, 'SLEMAN', '1981-06-13', 10, 16, '1', '0000-00-00 00:00:00'),
(3773, '3404180066210', 'WASIYADI GUNTORO', 0, 'Laki - Lak', 'RANDUGOWANG, RT02/RW15', 0, 0, 0, 'SLEMAN', '1965-06-10', 10, 16, '1', '0000-00-00 00:00:00'),
(3774, '3404180066310', 'WITJIARTI', 0, 'Perempuan', 'RANDUGOWANG', 0, 0, 0, 'SLEMAN', '1968-01-08', 10, 16, '1', '0000-00-00 00:00:00'),
(3775, '3404180066410', 'YUDHA PRIHATMOKO', 0, 'Laki - Lak', 'RANDUGOWANG, RT01/RW15', 0, 0, 0, 'SLEMAN', '1989-06-25', 10, 16, '1', '0000-00-00 00:00:00'),
(3776, '3404180066510', 'YUNAR SUSANTO', 0, 'Laki - Lak', 'BANTARJO, RT01/RW27', 0, 0, 0, 'SLEMAN', '1984-01-15', 10, 16, '1', '0000-00-00 00:00:00'),
(3777, '3404190066610', 'BARDJANA', 0, 'Laki - Lak', 'KALIURANG TIMUR RT03/14', 0, 0, 0, 'SLEMAN', '1953-05-05', 10, 28, '1', '0000-00-00 00:00:00'),
(3778, '3404190066706', 'BEJA WIRYANTO', 0, 'Laki - Lak', 'KALIURANG SELATAN RT 005/013', 0, 0, 0, 'SLEMAN', '0000-00-00', 6, 28, '1', '0000-00-00 00:00:00'),
(3779, '3404190066806', 'CHRISTIAN AWUY', 0, 'Laki - Lak', 'KALIURANG BARAT RT 07/19', 0, 0, 0, 'MANADO', '1946-11-10', 6, 28, '1', '0000-00-00 00:00:00'),
(3780, '3404190066906', 'DIDIK SUPADI', 0, 'Laki - Lak', 'JL.ASTI KUNINGAN ,BLOK H /26 RT 09/04', 0, 0, 0, 'NGAWI', '1973-02-05', 6, 28, '1', '0000-00-00 00:00:00'),
(3781, '3404190067023', 'FA EKO KRISMARYANTO ,SH', 0, 'Laki - Lak', 'KALIURANG BARAT RT 07 19', 0, 0, 0, 'YOGYAKARTA', '1963-10-04', 23, 28, '1', '0000-00-00 00:00:00'),
(3782, '3404190067123', 'FRANSISKUS ASISI NGADIMIN', 0, 'Laki - Lak', 'KALIURANG TIMUR RT 05/15', 0, 0, 0, 'SLEMAN', '0000-00-00', 23, 28, '1', '0000-00-00 00:00:00'),
(3783, '3404190067222', 'HERI GIARTO', 0, 'Laki - Lak', 'KALIURANG TIMUR RT06/15', 0, 0, 0, 'SLEMAN', '1971-04-26', 22, 28, '1', '0000-00-00 00:00:00'),
(3784, '3404190067317', 'HM.FARCHAN HARIEM,SE', 0, 'Laki - Lak', 'KALIURANG TIMUR RT 04/15', 0, 0, 0, 'YOGYAKARTA', '1968-12-12', 17, 28, '1', '0000-00-00 00:00:00'),
(3785, '3404190067423', 'ISMADI', 0, 'Laki - Lak', 'KALIURANG BARAT RT01/17', 0, 0, 0, 'TEMANGGUNG', '1965-12-30', 23, 28, '1', '0000-00-00 00:00:00'),
(3786, '3404190067510', 'ISMARI TOTOWARDOYO', 0, 'Laki - Lak', 'KALIURANG BARAT RT 05/18', 0, 0, 0, 'SLEMAN', '1958-04-04', 10, 28, '1', '0000-00-00 00:00:00'),
(3787, '3404190067623', 'JULIANTO', 0, 'Laki - Lak', 'KALIURANG RT 06/18', 0, 0, 0, '', '0000-00-00', 23, 28, '1', '0000-00-00 00:00:00'),
(3788, '3404190067710', 'JUMINTEN', 0, 'Perempuan', 'TURGO RT 05/03', 0, 0, 0, 'SLEMAN', '1963-10-13', 10, 28, '1', '0000-00-00 00:00:00'),
(3789, '3404190067807', 'JUMIRAN BUDIPRAYITNO', 0, 'Laki - Lak', 'KALIURANG BARAT RT 07/16', 0, 0, 0, 'GUNUNG KIDUL', '1965-10-04', 7, 28, '1', '0000-00-00 00:00:00'),
(3790, '3404190067906', 'KIDARYANTO ', 0, 'Laki - Lak', 'BOYONG RT 03/14', 0, 0, 0, 'SLEMAN', '1971-11-21', 6, 28, '1', '0000-00-00 00:00:00'),
(3791, '3404190068023', 'KIJO WAKIJO', 0, 'Laki - Lak', 'KALIURANG SELATAN RT05/13', 0, 0, 0, 'SLEMAN', '1962-05-17', 23, 28, '1', '0000-00-00 00:00:00'),
(3792, '3404190068107', 'KUNTANTO', 0, 'Laki - Lak', 'KALIURANG TIMUR RT05/15', 0, 0, 0, 'SLEMAN', '1965-10-04', 7, 28, '1', '0000-00-00 00:00:00'),
(3793, '3404190068210', 'MATHEUS EPIAN', 0, 'Laki - Lak', 'KALIURANG TIMUR RT 02/14', 0, 0, 0, 'YOGYAKARTA', '1985-12-09', 10, 28, '1', '0000-00-00 00:00:00'),
(3794, '3404190068318', 'MUJIONO', 0, 'Laki - Lak', 'BOYONG RT 04/4 ', 0, 0, 0, 'SLEMAN', '1954-06-02', 18, 28, '1', '0000-00-00 00:00:00'),
(3795, '3404190068413', 'PUJO UTOMO', 0, 'Laki - Lak', 'NGEPRING RT 04 /05', 0, 0, 0, 'SLEMAN', '1946-12-31', 13, 28, '1', '0000-00-00 00:00:00'),
(3796, '3404190068506', 'RIS MULYONO', 0, 'Laki - Lak', 'NGIPIKSARI RT 03/12', 0, 0, 0, 'SLEMAN', '1950-03-13', 6, 28, '1', '0000-00-00 00:00:00'),
(3797, '3404190068610', 'RUHIYAT HADI SUARJO', 0, 'Laki - Lak', 'JL.BOYONGRT 03/10', 0, 0, 0, 'SUBANG', '1951-08-17', 10, 28, '1', '0000-00-00 00:00:00'),
(3798, '3404190068718', 'SARMIN SARWO WIYONO', 0, 'Laki - Lak', 'KALIURANG BARAT RT 02/17', 0, 0, 0, 'SRAGEN', '1954-05-12', 18, 28, '1', '0000-00-00 00:00:00'),
(3799, '3404190068806', 'SIGIT DARNADI', 0, 'Laki - Lak', 'KLAMPOK RT13/04', 0, 0, 0, 'GUNUNG KIDUL', '1984-01-15', 6, 28, '1', '0000-00-00 00:00:00'),
(3800, '3404190068907', 'SISHADI SUWARDI', 0, 'Laki - Lak', 'KALIURANG BARAT RT 05/18', 0, 0, 0, 'SLEMAN', '1960-03-06', 7, 28, '1', '0000-00-00 00:00:00'),
(3801, '3404190069006', 'SUDIHARTO', 0, 'Laki - Lak', 'SAMBI', 0, 0, 0, '', '0000-00-00', 6, 28, '1', '0000-00-00 00:00:00'),
(3802, '3404190069106', 'SUGIYANTO', 0, 'Laki - Lak', 'KALIURANG TIMUR RT 02 /14', 0, 0, 0, 'SLEMAN', '1960-05-16', 6, 28, '1', '0000-00-00 00:00:00'),
(3803, '3404190069207', 'SUKIJO', 0, 'Laki - Lak', 'BOYONG RT05/11', 0, 0, 0, 'SLEMAN', '1978-05-13', 7, 28, '1', '0000-00-00 00:00:00'),
(3804, '3404190069318', 'SUMIJO', 0, 'Laki - Lak', 'KALIURANG BARAT RT 03/017', 0, 0, 0, '', '1956-03-12', 18, 28, '1', '0000-00-00 00:00:00'),
(3805, '3404190069407', 'SUPARJILAN', 0, 'Laki - Lak', 'KALIURANG BARAT RT 01/17 ', 0, 0, 0, 'SLEMAN', '1956-02-01', 7, 28, '1', '0000-00-00 00:00:00'),
(3806, '3404190069507', 'SUPARMO', 0, 'Laki - Lak', 'KALIURANG BARAT RT01/17', 0, 0, 0, 'SLEMAN', '1958-11-30', 7, 28, '1', '0000-00-00 00:00:00'),
(3807, '3404190069606', 'SUPARSANA', 0, 'Laki - Lak', 'SAMBI RT 06', 0, 0, 0, 'SLEMAN', '1971-04-03', 6, 28, '1', '0000-00-00 00:00:00'),
(3808, '3404190069807', 'SUTARMAN', 0, 'Laki - Lak', '', 0, 0, 0, 'SLEMAN', '1961-03-22', 7, 28, '1', '0000-00-00 00:00:00'),
(3809, '3404190069913', 'TITIEK SUWARNY', 0, 'Perempuan', 'KALIURANG TIMUR RT 02/14', 0, 0, 0, 'SLEMAN', '1968-09-09', 13, 28, '1', '0000-00-00 00:00:00'),
(3810, '3404190070007', 'TRI HARTANTO', 0, 'Laki - Lak', 'KALIURANG', 0, 0, 0, 'SLEMAN', '1957-03-27', 7, 28, '1', '0000-00-00 00:00:00'),
(3811, '3404190070110', 'TRIASIH', 0, 'Perempuan', 'SAMBIREJO RT 018', 0, 0, 0, 'KULON PROGO', '1964-08-08', 10, 28, '1', '0000-00-00 00:00:00'),
(3812, '3404190070213', 'TUKIDI', 0, 'Laki - Lak', 'KEMIRI RT 04/08', 0, 0, 0, 'SLEMAN', '1962-12-30', 13, 28, '1', '0000-00-00 00:00:00'),
(3813, '3404190070307', 'TUKIRAN', 0, 'Laki - Lak', 'KALIURANG TIMUR RT04/14', 0, 0, 0, 'SLEMAN', '1958-10-25', 7, 28, '1', '0000-00-00 00:00:00'),
(3814, '3404190070418', 'WAHYUDI SARYANTO SARDI', 0, 'Laki - Lak', 'BOYONG RT 05/11', 0, 0, 0, 'SLEMAN', '1951-04-17', 18, 28, '1', '0000-00-00 00:00:00'),
(3815, '3404190070513', 'WARINDI', 0, 'Laki - Lak', 'KALIURANG TIMUR RT 05/15', 0, 0, 0, 'SLEMAN', '1968-08-29', 13, 28, '1', '0000-00-00 00:00:00'),
(3816, '3404190070610', 'WARTIYAH', 0, 'Perempuan', 'KALIURANG TIMUR RT03/14', 0, 0, 0, 'SLEMAN', '1959-07-08', 10, 28, '1', '0000-00-00 00:00:00'),
(3817, '340419069706', 'SUPRAYITNO', 0, 'Laki - Lak', 'TANEN RT01/25', 0, 0, 0, 'SLEMAN', '1960-02-06', 6, 28, '1', '0000-00-00 00:00:00'),
(3818, '340420005108', 'AGUNG. S', 0, 'Laki - Lak', 'DADAPAN, 04/24', 0, 0, 0, 'SLEMAN', '1989-06-21', 8, 13, '1', '0000-00-00 00:00:00'),
(3819, '340420005210', 'AGUS DENI MIFTAH. S', 0, 'Laki - Lak', 'RELOKASI TURGO, 05/03', 0, 0, 0, 'SLEMAN', '1972-03-07', 10, 13, '1', '0000-00-00 00:00:00'),
(3820, '340420005308', 'AGUS WIRANTO', 0, 'Laki - Lak', 'KALIDADAP, 04/20,', 0, 0, 0, 'SLEMAN', '1977-06-03', 8, 13, '1', '0000-00-00 00:00:00'),
(3821, '340420005408', 'AHMAD MINTOLO', 0, 'Laki - Lak', 'JETAK II', 0, 0, 0, 'SLEMAN', '1970-07-27', 8, 13, '1', '0000-00-00 00:00:00'),
(3822, '340420005506', 'AHMAD NGIMADI', 0, 'Laki - Lak', 'MLANGI, 003/032', 0, 0, 0, 'SLEMAN', '1971-08-28', 6, 13, '1', '0000-00-00 00:00:00'),
(3823, '340420005608', 'AHMADI', 0, 'Laki - Lak', 'GATEP, 03/30', 0, 0, 0, 'SLEMAN', '1983-02-03', 8, 13, '1', '0000-00-00 00:00:00'),
(3824, '340420005706', 'ARIS YUSUF', 0, 'Laki - Lak', 'MLANGI, 001/032', 0, 0, 0, 'SLEMAN', '1980-06-27', 6, 13, '1', '0000-00-00 00:00:00'),
(3825, '340420005811', 'CIPTO SUWARNO', 0, 'Laki - Lak', 'NGLANJARAN, 08/017', 0, 0, 0, 'SLEMAN', '1945-04-20', 11, 13, '1', '0000-00-00 00:00:00'),
(3826, '340420005905', 'ERY MUNAJA', 0, 'Laki - Lak', 'NGEPRINGAN IV,01/08', 0, 0, 0, 'SLEMAN', '1966-08-17', 5, 13, '1', '0000-00-00 00:00:00'),
(3827, '340420006006', 'FARID MARJIYANTO', 0, 'Laki - Lak', 'KECEME, 02/46', 0, 0, 0, 'SLEMAN', '1992-01-29', 6, 13, '1', '0000-00-00 00:00:00'),
(3828, '340420006107', 'HANDOKO', 0, 'Laki - Lak', 'NGEPRINGAN, 02/01', 0, 0, 0, 'SLEMAN', '0000-00-00', 7, 13, '1', '0000-00-00 00:00:00'),
(3829, '340420006206', 'HARJONO', 0, 'Laki - Lak', 'CANDIWINANGUN, 06/13', 0, 0, 0, 'SLEMAN', '1973-02-03', 6, 13, '1', '0000-00-00 00:00:00'),
(3830, '340420006306', 'HERI RISJIYANTO', 0, 'Laki - Lak', 'KENARUHAN 02/17', 0, 0, 0, 'SLEMAN', '1984-12-31', 6, 13, '1', '0000-00-00 00:00:00'),
(3831, '340420006405', 'IMAM SUHADI', 0, 'Laki - Lak', 'MOLODONO 03/04', 0, 0, 0, 'SLEMAN', '1955-05-05', 5, 13, '1', '0000-00-00 00:00:00'),
(3832, '340420006506', 'INDRO KRISTANTO', 0, '', 'BEDINGIN', 0, 0, 0, '', '0000-00-00', 6, 13, '1', '0000-00-00 00:00:00'),
(3833, '340420006607', 'INDRO WIYONO', 0, 'Laki - Lak', 'BANDAN 03/14', 0, 0, 0, 'SLEMAN', '1986-02-08', 7, 13, '1', '0000-00-00 00:00:00'),
(3834, '340420006711', 'IRWAN SUPRIYADI', 0, 'Laki - Lak', 'KECEME 02/46', 0, 0, 0, 'SLEMAN', '1988-03-28', 11, 13, '1', '0000-00-00 00:00:00'),
(3835, '340420006817', 'JAMHARI', 0, 'Laki - Lak', 'CANDIWINANGUN 04/12', 0, 0, 0, 'SLEMAN', '1968-06-10', 17, 13, '1', '0000-00-00 00:00:00'),
(3836, '340420006908', 'JONI NURCAHYO', 0, 'Laki - Lak', 'GENITEM 06/17', 0, 0, 0, 'JAKARTA', '1989-06-29', 8, 13, '1', '0000-00-00 00:00:00'),
(3837, '340420007011', 'JUNET SUPRIYONO', 0, 'Laki - Lak', 'JUMENENG KIDUL 03/020', 0, 0, 0, 'SLEMAN', '1968-06-02', 11, 13, '1', '0000-00-00 00:00:00'),
(3838, '3404200070715', 'ALAM TARO', 0, 'Laki - Lak', 'NGENTAK PONDOKREJO RT 04 RW 02', 0, 0, 0, 'MAGELANG', '1976-11-09', 15, 9, '1', '0000-00-00 00:00:00'),
(3839, '3404200070815', 'ARI WIDIYANTO', 0, 'Laki - Lak', 'MURANGAN VI RT 02 RW 14 ', 0, 0, 0, 'SLEMAN', '1975-01-15', 15, 9, '1', '0000-00-00 00:00:00'),
(3840, '3404200070915', 'BAGUS SUGIARTO', 0, 'Laki - Lak', 'CUNGKUK RT 03/ RW 19', 0, 0, 0, 'SLEMAN', '1970-06-24', 15, 9, '1', '0000-00-00 00:00:00'),
(3841, '3404200071015', 'BAMBANG KUSWENDI', 0, 'Laki - Lak', 'KECEME RT 03/ RW 46 ', 0, 0, 0, 'PEMALANG', '1968-05-07', 15, 9, '1', '0000-00-00 00:00:00'),
(3842, '340420007108', 'KABUL SUMARNO', 0, 'Laki - Lak', 'KADILOBO, 03/24', 0, 0, 0, 'PRABUMULIH', '1974-04-28', 8, 13, '1', '0000-00-00 00:00:00'),
(3843, '3404200071115', 'BOIDI', 0, 'Laki - Lak', 'KALIBERUT', 0, 0, 0, 'BANTUL', '1974-06-07', 15, 9, '1', '0000-00-00 00:00:00'),
(3844, '3404200071215', 'CHADIS', 0, 'Laki - Lak', 'NARIBAN RT 03/07 ', 0, 0, 0, 'MAGELANG', '1959-02-07', 15, 9, '1', '0000-00-00 00:00:00'),
(3845, '3404200071315', 'DALWANTO', 0, 'Laki - Lak', 'SORONANDAN RT 03/ RW 36', 0, 0, 0, 'SLEMAN', '1971-05-05', 15, 9, '1', '0000-00-00 00:00:00'),
(3846, '3404200071415', 'EDI YULIAWAN', 0, 'Laki - Lak', 'PRAPAK WETAN RT 03 RW 07 ', 0, 0, 0, 'SLEMAN', '1970-07-18', 15, 9, '1', '0000-00-00 00:00:00'),
(3847, '3404200071515', 'EDY UNTOYO', 0, 'Laki - Lak', 'GUNDENGAN LOR RT 001/ 015 ', 0, 0, 0, 'BANYUMAS', '1972-08-30', 15, 9, '1', '0000-00-00 00:00:00'),
(3848, '3404200071615', 'GESENG RISANG PURBO LELONO', 0, 'Laki - Lak', 'JAMBEYAN', 0, 0, 0, 'SLEMAN', '1997-01-12', 15, 9, '1', '0000-00-00 00:00:00'),
(3849, '3404200071715', 'HADI SUPARMAN', 0, 'Laki - Lak', 'MANGKUDRANAN RT 02 RW 15 ', 0, 0, 0, 'SLEMAN', '1957-03-05', 15, 9, '1', '0000-00-00 00:00:00'),
(3850, '3404200071815', 'ISKAK WINARTO', 0, 'Laki - Lak', 'KADILOBO RT 02/033 ', 0, 0, 0, 'SLEMAN', '1970-08-17', 15, 9, '1', '0000-00-00 00:00:00'),
(3851, '3404200071915', 'IWAN SUMARTANTO', 0, 'Laki - Lak', 'KOWANAN VI RT 002/ RW 011 ', 0, 0, 0, 'SLEMAN', '1973-08-02', 15, 9, '1', '0000-00-00 00:00:00'),
(3852, '3404200072015', 'KASIDI', 0, 'Laki - Lak', 'NGEBELGEDE RT 07/ RW 34 ', 0, 0, 0, 'SLEMAN', '1966-05-30', 15, 9, '1', '0000-00-00 00:00:00'),
(3853, '340420007205', 'KECUK SUDIYONO', 0, '', '', 0, 0, 0, '', '0000-00-00', 5, 13, '1', '0000-00-00 00:00:00'),
(3854, '3404200072115', 'KASIYO/ NURDIANSAH HERU I.', 0, 'Laki - Lak', 'KARANG BAJANG ', 0, 0, 0, 'SLEMAN', '1965-09-01', 15, 9, '1', '0000-00-00 00:00:00'),
(3855, '3404200072215', 'M. FAHZA INGGA RIZKY', 0, 'Laki - Lak', 'MRIYUNAN RT 06/ RW 24 ', 0, 0, 0, 'SLEMAN', '1996-08-08', 15, 9, '1', '0000-00-00 00:00:00'),
(3856, '3404200072315', 'M. KHOLIQ AL FATAH', 0, 'Laki - Lak', 'GUNDENGAN LOR RT 001/ 015 ', 0, 0, 0, 'BANYUMAS', '1993-08-20', 15, 9, '1', '0000-00-00 00:00:00'),
(3857, '3404200072415', 'MIFTAHUL HUDA', 0, 'Laki - Lak', 'NGENTAK PLOTENGAN RT 02 RW 01', 0, 0, 0, 'SLEMAN', '1969-08-08', 15, 9, '1', '0000-00-00 00:00:00'),
(3858, '3404200072515', 'MIFTAHUL JINAN', 0, 'Laki - Lak', 'NGENTAK RT 01/ RW 01 ', 0, 0, 0, 'SLEMAN', '1967-10-10', 15, 9, '1', '0000-00-00 00:00:00'),
(3859, '3404200072615', 'MINACHURROFIAH', 0, 'Perempuan', 'KRICAAN 02/04 ', 0, 0, 0, 'MAGELANG', '1971-11-23', 15, 9, '1', '0000-00-00 00:00:00'),
(3860, '3404200072715', 'NADI BETAR SIYANTO', 0, 'Laki - Lak', 'BUNTALAN RT/ RW 001/009 ', 0, 0, 0, 'SLEMAN', '1965-01-19', 15, 9, '1', '0000-00-00 00:00:00'),
(3861, '3404200072815', 'NGADIYO', 0, 'Laki - Lak', 'PRAPAK WETAN RT 03 RW 07', 0, 0, 0, 'SLEMAN', '1952-08-22', 15, 9, '1', '0000-00-00 00:00:00'),
(3862, '3404200072915', 'NUR JAZIM', 0, 'Laki - Lak', 'WONOKERSO RT 05 RW 15 ', 0, 0, 0, 'SLEMAN', '1976-03-14', 15, 9, '1', '0000-00-00 00:00:00'),
(3863, '3404200073015', 'PRIHARNO', 0, 'Laki - Lak', 'JODAG RT 01 RW 11', 0, 0, 0, 'SLEMAN', '1970-09-07', 15, 9, '1', '0000-00-00 00:00:00'),
(3864, '3404200073115', 'PURWANTO', 0, 'Laki - Lak', 'CUNGKUK RT 03/ RW 19 ', 0, 0, 0, 'SLEMAN', '1967-12-26', 15, 9, '1', '0000-00-00 00:00:00'),
(3865, '3404200073215', 'R. ANANG SURYO PURNOMO, SE', 0, 'Laki - Lak', 'LOJAJAR RT 03 RW 22 ', 0, 0, 0, 'SLEMAN', '1975-04-04', 15, 9, '1', '0000-00-00 00:00:00'),
(3866, '340420007324', 'KOMARUDIN', 0, 'Laki - Lak', 'KLEBEN', 0, 0, 0, 'SLEMAN', '1976-07-14', 23, 13, '1', '0000-00-00 00:00:00'),
(3867, '3404200073315', 'R. TUTI HARIYATNO', 0, 'Laki - Lak', 'LOJAJAR RT 03 RW 22', 0, 0, 0, 'SLEMAN', '1971-06-04', 15, 9, '1', '0000-00-00 00:00:00'),
(3868, '3404200073415', 'RIA KARJANA', 0, 'Laki - Lak', 'GUNDENGAN LOR RT 001/ 015 ', 0, 0, 0, 'SLEMAN', '1975-06-23', 15, 9, '1', '0000-00-00 00:00:00'),
(3869, '3404200073515', 'SAIDI', 0, 'Laki - Lak', 'METES RT 043 ', 0, 0, 0, 'BANTUL', '1975-09-06', 15, 9, '1', '0000-00-00 00:00:00'),
(3870, '3404200073615', 'SUGIYARNO', 0, 'Laki - Lak', 'CUNGKUK', 0, 0, 0, 'MAGELANG', '1968-07-27', 15, 9, '1', '0000-00-00 00:00:00'),
(3871, '3404200073715', 'SUHANDOKO', 0, 'Laki - Lak', 'NYAMPLUNG KIDUL RT 05 RW 06', 0, 0, 0, 'SEMARANG', '1969-10-18', 15, 9, '1', '0000-00-00 00:00:00'),
(3872, '3404200073815', 'SUPRAPTO', 0, 'Laki - Lak', 'BEKELAN XI RT 001/ 024 ', 0, 0, 0, 'SLEMAN', '1977-05-13', 15, 9, '1', '0000-00-00 00:00:00'),
(3873, '3404200073915', 'SURATMAN', 0, 'Laki - Lak', 'SEDAN RT 06/ RW 34', 0, 0, 0, 'SLEMAN', '1968-01-14', 15, 9, '1', '0000-00-00 00:00:00'),
(3874, '3404200074015', 'TARYONO', 0, 'Laki - Lak', 'MANGKUDRANAN RT 02 RW 15 ', 0, 0, 0, 'SLEMAN', '1977-11-11', 15, 9, '1', '0000-00-00 00:00:00'),
(3875, '340420007406', 'M. ERKA HADI GUNAWAN', 0, 'Laki - Lak', 'CANDIWINANGUN,04/12', 0, 0, 0, 'SLEMAN', '1972-06-03', 6, 13, '1', '0000-00-00 00:00:00'),
(3876, '3404200074115', 'WARDADI', 0, 'Laki - Lak', 'MURANGAN VIII RT 16 RW 32 ', 0, 0, 0, 'SLEMAN', '1969-07-16', 15, 9, '1', '0000-00-00 00:00:00'),
(3877, '3404200074215', 'WIDODO', 0, 'Laki - Lak', 'TENGAHAN XII ', 0, 0, 0, 'SLEMAN', '1972-02-09', 15, 9, '1', '0000-00-00 00:00:00'),
(3878, '3404200074315', 'WIYANA', 0, 'Laki - Lak', 'TANGISAN, RT 02 RW 9 ', 0, 0, 0, 'SLEMAN', '1976-10-30', 15, 9, '1', '0000-00-00 00:00:00'),
(3879, '340420007507', 'M. HADZIQ FAHMI', 0, 'Laki - Lak', 'MLANGI, 06/33', 0, 0, 0, 'SLEMAN', '1974-05-11', 7, 13, '1', '0000-00-00 00:00:00'),
(3880, '340420007607', 'M. IMAM SAROMI', 0, 'Laki - Lak', 'GENITEM 06/17', 0, 0, 0, 'SLEMAN', '1974-12-20', 7, 13, '1', '0000-00-00 00:00:00'),
(3881, '340420007707', 'MAHMUD MUSTOFA', 0, 'Laki - Lak', 'KADILOBO, 02/33', 0, 0, 0, 'SLEMAN', '1986-11-17', 7, 13, '1', '0000-00-00 00:00:00'),
(3882, '340420007818', 'MAUHAMMAD DAIM', 0, 'Laki - Lak', 'GENITEM, 05/17', 0, 0, 0, 'SLEMAN', '1986-04-04', 18, 13, '1', '0000-00-00 00:00:00'),
(3883, '340420007906', 'MUH. MAKSUM', 0, 'Laki - Lak', 'TEMPEL, 02/05', 0, 0, 0, 'SLEMAN', '1986-05-12', 6, 13, '1', '0000-00-00 00:00:00'),
(3884, '340420008006', 'MUH. MANSHUR', 0, 'Laki - Lak', 'TEMPEL 02/05', 0, 0, 0, 'SLEMAN', '1985-01-31', 6, 13, '1', '0000-00-00 00:00:00'),
(3885, '340420008106', 'MUH. SADAM', 0, 'Laki - Lak', 'BEDOG 02/24', 0, 0, 0, 'SLEMAN', '1966-11-24', 6, 13, '1', '0000-00-00 00:00:00'),
(3886, '340420008210', 'MUHAMMAD NURUDIN', 0, 'Laki - Lak', 'GENITEM, 01/16', 0, 0, 0, 'SLEMAN', '1989-06-04', 10, 13, '1', '0000-00-00 00:00:00'),
(3887, '340420008311', 'MUHAMMAD ZAINUDIN', 0, 'Laki - Lak', 'GENITEM 07/17', 0, 0, 0, 'SLEMAN', '1987-04-30', 11, 13, '1', '0000-00-00 00:00:00'),
(3888, '340420008406', 'NANGSIP', 0, 'Laki - Lak', 'SUTAN, 02/24', 0, 0, 0, 'SLEMAN', '1974-12-28', 6, 13, '1', '0000-00-00 00:00:00'),
(3889, '340420008506', 'NURKHOLIS', 0, 'Laki - Lak', 'DUKUH, 05/10', 0, 0, 0, 'SLEMAN', '1981-01-12', 6, 13, '1', '0000-00-00 00:00:00'),
(3890, '340420008607', 'NURWAKIT, ST', 0, 'Laki - Lak', 'BANDAN, 03/14', 0, 0, 0, 'SLEMAN', '1977-02-05', 7, 13, '1', '0000-00-00 00:00:00'),
(3891, '340420008708', 'PRAMONO', 0, 'Laki - Lak', 'NGEPAS', 0, 0, 0, 'SLEMAN', '1977-01-13', 8, 13, '1', '0000-00-00 00:00:00'),
(3892, '340420008810', 'PURWANTO', 0, 'Laki - Lak', 'JUMENENG, 04/020', 0, 0, 0, 'SLEMAN', '1962-02-15', 10, 13, '1', '0000-00-00 00:00:00'),
(3893, '340420008906', 'ROHMAD ISMANTO', 0, 'Laki - Lak', 'KLEBEN', 0, 0, 0, 'SLEMAN', '1996-11-02', 6, 13, '1', '0000-00-00 00:00:00'),
(3894, '340420009011', 'ROHMAN RIYANTO', 0, 'Laki - Lak', 'GENITEM, 05/17', 0, 0, 0, 'SLEMAN', '1980-11-18', 11, 13, '1', '0000-00-00 00:00:00'),
(3895, '340420009106', 'SAHONO', 0, 'Laki - Lak', 'BANDAN, 05/15', 0, 0, 0, 'SLEMAN', '1967-03-05', 6, 13, '1', '0000-00-00 00:00:00'),
(3896, '340420009208', 'SARWONO KABUL', 0, 'Laki - Lak', 'PANGUKAN', 0, 0, 0, 'SLEMAN', '1966-07-01', 8, 13, '1', '0000-00-00 00:00:00'),
(3897, '340420009307', 'SLAMET WIDODO', 0, 'Laki - Lak', 'PANGUKAN', 0, 0, 0, 'SLEMAN', '1980-12-30', 7, 13, '1', '0000-00-00 00:00:00'),
(3898, '340420009405', 'SRIWIJOKO', 0, 'Laki - Lak', '', 0, 0, 0, '', '0000-00-00', 5, 13, '1', '0000-00-00 00:00:00'),
(3899, '340420009506', 'SUDAMAR KRESNADI', 0, 'Laki - Lak', 'PULUHAN, 02/24', 0, 0, 0, 'SLEMAN', '1973-04-17', 6, 13, '1', '0000-00-00 00:00:00'),
(3900, '340420009606', 'SUMARSONO', 0, 'Laki - Lak', 'CANDIKARANG 04/09', 0, 0, 0, 'SLEMAN', '1973-10-07', 6, 13, '1', '0000-00-00 00:00:00'),
(3901, '340420009705', 'SUPARYANTA', 0, 'Laki - Lak', 'NGLENGKONG KIDUL, 04/016', 0, 0, 0, 'SLEMAN', '1965-06-11', 5, 13, '1', '0000-00-00 00:00:00'),
(3902, '340420009807', 'SURATMAN MARJUNI', 0, 'Laki - Lak', 'GENITEM, 01/16', 0, 0, 0, 'SLEMAN', '1981-06-25', 7, 13, '1', '0000-00-00 00:00:00'),
(3903, '340420009911', 'SUTRIANTO', 0, 'Laki - Lak', 'KUNDEN 01/18', 0, 0, 0, 'SLEMAN', '1976-08-07', 11, 13, '1', '0000-00-00 00:00:00'),
(3904, '340420010005', 'TRIYONO', 0, 'Laki - Lak', 'CANDI, 01/025', 0, 0, 0, 'SLEMAN', '1968-08-08', 5, 13, '1', '0000-00-00 00:00:00'),
(3905, '340420010106', 'TUGIYAT', 0, 'Laki - Lak', 'JITAR NGEMPLAK 03/14', 0, 0, 0, 'SLEMAN', '1970-11-21', 6, 13, '1', '0000-00-00 00:00:00'),
(3906, '340420010211', 'TUGIYO', 0, 'Laki - Lak', 'RELOKASI TURGO, 07/03, PKM', 0, 0, 0, 'SLEMAN', '1970-07-03', 11, 13, '1', '0000-00-00 00:00:00'),
(3907, '340420010306', 'TUKIRAN', 0, 'Laki - Lak', 'KENARUHAN, 03/17, TURI', 0, 0, 0, 'SLEMAN', '1970-11-20', 6, 13, '1', '0000-00-00 00:00:00'),
(3908, '340420010411', 'WAGIMAN', 0, 'Laki - Lak', 'CABAH, DONOHARJO, NGGLK', 0, 0, 0, 'SLEMAN', '1959-06-23', 11, 13, '1', '0000-00-00 00:00:00'),
(3909, '340420010518', 'WAHYU KOMARI ZAMARI', 0, 'Laki - Lak', 'KARANGWUNI, 07/20, TURI', 0, 0, 0, 'SLEMAN', '1977-01-22', 18, 13, '1', '0000-00-00 00:00:00'),
(3910, '340420010606', 'WAHYU PURNOMO', 0, 'Laki - Lak', 'PULUHAN, 01/24, MINGGIR', 0, 0, 0, 'SLEMAN', '1981-08-31', 6, 13, '1', '0000-00-00 00:00:00'),
(3911, '340420010706', 'WAKIDI', 0, 'Laki - Lak', 'PULUHAN, 01/24, MINGGIR', 0, 0, 0, 'SLEMAN', '1970-10-20', 6, 13, '1', '0000-00-00 00:00:00'),
(3912, '340420010805', 'WALUYO', 0, 'Laki - Lak', 'BEDINGIN, 05/37, MLATI', 0, 0, 0, 'SLEMAN', '1976-04-14', 5, 13, '1', '0000-00-00 00:00:00'),
(3913, '340420010910', 'WIDOTO', 0, 'Laki - Lak', 'BENERAN, PURWO.BNGN, PKM', 0, 0, 0, 'SLEMAN', '1971-04-04', 10, 13, '1', '0000-00-00 00:00:00'),
(3914, '340420011011', 'YATNO', 0, 'Laki - Lak', 'RELOKASI TURGO, 06/03, PKM', 0, 0, 0, 'SLEMAN', '1984-09-09', 11, 13, '1', '0000-00-00 00:00:00'),
(3915, '3404210074415', 'ACHMAD KOMARUDIN', 0, 'Laki - Lak', 'BLUNYAH RT 04/16', 0, 0, 0, 'SLEMAN', '1978-01-12', 15, 29, '1', '0000-00-00 00:00:00'),
(3916, '3404210074519', 'AGUSTINUS WARTONO', 0, 'Laki - Lak', 'TAMBAKREJO', 0, 0, 0, 'SLEMAN', '1969-08-08', 19, 29, '1', '0000-00-00 00:00:00'),
(3917, '3404210074615', 'ARIF BUDIYANTO', 0, 'Laki - Lak', 'TLACAP 001/001', 0, 0, 0, 'SLEMAN', '1981-06-21', 15, 29, '1', '0000-00-00 00:00:00'),
(3918, '3404210074715', 'BASRI', 0, 'Laki - Lak', 'SIDOMULYO', 0, 0, 0, 'JURUGAN', '1968-12-31', 15, 29, '1', '0000-00-00 00:00:00'),
(3919, '3404210074815', 'DANANG SUTEJO', 0, 'Laki - Lak', 'WONOKERSO RT 009 RW 010', 0, 0, 0, 'SLEMAN', '1993-03-11', 15, 29, '1', '0000-00-00 00:00:00'),
(3920, '3404210074907', 'DWI HATMIKO', 0, 'Laki - Lak', 'MLATI GLONDONG RT 004/RW 019 ', 0, 0, 0, 'SLEMAN', '1978-08-23', 7, 29, '1', '0000-00-00 00:00:00'),
(3921, '3404210075015', 'ENAN SUHARSO', 0, 'Laki - Lak', 'SARAGAN', 0, 0, 0, 'SLEMAN', '1980-04-18', 15, 29, '1', '0000-00-00 00:00:00'),
(3922, '3404210075119', 'HARIS SUPRIYANA', 0, 'Laki - Lak', 'KLONCOMAN RT 001/RW 014', 0, 0, 0, 'SLEMAN', '1966-03-12', 19, 29, '1', '0000-00-00 00:00:00'),
(3923, '3404210075220', 'HARWASONO', 0, 'Laki - Lak', 'PERUMAHAN GRIYA TAMAN ASDRI D-210', 0, 0, 0, 'SLEMAN', '1966-03-13', 20, 29, '1', '0000-00-00 00:00:00'),
(3924, '3404210075315', 'HARYONO', 0, 'Laki - Lak', 'TLACAP', 0, 0, 0, 'SLEMAN', '1976-08-26', 15, 29, '1', '0000-00-00 00:00:00'),
(3925, '3404210075415', 'JUMARWAN', 0, 'Laki - Lak', 'TLACAP', 0, 0, 0, 'SLEMAN', '1974-10-01', 15, 29, '1', '0000-00-00 00:00:00'),
(3926, '3404210075515', 'JUWADI', 0, 'Laki - Lak', 'SAWAHAN RT 001/RW 018', 0, 0, 0, 'SLEMAN', '1973-01-26', 15, 29, '1', '0000-00-00 00:00:00'),
(3927, '3404210075615', 'MARKABAN', 0, 'Laki - Lak', 'PLALANGAN RT 003/RW 041', 0, 0, 0, 'SLEMAN', '1960-10-10', 15, 29, '1', '0000-00-00 00:00:00'),
(3928, '3404210075715', 'N. SUYATA', 0, 'Laki - Lak', 'TAMBAKREJO RT 002/RW 011', 0, 0, 0, 'SLEMAN', '1963-10-10', 15, 29, '1', '0000-00-00 00:00:00'),
(3929, '3404210075804', 'NASHRUL HIDAYAT', 0, 'Laki - Lak', 'PERUMAHAN GRIYA TAMAN ASRI A-308 RT 6 RW 32', 0, 0, 0, 'SURABAYA', '1978-06-12', 4, 29, '1', '0000-00-00 00:00:00'),
(3930, '3404210075915', 'PONIRAN', 0, 'Laki - Lak', 'KAYEN', 0, 0, 0, 'SLEMAN', '1967-11-22', 15, 29, '1', '0000-00-00 00:00:00'),
(3931, '3404210076015', 'PRIYADI', 0, 'Laki - Lak', 'TEGALSARI 001/023', 0, 0, 0, 'SLEMAN', '1987-04-20', 15, 29, '1', '0000-00-00 00:00:00'),
(3932, '3404210076115', 'PURNOMO', 0, 'Laki - Lak', 'JLAMPRANG', 0, 0, 0, 'SLEMAN', '1978-06-16', 15, 29, '1', '0000-00-00 00:00:00'),
(3933, '3404210076223', 'SARWOTO', 0, 'Laki - Lak', 'RANDU SONGO RT 004/RW 005', 0, 0, 0, 'SLEMAM', '1965-04-14', 23, 29, '1', '0000-00-00 00:00:00'),
(3934, '3404210076320', 'SATRIYO SADMOKO', 0, 'Laki - Lak', 'PERUMAHAN GRIYA TAMAN ASDRI B-549', 0, 0, 0, 'PAYAKUMBUH', '1960-08-19', 20, 29, '1', '0000-00-00 00:00:00'),
(3935, '3404210076406', 'SEFRI SULISTIYANTO', 0, 'Laki - Lak', 'KRANDON', 0, 0, 0, 'SEMARANG', '1982-11-23', 6, 29, '1', '0000-00-00 00:00:00'),
(3936, '3404210076513', 'SUBANDI', 0, 'Laki - Lak', 'NIRON RT 02/RW 20', 0, 0, 0, 'BANTUL', '1970-12-18', 13, 29, '1', '0000-00-00 00:00:00'),
(3937, '3404210076615', 'SUDARYANTA', 0, 'Laki - Lak', 'TEMON RT 04 RW 23', 0, 0, 0, 'SLEMAN', '1973-12-09', 15, 29, '1', '0000-00-00 00:00:00'),
(3938, '3404210076713', 'SUKIRNO', 0, 'Laki - Lak', 'JURUGAN', 0, 0, 0, 'SLEMAN', '1971-12-10', 13, 29, '1', '0000-00-00 00:00:00'),
(3939, '3404210076815', 'SURONO', 0, 'Laki - Lak', 'BRAYUT RT 001/RW 028', 0, 0, 0, 'BANTUL', '1974-02-09', 15, 29, '1', '0000-00-00 00:00:00'),
(3940, '3404210076915', 'SUTONO', 0, 'Laki - Lak', 'KLONCOMAN RT 002/RW 014', 0, 0, 0, 'SLEMAN', '1968-09-19', 15, 29, '1', '0000-00-00 00:00:00'),
(3941, '3404210077010', 'TRI SUSANTO', 0, 'Laki - Lak', 'BLUNYAH RT 04/16', 0, 0, 0, 'SLEMAN', '1978-09-22', 10, 29, '1', '0000-00-00 00:00:00'),
(3942, '3404210077106', 'TRI SUTRISNO', 0, 'Laki - Lak', 'GONDANGLEGI 003/013', 0, 0, 0, 'YOGYAKARTA', '1986-04-15', 6, 29, '1', '0000-00-00 00:00:00'),
(3943, '3404210077206', 'VICO PRABA KUSUMA', 0, 'Laki - Lak', 'MARON RT 03 RW 11', 0, 0, 0, 'SLEMAN', '1985-10-26', 6, 29, '1', '0000-00-00 00:00:00'),
(3944, '3404210077315', 'YUSUP HARYANTO', 0, 'Laki - Lak', 'KLONCOMAN', 0, 0, 0, 'SLEMAN', '1980-03-23', 15, 29, '1', '0000-00-00 00:00:00'),
(3945, '3404210077415', 'ZAENAL ARIFIN', 0, 'Laki - Lak', 'GROJOGAN RT 04 RW 02', 0, 0, 0, 'MAGELANG', '1978-08-22', 15, 29, '1', '0000-00-00 00:00:00'),
(3946, '3404220077500', 'A. DWI WIDODO', 0, 'Laki - Lak', 'BLENDUNG RT02/RW21', 0, 0, 0, 'SLEMAN', '1978-03-12', 0, 0, '1', '0000-00-00 00:00:00'),
(3947, '3404220077600', 'AGUS MULYONO', 0, 'Laki - Lak', 'GANCAHAN II RT5/RW11', 0, 0, 0, 'SLEMAN', '1985-08-26', 0, 0, '1', '0000-00-00 00:00:00'),
(3948, '3404220077700', 'AGUS SUDIRMAN', 0, 'Laki - Lak', 'BRONGKOL RT04/RW04', 0, 0, 0, 'KEBUMEN', '1967-07-06', 0, 0, '1', '0000-00-00 00:00:00'),
(3949, '3404220077800', 'AGUS SUSILO', 0, 'Laki - Lak', 'SUMBER RT04/RW12', 0, 0, 0, 'KULON PROGO', '1978-08-09', 0, 0, '1', '0000-00-00 00:00:00'),
(3950, '3404220077900', 'ALI YANTA', 0, 'Laki - Lak', 'GENTINGAN RT05/RW06', 0, 0, 0, 'SLEMAN', '1972-10-19', 0, 0, '1', '0000-00-00 00:00:00'),
(3951, '3404220078000', 'ANDY HERBIANTO', 0, 'Laki - Lak', 'SEMINGIN', 0, 0, 0, 'SLEMAN', '1985-03-06', 0, 0, '1', '0000-00-00 00:00:00'),
(3952, '3404220078107', 'BAMBANG PUJIONO', 0, 'Laki - Lak', 'SOKONILO RT02/RW01', 0, 0, 0, 'SURABAYA', '1958-06-21', 7, 0, '1', '0000-00-00 00:00:00'),
(3953, '3404220078200', 'BASIRAN', 0, 'Laki - Lak', 'PANDEAN VII RT01/RW15', 0, 0, 0, 'SLEMAN', '1972-02-15', 0, 0, '1', '0000-00-00 00:00:00'),
(3954, '3404220078300', 'BEJA', 0, 'Laki - Lak', 'PENDULUN', 0, 0, 0, 'SLEMAN', '1966-09-16', 0, 0, '1', '0000-00-00 00:00:00'),
(3955, '3404220078423', 'DIAN NOPENDI SLAMET D', 0, 'Laki - Lak', 'JETIS IV RT01/RW07', 0, 0, 0, 'SLEMAN', '1980-11-13', 23, 0, '1', '0000-00-00 00:00:00'),
(3956, '3404220078500', 'DIMAS DWI SAPUTRO', 0, 'Laki - Lak', 'JETIS V RT02/RW07', 0, 0, 0, 'JAKARTA', '1989-09-17', 0, 0, '1', '0000-00-00 00:00:00'),
(3957, '3404220078600', 'DJUMINAH', 0, 'Perempuan', 'JOWAH V RT03 RW10, ', 0, 0, 0, 'YOGYAKARTA', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(3958, '3404220078700', 'EDY MARYONO, ST', 0, 'Laki - Lak', 'KLACI III RT02/RW12', 0, 0, 0, 'KULON PROGO', '1973-03-25', 0, 0, '1', '0000-00-00 00:00:00'),
(3959, '3404220078800', 'ERMAWANTO', 0, 'Laki - Lak', 'REWULU KULON RT03/RW22', 0, 0, 0, 'SLEMAN', '1978-02-06', 0, 0, '1', '0000-00-00 00:00:00'),
(3960, '3404220078900', 'FERI DARISMAN', 0, 'Laki - Lak', 'JETIS RT01 RW07', 0, 0, 0, 'SLEMAN', '1986-07-15', 0, 0, '1', '0000-00-00 00:00:00'),
(3961, '3404220079000', 'FX TRI HARYANTO', 0, 'Laki - Lak', 'GANCAHAN V RT03/RW10', 0, 0, 0, 'SLEMAN', '1957-04-15', 0, 0, '1', '0000-00-00 00:00:00'),
(3962, '3404220079100', 'GALUH SOFYAN AJI', 0, 'Laki - Lak', 'GENTINGAN RT03/RW05', 0, 0, 0, 'SLEMAN', '1976-04-29', 0, 0, '1', '0000-00-00 00:00:00'),
(3963, '3404220079200', 'GATOT SUGIYARTO', 0, 'Laki - Lak', 'CURITAN V RT07 / RW07', 0, 0, 0, 'SLEMAN', '1968-05-10', 0, 0, '1', '0000-00-00 00:00:00'),
(3964, '3404220079300', 'GIYANTO', 0, 'Laki - Lak', 'PRENGGAN ', 0, 0, 0, 'SLEMAN', '1973-04-12', 0, 0, '1', '0000-00-00 00:00:00'),
(3965, '3404220079400', 'GUNARDI', 0, 'Laki - Lak', 'REWULUWETAN RT01 RW20', 0, 0, 0, 'SLEMAN', '1976-02-10', 0, 0, '1', '0000-00-00 00:00:00'),
(3966, '3404220079500', 'BAMBANG WIDARTO', 0, 'Laki - Lak', 'SEMBUH WETAN RT 002 RW 024', 0, 0, 0, 'SLEMAN', '1968-03-02', 0, 0, '1', '0000-00-00 00:00:00'),
(3967, '3404220079600', 'HANDOKO INTAN PRASETYO', 0, 'Laki - Lak', 'TIWIR RT06/RW20', 0, 0, 0, 'SLEMAN', '1983-12-07', 0, 0, '1', '0000-00-00 00:00:00'),
(3968, '3404220079723', 'HARI WIDODO', 0, 'Laki - Lak', 'SEMBUH WETAN RT04/RW25', 0, 0, 0, 'BANTUL', '1969-01-26', 23, 0, '1', '0000-00-00 00:00:00'),
(3969, '3404220079800', 'HARIYANTO', 0, 'Laki - Lak', 'GENTINGAN RT02/RW05', 0, 0, 0, 'SLEMAN', '1985-06-24', 0, 0, '1', '0000-00-00 00:00:00'),
(3970, '3404220079900', 'IMAM GOZALI', 0, 'Laki - Lak', 'CANDRAN RT09/RW05', 0, 0, 0, 'YOGYAKARTA', '1965-09-16', 0, 0, '1', '0000-00-00 00:00:00'),
(3971, '3404220080000', 'JUNI EKO PRASETYO', 0, 'Laki - Lak', 'JETIS V RT02/RW07', 0, 0, 0, 'SLEMAN', '1982-06-17', 0, 0, '1', '0000-00-00 00:00:00'),
(3972, '3404220080100', 'KARMIN', 0, 'Laki - Lak', 'GODEAN IV', 0, 0, 0, 'GUNUNG KIDUL', '1967-09-22', 0, 0, '1', '0000-00-00 00:00:00'),
(3973, '3404220080207', 'M. SUDARTO', 0, 'Laki - Lak', 'GODEAN IV ', 0, 0, 0, 'SLEMAN', '1962-05-15', 7, 0, '1', '0000-00-00 00:00:00'),
(3974, '3404220080300', 'MACHMUD TRI SETIAWAN', 0, 'Laki - Lak', 'GANCAHAN V RT01/RW09', 0, 0, 0, 'MADIUN', '1971-05-16', 0, 0, '1', '0000-00-00 00:00:00'),
(3975, '3404220080400', 'MARGANA', 0, 'Laki - Lak', 'KRAJAN RT02/RW22', 0, 0, 0, 'SLEMAN', '1973-02-24', 0, 0, '1', '0000-00-00 00:00:00'),
(3976, '3404220080500', 'MARSUDI', 0, 'Laki - Lak', 'SUMBER RT03/RW11', 0, 0, 0, 'SLEMAN', '1975-05-02', 0, 0, '1', '0000-00-00 00:00:00'),
(3977, '3404220080608', 'MOHAMMAD ARIFIN', 0, 'Laki - Lak', 'KEMIRI SEWU RT01/RW23', 0, 0, 0, 'SLEMAN', '1985-05-23', 8, 0, '1', '0000-00-00 00:00:00'),
(3978, '3404220080700', 'MUHADI', 0, 'Laki - Lak', 'GANCAHAN V RT06/RW11`', 0, 0, 0, 'SLEMAN', '1985-11-25', 0, 0, '1', '0000-00-00 00:00:00'),
(3979, '3404220080810', 'MUHAMMAD ARIFAN', 0, 'Laki - Lak', 'GODEAN IV RT04/RW08', 0, 0, 0, 'SLEMAN', '1989-09-12', 10, 0, '1', '0000-00-00 00:00:00'),
(3980, '3404220080923', 'NAFILUDIN', 0, 'Laki - Lak', 'JL. GARUDA V KRAPYAK RT4/RW17', 0, 0, 0, 'KENDAL', '1989-12-02', 23, 0, '1', '0000-00-00 00:00:00'),
(3981, '3404220081000', 'NOVIADI EKA PUTRA', 0, 'Laki - Lak', 'GODEAN IV RT04/RW08', 0, 0, 0, 'PADANG', '1980-11-17', 0, 0, '1', '0000-00-00 00:00:00'),
(3982, '3404220081100', 'P. HARJUNANTO', 0, 'Laki - Lak', 'BANTULAN RT03/RW05', 0, 0, 0, 'SLEMAN', '1972-06-17', 0, 0, '1', '0000-00-00 00:00:00'),
(3983, '3404220081200', 'PURWANTO', 0, 'Laki - Lak', 'KUNDEN VII RT01/RW18', 0, 0, 0, 'LAMPUNG', '1976-02-10', 0, 0, '1', '0000-00-00 00:00:00'),
(3984, '3404220081300', 'R. BAYU HIDAYATULLOH. SH.', 0, 'Laki - Lak', 'JETIS IV RT01/RW07', 0, 0, 0, 'SLEMAN', '1975-01-13', 0, 0, '1', '0000-00-00 00:00:00'),
(3985, '3404220081400', 'REZA APRIYANTO', 0, 'Laki - Lak', 'BAREPAN VII RT05/RW16', 0, 0, 0, 'SLEMAN', '1997-04-06', 0, 0, '1', '0000-00-00 00:00:00'),
(3986, '3404220081500', 'RISTANTO RIANDANU', 0, 'Laki - Lak', 'BANTULAN RT07/RW04', 0, 0, 0, 'SLEMAN', '1978-12-17', 0, 0, '1', '0000-00-00 00:00:00'),
(3987, '3404220081600', 'RIYANTO, SAG, MPDI', 0, 'Laki - Lak', 'SEMBUNGAN RT 06/RW 12', 0, 0, 0, 'SLEMAN', '1962-09-15', 0, 0, '1', '0000-00-00 00:00:00'),
(3988, '3404220081708', 'SALSHABILLA RISMA AYYUNI', 0, 'Perempuan', 'GENTINGAN RT04/RW06', 0, 0, 0, 'SLEMAN', '1998-06-17', 8, 0, '1', '0000-00-00 00:00:00'),
(3989, '3404220081800', 'SISCA DEWI FEBRIYANTI', 0, 'Perempuan', 'JOWAH V RT03/RW10', 0, 0, 0, 'YOGYAKARTA', '1995-02-25', 0, 0, '1', '0000-00-00 00:00:00'),
(3990, '3404220081900', 'SUKARMAN', 0, 'Laki - Lak', 'SEMBUH WETAN RT02/RW24', 0, 0, 0, 'SLEMAN', '1967-12-11', 0, 0, '1', '0000-00-00 00:00:00'),
(3991, '3404220082008', 'SUKISMOYO', 0, 'Laki - Lak', 'GENTINGAN RT04/RW06', 0, 0, 0, 'SLEMAN', '1969-08-18', 8, 0, '1', '0000-00-00 00:00:00'),
(3992, '3404220082100', 'SUROTO', 0, 'Laki - Lak', 'GANCAHAN VIII', 0, 0, 0, 'SLEMAN', '1976-12-13', 0, 0, '1', '0000-00-00 00:00:00'),
(3993, '3404220082200', 'SUTRISNO', 0, 'Laki - Lak', 'KLACI II RT01/RW10', 0, 0, 0, 'SLEMAN', '1966-04-02', 0, 0, '1', '0000-00-00 00:00:00'),
(3994, '3404220082300', 'TARYONO', 0, 'Laki - Lak', 'GENTINGAN RT01/RW05', 0, 0, 0, 'SLEMAN', '1967-07-20', 0, 0, '1', '0000-00-00 00:00:00'),
(3995, '3404220082400', 'TIMBUL ENDRO SUSILO', 0, 'Laki - Lak', 'JOWAH V ', 0, 0, 0, 'GUNUNG KIDUL', '1969-12-15', 0, 0, '1', '0000-00-00 00:00:00'),
(3996, '3404220082500', 'TRIYADI', 0, 'Laki - Lak', 'REWULU WETAN RT01/RW20', 0, 0, 0, 'SLEMAN', '1980-01-21', 0, 0, '1', '0000-00-00 00:00:00'),
(3997, '3404220082600', 'TRIYANTO', 0, 'Laki - Lak', 'PETE RT02/RW16', 0, 0, 0, 'SLEMAN', '1976-03-16', 0, 0, '1', '0000-00-00 00:00:00'),
(3998, '3404220082700', 'TUGAS SUGIYANTO', 0, 'Laki - Lak', 'REWULU WETAN RT01/RW20', 0, 0, 0, 'SLEMAN', '1969-12-25', 0, 0, '1', '0000-00-00 00:00:00'),
(3999, '3404220082810', 'WASTANA', 0, 'Laki - Lak', 'KOWANAN RT03/RW13', 0, 0, 0, 'GUNUNG KIDUL', '1994-03-01', 10, 0, '1', '0000-00-00 00:00:00'),
(4000, '3404220082900', 'WIDAYANTO, ST', 0, 'Laki - Lak', 'GODEAN IV RT04/RW09', 0, 0, 0, 'SLEMAN', '1977-02-21', 0, 0, '1', '0000-00-00 00:00:00'),
(4001, '3404220083000', 'WUSONO', 0, 'Laki - Lak', 'GANCAHAN V RT02/RW09', 0, 0, 0, 'SLEMAN', '1971-09-29', 0, 0, '1', '0000-00-00 00:00:00'),
(4002, '3404220083100', 'YULIANTO WIBOWO', 0, 'Laki - Lak', 'KRAMAT LOR RT08/RW18', 0, 0, 0, 'SLEMAN', '1993-07-11', 0, 0, '1', '0000-00-00 00:00:00'),
(4003, '3404230083210', 'AGUSTINUS ARIYANTO', 0, 'Laki - Lak', 'GONDOARUM 04/04', 0, 0, 0, 'SLEMAN', '1978-05-03', 10, 7, '1', '0000-00-00 00:00:00'),
(4004, '3404230083310', 'AGUSTINUS SURYADI', 0, 'Laki - Lak', 'GONDOARUM 04/04', 0, 0, 0, 'SLEMAN', '1970-03-12', 10, 7, '1', '0000-00-00 00:00:00'),
(4005, '3404230083410', 'AMIR', 0, 'Laki - Lak', 'GONDOARUM,02/03', 0, 0, 0, 'SLEMAN', '1979-05-20', 10, 7, '1', '0000-00-00 00:00:00'),
(4006, '3404230083520', 'DWI PUJI ASTUTI', 0, 'Perempuan', 'GONDOARUM 04/04', 0, 0, 0, 'SLEMAN', '1980-03-29', 20, 7, '1', '0000-00-00 00:00:00'),
(4007, '3404230083606', 'DWI PURWANTARI', 0, 'Perempuan', 'TUNGGULARUM 02/01', 0, 0, 0, 'SLEMAN', '1983-03-19', 6, 7, '1', '0000-00-00 00:00:00'),
(4008, '3404230083723', 'HARDONO', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1986-02-08', 23, 7, '1', '0000-00-00 00:00:00'),
(4009, '3404230083812', 'HARSONO', 0, 'Laki - Lak', 'SIDOREJO 06/04', 0, 0, 0, 'SLEMAN', '1966-12-31', 5, 7, '1', '0000-00-00 00:00:00'),
(4010, '3404230083907', 'IG.DARMANTO', 0, 'Laki - Lak', 'GONDOARUM 04/04', 0, 0, 0, 'SLEMAN', '1974-04-09', 7, 7, '1', '0000-00-00 00:00:00'),
(4011, '3404230084005', 'INDRA BASKORO ADI', 0, 'Laki - Lak', 'TURGO 03/02', 0, 0, 0, 'TRENGGALEK', '1983-04-16', 5, 7, '1', '0000-00-00 00:00:00'),
(4012, '3404230084107', 'ISKANDAR', 0, 'Laki - Lak', 'TEGALSARI 02/03', 0, 0, 0, 'SLEMAN', '1972-07-18', 7, 7, '1', '0000-00-00 00:00:00'),
(4013, '3404230084221', 'JOKO PURNOMO', 0, 'Laki - Lak', 'GONDOARUM 04/04', 0, 0, 0, 'CILACAP', '1969-01-19', 21, 7, '1', '0000-00-00 00:00:00'),
(4014, '3404230084310', 'MARIA HARTATI', 0, 'Perempuan', 'TUNGGULARUM 04/02', 0, 0, 0, 'SLEMAN', '1972-07-06', 10, 7, '1', '0000-00-00 00:00:00'),
(4015, '3404230084406', 'MARYADI', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1988-05-15', 6, 7, '1', '0000-00-00 00:00:00'),
(4016, '3404230084502', 'MITRI', 0, 'Perempuan', 'TUNGGULARUM 04/02', 0, 0, 0, 'SLEMAN', '1984-04-08', 2, 7, '1', '0000-00-00 00:00:00'),
(4017, '3404230084615', 'MULYONO', 0, 'Laki - Lak', 'TUNGGULARUM 04/02', 0, 0, 0, 'SLEMAN', '1956-07-12', 15, 7, '1', '0000-00-00 00:00:00'),
(4018, '3404230084723', 'MUSTIJO', 0, 'Laki - Lak', 'GONDOARUM 01/03', 0, 0, 0, 'SLEMAN', '1968-05-10', 23, 7, '1', '0000-00-00 00:00:00'),
(4019, '3404230084806', 'SARYANTO', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1988-01-03', 6, 7, '1', '0000-00-00 00:00:00'),
(4020, '3404230084912', 'SETYO PRAYITNO', 0, 'Laki - Lak', 'NGANGGRING 03/04', 0, 0, 0, 'SLEMAN', '1958-12-31', 5, 7, '1', '0000-00-00 00:00:00'),
(4021, '3404230085007', 'SIHONO ', 0, 'Laki - Lak', 'BANJARSARI 01/08', 0, 0, 0, 'SLEMAN', '1975-08-17', 7, 7, '1', '0000-00-00 00:00:00'),
(4022, '3404230085110', 'SISWANTI', 0, 'Perempuan', 'GONDOARUM 04/04', 0, 0, 0, 'SLEMAN', '1967-03-15', 10, 7, '1', '0000-00-00 00:00:00'),
(4023, '3404230085204', 'SIYONO', 0, 'Laki - Lak', 'TUNGGULARUM 04/02', 0, 0, 0, 'SLEMAN', '1977-01-24', 4, 7, '1', '0000-00-00 00:00:00'),
(4024, '3404230085318', 'SLAMET', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1976-06-15', 18, 7, '1', '0000-00-00 00:00:00'),
(4025, '3404230085423', 'SOKIJO', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1965-05-20', 23, 7, '1', '0000-00-00 00:00:00'),
(4026, '3404230085506', 'ST.AGUNG HARI SATRIA', 0, 'Laki - Lak', 'GONDOARUM 04/04', 0, 0, 0, 'SLEMAN', '1975-09-23', 6, 7, '1', '0000-00-00 00:00:00'),
(4027, '3404230085606', 'STEPANUS RIADI MINULYO', 0, 'Laki - Lak', 'GONDOARUM 04/04', 0, 0, 0, 'CILACAP', '1980-01-30', 6, 7, '1', '0000-00-00 00:00:00'),
(4028, '3404230085708', 'SUDARSONO', 0, 'Laki - Lak', 'DADAPAN 04/26', 0, 0, 0, 'SLEMAN', '1967-05-08', 8, 7, '1', '0000-00-00 00:00:00'),
(4029, '3404230085823', 'SUHADAK', 0, 'Laki - Lak', 'TUNGGULARUM 02/01', 0, 0, 0, 'SLEMAN', '1977-03-13', 23, 7, '1', '0000-00-00 00:00:00'),
(4030, '3404230085918', 'SUHARDI', 0, 'Laki - Lak', 'PULEWULUNG 05/29', 0, 0, 0, 'SLEMAN', '1970-06-10', 18, 7, '1', '0000-00-00 00:00:00'),
(4031, '3404230086023', 'SUHARI ', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1980-07-09', 23, 7, '1', '0000-00-00 00:00:00'),
(4032, '3404230086106', 'SUKIDI', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1977-06-08', 6, 7, '1', '0000-00-00 00:00:00'),
(4033, '3404230086208', 'SUKRIS MAWANTORO', 0, 'Laki - Lak', 'GONDOARUM 03/04', 0, 0, 0, 'SLEMAN', '1992-02-07', 8, 7, '1', '0000-00-00 00:00:00'),
(4034, '3404230086323', 'SUNGKONO', 0, 'Laki - Lak', 'GONDOARUM 03/04', 0, 0, 0, 'SLEMAN', '1984-12-09', 23, 7, '1', '0000-00-00 00:00:00'),
(4035, '3404230086423', 'SUPARDI', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1974-10-02', 23, 7, '1', '0000-00-00 00:00:00'),
(4036, '3404230086506', 'SUPARMAN', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1981-12-25', 6, 7, '1', '0000-00-00 00:00:00'),
(4037, '3404230086606', 'SURYANTO', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1985-01-26', 6, 7, '1', '0000-00-00 00:00:00'),
(4038, '3404230086706', 'SUTARJA', 0, 'Laki - Lak', 'GONDOARUM 01/03', 0, 0, 0, 'SLEMAN', '1964-04-17', 6, 7, '1', '0000-00-00 00:00:00'),
(4039, '3404230086812', 'SUTARNA', 0, 'Laki - Lak', 'NGANGGRING 03/04', 0, 0, 0, 'SLEMAN', '1974-01-05', 5, 7, '1', '0000-00-00 00:00:00'),
(4040, '3404230086908', 'SUYATMI', 0, 'Perempuan', 'TUNGGULARUM 02/01', 0, 0, 0, 'SLEMAN', '1971-09-25', 8, 7, '1', '0000-00-00 00:00:00'),
(4041, '3404230087006', 'SUYATMIN', 0, 'Laki - Lak', 'TUNGGULARUM 04/02', 0, 0, 0, 'SLEMAN', '1979-12-07', 6, 7, '1', '0000-00-00 00:00:00'),
(4042, '3404230087125', 'TH.KRISTANTO', 0, 'Laki - Lak', 'TUNGGULARUM 02/01', 0, 0, 0, 'SLEMAN', '1966-03-05', 25, 7, '1', '0000-00-00 00:00:00'),
(4043, '3404230087207', 'TUKIDI', 0, 'Laki - Lak', 'GONDOREJO KIDUL', 0, 0, 0, 'SLEMAN', '1980-06-07', 7, 7, '1', '0000-00-00 00:00:00'),
(4044, '3404230087307', 'WAKIDI', 0, 'Laki - Lak', 'KAPING REJO 01/07', 0, 0, 0, 'SLEMAN', '1972-10-21', 7, 7, '1', '0000-00-00 00:00:00'),
(4045, '3404230087412', 'WARTONO', 0, 'Laki - Lak', 'GONDOARUM 02/03', 0, 0, 0, 'SLEMAN', '1989-01-20', 5, 7, '1', '0000-00-00 00:00:00'),
(4046, '3404230087506', 'YOHANES SISWANTO', 0, 'Laki - Lak', 'GONDOARUM 03/01', 0, 0, 0, 'SLEMAN', '1969-01-01', 6, 7, '1', '0000-00-00 00:00:00'),
(4047, '3404240087622', 'AILIEN PRISSATYAWATI S, S.PD', 0, 'Perempuan', 'NGABLAK', 0, 0, 0, 'SLEMAN', '1970-11-03', 22, 1, '1', '0000-00-00 00:00:00'),
(4048, '3404240087706', 'ANISA INDRIYANI', 0, 'Perempuan', 'PLOSOKUNING', 0, 0, 0, 'SLEMAN', '1994-12-07', 6, 1, '1', '0000-00-00 00:00:00'),
(4049, '3404240087806', 'BAGUS SUHARYONO', 0, 'Laki - Lak', 'TERBAN', 0, 0, 0, 'SURABAYA', '1986-07-15', 6, 1, '1', '0000-00-00 00:00:00'),
(4050, '3404240087907', 'BUDI SETIONO', 0, 'Laki - Lak', 'KEMIREN', 0, 0, 0, 'MAGELANG', '1968-09-21', 7, 1, '1', '0000-00-00 00:00:00'),
(4051, '3404240088024', 'DIAN WAHYU SAKTIWICAKSONO', 0, 'Laki - Lak', 'SOROGATEN', 0, 0, 0, 'MAGELANG', '1991-10-01', 24, 1, '1', '0000-00-00 00:00:00'),
(4052, '3404240088110', 'ERWIN SUSILO NUGROHO', 0, 'Laki - Lak', 'TEMULAWAK', 0, 0, 0, 'MAGELANG', '1982-05-01', 10, 1, '1', '0000-00-00 00:00:00'),
(4053, '3404240088207', 'H SARBINI', 0, 'Laki - Lak', 'PLOSO KUNING', 0, 0, 0, 'SLEMAN', '1961-08-21', 7, 1, '1', '0000-00-00 00:00:00'),
(4054, '3404240088306', 'HARYOTO', 0, 'Laki - Lak', 'GANGGONG', 0, 0, 0, 'SLEMAN', '1974-10-10', 6, 1, '1', '0000-00-00 00:00:00'),
(4055, '3404240088424', 'HERI PRIYOWIBOWO', 0, 'Laki - Lak', 'PONDOK', 0, 0, 0, 'MAGELANG', '1967-02-19', 24, 1, '1', '0000-00-00 00:00:00'),
(4056, '3404240088511', 'ISHA NURHIDAYANTO', 0, 'Laki - Lak', 'BALECATUR', 0, 0, 0, 'SLEMAN', '1987-11-30', 11, 1, '1', '0000-00-00 00:00:00'),
(4057, '3404240088610', 'KASWANTO', 0, 'Laki - Lak', 'JATEN', 0, 0, 0, 'SLEMAN', '1974-08-21', 10, 1, '1', '0000-00-00 00:00:00'),
(4058, '3404240088708', 'KOMARYATI, S.HUT', 0, 'Perempuan', 'MANCASAN', 0, 0, 0, 'SLEMAN', '1972-07-01', 8, 1, '1', '0000-00-00 00:00:00'),
(4059, '3404240088806', 'MARZUNI', 0, 'Laki - Lak', 'TEMULAWAK', 0, 0, 0, 'SLEMAN', '1966-08-18', 6, 1, '1', '0000-00-00 00:00:00'),
(4060, '3404240088923', 'MAWARDI', 0, 'Laki - Lak', 'JOMBONG', 0, 0, 0, 'MAGELANG', '1972-06-09', 23, 1, '1', '0000-00-00 00:00:00'),
(4061, '3404240089020', 'MUHAMMAD MASYKUR', 0, 'Laki - Lak', 'NGABLAK', 0, 0, 0, 'SLEMAN', '1971-06-08', 20, 1, '1', '0000-00-00 00:00:00'),
(4062, '3404240089110', 'MUJIYONO', 0, 'Laki - Lak', 'POGUNGREJO', 0, 0, 0, 'SLEMAN', '1960-12-31', 10, 1, '1', '0000-00-00 00:00:00'),
(4063, '3404240089206', 'MURYANTO', 0, 'Laki - Lak', 'TEKIK', 0, 0, 0, 'SLEMAN', '1970-09-02', 6, 1, '1', '0000-00-00 00:00:00'),
(4064, '3404240089306', 'NUGROHO UTOMO, SE.MM', 0, 'Laki - Lak', 'MURANGAN', 0, 0, 0, 'KLATEN', '1964-04-16', 6, 1, '1', '0000-00-00 00:00:00'),
(4065, '3404240089406', 'NUR  AHMAD KHOIRI', 0, 'Laki - Lak', 'SEDOGAN', 0, 0, 0, 'SLEMAN', '1992-11-26', 6, 1, '1', '0000-00-00 00:00:00'),
(4066, '3404240089523', 'PURWANTO BA', 0, 'Laki - Lak', 'SOKO TEGAL', 0, 0, 0, 'SLEMAN', '1955-03-25', 23, 1, '1', '0000-00-00 00:00:00'),
(4067, '3404240089608', 'R.SIGIT PRAYOGO', 0, 'Laki - Lak', 'PERUM NOGOTIRTO', 0, 0, 0, 'SEMARANG', '1955-10-04', 8, 1, '1', '0000-00-00 00:00:00'),
(4068, '3404240089718', 'RAHMAD ANDI PRASETYO', 0, 'Laki - Lak', 'SOKO TEGAL', 0, 0, 0, 'SLEMAN', '1986-11-15', 18, 1, '1', '0000-00-00 00:00:00'),
(4069, '3404240089807', 'SUDIYANTO', 0, 'Laki - Lak', 'KARANGPOH', 0, 0, 0, 'SLEMAN', '1961-06-18', 7, 1, '1', '0000-00-00 00:00:00'),
(4070, '3404240089923', 'SUGIHARTO', 0, 'Laki - Lak', 'PONDOK', 0, 0, 0, 'BANTUL', '1959-09-04', 23, 1, '1', '0000-00-00 00:00:00'),
(4071, '3404240090007', 'SUHARTO', 0, 'Laki - Lak', 'GROGOLSARI', 0, 0, 0, 'MAGELANG', '1976-12-30', 7, 1, '1', '0000-00-00 00:00:00'),
(4072, '3404240090107', 'SUJARWONO', 0, 'Laki - Lak', 'JENENGAN', 0, 0, 0, 'SLEMAN', '1956-05-01', 7, 1, '1', '0000-00-00 00:00:00'),
(4073, '3404240090213', 'SUMIYATI', 0, 'Perempuan', 'GEJAYAN', 0, 0, 0, 'MAGELANG', '1969-08-08', 13, 1, '1', '0000-00-00 00:00:00'),
(4074, '3404240090306', 'SUPRAPTO', 0, 'Laki - Lak', 'NGELOREJO', 0, 0, 0, 'MAGELANG', '1964-08-08', 6, 1, '1', '0000-00-00 00:00:00'),
(4075, '3404240090406', 'SUVIYATNO', 0, 'Laki - Lak', 'GADUNG', 0, 0, 0, 'SLEMAN', '1984-08-20', 6, 1, '1', '0000-00-00 00:00:00'),
(4076, '3404240090506', 'SUWAJI', 0, 'Laki - Lak', 'PLOSO KUNING', 0, 0, 0, 'SLEMAN', '1968-06-06', 6, 1, '1', '0000-00-00 00:00:00'),
(4077, '3404240090617', 'SUWARDI', 0, 'Laki - Lak', 'KALIRASE', 0, 0, 0, 'SLEMAN', '1964-08-18', 17, 1, '1', '0000-00-00 00:00:00'),
(4078, '3404240090706', 'ZAMHASARI', 0, 'Laki - Lak', 'JELEHAN KULON', 0, 0, 0, 'MAGELANG', '1958-08-20', 6, 1, '1', '0000-00-00 00:00:00'),
(4079, '3404250090818', 'ADI SUNARSIH', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1936-06-13', 18, 5, '1', '0000-00-00 00:00:00'),
(4080, '3404250090910', 'AGUS SUBARI', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1974-08-12', 10, 5, '1', '0000-00-00 00:00:00'),
(4081, '3404250091023', 'AGUS SUGIARTO', 0, 'Laki - Lak', 'GARONGAN', 0, 0, 0, '', '0000-00-00', 23, 5, '1', '0000-00-00 00:00:00'),
(4082, '3404250091123', 'SEPTI SRI WARDANI', 0, 'Perempuan', 'NGEMBESAN', 0, 0, 0, 'SLEMAN', '1983-09-21', 23, 5, '1', '0000-00-00 00:00:00'),
(4083, '3404250091210', 'BAGUS TRI HANDOKO', 0, 'Laki - Lak', 'MANGGUNGSARI ', 0, 0, 0, '', '0000-00-00', 10, 5, '1', '0000-00-00 00:00:00'),
(4084, '3404250091323', 'BAMBANG SETYAWAN', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1980-07-15', 23, 5, '1', '0000-00-00 00:00:00'),
(4085, '3404250091407', 'BAYU SAPUTRO', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN', '0000-00-00', 7, 5, '1', '0000-00-00 00:00:00'),
(4086, '3404250091523', 'ALLVONSIUS DIMAS SANTOSO', 0, 'Laki - Lak', 'NGELODADI RT 02 RW 13', 0, 0, 0, 'SLEMAN', '1999-08-21', 23, 5, '1', '0000-00-00 00:00:00'),
(4087, '3404250091606', 'DARMANTO', 0, 'Laki - Lak', 'MANGGUNGSARI ', 0, 0, 0, 'SLEMAN', '1978-04-08', 6, 5, '1', '0000-00-00 00:00:00'),
(4088, '3404250091723', 'DIPYA WARDANI', 0, 'Laki - Lak', 'NGEMBESAN', 0, 0, 0, 'SLEMAN', '1990-03-06', 23, 5, '1', '0000-00-00 00:00:00'),
(4089, '3404250091812', 'HARJO', 0, 'Laki - Lak', 'GARONGAN ', 0, 0, 0, 'SLEMAN', '1955-07-11', 5, 5, '1', '0000-00-00 00:00:00'),
(4090, '3404250091923', 'HERI SUPRIYONO', 0, 'Laki - Lak', 'GABAHAN ', 0, 0, 0, '', '0000-00-00', 23, 5, '1', '0000-00-00 00:00:00'),
(4091, '3404250092023', 'HERU SISWO PUTRANTO', 0, 'Laki - Lak', 'TAWANGREJO ', 0, 0, 0, 'SLEMAN', '1961-09-19', 23, 5, '1', '0000-00-00 00:00:00'),
(4092, '3404250092123', 'MURTIJO', 0, 'Laki - Lak', 'CANDI RT 04 RW 13', 0, 0, 0, 'SLEMAN', '1973-02-01', 23, 5, '1', '0000-00-00 00:00:00'),
(4093, '3404250092207', 'KUSWANTO', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN ', '1969-12-25', 7, 5, '1', '0000-00-00 00:00:00'),
(4094, '3404250092323', 'MARDINI', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN ', '1975-09-22', 23, 5, '1', '0000-00-00 00:00:00'),
(4095, '3404250092410', 'MARGINO', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1961-12-31', 10, 5, '1', '0000-00-00 00:00:00'),
(4096, '3404250092523', 'MARYANTO', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1950-12-31', 23, 5, '1', '0000-00-00 00:00:00'),
(4097, '3404250092606', 'MAWAN TRI ATMOKO', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1986-02-17', 6, 5, '1', '0000-00-00 00:00:00'),
(4098, '3404250092723', 'MURJITO', 0, 'Laki - Lak', 'TAWANGREJO ', 0, 0, 0, 'SLEMAN', '1977-07-03', 23, 5, '1', '0000-00-00 00:00:00'),
(4099, '3404250092807', 'NUNUNG WAHYU WIBOBO', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN', '1982-10-27', 7, 5, '1', '0000-00-00 00:00:00'),
(4100, '3404250092906', 'PARYONO', 0, 'Laki - Lak', 'PANASAN ', 0, 0, 0, '', '0000-00-00', 6, 5, '1', '0000-00-00 00:00:00');
INSERT INTO `tblrelawan` (`idtblrelawan`, `no_induk`, `nama_relawan`, `nik`, `jenis_kelamin`, `alamat`, `kelurahan`, `kecamatan`, `desa`, `tempat_lahir`, `tgl_lahir`, `kecakapan`, `komunitas`, `create_user`, `create_time`) VALUES
(4101, '3404250093023', 'RAHMAD BADAWI', 0, 'Laki - Lak', 'NGANGGRUNG ', 0, 0, 0, 'SLEMAN', '1967-09-03', 23, 5, '1', '0000-00-00 00:00:00'),
(4102, '3404250093106', 'RASIDI', 0, 'Laki - Lak', 'KLINYO ', 0, 0, 0, '', '0000-00-00', 6, 5, '1', '0000-00-00 00:00:00'),
(4103, '3404250093210', 'B MARTINI', 0, 'Perempuan', 'NGELODADI', 0, 0, 0, 'SLEMAN', '1978-04-04', 10, 5, '1', '0000-00-00 00:00:00'),
(4104, '3404250093306', 'RIYANTO', 0, 'Laki - Lak', 'DUKUHSARI ', 0, 0, 0, '', '0000-00-00', 6, 5, '1', '0000-00-00 00:00:00'),
(4105, '3404250093406', 'SETYO PRAYITNO', 0, 'Laki - Lak', 'TLATAR ', 0, 0, 0, '', '0000-00-00', 6, 5, '1', '0000-00-00 00:00:00'),
(4106, '3404250093510', 'SUGENG PARYANTO', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN', '1952-12-31', 10, 5, '1', '0000-00-00 00:00:00'),
(4107, '3404250093610', 'YUSTINA PURNAMI', 0, 'Perempuan', 'NGELODADI', 0, 0, 0, 'SLEMAN', '1981-04-12', 10, 5, '1', '0000-00-00 00:00:00'),
(4108, '3404250093723', 'SULISTIONO', 0, 'Laki - Lak', 'MBANGUN ', 0, 0, 0, '', '0000-00-00', 23, 5, '1', '0000-00-00 00:00:00'),
(4109, '3404250093808', 'SUMARYANTO', 0, 'Laki - Lak', 'GONDOREJO', 0, 0, 0, 'SLEMAN', '1957-07-04', 8, 5, '1', '0000-00-00 00:00:00'),
(4110, '3404250093907', 'SUNARTO', 0, 'Laki - Lak', 'TLATAR ', 0, 0, 0, 'SLEMAN', '1966-06-20', 7, 5, '1', '0000-00-00 00:00:00'),
(4111, '3404250094006', 'SUPRIYADI', 0, 'Laki - Lak', 'TURI ', 0, 0, 0, '', '0000-00-00', 6, 5, '1', '0000-00-00 00:00:00'),
(4112, '3404250094110', 'SUPRIYANTO', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN', '1957-09-16', 10, 5, '1', '0000-00-00 00:00:00'),
(4113, '3404250094223', 'SURYO BUDI PRASETYO', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'GUNUNG KIDUL', '1960-04-29', 23, 5, '1', '0000-00-00 00:00:00'),
(4114, '3404250094308', 'SUWAJI', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1967-05-03', 8, 5, '1', '0000-00-00 00:00:00'),
(4115, '3404250094408', 'SUWANTO', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN', '1971-01-15', 8, 5, '1', '0000-00-00 00:00:00'),
(4116, '3404250094518', 'SUWARDI', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN', '1972-08-28', 18, 5, '1', '0000-00-00 00:00:00'),
(4117, '3404250094623', 'TRI HARTONO', 0, 'Laki - Lak', 'NGELODADI', 0, 0, 0, 'SLEMAN', '1975-03-12', 23, 5, '1', '0000-00-00 00:00:00'),
(4118, '3404250094706', 'TUKIDI', 0, 'Laki - Lak', 'NGEMBESAN ', 0, 0, 0, 'SLEMAN', '1931-01-08', 6, 5, '1', '0000-00-00 00:00:00'),
(4119, '3404250094808', 'WAKIJO', 0, 'Laki - Lak', 'NGELODADI ', 0, 0, 0, 'SLEMAN', '1966-05-12', 8, 5, '1', '0000-00-00 00:00:00'),
(4120, '3404250094923', 'WALJIYANTO', 0, 'Laki - Lak', 'BANARAN ', 0, 0, 0, '', '0000-00-00', 23, 5, '1', '0000-00-00 00:00:00'),
(4121, '3404250095010', 'YANU WASKITO', 0, 'Laki - Lak', 'GARONGAN ', 0, 0, 0, '', '0000-00-00', 10, 5, '1', '0000-00-00 00:00:00'),
(4122, '3404260095123', 'AGUNG YULIANTO', 0, 'Laki - Lak', 'CANDISARI 5/22', 0, 0, 0, 'SLEMAN', '1972-07-17', 23, 3, '1', '0000-00-00 00:00:00'),
(4123, '3404260095223', 'AMIR ZAMZURI', 0, 'Laki - Lak', 'KRAPYAK 03/54', 0, 0, 0, 'SLEMAN', '1969-07-08', 23, 3, '1', '0000-00-00 00:00:00'),
(4124, '3404260095323', 'BURHAM', 0, 'Laki - Lak', 'BATURAN 02/19', 0, 0, 0, 'SLEMAN', '1956-06-22', 23, 3, '1', '0000-00-00 00:00:00'),
(4125, '3404260095423', 'DANANG TRIWIYONO', 0, 'Laki - Lak', 'BEDREG SEMBEGO 09/41', 0, 0, 0, 'SLEMAN', '1976-10-20', 23, 3, '1', '0000-00-00 00:00:00'),
(4126, '3404260095523', 'DINA KURNIAWAN', 0, 'Laki - Lak', 'BATURAN 02/19', 0, 0, 0, 'SLEMAN', '1966-12-06', 23, 3, '1', '0000-00-00 00:00:00'),
(4127, '3404260095623', 'FX .OME', 0, 'Laki - Lak', 'KLEDOKAN BLOK -C 05/02', 0, 0, 0, 'SLEMAN', '1978-02-18', 23, 3, '1', '0000-00-00 00:00:00'),
(4128, '3404260095723', 'KARNO', 0, 'Laki - Lak', 'GRINJING NO 119 PAPRINGAN 015/005', 0, 0, 0, 'SLEMAN', '1975-01-30', 23, 3, '1', '0000-00-00 00:00:00'),
(4129, '3404260095823', 'KASIYAM ISW', 0, 'Laki - Lak', 'KAYEN GG CIKAL DEMPET 01/03', 0, 0, 0, 'SLEMAN', '1957-05-16', 23, 3, '1', '0000-00-00 00:00:00'),
(4130, '3404260095923', 'KAYANTO', 0, 'Laki - Lak', 'TEGAL BARU TEGAL SARI 06/18', 0, 0, 0, 'SLEMAN', '1954-08-16', 23, 3, '1', '0000-00-00 00:00:00'),
(4131, '3404260096023', 'KUWAT', 0, 'Laki - Lak', 'PAPRINGAN BEDOG 06/25', 0, 0, 0, 'SLEMAN', '1966-09-25', 23, 3, '1', '0000-00-00 00:00:00'),
(4132, '3404260096123', 'MARSONO', 0, 'Laki - Lak', 'JL.WAKHID HASYIM ,DK NGROPOH 05/25', 0, 0, 0, 'SLEMAN', '1977-02-20', 23, 3, '1', '0000-00-00 00:00:00'),
(4133, '3404260096223', 'MUHADI', 0, 'Laki - Lak', 'PERUM BOKO PERMAI ASRI', 0, 0, 0, 'SLEMAN', '1969-12-26', 23, 3, '1', '0000-00-00 00:00:00'),
(4134, '3404260096323', 'MUNDIHARTO', 0, 'Laki - Lak', 'GUYANGAN 09/03', 0, 0, 0, 'SLEMAN', '1965-11-10', 23, 3, '1', '0000-00-00 00:00:00'),
(4135, '3404260096423', 'NUGROHO APRIYANTO', 0, 'Laki - Lak', 'SEMPU 01/24', 0, 0, 0, 'SLEMAN', '1968-06-25', 23, 3, '1', '0000-00-00 00:00:00'),
(4136, '3404260096523', 'PRIRIYANTO', 0, 'Laki - Lak', 'MLANDANGAN ', 0, 0, 0, 'SLEMAN', '1985-03-14', 23, 3, '1', '0000-00-00 00:00:00'),
(4137, '3404260096623', 'R.SUPRAPTO', 0, 'Laki - Lak', 'NANGGULAN  11/18', 0, 0, 0, 'YOGYAKATA', '1956-11-11', 23, 3, '1', '0000-00-00 00:00:00'),
(4138, '3404260096723', 'RINGGO GINTING', 0, 'Laki - Lak', 'JL.KAKAP RAYA NO 12 21/05 ', 0, 0, 0, 'SLEMAN', '1969-03-25', 23, 3, '1', '0000-00-00 00:00:00'),
(4139, '3404260096823', 'ROHMAD', 0, 'Laki - Lak', 'SEMPU 03/06 ', 0, 0, 0, 'SLEMAN', '1972-11-10', 23, 3, '1', '0000-00-00 00:00:00'),
(4140, '3404260096923', 'SAIDI', 0, 'Laki - Lak', 'KEMBANG ARUM BADARAN 04/33', 0, 0, 0, 'SLEMAN', '1970-06-27', 23, 3, '1', '0000-00-00 00:00:00'),
(4141, '3404260097023', 'SUMADI', 0, 'Laki - Lak', 'PRIWULUNG 06/40', 0, 0, 0, 'SLEMAN', '1968-06-24', 23, 3, '1', '0000-00-00 00:00:00'),
(4142, '3404260097123', 'SUNARYO', 0, 'Laki - Lak', 'WIDORO NGROPOH 05/25', 0, 0, 0, 'SLEMAN', '1976-06-10', 23, 3, '1', '0000-00-00 00:00:00'),
(4143, '3404260097223', 'SUPARNO', 0, 'Laki - Lak', 'BANTENG 8/13', 0, 0, 0, 'SLEMAN', '1985-05-14', 23, 3, '1', '0000-00-00 00:00:00'),
(4144, '3404260097323', 'SURYA BUANA', 0, 'Laki - Lak', 'NYAMPLUNG 01/07', 0, 0, 0, 'SLEMAN', '1966-08-01', 23, 3, '1', '0000-00-00 00:00:00'),
(4145, '3404260097423', 'SUWARDI', 0, 'Laki - Lak', 'PONDOK  01/06', 0, 0, 0, 'SLEMAN', '1965-12-12', 23, 3, '1', '0000-00-00 00:00:00'),
(4146, '3404260097523', 'SUWARNO LAKSITO', 0, 'Laki - Lak', 'GRIYA KARANG MOJO ASRI KAV 2 02/01', 0, 0, 0, 'YOGYAKATA', '1965-03-27', 23, 3, '1', '0000-00-00 00:00:00'),
(4147, '3404260097623', 'TRI SISWANTO', 0, 'Laki - Lak', 'BENDAN  06/23', 0, 0, 0, 'SLEMAN', '1968-07-25', 23, 3, '1', '0000-00-00 00:00:00'),
(4148, '3404260097723', 'WASISTA', 0, 'Laki - Lak', ' BABADAN 02/09', 0, 0, 0, 'SLEMAN', '1968-01-07', 23, 3, '1', '0000-00-00 00:00:00'),
(4149, '3404260097823', 'WASPADA,AMD', 0, 'Laki - Lak', 'DRONO 4/33', 0, 0, 0, 'SLEMAN', '1966-10-13', 23, 3, '1', '0000-00-00 00:00:00'),
(4150, '3404260097923', 'YUDANTORO', 0, 'Laki - Lak', 'JRAGUNG ', 0, 0, 0, 'SLEMAN', '1975-03-29', 23, 3, '1', '0000-00-00 00:00:00'),
(4151, '3404270098015', 'AGUNG KARYADI', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '1987-04-24', 15, 33, '1', '0000-00-00 00:00:00'),
(4152, '3404270098124', 'AGUS SUBEKTI', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'BANJARBARU', '1976-01-28', 24, 33, '1', '0000-00-00 00:00:00'),
(4153, '3404270098208', 'BAMBANG AF', 0, 'Laki - Lak', 'PENEN', 0, 0, 0, 'SLEMAN', '1969-10-31', 8, 33, '1', '0000-00-00 00:00:00'),
(4154, '3404270098323', 'BUDIYONO', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '0000-00-00', 23, 33, '1', '0000-00-00 00:00:00'),
(4155, '3404270098413', 'FA OKLIH PRAWOKO HEPI', 0, 'Laki - Lak', 'NGEPAS KIDUL', 0, 0, 0, 'SLEMAN', '1981-10-03', 13, 33, '1', '0000-00-00 00:00:00'),
(4156, '3404270098520', 'GUNADI IBNU SAPARI', 0, 'Laki - Lak', 'KARANGLO', 0, 0, 0, 'SLEMAN', '1955-09-25', 20, 33, '1', '0000-00-00 00:00:00'),
(4157, '3404270098602', 'KHABIB MUSTOFA', 0, 'Laki - Lak', 'GONDANGAN RT 01, RW 44', 0, 0, 0, 'SLEMAN', '0000-00-00', 2, 33, '1', '0000-00-00 00:00:00'),
(4158, '3404270098702', 'MARDIANA NUR HASANAH', 0, 'Perempuan', 'JETISDONOLAYAN', 0, 0, 0, 'MAGELANG', '1995-03-06', 2, 33, '1', '0000-00-00 00:00:00'),
(4159, '3404270098808', 'MAWAN SUKOCO', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '0000-00-00', 8, 33, '1', '0000-00-00 00:00:00'),
(4160, '3404270098923', 'R. LUDY SUHARSIAKA', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'KUDUS', '0000-00-00', 23, 33, '1', '0000-00-00 00:00:00'),
(4161, '3404270099002', 'RETNO HANDAYANI WENING ( SEKR )', 0, 'Perempuan', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '1975-03-30', 2, 33, '1', '0000-00-00 00:00:00'),
(4162, '3404270099107', 'SUBEKTI', 0, 'Laki - Lak', 'BALONG', 0, 0, 0, 'SLEMAN', '0000-00-00', 7, 33, '1', '0000-00-00 00:00:00'),
(4163, '3404270099223', 'SUKLIHONO', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '1975-05-12', 23, 33, '1', '0000-00-00 00:00:00'),
(4164, '3404270099308', 'SUMARGI', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '1972-08-17', 8, 33, '1', '0000-00-00 00:00:00'),
(4165, '3404270099402', 'SURATMI', 0, 'Perempuan', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '1967-05-05', 2, 33, '1', '0000-00-00 00:00:00'),
(4166, '3404270099518', 'SURINTO', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '1976-03-21', 18, 33, '1', '0000-00-00 00:00:00'),
(4167, '3404270099608', 'Y. HERI YULIANTO ( BENDAHARA )', 0, 'Laki - Lak', 'JETISDONOLAYAN', 0, 0, 0, 'SLEMAN', '1974-07-13', 8, 33, '1', '0000-00-00 00:00:00'),
(4168, '3404270099711', 'Y. MARGINO', 0, 'Laki - Lak', 'NGEPAS KIDUL', 0, 0, 0, 'SLEMAN', '1950-04-17', 11, 33, '1', '0000-00-00 00:00:00'),
(4169, '3404280099806', 'AFNUR DIKI KUSUMA WARDANA', 0, 'Laki - Lak', 'MOYUDAN RT 08/15 ', 0, 0, 0, 'SLEMAN', '1995-06-24', 6, 38, '1', '0000-00-00 00:00:00'),
(4170, '3404280099906', 'AGUNG WIDODO', 0, 'Laki - Lak', 'SENDOWO RT 09/56 ', 0, 0, 0, 'YOGYAKARTA', '1977-02-19', 6, 38, '1', '0000-00-00 00:00:00'),
(4171, '3404280100013', 'AGUS MANIKA', 0, 'Laki - Lak', 'TERBAN GKL V/132 RT 04/2 ', 0, 0, 0, 'BANTUL', '1963-01-12', 13, 38, '1', '0000-00-00 00:00:00'),
(4172, '3404280100106', 'ANSELMUS SURAHMAN', 0, 'Laki - Lak', 'BOLAWEN RT 05/23 ', 0, 0, 0, 'SLEMAN', '1966-04-28', 6, 38, '1', '0000-00-00 00:00:00'),
(4173, '3404280100202', 'ARIEF SYARIFUDDIN RZ, S.AG', 0, 'Laki - Lak', 'PRINGGOKUSUMAN GT II/605 ', 0, 0, 0, 'YOGYAKARTA', '1972-03-23', 2, 38, '1', '0000-00-00 00:00:00'),
(4174, '3404280100306', 'AULIA RIZKA NOOR RACHMA', 0, 'Perempuan', 'BANTULAN RT 03/04', 0, 0, 0, 'SLEMAN', '1997-07-27', 6, 38, '1', '0000-00-00 00:00:00'),
(4175, '3404280100413', 'BAYU RAHMATULLAH', 0, 'Laki - Lak', 'MANCASAN RT 01/35', 0, 0, 0, 'SLEMAN', '1985-02-10', 13, 38, '1', '0000-00-00 00:00:00'),
(4176, '3404280100506', 'BUDI SULISTIO', 0, 'Laki - Lak', 'BLUNYAH GEDE 184 RT 10/034 ', 0, 0, 0, 'YOGYAKARTA', '1971-06-06', 6, 38, '1', '0000-00-00 00:00:00'),
(4177, '3404280100606', 'DINARJATI RAHMA WIDYASTRINI', 0, 'Perempuan', 'JALAN MARGO RUKUN IIB/1', 0, 0, 0, 'CILACAP', '1997-09-26', 6, 38, '1', '0000-00-00 00:00:00'),
(4178, '3404280100706', 'DIYANA SUSANTO', 0, 'Laki - Lak', 'NOGOSARI 3 RT 12/03 ', 0, 0, 0, 'GUNUNG KIDUL', '1983-02-28', 6, 38, '1', '0000-00-00 00:00:00'),
(4179, '3404280100813', 'DIYONO', 0, 'Laki - Lak', 'BLUNYAH GEDE RT 08/033 ', 0, 0, 0, 'GUNUNG KIDUL', '1978-06-04', 13, 38, '1', '0000-00-00 00:00:00'),
(4180, '3404280100906', 'DWI  MURSUNU SUWARNO', 0, 'Laki - Lak', 'SENTUL II RT 03/03 ', 0, 0, 0, 'SLEMAN', '1973-12-12', 6, 38, '1', '0000-00-00 00:00:00'),
(4181, '3404280101013', 'ELMADAM ADI NUGROHO', 0, 'Laki - Lak', 'POPONGAN BARU RT 17/30 ', 0, 0, 0, 'YOGYAKARTA', '1985-11-07', 13, 38, '1', '0000-00-00 00:00:00'),
(4182, '3404280101113', 'FATMA RUSTIANINGRUM', 0, 'Perempuan', 'WIROBAJAN RT 10/02 ', 0, 0, 0, 'YOGYAKARTA', '1997-10-06', 13, 38, '1', '0000-00-00 00:00:00'),
(4183, '3404280101206', 'G. EDI SUNARYO', 0, 'Laki - Lak', 'PATUK RT 09/15 ', 0, 0, 0, 'YOGYAKARTA', '1973-12-26', 6, 38, '1', '0000-00-00 00:00:00'),
(4184, '3404280101306', 'GUNUNG BRANTAS, SP', 0, 'Laki - Lak', 'NGEMPLAK KARANGJATI NO 131 RT 10/38 ', 0, 0, 0, 'SURABAYA', '1963-09-11', 6, 38, '1', '0000-00-00 00:00:00'),
(4185, '3404280101406', 'ILHAM, ST', 0, 'Laki - Lak', 'JLN URIP SUMOHARJO NO. 51 RT 039/010 KLITREN', 0, 0, 0, 'SUMBAR', '1971-04-16', 6, 38, '1', '0000-00-00 00:00:00'),
(4186, '3404280101513', 'KRISHNAWANTOMO', 0, 'Laki - Lak', 'JOMBOR LOR RT 04/19 ', 0, 0, 0, 'YOGYAKARTA', '1991-01-20', 13, 38, '1', '0000-00-00 00:00:00'),
(4187, '3404280101607', 'KUAT BUDI SANTOSA', 0, 'Laki - Lak', 'SONO RT 05/60 ', 0, 0, 0, 'SLEMAN', '1961-06-06', 7, 38, '1', '0000-00-00 00:00:00'),
(4188, '3404280101713', 'L.YULIATI HERI SUSANTI', 0, 'Perempuan', 'TAHUNAN UH 3/187 ', 0, 0, 0, 'YOGYAKARTA', '1972-07-09', 13, 38, '1', '0000-00-00 00:00:00'),
(4189, '3404280101806', 'MARTINUS YATIN SARJIYANTO', 0, 'Laki - Lak', 'MANCASAN RT 01/35 ', 0, 0, 0, 'BANTUL', '1979-11-07', 6, 38, '1', '0000-00-00 00:00:00'),
(4190, '3404280101906', 'MERDI RAHARJO', 0, 'Laki - Lak', 'NYAMPLUNG KIDUL RT 01/05 ', 0, 0, 0, 'SLEMAN', '1975-08-09', 6, 38, '1', '0000-00-00 00:00:00'),
(4191, '3404280102006', 'MOCH MALIK', 0, 'Laki - Lak', 'PATRAN TEGAL RT 02/21', 0, 0, 0, 'BLORA', '1972-05-13', 6, 38, '1', '0000-00-00 00:00:00'),
(4192, '3404280102113', 'MUH FATHIN ARDI A.', 0, 'Laki - Lak', 'PRINGGOLAYAN RT 11 ', 0, 0, 0, 'YOGYAKARTA', '1995-02-03', 13, 38, '1', '0000-00-00 00:00:00'),
(4193, '3404280102205', 'MUHADI', 0, 'Laki - Lak', 'ASRAMA BRIMOB BACIRO RT 037/010 ', 0, 0, 0, 'PATI', '1959-04-16', 5, 38, '1', '0000-00-00 00:00:00'),
(4194, '3404280102306', 'MUHAMAD SUPRIYANTO', 0, 'Laki - Lak', 'BLUNYAH GEDE 184 RT. 010/034', 0, 0, 0, 'YOGYAKARTA', '1961-10-30', 6, 38, '1', '0000-00-00 00:00:00'),
(4195, '3404280102410', 'MULYONO', 0, 'Laki - Lak', 'NGEMPLAK KARANGJATI RT 10/38 ', 0, 0, 0, 'SLEMAN', '1960-07-20', 10, 38, '1', '0000-00-00 00:00:00'),
(4196, '3404280102510', 'PARSONO', 0, 'Laki - Lak', 'POGUNG KIDUL RT.01/49', 0, 0, 0, 'SLEMAN', '1977-02-14', 10, 38, '1', '0000-00-00 00:00:00'),
(4197, '3404280102605', 'PAULINUS SUKADARMA', 0, 'Laki - Lak', 'BLUNYAH GEDE RT 09/33 ', 0, 0, 0, 'JAKARTA', '1984-10-10', 5, 38, '1', '0000-00-00 00:00:00'),
(4198, '3404280102713', 'PONIRIN', 0, 'Laki - Lak', 'POGUNG KIDUL RT 01/04 ', 0, 0, 0, 'SLEMAN', '1974-09-07', 13, 38, '1', '0000-00-00 00:00:00'),
(4199, '3404280102813', 'RIZQIA RIYANTSARI', 0, 'Perempuan', 'BLUNYAH GEDE 184 RT 10/034 ', 0, 0, 0, 'SLEMAN', '1995-07-06', 13, 38, '1', '0000-00-00 00:00:00'),
(4200, '3404280102906', 'SARBINI', 0, 'Laki - Lak', 'POGUNG KIDUL RT 06/49', 0, 0, 0, 'SLEMAN', '1972-09-11', 6, 38, '1', '0000-00-00 00:00:00'),
(4201, '3404280103006', 'SATRIYANTO WIBAWA', 0, 'Laki - Lak', 'BLUNYAH GEDE RT.06/032 NO. 100', 0, 0, 0, 'SLEMAN', '1995-05-30', 6, 38, '1', '0000-00-00 00:00:00'),
(4202, '3404280103107', 'SLAMET RAHAYU', 0, 'Laki - Lak', 'NOGOTIRTO RT 006 /12 ', 0, 0, 0, 'SLEMAN', '1974-07-17', 7, 38, '1', '0000-00-00 00:00:00'),
(4203, '3404280103206', 'SULISMAN', 0, 'Laki - Lak', 'SUROBAYAN  RT06 ', 0, 0, 0, 'BANTUL', '1980-05-24', 6, 38, '1', '0000-00-00 00:00:00'),
(4204, '3404280103306', 'SULISTYO BUDI SANTOSO', 0, 'Laki - Lak', 'BLUNYAH GEDE NO 245 RT 13/34 ', 0, 0, 0, 'SLEMAN', '1964-05-31', 6, 38, '1', '0000-00-00 00:00:00'),
(4205, '3404280103412', 'SURADI', 0, 'Laki - Lak', 'POGUNG KIDUL RT.01/49', 0, 0, 0, 'SLEMAN', '1959-09-03', 5, 38, '1', '0000-00-00 00:00:00'),
(4206, '3404280103502', 'TAUFIQ FIRMANSYAH HUDAYA', 0, 'Laki - Lak', 'NGEMPLAK KARANGJATI NO 131 RT 10/38 ', 0, 0, 0, 'BANJARBARU', '1956-06-07', 2, 38, '1', '0000-00-00 00:00:00'),
(4207, '3404280103613', 'THERESIA DAMARIS. S', 0, 'Perempuan', 'BLUNYAH GEDE RT 09/33 ', 0, 0, 0, 'YOGYAKARTA', '1993-08-09', 13, 38, '1', '0000-00-00 00:00:00'),
(4208, '3404280103707', 'WAKIJO', 0, 'Laki - Lak', 'PERENG DAWE RT 03/23 ', 0, 0, 0, 'SLEMAN', '1974-07-15', 7, 38, '1', '0000-00-00 00:00:00'),
(4209, '3404280103806', 'WAWAN OKMANTORO', 0, 'Laki - Lak', 'KRAGILAN RT 04/09 ', 0, 0, 0, 'BANTUL', '1979-10-11', 6, 38, '1', '0000-00-00 00:00:00'),
(4210, '3404280103905', 'YUDIYANTO DWI NUGROHO, A.MD', 0, 'Laki - Lak', 'GEDAREN 2 RT 01 RW 04', 0, 0, 0, 'GUNUNG KIDUL', '1977-01-27', 5, 38, '1', '0000-00-00 00:00:00'),
(4211, '3404280104010', 'YUHAKIM SUDI SETYANTO', 0, 'Laki - Lak', 'BLUNYAH GEDE RT 07/33 ', 0, 0, 0, 'YOGYAKARTA', '1961-01-13', 10, 38, '1', '0000-00-00 00:00:00'),
(4212, '3404290104108', 'AGUS SETIAWAN', 0, 'Laki - Lak', 'NGENTAK,RT 006 RW 02', 0, 0, 0, 'SLEMAN', '1985-02-01', 8, 36, '1', '0000-00-00 00:00:00'),
(4213, '3404290104213', 'AHSAN AGUNG PRIBADI', 0, 'Laki - Lak', 'NGETIRAN, RT 002 RW 005', 0, 0, 0, 'SLEMAN', '1985-08-31', 13, 36, '1', '0000-00-00 00:00:00'),
(4214, '3404290104306', 'ANDI TRIYANTO', 0, 'Laki - Lak', 'KEBONDALEM,RT 01,RW 06', 0, 0, 0, 'SLEMAN', '1983-04-07', 6, 36, '1', '0000-00-00 00:00:00'),
(4215, '3404290104406', 'ANDRI YANTO', 0, 'Laki - Lak', 'JL. MELATI 2 - 238', 0, 0, 0, 'YOGYAKARTA', '1977-03-28', 6, 36, '1', '0000-00-00 00:00:00'),
(4216, '3404290104508', 'BADI', 0, 'Laki - Lak', 'NAYAN RT 003 RW 025', 0, 0, 0, 'SLEMAN', '1978-03-16', 8, 36, '1', '0000-00-00 00:00:00'),
(4217, '3404290104606', 'BAKUH SETIAWAN', 0, 'Laki - Lak', 'CANDI 3, RT 004 RW 006,', 0, 0, 0, 'LAMPUNG TENGAH', '1988-11-18', 6, 36, '1', '0000-00-00 00:00:00'),
(4218, '3404290104707', 'BROTO DARMADI', 0, 'Laki - Lak', 'CANDI SARI,RT 07,RW 10', 0, 0, 0, 'SLEMAN', '1965-09-25', 7, 36, '1', '0000-00-00 00:00:00'),
(4219, '3404290104806', 'BUDIYONO', 0, 'Laki - Lak', 'MUNDU SAREN,RT 07 RW 02, NO.234', 0, 0, 0, 'SLEMAN', '1968-09-26', 6, 36, '1', '0000-00-00 00:00:00'),
(4220, '3404290104917', 'FX.JOKO TURWIYANTO', 0, 'Laki - Lak', 'NGABEAN KULON,SINDUHARJO,RT 04/RW 35', 0, 0, 0, 'PURWODADI', '1963-03-15', 17, 36, '1', '0000-00-00 00:00:00'),
(4221, '3404290105010', 'HARIYANTO', 0, 'Laki - Lak', 'GENTAN 08/14', 0, 0, 0, 'SLEMAN', '1984-01-04', 10, 36, '1', '0000-00-00 00:00:00'),
(4222, '3404290105110', 'HARYADI ', 0, 'Laki - Lak', 'SAMBIREJO, RT 003 RW 002', 0, 0, 0, 'SLEMAN', '1973-05-26', 10, 36, '1', '0000-00-00 00:00:00'),
(4223, '3404290105210', 'HARYATI', 0, 'Perempuan', 'NGLEMPONG SARI RT 06/RW26', 0, 0, 0, 'MAGELANG', '1975-01-06', 10, 36, '1', '0000-00-00 00:00:00'),
(4224, '3404290105308', 'HENRI SUHARTO', 0, 'Laki - Lak', 'TAWANG SARI, RT. 07, RW.03 ', 0, 0, 0, 'YOGYAKARTA', '1965-07-05', 8, 36, '1', '0000-00-00 00:00:00'),
(4225, '3404290105423', 'ISKAK WINARTO', 0, 'Laki - Lak', 'KADILOBO,RT 002 RW 033', 0, 0, 0, 'SLEMAN', '1970-08-17', 23, 36, '1', '0000-00-00 00:00:00'),
(4226, '3404290105506', 'JUNIKA HENDRA SETYAWAN', 0, 'Laki - Lak', 'PATUK, RT 003 RW 021', 0, 0, 0, 'SLEMAN', '1988-06-22', 6, 36, '1', '0000-00-00 00:00:00'),
(4227, '3404290105606', 'KARNO', 0, 'Laki - Lak', 'JL.GRINJING NO.119 PAPRINGAN,RT 015 RW 005', 0, 0, 0, 'MAGELANG', '1975-01-30', 6, 36, '1', '0000-00-00 00:00:00'),
(4228, '3404290105706', 'KATON SISWOHARTONO', 0, 'Laki - Lak', 'NAMBONGAN, RT 006 RW 032', 0, 0, 0, 'SLEMAN', '1957-04-10', 6, 36, '1', '0000-00-00 00:00:00'),
(4229, '3404290105817', 'LUCIA KARTINEM', 0, 'Perempuan', 'TURGO, RT 003 RW 002', 0, 0, 0, 'SLEMAN', '1964-08-03', 17, 36, '1', '0000-00-00 00:00:00'),
(4230, '3404290105906', 'LUKAS SARIYANTO', 0, 'Laki - Lak', 'JL.SENGKAN RAYA NO 13,SENGKAN,RT 005,RW 059', 0, 0, 0, 'SLEMAN', '1974-09-28', 6, 36, '1', '0000-00-00 00:00:00'),
(4231, '3404290106006', 'MASHURI', 0, 'Laki - Lak', 'KARANGSARI RT 003 RW 032', 0, 0, 0, 'SLEMAN', '1977-01-01', 6, 36, '1', '0000-00-00 00:00:00'),
(4232, '3404290106106', 'NDARU GRAHANA W', 0, 'Laki - Lak', 'KALIABU LOR RT 02/12', 0, 0, 0, 'SLEMAN', '1983-06-11', 6, 36, '1', '0000-00-00 00:00:00'),
(4233, '3404290106206', 'NGUDI HARTONO', 0, 'Laki - Lak', 'MLATI BENINGAN, RT. 006 RW. 002', 0, 0, 0, 'SLEMAN', '1977-11-29', 6, 36, '1', '0000-00-00 00:00:00'),
(4234, '3404290106306', 'NUR HANDOKO', 0, 'Laki - Lak', 'REJODANI 2 RT. 002 RW. 003', 0, 0, 0, 'SLEMAN', '1986-01-11', 6, 36, '1', '0000-00-00 00:00:00'),
(4235, '3404290106406', 'PAULUS MUJIWIYONO', 0, 'Laki - Lak', 'PONGGOL RT 001 RW 027', 0, 0, 0, 'SLEMAN', '1967-08-18', 6, 36, '1', '0000-00-00 00:00:00'),
(4236, '3404290106506', 'PRIHADI MURYANTO', 0, 'Laki - Lak', 'BANJARHARJO, RT 004 RW 015', 0, 0, 0, 'PURWODADI', '1967-09-20', 6, 36, '1', '0000-00-00 00:00:00'),
(4237, '3404290106606', 'R. FEBRIANTO SAPTO ADI , A.MD', 0, 'Laki - Lak', 'BARATAN, RT 003 RW 014, ', 0, 0, 0, 'YOGYAKARTA', '1977-02-24', 6, 36, '1', '0000-00-00 00:00:00'),
(4238, '3404290106706', 'RIYANTO', 0, 'Laki - Lak', 'DERO, RT 001 RW 014 ', 0, 0, 0, 'SLEMAN', '1958-11-17', 6, 36, '1', '0000-00-00 00:00:00'),
(4239, '3404290106806', 'ROMANIUS HERU SUCIATNO', 0, 'Laki - Lak', 'BENINGAN RT 006 RW 002', 0, 0, 0, 'SLEMAN', '1967-01-09', 6, 36, '1', '0000-00-00 00:00:00'),
(4240, '3404290106917', 'RR. UTSANI WASTI', 0, 'Perempuan', 'NANGGULAN, RT 012 RW 018', 0, 0, 0, 'SLEMAN', '1981-07-08', 17, 36, '1', '0000-00-00 00:00:00'),
(4241, '3404290107006', 'RUSDIN KUSTANTO', 0, 'Laki - Lak', 'CLUMPRIT, RT 003 RW 030', 0, 0, 0, 'SLEMAN', '1987-06-01', 6, 36, '1', '0000-00-00 00:00:00'),
(4242, '3404290107106', 'RUSGIYANTARA', 0, 'Laki - Lak', 'CLUMPRIT, RT 003 RW 030', 0, 0, 0, 'SLEMAN', '1975-05-06', 6, 36, '1', '0000-00-00 00:00:00'),
(4243, '3404290107223', 'SAGIMIN', 0, 'Laki - Lak', 'KADILANGU, RT 003 RW 032', 0, 0, 0, 'YOGYAKARTA', '1959-01-15', 23, 36, '1', '0000-00-00 00:00:00'),
(4244, '3404290107306', 'SAPTO PAMUNGKAS', 0, 'Laki - Lak', 'KEDON RT 001 RW 024', 0, 0, 0, 'SLEMAN', '1975-10-13', 6, 36, '1', '0000-00-00 00:00:00'),
(4245, '3404290107406', 'SEBASTIANUS ANJAR TRIYONO', 0, 'Laki - Lak', 'KEPITU RT 005 RW 018', 0, 0, 0, 'SLEMAN', '1979-01-19', 6, 36, '1', '0000-00-00 00:00:00'),
(4246, '3404290107507', 'SOGIMAN', 0, 'Laki - Lak', 'WONOKERSO RT 01/RW 22 ', 0, 0, 0, 'SLEMAN', '1973-12-12', 7, 36, '1', '0000-00-00 00:00:00'),
(4247, '3404290107618', 'SUDIRAN', 0, 'Laki - Lak', 'GLONDONG, RT 003 RW 028', 0, 0, 0, 'SLEMAN', '1964-09-01', 18, 36, '1', '0000-00-00 00:00:00'),
(4248, '3404290107710', 'SUHARDI', 0, 'Laki - Lak', 'MANCASAN KIDUL NO.172, RT 007 RW 016', 0, 0, 0, 'SLEMAN', '1958-08-03', 10, 36, '1', '0000-00-00 00:00:00'),
(4249, '3404290107823', 'SUMADIYONO', 0, 'Laki - Lak', 'JL. KABUPATEN SLEMAN KM.2', 0, 0, 0, 'SLEMAN', '1976-11-19', 23, 36, '1', '0000-00-00 00:00:00'),
(4250, '3404290107908', 'SUNARJA', 0, 'Laki - Lak', 'GORONGAN NGRINGIN,RT 007,RW 021', 0, 0, 0, 'KULON PROGO', '1961-01-31', 8, 36, '1', '0000-00-00 00:00:00'),
(4251, '3404290108006', 'SUPRIHATIN BROMO TENGGAR REJEKI ', 0, 'Laki - Lak', 'KARANGJATI, RT 017 RW 041', 0, 0, 0, 'SLEMAN', '1972-09-30', 6, 36, '1', '0000-00-00 00:00:00'),
(4252, '3404290108106', 'SUPRIYONO', 0, 'Laki - Lak', 'SARAGAN, RT 003 RW 004, ', 0, 0, 0, 'SLEMAN', '1975-04-06', 6, 36, '1', '0000-00-00 00:00:00'),
(4253, '3404290108206', 'TRIYASA', 0, 'Laki - Lak', 'TUREN RT 003 RW 001', 0, 0, 0, 'GROBOGAN', '1967-09-06', 6, 36, '1', '0000-00-00 00:00:00'),
(4254, '3404290108310', 'WAHYU TRIYANTO', 0, 'Laki - Lak', 'BERAN KIDUL RT 002 RW 027', 0, 0, 0, 'SLEMAN', '1981-11-09', 10, 36, '1', '0000-00-00 00:00:00'),
(4255, '3404290108423', 'WAHYUDHI HERIMAWAN', 0, 'Laki - Lak', 'JONGKE LOR RT002 RW 026', 0, 0, 0, 'SLEMAN', '1975-09-19', 23, 36, '1', '0000-00-00 00:00:00'),
(4256, '3404290108506', 'WAHYUDIONO', 0, 'Laki - Lak', 'NGLEMPONG SARI RT 06/RW26', 0, 0, 0, 'SLEMAN', '1973-01-08', 6, 36, '1', '0000-00-00 00:00:00'),
(4257, '3404290108610', 'WINARTO', 0, 'Laki - Lak', 'JL.GEMPOL RAYA 09,RT 002 RW 011', 0, 0, 0, 'SLEMAN', '1969-05-02', 10, 36, '1', '0000-00-00 00:00:00'),
(4258, '3404290108706', 'YULIUS SULISTYA HADI', 0, 'Laki - Lak', 'KEMBANGARUM,02/02,  XIII', 0, 0, 0, 'SLEMAN', '1965-12-09', 6, 36, '1', '0000-00-00 00:00:00'),
(4259, '3404300108806', 'AGUS BASUKI', 0, 'Laki - Lak', 'GAMPING KIDUL RT 03 RW 16', 0, 0, 0, 'SLEMAN', '1978-12-19', 6, 37, '1', '0000-00-00 00:00:00'),
(4260, '3404300108906', 'AGUS MULYONO', 0, 'Laki - Lak', 'PERUM. PURWOMARTANI. JL. BIMO 02 RT 02 RW 01 ', 0, 0, 0, 'SLEMAN', '1974-04-17', 6, 37, '1', '0000-00-00 00:00:00'),
(4261, '3404300109006', 'ANTONIUS TRIYANTO', 0, 'Laki - Lak', 'TURGO RT 004/ RW 002 ', 0, 0, 0, 'SLEMAN', '1966-08-07', 6, 37, '1', '0000-00-00 00:00:00'),
(4262, '3404300109106', 'ASDI SUSANTO', 0, 'Laki - Lak', 'BUMIREJO GADUNG RT 005/ RW 005 ', 0, 0, 0, 'SLEMAN', '1987-08-25', 6, 37, '1', '0000-00-00 00:00:00'),
(4263, '3404300109206', 'BAGAS GALANG SAKSESA', 0, 'Laki - Lak', 'GEMAWANG', 0, 0, 0, 'SLEMAN', '1997-12-23', 6, 37, '1', '0000-00-00 00:00:00'),
(4264, '3404300109306', 'BARYADI', 0, 'Laki - Lak', 'NGEMPLAK L  RT 5 / RW 13', 0, 0, 0, 'SLEMAN', '1982-03-19', 6, 37, '1', '0000-00-00 00:00:00'),
(4265, '3404300109406', 'CAROLINA SINTA DEA', 0, 'Perempuan', 'PANGGUNGSARI RT 10 RW 23', 0, 0, 0, 'SLEMAN', '1999-07-01', 6, 37, '1', '0000-00-00 00:00:00'),
(4266, '3404300109506', 'CLARA DEO KRISTIANDARI', 0, 'Perempuan', 'PANGGUNGSARI RT 10RW 23', 0, 0, 0, 'SLEMAN0', '1996-10-05', 6, 37, '1', '0000-00-00 00:00:00'),
(4267, '3404300109606', 'DALIMIN', 0, 'Laki - Lak', 'DUKUH', 0, 0, 0, 'SLEMAN', '1959-04-28', 6, 37, '1', '0000-00-00 00:00:00'),
(4268, '3404300109711', 'DANI KURNIAWAN', 0, 'Laki - Lak', 'DUKUH', 0, 0, 0, 'SLEMAN', '1986-01-06', 11, 37, '1', '0000-00-00 00:00:00'),
(4269, '3404300109806', 'DENI AGUS SETIAWAN', 0, 'Laki - Lak', 'KRADENAN RT 004/017 ', 0, 0, 0, 'SLEMAN', '1987-04-13', 6, 37, '1', '0000-00-00 00:00:00'),
(4270, '3404300109906', 'DONI YOGA', 0, 'Laki - Lak', 'PANGGUNGSARI RT 10 RW 23 ', 0, 0, 0, 'SLEMAN', '2002-12-04', 6, 37, '1', '0000-00-00 00:00:00'),
(4271, '3404300110006', 'DWI ASTUTI', 0, 'Perempuan', 'JL. CENDRAWASIH 23 DEMANGAN BARU RT 06/04 ', 0, 0, 0, 'YOGYA', '1984-08-13', 6, 37, '1', '0000-00-00 00:00:00'),
(4272, '3404300110106', 'DWI PRASETYA NUGROHO', 0, 'Laki - Lak', 'GEMAWANG', 0, 0, 0, 'SLEMAN', '1998-06-06', 6, 37, '1', '0000-00-00 00:00:00'),
(4273, '3404300110206', 'EDI KRISTIANTO WIDODO', 0, 'Laki - Lak', 'PANGGUNGSARI, RT 10 RW23 ', 0, 0, 0, 'YOGYA', '1969-05-02', 6, 37, '1', '0000-00-00 00:00:00'),
(4274, '3404300110306', 'EKO PRASETYO', 0, 'Laki - Lak', 'DUKUH', 0, 0, 0, 'SLEMAN', '1974-12-05', 6, 37, '1', '0000-00-00 00:00:00'),
(4275, '3404300110406', 'FENNY ANGGRAINI', 0, 'Perempuan', 'NGEMPLAK L RT 01 RW 13 ', 0, 0, 0, 'SLEMAN', '1987-12-30', 6, 37, '1', '0000-00-00 00:00:00'),
(4276, '3404300110506', 'HERI SUGIYARTO A.MD', 0, 'Laki - Lak', 'BANTULAN, JANTI NO. 18 RT 02 RW 01', 0, 0, 0, 'SLEMAN', '1975-02-19', 6, 37, '1', '0000-00-00 00:00:00'),
(4277, '3404300110606', 'HESTI RAMADHANI', 0, 'Perempuan', 'GEMAWANG', 0, 0, 0, 'SLEMAN', '1996-07-29', 6, 37, '1', '0000-00-00 00:00:00'),
(4278, '3404300110720', 'HIDANA VEMBIYARTI', 0, 'Perempuan', 'RINGROAD BARAT, GAMPING KIDUL NO. 121 RT 001/018', 0, 0, 0, 'SLEMAN', '1969-05-27', 17, 37, '1', '0000-00-00 00:00:00'),
(4279, '3404300110806', 'JOHAN SATRIA KRISTIAN', 0, 'Laki - Lak', 'BEDOG', 0, 0, 0, 'SLEMAN', '1998-08-23', 6, 37, '1', '0000-00-00 00:00:00'),
(4280, '3404300110906', 'M. SUTRIS DIYANTO', 0, 'Laki - Lak', 'GAMPING KIDUL RT 03 RW 16 ', 0, 0, 0, 'SLEMAN', '1988-01-30', 6, 37, '1', '0000-00-00 00:00:00'),
(4281, '3404300111006', 'MAHMUD NURI BAHRUDDIN', 0, 'Laki - Lak', 'JL. ALPOKAT NO 40 LELES RT 002 / RW 018', 0, 0, 0, 'SLEMAN', '1982-01-16', 6, 37, '1', '0000-00-00 00:00:00'),
(4282, '340430011108', 'AGUS PURWANTO', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1990-06-06', 8, 19, '1', '0000-00-00 00:00:00'),
(4283, '3404300111106', 'NADA ARI PAMUNGKAS', 0, 'Laki - Lak', 'NGAGLIK RT 001 RW 034', 0, 0, 0, 'SLEMAN', '1990-12-23', 6, 37, '1', '0000-00-00 00:00:00'),
(4284, '3404300111206', 'NGADIMIN', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1967-05-19', 6, 37, '1', '0000-00-00 00:00:00'),
(4285, '3404300111306', 'NGADIRIN', 0, 'Laki - Lak', 'GAMPING KIDUL RT 03 RW 16 ', 0, 0, 0, 'SLEMAN', '1965-02-09', 6, 37, '1', '0000-00-00 00:00:00'),
(4286, '3404300111406', 'NUR SIDIQ SUSILA', 0, 'Laki - Lak', 'POJOK RT 03 RW 07 ', 0, 0, 0, 'SLEMAN', '1976-11-15', 6, 37, '1', '0000-00-00 00:00:00'),
(4287, '3404300111506', 'RIYANTI', 0, 'Perempuan', 'NGEMPLAK L, RT 01 RW 13', 0, 0, 0, 'SLEMAN', '1984-04-07', 6, 37, '1', '0000-00-00 00:00:00'),
(4288, '3404300111606', 'SAMUEL REVIE WIJAYA', 0, 'Laki - Lak', 'PERUM. LEMPONGSARI C-24 RT 012/028', 0, 0, 0, 'SLEMAN', '1992-11-02', 6, 37, '1', '0000-00-00 00:00:00'),
(4289, '3404300111706', 'SARDIYONO', 0, 'Laki - Lak', 'KIMPULAN, KOPATAN RT 01 RW 01', 0, 0, 0, 'SLEMAN', '1978-07-11', 6, 37, '1', '0000-00-00 00:00:00'),
(4290, '3404300111806', 'SARYANTO', 0, 'Laki - Lak', 'NGABEAN KULON RT 003/034 ', 0, 0, 0, 'SLEMAN', '1982-09-23', 6, 37, '1', '0000-00-00 00:00:00'),
(4291, '3404300111906', 'SUPARJIMAN', 0, 'Laki - Lak', 'GAMPING KIDUL RT 03 RW 16 ', 0, 0, 0, 'SLEMAN', '1976-11-09', 6, 37, '1', '0000-00-00 00:00:00'),
(4292, '3404300112006', 'SURYANA DWI KRISTANTI', 0, 'Perempuan', 'NGABEAN KULON RT 003/RW 034 ', 0, 0, 0, 'SLEMAN', '1990-04-01', 6, 37, '1', '0000-00-00 00:00:00'),
(4293, '340430011207', 'AGUS SRIYONO', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'SLEMAN', '1972-08-17', 7, 19, '1', '0000-00-00 00:00:00'),
(4294, '3404300112106', 'SURYANTO', 0, 'Laki - Lak', 'PLALANGAN,  RT 002 RW 040', 0, 0, 0, 'SLEMAN', '1979-04-15', 6, 37, '1', '0000-00-00 00:00:00'),
(4295, '3404300112206', 'SUTARMONO', 0, 'Laki - Lak', 'NGEMPLAK L  RT01 / RW 13', 0, 0, 0, 'SLEMAN', '1975-11-29', 6, 37, '1', '0000-00-00 00:00:00'),
(4296, '3404300112306', 'SUWARJONO', 0, 'Laki - Lak', 'DUKUH', 0, 0, 0, 'SLEMAN', '1973-06-20', 6, 37, '1', '0000-00-00 00:00:00'),
(4297, '3404300112406', 'TEDI SULISTIYANTO', 0, 'Laki - Lak', 'BANTULAN, JANTI RT 01 RW 01 NO. 25 ', 0, 0, 0, 'SLEMAN', '1976-11-17', 6, 37, '1', '0000-00-00 00:00:00'),
(4298, '3404300112506', 'TRIYADI', 0, 'Laki - Lak', 'NGEMPLAK I RT 10/RW013', 0, 0, 0, 'SLEMAN', '1984-05-18', 6, 37, '1', '0000-00-00 00:00:00'),
(4299, '3404300112606', 'TRIYADI I', 0, 'Laki - Lak', 'JL. GEMPOL', 0, 0, 0, 'SLEMAN', '1976-10-19', 6, 37, '1', '0000-00-00 00:00:00'),
(4300, '3404300112723', 'WACHID BEN BELLA', 0, 'Laki - Lak', 'RINGROAD BARAT, GAMPING KIDUL NO. 121 RT 001/018', 0, 0, 0, 'YOGYA', '1968-08-25', 23, 37, '1', '0000-00-00 00:00:00'),
(4301, '3404300112806', 'WAHYU KRISTANTO', 0, 'Laki - Lak', 'MODINAN RT 11 RW 22', 0, 0, 0, 'SLEMAN', '1972-10-13', 6, 37, '1', '0000-00-00 00:00:00'),
(4302, '3404300112906', 'WAHYUDI SAKSONO', 0, 'Laki - Lak', 'KARANG RT 03 RW 01 ', 0, 0, 0, 'SLEMAN', '1977-08-09', 6, 37, '1', '0000-00-00 00:00:00'),
(4303, '3404300113024', 'YAHYA KHANAFI', 0, 'Laki - Lak', 'GAMPING KIDUL 161 RT 001/018', 0, 0, 0, 'SLEMAN', '1971-12-13', 24, 37, '1', '0000-00-00 00:00:00'),
(4304, '340430011308', 'ALIF KURNIAWAN', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'SLEMAN', '1987-04-06', 8, 19, '1', '0000-00-00 00:00:00'),
(4305, '3404300113112', 'YOHANA DARI SETYANINGSIH S.PD', 0, 'Perempuan', 'PANGGUNGSARI RT 10 RW 23 ', 0, 0, 0, 'SLEMAN', '1968-02-09', 5, 37, '1', '0000-00-00 00:00:00'),
(4306, '340430011408', 'ANTON ICHTIARSO SS', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1977-07-22', 8, 19, '1', '0000-00-00 00:00:00'),
(4307, '340430011508', 'ARI KUSNANTO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1978-04-19', 8, 19, '1', '0000-00-00 00:00:00'),
(4308, '340430011608', 'ARIF RAHMAN FAUZI', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1991-12-12', 8, 19, '1', '0000-00-00 00:00:00'),
(4309, '340430011708', 'ARIF RAHMAN WIJANARKO', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'SLEMAN', '1993-03-20', 8, 19, '1', '0000-00-00 00:00:00'),
(4310, '340430011808', 'ATMONO PURWOKO', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1986-01-03', 8, 19, '1', '0000-00-00 00:00:00'),
(4311, '340430011908', 'BAMBANG SUTRISNO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1962-05-29', 8, 19, '1', '0000-00-00 00:00:00'),
(4312, '340430012007', 'BURHANUDIN', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'KLATEN', '1981-03-14', 7, 19, '1', '0000-00-00 00:00:00'),
(4313, '340430012108', 'DIEDIET ARIYANTO', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1973-02-05', 8, 19, '1', '0000-00-00 00:00:00'),
(4314, '340430012208', 'EDY SANTOSO', 0, 'Laki - Lak', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1977-03-02', 8, 19, '1', '0000-00-00 00:00:00'),
(4315, '340430012308', 'EKO SISWANTO', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1982-05-09', 8, 19, '1', '0000-00-00 00:00:00'),
(4316, '340430012408', 'F. TRI HARYADI', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'SLEMAN', '1971-11-19', 8, 19, '1', '0000-00-00 00:00:00'),
(4317, '340430012508', 'FANDI ROCHMAD D', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1998-12-17', 8, 19, '1', '0000-00-00 00:00:00'),
(4318, '340430012608', 'FEBRIANI SUCI RHOMADONI', 0, 'Perempuan', 'BANJARJO', 0, 0, 0, 'SLEMAN', '1996-02-15', 8, 19, '1', '0000-00-00 00:00:00'),
(4319, '340430012708', 'G RUDINI PA', 0, 'Laki - Lak', 'CANDISARI', 0, 0, 0, 'SLEMAN', '1964-06-27', 8, 19, '1', '0000-00-00 00:00:00'),
(4320, '340430012808', 'HADI PURWANTO', 0, 'Laki - Lak', 'BANJARHARJO', 0, 0, 0, 'SLEMAN', '1966-02-09', 8, 19, '1', '0000-00-00 00:00:00'),
(4321, '340430012908', 'HARDI', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1975-05-06', 8, 19, '1', '0000-00-00 00:00:00'),
(4322, '340430013008', 'HARTONO', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1964-12-17', 8, 19, '1', '0000-00-00 00:00:00'),
(4323, '340430013108', 'HERI SURYANTO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1969-07-25', 8, 19, '1', '0000-00-00 00:00:00'),
(4324, '340430013207', 'JASWADI', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'LAMPUNG', '1960-05-17', 7, 19, '1', '0000-00-00 00:00:00'),
(4325, '340430013308', 'JUMADI', 0, 'Laki - Lak', 'BANJARJO', 0, 0, 0, 'SLEMAN', '1966-06-14', 8, 19, '1', '0000-00-00 00:00:00'),
(4326, '340430013408', 'JUMERI', 0, 'Laki - Lak', 'BANJARHARJO', 0, 0, 0, '', '0000-00-00', 8, 19, '1', '0000-00-00 00:00:00'),
(4327, '340430013508', 'KELIK WASANA', 0, 'Laki - Lak', 'KEBUR  KIDUL', 0, 0, 0, 'KULON PROGO', '1980-11-14', 8, 19, '1', '0000-00-00 00:00:00'),
(4328, '340430013608', 'MARDI SUWARNO', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1960-05-02', 8, 19, '1', '0000-00-00 00:00:00'),
(4329, '340430013708', 'MUH TADIM', 0, 'Laki - Lak', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1991-05-24', 8, 19, '1', '0000-00-00 00:00:00'),
(4330, '340430013808', 'PARNIATUN', 0, 'Perempuan', 'SEWON', 0, 0, 0, 'SLEMAN', '1963-07-23', 8, 19, '1', '0000-00-00 00:00:00'),
(4331, '340430013907', 'PETRUS SETYO HW', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1982-06-06', 7, 19, '1', '0000-00-00 00:00:00'),
(4332, '340430014008', 'RAHMAT SAUBARI', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1967-11-21', 8, 19, '1', '0000-00-00 00:00:00'),
(4333, '340430014108', 'SARJONO', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1975-05-27', 8, 19, '1', '0000-00-00 00:00:00'),
(4334, '340430014208', 'SRI MULYANI', 0, 'Laki - Lak', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1973-11-20', 8, 19, '1', '0000-00-00 00:00:00'),
(4335, '340430014308', 'SUBAGYO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1948-10-10', 8, 19, '1', '0000-00-00 00:00:00'),
(4336, '340430014408', 'SUGENG BUDI HANTORO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1982-06-15', 8, 19, '1', '0000-00-00 00:00:00'),
(4337, '340430014508', 'SUGENG RIYADI', 0, 'Laki - Lak', 'LOSARI ', 0, 0, 0, 'SLEMAN', '1979-08-24', 8, 19, '1', '0000-00-00 00:00:00'),
(4338, '340430014608', 'SUGIYANTO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1970-10-18', 8, 19, '1', '0000-00-00 00:00:00'),
(4339, '340430014708', 'SUPRIYANTO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1961-01-10', 8, 19, '1', '0000-00-00 00:00:00'),
(4340, '340430014808', 'SUPRIYATI', 0, 'Perempuan', 'CANGKRINGAN', 0, 0, 0, 'SLEMAN', '1968-04-04', 8, 19, '1', '0000-00-00 00:00:00'),
(4341, '340430014908', 'SURATMI', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1958-03-10', 8, 19, '1', '0000-00-00 00:00:00'),
(4342, '340430015007', 'SURYADI', 0, 'Laki - Lak', 'KEMBANG', 0, 0, 0, 'SLEMAN', '1984-09-28', 7, 19, '1', '0000-00-00 00:00:00'),
(4343, '340430015108', 'TRI MARYANTA', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'SLEMAN', '1977-09-30', 8, 19, '1', '0000-00-00 00:00:00'),
(4344, '340430015208', 'TRI YULIYANTO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1983-07-29', 8, 19, '1', '0000-00-00 00:00:00'),
(4345, '340430015307', 'WISNU PAMUNGKAS', 0, 'Laki - Lak', 'RANDUSARI', 0, 0, 0, 'BANDAR LAMPUNG', '1993-07-14', 7, 19, '1', '0000-00-00 00:00:00'),
(4346, '340430015408', 'YULI PURWANTO', 0, 'Laki - Lak', 'BRONGKOL', 0, 0, 0, 'SLEMAN', '1984-07-25', 8, 19, '1', '0000-00-00 00:00:00'),
(4347, '340430015508', 'YULIYANTI', 0, 'Perempuan', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1968-09-29', 8, 19, '1', '0000-00-00 00:00:00'),
(4348, '3404310113217', 'ADRIS RAHJI HARTANTO', 0, 'Laki - Lak', 'PAKEM', 0, 0, 0, 'SLEMAN', '1991-06-02', 17, 8, '1', '0000-00-00 00:00:00'),
(4349, '3404310113306', 'ARI WIBOWO', 0, 'Laki - Lak', 'KOWANG', 0, 0, 0, 'SLEMAN', '1979-09-20', 6, 8, '1', '0000-00-00 00:00:00'),
(4350, '3404310113406', 'BAYU WASKITO', 0, 'Laki - Lak', 'CARIKAN', 0, 0, 0, 'SLEMAN', '1979-11-18', 6, 8, '1', '0000-00-00 00:00:00'),
(4351, '3404310113506', 'BERTHA PURNAMA', 0, 'Laki - Lak', 'JONGKANGAN', 0, 0, 0, 'SLEMAN', '1989-10-03', 6, 8, '1', '0000-00-00 00:00:00'),
(4352, '3404310113611', 'DUDUNG ABDUL HAKIM', 0, 'Laki - Lak', 'CAGERAN', 0, 0, 0, 'MAJALENGKA', '1966-02-07', 11, 8, '1', '0000-00-00 00:00:00'),
(4353, '3404310113713', 'EKO SUGIYANTO', 0, 'Laki - Lak', 'PAKEM', 0, 0, 0, 'SLEMAN', '1971-12-10', 13, 8, '1', '0000-00-00 00:00:00'),
(4354, '3404310113806', 'GUNANDAR', 0, 'Laki - Lak', 'PAKEM', 0, 0, 0, 'SLEMAN', '1971-02-22', 6, 8, '1', '0000-00-00 00:00:00'),
(4355, '3404310113908', 'HERI SETIAWAN', 0, 'Laki - Lak', 'JONGKANGAN', 0, 0, 0, 'SLEMAN', '1990-06-18', 8, 8, '1', '0000-00-00 00:00:00'),
(4356, '3404310114007', 'MAHESHA BAGUS SAPUTRO', 0, 'Laki - Lak', 'DALEM', 0, 0, 0, 'SLEMAN', '1993-05-02', 7, 8, '1', '0000-00-00 00:00:00'),
(4357, '3404310114102', 'MARDANI DWIANTORO', 0, 'Laki - Lak', 'JONGKANGAN', 0, 0, 0, 'SLEMAN', '1985-03-21', 2, 8, '1', '0000-00-00 00:00:00'),
(4358, '3404310114223', 'MARDIYONO', 0, 'Laki - Lak', 'PAKEM', 0, 0, 0, 'SLEMAN', '1959-05-15', 23, 8, '1', '0000-00-00 00:00:00'),
(4359, '3404310114310', 'MULYANA', 0, 'Laki - Lak', 'CAGERAN', 0, 0, 0, 'SLEMAN', '1972-04-24', 10, 8, '1', '0000-00-00 00:00:00'),
(4360, '3404310114406', 'MURDIYANTO', 0, 'Laki - Lak', 'TEGALREJO 006/002', 0, 0, 0, 'SLEMAN', '1959-06-03', 6, 8, '1', '0000-00-00 00:00:00'),
(4361, '3404310114523', 'MUSLIH', 0, 'Laki - Lak', 'DALEM', 0, 0, 0, 'SLEMAN', '1967-07-14', 23, 8, '1', '0000-00-00 00:00:00'),
(4362, '3404310114606', 'PANJI SAMADI UMBARA', 0, 'Laki - Lak', 'RANDUGUNTING', 0, 0, 0, 'SLEMAN', '1994-04-28', 6, 8, '1', '0000-00-00 00:00:00'),
(4363, '3404310114717', 'RENDY BAYU SAPUTRA', 0, 'Laki - Lak', 'CATURHARJO', 0, 0, 0, 'SLEMAN', '1990-01-09', 17, 8, '1', '0000-00-00 00:00:00'),
(4364, '3404310114806', 'RUSDY KOMARUDIN SOLIHIN', 0, 'Laki - Lak', 'RANDUGUNTING', 0, 0, 0, 'SLEMAN', '1992-03-12', 6, 8, '1', '0000-00-00 00:00:00'),
(4365, '3404310114906', 'SAMINA', 0, 'Laki - Lak', 'BENDOSARI', 0, 0, 0, 'SLEMAN', '1957-09-18', 6, 8, '1', '0000-00-00 00:00:00'),
(4366, '3404310115008', 'SISWANTA', 0, 'Laki - Lak', 'CAGERAN', 0, 0, 0, 'KLATEN', '1967-12-20', 8, 8, '1', '0000-00-00 00:00:00'),
(4367, '3404310115106', 'SUHENDRA JATMIKA AJI', 0, 'Laki - Lak', 'CATURHARJO', 0, 0, 0, 'SLEMAN', '1992-04-07', 6, 8, '1', '0000-00-00 00:00:00'),
(4368, '3404310115208', 'SUKADI ', 0, 'Laki - Lak', 'CATURHARJO', 0, 0, 0, 'SLEMAN', '1976-04-01', 8, 8, '1', '0000-00-00 00:00:00'),
(4369, '3404310115306', 'SULASNO', 0, 'Laki - Lak', 'SEPETMADU', 0, 0, 0, 'SLEMAN', '1975-11-23', 6, 8, '1', '0000-00-00 00:00:00'),
(4370, '3404310115410', 'SUPARMAN', 0, 'Laki - Lak', 'TEGALREJO', 0, 0, 0, 'SLEMAN', '1976-02-02', 10, 8, '1', '0000-00-00 00:00:00'),
(4371, '3404310115518', 'SURAJI', 0, 'Laki - Lak', 'TAMANAN', 0, 0, 0, 'SLEMAN', '1968-11-01', 18, 8, '1', '0000-00-00 00:00:00'),
(4372, '3404310115618', 'WAGIRAN', 0, 'Laki - Lak', 'KEBON', 0, 0, 0, 'SLEMAN', '1970-04-01', 18, 8, '1', '0000-00-00 00:00:00'),
(4373, '3404310115702', 'WAWAN PURWANTO', 0, 'Laki - Lak', 'DALEM', 0, 0, 0, 'SLEMAN', '1975-10-06', 2, 8, '1', '0000-00-00 00:00:00'),
(4374, '3404310115802', 'YUYUN MUNANDAR', 0, 'Laki - Lak', 'DALEM', 0, 0, 0, 'SLEMAN', '1987-05-31', 2, 8, '1', '0000-00-00 00:00:00'),
(4375, '3404320115910', 'ADITYA PRATAMA', 0, 'Laki - Lak', 'SAMBEREJO', 0, 0, 0, 'SLEMAN', '1995-09-23', 10, 32, '1', '0000-00-00 00:00:00'),
(4376, '3404320116010', 'AGUS PONIDI', 0, 'Laki - Lak', 'KALIWARU', 0, 0, 0, 'GUNUNG KIDUL', '1979-06-14', 10, 32, '1', '0000-00-00 00:00:00'),
(4377, '3404320116106', 'AGUS WIYANTORO', 0, 'Laki - Lak', 'SUTAN', 0, 0, 0, 'SLEMAN', '1972-11-01', 6, 32, '1', '0000-00-00 00:00:00'),
(4378, '3404320116210', 'ANDREAS JAKA SIHONO', 0, 'Laki - Lak', 'CUPUWATU I', 0, 0, 0, 'SLEMAN', '1963-12-29', 10, 32, '1', '0000-00-00 00:00:00'),
(4379, '3404320116305', 'APRIYADI SRI MARTANA', 0, 'Laki - Lak', 'TIMUR', 0, 0, 0, 'SLEMAN', '1989-04-21', 5, 32, '1', '0000-00-00 00:00:00'),
(4380, '3404320116410', 'BAMBANG SUMITRO', 0, 'Laki - Lak', 'TUNJUNGAN', 0, 0, 0, 'SLEMAN', '1968-02-13', 10, 32, '1', '0000-00-00 00:00:00'),
(4381, '3404320116510', 'BARYONO', 0, 'Laki - Lak', 'JETAK', 0, 0, 0, 'SLEMAN', '1983-10-16', 10, 32, '1', '0000-00-00 00:00:00'),
(4382, '3404320116610', 'BINARTO', 0, 'Laki - Lak', 'KARANG MOJO', 0, 0, 0, 'SLEMAN', '1966-10-13', 10, 32, '1', '0000-00-00 00:00:00'),
(4383, '3404320116710', 'DAMAR WIJAYANTO', 0, 'Laki - Lak', 'SAMBIROTO', 0, 0, 0, '', '1989-01-28', 10, 32, '1', '0000-00-00 00:00:00'),
(4384, '3404320116810', 'DEVI GUSTANTO', 0, 'Laki - Lak', 'KALIWARU', 0, 0, 0, 'SLEMAN', '1992-08-04', 10, 32, '1', '0000-00-00 00:00:00'),
(4385, '3404320116910', 'DIDIK HERMAWAN', 0, 'Laki - Lak', 'KALIWARU', 0, 0, 0, 'SLEMAN', '1987-08-22', 10, 32, '1', '0000-00-00 00:00:00'),
(4386, '3404320117006', 'EKO PRAMONCO', 0, 'Laki - Lak', 'JETAK', 0, 0, 0, 'SLEMAN', '1983-05-04', 6, 32, '1', '0000-00-00 00:00:00'),
(4387, '3404320117110', 'EKO SURANTO', 0, 'Laki - Lak', 'DAENGAN', 0, 0, 0, 'SLEMAN', '1985-09-30', 10, 32, '1', '0000-00-00 00:00:00'),
(4388, '3404320117210', 'FAUZAN SYUKRI WIBAWA', 0, 'Laki - Lak', 'PULEREJO', 0, 0, 0, 'SLEMAN', '1992-07-09', 10, 32, '1', '0000-00-00 00:00:00'),
(4389, '3404320117310', 'GIYANTO', 0, 'Laki - Lak', 'SAMBEREJO', 0, 0, 0, 'SLEMAN', '1965-12-27', 10, 32, '1', '0000-00-00 00:00:00'),
(4390, '3404320117410', 'GURUH SAPUTRA', 0, 'Laki - Lak', 'PONDOK', 0, 0, 0, 'BOYOLALI', '1983-06-13', 10, 32, '1', '0000-00-00 00:00:00'),
(4391, '3404320117510', 'HABIB AHMAD AL HUSNI', 0, 'Laki - Lak', 'JETAK', 0, 0, 0, 'SLEMAN', '1988-08-21', 10, 32, '1', '0000-00-00 00:00:00'),
(4392, '3404320117610', 'HARI SUGIYATNO', 0, 'Laki - Lak', 'BROMONILAN', 0, 0, 0, 'SLEMAN', '1975-08-28', 10, 32, '1', '0000-00-00 00:00:00'),
(4393, '3404320117710', 'HARTOYO', 0, 'Laki - Lak', 'KALIWARU', 0, 0, 0, 'SLEMAN', '1979-09-09', 10, 32, '1', '0000-00-00 00:00:00'),
(4394, '3404320117810', 'HERU ARTANTO', 0, 'Laki - Lak', 'TAMANAN', 0, 0, 0, 'KLATEN', '1992-09-16', 10, 32, '1', '0000-00-00 00:00:00'),
(4395, '3404320117910', 'HERU PURWANTO', 0, 'Laki - Lak', 'SAMBEREMBE', 0, 0, 0, 'SLEMAN', '1990-04-19', 10, 32, '1', '0000-00-00 00:00:00'),
(4396, '3404320118010', 'HERU SUBIYANTO', 0, 'Laki - Lak', 'SAMBEREJO', 0, 0, 0, 'SLEMAN', '1980-09-13', 10, 32, '1', '0000-00-00 00:00:00'),
(4397, '3404320118110', 'IBNU WIDAYAT', 0, 'Laki - Lak', 'TIMUR', 0, 0, 0, 'BOYOLALI', '1983-06-13', 10, 32, '1', '0000-00-00 00:00:00'),
(4398, '3404320118210', 'INDRA WIJAYA SUDARSONO', 0, 'Laki - Lak', 'TUNJUNGAN', 0, 0, 0, 'JAKARTA', '1982-12-20', 10, 32, '1', '0000-00-00 00:00:00'),
(4399, '3404320118310', 'ISNAINY USMAN', 0, 'Laki - Lak', 'BAYEN', 0, 0, 0, 'SLEMAN', '1964-06-15', 20, 32, '1', '0000-00-00 00:00:00'),
(4400, '3404320118410', 'JUNAIDI', 0, 'Laki - Lak', 'SENDEN II', 0, 0, 0, 'SLEMAN', '1965-04-04', 10, 32, '1', '0000-00-00 00:00:00'),
(4401, '3404320118510', 'KUS INDRATNO', 0, 'Laki - Lak', 'TIMUR', 0, 0, 0, 'SLEMAN', '1979-03-16', 10, 32, '1', '0000-00-00 00:00:00'),
(4402, '3404320118610', 'LUKI AGUSTINA KURNIAWATI', 0, 'Perempuan', 'TUNJUNAGAN', 0, 0, 0, 'SLEMAN', '1992-08-30', 10, 32, '1', '0000-00-00 00:00:00'),
(4403, '3404320118710', 'M.WIDODO', 0, 'Laki - Lak', 'SENDEN I', 0, 0, 0, 'KLATEN', '1979-07-09', 10, 32, '1', '0000-00-00 00:00:00'),
(4404, '3404320118810', 'MARDIYO', 0, 'Laki - Lak', 'MARGODADI', 0, 0, 0, 'SLEMAN', '1968-12-10', 10, 32, '1', '0000-00-00 00:00:00'),
(4405, '3404320118910', 'MARYADI', 0, 'Laki - Lak', 'JETAK', 0, 0, 0, 'SLEMAN', '1969-02-15', 10, 32, '1', '0000-00-00 00:00:00'),
(4406, '3404320119010', 'MARYUANA ADE IRAWAN', 0, 'Laki - Lak', 'TUNJUNGAN', 0, 0, 0, 'SLEMAN', '1985-05-25', 10, 32, '1', '0000-00-00 00:00:00'),
(4407, '3404320119106', 'MUHAMMAD NURHUDA', 0, 'Laki - Lak', 'RANDUSARI', 0, 0, 0, 'SLEMAN', '1981-08-06', 6, 32, '1', '0000-00-00 00:00:00'),
(4408, '3404320119210', 'MUJIMAN', 0, 'Laki - Lak', 'GARAN', 0, 0, 0, 'SLEMAN', '0000-00-00', 10, 32, '1', '0000-00-00 00:00:00'),
(4409, '3404320119310', 'NAWIR NASOKA', 0, 'Laki - Lak', 'KIYUDAN', 0, 0, 0, 'SLEMAN', '1980-04-01', 10, 32, '1', '0000-00-00 00:00:00'),
(4410, '3404320119410', 'PARDI', 0, 'Laki - Lak', 'PETE', 0, 0, 0, 'SLEMAN', '1984-11-13', 10, 32, '1', '0000-00-00 00:00:00'),
(4411, '3404320119510', 'PRADA SAPTATA', 0, 'Laki - Lak', 'PAKEM', 0, 0, 0, 'SLEMAN', '1979-07-16', 10, 32, '1', '0000-00-00 00:00:00'),
(4412, '3404320119610', 'RETNO TRI ASTUTI', 0, 'Laki - Lak', 'SENDEN I', 0, 0, 0, 'SLEMAN', '1973-08-30', 10, 32, '1', '0000-00-00 00:00:00'),
(4413, '3404320119710', 'ROCHMAD JULIANTO', 0, 'Laki - Lak', 'SAWAHAN LOR', 0, 0, 0, 'BLITAR', '1970-07-11', 10, 32, '1', '0000-00-00 00:00:00'),
(4414, '3404320119810', 'SADEWO', 0, 'Laki - Lak', 'TUNJUNGAN', 0, 0, 0, 'SLEMAN', '1988-10-21', 10, 32, '1', '0000-00-00 00:00:00'),
(4415, '3404320119910', 'SALIMAN', 0, 'Laki - Lak', 'RANDUSARI', 0, 0, 0, 'SLEMAN', '1968-02-05', 10, 32, '1', '0000-00-00 00:00:00'),
(4416, '3404320120006', 'SAMIJO', 0, 'Laki - Lak', 'SAMBEREJO', 0, 0, 0, 'SLEMAN', '1969-07-06', 6, 32, '1', '0000-00-00 00:00:00'),
(4417, '3404320120110', 'SARIYANTO', 0, 'Laki - Lak', 'SEJARAN', 0, 0, 0, 'SLEMAN', '1974-04-28', 10, 32, '1', '0000-00-00 00:00:00'),
(4418, '3404320120206', 'SARJONO', 0, 'Laki - Lak', 'TIMUR', 0, 0, 0, 'SLEMAN', '1964-10-13', 6, 32, '1', '0000-00-00 00:00:00'),
(4419, '3404320120310', 'SARONO', 0, 'Laki - Lak', 'PONDOK', 0, 0, 0, 'SLEMAN', '1958-10-13', 10, 32, '1', '0000-00-00 00:00:00'),
(4420, '3404320120423', 'SARYANTO', 0, 'Laki - Lak', 'NGERDI KAYEN', 0, 0, 0, 'BALIKPAPAN', '1981-10-03', 23, 32, '1', '0000-00-00 00:00:00'),
(4421, '3404320120510', 'SITI FATMAWATI', 0, 'Perempuan', 'KERTIREJO', 0, 0, 0, 'TEMBILAHAN', '1977-10-10', 10, 32, '1', '0000-00-00 00:00:00'),
(4422, '3404320120610', 'SLAMET MULYADI', 0, 'Laki - Lak', 'SENDEN II', 0, 0, 0, 'SLEMAN', '1977-09-03', 10, 32, '1', '0000-00-00 00:00:00'),
(4423, '3404320120706', 'SLAMET TRIYADI', 0, 'Laki - Lak', 'PETE', 0, 0, 0, 'SLEMAN', '1988-06-16', 6, 32, '1', '0000-00-00 00:00:00'),
(4424, '3404320120810', 'SOMO PUTRA AL HARTO', 0, 'Laki - Lak', 'SENDEN I', 0, 0, 0, 'SLEMAN', '1932-11-23', 10, 32, '1', '0000-00-00 00:00:00'),
(4425, '3404320120910', 'SRI SUNARYO', 0, 'Laki - Lak', 'TIMUR', 0, 0, 0, 'SLEMAN', '1969-06-24', 10, 32, '1', '0000-00-00 00:00:00'),
(4426, '3404320121010', 'SRIYADI', 0, 'Laki - Lak', 'PONDOK', 0, 0, 0, 'SLEMAN', '1964-07-05', 10, 32, '1', '0000-00-00 00:00:00'),
(4427, '3404320121110', 'SUDIMAN', 0, 'Laki - Lak', 'SAMBEREJO', 0, 0, 0, 'SLEMAN', '1956-12-31', 10, 32, '1', '0000-00-00 00:00:00'),
(4428, '3404320121210', 'SUGIYARTO', 0, 'Laki - Lak', 'RANDUSARI', 0, 0, 0, 'SLEMAN', '1979-06-09', 10, 32, '1', '0000-00-00 00:00:00'),
(4429, '3404320121310', 'SUHARNO', 0, 'Laki - Lak', 'COKROGATEN', 0, 0, 0, 'SLEMAN', '1963-12-29', 10, 32, '1', '0000-00-00 00:00:00'),
(4430, '3404320121410', 'SUJARWO', 0, 'Laki - Lak', 'JETAK', 0, 0, 0, 'SLEMAN', '1976-10-09', 10, 32, '1', '0000-00-00 00:00:00'),
(4431, '3404320121510', 'SUMARSUM', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1963-01-12', 10, 32, '1', '0000-00-00 00:00:00'),
(4432, '3404320121610', 'SUPARTONO', 0, 'Laki - Lak', 'TUNJUNGAN', 0, 0, 0, 'SLEMAN', '1967-10-16', 10, 32, '1', '0000-00-00 00:00:00'),
(4433, '3404320121710', 'SUPRIHONO', 0, 'Laki - Lak', 'JETAK', 0, 0, 0, 'SLEMAN', '1982-04-22', 10, 32, '1', '0000-00-00 00:00:00'),
(4434, '3404320121807', 'SUPRIYADI', 0, 'Laki - Lak', 'TAMANAN', 0, 0, 0, 'SLEMAN', '1981-11-15', 7, 32, '1', '0000-00-00 00:00:00'),
(4435, '3404320121910', 'SUPRIYANA', 0, 'Laki - Lak', 'KERTIREJO', 0, 0, 0, 'SLEMAN', '1969-09-10', 10, 32, '1', '0000-00-00 00:00:00'),
(4436, '3404320122010', 'SURANI', 0, 'Perempuan', 'JETAK', 0, 0, 0, 'KLATEN', '1988-08-19', 10, 32, '1', '0000-00-00 00:00:00'),
(4437, '3404320122110', 'SUROTO', 0, 'Laki - Lak', 'SIDOREJO', 0, 0, 0, 'KLATEN', '1970-12-16', 10, 32, '1', '0000-00-00 00:00:00'),
(4438, '3404320122210', 'SUWARTO', 0, 'Laki - Lak', 'PUNDUNG', 0, 0, 0, 'SLEMAN', '1969-05-15', 10, 32, '1', '0000-00-00 00:00:00'),
(4439, '3404320122307', 'TEGUH SARJUGO', 0, 'Laki - Lak', 'GONDANGLEGI', 0, 0, 0, 'SLEMAN', '1965-08-05', 7, 32, '1', '0000-00-00 00:00:00'),
(4440, '3404320122410', 'TITIN HARWIYATI', 0, 'Perempuan', 'TIMUR', 0, 0, 0, 'SLEMAN', '1969-07-08', 10, 32, '1', '0000-00-00 00:00:00'),
(4441, '3404320122510', 'TRI RAHAYU', 0, 'Perempuan', 'SEJARAN', 0, 0, 0, 'KLATEN', '1978-03-16', 10, 32, '1', '0000-00-00 00:00:00'),
(4442, '3404320122610', 'TRI WALUYO', 0, 'Laki - Lak', 'ROGOBANGSAN', 0, 0, 0, 'SLEMAN', '1967-07-26', 10, 32, '1', '0000-00-00 00:00:00'),
(4443, '3404320122710', 'TUKIJO', 0, 'Laki - Lak', 'PONDOK', 0, 0, 0, 'SLEMAN', '1974-02-07', 10, 32, '1', '0000-00-00 00:00:00'),
(4444, '3404320122810', 'TUTUT WIDODO', 0, 'Laki - Lak', 'SOMAN 1 NGRANGSAN', 0, 0, 0, 'SLEMAN', '1983-09-05', 10, 32, '1', '0000-00-00 00:00:00'),
(4445, '3404320122910', 'UNTUNG SUHARYONO', 0, 'Laki - Lak', 'NGEPRINGAN', 0, 0, 0, 'SLEMAN', '1972-09-09', 10, 32, '1', '0000-00-00 00:00:00');
INSERT INTO `tblrelawan` (`idtblrelawan`, `no_induk`, `nama_relawan`, `nik`, `jenis_kelamin`, `alamat`, `kelurahan`, `kecamatan`, `desa`, `tempat_lahir`, `tgl_lahir`, `kecakapan`, `komunitas`, `create_user`, `create_time`) VALUES
(4446, '3404320123010', 'WALIDIYANTO', 0, 'Laki - Lak', 'BAYEN', 0, 0, 0, 'SLEMAN', '1978-08-21', 10, 32, '1', '0000-00-00 00:00:00'),
(4447, '3404320123110', 'WAWAN TRIYONO', 0, 'Laki - Lak', 'BROMONILAN', 0, 0, 0, '', '0000-00-00', 10, 32, '1', '0000-00-00 00:00:00'),
(4448, '3404320123210', 'WIDODO', 0, 'Laki - Lak', 'SAMBEREJO', 0, 0, 0, 'SLEMAN', '1969-10-23', 10, 32, '1', '0000-00-00 00:00:00'),
(4449, '3404320123310', 'WISNU WIDODO', 0, 'Laki - Lak', 'GATAK II', 0, 0, 0, 'SLEMAN', '1981-07-20', 10, 32, '1', '0000-00-00 00:00:00'),
(4450, '3404330123410', 'A. DIDIK ARYONO', 0, 'Laki - Lak', 'JL.KAKAP 9/12 RT.18/RW.04 ', 0, 0, 0, 'YOGYAKARTA', '1976-08-20', 10, 21, '1', '0000-00-00 00:00:00'),
(4451, '3404330123508', 'AAT IHSAMHADI', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.20/RW.08 ', 0, 0, 0, 'SLEMAN', '1987-04-09', 8, 21, '1', '0000-00-00 00:00:00'),
(4452, '3404330123608', 'AGUSTINUS GUNARI', 0, 'Laki - Lak', 'JL. BANDENG VI/02 RT.30/RW.06 ', 0, 0, 0, 'BANTUL', '1960-12-22', 8, 21, '1', '0000-00-00 00:00:00'),
(4453, '3404330123708', 'ARIS TRI YANTO', 0, 'Laki - Lak', 'GANTALAN, RT,01/RW.01 ', 0, 0, 0, 'SLEMAN', '1978-08-02', 8, 21, '1', '0000-00-00 00:00:00'),
(4454, '3404330123808', 'BAMBANG KRISDIANTO', 0, 'Laki - Lak', 'PLOSOKUNING II, RT.06/RW.03 ', 0, 0, 0, 'SLEMAN', '1965-07-28', 8, 21, '1', '0000-00-00 00:00:00'),
(4455, '3404330123908', 'BARYANTO', 0, 'Laki - Lak', 'PLOSOKUNING III, RT.13/RW.05 ', 0, 0, 0, 'SLEMAN', '1976-01-03', 8, 21, '1', '0000-00-00 00:00:00'),
(4456, '3404330124008', 'CIPTO WARDOYO AGUNG. S', 0, 'Laki - Lak', 'MLANDANGAN RT.30/RW.12 ', 0, 0, 0, 'YOGYAKARTA', '1962-07-28', 8, 21, '1', '0000-00-00 00:00:00'),
(4457, '3404330124123', 'DIDIK ISTIAWAN ', 0, 'Laki - Lak', 'ASTER DEPOK, 1/329 PCC', 0, 0, 0, 'SLEMAN', '1965-10-03', 23, 21, '1', '0000-00-00 00:00:00'),
(4458, '3404330124223', 'DIKAU MARDIKA PRATAMA', 0, 'Laki - Lak', 'PLOSOKUNING V, RT.25/RW.10 ', 0, 0, 0, 'SLEMAN', '1991-08-16', 23, 21, '1', '0000-00-00 00:00:00'),
(4459, '3404330124308', 'DJALBANI ADAM AL ATAS', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.18/RW.07 ', 0, 0, 0, 'SLEMAN', '1960-10-10', 8, 21, '1', '0000-00-00 00:00:00'),
(4460, '3404330124408', 'DRS. WARSITO', 0, 'Laki - Lak', 'PLOSOKUNING III, RT.13/RW.05 ', 0, 0, 0, 'SLEMAN', '1966-02-12', 8, 21, '1', '0000-00-00 00:00:00'),
(4461, '3404330124523', 'DWI SUSANTO', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.17/RW.07 ', 0, 0, 0, 'SLEMAN', '1984-06-02', 23, 21, '1', '0000-00-00 00:00:00'),
(4462, '3404330124623', 'FEBRIYAN BAYU. N.', 0, 'Laki - Lak', 'JL.KAKAP 8/2 RT.18/RW.04 ', 0, 0, 0, 'YOGYAKARTA', '1989-02-08', 23, 21, '1', '0000-00-00 00:00:00'),
(4463, '3404330124708', 'FLOOD HARTO', 0, 'Laki - Lak', 'PLOSOKUNING II, RT.08/RW.03 ', 0, 0, 0, 'SLEMAN', '1984-04-10', 8, 21, '1', '0000-00-00 00:00:00'),
(4464, '3404330124810', 'GATOT WASIH. ANT', 0, 'Laki - Lak', 'JL. PANGKUR NO 19C GANJURAN MANUKAN', 0, 0, 0, 'GUNUNG KIDUL', '1977-10-02', 10, 21, '1', '0000-00-00 00:00:00'),
(4465, '3404330124923', 'GIYANTO', 0, 'Laki - Lak', 'PLOSOKUNING V, RT.23/RW.09 ', 0, 0, 0, 'SLEMAN', '1957-01-29', 23, 21, '1', '0000-00-00 00:00:00'),
(4466, '3404330125008', 'HABIBULLAH', 0, 'Laki - Lak', 'PLOSOKUNING III, RT.12/RW.05 ', 0, 0, 0, 'SLEMAN', '1991-04-12', 8, 21, '1', '0000-00-00 00:00:00'),
(4467, '3404330125108', 'HANRI SETIO NUGROHO', 0, 'Laki - Lak', 'JL. BANDENG 0I/10 RT.29/RW.06 ', 0, 0, 0, 'YOGYAKARTA', '1982-02-18', 8, 21, '1', '0000-00-00 00:00:00'),
(4468, '3404330125210', 'HARTONO', 0, 'Laki - Lak', 'PLOSOKUNING II, RT.09/RW.04 ', 0, 0, 0, 'SLEMAN', '1957-01-29', 10, 21, '1', '0000-00-00 00:00:00'),
(4469, '3404330125308', 'IMAM ROHANI', 0, 'Laki - Lak', 'PLOSOKUNING V, RT.24/RW.10 ', 0, 0, 0, 'SLEMAN', '1982-06-02', 8, 21, '1', '0000-00-00 00:00:00'),
(4470, '3404330125407', 'KARTIYONO', 0, 'Laki - Lak', 'BULUREJO RT.04/RW.02 ', 0, 0, 0, 'TEMANGGUNG', '1971-04-21', 7, 21, '1', '0000-00-00 00:00:00'),
(4471, '3404330125508', 'KUSDIANTORO', 0, 'Laki - Lak', 'PLOSOKUNING II, RT.09/RW.04 ', 0, 0, 0, 'SLEMAN', '1976-03-31', 8, 21, '1', '0000-00-00 00:00:00'),
(4472, '3404330125608', 'M. ABDURAHMAN', 0, 'Laki - Lak', 'PLOSOKUNING V, RT.24/RW.10 ', 0, 0, 0, 'SLEMAN', '1995-02-02', 8, 21, '1', '0000-00-00 00:00:00'),
(4473, '3404330125723', 'MAJI', 0, 'Laki - Lak', 'MANUKAN, RAJAWALI RT. 04/RW. 04 ', 0, 0, 0, 'SLEMAN', '1967-10-15', 23, 21, '1', '0000-00-00 00:00:00'),
(4474, '3404330125808', 'MARTA SUKARDI', 0, 'Laki - Lak', 'JL.KAKAP 3/30 RT.16/RW.04 ', 0, 0, 0, 'YOGYAKARTA', '1982-05-12', 8, 21, '1', '0000-00-00 00:00:00'),
(4475, '3404330125908', 'NURKAPIT', 0, 'Laki - Lak', 'PLOSOKUNING III, RT.12/RW.05 ', 0, 0, 0, 'SLEMAN', '1986-10-12', 8, 21, '1', '0000-00-00 00:00:00'),
(4476, '3404330126023', 'PRIRIYANTO', 0, 'Laki - Lak', 'MLANDANGAN RT.30/RW.12 ', 0, 0, 0, 'SLEMAN', '1985-03-14', 23, 21, '1', '0000-00-00 00:00:00'),
(4477, '3404330126110', 'R. DARFAN BASRONI', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.18/RW.7 ', 0, 0, 0, 'SLEMAN', '1979-01-16', 10, 21, '1', '0000-00-00 00:00:00'),
(4478, '3404330126208', 'R. MUHAMMAD HABIB HIDAYAT', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.18/RW.07 ', 0, 0, 0, 'SLEMAN', '1991-11-20', 8, 21, '1', '0000-00-00 00:00:00'),
(4479, '3404330126323', 'RAHMAT MUJIYONO', 0, 'Laki - Lak', 'GURAMEH III/09 ', 0, 0, 0, 'YOGYAKARTA', '1966-03-14', 23, 21, '1', '0000-00-00 00:00:00'),
(4480, '3404330126423', 'RIYADI ISMU JATMIKO P.M.S', 0, 'Laki - Lak', 'TIYASAN CONDONGCATUR, RT.01/RW.01', 0, 0, 0, 'SLEMAN', '1970-05-14', 23, 21, '1', '0000-00-00 00:00:00'),
(4481, '3404330126510', 'ROYI AHMADI', 0, 'Laki - Lak', 'BULUREJO RT.04/RW.02 ', 0, 0, 0, 'SLEMAN', '1978-11-12', 10, 21, '1', '0000-00-00 00:00:00'),
(4482, '3404330126608', 'SARJIYONO', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.19/RW.8 MINOMARTANI', 0, 0, 0, 'GUNUNG KIDUL', '1978-12-25', 8, 21, '1', '0000-00-00 00:00:00'),
(4483, '3404330126708', 'SARJONO NURIMAN', 0, 'Laki - Lak', 'BULUREJO RT.04/RW.02 ', 0, 0, 0, 'SLEMAN', '1983-05-03', 8, 21, '1', '0000-00-00 00:00:00'),
(4484, '3404330126823', 'SRI WIDODO', 0, 'Laki - Lak', 'KRANDON WEDOMARTANI RT.09/RW.52', 0, 0, 0, 'GUNUNG KIDUL', '1969-09-20', 23, 21, '1', '0000-00-00 00:00:00'),
(4485, '3404330126908', 'SUBARDI', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.19/RW.8 ', 0, 0, 0, 'SLEMAN', '1965-07-09', 8, 21, '1', '0000-00-00 00:00:00'),
(4486, '3404330127011', 'SUCIPTO', 0, 'Laki - Lak', 'JL. KALIURANG KM. 5 RT.05/RW. 02 ', 0, 0, 0, 'PADANG', '1965-03-16', 11, 21, '1', '0000-00-00 00:00:00'),
(4487, '3404330127108', 'SUGENG UTORO', 0, 'Laki - Lak', 'PLOSOKUNING V, RT.24/RW.10 ', 0, 0, 0, 'SLEMAN', '1991-06-11', 8, 21, '1', '0000-00-00 00:00:00'),
(4488, '3404330127208', 'SUPARDI', 0, 'Laki - Lak', 'BULUREJO RT.04/RW.02 ', 0, 0, 0, 'SLEMAN', '1968-04-07', 8, 21, '1', '0000-00-00 00:00:00'),
(4489, '3404330127323', 'SUPARJO', 0, 'Laki - Lak', 'TIYASAN CONDONGCATUR, RT.01/RW.01', 0, 0, 0, 'SLEMAN', '1967-05-24', 23, 21, '1', '0000-00-00 00:00:00'),
(4490, '3404330127406', 'SUTARJO', 0, 'Laki - Lak', 'PLOSOKUNING III, RT.13/RW.05 ', 0, 0, 0, 'YOGYAKARTA', '1958-07-13', 6, 21, '1', '0000-00-00 00:00:00'),
(4491, '3404330127508', 'SUWARNO LAKSITO', 0, 'Laki - Lak', 'JL. PIRANHA V/08 RT.21/RW.05', 0, 0, 0, 'YOGYAKARTA', '0000-00-00', 8, 21, '1', '0000-00-00 00:00:00'),
(4492, '3404330127608', 'TONI ARIF MARTONO', 0, 'Laki - Lak', 'KARANGJATI RT. 27/RW. 11 ', 0, 0, 0, 'TULUNG AGUNG', '1983-01-19', 8, 21, '1', '0000-00-00 00:00:00'),
(4493, '3404330127708', 'UNTUNG PRIBADI', 0, 'Laki - Lak', 'JL.KAKAP 9/21 RT.18/RW.04 ', 0, 0, 0, 'YOGYAKARTA', '1979-02-02', 8, 21, '1', '0000-00-00 00:00:00'),
(4494, '3404330127806', 'WAHYU CHAIRUDIN', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.17/RW.07 ', 0, 0, 0, 'SLEMAN', '1957-01-29', 6, 21, '1', '0000-00-00 00:00:00'),
(4495, '3404330127908', 'WARIDI', 0, 'Laki - Lak', 'PLOSOKUNING V, RT.23/RW.09 ', 0, 0, 0, 'SLEMAN', '1962-06-05', 8, 21, '1', '0000-00-00 00:00:00'),
(4496, '3404330128006', 'YAENURI', 0, 'Laki - Lak', 'PLOSOKUNING V, RT.26/RW.10 ', 0, 0, 0, 'YOGYAKARTA', '1972-01-17', 6, 21, '1', '0000-00-00 00:00:00'),
(4497, '3404330128108', 'ZAHRODIN AHMAD', 0, 'Laki - Lak', 'PLOSOKUNING IV, RT.20/RW.08 ', 0, 0, 0, 'SLEMAN', '1975-05-13', 8, 21, '1', '0000-00-00 00:00:00'),
(4498, '3404340128206', 'ABI AKBAR ASSANI', 0, 'Laki - Lak', '', 0, 0, 0, 'MAGELANG', '1996-07-09', 6, 15, '1', '0000-00-00 00:00:00'),
(4499, '3404340128306', 'AHMAD HUSIN ABDULLAH', 0, 'Laki - Lak', '', 0, 0, 0, 'SRAGEN', '1996-08-18', 6, 15, '1', '0000-00-00 00:00:00'),
(4500, '3404340128406', 'ANFUS SAJIDAN', 0, 'Laki - Lak', '', 0, 0, 0, 'SLEMAN', '1996-07-09', 6, 15, '1', '0000-00-00 00:00:00'),
(4501, '3404340128506', 'AS\'AD ABDUL AZIZ', 0, 'Laki - Lak', 'PEDAK', 0, 0, 0, 'SLEMAN', '1996-01-08', 6, 15, '1', '0000-00-00 00:00:00'),
(4502, '3404340128606', 'DARYONO', 0, 'Laki - Lak', '', 0, 0, 0, 'MUSI BANYUASIN', '1981-12-27', 6, 15, '1', '0000-00-00 00:00:00'),
(4503, '3404340128706', 'FAZWA AULIA SOBRON', 0, 'Laki - Lak', '', 0, 0, 0, 'GUNUNG MADU', '1994-12-05', 6, 15, '1', '0000-00-00 00:00:00'),
(4504, '3404340128806', 'FIDA\' AHMAD SYUHADA', 0, 'Laki - Lak', '', 0, 0, 0, 'SURABAYA', '1997-05-13', 6, 15, '1', '0000-00-00 00:00:00'),
(4505, '3404340128906', 'HARIS SUNANDAR', 0, 'Laki - Lak', 'GINTARAN', 0, 0, 0, 'BANYUWANGI', '1996-07-03', 6, 15, '1', '0000-00-00 00:00:00'),
(4506, '3404340129006', 'ISMAIL', 0, 'Laki - Lak', '', 0, 0, 0, 'SLEMAN', '1993-12-26', 6, 15, '1', '0000-00-00 00:00:00'),
(4507, '3404340129106', 'M. IQBAL TARMUDZI', 0, 'Laki - Lak', '', 0, 0, 0, 'TANGERANG', '1994-11-01', 6, 15, '1', '0000-00-00 00:00:00'),
(4508, '3404340129206', 'M. IRFAN HAKIM', 0, 'Laki - Lak', '', 0, 0, 0, 'SURAKARTA', '1995-05-07', 6, 15, '1', '0000-00-00 00:00:00'),
(4509, '3404340129306', 'M. JUDULLAH KARIM', 0, 'Laki - Lak', '', 0, 0, 0, 'PROBOLINGGO', '1994-04-04', 6, 15, '1', '0000-00-00 00:00:00'),
(4510, '3404340129406', 'M. NURULLAH ABDUL AZIZ', 0, 'Laki - Lak', 'MOJOSONGO', 0, 0, 0, 'SURAKARTA', '1995-05-17', 6, 15, '1', '0000-00-00 00:00:00'),
(4511, '3404340129506', 'MUHAMMAD FAUZAN K', 0, 'Laki - Lak', '', 0, 0, 0, 'TOBELO', '1992-09-09', 6, 15, '1', '0000-00-00 00:00:00'),
(4512, '3404340129606', 'NUR SAHID', 0, 'Laki - Lak', 'JAMBLANGAN', 0, 0, 0, 'DEMAK', '1989-08-25', 6, 15, '1', '0000-00-00 00:00:00'),
(4513, '3404340129706', 'RIDWAN FEBRIYANSYAH', 0, 'Laki - Lak', '', 0, 0, 0, 'MAGELANG', '1996-06-13', 6, 15, '1', '0000-00-00 00:00:00'),
(4514, '3404340129806', 'TARSONO', 0, 'Laki - Lak', '', 0, 0, 0, 'BANYUMAS', '1994-04-10', 6, 15, '1', '0000-00-00 00:00:00'),
(4515, '3404350129917', 'AGUNG DWI ARYANTO', 0, 'Laki - Lak', 'KARANGLO ', 0, 0, 0, 'SLEMAN', '1971-07-07', 17, 30, '1', '0000-00-00 00:00:00'),
(4516, '3404350130015', 'AGUS HARJANTO', 0, 'Laki - Lak', 'KENDAL', 0, 0, 0, 'MAGELANG', '1979-10-28', 15, 30, '1', '0000-00-00 00:00:00'),
(4517, '3404350130115', 'ANIS HARYANTO', 0, 'Laki - Lak', 'DUKUH', 0, 0, 0, 'SLEMAN', '1975-09-19', 15, 30, '1', '0000-00-00 00:00:00'),
(4518, '3404350130215', 'ARIS HIDAYAT', 0, 'Laki - Lak', 'KEMUSUH', 0, 0, 0, 'BNJRNEGARA', '1986-09-12', 15, 30, '1', '0000-00-00 00:00:00'),
(4519, '3404350130317', 'BAMBANG EDY FAUZANI', 0, 'Laki - Lak', 'BLUNYAH RT 01/15', 0, 0, 0, 'SLEMAN', '1956-12-16', 17, 30, '1', '0000-00-00 00:00:00'),
(4520, '3404350130415', 'BEJO', 0, 'Laki - Lak', 'BALONG ', 0, 0, 0, 'SLEMAN', '1963-11-13', 15, 30, '1', '0000-00-00 00:00:00'),
(4521, '3404350130523', 'BUDIYANTO', 0, 'Laki - Lak', 'KAWEDAN ', 0, 0, 0, 'SLEMAN', '1969-11-24', 23, 30, '1', '0000-00-00 00:00:00'),
(4522, '3404350130613', 'DEWATA GUNTUR', 0, 'Laki - Lak', 'JAGALAN RT 2/13', 0, 0, 0, 'SLEMAN', '1970-04-03', 13, 30, '1', '0000-00-00 00:00:00'),
(4523, '3404350130718', 'DIDIK ENDAR S.', 0, 'Laki - Lak', 'JETIS RT 05/14', 0, 0, 0, 'SLEMAN', '1967-10-02', 18, 30, '1', '0000-00-00 00:00:00'),
(4524, '3404350130807', 'EDY NURWIYANTA', 0, 'Laki - Lak', 'JETIS RT 04/13', 0, 0, 0, 'SLEMAN', '1962-10-18', 7, 30, '1', '0000-00-00 00:00:00'),
(4525, '3404350130907', 'EFFENDI SASMITO', 0, 'Laki - Lak', 'KOPEN ', 0, 0, 0, 'SLEMAN', '1978-06-18', 7, 30, '1', '0000-00-00 00:00:00'),
(4526, '3404350131015', 'HARYONO', 0, 'Laki - Lak', 'BROMONILAN', 0, 0, 0, 'SLEMAN', '1961-12-04', 15, 30, '1', '0000-00-00 00:00:00'),
(4527, '3404350131113', 'KARDIYONO', 0, 'Laki - Lak', 'TERWILEN ', 0, 0, 0, 'YOGYAKARTA', '1966-06-14', 13, 30, '1', '0000-00-00 00:00:00'),
(4528, '3404350131218', 'KASIYONO', 0, 'Laki - Lak', 'BLUNYAH RT 02/15', 0, 0, 0, 'SLEMAN', '1962-10-27', 18, 30, '1', '0000-00-00 00:00:00'),
(4529, '3404350131315', 'MARKABAN', 0, 'Laki - Lak', 'JABUNG ', 0, 0, 0, 'SLEMAN', '1960-10-05', 15, 30, '1', '0000-00-00 00:00:00'),
(4530, '3404350131423', 'NARSUDIYANA', 0, 'Laki - Lak', 'KARANG', 0, 0, 0, 'SLEMAN', '1941-04-24', 23, 30, '1', '0000-00-00 00:00:00'),
(4531, '3404350131523', 'NGADIMIN', 0, 'Laki - Lak', 'BABARSARI ', 0, 0, 0, 'SLEMAN', '1957-09-06', 23, 30, '1', '0000-00-00 00:00:00'),
(4532, '3404350131606', 'RUSTAMAJI', 0, 'Laki - Lak', 'TAMBAKREJO ', 0, 0, 0, 'SLEMAN', '1976-03-06', 6, 30, '1', '0000-00-00 00:00:00'),
(4533, '3404350131707', 'SARMAN', 0, 'Laki - Lak', 'BLUNYAH RT 01/15', 0, 0, 0, 'SLEMAN', '1962-10-14', 7, 30, '1', '0000-00-00 00:00:00'),
(4534, '3404350131823', 'SENU HARYANTO', 0, 'Laki - Lak', 'NGABEAN ', 0, 0, 0, 'SLEMAN', '1958-03-03', 23, 30, '1', '0000-00-00 00:00:00'),
(4535, '3404350131907', 'SOLIHIN', 0, 'Laki - Lak', 'KEMIRI ', 0, 0, 0, 'SLEMAN', '1972-08-24', 7, 30, '1', '0000-00-00 00:00:00'),
(4536, '3404350132007', 'SRI SUNTORO', 0, 'Laki - Lak', 'BALONG KARANG ', 0, 0, 0, 'SLEMAN', '1974-01-23', 7, 30, '1', '0000-00-00 00:00:00'),
(4537, '3404350132106', 'SRIYANTO', 0, 'Laki - Lak', 'TOPADAN ', 0, 0, 0, 'SLEMAN', '1969-04-21', 6, 30, '1', '0000-00-00 00:00:00'),
(4538, '3404350132213', 'SUMITRO', 0, 'Laki - Lak', 'MURANGAN 8 RT 5/RW 8 ', 0, 0, 0, 'SLEMAN', '1977-05-03', 13, 30, '1', '0000-00-00 00:00:00'),
(4539, '3404350132307', 'SUROTO', 0, 'Laki - Lak', 'BLUNYAH RT 02/15', 0, 0, 0, 'SLEMAN', '1969-04-22', 7, 30, '1', '0000-00-00 00:00:00'),
(4540, '3404350132406', 'SURYANTO', 0, 'Laki - Lak', 'MEJING KIDUL RT 1/2 ', 0, 0, 0, 'SLEMAN', '1982-01-17', 6, 30, '1', '0000-00-00 00:00:00'),
(4541, '3404350132507', 'SUYANTO', 0, 'Laki - Lak', 'BANJARSARI', 0, 0, 0, 'SLEMAN', '1968-11-24', 7, 30, '1', '0000-00-00 00:00:00'),
(4542, '3404350132623', 'SUYOTO', 0, 'Laki - Lak', 'TEGALWERU ', 0, 0, 0, 'SLEMAN', '1970-08-04', 23, 30, '1', '0000-00-00 00:00:00'),
(4543, '3404350132708', 'WIBOWO SUNARTO', 0, 'Laki - Lak', 'GENITEM RT 2/16', 0, 0, 0, 'SLEMAN', '1961-10-07', 8, 30, '1', '0000-00-00 00:00:00'),
(4544, '3404350132806', 'YOSHFAT AJIE Y', 0, 'Laki - Lak', 'PERUM MUNGGUR 4 NO 3 ', 0, 0, 0, 'SURABAYA', '1975-11-03', 6, 30, '1', '0000-00-00 00:00:00'),
(4545, '3404360132906', 'AGUNG S ', 0, 'Laki - Lak', 'SUKOHARJO', 0, 0, 0, 'SLEMAN', '1970-06-23', 6, 35, '1', '0000-00-00 00:00:00'),
(4546, '3404360133010', 'BUDI SANTOSO', 0, 'Laki - Lak', 'BONGKOL', 0, 0, 0, 'SLEMAN', '1969-09-07', 10, 35, '1', '0000-00-00 00:00:00'),
(4547, '3404360133106', 'DANANG YUDHA SUKARTALA              ', 0, 'Laki - Lak', 'SEMBUNGAN 03, ', 0, 0, 0, 'BANYUMAS', '1979-06-30', 6, 35, '1', '0000-00-00 00:00:00'),
(4548, '3404360133206', 'ERNA SETIAWAN', 0, 'Laki - Lak', 'KALI URANG, RT 02 RW 17', 0, 0, 0, 'SLEMAN', '1980-06-22', 6, 35, '1', '0000-00-00 00:00:00'),
(4549, '3404360133306', 'HERI DWI KUSWOLO', 0, 'Laki - Lak', 'KEPUH', 0, 0, 0, 'SLEMAN', '1976-05-10', 6, 35, '1', '0000-00-00 00:00:00'),
(4550, '3404360133406', 'IRIYANTO SROYER', 0, 'Laki - Lak', 'MANGGONG', 0, 0, 0, 'SLEMAN', '1993-06-03', 6, 35, '1', '0000-00-00 00:00:00'),
(4551, '3404360133506', 'JAYUS SUBEKTI', 0, 'Laki - Lak', 'BATUR', 0, 0, 0, 'SLEMAN', '1987-06-15', 6, 35, '1', '0000-00-00 00:00:00'),
(4552, '3404360133607', 'KAMARI', 0, 'Laki - Lak', 'KOPENG', 0, 0, 0, 'SLEMAN', '1905-05-10', 7, 35, '1', '0000-00-00 00:00:00'),
(4553, '3404360133706', 'MARYANTO', 0, 'Laki - Lak', 'WONOKESO', 0, 0, 0, 'SLEMAN', '1972-10-07', 6, 35, '1', '0000-00-00 00:00:00'),
(4554, '3404360133806', 'MISYANTO', 0, 'Laki - Lak', 'KEPUH', 0, 0, 0, 'SLEMAN', '1981-05-02', 6, 35, '1', '0000-00-00 00:00:00'),
(4555, '3404360133907', 'NGATIJO', 0, 'Laki - Lak', 'KEPUH', 0, 0, 0, 'SLEMAN', '1985-11-03', 7, 35, '1', '0000-00-00 00:00:00'),
(4556, '3404360134006', 'PURNOMO BUDI WIBOWO', 0, 'Laki - Lak', 'BANJARHARJO', 0, 0, 0, 'SLEMAN', '1974-11-29', 6, 35, '1', '0000-00-00 00:00:00'),
(4557, '3404360134123', 'RIDWAN DWI NURYADI', 0, 'Laki - Lak', 'SRUNI', 0, 0, 0, 'SLEMAN', '1978-02-09', 23, 35, '1', '0000-00-00 00:00:00'),
(4558, '3404360134206', 'RUJIONO', 0, 'Laki - Lak', 'PETUNG', 0, 0, 0, 'GUNUNG KIDUL', '1967-02-05', 6, 35, '1', '0000-00-00 00:00:00'),
(4559, '3404360134310', 'SARJI', 0, 'Laki - Lak', 'MANGGONG', 0, 0, 0, 'SLEMAN', '1964-04-21', 10, 35, '1', '0000-00-00 00:00:00'),
(4560, '3404360134406', 'SARYONO', 0, 'Laki - Lak', 'KOPENG', 0, 0, 0, 'SLEMAN', '1973-02-16', 6, 35, '1', '0000-00-00 00:00:00'),
(4561, '3404360134506', 'SETIYAWAN', 0, 'Laki - Lak', 'BATUR', 0, 0, 0, 'SLEMAN', '1975-05-05', 6, 35, '1', '0000-00-00 00:00:00'),
(4562, '3404360134613', 'SIDIK HENDRO  UTOMO', 0, 'Laki - Lak', 'PANGGUNG', 0, 0, 0, 'SLEMAN', '1975-11-30', 13, 35, '1', '0000-00-00 00:00:00'),
(4563, '3404360134706', 'SLAMET RIYADI', 0, 'Laki - Lak', 'PETUNG', 0, 0, 0, 'SLEMAN', '1976-09-01', 6, 35, '1', '0000-00-00 00:00:00'),
(4564, '3404360134810', 'SRI WAHYUNINGSIH', 0, 'Perempuan', 'POKOH', 0, 0, 0, 'SLEMAN', '1970-01-03', 10, 35, '1', '0000-00-00 00:00:00'),
(4565, '3404360134907', 'SRI WIDODO', 0, 'Laki - Lak', 'PLOSOKEREP', 0, 0, 0, 'SLEMAN', '2067-10-31', 7, 35, '1', '0000-00-00 00:00:00'),
(4566, '3404360135013', 'SUGENG RIYADI', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1963-03-14', 13, 35, '1', '0000-00-00 00:00:00'),
(4567, '3404360135110', 'SUKISWANTO', 0, 'Laki - Lak', 'KOPENG', 0, 0, 0, 'SLEMAN', '1978-04-24', 10, 35, '1', '0000-00-00 00:00:00'),
(4568, '3404360135206', 'SUMADIYANTO', 0, 'Laki - Lak', 'MANGGONG', 0, 0, 0, 'SLEMAN', '1973-10-17', 6, 35, '1', '0000-00-00 00:00:00'),
(4569, '3404360135312', 'SUPRI YANA / SEMPRIT', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1963-04-11', 5, 35, '1', '0000-00-00 00:00:00'),
(4570, '3404360135412', 'SUPRIYADI ', 0, 'Laki - Lak', 'MANGGONG', 0, 0, 0, 'SLEMAN', '1974-01-14', 5, 35, '1', '0000-00-00 00:00:00'),
(4571, '3404360135506', 'SUPRIYADI ', 0, 'Laki - Lak', 'NGENTAK', 0, 0, 0, 'SLEMAN', '1984-04-20', 6, 35, '1', '0000-00-00 00:00:00'),
(4572, '3404360135606', 'SUPRIYADI ', 0, 'Laki - Lak', 'SELOREJO', 0, 0, 0, 'SLEMAN', '1967-10-05', 6, 35, '1', '0000-00-00 00:00:00'),
(4573, '3404360135717', 'SUTANTO', 0, 'Laki - Lak', 'PENTING SARI', 0, 0, 0, 'SLEMAN', '1963-09-29', 17, 35, '1', '0000-00-00 00:00:00'),
(4574, '3404360135806', 'SUWOTO', 0, 'Laki - Lak', 'KRAJAN', 0, 0, 0, 'SLEMAN', '1966-03-02', 6, 35, '1', '0000-00-00 00:00:00'),
(4575, '3404360135907', 'SUYATNO', 0, 'Laki - Lak', 'JAKAL KM15 DEGOLAN', 0, 0, 0, 'SLEMAN', '1978-10-12', 7, 35, '1', '0000-00-00 00:00:00'),
(4576, '3404360136023', 'TRI KUSWANTORO', 0, 'Laki - Lak', 'BATUR', 0, 0, 0, 'SLEMAN', '1977-04-25', 23, 35, '1', '0000-00-00 00:00:00'),
(4577, '3404360136106', 'TRIYANTO', 0, 'Laki - Lak', 'JMBU', 0, 0, 0, 'SLEMAN', '1975-10-03', 6, 35, '1', '0000-00-00 00:00:00'),
(4578, '3404360136206', 'TRIYONO', 0, 'Laki - Lak', 'PAGER JURANG', 0, 0, 0, 'SLEMAN', '1978-05-02', 6, 35, '1', '0000-00-00 00:00:00'),
(4579, '3404360136307', 'URIP UTOYO', 0, 'Laki - Lak', ' KARANGGENENG', 0, 0, 0, 'SLEMAN', '1956-12-31', 7, 35, '1', '0000-00-00 00:00:00'),
(4580, '3404360136407', 'YUSUF', 0, 'Laki - Lak', 'CANCANGAN', 0, 0, 0, 'SLEMAN', '1975-06-05', 7, 35, '1', '0000-00-00 00:00:00'),
(4581, '3404360136507', 'SUGIYANTO', 0, 'Laki - Lak', 'PURWODADI', 0, 0, 0, 'SLEMAN', '1958-03-29', 7, 35, '1', '0000-00-00 00:00:00'),
(4582, '3404370136606', 'ADE BAYUDITYA', 0, 'Laki - Lak', 'KALIURANG BARAT', 0, 0, 0, 'SLEMAN', '1985-02-02', 6, 10, '1', '0000-00-00 00:00:00'),
(4583, '3404370136706', 'AGUS BUDI APRIAN NUGROHO', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1983-04-27', 6, 10, '1', '0000-00-00 00:00:00'),
(4584, '3404370136806', 'AGUS RIYANTO', 0, 'Laki - Lak', 'KALIURANG SELATAN', 0, 0, 0, 'GUNUNG KIDUL', '1970-08-16', 6, 10, '1', '0000-00-00 00:00:00'),
(4585, '3404370136906', 'AGUS WAHYUDI', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'KENDAL', '1978-08-29', 6, 10, '1', '0000-00-00 00:00:00'),
(4586, '3404370137006', 'AMBAR RIYANTO', 0, 'Laki - Lak', 'KALIURANG BARAT', 0, 0, 0, 'SLEMAN', '1961-01-16', 6, 10, '1', '0000-00-00 00:00:00'),
(4587, '3404370137106', 'ANA SULISTYOWATI', 0, 'Perempuan', 'NGAGLIK, CUPUWATU', 0, 0, 0, 'SLEMAN', '1992-06-22', 6, 10, '1', '0000-00-00 00:00:00'),
(4588, '3404370137206', 'ANDIKA ZAILENDRA', 0, 'Laki - Lak', 'KALIURANG BARAT, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1989-05-13', 6, 10, '1', '0000-00-00 00:00:00'),
(4589, '3404370137306', 'BAYU PRASETYO', 0, 'Laki - Lak', 'NGEPRING', 0, 0, 0, 'SLEMAN', '1993-10-13', 6, 10, '1', '0000-00-00 00:00:00'),
(4590, '3404370137406', 'DWI ROHMAD', 0, 'Laki - Lak', 'KAPING, WONOKERTO, TURI', 0, 0, 0, 'SLEMAN', '1984-01-14', 6, 10, '1', '0000-00-00 00:00:00'),
(4591, '3404370137506', 'EKO PARYANTO', 0, 'Laki - Lak', 'TURGO', 0, 0, 0, 'SLEMAN', '1985-11-05', 6, 10, '1', '0000-00-00 00:00:00'),
(4592, '3404370137606', 'FERI RIDYANTORO', 0, 'Laki - Lak', 'KALIURANG BARAT, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1989-05-24', 6, 10, '1', '0000-00-00 00:00:00'),
(4593, '3404370137706', 'GATOT GUNARTO', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1979-06-08', 6, 10, '1', '0000-00-00 00:00:00'),
(4594, '3404370137806', 'GIMIN', 0, 'Laki - Lak', 'TURGO', 0, 0, 0, 'SLEMAN', '1978-03-02', 6, 10, '1', '0000-00-00 00:00:00'),
(4595, '3404370137906', 'GIYANTO', 0, 'Laki - Lak', 'SIDOREJO, PANGUKREJO', 0, 0, 0, 'SLEMAN', '1984-07-27', 6, 10, '1', '0000-00-00 00:00:00'),
(4596, '3404370138006', 'HARTONO', 0, 'Laki - Lak', 'NGEPRING', 0, 0, 0, 'SLEMAN', '1982-06-09', 6, 10, '1', '0000-00-00 00:00:00'),
(4597, '3404370138106', 'HERI HERMAWAN', 0, 'Laki - Lak', 'KALIURANG BARAT, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1987-01-12', 6, 10, '1', '0000-00-00 00:00:00'),
(4598, '3404370138206', 'HIDAYAH', 0, 'Perempuan', 'KALIURANG TIMUR', 0, 0, 0, 'MAGELANG', '1988-07-25', 6, 10, '1', '0000-00-00 00:00:00'),
(4599, '3404370138306', 'IMAM PUTRA PRAYITNA', 0, 'Laki - Lak', 'KALIURANG SELATAN, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1990-06-01', 6, 10, '1', '0000-00-00 00:00:00'),
(4600, '3404370138406', 'JEMALI', 0, 'Laki - Lak', 'KALITENGAH KIDUL, GLAGAHARJO', 0, 0, 0, 'SLEMAN', '1986-05-29', 6, 10, '1', '0000-00-00 00:00:00'),
(4601, '3404370138506', 'KISWANTA', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1976-04-29', 6, 10, '1', '0000-00-00 00:00:00'),
(4602, '3404370138606', 'LAILI ANISA PRADIPTA NUGRAHA', 0, 'Laki - Lak', 'KALIURANG TIMUR, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1991-02-28', 6, 10, '1', '0000-00-00 00:00:00'),
(4603, '3404370138706', 'LUYAMTA', 0, 'Laki - Lak', 'HUNTAP BATUR', 0, 0, 0, 'SLEMAN', '1965-11-19', 6, 10, '1', '0000-00-00 00:00:00'),
(4604, '3404370138806', 'MARYANTO', 0, 'Laki - Lak', 'NGIPIKSARI, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1986-02-14', 6, 10, '1', '0000-00-00 00:00:00'),
(4605, '3404370138906', 'PARI WAHYUDI', 0, 'Laki - Lak', 'KALIURANG BARAT', 0, 0, 0, 'SLEMAN', '1975-03-10', 6, 10, '1', '0000-00-00 00:00:00'),
(4606, '3404370139006', 'RIMBI DWI MUNANDAR', 0, 'Laki - Lak', 'KALIURANG SELATAN, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1991-11-27', 6, 10, '1', '0000-00-00 00:00:00'),
(4607, '3404370139106', 'RIRIS PRIHATIN', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1995-05-29', 6, 10, '1', '0000-00-00 00:00:00'),
(4608, '3404370139206', 'RIYADI', 0, 'Laki - Lak', 'KALITENGAH KIDUL', 0, 0, 0, 'SLEMAN', '1985-04-27', 6, 10, '1', '0000-00-00 00:00:00'),
(4609, '3404370139306', 'SAIDI HS', 0, 'Laki - Lak', 'KEMIRI, NGEPRING', 0, 0, 0, 'MAGETAN', '1958-04-04', 6, 10, '1', '0000-00-00 00:00:00'),
(4610, '3404370139406', 'SETO KURNIAWAN', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1986-05-29', 6, 10, '1', '0000-00-00 00:00:00'),
(4611, '3404370139506', 'SRI HARYANTO', 0, 'Laki - Lak', 'SIDOREJO, PANGUKREJO', 0, 0, 0, 'SLEMAN', '1992-09-04', 6, 10, '1', '0000-00-00 00:00:00'),
(4612, '3404370139606', 'SULISTYO RAHMAN', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1980-04-15', 6, 10, '1', '0000-00-00 00:00:00'),
(4613, '3404370139706', 'SUNYONO', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1961-08-13', 6, 10, '1', '0000-00-00 00:00:00'),
(4614, '3404370139806', 'SURYADI', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1974-11-18', 6, 10, '1', '0000-00-00 00:00:00'),
(4615, '3404370139906', 'SURYADI', 0, 'Laki - Lak', 'TRITIS', 0, 0, 0, 'SLEMAN', '1989-02-07', 6, 10, '1', '0000-00-00 00:00:00'),
(4616, '3404370140006', 'SUYADI', 0, 'Laki - Lak', 'KALIURANG SELATAN', 0, 0, 0, 'SLEMAN', '1974-06-12', 6, 10, '1', '0000-00-00 00:00:00'),
(4617, '3404370140106', 'TARNA', 0, 'Laki - Lak', 'TRITIS', 0, 0, 0, 'SLEMAN', '1973-12-16', 6, 10, '1', '0000-00-00 00:00:00'),
(4618, '3404370140206', 'TEDI SUSWANTONO', 0, 'Laki - Lak', 'SIDOREJO, PANGUKREJO', 0, 0, 0, 'SLEMAN', '1993-07-14', 6, 10, '1', '0000-00-00 00:00:00'),
(4619, '3404370140306', 'TRI PURNAWAN', 0, 'Laki - Lak', 'KAPING, WONOKERTO, TURI', 0, 0, 0, 'SLEMAN', '1982-02-13', 6, 10, '1', '0000-00-00 00:00:00'),
(4620, '3404370140406', 'TUKIMUN', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1966-04-02', 6, 10, '1', '0000-00-00 00:00:00'),
(4621, '3404370140506', 'WAHYU PRABOWO', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1983-03-23', 6, 10, '1', '0000-00-00 00:00:00'),
(4622, '3404370140606', 'WALIJO', 0, 'Laki - Lak', 'KALIURANG BARAT', 0, 0, 0, 'SLEMAN', '1967-05-07', 6, 10, '1', '0000-00-00 00:00:00'),
(4623, '3404370140706', 'WINANTO', 0, 'Laki - Lak', 'KALIURANG SELATAN', 0, 0, 0, 'KLATEN', '1970-04-06', 6, 10, '1', '0000-00-00 00:00:00'),
(4624, '3404370140806', 'YAHYA PRIYONO LEKSONO GAYUH UTOMO', 0, 'Laki - Lak', 'KALIURANG TIMUR', 0, 0, 0, 'SLEMAN', '1976-07-10', 6, 10, '1', '0000-00-00 00:00:00'),
(4625, '3404370140906', 'YUNUS KURNIA RAHMAN', 0, 'Laki - Lak', 'KALIURANG BARAT, HARGOBINANGUN', 0, 0, 0, 'SLEMAN', '1987-02-21', 6, 10, '1', '0000-00-00 00:00:00'),
(4626, '3404380141007', 'ABIEYANTO', 0, 'Laki - Lak', 'NGALIYAN RT.06 RW.02 ', 0, 0, 0, 'GUNUNG KIDUL', '1982-12-12', 7, 4, '1', '0000-00-00 00:00:00'),
(4627, '3404380141123', 'ACHMAD TITIS HERMAWANTO', 0, 'Laki - Lak', 'JETAKAN 08 RT.04 RW.17', 0, 0, 0, 'SLEMAN', '1982-12-10', 23, 4, '1', '0000-00-00 00:00:00'),
(4628, '3404380141223', 'AGUS WIRANTO', 0, 'Laki - Lak', 'KALIDADAP RT.04 RW.20', 0, 0, 0, 'SLEMAN', '1977-06-03', 23, 4, '1', '0000-00-00 00:00:00'),
(4629, '3404380141307', 'ANDRE KURNIAWAN', 0, 'Laki - Lak', 'KRADENAN RT.04 RW.17', 0, 0, 0, 'SLEMAN', '1982-07-11', 7, 4, '1', '0000-00-00 00:00:00'),
(4630, '3404380141423', 'ANDRI GUNAWAN', 0, 'Laki - Lak', 'PONDOK KULON RT.02 RW.24 ', 0, 0, 0, 'YOGYAKARTA', '1982-06-19', 23, 4, '1', '0000-00-00 00:00:00'),
(4631, '3404380141505', 'ANTONIUS SUTIJO', 0, 'Laki - Lak', 'PEPEN RT.02 RW.01', 0, 0, 0, 'SLEMAN', '1972-01-30', 5, 4, '1', '0000-00-00 00:00:00'),
(4632, '3404380141623', 'ANTONIUS WINDRIYANTO', 0, 'Laki - Lak', 'KEMIRI RT.02 RW.07', 0, 0, 0, 'SLEMAN', '1983-05-06', 23, 4, '1', '0000-00-00 00:00:00'),
(4633, '3404380141723', 'BASUKI', 0, 'Laki - Lak', 'NGELOSARI RT.01 RW.10', 0, 0, 0, 'SLEMAN', '1983-05-25', 23, 4, '1', '0000-00-00 00:00:00'),
(4634, '3404380141823', 'BOIMIN', 0, 'Laki - Lak', 'PLEMBURAN GG. POKSAI NO.11 RT.01  RW.24 ', 0, 0, 0, 'SLEMAN', '1965-12-31', 23, 4, '1', '0000-00-00 00:00:00'),
(4635, '3404380141923', 'DADANG HERI PRASONGKO', 0, 'Laki - Lak', 'KALIWANGLU WETAN RT.01 RW.19', 0, 0, 0, 'SLEMAN', '1972-11-04', 23, 4, '1', '0000-00-00 00:00:00'),
(4636, '3404380142023', 'DANAR BUDIHARTO', 0, 'Laki - Lak', 'NGABEAN KULON RT.07 RW.36', 0, 0, 0, 'SLEMAN', '1976-11-29', 23, 4, '1', '0000-00-00 00:00:00'),
(4637, '3404380142123', 'DEKI SUSANTO', 0, 'Laki - Lak', 'BABADAN RT.01 RW.17 ', 0, 0, 0, 'SLEMAN', '1982-10-29', 23, 4, '1', '0000-00-00 00:00:00'),
(4638, '3404380142223', 'EKO INDARYONO', 0, 'Laki - Lak', 'SURYOWIJAYAN MJ I/377 ', 0, 0, 0, 'YOGYAKARTA', '1978-09-15', 23, 4, '1', '0000-00-00 00:00:00'),
(4639, '3404380142323', 'ENDANG SETYOWATI, SE', 0, 'Perempuan', 'NGABEAN KULON RT.07 RW.36', 0, 0, 0, 'SLEMAN', '0000-00-00', 23, 4, '1', '0000-00-00 00:00:00'),
(4640, '3404380142423', 'F.A. ANTON CONDRO K.', 0, 'Laki - Lak', 'GENDENG GK V/493 RT.66 RW.17', 0, 0, 0, 'YOGYAKARTA', '1977-03-20', 23, 4, '1', '0000-00-00 00:00:00'),
(4641, '3404380142523', 'HERI PUJIANTA', 0, 'Laki - Lak', 'JLEGONGAN RT.1 RW.27', 0, 0, 0, 'SLEMAN', '1981-10-20', 23, 4, '1', '0000-00-00 00:00:00'),
(4642, '3404380142625', 'HERMAN PRIYO ANGGORO, S.SI', 0, 'Laki - Lak', 'JL. CIK DI TIRO 5 GK V/365', 0, 0, 0, 'YOGYAKARTA', '1983-05-10', 25, 4, '1', '0000-00-00 00:00:00'),
(4643, '3404380142706', 'INDRATNO', 0, 'Laki - Lak', 'PUGERAN RT.05 RW.02', 0, 0, 0, 'YOGYAKAARTA', '1971-08-14', 6, 4, '1', '0000-00-00 00:00:00'),
(4644, '3404380142823', 'JOKO SULISTIYANTO', 0, 'Laki - Lak', 'KRAPYAK JL. MAGELANG KM.12 RT.06 RW.19', 0, 0, 0, 'SLEMAN', '1967-03-03', 23, 4, '1', '0000-00-00 00:00:00'),
(4645, '3404380142902', 'LILIK ISWAHYUNI, S.PD', 0, 'Perempuan', 'KRATUAN RT.06 RW.06', 0, 0, 0, 'MAGETAN', '1977-07-13', 2, 4, '1', '0000-00-00 00:00:00'),
(4646, '3404380143024', 'MUBASIR', 0, 'Laki - Lak', 'PRUMPUNG RT.03 RW.28 ', 0, 0, 0, 'SLEMAN', '1966-04-14', 24, 4, '1', '0000-00-00 00:00:00'),
(4647, '3404380143105', 'NURCAHYA PRASETYA BUDI UTOMO, SE', 0, 'Laki - Lak', 'JOGOKERTEN RT.05 RW.13', 0, 0, 0, 'MADIUN', '1971-02-02', 5, 4, '1', '0000-00-00 00:00:00'),
(4648, '3404380143223', 'OCHBERTA KUNTADI, S.SOS', 0, 'Laki - Lak', 'COKROWIJAYAN RT.01 RW.18 ', 0, 0, 0, 'SLEMAN', '1974-02-16', 23, 4, '1', '0000-00-00 00:00:00'),
(4649, '3404380143307', 'PAULUS RADEN KURNIANTO', 0, 'Laki - Lak', 'PERUM AYODHYA CITRA NO.A19 JL.TAJEM BARU', 0, 0, 0, 'SURABAYA', '1973-02-05', 7, 4, '1', '0000-00-00 00:00:00'),
(4650, '3404380143423', 'PONIRAN', 0, 'Laki - Lak', 'BANJARHARJO RT.03 RW.15', 0, 0, 0, 'SLEMAN', '1962-09-04', 23, 4, '1', '0000-00-00 00:00:00'),
(4651, '3404380143523', 'PURWANTORO', 0, 'Laki - Lak', 'TAMBAKAN RT.01 RW.06', 0, 0, 0, 'MAGELANG', '1985-07-11', 23, 4, '1', '0000-00-00 00:00:00'),
(4652, '3404380143607', 'R. BAROTO HARTOTO, ST', 0, 'Laki - Lak', 'NGABEAN KULON RT.07 RW.36', 0, 0, 0, 'YOGYAKARTA', '1958-07-05', 7, 4, '1', '0000-00-00 00:00:00'),
(4653, '3404380143723', 'R. HARSONO', 0, 'Laki - Lak', 'JL. ONTOSENO 5 WIROBRAJAN RT.11 RW.03', 0, 0, 0, 'YOGYAKARTA', '1967-08-28', 23, 4, '1', '0000-00-00 00:00:00'),
(4654, '3404380143823', 'R. YOYOK CAHYOKO, SIP', 0, 'Laki - Lak', 'LOJAJAR RT.01 RW 01 ', 0, 0, 0, 'SLEMAN', '1979-03-22', 23, 4, '1', '0000-00-00 00:00:00'),
(4655, '3404380143923', 'RAMELAN', 0, 'Laki - Lak', 'DEMANGAN GK I/237B RT.04 RW.02 ', 0, 0, 0, 'SLEMAN', '1957-04-24', 23, 4, '1', '0000-00-00 00:00:00'),
(4656, '3404380144023', 'RIDWAN DIANFIAT', 0, 'Laki - Lak', 'SERANGAN NG II/44A RT.03 RW.01', 0, 0, 0, 'YOGYAKARTA', '1963-09-06', 23, 4, '1', '0000-00-00 00:00:00'),
(4657, '3404380144108', 'RR. KUSUMA WARDANI MEIGAWATI, SH', 0, 'Perempuan', 'NGABEAN KULON RT.07 RW.36', 0, 0, 0, 'SLEMAN', '1991-05-18', 8, 4, '1', '0000-00-00 00:00:00'),
(4658, '3404380144207', 'SARIMAN', 0, 'Laki - Lak', 'KARAKAN RT.01 RW.12 ', 0, 0, 0, 'SLEMAN', '1971-02-25', 7, 4, '1', '0000-00-00 00:00:00'),
(4659, '3404380144323', 'SLAMET ROFI\'I', 0, 'Laki - Lak', 'DAEN LOR RT.04 RW.04', 0, 0, 0, 'MAGELANG', '1971-01-07', 23, 4, '1', '0000-00-00 00:00:00'),
(4660, '3404380144423', 'SUDEWO', 0, 'Laki - Lak', 'TEMPURSARI RT.01 RW.27', 0, 0, 0, 'SLEMAN', '1982-07-20', 23, 4, '1', '0000-00-00 00:00:00'),
(4661, '3404380144523', 'SUDIYATNO', 0, 'Laki - Lak', 'KALIWANGLU KULON RT.03 RW.18', 0, 0, 0, 'SLEMAN', '1985-08-08', 23, 4, '1', '0000-00-00 00:00:00'),
(4662, '3404380144623', 'WIDI NUGRAHA', 0, 'Laki - Lak', 'POGUNG LOR RT.08 RW.47', 0, 0, 0, 'GUNUNG KIDUL', '1973-07-09', 23, 4, '1', '0000-00-00 00:00:00'),
(4663, '3404380144723', 'SUHARTONO', 0, 'Laki - Lak', 'MULUNGAN WETAN RT.07 RW.17 ', 0, 0, 0, 'SLEMAN', '1978-06-06', 23, 4, '1', '0000-00-00 00:00:00'),
(4664, '3404380144823', 'SUHARWANTO', 0, 'Laki - Lak', 'JOWAH RT.04 RW.13 ', 0, 0, 0, 'SLEMAN', '1978-05-20', 23, 4, '1', '0000-00-00 00:00:00'),
(4665, '3404380144911', 'SUKRIS', 0, 'Laki - Lak', 'NGELOSARI RT.01 RW.10', 0, 0, 0, 'SLEMAN', '1975-03-21', 11, 4, '1', '0000-00-00 00:00:00'),
(4666, '3404380145010', 'SULARDI', 0, 'Laki - Lak', 'JLEGONGAN RT.2 RW.27 ', 0, 0, 0, 'SLEMAN', '1966-11-05', 10, 4, '1', '0000-00-00 00:00:00'),
(4667, '3404380145102', 'SULISTIYANDARI, S.PD', 0, 'Perempuan', 'KALIWANGLU WETAN RT.01 RW.19', 0, 0, 0, 'SLEMAN', '1975-05-07', 2, 4, '1', '0000-00-00 00:00:00'),
(4668, '3404380145223', 'SUPARYADI', 0, 'Laki - Lak', 'TANJUNG RT.01', 0, 0, 0, 'BANTUL', '1980-12-25', 23, 4, '1', '0000-00-00 00:00:00'),
(4669, '3404380145323', 'SUPRIYADI', 0, 'Laki - Lak', 'KRATUAN RT.06 RW.06', 0, 0, 0, 'SLEMAN', '1976-08-28', 23, 4, '1', '0000-00-00 00:00:00'),
(4670, '3404380145423', 'SUPRIYADI', 0, 'Laki - Lak', 'DEMANGAN RT.02 RW.03', 0, 0, 0, 'SLEMAN', '1975-11-06', 23, 4, '1', '0000-00-00 00:00:00'),
(4671, '3404380145506', 'SURANTO', 0, 'Laki - Lak', 'NGELOSARI RT.01 RW.10 ', 0, 0, 0, 'SLEMAN', '1979-09-29', 6, 4, '1', '0000-00-00 00:00:00'),
(4672, '3404380145623', 'SUWARDIYONO', 0, 'Laki - Lak', 'DUSUN TURI', 0, 0, 0, 'SLEMAN', '1957-12-15', 23, 4, '1', '0000-00-00 00:00:00'),
(4673, '3404380145723', 'TRI WISNU ADJIWIBOWO', 0, 'Laki - Lak', 'KLEBENGAN CT 8/A1 RT.09 RW.02', 0, 0, 0, 'YOGYAKARTA', '1976-10-26', 23, 4, '1', '0000-00-00 00:00:00'),
(4674, '3404380145807', 'WASIRUN', 0, 'Laki - Lak', 'BANTENG', 0, 0, 0, 'PURBALINGGA', '1979-06-05', 7, 4, '1', '0000-00-00 00:00:00'),
(4675, '3404380145923', 'WAWAN INDIYANTO', 0, 'Laki - Lak', 'LOSARI RT.01 RW.10 ', 0, 0, 0, 'YOGYAKARTA', '1967-02-03', 23, 4, '1', '0000-00-00 00:00:00'),
(4676, '3404380146023', 'WIDARTO', 0, 'Laki - Lak', 'KEBON AGUNG RT.01 RW.30 ', 0, 0, 0, 'SLEMAN', '1975-07-20', 23, 4, '1', '0000-00-00 00:00:00'),
(4677, '3404380146123', 'YOHANES SUKISNO', 0, 'Laki - Lak', 'PAGERAN RT.06 RW.26', 0, 0, 0, 'SLEMAN', '1975-09-06', 23, 4, '1', '0000-00-00 00:00:00'),
(4678, '3404380146223', 'YULIAN TRI NUGROHO', 0, 'Laki - Lak', 'MODALAN RT.05 RW.46 ', 0, 0, 0, 'BANTUL', '1981-07-30', 23, 4, '1', '0000-00-00 00:00:00'),
(4679, '3404380146323', 'YULIANTO EKO PRASETYO', 0, 'Laki - Lak', 'PURBONEGARAN GK V/1166 RT.49 RW.11 ', 0, 0, 0, 'YOGYAKARTA', '1986-07-07', 23, 4, '1', '0000-00-00 00:00:00'),
(4680, '3404380146407', 'ZUMEINI', 0, 'Laki - Lak', 'SEMBADA ASRI NO.64 RT.10 RW.34 CEBONGAN', 0, 0, 0, 'SLEMAN', '1980-05-06', 7, 4, '1', '0000-00-00 00:00:00'),
(4681, '3404390146523', 'AGUS SUSENO', 0, 'Laki - Lak', 'KARANG', 0, 0, 0, 'PONTIANAK', '1967-08-17', 23, 23, '1', '0000-00-00 00:00:00'),
(4682, '3404390146623', 'AHMAD RIYANTO', 0, 'Laki - Lak', 'PUCANGAN', 0, 0, 0, 'SLEMAN', '1963-05-04', 23, 23, '1', '0000-00-00 00:00:00'),
(4683, '3404390146723', 'ALAN YOGA PRATAMA', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1995-02-26', 23, 23, '1', '0000-00-00 00:00:00'),
(4684, '3404390146823', 'ANDI HARTONO', 0, 'Laki - Lak', 'KEMASAN', 0, 0, 0, 'SLEMAN', '1989-01-08', 23, 23, '1', '0000-00-00 00:00:00'),
(4685, '3404390146923', 'ANDI HARYANTO', 0, 'Laki - Lak', 'PONDOK I', 0, 0, 0, 'SLEMAN', '1979-12-05', 23, 23, '1', '0000-00-00 00:00:00'),
(4686, '3404390147023', 'ANTON SUDARTO', 0, 'Laki - Lak', 'GIYAN', 0, 0, 0, 'SLEMAN', '1977-10-06', 23, 23, '1', '0000-00-00 00:00:00'),
(4687, '3404390147123', 'ANWAR SISWANTO', 0, 'Laki - Lak', 'JANGKANG', 0, 0, 0, 'SLEMAN', '1958-11-24', 23, 23, '1', '0000-00-00 00:00:00'),
(4688, '3404390147223', 'ARDI WIRMAN', 0, 'Laki - Lak', 'GANJURAN', 0, 0, 0, 'PADANG', '1970-12-31', 23, 23, '1', '0000-00-00 00:00:00'),
(4689, '3404390147307', 'BAMBANG SUPRIYANTO', 0, 'Laki - Lak', 'WONONTORO', 0, 0, 0, 'SLEMAN', '1971-11-01', 7, 23, '1', '0000-00-00 00:00:00'),
(4690, '3404390147423', 'BAYU DWI ANTORO', 0, 'Laki - Lak', 'KLANCINGAN', 0, 0, 0, 'MAGELANG', '1982-12-22', 23, 23, '1', '0000-00-00 00:00:00'),
(4691, '3404390147523', 'BIBIT SANTOSO', 0, 'Laki - Lak', 'KLANCINGAN', 0, 0, 0, 'SLEMAN', '1958-08-18', 23, 23, '1', '0000-00-00 00:00:00'),
(4692, '3404390147623', 'BUDI PURNOMO', 0, 'Laki - Lak', 'PUCANGAN', 0, 0, 0, 'SLEMAN', '1978-11-11', 23, 23, '1', '0000-00-00 00:00:00'),
(4693, '3404390147723', 'DARYANTO', 0, 'Laki - Lak', 'JANGKANG', 0, 0, 0, 'SLEMAN', '1974-01-10', 23, 23, '1', '0000-00-00 00:00:00'),
(4694, '3404390147823', 'DARYANTO', 0, 'Laki - Lak', 'NGEMPLAK ASEM', 0, 0, 0, 'KLATEN', '1978-06-08', 23, 23, '1', '0000-00-00 00:00:00'),
(4695, '3404390147923', 'DIDIK IRFAN SANTOSO', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1980-05-02', 23, 23, '1', '0000-00-00 00:00:00'),
(4696, '3404390148023', 'EDY HARYANTO', 0, 'Laki - Lak', 'GANJURAN', 0, 0, 0, 'SLEMAN', '1979-01-08', 23, 23, '1', '0000-00-00 00:00:00'),
(4697, '3404390148113', 'ETTY WINARNI', 0, 'Perempuan', 'KEMASAN', 0, 0, 0, 'SLEMAN', '1983-03-08', 13, 23, '1', '0000-00-00 00:00:00'),
(4698, '3404390148223', 'FAJAR CAHYONO', 0, 'Laki - Lak', 'KLANCINGAN', 0, 0, 0, 'GROBOGAN', '1981-10-23', 23, 23, '1', '0000-00-00 00:00:00'),
(4699, '3404390148323', 'GIMAN HS', 0, 'Laki - Lak', 'KLANCINGAN', 0, 0, 0, 'SLEMAN', '1957-08-01', 23, 23, '1', '0000-00-00 00:00:00'),
(4700, '3404390148423', 'HARNO EDI PURNAMA', 0, 'Laki - Lak', 'KEMASAN', 0, 0, 0, 'SLEMAN', '1980-04-17', 23, 23, '1', '0000-00-00 00:00:00'),
(4701, '3404390148523', 'HENI YUNTARTI', 0, 'Perempuan', 'DALEM', 0, 0, 0, 'SLEMAN', '1982-06-15', 23, 23, '1', '0000-00-00 00:00:00'),
(4702, '3404390148623', 'HERI WINARNO', 0, 'Laki - Lak', 'JETIS', 0, 0, 0, 'SLEMAN', '1977-01-20', 23, 23, '1', '0000-00-00 00:00:00'),
(4703, '3404390148723', 'HERU SUSILO', 0, 'Laki - Lak', 'GANJURAN', 0, 0, 0, 'SLEMAN', '1975-12-09', 23, 23, '1', '0000-00-00 00:00:00'),
(4704, '3404390148823', 'JUMALI WIDODO', 0, 'Laki - Lak', 'KEMASAN', 0, 0, 0, 'SLEMAN', '1980-12-08', 23, 23, '1', '0000-00-00 00:00:00'),
(4705, '3404390148923', 'KAWECO TUGAS WIBOWO', 0, 'Laki - Lak', 'NGALIAN', 0, 0, 0, 'SLEMAN', '1965-01-30', 23, 23, '1', '0000-00-00 00:00:00'),
(4706, '3404390149023', 'L. ISDIYANA', 0, 'Laki - Lak', 'KALIJERUK I', 0, 0, 0, 'SLEMAN', '1962-07-20', 23, 23, '1', '0000-00-00 00:00:00'),
(4707, '3404390149107', 'LILIK HENDRAJAYA', 0, 'Laki - Lak', 'KLANCINGAN', 0, 0, 0, 'SLEMAN', '1979-09-29', 7, 23, '1', '0000-00-00 00:00:00'),
(4708, '3404390149223', 'LINGGA GUPITO', 0, 'Laki - Lak', 'KEMASAN', 0, 0, 0, 'KLATEN', '1989-09-22', 23, 23, '1', '0000-00-00 00:00:00'),
(4709, '3404390149313', 'M. RIFKI ARDI WIRATAMA', 0, 'Laki - Lak', 'CATURBINANGUN', 0, 0, 0, 'SLEMAN', '1993-08-30', 13, 23, '1', '0000-00-00 00:00:00'),
(4710, '3404390149423', 'MARYOTO', 0, 'Laki - Lak', 'PONDOK I', 0, 0, 0, 'SLEMAN', '1983-05-13', 23, 23, '1', '0000-00-00 00:00:00'),
(4711, '3404390149523', 'PANGGIH TRIYONO', 0, 'Laki - Lak', 'SAREN', 0, 0, 0, 'KENDAL', '1977-02-14', 23, 23, '1', '0000-00-00 00:00:00'),
(4712, '3404390149623', 'PRABOWO', 0, 'Laki - Lak', 'PONDOK I', 0, 0, 0, 'SLEMAN', '1979-03-16', 23, 23, '1', '0000-00-00 00:00:00'),
(4713, '3404390149723', 'PURWONO', 0, 'Laki - Lak', 'KALIJERUK I', 0, 0, 0, 'SLEMAN', '1981-01-03', 23, 23, '1', '0000-00-00 00:00:00'),
(4714, '3404390149823', 'RISMANTO', 0, 'Laki - Lak', 'GANJURAN', 0, 0, 0, 'SLEMAN', '1975-07-28', 23, 23, '1', '0000-00-00 00:00:00'),
(4715, '3404390149902', 'SARKOWI', 0, 'Laki - Lak', 'PUCANGAN', 0, 0, 0, 'SLEMAN', '1960-07-06', 2, 23, '1', '0000-00-00 00:00:00'),
(4716, '3404390150023', 'SITI MEY SARAH', 0, 'Perempuan', 'GANJURAN', 0, 0, 0, 'MAGELANG', '1977-05-23', 23, 23, '1', '0000-00-00 00:00:00'),
(4717, '3404390150123', 'SUHARTONO, SH', 0, 'Laki - Lak', 'KEMASAN', 0, 0, 0, 'MAKASAR', '1968-01-09', 23, 23, '1', '0000-00-00 00:00:00'),
(4718, '3404390150223', 'SULARTO', 0, 'Laki - Lak', 'JIMAT', 0, 0, 0, 'SLEMAN', '1965-10-14', 23, 23, '1', '0000-00-00 00:00:00'),
(4719, '3404390150323', 'SUMADI', 0, 'Laki - Lak', 'KEMASAN', 0, 0, 0, 'SLEMAN', '1968-08-08', 23, 23, '1', '0000-00-00 00:00:00'),
(4720, '3404390150423', 'SUNARDI', 0, 'Laki - Lak', 'KLANCINGAN', 0, 0, 0, 'SLEMAN', '1974-02-01', 23, 23, '1', '0000-00-00 00:00:00'),
(4721, '3404390150523', 'SUPARMAN', 0, 'Laki - Lak', 'PONDOK II', 0, 0, 0, 'SLEMAN', '1974-02-12', 23, 23, '1', '0000-00-00 00:00:00'),
(4722, '3404390150623', 'SUTRISTIANA', 0, 'Laki - Lak', 'KEMASAN', 0, 0, 0, 'KLATEN', '1966-01-01', 23, 23, '1', '0000-00-00 00:00:00'),
(4723, '3404390150723', 'SUWARDI', 0, 'Laki - Lak', 'KLANCINGAN', 0, 0, 0, 'SLEMAN', '1971-07-21', 23, 23, '1', '0000-00-00 00:00:00'),
(4724, '3404390150823', 'TRI WIDODO', 0, 'Laki - Lak', 'KORIPAN', 0, 0, 0, 'SLEMAN', '1989-01-02', 23, 23, '1', '0000-00-00 00:00:00'),
(4725, '3404390150923', 'TUGIMAN', 0, 'Laki - Lak', 'KARANG', 0, 0, 0, 'SLEMAN', '1965-08-16', 23, 23, '1', '0000-00-00 00:00:00'),
(4726, '3404390151023', 'WALUYO', 0, 'Laki - Lak', 'PONDOK I', 0, 0, 0, 'SLEMAN', '1979-08-12', 23, 23, '1', '0000-00-00 00:00:00'),
(4727, '3404390151123', 'WIYADI', 0, 'Laki - Lak', 'GANJURAN', 0, 0, 0, 'SLEMAN', '1971-06-15', 23, 23, '1', '0000-00-00 00:00:00'),
(4728, '3404390151223', 'YULSIDIK ANANG WIBOWO', 0, 'Laki - Lak', 'DALEM', 0, 0, 0, 'SLEMAN', '1982-07-04', 23, 23, '1', '0000-00-00 00:00:00'),
(4729, '340440015606', 'ANDRY WIDYANTARA', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1978-04-02', 6, 18, '1', '0000-00-00 00:00:00'),
(4730, '340440015706', 'ARIS NURYADI', 0, 'Laki - Lak', 'KEMIRI RT 05 RW 09', 0, 0, 0, 'SLEMAN', '1993-09-07', 6, 18, '1', '0000-00-00 00:00:00'),
(4731, '340440015823', 'B. BAMBANG WINDARTO', 0, 'Laki - Lak', 'KARANGJATI MT 01/ 294', 0, 0, 0, 'YOGYAKARTA', '1971-04-08', 23, 18, '1', '0000-00-00 00:00:00'),
(4732, '340440015906', 'BAGUS TRI HANDOKO', 0, 'Laki - Lak', 'MANGGUNGSARI RT 03 RW 15', 0, 0, 0, 'SLEMAN', '1983-02-19', 6, 18, '1', '0000-00-00 00:00:00'),
(4733, '340440016006', 'BAMBANG AMBAR JATI', 0, 'Laki - Lak', 'JL TURGO KM 4 CANDI RT 05 RW 13', 0, 0, 0, 'SLEMAN', '1973-08-30', 6, 18, '1', '0000-00-00 00:00:00'),
(4734, '340440016123', 'BEJO', 0, 'Laki - Lak', 'PANCOH RT 03 RW 12', 0, 0, 0, 'SLEMAN', '1958-07-01', 23, 18, '1', '0000-00-00 00:00:00'),
(4735, '340440016206', 'DARMANTO', 0, 'Laki - Lak', 'MANGGUNGSARI RT 03 RW 15', 0, 0, 0, 'SLEMAN', '1975-04-08', 6, 18, '1', '0000-00-00 00:00:00'),
(4736, '340440016306', 'DWI HARTANTO', 0, 'Laki - Lak', 'JL TURGO KM 4 CANDI RT 05 RW 13 ', 0, 0, 0, 'SLEMAN', '1981-09-05', 6, 18, '1', '0000-00-00 00:00:00'),
(4737, '340440016406', 'DWI SETYONO', 0, 'Laki - Lak', 'JL TURGO KM 4 CANDI RT 04 RW 13', 0, 0, 0, 'SLEMAN', '1981-05-16', 6, 18, '1', '0000-00-00 00:00:00'),
(4738, '340440016506', 'EKO ALIFFUDIN', 0, 'Laki - Lak', 'SOPRAYAN RT 05 RW 14', 0, 0, 0, 'SLEMAN', '1992-10-20', 6, 18, '1', '0000-00-00 00:00:00'),
(4739, '340440016606', 'GIMIN', 0, 'Laki - Lak', 'KEMIRI RT 04 RW 08', 0, 0, 0, 'SLEMAN', '1984-01-26', 6, 18, '1', '0000-00-00 00:00:00'),
(4740, '340440016706', 'GIYATNO', 0, 'Laki - Lak', 'NGANDONG RT 03 RW 01', 0, 0, 0, 'SLEMAN', '1991-11-11', 6, 18, '1', '0000-00-00 00:00:00'),
(4741, '340440016806', 'HARJANTO', 0, 'Laki - Lak', 'PANCOH RT 03 RW 12', 0, 0, 0, 'SLEMAN', '1984-10-18', 6, 18, '1', '0000-00-00 00:00:00'),
(4742, '340440016906', 'JOKO TRIYONO', 0, 'Laki - Lak', 'TEGALPANGGUNG', 0, 0, 0, 'SLEMAN', '1979-07-23', 6, 18, '1', '0000-00-00 00:00:00'),
(4743, '340440017006', 'LICHA ANGGA BAGUS DANANJAYA', 0, 'Laki - Lak', 'PANCOH RT 03 RW 12', 0, 0, 0, 'SLEMAN', '1987-10-15', 6, 18, '1', '0000-00-00 00:00:00'),
(4744, '340440017115', 'MARSID', 0, 'Laki - Lak', 'PLAOSAN RT 03 RW 20', 0, 0, 0, 'SLEMAN', '1972-10-10', 15, 18, '1', '0000-00-00 00:00:00'),
(4745, '340440017206', 'MAWAN TRIATMAKA', 0, 'Laki - Lak', 'MANGGUNGSARI RT 03 RW 15', 0, 0, 0, 'SLEMAN', '1986-02-17', 6, 18, '1', '0000-00-00 00:00:00'),
(4746, '340440017306', 'NGATIJO', 0, 'Laki - Lak', 'KEMIRIKEBO RT 04 RW 08', 0, 0, 0, 'SLEMAN', '1979-07-09', 6, 18, '1', '0000-00-00 00:00:00'),
(4747, '340440017406', 'PARJANA', 0, 'Laki - Lak', 'MANGGUNGSARI RT 03 RW 15', 0, 0, 0, 'SLEMAN', '1976-03-07', 6, 18, '1', '0000-00-00 00:00:00'),
(4748, '340440017506', 'PRIYANTO', 0, 'Laki - Lak', 'NGANDONG RT 02 RW 01', 0, 0, 0, 'SLEMAN', '1982-05-04', 6, 18, '1', '0000-00-00 00:00:00'),
(4749, '340440017606', 'RB. ARI KRISTANTO WIBOWO', 0, 'Laki - Lak', 'TAWANGREJO', 0, 0, 0, 'SLEMAN', '1984-04-03', 6, 18, '1', '0000-00-00 00:00:00'),
(4750, '340440017706', 'RUWIT MULYADI', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1993-04-30', 6, 18, '1', '0000-00-00 00:00:00'),
(4751, '340440017806', 'SARJONO', 0, 'Laki - Lak', 'JINEMAN RT 04 RW 06', 0, 0, 0, 'SLEMAN', '1973-03-15', 6, 18, '1', '0000-00-00 00:00:00'),
(4752, '340440017906', 'SLAMET NUGROHO', 0, 'Laki - Lak', 'NGANDONG RT 03 RW 01', 0, 0, 0, 'SLEMAN', '1983-05-25', 6, 18, '1', '0000-00-00 00:00:00'),
(4753, '340440018006', 'SUDARMANA', 0, 'Laki - Lak', 'NGANDONG RT 03 RW 01', 0, 0, 0, 'SLEMAN', '1970-04-23', 6, 18, '1', '0000-00-00 00:00:00'),
(4754, '340440018106', 'SUDARWANTO', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1983-01-27', 6, 18, '1', '0000-00-00 00:00:00'),
(4755, '340440018206', 'SUMADIYONO', 0, 'Laki - Lak', 'NGANDONG RT 03 RW 01', 0, 0, 0, 'SLEMAN', '1974-08-24', 6, 18, '1', '0000-00-00 00:00:00'),
(4756, '340440018306', 'SUPANTO', 0, 'Laki - Lak', 'NGANDONG RT 03 RW 01', 0, 0, 0, 'SLEMAN', '1981-09-05', 6, 18, '1', '0000-00-00 00:00:00'),
(4757, '340440018406', 'SUPRIYADI', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1977-09-27', 6, 18, '1', '0000-00-00 00:00:00'),
(4758, '340440018506', 'SUPRIYADI NOTO WIYONO', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1975-05-16', 6, 18, '1', '0000-00-00 00:00:00'),
(4759, '340440018602', 'SURMALAHADI', 0, 'Laki - Lak', 'JL TURGO KM 4 CANDI RT 07 RW 14', 0, 0, 0, 'SLEMAN', '1964-08-07', 2, 18, '1', '0000-00-00 00:00:00'),
(4760, '340440018706', 'SURONO', 0, 'Laki - Lak', 'PANCOH RT 04 RW 12', 0, 0, 0, 'SLEMAN', '1966-07-15', 6, 18, '1', '0000-00-00 00:00:00'),
(4761, '340440018806', 'SUROTO', 0, 'Laki - Lak', 'SUKOREJO RT 03 RW 10', 0, 0, 0, 'SLEMAN', '1984-10-20', 6, 18, '1', '0000-00-00 00:00:00'),
(4762, '340440018906', 'SUTRISNO', 0, 'Laki - Lak', 'NGANDONG RT 01 RW 01', 0, 0, 0, 'BLORA', '1975-04-29', 6, 18, '1', '0000-00-00 00:00:00'),
(4763, '340440019006', 'TATAG TRI WAHYUDI', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1977-05-23', 6, 18, '1', '0000-00-00 00:00:00'),
(4764, '340440019106', 'TEGUH RAHAYU', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1976-07-31', 6, 18, '1', '0000-00-00 00:00:00'),
(4765, '340440019206', 'TRIYONO', 0, 'Laki - Lak', 'TEGALPANGGUNG RT 02 RW 09', 0, 0, 0, 'SLEMAN', '1984-06-16', 6, 18, '1', '0000-00-00 00:00:00'),
(4766, '340440019306', 'WAHYU PURNAMA SIDDIQ', 0, 'Laki - Lak', 'PANCOH RT 03 RW 12', 0, 0, 0, 'SLEMAN', '1989-05-04', 6, 18, '1', '0000-00-00 00:00:00'),
(4767, '340440019406', 'WARSIDI', 0, 'Laki - Lak', 'PANCOH RT 02 RW 11', 0, 0, 0, 'SLEMAN', '1971-07-05', 6, 18, '1', '0000-00-00 00:00:00'),
(4768, '340440019506', 'WICAKNO HADI WIDODO', 0, 'Laki - Lak', 'JL PALAGAN TENTARA PELAJAR KM 9 RT 03 RW 08 WONOREJO', 0, 0, 0, 'SLEMAN', '1966-12-06', 6, 18, '1', '0000-00-00 00:00:00'),
(4769, '340440019606', 'WIDIANTORO', 0, 'Laki - Lak', 'JL TURGO KM 4 CANDI RT 05 RW 13', 0, 0, 0, 'SLEMAN', '1974-03-20', 6, 18, '1', '0000-00-00 00:00:00'),
(4770, '340440019723', 'WIHANDONO', 0, 'Laki - Lak', 'JL PALAGAN TENTARA PELAJAR KM 9,8 RT 04 RW 08 WONOREJO', 0, 0, 0, 'SLEMAN', '1976-11-19', 23, 18, '1', '0000-00-00 00:00:00'),
(4771, '340440019802', 'WIJANGSOKNO', 0, 'Laki - Lak', 'JL PALAGAN TENTARA PELAJAR KM 9 RT 03 RW 08 WONOREJO', 0, 0, 0, 'SLEMAN', '1974-09-27', 2, 18, '1', '0000-00-00 00:00:00'),
(4772, '340440019906', 'WINARTO', 0, 'Laki - Lak', 'PANCOH RT 04 RW 12', 0, 0, 0, 'SLEMAN', '1991-02-28', 6, 18, '1', '0000-00-00 00:00:00'),
(4773, '340440020006', 'WIRA PRATOMO', 0, 'Laki - Lak', 'PLAOSAN RT 03 RW 20', 0, 0, 0, 'SLEMAN', '1983-07-15', 6, 18, '1', '0000-00-00 00:00:00'),
(4774, '340450020113', 'AGUS SETIAWAN', 0, 'Laki - Lak', 'TEGALSARI RT 22', 0, 0, 0, 'SLEMAN', '1982-08-31', 13, 14, '1', '0000-00-00 00:00:00'),
(4775, '340450020213', 'AHMAD SABIQ PRAPTONO', 0, 'Laki - Lak', 'KRANDON RT/RW 01/06', 0, 0, 0, 'YOGYAKARTA', '1991-06-14', 13, 14, '1', '0000-00-00 00:00:00'),
(4776, '340450020313', 'DANIEK HENDARTO', 0, 'Laki - Lak', 'GONDANG LEGI, 01/03, ', 0, 0, 0, 'SLEMAN', '1983-03-30', 13, 14, '1', '0000-00-00 00:00:00'),
(4777, '340450020413', 'DIAN JATI A.M', 0, 'Laki - Lak', 'PERUM KANISIUS D 3', 0, 0, 0, 'SLEMAN', '1985-01-11', 13, 14, '1', '0000-00-00 00:00:00'),
(4778, '340450020513', 'ISMAIL JUNDULLAH', 0, 'Laki - Lak', 'JL. KALIURANG KM 5, KARANGWUNI 05/02', 0, 0, 0, 'SEMARANG', '1989-12-11', 13, 14, '1', '0000-00-00 00:00:00'),
(4779, '340450020613', 'JAYENG TRIMARTANA', 0, 'Laki - Lak', 'RT/RW 04/20, TAPANSARI', 0, 0, 0, 'SLEMAN', '1969-03-10', 13, 14, '1', '0000-00-00 00:00:00'),
(4780, '340450020713', 'SURANTO', 0, 'Laki - Lak', 'WONOGIRI RT 007', 0, 0, 0, 'SLEMAN', '1961-01-13', 13, 14, '1', '0000-00-00 00:00:00'),
(4781, '340450020813', 'SYARIF NUR ROCHMAT', 0, 'Laki - Lak', 'BOYONG', 0, 0, 0, 'SLEMAN', '1997-02-04', 13, 14, '1', '0000-00-00 00:00:00'),
(4782, '340450020913', 'WAHID NUROHMAN', 0, 'Laki - Lak', 'BOYONG RT/RW 01/10', 0, 0, 0, 'SLEMAN', '1994-06-04', 13, 14, '1', '0000-00-00 00:00:00'),
(4783, '340450021013', 'WIDAYAT', 0, 'Laki - Lak', 'JETISAN', 0, 0, 0, 'SLEMAN', '1980-01-10', 13, 14, '1', '0000-00-00 00:00:00'),
(4784, '340450021113', 'ZAHIQ DHUHRI', 0, 'Laki - Lak', 'KRANDON RT/RW 01/06', 0, 0, 0, 'YOGYAKARTA', '1997-09-16', 13, 14, '1', '0000-00-00 00:00:00'),
(4785, '340450151313', 'AKBAR DWI KURNIAWAN', 0, 'Laki - Lak', 'JL. KALIURANG KM 5, GG.MEGATRUH NO. 11, ', 0, 0, 0, 'SLEMAN', '1989-06-21', 13, 14, '1', '0000-00-00 00:00:00'),
(4786, '340450151414', 'WAHYU DWIHANTORO', 0, 'Laki - Lak', 'TEGALSARI RT 019', 0, 0, 0, 'SLEMAN', '1969-01-16', 13, 14, '1', '0000-00-00 00:00:00');
INSERT INTO `tblrelawan` (`idtblrelawan`, `no_induk`, `nama_relawan`, `nik`, `jenis_kelamin`, `alamat`, `kelurahan`, `kecamatan`, `desa`, `tempat_lahir`, `tgl_lahir`, `kecakapan`, `komunitas`, `create_user`, `create_time`) VALUES
(4787, '340450151515', 'HERU WIDODO', 0, 'Laki - Lak', 'PAKEMGEDE RT 032', 0, 0, 0, 'SLEMAN', '1980-11-11', 13, 14, '1', '0000-00-00 00:00:00'),
(4788, '340450151616', 'WINARDI', 0, 'Laki - Lak', 'PAKEMTEGAL RT 037', 0, 0, 0, 'SLEMAN', '1973-09-23', 13, 14, '1', '0000-00-00 00:00:00'),
(4789, '340450151717', 'YUDIANTOKO', 0, 'Laki - Lak', 'PAKEMGEDE RT 033', 0, 0, 0, 'SLEMAN', '1975-09-10', 13, 14, '1', '0000-00-00 00:00:00'),
(4790, '340450151818', 'YUANTO', 0, 'Laki - Lak', 'PAKEMGEDE RT 034', 0, 0, 0, 'SLEMAN', '1975-08-31', 13, 14, '1', '0000-00-00 00:00:00'),
(4791, '340450151919', 'SIGIT NURYANTO', 0, 'Laki - Lak', 'KEMPUT RT/RW 002/022', 0, 0, 0, 'SLEMAN', '1985-11-28', 13, 14, '1', '0000-00-00 00:00:00'),
(4792, '340450152020', 'WINDARTO, ST', 0, 'Laki - Lak', 'KEMPUT RT/RW 001/022', 0, 0, 0, 'SLEMAN', '1976-01-12', 13, 14, '1', '0000-00-00 00:00:00'),
(4793, '340450152121', 'AGUS SUPARWANTO', 0, 'Laki - Lak', 'PALEM RT/RW 004/008', 0, 0, 0, 'SLEMAN', '1994-08-05', 13, 14, '1', '0000-00-00 00:00:00'),
(4794, '340450152222', 'SUGENG SUDARNO', 0, 'Laki - Lak', 'GAMBIRAN RT 031', 0, 0, 0, 'SLEMAN', '1964-02-10', 13, 14, '1', '0000-00-00 00:00:00'),
(4795, '340450152323', 'AGUNG SUMARWAN', 0, 'Laki - Lak', 'PAKEMWINANGUN RT 047', 0, 0, 0, 'SLEMAN', '1967-07-16', 13, 14, '1', '0000-00-00 00:00:00'),
(4796, '340450152424', 'ERWAN APRIANTA', 0, 'Laki - Lak', 'TEGALSARI RT 019', 0, 0, 0, 'SLEMAN', '1996-04-25', 13, 14, '1', '0000-00-00 00:00:00'),
(4797, '340450152525', 'TRI SAPUTRO', 0, 'Laki - Lak', 'TROJAYAN RT/RW 002/004', 0, 0, 0, 'SLEMAN', '1974-04-01', 13, 14, '1', '0000-00-00 00:00:00'),
(4798, '340450152626', 'FASTABIQ AHMAD', 0, 'Laki - Lak', 'JUMENENG KIDUL RT/RW 001/019', 0, 0, 0, 'BANTUL', '1993-06-22', 13, 14, '1', '0000-00-00 00:00:00'),
(4799, '340450152727', 'SAHLAN HASBI', 0, 'Laki - Lak', 'POKOH', 0, 0, 0, 'LAMPUNG', '1962-07-23', 13, 14, '1', '0000-00-00 00:00:00'),
(4800, '340460021223', 'AHMAT MUKAROM', 0, 'Laki - Lak', 'KREBET RT 02/01 ', 0, 0, 0, 'SLEMAN', '1976-04-19', 23, 12, '1', '0000-00-00 00:00:00'),
(4801, '340460021307', 'ANDI HARI NUGROHO', 0, 'Laki - Lak', 'NOMPOREJO RT 04 RW 27 ', 0, 0, 0, 'YOGYAKARTA', '1979-11-27', 7, 12, '1', '0000-00-00 00:00:00'),
(4802, '340460021410', 'DWI PRIYANTI', 0, 'Perempuan', 'JAPLAKSARI', 0, 0, 0, 'SLEMAN', '1967-01-28', 10, 12, '1', '0000-00-00 00:00:00'),
(4803, '340460021506', 'FIFIN HARSONO', 0, 'Laki - Lak', 'BROMONILAN RT 007 / 003', 0, 0, 0, 'SLEMAN', '1979-10-31', 6, 12, '1', '0000-00-00 00:00:00'),
(4804, '340460021623', 'IBNU PUSMIARNA', 0, 'Laki - Lak', 'SIDOREJO RT 03 RW 02', 0, 0, 0, 'SLEMAN', '1975-08-07', 23, 12, '1', '0000-00-00 00:00:00'),
(4805, '340460021707', 'JOKO SETIONO', 0, 'Laki - Lak', 'PANJEN WEDOMARTANI G. PANJI 02 RT 07/28', 0, 0, 0, 'SLEMAN', '1984-02-06', 7, 12, '1', '0000-00-00 00:00:00'),
(4806, '340460021806', 'JOKO SUWITO ', 0, 'Laki - Lak', 'KALIWARU RT 04/02 ', 0, 0, 0, 'SRIKATON', '1981-01-10', 6, 12, '1', '0000-00-00 00:00:00'),
(4807, '340460021910', 'MATORI', 0, 'Laki - Lak', 'SORASAN RT 02/24 ', 0, 0, 0, 'SLEMAN', '1971-06-03', 10, 12, '1', '0000-00-00 00:00:00'),
(4808, '340460022006', 'MUSIMAN', 0, 'Laki - Lak', 'BULUSAWIT RT 07 RW 04 ', 0, 0, 0, 'SLEMAN', '1966-03-03', 6, 12, '1', '0000-00-00 00:00:00'),
(4809, '340460022107', 'NGATIMAN', 0, 'Laki - Lak', 'BROMONILAN', 0, 0, 0, 'SLEMAN', '1973-04-18', 7, 12, '1', '0000-00-00 00:00:00'),
(4810, '340460022206', 'NURYANTO', 0, 'Laki - Lak', 'NGEMPLAK II ', 0, 0, 0, 'SLEMAN', '1987-06-12', 6, 12, '1', '0000-00-00 00:00:00'),
(4811, '340460022306', 'PARDIONO', 0, 'Laki - Lak', 'SOEROGEDUG LOR 2/34', 0, 0, 0, 'SLEMAN', '1970-06-28', 6, 12, '1', '0000-00-00 00:00:00'),
(4812, '340460022423', 'SIGIT', 0, 'Laki - Lak', 'DENOKAN RT 05/02 ', 0, 0, 0, 'MAGELANG', '1984-12-25', 23, 12, '1', '0000-00-00 00:00:00'),
(4813, '340460022518', 'SUPRIYADI', 0, 'Laki - Lak', 'SINDON RT 02 /01 ', 0, 0, 0, 'SLEMAN', '1967-01-11', 18, 12, '1', '0000-00-00 00:00:00'),
(4814, '340460022623', 'SURADIYONO', 0, 'Laki - Lak', 'ROGOBANGSAN RT 04/04', 0, 0, 0, 'SLEMAN', '1954-09-15', 23, 12, '1', '0000-00-00 00:00:00'),
(4815, '340460022707', 'SUWANTO', 0, 'Laki - Lak', ' SRUNEN RT 02 RW 16', 0, 0, 0, 'SLEMAN', '1977-02-12', 7, 12, '1', '0000-00-00 00:00:00'),
(4816, '340460022818', 'TONI YUHANTA', 0, 'Laki - Lak', 'BROMONILAN RT 08/03 ', 0, 0, 0, 'SLEMAN', '1985-11-12', 18, 12, '1', '0000-00-00 00:00:00'),
(4817, '340460022923', 'TUWUH BAHRONI', 0, 'Laki - Lak', 'NGLARANG ', 0, 0, 0, 'SLEMAN', '1968-01-03', 23, 12, '1', '0000-00-00 00:00:00'),
(4818, '340460023023', 'YOGI BUDI RAHARJO', 0, 'Laki - Lak', 'SINGOSUTAN RT 10/42 ', 0, 0, 0, 'KARANGANYAR', '1982-01-21', 23, 12, '1', '0000-00-00 00:00:00'),
(4819, '340470023108', 'AGUS KELIK HENDRATNO. C', 0, 'Laki - Lak', 'CANGGAL 04 / 34', 0, 0, 0, 'SLEMAN', '1979-08-16', 8, 26, '1', '0000-00-00 00:00:00'),
(4820, '340470023208', 'AGUS YUNIARTO', 0, 'Laki - Lak', 'KALAKIJO 06 / 03', 0, 0, 0, 'SLEMAN', '1978-06-06', 8, 26, '1', '0000-00-00 00:00:00'),
(4821, '340470023308', 'AHMAD FAROZI', 0, 'Laki - Lak', 'PELAS 02 / 01', 0, 0, 0, 'MAGELANG', '1992-05-03', 8, 26, '1', '0000-00-00 00:00:00'),
(4822, '340470023408', 'AMRI ROFELLA. I. R', 0, 'Laki - Lak', 'KALAKIJO 08 / 03', 0, 0, 0, 'SLEMAN', '1990-07-03', 8, 26, '1', '0000-00-00 00:00:00'),
(4823, '340470023508', 'ANDRI SETIYAWAN', 0, 'Laki - Lak', 'REJODADI 03 / 28', 0, 0, 0, 'SLEMAN', '1983-09-17', 8, 26, '1', '0000-00-00 00:00:00'),
(4824, '340470023608', 'ANGGA NUR SANJAYA', 0, 'Laki - Lak', 'KADIROJO, 01 / 11', 0, 0, 0, 'SLEMAN', '1994-12-16', 8, 26, '1', '0000-00-00 00:00:00'),
(4825, '340470023708', 'ARI NUGROHO', 0, 'Laki - Lak', 'KALAKIJO 06 / 03', 0, 0, 0, 'SLEMAN', '1972-01-27', 8, 26, '1', '0000-00-00 00:00:00'),
(4826, '340470023808', 'ARI WIBOWO', 0, 'Laki - Lak', 'GADING KULON 3 / 20', 0, 0, 0, 'SLEMAN', '1977-12-07', 8, 26, '1', '0000-00-00 00:00:00'),
(4827, '340470023920', 'ERVIED, SE', 0, 'Laki - Lak', 'TEMULAWAK 11 / 38', 0, 0, 0, 'YOGYAKARTA', '1973-05-11', 20, 26, '1', '0000-00-00 00:00:00'),
(4828, '340470024008', 'HAGNI APRIANTO', 0, 'Laki - Lak', 'KALAKIJO 08 / 03', 0, 0, 0, 'SLEMAN', '1978-04-14', 8, 26, '1', '0000-00-00 00:00:00'),
(4829, '340470024108', 'LIESWANTO', 0, 'Laki - Lak', 'KADISONO 02 / 13', 0, 0, 0, 'SLEMAN', '1972-05-25', 8, 26, '1', '0000-00-00 00:00:00'),
(4830, '340470024208', 'MUDA EKA PRASETYA', 0, 'Laki - Lak', 'PANGGUNG 10 / 12', 0, 0, 0, 'UJUNG PANDANG', '1993-10-28', 8, 26, '1', '0000-00-00 00:00:00'),
(4831, '340470024308', 'RISBIANTORO', 0, 'Laki - Lak', 'KALAKIJO 06 / 03', 0, 0, 0, 'SLEMAN', '1978-05-17', 8, 26, '1', '0000-00-00 00:00:00'),
(4832, '340470024408', 'RISWANTO', 0, 'Laki - Lak', 'REJODADI 03 / 28', 0, 0, 0, 'SLEMAN', '1983-09-17', 8, 26, '1', '0000-00-00 00:00:00'),
(4833, '340470024508', 'SARWOKO', 0, 'Laki - Lak', 'KADISONO 02 / 13', 0, 0, 0, 'SLEMAN', '1973-12-27', 8, 26, '1', '0000-00-00 00:00:00'),
(4834, '340470024608', 'SLAMET SUGENG SUBAGYO', 0, 'Laki - Lak', 'BENING 06 / 21', 0, 0, 0, 'SLEMAN', '1982-06-12', 8, 26, '1', '0000-00-00 00:00:00'),
(4835, '340470024708', 'SUHARNO', 0, 'Laki - Lak', 'KALAKIJO 06 / 03', 0, 0, 0, 'SLEMAN', '1979-02-23', 8, 26, '1', '0000-00-00 00:00:00'),
(4836, '340470024808', 'WAHYU YUNIARTO', 0, 'Laki - Lak', 'REJODADI 04 / 28', 0, 0, 0, 'SLEMAN', '1997-06-12', 8, 26, '1', '0000-00-00 00:00:00'),
(4837, '340470024908', 'YUNAS SYAIFULLAH RAMADANI', 0, 'Laki - Lak', 'ASRAMA KODIM 0732', 0, 0, 0, 'DUMAI', '1995-02-03', 8, 26, '1', '0000-00-00 00:00:00'),
(4838, '340470025008', 'YUNIARTA SETIAWAN', 0, 'Laki - Lak', 'KALAKIJO 06 / 03', 0, 0, 0, 'SLEMAN', '1990-06-30', 8, 26, '1', '0000-00-00 00:00:00'),
(4839, '340480025120', 'AAN ARIEF DJATMIKO', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1984-04-30', 20, 2, '1', '0000-00-00 00:00:00'),
(4840, '340480025210', 'ACHMAD HENDRAWAN', 0, 'Laki - Lak', 'JOHOLANANG', 0, 0, 0, 'SLEMAN', '1990-09-28', 10, 2, '1', '0000-00-00 00:00:00'),
(4841, '340480025323', 'AHMAT HADI SUSANTO', 0, 'Laki - Lak', 'KALIMANGGIS', 0, 0, 0, 'SLEMAN', '1990-09-28', 23, 2, '1', '0000-00-00 00:00:00'),
(4842, '340480025423', 'AJAB SANTOSO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1979-12-25', 23, 2, '1', '0000-00-00 00:00:00'),
(4843, '340480025507', 'ANANG KUSNANTO', 0, 'Laki - Lak', 'KENTIINGAN', 0, 0, 0, 'SLEMAN', '1979-10-14', 7, 2, '1', '0000-00-00 00:00:00'),
(4844, '340480025623', 'ANGGIT WIDODO', 0, 'Laki - Lak', 'COKROGATEN', 0, 0, 0, 'SLEMAN', '1979-05-15', 23, 2, '1', '0000-00-00 00:00:00'),
(4845, '340480025720', 'ARDENDI CAHYO ERTANTO', 0, 'Laki - Lak', 'KENTINGAN', 0, 0, 0, 'SLEMAN', '1989-12-27', 20, 2, '1', '0000-00-00 00:00:00'),
(4846, '340480025802', 'ARDIYAWAN', 0, 'Laki - Lak', 'NGERDI', 0, 0, 0, 'SLEMAN', '1990-11-15', 2, 2, '1', '0000-00-00 00:00:00'),
(4847, '340480025923', 'ASIH DARMANTO', 0, 'Laki - Lak', 'SORASAN', 0, 0, 0, 'SLEMAN', '1968-07-01', 23, 2, '1', '0000-00-00 00:00:00'),
(4848, '340480026018', 'BAHAR SYAFAWI', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1987-12-15', 18, 2, '1', '0000-00-00 00:00:00'),
(4849, '340480026123', 'BAKHTIAR SALEH', 0, 'Laki - Lak', 'NGERDI', 0, 0, 0, 'SLEMAN', '1982-03-08', 23, 2, '1', '0000-00-00 00:00:00'),
(4850, '340480026223', 'BARJONO', 0, 'Laki - Lak', 'KEJAMBON KIDUL', 0, 0, 0, 'SLEMAN', '1956-03-20', 23, 2, '1', '0000-00-00 00:00:00'),
(4851, '340480026323', 'BASYORUDIN', 0, 'Laki - Lak', 'JOHOLANANG', 0, 0, 0, 'SLEMAN', '1972-05-07', 23, 2, '1', '0000-00-00 00:00:00'),
(4852, '340480026402', 'BENI ISWADI', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1986-02-22', 2, 2, '1', '0000-00-00 00:00:00'),
(4853, '340480026518', 'BROTO HANDOKO', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1977-12-08', 18, 2, '1', '0000-00-00 00:00:00'),
(4854, '340480026602', 'BUDI PAMUNGKAS', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1991-10-06', 2, 2, '1', '0000-00-00 00:00:00'),
(4855, '340480026707', 'BUDI SANTOSO', 0, 'Laki - Lak', 'KEJAMBON KIDUL', 0, 0, 0, 'SLEMAN', '1981-02-12', 7, 2, '1', '0000-00-00 00:00:00'),
(4856, '340480026810', 'BUDI SANTOSO', 0, 'Laki - Lak', 'KALIMANGGIS', 0, 0, 0, 'SLEMAN', '1983-03-24', 10, 2, '1', '0000-00-00 00:00:00'),
(4857, '340480026923', 'DHANI AHMAD MURHANTORO ', 0, 'Laki - Lak', 'JOHOLANANG', 0, 0, 0, 'SLEMAN', '1994-07-30', 23, 2, '1', '0000-00-00 00:00:00'),
(4858, '340480027006', 'FAUZI AHMAD', 0, 'Laki - Lak', 'JOHOLANANG', 0, 0, 0, 'SLEMAN', '1978-10-14', 6, 2, '1', '0000-00-00 00:00:00'),
(4859, '340480027123', 'GIGIH RISKIYANTO', 0, 'Laki - Lak', 'NGERDI', 0, 0, 0, 'SLEMAN', '1992-12-15', 23, 2, '1', '0000-00-00 00:00:00'),
(4860, '340480027223', 'HADI PURWANTO', 0, 'Laki - Lak', 'BANJARHARJO', 0, 0, 0, 'SLEMAN', '1965-02-02', 23, 2, '1', '0000-00-00 00:00:00'),
(4861, '340480027323', 'HARIADI', 0, 'Laki - Lak', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1971-03-12', 23, 2, '1', '0000-00-00 00:00:00'),
(4862, '340480027413', 'HARYANA', 0, 'Laki - Lak', 'KENTINGAN', 0, 0, 0, 'SLEMAN', '1968-11-01', 13, 2, '1', '0000-00-00 00:00:00'),
(4863, '340480027510', 'HERMANTA ATMAJA', 0, 'Laki - Lak', 'KENTINGAN', 0, 0, 0, 'SLEMAN', '1969-05-09', 10, 2, '1', '0000-00-00 00:00:00'),
(4864, '340480027607', 'HERU NURDIYANTO', 0, 'Laki - Lak', 'TAMBAKAN', 0, 0, 0, 'SLEMAN', '1983-07-22', 7, 2, '1', '0000-00-00 00:00:00'),
(4865, '340480027726', 'IRVAN NUR EFFENDI', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1983-03-21', 26, 2, '1', '0000-00-00 00:00:00'),
(4866, '340480027807', 'JUMAKIR', 0, 'Laki - Lak', 'BOKESAN', 0, 0, 0, 'SLEMAN', '1979-09-19', 7, 2, '1', '0000-00-00 00:00:00'),
(4867, '340480027907', 'JUMINO', 0, 'Laki - Lak', 'KALIMANGGIS', 0, 0, 0, 'SLEMAN', '1979-01-09', 7, 2, '1', '0000-00-00 00:00:00'),
(4868, '340480028023', 'JUNAERI', 0, 'Laki - Lak', 'BANJARHARJO', 0, 0, 0, 'MAGELANG', '1974-06-17', 23, 2, '1', '0000-00-00 00:00:00'),
(4869, '340480028123', 'MARDIONO', 0, 'Laki - Lak', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1962-05-09', 23, 2, '1', '0000-00-00 00:00:00'),
(4870, '340480028223', 'MISWANTO', 0, 'Laki - Lak', 'KEJAMBON KIDUL', 0, 0, 0, 'SLEMAN', '1982-04-30', 23, 2, '1', '0000-00-00 00:00:00'),
(4871, '340480028302', 'MUHARAM SYUHADA', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1988-09-07', 2, 2, '1', '0000-00-00 00:00:00'),
(4872, '340480028423', 'MULYONO', 0, 'Laki - Lak', 'TAMBAKAN', 0, 0, 0, 'SLEMAN', '1970-05-25', 23, 2, '1', '0000-00-00 00:00:00'),
(4873, '340480028501', 'NANANG SETYOAJI', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1984-09-05', 1, 2, '1', '0000-00-00 00:00:00'),
(4874, '340480028623', 'PAIMIN', 0, 'Laki - Lak', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1967-03-10', 23, 2, '1', '0000-00-00 00:00:00'),
(4875, '340480028723', 'PARYONO', 0, 'Laki - Lak', 'KALIMANGGIS', 0, 0, 0, 'SLEMAN', '1968-02-12', 23, 2, '1', '0000-00-00 00:00:00'),
(4876, '340480028823', 'RAHMAT SARJIYANTO', 0, 'Laki - Lak', 'TEMPELSARI', 0, 0, 0, 'SLEMAN', '1989-07-03', 23, 2, '1', '0000-00-00 00:00:00'),
(4877, '340480028923', 'SALAMI', 0, 'Laki - Lak', 'TAMBAKAN', 0, 0, 0, 'SLEMAN', '1960-07-16', 23, 2, '1', '0000-00-00 00:00:00'),
(4878, '340480029023', 'SARTONO', 0, 'Laki - Lak', 'NGERDI', 0, 0, 0, 'SLEMAN', '1973-01-04', 23, 2, '1', '0000-00-00 00:00:00'),
(4879, '340480029118', 'SLAMET WIDODO', 0, 'Laki - Lak', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1976-04-23', 18, 2, '1', '0000-00-00 00:00:00'),
(4880, '340480029207', 'SOIDI', 0, 'Laki - Lak', 'TAMBAKAN', 0, 0, 0, 'SLEMAN', '1972-03-04', 7, 2, '1', '0000-00-00 00:00:00'),
(4881, '340480029323', 'SRI HARDANA', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1966-09-22', 23, 2, '1', '0000-00-00 00:00:00'),
(4882, '340480029423', 'SUBAGIYO', 0, 'Laki - Lak', 'TAMBAKAN', 0, 0, 0, 'SLEMAN', '1973-09-19', 23, 2, '1', '0000-00-00 00:00:00'),
(4883, '340480029523', 'SUBAGJO', 0, 'Laki - Lak', 'SEWON', 0, 0, 0, 'SLEMAN', '1948-10-10', 23, 2, '1', '0000-00-00 00:00:00'),
(4884, '340480029607', 'SUGENG MISWANTO', 0, 'Laki - Lak', 'MORANGAN', 0, 0, 0, 'SLEMAN', '1976-05-04', 7, 2, '1', '0000-00-00 00:00:00'),
(4885, '340480029723', 'SUHARNO', 0, 'Laki - Lak', 'COKROGATEN', 0, 0, 0, 'SLEMAN', '1963-12-29', 23, 2, '1', '0000-00-00 00:00:00'),
(4886, '340480029823', 'SUMARNA', 0, 'Laki - Lak', 'KENTINGAN', 0, 0, 0, 'SLEMAN', '1964-10-29', 23, 2, '1', '0000-00-00 00:00:00'),
(4887, '340480029918', 'SUPRIYADI', 0, 'Laki - Lak', 'KENTINGAN', 0, 0, 0, 'SLEMAN', '1986-04-14', 18, 2, '1', '0000-00-00 00:00:00'),
(4888, '340480030023', 'SURISNO', 0, 'Laki - Lak', 'BANJARHARJO', 0, 0, 0, 'SLEMAN', '1971-11-04', 23, 2, '1', '0000-00-00 00:00:00'),
(4889, '340480030118', 'SUTIKNO', 0, 'Laki - Lak', 'KEJAMBON LOR', 0, 0, 0, 'SLEMAN', '1983-01-07', 18, 2, '1', '0000-00-00 00:00:00'),
(4890, '340480030223', 'TEGUH RAHAYU', 0, 'Laki - Lak', 'BANJARHARJO', 0, 0, 0, 'SLEMAN', '1978-03-02', 23, 2, '1', '0000-00-00 00:00:00'),
(4891, '340480030318', 'TRI RAHARJO', 0, 'Laki - Lak', 'DALEM', 0, 0, 0, 'SLEMAN', '1981-01-01', 18, 2, '1', '0000-00-00 00:00:00'),
(4892, '340480030407', 'TRI WUSANA', 0, 'Laki - Lak', 'KORIPAN', 0, 0, 0, 'SLEMAN', '1973-04-07', 7, 2, '1', '0000-00-00 00:00:00'),
(4893, '340480030518', 'WIDODO LAMTORO', 0, 'Laki - Lak', 'NGERDI', 0, 0, 0, 'SLEMAN', '1970-08-27', 18, 2, '1', '0000-00-00 00:00:00'),
(4894, '340490030610', 'A JUMARNI', 0, 'Perempuan', 'JALI RT ', 0, 0, 0, 'KLATEN', '1970-08-12', 10, 20, '1', '0000-00-00 00:00:00'),
(4895, '340490030723', 'ADY WIDODO S', 0, 'Laki - Lak', 'JALI ', 0, 0, 0, 'SLEMAN', '1995-01-12', 23, 20, '1', '0000-00-00 00:00:00'),
(4896, '340490030818', 'AGUS RIYONO', 0, 'Laki - Lak', 'MAGIRSARI ', 0, 0, 0, 'BREBES', '1984-08-27', 18, 20, '1', '0000-00-00 00:00:00'),
(4897, '340490030918', 'AGUS SANTOSO', 0, 'Laki - Lak', 'GAYAM', 0, 0, 0, 'SLEMAN', '1971-08-01', 18, 20, '1', '0000-00-00 00:00:00'),
(4898, '340490031020', 'AGUS WICAKSONO', 0, 'Laki - Lak', 'BLEBER  LOR ', 0, 0, 0, 'SLEMAN', '1965-08-01', 20, 20, '1', '0000-00-00 00:00:00'),
(4899, '340490031123', 'ANDIS PRASETYO ROSYDI', 0, 'Laki - Lak', 'GAYAM', 0, 0, 0, 'SLEMAN', '1971-12-08', 23, 20, '1', '0000-00-00 00:00:00'),
(4900, '340490031212', 'BENI SUHARA', 0, 'Laki - Lak', 'REJODANI ', 0, 0, 0, 'SLEMAN', '1979-03-02', 5, 20, '1', '0000-00-00 00:00:00'),
(4901, '340490031320', 'BUKHORI', 0, 'Laki - Lak', 'GUNUNG GEBANG ', 0, 0, 0, 'SLEMAN', '1985-03-10', 20, 20, '1', '0000-00-00 00:00:00'),
(4902, '340490031401', 'CATUR WARSONO', 0, 'Laki - Lak', 'DEMANGAN ', 0, 0, 0, 'SLEMAN', '1979-01-29', 1, 20, '1', '0000-00-00 00:00:00'),
(4903, '340490031520', 'EDI TRI ANGGORO', 0, 'Laki - Lak', 'PARANGAN ', 0, 0, 0, 'SLEMAN', '1977-03-02', 20, 20, '1', '0000-00-00 00:00:00'),
(4904, '340490031610', 'ELISABETH MUKINEM', 0, 'Perempuan', 'GAYAM ', 0, 0, 0, 'SLEMAN', '1979-03-12', 10, 20, '1', '0000-00-00 00:00:00'),
(4905, '340490031718', 'FX MURDI S', 0, 'Laki - Lak', 'GAYAM', 0, 0, 0, 'SLEMAN', '1953-05-03', 18, 20, '1', '0000-00-00 00:00:00'),
(4906, '340490031820', 'HARTOTO WAHYUDI', 0, 'Laki - Lak', 'BENDOSARI ', 0, 0, 0, 'SLEMAN', '1983-09-12', 20, 20, '1', '0000-00-00 00:00:00'),
(4907, '340490031901', 'HUTOMO MANDALA PUTRA', 0, 'Laki - Lak', 'JLATREN ', 0, 0, 0, 'SLEMAN', '1996-08-19', 1, 20, '1', '0000-00-00 00:00:00'),
(4908, '340490032001', 'INDRIANTO ANGGIT D P, SH', 0, 'Laki - Lak', 'POTROJAYAN ', 0, 0, 0, 'SLEMAN', '1972-01-10', 1, 20, '1', '0000-00-00 00:00:00'),
(4909, '340490032120', 'KISNO BUDIYANTO', 0, 'Laki - Lak', 'KETANDAN ', 0, 0, 0, 'SLEMAN', '1974-12-10', 20, 20, '1', '0000-00-00 00:00:00'),
(4910, '340490032210', 'LINA MIYATI', 0, 'Perempuan', 'WATUGUDEG ', 0, 0, 0, 'SLEMAN', '1983-05-26', 10, 20, '1', '0000-00-00 00:00:00'),
(4911, '340490032306', 'M BAMBANG KRISTIANTO', 0, 'Laki - Lak', 'LEMAHBANG', 0, 0, 0, 'SLEMAN', '1999-03-13', 6, 20, '1', '0000-00-00 00:00:00'),
(4912, '340490032418', 'NGADINO', 0, 'Laki - Lak', 'GAYAM ', 0, 0, 0, 'SLEMAN', '1985-05-15', 18, 20, '1', '0000-00-00 00:00:00'),
(4913, '340490032518', 'NGATIMIN', 0, 'Laki - Lak', 'BENDO ', 0, 0, 0, 'SLEMAN', '1965-12-10', 18, 20, '1', '0000-00-00 00:00:00'),
(4914, '340490032608', 'ORY FATMAWATI', 0, 'Perempuan', 'SOROGEDUG KIDUL ', 0, 0, 0, 'SLEMAN', '1970-01-21', 8, 20, '1', '0000-00-00 00:00:00'),
(4915, '340490032718', 'PAIJAN', 0, 'Laki - Lak', 'BENDO ', 0, 0, 0, 'SLEMAN', '1973-03-04', 18, 20, '1', '0000-00-00 00:00:00'),
(4916, '340490032815', 'PARYONO', 0, 'Laki - Lak', 'JLATREN ', 0, 0, 0, 'SLEMAN', '1978-02-10', 15, 20, '1', '0000-00-00 00:00:00'),
(4917, '340490032906', 'PETRUS TUGINO', 0, 'Laki - Lak', 'BENDO ', 0, 0, 0, 'SLEMAN', '1973-03-10', 6, 20, '1', '0000-00-00 00:00:00'),
(4918, '340490033018', 'PONIRAN', 0, 'Laki - Lak', 'BENDO ', 0, 0, 0, 'SLEMAN', '1970-02-11', 18, 20, '1', '0000-00-00 00:00:00'),
(4919, '340490033105', 'PRAWOTO', 0, 'Laki - Lak', 'GAYAM ', 0, 0, 0, 'SLEMAN', '1973-03-17', 5, 20, '1', '0000-00-00 00:00:00'),
(4920, '340490033202', 'RUSMIYATUN', 0, 'Perempuan', 'GAYAM ', 0, 0, 0, 'GUNUNG KIDUL', '1986-07-13', 2, 20, '1', '0000-00-00 00:00:00'),
(4921, '340490033319', 'SUWANDI', 0, 'Laki - Lak', 'MAGIRSARI ', 0, 0, 0, 'SLEMAN', '1970-04-03', 19, 20, '1', '0000-00-00 00:00:00'),
(4922, '340490033419', 'THOMAS PAIJO', 0, 'Laki - Lak', 'GAYAM ', 0, 0, 0, 'SLEMAN', '1967-04-02', 19, 20, '1', '0000-00-00 00:00:00'),
(4923, '340490033518', 'TRIYANTO', 0, 'Laki - Lak', 'GAYAM ', 0, 0, 0, 'SLEMAN', '1977-11-15', 18, 20, '1', '0000-00-00 00:00:00'),
(4924, '340490033606', 'WAGIMIN', 0, 'Laki - Lak', 'BENDO ', 0, 0, 0, 'SLEMAN', '1974-04-20', 6, 20, '1', '0000-00-00 00:00:00'),
(4925, '340490033707', 'WIGIT RAHAYU', 0, 'Laki - Lak', 'LOSARI II ', 0, 0, 0, 'SLEMAN', '1964-06-05', 7, 20, '1', '0000-00-00 00:00:00'),
(4926, '340490033806', 'Y MARGO ENDRI S', 0, 'Laki - Lak', 'GAYAM ', 0, 0, 0, 'SLEMAN', '1980-12-17', 6, 20, '1', '0000-00-00 00:00:00'),
(4927, '340490033918', 'Y MARGONO', 0, 'Laki - Lak', 'GAYAM', 0, 0, 0, 'SLEMAN', '1974-11-10', 18, 20, '1', '0000-00-00 00:00:00'),
(4928, '340490034019', 'YACOBUS RUBIMIN', 0, 'Laki - Lak', 'LEMAHBANG', 0, 0, 0, 'SLEMAN', '1951-02-15', 19, 20, '1', '0000-00-00 00:00:00'),
(4929, '340490034107', 'YANTO', 0, 'Laki - Lak', 'BENDO ', 0, 0, 0, 'DEMAK', '1973-09-05', 7, 20, '1', '0000-00-00 00:00:00'),
(4930, '340490034218', 'YATNO SUWITO', 0, 'Laki - Lak', 'MAGIRSARI ', 0, 0, 0, 'SLEMAN', '1964-09-01', 19, 20, '1', '0000-00-00 00:00:00'),
(4931, '340490034310', 'YUSTINA SUMARSIH', 0, 'Perempuan', 'GAYAM ', 0, 0, 0, 'SLEMAN', '1978-06-15', 10, 20, '1', '0000-00-00 00:00:00'),
(4932, 'SUGENG RIYANTO', '', 0, 'KROMODANGS', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4933, 'SUGENG SUDARNO', '340416100264000 1', 0, 'GAMBIRAN R', 'PAKEMBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4934, 'SUGENG UTORO', '3404 1211 0691 0004', 0, 'PLOSOKUNIN', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4935, 'SUGI PAWIRO', '3404161212510001', 0, 'RELOKASI T', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 29, '1', '0000-00-00 00:00:00'),
(4936, 'SUGIHARTO', '3308050409590001', 0, 'PONDOK', 'SRUMBUNG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4937, 'SUGIMAN', '3404160305590001', 0, 'TURGOGEDE,', 'HARJOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4938, 'SUGIMAN UDI UTOMO', '3404160505570001', 0, 'KEMIRI,02/', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 30, '1', '0000-00-00 00:00:00'),
(4939, 'SUGIYANTO', '3404171810700001', 0, 'SEWON', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4940, 'SUGIYANTO PRAYITNO', '3404161910720001', 0, 'POTRO,01/1', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 32, '1', '0000-00-00 00:00:00'),
(4941, 'SUGIYARNO', '3404142707680000', 0, 'CUNGKUK', 'MARGOREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4942, 'SUGIYARTO', '3404090906790003', 0, 'RANDUSARI', 'BOKOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4943, 'SUGIYONO', '3404170508760001', 0, 'KALITENGAH', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4944, 'SUHADAK', '3404151303770001', 0, 'TUNGGULARU', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4945, 'SUHANDOKO', '3404011810690002', 0, 'NYAMPLUNG ', 'BALECATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4946, 'SUHARDI', '3404162002790001', 0, 'NGIPIKSARI', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4947, 'SUHARI ', '3404150907800002', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4948, 'SUHARJASA', '3404140211620001', 0, 'KOPEN 02/1', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4949, 'SUHARNO', '3404.13.230279.0001', 0, 'KALAKIJO 0', 'TRIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4950, 'SUHARSONO', '3404160305830001', 0, 'TURGO,04/0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 33, '1', '0000-00-00 00:00:00'),
(4951, 'SUHARTO', '3308053012760004', 0, 'GROGOLSARI', 'SRUMBUNG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4952, 'SUHARTONO', '340406 060678 0008', 0, 'MULUNGAN W', 'SENDANGADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4953, 'SUHARTONO, SH', '3471040901680001', 0, 'KEMASAN', 'WIDODOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4954, 'SUHARTOYO', '3404121706660001', 0, 'GG. POKSAI', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4955, 'SUHARWANTO', '340402 200578 0001', 0, 'JOWAH RT.0', 'SIDOLUHUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4956, 'SUHENDRA JATMIKA AJI', '3404100704920004', 0, 'CATURHARJO', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4957, 'SUJARWO', '3404100910760002', 0, 'JETAK', 'SELOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4958, 'SUJARWONO', '3404140105560001', 0, 'JENENGAN', 'PONDOKREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4959, 'SUKADI ', '3404100104760002', 0, 'CATURHARJO', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4960, 'SUKARMAN', '340402 111267 0001', 0, 'SEMBUH WET', 'SIDOKARTO', 0, 0, 0, '', '0000-00-00', 0, 45, '1', '0000-00-00 00:00:00'),
(4961, 'SUKARMIN', '3404062704630001', 0, 'JATIREJO R', 'SENDANGADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4962, 'SUKEMI', '3404172307750002', 0, 'SINGLAR ', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4963, 'SUKIDI', '3404150806770004', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4964, 'SUKIJO', '3404161305780001', 0, 'BOYONG RT0', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4965, 'SUKIMIN', '3404160401720001', 0, 'KEMIRI,01/', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 34, '1', '0000-00-00 00:00:00'),
(4966, 'SUKIRNO', '3404151012710001', 0, 'JURUGAN', 'BANGUNKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4967, 'SUKISMOYO', '340402 180869 0002', 0, 'GENTINGAN ', 'SIDOAGUNG', 0, 0, 0, '', '0000-00-00', 0, 46, '1', '0000-00-00 00:00:00'),
(4968, 'SUKISWANTO', '340412404780003', 0, 'KOPENG', 'KEPUHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4969, 'SUKLIHONO', '3404121205750006', 0, 'JETIS DONO', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4970, 'SUKMAWAN TRI PAMUNGK', '3404 1222 0290 0001', 0, 'BARANSARI ', 'SARDONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4971, 'SUKRIS', '340416 210375 0002', 0, 'NGELOSARI ', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4972, 'SUKRIS MAWANTORO', '3404150702920001', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4973, 'SULARDI', '340414 051166 0003', 0, 'JLEGONGAN ', 'MARGEREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4974, 'SULARTO', '3404111410650004', 0, 'JIMAT', 'WIDODOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4975, 'SULASNO', '3404102311750003', 0, 'SEPETMADU', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4976, 'SULISMAN', '3402172905800001', 0, 'SUROBAYAN ', 'ARGOREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4977, 'SULISTIONO', '', 0, 'MBANGUN ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4978, 'SULISTIYANDARI, S.PD', '3404164 70575 0001', 0, 'KALIWANGLU', 'HARJOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4979, 'SULISTYO BUDI SANTOS', '3404063105640001', 0, 'BLUNYAH GE', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4980, 'SULISTYO RAHMAN', '3404 1615 0480 0002', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4981, 'SULIYAH', '3404124102680001', 0, 'NGEBEL GED', 'SARDONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4982, 'SUMADI', '3404072406680005', 0, 'PRIWULUNG ', 'CONDONG CATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4983, 'SUMADIYANTO', '34041710730001', 0, 'MANGGONG', 'KEPUHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4984, 'SUMADIYONO', '3404152408740002', 0, 'NGANDONG R', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4985, 'SUMARGI', '3402141708720006', 0, 'JETISDONOL', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4986, 'SUMARI RAHAYU', '3404145511780003', 0, 'KROMODANGS', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4987, 'SUMARJI', '3404171708750002', 0, 'JETIS SUMU', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4988, 'SUMARJO HADI SISWANT', '3404171111530002', 0, 'KAYEN, RT0', 'CONDONG CATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4989, 'SUMARNA', '3404112910640001', 0, 'KENTINGAN', 'SINDUMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4990, 'SUMARNO', '34041 71806730001', 0, 'DAWUNG', 'WUKIRSARI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4991, 'SUMARSONO', '3404120710730002', 0, 'CANDIKARAN', 'SARDONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4992, 'SUMARSUM', '3404171201630001', 0, 'JETIS', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4993, 'SUMARYANTO', '3404150407530001', 0, 'GONDOREJO', 'WONOKERTO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4994, 'SUMIJO', '3404161203560001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4995, 'SUMITRO', '3404130305770005', 0, 'MURANGAN 8', ' TRIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4996, 'SUMIYATI', '3308064808690001', 0, 'GEJAYAN', 'POLENGAN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4997, 'SUNANDAR', '3404 171706820002', 0, 'JETIS', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4998, 'SUNARDI', '3404110102740001', 0, 'KLANCINGAN', 'WIDODOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(4999, 'SUNARJA', '3404.0731.0161.0003', 0, 'GORONGAN N', 'CONDONGCATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5000, 'SUNARTO', '3404152006660005', 0, 'TLATAR ', 'WONOKERTO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5001, 'SUNARTO ST.', '3404122803630005', 0, 'NANDAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5002, 'SUNARYO', '3404170705740001', 0, 'PENTINGSAR', 'UMBULHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5003, 'SUNGKONO', '3404150912840002', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5004, 'SUNYONO', '3404 1607 0289 0001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5005, 'SUPANTO', '3404150509810001', 0, 'NGANDONG R', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5006, 'SUPARDI', '3404 1202 0169 0003', 0, 'NGENTAK 02', ' SINDUHARJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5007, 'SUPARGIYATI', '3404126705670001', 0, 'MUDAL', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5008, 'SUPARJANA', '3404160104680001', 0, 'KARANGGENE', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 35, '1', '0000-00-00 00:00:00'),
(5009, 'SUPARJILAN', '3404160102560001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5010, 'SUPARJIMAN', '340 401 250 988 0006', 0, 'GAMPING KI', 'AMBARKETAWANG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5011, 'SUPARJO', '3404 0724 0567 0004', 0, 'TIYASAN CO', 'CONDONGCATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5012, 'SUPARMAN', '', 0, 'SEDAN, GAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5013, 'SUPARMO', '3404163011580001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5014, 'SUPARMO RIPTOSUDARMO', '3404121501560001', 0, 'JONGKANG', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5015, 'SUPARNO', '3404140505550006', 0, 'KOPEN 01/1', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5016, 'SUPARSANA', '3404160304710003', 0, 'SAMBI RT 0', 'PAKEMBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5017, 'SUPARTONO', '3404101610670002', 0, 'TUNJUNGAN', 'SELOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5018, 'SUPARYADI', '340215 251280 0005', 0, 'TANJUNG RT', 'BANGUNHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5019, 'SUPARYANTA', '3404141106650001', 0, 'NGLENGKONG', 'SUMBERREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5020, 'SUPARYANTO', '3404041501660002', 0, 'TEGAL KLAG', ' SENDANGREJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5021, 'SUPENO', '3404172704700002', 0, 'BAKALAN  2', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5022, 'SUPODO', '3404171302730003', 0, 'KALITENGAH', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5023, 'SUPRAPTO', '1702 1908 0885 0001', 0, 'KADIREJO 0', ' SINDUHARJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5024, 'SUPRAYITNO', '3404160602600001', 0, 'TANEN RT01', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5025, 'SUPRI YANA / SEMPRIT', '3404171104630000', 0, 'JETIS', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5026, 'SUPRIHATIN', '3404122003730006', 0, 'WARAS, RT0', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5027, 'SUPRIHATIN BROMO TEN', '3404.0630.0972.0001', 0, 'KARANGJATI', ' SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5028, 'SUPRIHONO', '3404162510680001', 0, 'KATEN, RT/', 'HARJOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5029, 'SUPRIYADI', '3404152709770001', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5030, 'SUPRIYADI NOTO WIYON', '3404151605750002', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5031, 'SUPRIYANA', '3404101009690001', 0, 'KERTIREJO', 'SELOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5032, 'SUPRIYANTO', '34041 72706780001', 0, 'JARANAN', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5033, 'SUPRIYATI', '3404174404680001', 0, 'CANGKRINGA', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5034, 'SUPRIYONO', '3404143010600002', 0, 'TEMPEL 02/', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5035, 'SURADI', '3404060309590002', 0, 'POGUNG KID', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5036, 'SURADIYONO', '3404111509540001', 0, 'ROGOBANGSA', 'BIMOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5037, 'SURAJI', '3404100111680002', 0, 'TAMANAN', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5038, 'SURANI', '3404121002750001', 0, 'KRIKILAN, ', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5039, 'SURANTO', '340416130161000 1', 0, 'WONOGIRI R', 'PAKEMBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5040, 'SURATMAN', '3404121401680001', 0, 'SEDAN RT 0', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5041, 'SURATMAN MARJUNI', '3404022506810003', 0, 'GENITEM, 0', 'SIDOAGUNG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5042, 'SURATMI', '3404175502650001', 0, 'SEWON', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5043, 'SURINTO', '3402152103760003', 0, 'JETISDONOL', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5044, 'SURISNO', '3404110411710001', 0, 'BANJARHARJ', 'BIMOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5045, 'SURMALAHADI', '3404160708640001', 0, 'JL TURGO K', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5046, 'SURONO', '3404150507660003', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5047, 'SUROTO', '3404152010840004', 0, 'SUKOREJO R', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5048, 'SURYA BUANA', '3404010108660001', 0, 'NYAMPLUNG ', 'BALECATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5049, 'SURYADI', '3404072809840015', 0, 'KEMBANG', 'MAGUWOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5050, 'SURYANA DWI KRISTANT', '340 412 410 490 0003', 0, 'NGABEAN KU', 'SINDUHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5051, 'SURYANTI', '3404 1249 0162 0003', 0, ' DUKUH 04/', ' SINDUHARJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5052, 'SURYANTO', '3404152601850003', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5053, 'SURYO BUDI PRASETYO', '3404152904600001', 0, 'NGELODADI ', 'WONOKERTO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5054, 'SUSENO', '3404121905660001', 0, 'NGETIRAN, ', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5055, 'SUSILA', '', 0, '', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5056, 'SUTANTO', '3404172309630000', 0, 'PENTING SA', 'UMBULHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5057, 'SUTARJA', '3404151707640001', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5058, 'SUTARJO', '3404160801640001', 0, 'KARANGGENE', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 36, '1', '0000-00-00 00:00:00'),
(5059, 'SUTARMAN', '3404152203610003', 0, '', '', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5060, 'SUTARMONO', '340 411 290 975 0005', 0, 'NGEMPLAK L', 'UMBULMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5061, 'SUTARNA', '3404150501740002', 0, 'NGANGGRING', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5062, 'SUTARNO/MARDIWIYONO', '3404171001710001', 0, 'SINGLAR', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5063, 'SUTIKNO', '3404110701830001', 0, 'KEJAMBON L', 'SINDUMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5064, 'SUTONO', '3404131609680003', 0, 'KLONCOMAN ', 'PANDOWOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5065, 'SUTRIANTO', '3404020708760007', 0, 'KUNDEN 01/', 'SIDOLUHUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5066, 'SUTRISNO', '3404152904750004', 0, 'NGANDONG R', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5067, 'SUTRISTIANA', '3404110101660002', 0, 'KEMASAN', 'WIDODOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5068, 'SUVIYATNO', '3404152008840001', 0, 'GADUNG', 'BANGUNKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5069, 'SUWAJI', '3404172303840003', 0, 'KALITENGAH', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5070, 'SUWANDI', '3404090304700000', 0, 'MAGIRSARI ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5071, 'SUWANDI PRAYITNO', '3404161209670001', 0, 'NGEPRING,0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 38, '1', '0000-00-00 00:00:00'),
(5072, 'SUWANTO', '34041271202770000', 0, ' SRUNEN RT', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5073, 'SUWARDI', '3404131808640002', 0, 'KALIRASE', 'TRIMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5074, 'SUWARDIYONO', '340415 151257 0001', 0, 'DUSUN TURI', 'DONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5075, 'SUWARJONO', '340 405 200 173 0003', 0, 'DUKUH', 'MARGOAGUNG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5076, 'SUWARNO LAKSITO', '3404122703650002', 0, 'GRIYA KARA', 'PURWOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5077, 'SUWARTO', '3404101505690001', 0, 'PUNDUNG', 'TIRTOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5078, 'SUWOTO', '34041170203660002', 0, 'KRAJAN', 'WUKIRSARI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5079, 'SUYADI', '3404 1607 0289 0001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5080, 'SUYANTO', '3404141702650002', 0, 'NGELEBENG ', 'MARGOREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5081, 'SUYATMI', '3404156509710002', 0, 'TUNGGULARU', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5082, 'SUYATMIN', '3404150712790002', 0, 'TUNGGULARU', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5083, 'SUYATNO', '34041 72005590001', 0, 'JARANAN', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5084, 'SUYOTO', '3404120406700003', 0, 'TEGALWERU ', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5085, 'SUYUDI', '3404 17 0207650001', 0, 'BRONGGANG ', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5086, 'SYAHRIL FATONI', '3404 170612940001', 0, 'JETIS', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5087, 'SYARIF NUR ROCHMAT', '340416040297000 2', 0, 'BOYONG', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5088, 'TARNA', '3404 1607 0289 0001', 0, 'TRITIS', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5089, 'TARSONO', '3302201004940004', 0, '', 'KEMBARAN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5090, 'TARYONO', '3404141111770002', 0, 'MANGKUDRAN', 'MARGOREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5091, 'TATAG TRI WAHYUDI', '3404152305770002', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5092, 'TAUFIQ FIRMANSYAH HU', '3404060706560004', 0, 'NGEMPLAK K', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5093, 'TEDI SULISTIYANTO', '340 407 171 17 6 0002', 0, 'BANTULAN, ', 'CATURTUNGGAL', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5094, 'TEDI SUSWANTONO', '3404 1714 0793 0001', 0, 'SIDOREJO, ', 'UMBULHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5095, 'TEGUH RAHAYU', '3404153107760002', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5096, 'TEGUH SARJUGO', '3404110508650002', 0, 'GONDANGLEG', 'WEDOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5097, 'TEGUH SUPRANTO', '3404121608650006', 0, 'TEGALWERU,', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5098, 'TEGUH SUTRISNO', '3404162906680001', 0, 'TURGO,04/0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 39, '1', '0000-00-00 00:00:00'),
(5099, 'TEGUH WIDODO', '34O4370603710001', 0, 'MUDAL ', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5100, 'TENTREM TRIYADI', '3404171207850002', 0, 'KALITENGAH', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5101, 'TH.KRISTANTO', '3404150503660002', 0, 'TUNGGULARU', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5102, 'THEO EDI MARYONO', '3404 172309770002', 0, 'BAKALAN ', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5103, 'THERESIA DAMARIS. S', '3404064908930001', 0, 'BLUNYAH GE', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5104, 'THOMAS PAIJO', '3404090204670000', 0, 'GAYAM ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5105, 'TIMBUL ENDRO SUSILO', '340402 151269 0003', 0, 'JOWAH V ', 'SIDOAGUNG', 0, 0, 0, '', '0000-00-00', 0, 50, '1', '0000-00-00 00:00:00'),
(5106, 'TITIEK SUWARNY', '3404164909680002', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5107, 'TITIN HARWIYATI', '3404104807690003', 0, 'TIMUR', 'SELOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5108, 'TONI ARIF MARTONO', '3504 0219 0183 0001', 0, 'KARANGJATI', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5109, 'TONI YUHANTA', '3404101211850001', 0, 'BROMONILAN', 'PURWOMARTANI ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5110, 'TONY DONOVAN FERNAND', '3404 1217 0994 0001', 0, 'PRUJAKAN 0', ' SINDUHARJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5111, 'TOPO HARDONO', '34041 70603630001', 0, 'KUWANG ', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5112, 'TOTO SUKMONO', '3404 17 1003720001', 0, 'SURUH ', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5113, 'TOTOK SUROTO', '3404143005510001', 0, 'KROMODANGS', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5114, 'TRI FAJAR SAHARI', '3404120307810006', 0, 'KRIKILAN, ', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5115, 'TRI HARTANTO', '3404162703570002', 0, 'KALIURANG', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5116, 'TRI HARTONO', '3404151203750005', 0, 'NGELODADI', 'WONOKERTO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5117, 'TRI KUSWANTORO', '3404172504770001', 0, 'BATUR', 'KEPUHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5118, 'TRI MARYANTA', '3404173009770002', 0, 'BRONGKOL', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5119, 'TRI PURNAWAN', '3404 1513 0282 0002', 0, 'KAPING, WO', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5120, 'TRI RAHARJO', '3404100101810004', 0, 'DALEM', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5121, 'TRI RAHAYU', '3404105603780001', 0, 'SEJARAN', 'SELOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5122, 'TRI SAPUTRO', '340416010474000 4', 0, 'TROJAYAN R', 'HARJOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5123, 'TRI SISWANTO', '3404102507680005', 0, 'BENDAN  06', 'TIRTOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5124, 'TRI SUSANTO', '3404170406860001', 0, 'NGANCAR', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5125, 'TRI SUTRISNO', '3402121504810001', 0, 'GONDANGLEG', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5126, 'TRI WAHYU UTAMA', '3404141512900005', 0, 'KROMODANGS', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5127, 'TRI WALUYO', '3404112607670001', 0, 'ROGOBANGSA', 'BIMOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5128, 'TRI WIDIANTARA', '3404 172008910001', 0, 'JETIS', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5129, 'TRI WIDODO', '3404110201890001', 0, 'KORIPAN', 'SINDUMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5130, 'TRI WIHARTANTO', '3404163003760001', 0, 'SENDEN,03/', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 40, '1', '0000-00-00 00:00:00'),
(5131, 'TRI WISNU ADJIWIBOWO', '340407 261076 0007', 0, 'KLEBENGAN ', 'CATURTUNGGAL', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5132, 'TRI WUSANA', '3404110704730004', 0, 'KORIPAN', 'SINDUMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5133, 'TRI YULIYANTO', '3404172907830001', 0, 'SEWON', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5134, 'TRI YUWANA', '340404010680001', 0, 'TENGAHAN X', 'SENDANGAGUNG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5135, 'TRIASIH', '3401101406080003', 0, 'SAMBIREJO ', 'PAKEM BINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5136, 'TRIYADI', '340402 210180 0006', 0, 'REWULU WET', 'SIDOKARTO', 0, 0, 0, '', '0000-00-00', 0, 51, '1', '0000-00-00 00:00:00'),
(5137, 'TRIYADI I', '340 401 301 188 0001', 0, 'JL. GEMPOL', 'CONDONGCATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5138, 'TRIYANTO', '340409151177005', 0, 'GAYAM ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5139, 'TRIYASA', '3404.1206.0967.0002', 0, 'TUREN RT 0', ' SARDONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5140, 'TRIYONO', '3404060808680003', 0, 'CANDI, 01/', 'SUMBERADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5141, 'TRIYONO SUWARNO', '3404160204650001', 0, 'NGEPRING,0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 41, '1', '0000-00-00 00:00:00'),
(5142, 'TRIYONO WINTOKO', '3404023309810003', 0, 'KLEBEN', ' SIDOREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5143, 'TRUBUS/PONIJO', '3404173112780006', 0, 'KALI TENGA', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5144, 'TUGAS SUGIYANTO', '340402 251269 0001', 0, 'REWULU WET', 'SIDOKARTO', 0, 0, 0, '', '0000-00-00', 0, 53, '1', '0000-00-00 00:00:00'),
(5145, 'TUGIMAN', '3404111608650005', 0, 'KARANG', 'WIDODOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5146, 'TUGIYAT', '3404032111700001', 0, 'JITAR NGEM', 'SUMBERARUM', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5147, 'TUGIYO', '3404160307700001', 0, 'RELOKASI T', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5148, 'TUKIDI', '3404163012620003', 0, 'KEMIRI RT ', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5149, 'TUKIJO', '340414050670005', 0, 'CUNGKUK 02', 'MARGOREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5150, 'TUKIMUN', '3404160104650001', 0, 'TURGO,04/0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 42, '1', '0000-00-00 00:00:00'),
(5151, 'TUKIRAH', '3404164510750001', 0, 'TURGO,03/0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 43, '1', '0000-00-00 00:00:00'),
(5152, 'TUKIRAN', '3404152011700001', 0, 'KENARUHAN,', 'DONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5153, 'TUTUT WIDODO', '3404100509830002', 0, 'SOMAN 1 NG', 'SELOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5154, 'TUWUH BAHRONI', '3404110301680002', 0, 'NGLARANG ', 'MALANGREJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5155, 'UNTUNG PRIBADI', '3404 1202 0279 0008', 0, 'JL.KAKAP 9', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00');
INSERT INTO `tblrelawan` (`idtblrelawan`, `no_induk`, `nama_relawan`, `nik`, `jenis_kelamin`, `alamat`, `kelurahan`, `kecamatan`, `desa`, `tempat_lahir`, `tgl_lahir`, `kecakapan`, `komunitas`, `create_user`, `create_time`) VALUES
(5156, 'UNTUNG SLAMET RIYANT', '3404 172203710001', 0, 'JETIS', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5157, 'UNTUNG SUHARYONO', '3404100909720002', 0, 'NGEPRINGAN', 'WUKIRSARI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5158, 'URIP SARWONO', '3404122812740007', 0, 'NGEPAS LOR', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5159, 'URIP UTOYO', '3404173112560024', 0, ' KARANGGEN', 'UMBULHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5160, 'UTORO', '3404 0712 0265 0004', 0, 'BABADAN BA', 'CONDONG CATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5161, 'VICO PRABA KUSUMA', '3404122610850004', 0, 'MARON RT 0', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5162, 'WACHID BEN BELLA', '340 401 250 868 0004', 0, 'RINGROAD B', 'AMBARKETAWANG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5163, 'WAGIMAN', '3404122306590002', 0, 'CABAH, DON', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5164, 'WAGIMIN', '3404097004740000', 0, 'BENDO ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5165, 'WAGIRAN', '3404100104700002', 0, 'KEBON', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5166, 'WAHADANI', '3404121308660005', 0, 'TEGALREJO,', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5167, 'WAHID NUROHMAN', '3404160606940001', 0, 'BOYONG RT/', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5168, 'WAHUDI', '3404 1230 0966 0001', 0, 'PLOSOKUNIN', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5169, 'WAHYU CHAIRUDIN', '3404 1226 0388 0002', 0, 'PLOSOKUNIN', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5170, 'WAHYU DWIHANTORO', '340416160169000 1', 0, 'TEGALSARI ', 'PAKEMBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5171, 'WAHYU KOMARI ZAMARI', '3404152201770001', 0, 'KARANGWUNI', 'DONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5172, 'WAHYU KRISTANTO', '340 401 131 072 0004', 0, 'MODINAN RT', 'BANYURADEN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5173, 'WAHYU PRABOWO', '3404 1607 0289 0001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5174, 'WAHYU PURNAMA SIDDIQ', '3404150405890001', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5175, 'WAHYU PURNOMO', '3404043103810001', 0, 'PULUHAN, 0', 'SENDANGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5176, 'WAHYU SETIAWAN', '3404 0720 0583 0020', 0, 'KOLOMBO BA', 'CONDONG CATUR', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5177, 'WAHYU TRIYANTO', '3404.1309.1181.0001', 0, 'BERAN KIDU', ' TRIDADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5178, 'WAHYU YUNIARTO', '3404.15.120697.0002', 0, 'REJODADI 0', 'BANGUNKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5179, 'WAHYUDHI HERIMAWAN', '3404.0619.0975.0001', 0, 'JONGKE LOR', 'SENDANGADI ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5180, 'WAHYUDI SAKSONO', '340 406 090 877 0002', 0, 'KARANG RT ', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5181, 'WAHYUDI SARYANTO SAR', '3404161704510001', 0, 'BOYONG RT ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5182, 'WAHYUDIONO', '3404.1208.0173.0003', 0, 'NGLEMPONG ', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5183, 'WAHYUNI', '3404125306810006', 0, 'JL. NGLEMP', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5184, 'WAKIDI', '3404042010700001', 0, 'PULUHAN, 0', 'SENDANGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5185, 'WAKIDI WIDIARSO', '3404140808530001', 0, 'NGEPOS 5/2', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5186, 'WAKIJO', '3404150512660002', 0, 'NGELODADI ', 'WONOKERTO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5187, 'WALIDIYANTO', '3404102109780002', 0, 'BAYEN', 'PURWOMARTANIM ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5188, 'WALIJO', '3404 1607 0289 0001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5189, 'WALJIANTO', '3404060810750001', 0, 'BANARAN RT', 'SENDANGADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5190, 'WALJIYANTO', '', 0, 'BANARAN ', 'SENDANGADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5191, 'WALUYO', '3404061404760003', 0, 'BEDINGIN, ', 'SUMBERADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5192, 'WANIDI', '3404172210760001', 0, 'PLUPUH', 'WUKIRSARI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5193, 'WARDADI', '3404131607690001', 0, 'MURANGAN V', 'TRIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5194, 'WARIDI', '3404 1205 0662 0003', 0, 'PLOSOKUNIN', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5195, 'WARINDI', '3404162908680001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5196, 'WARSIDI', '3404150507710004', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5197, 'WARTIYAH', '3404164807590002', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5198, 'WARTONO', '3404152001890001', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5199, 'WASIRUN', '340407 030779 0014', 0, 'BANTENG', 'SINDUHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5200, 'WASISTA', '3404110701680005', 0, ' BABADAN 0', 'WEDOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5201, 'WASIYADI GUNTORO', '3404121006650001', 0, 'RANDUGOWAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5202, 'WASPADA AMD', '3404 1213 1066 0002', 0, 'DRONO 04/3', 'SARDONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5203, 'WASPADA,AMD', '3404121310660002', 0, 'DRONO 4/33', 'SARDONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5204, 'WASTANA', '340308 100294 0001', 0, 'KOWANAN RT', 'SIDOAGUNG', 0, 0, 0, '', '0000-00-00', 0, 54, '1', '0000-00-00 00:00:00'),
(5205, 'WAWAN INDIYANTO', '347103 030267 0001', 0, 'LOSARI RT.', 'SUKOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5206, 'WAWAN OKMANTORO', '3404061110790009', 0, 'KRAGILAN R', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5207, 'WAWAN PURWANTO', '3404100610750000', 0, 'DALEM', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5208, 'WAWAN TRIYONO', '340410200769002', 0, 'BROMONILAN', 'PURWOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5209, 'WEMPI DANI SAPUTRA', '3404043003940001', 0, 'PULUHAN ', 'SENDANGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5210, 'WIBOWO SUNARTO', '3404020710610001', 0, 'GENITEM RT', 'SIDOAGUNG ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5211, 'WICAKNO HADI WIDODO', '3404120612660003', 0, 'JL PALAGAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5212, 'WIDARTO', '340413 200775 0002', 0, 'KEBON AGUN', 'TRIDADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5213, 'WIDAYANTO, ST', '', 0, 'GODEAN IV ', 'SIDOAGUNG', 0, 0, 0, '', '0000-00-00', 0, 55, '1', '0000-00-00 00:00:00'),
(5214, 'WIDAYAT', '340416100180000 3', 0, 'JETISAN', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5215, 'WIDI NUGRAHA', '3404060907730006', 0, 'POGUNG LOR', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5216, 'WIDIANTO', '3404 1321 0381 0003', 0, 'TOINO 01/1', ' PANDOWOHARJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5217, 'WIDIANTORO', '3404162003740002', 0, 'JL TURGO K', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5218, 'WIDODO', '3404041607890001', 0, 'TENGAHAN X', 'SENDANGAGUNG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5219, 'WIDODO LAMTORO', '3404112708700001', 0, 'NGERDI', 'SINDUMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5220, 'WIDOTO', '3404160404710001', 0, 'BENERAN, P', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5221, 'WIGIT RAHAYU', '3404090506640010', 0, 'LOSARI II ', 'WUKIRHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5222, 'WIHANDONO', '3404121911760004', 0, 'JL PALAGAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5223, 'WIJANGSOKNO', '3404122709740005', 0, 'JL PALAGAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5224, 'WIJIYANTO', '34041 70806560001', 0, 'RANDUSARI ', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5225, 'WINANTO', '3404 1606 0470 0001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5226, 'WINARDI', '340111008670005', 0, 'KOPATAN,04', 'UMBULMARTANI', 0, 0, 0, '', '0000-00-00', 0, 44, '1', '0000-00-00 00:00:00'),
(5227, 'WINARTO', '3404152802910001', 0, 'PANCOH RT ', 'GIRIKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5228, 'WINDARTO, ST', '340416120176000 2', 0, 'KEMPUT RT/', 'CANDIBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5229, 'WIRA PRATOMO', '3404061507830008', 0, 'PLAOSAN RT', 'TLOGOADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5230, 'WISNU PAMUNGKAS', '1871071407930009', 0, 'RANDUSARI', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5231, 'WISNU WIDODO', '3404102007810003', 0, 'GATAK II', 'SELOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5232, 'WITJIARTI', '3404124801680002', 0, 'RANDUGOWAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5233, 'WIYADI', '3404162503690001', 0, 'SUDIMORO,0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 45, '1', '0000-00-00 00:00:00'),
(5234, 'WIYANA', '3404143010760001', 0, 'TANGISAN, ', 'BANYUREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5235, 'WUSONO', '340402 290971 0002', 0, 'GANCAHAN V', 'SIDOMULYO', 0, 0, 0, '', '0000-00-00', 0, 56, '1', '0000-00-00 00:00:00'),
(5236, 'Y MARGO ENDRI S', '3404091712800000', 0, 'GAYAM ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5237, 'Y MARGONO', '3404091011740000', 0, 'GAYAM', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5238, 'Y. HERI YULIANTO ( B', '3404121307740002', 0, 'JETISDONOL', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5239, 'Y. MARGINO', '3404121704500003', 0, 'NGEPAS KID', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5240, 'YACOBUS RUBIMIN', '3404091502510000', 0, 'LEMAHBANG', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5241, 'YADIMIN', '3404170505810004', 0, 'SRUNEN ', 'GLAGAHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5242, 'YAENURI', '3471 0617 0172 0001', 0, 'PLOSOKUNIN', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5243, 'YAFIE AHMACH', '3404 170507890001', 0, 'JETIS', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5244, 'YAHYA KHANAFI', '340 401 131 271 0002', 0, 'GAMPING KI', 'AMBARKETAWANG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5245, 'YAHYA PRIYONO LEKSON', '3404 1607 0289 0001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5246, 'YANI SUTRISNO', '3404140702670003', 0, 'PANGGUNG 1', 'LUMBUNGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5247, 'YANTO', '3404090509730000', 0, 'BENDO ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5248, 'YANU WASKITO', '', 0, 'GARONGAN ', 'WONOKERTO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5249, 'YATNO', '3404160909840001', 0, 'RELOKASI T', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5250, 'YATNO SUWITO', '3404090109640000', 0, 'MAGIRSARI ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5251, 'YOGA NUGROHO UTOMO', '3404060704770002', 0, 'JATIREJO R', 'SENDANGADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5252, 'YOGI BUDI RAHARJO', '3404072101820024', 0, 'SINGOSUTAN', 'MAGUWOHARJO ', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5253, 'YOHANA DARI SETYANIN', '340 412 490 268 0002', 0, 'PANGGUNGSA', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5254, 'YOHANES SISWANTO', '3404150101690003', 0, 'GONDOARUM ', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5255, 'YOHANES SUKISNO', '340416 060975 0003', 0, 'PAGERAN RT', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5256, 'YOSEPH SUPADI', '3404160903710001', 0, 'PULOWATU,0', 'PURWOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 46, '1', '0000-00-00 00:00:00'),
(5257, 'YOSHFAT AJIE Y', '3172060311750002', 0, 'PERUM MUNG', 'SIDOARUM', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5258, 'YUANTO', '340416139478000 1', 0, 'PAKEMGEDE ', 'PAKEMBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5259, 'YUDANTORO', '3404082803750004', 0, 'JRAGUNG ', 'JOGOTIRTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5260, 'YUDHA PRIHATMOKO', '3404122506890004', 0, 'RANDUGOWAN', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5261, 'YUDIANTOKO', '340416100975000 2', 0, 'PAKEMGEDE ', 'PAKEMBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5262, 'YUDIYANTO DWI NUGROH', '3403102701770001', 0, 'GEDAREN 2 ', 'SUMBERGIRI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5263, 'YUHAKIM SUDI SETYANT', '3404061301610001', 0, 'BLUNYAH GE', 'SINDUADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5264, 'YULI PURWANTO', '3404172507840002', 0, 'BRONGKOL', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5265, 'YULIAN TRI NUGROHO', '340212 300781 0001', 0, 'MODALAN RT', 'BANGUNTAPAN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5266, 'YULIANTO EKO PRASETY', '347103 070786 0001', 0, 'PURBONEGAR', 'TERBAN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5267, 'YULIANTO WIBOWO', '340402 110793 0002', 0, 'KRAMAT LOR', 'SIDOARUM', 0, 0, 0, '', '0000-00-00', 0, 57, '1', '0000-00-00 00:00:00'),
(5268, 'YULIUS SULISTYA HADI', '3404.1509.1265.0002', 0, 'KEMBANGARU', 'DONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5269, 'YULIYANTI', '3404116909680002', 0, 'MORANGAN', 'NGEMPLAK', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5270, 'YULSIDIK ANANG WIBOW', '3404110407820001', 0, 'DALEM', 'WIDODOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5271, 'YUNAR SUSANTO', '3404121501840005', 0, 'BANTARJO, ', 'DONOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5272, 'YUNAS SYAIFULLAH RAM', '3404.13.030295.0001', 0, 'ASRAMA KOD', 'TRIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5273, 'YUNIARTA SETIAWAN', '3404.13.300690.0003', 0, 'KALAKIJO 0', 'TRIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5274, 'YUNUS KURNIA RAHMAN', '3404 1621 0287 0001', 0, 'KALIURANG ', 'HARGOBINANGUN', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5275, 'YUS SUSANTO', '3404040303680002', 0, 'GATAK', 'SENDANGSARI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5276, 'YUSAFAT SUGIANTORO', '34041 71106710001', 0, 'KUWANG ', 'ARGOMULYO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5277, 'YUSTINA PURNAMI', '3404155204810003', 0, 'NGELODADI', 'WONOKERTO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5278, 'YUSTINA SUMARSIH', '340409550678004', 0, 'GAYAM ', 'GAYAMHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5279, 'YUSUF', '760614521712', 0, 'CANCANGAN', 'WUKIRSARI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5280, 'YUSUP ATIK FAJAR RIA', '3404041311830002', 0, 'NGARANAN', 'SENDANGREJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5281, 'YUSUP HARYANTO', '3404132303800001', 0, 'KLONCOMAN', 'PANDOWOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5282, 'YUYUN MUNANDAR', '3404103105870003', 0, 'DALEM', 'TAMANMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5283, 'ZAENAL ARIFIN', '3308042208780003', 0, 'GROJOGAN R', 'PANDOWOHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5284, 'ZAHIQ DHUHRI', '3404061609970002', 0, 'KRANDON RT', 'SARIHARJO', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5285, 'ZAHRODIN AHMAD', '3404 1213 0575 0005', 0, 'PLOSOKUNIN', 'MINOMARTANI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5286, 'ZAMHASARI', '3308052008580001', 0, 'JELEHAN KU', 'SRUMBUNG', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00'),
(5287, 'ZUMEINI', '340406 060580 0006', 0, 'SEMBADA AS', 'TLOGOADI', 0, 0, 0, '', '0000-00-00', 0, 0, '1', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblssb`
--

CREATE TABLE `tblssb` (
  `idtblssb` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `kecamatan` int(11) DEFAULT NULL,
  `siswa_l` int(4) DEFAULT NULL,
  `siswa_p` int(4) DEFAULT NULL,
  `fasilitas` varchar(100) DEFAULT NULL,
  `penanggung_jawab` varchar(50) DEFAULT NULL,
  `tlpn_2` varchar(20) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `tampung` int(6) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `kategori` varchar(4) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `potensi_bencana` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblternak`
--

CREATE TABLE `tblternak` (
  `idtblternak` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblternak`
--

INSERT INTO `tblternak` (`idtblternak`, `nama`, `deskripsi`, `create_date`, `flag`) VALUES
(1, 'kambing', 'mbeeeeeeeeee', '2017-09-29 14:12:32', 0),
(2, 'sapi', 'sapi jogres sama ayam', '2017-09-29 14:25:22', 0),
(3, 'kerbau', 'kerbau yang membebani seluruh nafas ini :(', '2017-09-29 14:25:48', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltracking`
--

CREATE TABLE `tbltracking` (
  `idtbltracking` int(40) NOT NULL,
  `idtbluser` varchar(10) DEFAULT NULL,
  `latitude` float(10,7) NOT NULL,
  `longitude` float(10,7) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `idtbllaporan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbluser`
--

CREATE TABLE `tbluser` (
  `idtbluser` int(11) NOT NULL,
  `no_induk` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telp` varchar(16) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `idtblgroup` int(11) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `resetcode` varchar(255) DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0,
  `fb_token` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbluser`
--

INSERT INTO `tbluser` (`idtbluser`, `no_induk`, `nama`, `email`, `telp`, `alamat`, `idtblgroup`, `password`, `create_date`, `resetcode`, `reset_time`, `flag`, `fb_token`, `last_login`, `device`) VALUES
(1, NULL, 'Dikau Mardika', 'dikau.blank@gmail.com', '085643233547', NULL, 1, 'fcea920f7412b5da7be0cf42b8c93759', '2018-02-06 23:48:12', '', '2022-04-12 14:46:21', 0, NULL, NULL, NULL),
(2, NULL, 'Pusdalops', 'pusdalops.sleman@gmail.com', NULL, NULL, 2, 'f1ec3e5a1ee64f821f6253cd64bb8eba', '2018-02-07 01:12:48', NULL, NULL, 0, NULL, NULL, NULL),
(3, NULL, 'Nina', 'Nina@dispertaru', NULL, NULL, 5, '827ccb0eea8a706c4c34a16891f84e7b', '2019-02-27 13:42:23', NULL, NULL, 0, NULL, NULL, NULL),
(4, NULL, 'Yayan', 'produkbalap@gmail.com', NULL, NULL, 2, '827ccb0eea8a706c4c34a16891f84e7b', '2019-03-15 21:01:11', NULL, NULL, 0, NULL, NULL, NULL),
(5, NULL, 'Angga Kusuma', 'bee.ang86@gmail.com', NULL, NULL, 1, '0df00f127e37742f2cd08543e177da5e', '2019-03-24 20:08:52', NULL, NULL, 0, NULL, NULL, NULL),
(6, NULL, 'BNPB', 'bnpb.pusdalops@gmail.com', NULL, NULL, 5, '4cdc9571c0ab3950914abb90f4be1d3e', '2019-09-01 18:33:48', NULL, NULL, 0, NULL, NULL, NULL),
(7, NULL, 'Riesky Arum', 'Rieskyarum@yahoo.co.id', NULL, NULL, 5, '827ccb0eea8a706c4c34a16891f84e7b', '2019-12-02 13:27:53', NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_cekstok_detail`
--

CREATE TABLE `tr_cekstok_detail` (
  `id_cekstok` int(5) NOT NULL,
  `kode_barang` varchar(9) NOT NULL,
  `id_barang` int(9) NOT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `qty_komputer` int(5) DEFAULT 0,
  `qty_fisik` int(5) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_cekstok_header`
--

CREATE TABLE `tr_cekstok_header` (
  `id_cekstok` int(5) NOT NULL,
  `id_cetak` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_stok_detail`
--

CREATE TABLE `tr_stok_detail` (
  `id_stok` int(5) NOT NULL,
  `stok` decimal(12,2) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0,
  `penerima` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_stok_detail`
--

INSERT INTO `tr_stok_detail` (`id_stok`, `stok`, `status`, `keterangan`, `create_user`, `create_time`, `flag`, `penerima`) VALUES
(51188, '10000.00', '1', 'Bantuan dari PT. Kimia Farma ', NULL, '2019-09-24 08:49:56', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. sleman'),
(51188, '750.00', '1', 'Bantuan dari Bali Caring Community', NULL, '2019-09-24 08:52:54', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51188, '33480.00', '1', 'Dari Dinas Sosial Kab. Sleman', NULL, '2019-09-24 12:58:12', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51189, '2.00', '1', 'Dari Dinas Sosial Kab. Sleman', NULL, '2019-09-25 08:39:17', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51190, '10000.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:40:40', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51191, '13.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:41:12', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51192, '1.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:42:04', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51193, '23.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:42:33', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51194, '67.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:42:56', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51195, '73.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:43:13', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51196, '1800.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:43:35', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51197, '18.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:44:02', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51198, '7.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:44:40', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51199, '5.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:45:58', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51200, '5.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:46:21', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51201, '5.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:49:52', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51202, '68.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:50:20', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51203, '16.00', '1', 'dari APBD Sleman', NULL, '2019-09-25 08:51:10', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51204, '31.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:51:40', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51205, '26.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:52:22', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51206, '178.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:52:47', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51207, '7.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:53:06', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51208, '39.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:53:23', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51209, '29.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:54:14', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51210, '40.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:54:43', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51211, '110.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:55:10', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51212, '20.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:55:28', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51213, '1000.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:55:52', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51214, '16.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:56:36', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51215, '66.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:57:16', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51216, '50.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:59:11', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51217, '11.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 08:59:56', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51218, '1.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:00:19', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51219, '4.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:01:12', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51220, '3.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:01:30', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51221, '1.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:01:52', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51222, '24.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:02:23', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51222, '24.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:02:23', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51223, '235.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:03:00', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51224, '9.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:03:33', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51225, '43.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:04:05', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51226, '20.00', '1', 'dari BPBD DIY', NULL, '2019-09-25 09:04:33', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51223, '-6.00', '2', 'Bayan RT 03 RW 23 Girikerto Turi Sleman', NULL, '2019-09-27 08:33:18', 0, 'Suwardi'),
(51193, '55.00', '1', 'dari APBD Sleman', NULL, '2019-09-28 13:45:05', 0, 'Petugas Gudang Logistik dan Peralatan BPBD Kab. Sleman'),
(51190, '-100.00', '2', 'Pemberian stok Barak ', NULL, '2020-11-20 15:23:56', 0, 'Nurchyono');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_stok_header`
--

CREATE TABLE `tr_stok_header` (
  `id_stok` int(11) NOT NULL,
  `idtblgudang` int(5) NOT NULL,
  `idtblbarang` varchar(40) DEFAULT NULL,
  `sisa_stok` decimal(12,2) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_stok_header`
--

INSERT INTO `tr_stok_header` (`id_stok`, `idtblgudang`, `idtblbarang`, `sisa_stok`, `create_user`, `create_time`, `flag`) VALUES
(51188, 1, '22', '44230.00', NULL, '2019-09-24 08:49:56', 0),
(51189, 1, '30', '2.00', NULL, '2019-09-25 08:39:17', 0),
(51190, 1, '21', '9900.00', NULL, '2019-09-25 08:40:40', 0),
(51191, 1, '26', '13.00', NULL, '2019-09-25 08:41:12', 0),
(51192, 1, '27', '1.00', NULL, '2019-09-25 08:42:04', 0),
(51193, 1, '29', '78.00', NULL, '2019-09-25 08:42:33', 0),
(51194, 1, '35', '67.00', NULL, '2019-09-25 08:42:56', 0),
(51195, 1, '36', '73.00', NULL, '2019-09-25 08:43:13', 0),
(51196, 1, '32', '1800.00', NULL, '2019-09-25 08:43:35', 0),
(51197, 1, '38', '18.00', NULL, '2019-09-25 08:44:02', 0),
(51198, 1, '49', '7.00', NULL, '2019-09-25 08:44:40', 0),
(51199, 1, '43', '5.00', NULL, '2019-09-25 08:45:58', 0),
(51200, 1, '50', '5.00', NULL, '2019-09-25 08:46:21', 0),
(51201, 1, '52', '5.00', NULL, '2019-09-25 08:49:52', 0),
(51202, 1, '13', '68.00', NULL, '2019-09-25 08:50:20', 0),
(51203, 1, '14', '16.00', NULL, '2019-09-25 08:51:10', 0),
(51204, 1, '15', '31.00', NULL, '2019-09-25 08:51:40', 0),
(51205, 1, '16', '26.00', NULL, '2019-09-25 08:52:22', 0),
(51206, 1, '18', '178.00', NULL, '2019-09-25 08:52:47', 0),
(51207, 1, '19', '7.00', NULL, '2019-09-25 08:53:06', 0),
(51208, 1, '20', '39.00', NULL, '2019-09-25 08:53:23', 0),
(51209, 1, '23', '29.00', NULL, '2019-09-25 08:54:14', 0),
(51210, 1, '24', '40.00', NULL, '2019-09-25 08:54:43', 0),
(51211, 1, '25', '110.00', NULL, '2019-09-25 08:55:10', 0),
(51212, 1, '28', '20.00', NULL, '2019-09-25 08:55:28', 0),
(51213, 1, '31', '1000.00', NULL, '2019-09-25 08:55:52', 0),
(51214, 1, '33', '16.00', NULL, '2019-09-25 08:56:36', 0),
(51215, 1, '34', '66.00', NULL, '2019-09-25 08:57:16', 0),
(51216, 1, '37', '50.00', NULL, '2019-09-25 08:59:11', 0),
(51217, 1, '39', '11.00', NULL, '2019-09-25 08:59:56', 0),
(51218, 1, '41', '1.00', NULL, '2019-09-25 09:00:19', 0),
(51219, 1, '42', '4.00', NULL, '2019-09-25 09:01:12', 0),
(51220, 1, '44', '3.00', NULL, '2019-09-25 09:01:30', 0),
(51221, 1, '45', '1.00', NULL, '2019-09-25 09:01:52', 0),
(51222, 1, '46', '48.00', NULL, '2019-09-25 09:02:23', 0),
(51223, 1, '47', '229.00', NULL, '2019-09-25 09:03:00', 0),
(51224, 1, '48', '9.00', NULL, '2019-09-25 09:03:33', 0),
(51225, 1, '17', '43.00', NULL, '2019-09-25 09:04:05', 0),
(51226, 1, '51', '20.00', NULL, '2019-09-25 09:04:33', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_access`
--
ALTER TABLE `admin_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`idtblgroup`),
  ADD KEY `id_menu` (`idtblmenu`);

--
-- Indeks untuk tabel `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ms_kota`
--
ALTER TABLE `ms_kota`
  ADD PRIMARY KEY (`kode_kota`),
  ADD KEY `kode_prov` (`kode_prov`);

--
-- Indeks untuk tabel `ms_provinsi`
--
ALTER TABLE `ms_provinsi`
  ADD PRIMARY KEY (`kode_prov`),
  ADD KEY `PRKODE` (`kode_prov`);

--
-- Indeks untuk tabel `ms_satuan`
--
ALTER TABLE `ms_satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblabsensi`
--
ALTER TABLE `tblabsensi`
  ADD PRIMARY KEY (`idtblabsensi`);

--
-- Indeks untuk tabel `tblagama`
--
ALTER TABLE `tblagama`
  ADD PRIMARY KEY (`idtblagama`);

--
-- Indeks untuk tabel `tblatensi`
--
ALTER TABLE `tblatensi`
  ADD PRIMARY KEY (`idtblatensi`);

--
-- Indeks untuk tabel `tblbarak`
--
ALTER TABLE `tblbarak`
  ADD PRIMARY KEY (`idtblbarak`);

--
-- Indeks untuk tabel `tblbarang`
--
ALTER TABLE `tblbarang`
  ADD PRIMARY KEY (`idtblbarang`);

--
-- Indeks untuk tabel `tblbencana`
--
ALTER TABLE `tblbencana`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblcuaca`
--
ALTER TABLE `tblcuaca`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbldampak`
--
ALTER TABLE `tbldampak`
  ADD PRIMARY KEY (`idtbldampak`);

--
-- Indeks untuk tabel `tbldesa`
--
ALTER TABLE `tbldesa`
  ADD PRIMARY KEY (`idtbldesa`);

--
-- Indeks untuk tabel `tbldusun`
--
ALTER TABLE `tbldusun`
  ADD PRIMARY KEY (`idtbldusun`,`id_kel`),
  ADD KEY `tbldusun_ibfk_1` (`id_kel`);

--
-- Indeks untuk tabel `tblews`
--
ALTER TABLE `tblews`
  ADD PRIMARY KEY (`idtblews`);

--
-- Indeks untuk tabel `tblgalery`
--
ALTER TABLE `tblgalery`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblgroup`
--
ALTER TABLE `tblgroup`
  ADD PRIMARY KEY (`idtblgroup`);

--
-- Indeks untuk tabel `tblgudang`
--
ALTER TABLE `tblgudang`
  ADD PRIMARY KEY (`idtblgudang`);

--
-- Indeks untuk tabel `tblinstansi`
--
ALTER TABLE `tblinstansi`
  ADD PRIMARY KEY (`idtblinstansi`);

--
-- Indeks untuk tabel `tblinventaris`
--
ALTER TABLE `tblinventaris`
  ADD PRIMARY KEY (`idinventaris`),
  ADD KEY `idkategori` (`idkategori`),
  ADD KEY `tblinventaris_ibfk_2` (`idlokasi`);

--
-- Indeks untuk tabel `tbljarak`
--
ALTER TABLE `tbljarak`
  ADD PRIMARY KEY (`idjarak`);

--
-- Indeks untuk tabel `tblkaryawan`
--
ALTER TABLE `tblkaryawan`
  ADD PRIMARY KEY (`idtblkaryawan`);

--
-- Indeks untuk tabel `tblkategori_inventaris`
--
ALTER TABLE `tblkategori_inventaris`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `tblkecakapan`
--
ALTER TABLE `tblkecakapan`
  ADD PRIMARY KEY (`idtblkecakapan`);

--
-- Indeks untuk tabel `tblkecamatan`
--
ALTER TABLE `tblkecamatan`
  ADD PRIMARY KEY (`id_kec`);

--
-- Indeks untuk tabel `tblkegiatan`
--
ALTER TABLE `tblkegiatan`
  ADD PRIMARY KEY (`idtblkegiatan`);

--
-- Indeks untuk tabel `tblkelurahan`
--
ALTER TABLE `tblkelurahan`
  ADD PRIMARY KEY (`id_kel`);

--
-- Indeks untuk tabel `tblkk`
--
ALTER TABLE `tblkk`
  ADD PRIMARY KEY (`idtblkk`);

--
-- Indeks untuk tabel `tblkk_detail`
--
ALTER TABLE `tblkk_detail`
  ADD PRIMARY KEY (`id`,`idtblkk`),
  ADD KEY `idtblkk` (`idtblkk`);

--
-- Indeks untuk tabel `tblkml`
--
ALTER TABLE `tblkml`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblkomunitas`
--
ALTER TABLE `tblkomunitas`
  ADD PRIMARY KEY (`idtblkomunitas`);

--
-- Indeks untuk tabel `tblkrb`
--
ALTER TABLE `tblkrb`
  ADD PRIMARY KEY (`idtblkrb`);

--
-- Indeks untuk tabel `tbllaporan`
--
ALTER TABLE `tbllaporan`
  ADD PRIMARY KEY (`idtbllaporan`),
  ADD KEY `nir` (`nir`,`nama`,`dusun`),
  ADD KEY `nama` (`nama`),
  ADD KEY `tgl_kejadian` (`tgl_kejadian`);

--
-- Indeks untuk tabel `tbllaporan_detail`
--
ALTER TABLE `tbllaporan_detail`
  ADD PRIMARY KEY (`idtbllaporan_det`);

--
-- Indeks untuk tabel `tbllaporan_galery`
--
ALTER TABLE `tbllaporan_galery`
  ADD PRIMARY KEY (`idgalery`,`idtbllaporan`),
  ADD KEY `idtbllaporan` (`idtbllaporan`);

--
-- Indeks untuk tabel `tbllaporan_kk`
--
ALTER TABLE `tbllaporan_kk`
  ADD PRIMARY KEY (`idtbllaporan_kk`,`idtbllaporan`);

--
-- Indeks untuk tabel `tbllaporan_personil`
--
ALTER TABLE `tbllaporan_personil`
  ADD PRIMARY KEY (`idpersonil`),
  ADD KEY `idtbllaporan` (`idtbllaporan`),
  ADD KEY `idtblkaryawan` (`idtblkaryawan`);

--
-- Indeks untuk tabel `tbllokasi_inventaris`
--
ALTER TABLE `tbllokasi_inventaris`
  ADD PRIMARY KEY (`idlokasi`);

--
-- Indeks untuk tabel `tblmenu`
--
ALTER TABLE `tblmenu`
  ADD PRIMARY KEY (`idtblmenu`),
  ADD KEY `url` (`url`);

--
-- Indeks untuk tabel `tblpengungsian`
--
ALTER TABLE `tblpengungsian`
  ADD PRIMARY KEY (`idtblpengungsian`);

--
-- Indeks untuk tabel `tblpengungsian_detail`
--
ALTER TABLE `tblpengungsian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtblpengungsian` (`idtblpengungsian`);

--
-- Indeks untuk tabel `tblperalatan`
--
ALTER TABLE `tblperalatan`
  ADD PRIMARY KEY (`idtblperalatan`);

--
-- Indeks untuk tabel `tblperalatan_detail`
--
ALTER TABLE `tblperalatan_detail`
  ADD PRIMARY KEY (`id`,`idtblperalatan`),
  ADD KEY `idtblperalatan` (`idtblperalatan`);

--
-- Indeks untuk tabel `tblperingatandini`
--
ALTER TABLE `tblperingatandini`
  ADD PRIMARY KEY (`idperingatan`);

--
-- Indeks untuk tabel `tblpotensi`
--
ALTER TABLE `tblpotensi`
  ADD PRIMARY KEY (`idtblpotensi`);

--
-- Indeks untuk tabel `tblrelawan`
--
ALTER TABLE `tblrelawan`
  ADD PRIMARY KEY (`idtblrelawan`);

--
-- Indeks untuk tabel `tblssb`
--
ALTER TABLE `tblssb`
  ADD PRIMARY KEY (`idtblssb`);

--
-- Indeks untuk tabel `tblternak`
--
ALTER TABLE `tblternak`
  ADD PRIMARY KEY (`idtblternak`);

--
-- Indeks untuk tabel `tbltracking`
--
ALTER TABLE `tbltracking`
  ADD PRIMARY KEY (`idtbltracking`),
  ADD KEY `latitude` (`latitude`,`longitude`),
  ADD KEY `create_time` (`create_time`);

--
-- Indeks untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`idtbluser`);

--
-- Indeks untuk tabel `tr_cekstok_detail`
--
ALTER TABLE `tr_cekstok_detail`
  ADD PRIMARY KEY (`id_cekstok`,`kode_barang`,`id_barang`),
  ADD KEY `id_cekstok` (`id_cekstok`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `tr_cekstok_header`
--
ALTER TABLE `tr_cekstok_header`
  ADD PRIMARY KEY (`id_cekstok`);

--
-- Indeks untuk tabel `tr_stok_detail`
--
ALTER TABLE `tr_stok_detail`
  ADD KEY `id_stok` (`id_stok`);

--
-- Indeks untuk tabel `tr_stok_header`
--
ALTER TABLE `tr_stok_header`
  ADD PRIMARY KEY (`id_stok`,`idtblgudang`),
  ADD UNIQUE KEY `kode_lokasi` (`idtblgudang`,`idtblbarang`),
  ADD KEY `kode_outlet` (`idtblgudang`),
  ADD KEY `kode_barang` (`idtblbarang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_access`
--
ALTER TABLE `admin_access`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1512;

--
-- AUTO_INCREMENT untuk tabel `ms_satuan`
--
ALTER TABLE `ms_satuan`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `tblabsensi`
--
ALTER TABLE `tblabsensi`
  MODIFY `idtblabsensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblagama`
--
ALTER TABLE `tblagama`
  MODIFY `idtblagama` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tblatensi`
--
ALTER TABLE `tblatensi`
  MODIFY `idtblatensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblbarak`
--
ALTER TABLE `tblbarak`
  MODIFY `idtblbarak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tblbarang`
--
ALTER TABLE `tblbarang`
  MODIFY `idtblbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `tblbencana`
--
ALTER TABLE `tblbencana`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tblcuaca`
--
ALTER TABLE `tblcuaca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbldampak`
--
ALTER TABLE `tbldampak`
  MODIFY `idtbldampak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `tbldesa`
--
ALTER TABLE `tbldesa`
  MODIFY `idtbldesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbldusun`
--
ALTER TABLE `tbldusun`
  MODIFY `idtbldusun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=823;

--
-- AUTO_INCREMENT untuk tabel `tblews`
--
ALTER TABLE `tblews`
  MODIFY `idtblews` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tblgalery`
--
ALTER TABLE `tblgalery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblgroup`
--
ALTER TABLE `tblgroup`
  MODIFY `idtblgroup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tblgudang`
--
ALTER TABLE `tblgudang`
  MODIFY `idtblgudang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tblinstansi`
--
ALTER TABLE `tblinstansi`
  MODIFY `idtblinstansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `tblinventaris`
--
ALTER TABLE `tblinventaris`
  MODIFY `idinventaris` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbljarak`
--
ALTER TABLE `tbljarak`
  MODIFY `idjarak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tblkaryawan`
--
ALTER TABLE `tblkaryawan`
  MODIFY `idtblkaryawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tblkategori_inventaris`
--
ALTER TABLE `tblkategori_inventaris`
  MODIFY `idkategori` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblkecakapan`
--
ALTER TABLE `tblkecakapan`
  MODIFY `idtblkecakapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tblkegiatan`
--
ALTER TABLE `tblkegiatan`
  MODIFY `idtblkegiatan` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblkelurahan`
--
ALTER TABLE `tblkelurahan`
  MODIFY `id_kel` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `tblkk`
--
ALTER TABLE `tblkk`
  MODIFY `idtblkk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblkk_detail`
--
ALTER TABLE `tblkk_detail`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblkml`
--
ALTER TABLE `tblkml`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblkomunitas`
--
ALTER TABLE `tblkomunitas`
  MODIFY `idtblkomunitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tblkrb`
--
ALTER TABLE `tblkrb`
  MODIFY `idtblkrb` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbllaporan`
--
ALTER TABLE `tbllaporan`
  MODIFY `idtbllaporan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbllaporan_detail`
--
ALTER TABLE `tbllaporan_detail`
  MODIFY `idtbllaporan_det` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbllaporan_galery`
--
ALTER TABLE `tbllaporan_galery`
  MODIFY `idgalery` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbllaporan_kk`
--
ALTER TABLE `tbllaporan_kk`
  MODIFY `idtbllaporan_kk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbllaporan_personil`
--
ALTER TABLE `tbllaporan_personil`
  MODIFY `idpersonil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbllokasi_inventaris`
--
ALTER TABLE `tbllokasi_inventaris`
  MODIFY `idlokasi` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblmenu`
--
ALTER TABLE `tblmenu`
  MODIFY `idtblmenu` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `tblpengungsian`
--
ALTER TABLE `tblpengungsian`
  MODIFY `idtblpengungsian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblpengungsian_detail`
--
ALTER TABLE `tblpengungsian_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tblperalatan`
--
ALTER TABLE `tblperalatan`
  MODIFY `idtblperalatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT untuk tabel `tblperalatan_detail`
--
ALTER TABLE `tblperalatan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblperingatandini`
--
ALTER TABLE `tblperingatandini`
  MODIFY `idperingatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblpotensi`
--
ALTER TABLE `tblpotensi`
  MODIFY `idtblpotensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblrelawan`
--
ALTER TABLE `tblrelawan`
  MODIFY `idtblrelawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5288;

--
-- AUTO_INCREMENT untuk tabel `tblssb`
--
ALTER TABLE `tblssb`
  MODIFY `idtblssb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblternak`
--
ALTER TABLE `tblternak`
  MODIFY `idtblternak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbltracking`
--
ALTER TABLE `tbltracking`
  MODIFY `idtbltracking` int(40) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `idtbluser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tr_cekstok_header`
--
ALTER TABLE `tr_cekstok_header`
  MODIFY `id_cekstok` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tr_stok_detail`
--
ALTER TABLE `tr_stok_detail`
  MODIFY `id_stok` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51227;

--
-- AUTO_INCREMENT untuk tabel `tr_stok_header`
--
ALTER TABLE `tr_stok_header`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51227;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ms_kota`
--
ALTER TABLE `ms_kota`
  ADD CONSTRAINT `ms_kota_ibfk_1` FOREIGN KEY (`kode_prov`) REFERENCES `ms_provinsi` (`kode_prov`);

--
-- Ketidakleluasaan untuk tabel `tbldusun`
--
ALTER TABLE `tbldusun`
  ADD CONSTRAINT `tbldusun_ibfk_1` FOREIGN KEY (`id_kel`) REFERENCES `tblkelurahan` (`id_kel`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tblinventaris`
--
ALTER TABLE `tblinventaris`
  ADD CONSTRAINT `tblinventaris_ibfk_1` FOREIGN KEY (`idkategori`) REFERENCES `tblkategori_inventaris` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblinventaris_ibfk_2` FOREIGN KEY (`idlokasi`) REFERENCES `tbllokasi_inventaris` (`idlokasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tblkk_detail`
--
ALTER TABLE `tblkk_detail`
  ADD CONSTRAINT `tblkk_detail_ibfk_1` FOREIGN KEY (`idtblkk`) REFERENCES `tblkk` (`idtblkk`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbllaporan_galery`
--
ALTER TABLE `tbllaporan_galery`
  ADD CONSTRAINT `tbllaporan_galery_ibfk_1` FOREIGN KEY (`idtbllaporan`) REFERENCES `tbllaporan` (`idtbllaporan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbllaporan_personil`
--
ALTER TABLE `tbllaporan_personil`
  ADD CONSTRAINT `tbllaporan_personil_ibfk_1` FOREIGN KEY (`idtbllaporan`) REFERENCES `tbllaporan` (`idtbllaporan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbllaporan_personil_ibfk_3` FOREIGN KEY (`idtblkaryawan`) REFERENCES `tblkaryawan` (`idtblkaryawan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tblpengungsian_detail`
--
ALTER TABLE `tblpengungsian_detail`
  ADD CONSTRAINT `tblpengungsian_detail_ibfk_1` FOREIGN KEY (`idtblpengungsian`) REFERENCES `tblpengungsian` (`idtblpengungsian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tblperalatan_detail`
--
ALTER TABLE `tblperalatan_detail`
  ADD CONSTRAINT `tblperalatan_detail_ibfk_1` FOREIGN KEY (`idtblperalatan`) REFERENCES `tblperalatan` (`idtblperalatan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tr_cekstok_detail`
--
ALTER TABLE `tr_cekstok_detail`
  ADD CONSTRAINT `tr_cekstok_detail_ibfk_1` FOREIGN KEY (`id_cekstok`) REFERENCES `tr_cekstok_header` (`id_cekstok`);

--
-- Ketidakleluasaan untuk tabel `tr_stok_detail`
--
ALTER TABLE `tr_stok_detail`
  ADD CONSTRAINT `tr_stok_detail_ibfk_1` FOREIGN KEY (`id_stok`) REFERENCES `tr_stok_header` (`id_stok`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
