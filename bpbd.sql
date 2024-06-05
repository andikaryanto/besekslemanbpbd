-- MySQL dump 10.13  Distrib 5.5.58, for Linux (i686)
--
-- Host: localhost    Database: zadmin_bpbdjogja
-- ------------------------------------------------------
-- Server version	5.5.58

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT NULL COMMENT '1 = active, 0 = inactive',
  `active_code` varchar(30) DEFAULT NULL,
  `created_date` varchar(40) DEFAULT NULL,
  `active_date` varchar(40) DEFAULT NULL,
  `role` tinyint(1) DEFAULT NULL COMMENT '1 = admin, 2 = user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Elos ananto','socmed.eloz@gmail.com','be3fac283968a5b5472b4ba258db82dd92eed0b3',1,'O0wKZyY49vWo','1452681005',NULL,1),(8,'elos','elos.ananto@propanraya.com','be3fac283968a5b5472b4ba258db82dd92eed0b3',1,'QJgBjIwyixyS','1459743597','1459743689',2),(9,'ay','ayan@propanraya.com','adcd7048512e64b48da55b027577886ee5a36350',2,'hcGuXVnqJ3ZE','1460121395',NULL,2),(10,'agha','agus.suryanto@gmaila','be3fac283968a5b5472b4ba258db82dd92eed0b3',1,NULL,'1473655746',NULL,1),(11,'Ahmad Yani','ahmadyani@szetoaccurate.com','d576b4688ba7f3a849bc1271b8b08559b6ce1047',1,NULL,'1466922834',NULL,1),(12,'AYN','ahmadyani917@gmail.com','d576b4688ba7f3a849bc1271b8b08559b6ce1047',1,NULL,'1466923818',NULL,2),(13,'Hello Szeto','hello@szetoaccurate.com','adcd7048512e64b48da55b027577886ee5a36350',1,NULL,'1466932900',NULL,1),(14,'coba','coba@coba.com','cf8a16a5cf78bd2391882f3757233e085a801bfc',1,NULL,'1473657714',NULL,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_access`
--

DROP TABLE IF EXISTS `admin_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_access` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `idtblgroup` int(12) DEFAULT NULL,
  `idtblmenu` int(12) DEFAULT NULL,
  `view` tinyint(1) DEFAULT '0',
  `add` tinyint(1) DEFAULT '0',
  `update` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_user` (`idtblgroup`),
  KEY `id_menu` (`idtblmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_access`
--

LOCK TABLES `admin_access` WRITE;
/*!40000 ALTER TABLE `admin_access` DISABLE KEYS */;
INSERT INTO `admin_access` VALUES (126,1,2,1,0,0,0),(127,1,5,1,1,1,1),(128,1,21,1,1,1,1),(129,1,22,1,0,1,1),(130,1,24,1,1,1,1),(158,1,26,1,1,1,1),(187,2,1,1,1,0,0),(188,2,2,1,1,0,0),(189,2,3,1,1,1,1),(190,2,4,1,1,1,1),(191,2,5,1,1,1,1),(192,2,6,1,1,1,0),(193,2,7,1,1,1,0),(194,2,8,1,1,1,0),(195,2,9,1,1,1,0),(196,2,10,1,1,1,0),(197,2,11,1,1,1,0),(198,2,12,1,1,1,0),(199,2,13,1,1,1,0),(200,2,14,1,1,1,0),(201,2,15,1,1,1,0),(202,2,16,1,1,1,0),(203,2,17,1,1,1,0),(204,2,18,1,1,1,0),(205,2,19,1,1,1,0),(206,2,20,1,1,1,0),(207,2,21,1,1,1,1),(208,2,22,1,1,1,1),(209,2,23,1,1,1,1),(210,2,24,1,1,1,1),(211,2,25,1,1,1,1),(212,2,26,1,1,1,1),(213,2,27,1,1,1,1),(214,2,28,1,1,0,0),(215,4,1,1,1,1,0),(216,4,20,1,1,1,0),(217,4,22,1,1,1,0),(218,4,27,1,1,1,0),(219,4,28,1,1,1,0);
/*!40000 ALTER TABLE `admin_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `province_id` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,' Aceh Barat',1),(2,' Aceh Barat Daya',1),(3,' Aceh Besar',1),(4,' Aceh Jaya',1),(5,' Aceh Selatan',1),(6,' Aceh Singkil',1),(7,' Aceh Tamiang',1),(8,' Aceh Tengah',1),(9,' Aceh Tenggara',1),(10,' Aceh Timur',1),(11,' Aceh Utara',1),(12,' Bener Meriah',1),(13,' Bireuen',1),(14,' Gayo Lues',1),(15,' Nagan Raya',1),(16,' Pidie',1),(17,' Pidie Jaya',1),(18,' Simeulue',1),(19,'Banda Aceh',1),(20,'Langsa',1),(21,'Lhokseumawe',1),(22,'Sabang',1),(23,'Subulussalam',1),(24,' Asahan',2),(25,' Batu Bara',2),(26,' Dairi',2),(27,' Deli Serdang',2),(28,' Humbang Hasundutan',2),(29,' Karo',2),(30,' Labuhanbatu',2),(31,' Labuhanbatu Selatan',2),(32,' Labuhanbatu Utara',2),(33,' Langkat',2),(34,' Mandailing Natal',2),(35,' Nias',2),(36,' Nias Barat',2),(37,' Nias Selatan',2),(38,' Nias Utara',2),(39,' Padang Lawas',2),(40,' Padang Lawas Utara',2),(41,' Pakpak Bharat',2),(42,' Samosir',2),(43,' Serdang Bedagai',2),(44,' Simalungun',2),(45,' Tapanuli Selatan',2),(46,' Tapanuli Tengah',2),(47,' Tapanuli Utara',2),(48,' Toba Samosir',2),(49,'Binjai',2),(50,'Gunung Sitoli',2),(51,'Medan',2),(52,'Padang Sidempuan',2),(53,'Pematangsiantar',2),(54,'Sibolga',2),(55,'Tanjung Balai',2),(56,'Tebing Tinggi',2),(57,' Bengkulu Selatan',3),(58,' Bengkulu Tengah',3),(59,' Bengkulu Utara',3),(60,' Benteng',3),(61,' Kaur',3),(62,' Kepahiang',3),(63,' Lebong',3),(64,' Mukomuko',3),(65,' Rejang Lebong',3),(66,' Seluma',3),(67,'Bengkulu',3),(68,' Batang Hari',4),(69,' Bungo',4),(70,' Kerinci',4),(71,' Merangin',4),(72,' Muaro Jambi',4),(73,' Sarolangun',4),(74,' Tjg Jabung Barat',4),(75,' Tjg Jabung Timur',4),(76,' Tebo',4),(77,'Jambi',4),(78,'Sungai Penuh',4),(79,' Bengkalis',5),(80,' Indragiri Hilir',5),(81,' Indragiri Hulu',5),(82,' Kampar',5),(83,' Kuantan Singingi',5),(84,' Pelalawan',5),(85,' Rokan Hilir',5),(86,' Rokan Hulu',5),(87,' Siak',5),(88,'Pekanbaru',5),(89,'Dumai',5),(90,' Kepulauan Meranti',5),(91,' Agam',6),(92,' Dharmasraya',6),(93,' Kepulauan Mentawai',6),(94,' Lima Puluh Kota',6),(95,' Padang Pariaman',6),(96,' Pasaman',6),(97,' Pasaman Barat',6),(98,' Pesisir Selatan',6),(99,' Sijunjung',6),(100,' Solok',6),(101,' Solok Selatan',6),(102,' Tanah Datar',6),(103,'Bukittinggi',6),(104,'Padang',6),(105,'Padangpanjang',6),(106,'Pariaman',6),(107,'Payakumbuh',6),(108,'Sawahlunto',6),(109,'Solok',6),(110,' Banyuasin',7),(111,' Empat Lawang',7),(112,' Lahat',7),(113,' Muara Enim',7),(114,' Musi Banyuasin',7),(115,' Musi Rawas',7),(116,' Ogan Ilir',7),(117,' Ogan Komering Ilir',7),(118,' Ogan Komering Ulu',7),(119,' Ogan Kmrg Ulu Sel',7),(120,' Ogan Kom. Ulu Timur',7),(121,'Lubuklinggau',7),(122,'Pagar Alam',7),(123,'Palembang',7),(124,'Prabumulih',7),(125,' Lampung Barat',8),(126,' Lampung Selatan',8),(127,' Lampung Tengah',8),(128,' Lampung Timur',8),(129,' Lampung Utara',8),(130,' Mesuji',8),(131,' Pesawaran',8),(132,' Pringsewu',8),(133,' Tanggamus',8),(134,' Tulang Bawang',8),(135,' Tulang Bawang Barat',8),(136,' Way Kanan',8),(137,'Bandar Lampung',8),(138,'Metro',8),(139,' Bangka',9),(140,' Bangka Barat',9),(141,' Bangka Selatan',9),(142,' Bangka Tengah',9),(143,' Belitung',9),(144,' Belitung Timur',9),(145,'Pangkal Pinang',9),(146,' Bintan',10),(147,' Karimun',10),(148,' Kepulauan Anambas',10),(149,' Lingga',10),(150,' Natuna',10),(151,'Batam',10),(152,'Tanjung Pinang',10),(153,' Lebak',11),(154,' Pandeglang',11),(155,' Serang',11),(156,' Tangerang',11),(157,'Cilegon',11),(158,'Serang',11),(159,'Tangerang',11),(160,'Tangerang Selatan',11),(161,' Bandung',12),(162,' Bandung Barat',12),(163,' Bekasi',12),(164,' Bogor',12),(165,' Ciamis',12),(166,' Cianjur',12),(167,' Cirebon',12),(168,' Garut',12),(169,' Indramayu',12),(170,' Karawang',12),(171,' Kuningan',12),(172,' Majalengka',12),(173,' Purwakarta',12),(174,' Subang',12),(175,' Sukabumi',12),(176,' Sumedang',12),(177,' Tasikmalaya',12),(178,'Bandung',12),(179,'Banjar',12),(180,'Bekasi',12),(181,'Bogor',12),(182,'Cimahi',12),(183,'Cirebon',12),(184,'Depok',12),(185,'Sukabumi',12),(186,'Tasikmalaya',12),(187,'  Kepulauan Seribu',13),(188,' Jakarta Barat',13),(189,' Jakarta Pusat',13),(190,' Jakarta Selatan',13),(191,' Jakarta Timur',13),(192,' Jakarta Utara',13),(193,' Banjarnegara',14),(194,' Banyumas',14),(195,' Batang',14),(196,' Blora',14),(197,' Boyolali',14),(198,' Brebes',14),(199,' Cilacap',14),(200,' Demak',14),(201,' Grobogan',14),(202,' Jepara',14),(203,' Karanganyar',14),(204,' Kebumen',14),(205,' Kendal',14),(206,' Klaten',14),(207,' Kudus',14),(208,' Magelang',14),(209,' Pati',14),(210,' Pekalongan',14),(211,' Pemalang',14),(212,' Purbalingga',14),(213,' Purworejo',14),(214,' Rembang',14),(215,' Semarang',14),(216,' Sragen',14),(217,' Sukoharjo',14),(218,' Tegal',14),(219,' Temanggung',14),(220,' Wonogiri',14),(221,' Wonosobo',14),(222,'Magelang',14),(223,'Pekalongan',14),(224,'Salatiga',14),(225,'Semarang',14),(226,'Surakarta',14),(227,'Tegal',14),(228,' Bangkalan',15),(229,' Banyuwangi',15),(230,' Blitar',15),(231,' Bojonegoro',15),(232,' Bondowoso',15),(233,' Gresik',15),(234,' Jember',15),(235,' Jombang',15),(236,' Kediri',15),(237,' Lamongan',15),(238,' Lumajang',15),(239,' Madiun',15),(240,' Magetan',15),(241,' Malang',15),(242,' Mojokerto',15),(243,' Nganjuk',15),(244,' Ngawi',15),(245,' Pacitan',15),(246,' Pamekasan',15),(247,' Pasuruan',15),(248,' Ponorogo',15),(249,' Probolinggo',15),(250,' Sampang',15),(251,' Sidoarjo',15),(252,' Situbondo',15),(253,' Sumenep',15),(254,' Trenggalek',15),(255,' Tuban',15),(256,' Tulungagung',15),(257,'Batu',15),(258,'Blitar',15),(259,'Kediri',15),(260,'Madiun',15),(261,'Malang',15),(262,'Mojokerto',15),(263,'Pasuruan',15),(264,'Probolinggo',15),(265,'Surabaya',15),(266,' Bantul',16),(267,' Gunung Kidul',16),(268,' Kulon Progo',16),(269,' Sleman',16),(270,'Yogyakarta',16),(271,' Badung',17),(272,' Bangli',17),(273,' Buleleng',17),(274,' Gianyar',17),(275,' Jembrana',17),(276,' Karangasem',17),(277,' Klungkung',17),(278,' Tabanan',17),(279,'Denpasar',17),(280,' Bima',18),(281,' Dompu',18),(282,' Lombok Barat',18),(283,' Lombok Tengah',18),(284,' Lombok Timur',18),(285,' Lombok Utara',18),(286,' Sumbawa',18),(287,' Sumbawa Barat',18),(288,'Bima',18),(289,'Mataram',18),(290,' Kupang',19),(291,' Timor Tengah Sel',19),(292,' Timor Tengah Utara',19),(293,' Belu',19),(294,' Alor',19),(295,' Flores Timur',19),(296,' Sikka',19),(297,' Ende',19),(298,' Ngada',19),(299,' Manggarai',19),(300,' Sumba Timur',19),(301,' Sumba Barat',19),(302,' Lembata',19),(303,' Rote Ndao',19),(304,' Manggarai Barat',19),(305,' Nagekeo',19),(306,' Sumba Tengah',19),(307,' Sumba Barat Daya',19),(308,' Manggarai Timur',19),(309,' Sabu Raijua',19),(310,'Kupang',19),(311,' Bengkayang',20),(312,' Kapuas Hulu',20),(313,' Kayong Utara',20),(314,' Ketapang',20),(315,' Kubu Raya',20),(316,' Landak',20),(317,' Melawi',20),(318,' Pontianak',20),(319,' Sambas',20),(320,' Sanggau',20),(321,' Sekadau',20),(322,' Sintang',20),(323,'Pontianak',20),(324,'Singkawang',20),(325,' Balangan',21),(326,' Banjar',21),(327,' Barito Kuala',21),(328,' Hulu Sungai Selatan',21),(329,' Hulu Sungai Tengah',21),(330,' Hulu Sungai Utara',21),(331,' Kotabaru',21),(332,' Tabalong',21),(333,' Tanah Bumbu',21),(334,' Tanah Laut',21),(335,' Tapin',21),(336,'Banjarbaru',21),(337,'Banjarmasin',21),(338,' Barito Selatan',22),(339,' Barito Timur',22),(340,' Barito Utara',22),(341,' Gunung Mas',22),(342,' Kapuas',22),(343,' Katingan',22),(344,' Kotawaringin Barat',22),(345,' Kotawaringin Timur',22),(346,' Lamandau',22),(347,' Murung Raya',22),(348,' Pulang Pisau',22),(349,' Sukamara',22),(350,' Seruyan',22),(351,'Palangka Raya',22),(352,' Berau',23),(353,' Bulungan',23),(354,' Kutai Barat',23),(355,' Kutai Kartanegara',23),(356,' Kutai Timur',23),(357,' Malinau',23),(358,' Nunukan',23),(359,' Paser',23),(360,' Penajam Paser Utara',23),(361,' Tana Tidung',23),(362,'Balikpapan',23),(363,'Bontang',23),(364,'Samarinda',23),(365,'Tarakan',23),(366,' Boalemo',24),(367,' Bone Bolango',24),(368,' Gorontalo',24),(369,' Gorontalo Utara',24),(370,' Pohuwato',24),(371,'Gorontalo',24),(372,' Bantaeng',25),(373,' Barru',25),(374,' Bone',25),(375,' Bulukumba',25),(376,' Enrekang',25),(377,' Gowa',25),(378,' Jeneponto',25),(379,' Kepulauan Selayar',25),(380,' Luwu',25),(381,' Luwu Timur',25),(382,' Luwu Utara',25),(383,' Maros',25),(384,' Pangkajene & Kep',25),(385,' Pinrang',25),(386,' Sidenreng Rappang',25),(387,' Sinjai',25),(388,' Soppeng',25),(389,' Takalar',25),(390,' Tana Toraja',25),(391,' Toraja Utara',25),(392,' Wajo',25),(393,'Makassar',25),(394,'Palopo',25),(395,'Parepare',25),(396,' Bombana',26),(397,' Buton',26),(398,' Buton Utara',26),(399,' Kolaka',26),(400,' Kolaka Utara',26),(401,' Konawe',26),(402,' Konawe Selatan',26),(403,' Konawe Utara',26),(404,' Muna',26),(405,' Wakatobi',26),(406,'Bau-Bau',26),(407,'Kendari',26),(408,' Banggai',27),(409,' Banggai Kepulauan',27),(410,' Buol',27),(411,' Donggala',27),(412,' Morowali',27),(413,' Parigi Moutong',27),(414,' Poso',27),(415,' Tojo Una-Una',27),(416,' Toli-Toli',27),(417,' Sigi',27),(418,'Palu',27),(419,' Bolaang Mongondow',28),(420,' Bolaang Mngndw Sel',28),(421,' Bolaang Mong. Timur',28),(422,' Bolaang Mong Utara',28),(423,' Kepulauan Sangihe',28),(424,'Siau Tagul. Biaro',28),(425,' Kepulauan Talaud',28),(426,' Minahasa',28),(427,' Minahasa Selatan',28),(428,' Minahasa Tenggara',28),(429,' Minahasa Utara',28),(430,'Bitung',28),(431,'Kotamobagu',28),(432,'Manado',28),(433,'Tomohon',28),(434,' Majene',29),(435,' Mamasa',29),(436,' Mamuju',29),(437,' Mamuju Utara',29),(438,' Polewali Mandar',29),(439,' Buru',30),(440,' Buru Selatan',30),(441,' Kepulauan Aru',30),(442,' Maluku Barat Daya',30),(443,' Maluku Tengah',30),(444,' Maluku Tenggara',30),(445,' Maluku Tenggr Brt',30),(446,' Seram Bagian Barat',30),(447,' Seram Bagian Timur',30),(448,'Ambon',30),(449,'Tual',30),(450,' Halmahera Barat',31),(451,' Halmahera Tengah',31),(452,' Halmahera Utara',31),(453,' Halmahera Selatan',31),(454,' Kepulauan Sula',31),(455,' Halmahera Timur',31),(456,' Pulau Morotai',31),(457,'Ternate',31),(458,'Tidore Kepulauan',31),(459,' Asmat',32),(460,' Biak Numfor',32),(461,' Boven Digoel',32),(462,' Deiyai',32),(463,' Dogiyai',32),(464,' Intan Jaya',32),(465,' Jayapura',32),(466,' Jayawijaya',32),(467,' Keerom',32),(468,' Kepulauan Yapen',32),(469,' Lanny Jaya',32),(470,' Mamberamo Raya',32),(471,' Mamberamo Tengah',32),(472,' Mappi',32),(473,' Merauke',32),(474,' Mimika',32),(475,' Nabire',32),(476,' Nduga',32),(477,' Paniai',32),(478,' Pegunungan Bintang',32),(479,' Puncak',32),(480,' Puncak Jaya',32),(481,' Sarmi',32),(482,' Supiori',32),(483,' Tolikara',32),(484,' Waropen',32),(485,' Yahukimo',32),(486,' Yalimo',32),(487,'Jayapura',32),(488,' Fakfak',33),(489,' Kaimana',33),(490,' Manokwari',33),(491,' Maybrat',33),(492,' Raja Ampat',33),(493,' Sorong',33),(494,' Sorong Selatan',33),(495,' Tambrauw',33),(496,' Teluk Bintuni',33),(497,' Teluk Wondama',33),(498,'Sorong',33);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `def`
--

DROP TABLE IF EXISTS `def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `def` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nama_toko` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `footer_word` varchar(255) DEFAULT NULL,
  `footer_greating` varchar(100) DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `update_by` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `def`
--

LOCK TABLES `def` WRITE;
/*!40000 ALTER TABLE `def` DISABLE KEYS */;
INSERT INTO `def` VALUES (1,'Johanes Material2','jalan mana aja oke hehehe2','0821138161582','Barang yang sudah dibeli tidak dapat di tukar<br>','TERIMAKASIH2','2016-12-06',1);
/*!40000 ALTER TABLE `def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_data`
--

DROP TABLE IF EXISTS `master_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_data` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(20) NOT NULL,
  `kategori` int(2) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `satuan` varchar(7) NOT NULL,
  `harga_modal` varchar(12) DEFAULT NULL,
  `harga_jual` varchar(10) DEFAULT NULL,
  `keterangan` varchar(28) DEFAULT NULL,
  `distributor` varchar(28) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`kode_barang`,`satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_data`
--

LOCK TABLES `master_data` WRITE;
/*!40000 ALTER TABLE `master_data` DISABLE KEYS */;
INSERT INTO `master_data` VALUES (2,'FP0001',1,'cocoplas 40 x 1 x 08 putih roll','1','890000','10000','40 m','1',0),(3,'FP0002',1,'cocoplas 40 x 1 x 08 putih meter','2','23421','28000','','1',0),(4,'FP0003',1,'fancy glass 40 x 1 x 07 putih roll','1','850000','10000','40 m','1',0),(5,'FP0004',1,'fancy glass 40 x1 x 07 putih meter','2','22369','28000','','1',0),(6,'FP0005',1,'fancy glass 40 x 1 x 07 ribben roll','1','850000','10000','40 m','1',0),(7,'FP0006',1,'fancy glass 40 x1 x 07 putih meter','2','22369','28000','','1',0),(8,'CA0001',2,'Nippon vinilex white','3','102520','105000','5 kg','2',0),(9,'BD0001',3,'isarplas tube','4','5600','8500','coba edit','3',0),(10,'BD0002',3,'isarplas kaleng / kuas','5','31500','40000','','3',0),(11,'BD0003',3,'karbit MDQ','6','20900','25000','1 dus @25kg : 522.500','3',0),(12,'BD0004',3,'fox biru 350 gr','7','5900','9000','350 gr','3',0),(13,'BD0005',3,'soda api 1 kg','7','9800','18500','1 kg','3',0),(14,'BD0006',3,'fox kuning 1/2 ','5','20500','30000','300 gr','3',0),(15,'BD0007',3,'thiner impala 1 ltr','5','19000','24000','1 liter','3',0),(16,'BD0008',3,'thiner kapinis 1 ltr','5','9750','18500','1 liter','3',0),(17,'BD0009',3,'HCL + gen','8','180000','250000','','3',0),(18,'BL0001',4,'almunium foil single','1','300000','425000','50 m','3',0),(19,'BL0002',4,'almunium foil single meter','2','6250','10000','','3',0),(20,'BL0003',4,'almunium foil double','1','430000','555000','50 m','3',0),(21,'BL0004',4,'almunium foil double meter','2','8958','12500','','3',0),(22,'CA0002',2,'metrolite gallon','3','83000','90000','5 kg','3',0),(23,'BL0005',4,'garpu injuk baja','9','60000','85000','','4',0),(24,'BD0010',3,'kunci besi 6,8,10,12','9','12500','25000','kunci besi panjang biru','4',0),(25,'BL0006',4,'loster sakura','9','2300','6000','20 x 20','5',0),(26,'BL0007',4,'loster wajik','9','1800','3500','10 x 20','5',0),(27,'BL0008',4,'Go green 150 x 80 Merah','10','34200','52500','PL','6',0),(28,'BL0009',4,'Go green 180 x 80 Merah','10','41040','63000','PL','6',0),(29,'BL0010',4,'Go green 210 x 80 Merah','10','47880','73500','PL ','6',0),(30,'BL0011',4,'Go green 240 x 80 Merah','10','54720','84000','PL 60.800','6',0),(31,'BL0012',4,'go green 300 x 80 Merah','10','70200','105000','PL 78.000','6',0),(32,'BE0001',5,'kabel Ties hitam 20 cm','7','7500','10000','','7',0),(33,'BE0002',5,'mata obeng gypsum bosch ph2 x 65mm','9','9555','10000','mata obeng / screw driver','7',0),(34,'BE0003',5,'dynabolt 12 x 60 `','9','1315','10000','1 box : 100 pcs','7',0),(35,'BD0011',3,'bak cat','9','3125','10000','1 lsn : 37.500','7',0),(36,'BD0012',3,'roskam pvc hitam','9','3750','10000','1 lsn : 45.000','7',0),(37,'BE0004',5,'kunci pintu bs lanvin + body komp','9','75000','10000','kunci besi 1 set + body komp','7',0),(38,'BE0005',5,'pahat kayu abus 1 1/4','9','8542','10000','1 lsn : 102.500','7',0),(39,'BE0006',5,'tembakan lem chrome tulang','9','12500','10000','tembakan sealent','7',0),(40,'BE0007',5,'palu karet reyner 16 oz','9','13000','10000','1 lsn : 156.000','7',0),(41,'BE0008',5,'palu bodem 08 lb','9','46000','10000','','7',0),(42,'BE0009',5,'palu bodem 12 lb','9','69000','10000','','7',0),(43,'BE0010',5,'hak angin tiptop 8 sn','9','3334','10000','1 lsn : 40.000','7',0),(44,'BE0011',5,'mata serut bison bc 13/4','9','12000','10000','1 lsn : 120.000','7',0),(45,'BE0012',5,'shower toilet figo pt','9','27500','10000','','7',0),(46,'BE0013',5,'shower toilet rxt bm','9','27500','10000','','7',0),(47,'BE0014',5,'showe toilet rxt iv','9','27500','10000','','7',0),(48,'BD0013',3,'paku seng 3 ss ulir','11','130000','10000','harga 1 dus','7',0),(49,'BE0015',5,'balvalve pvc hd blitz 1/2','9','7750','10000','','7',0),(50,'BE0016',5,'balvalve pvc hd blitz 3/4','9','9750','10000','','7',0),(51,'BE0017',5,'kuas cat 633 abus 2,5\"','9','4688','10000','1 lsn : 56.250','7',0),(52,'BE0018',5,'kape gagang fiber bracio 2','9','4667','10000','1 lsn : 56.000','7',0),(53,'BE0019',5,'kape gagang fiber bracio 2,5\"','9','5084','10000','1 lsn : 61.000','7',0),(54,'BE0020',5,'obeng bb glorius transparant 5','9','4792','10000','1 lsn : 57.500','7',0),(55,'BE0021',5,'batu asah panda 6','9','7000','10000','','7',0),(56,'BE0022',5,'batu asah panda 8','9','7500','10000','','7',0),(57,'BE0023',5,'tarikan laci rrt 4','9','667','10000','1 lsn : 8.000','7',0),(58,'BE0024',5,'grendel stainless axl bc 2','9','3750','10000','1 lsn : 45.000','7',0),(59,'BE0025',5,'baut baja ringan 10 x 19','11','122500','10000','1 dus : 122.500','7',0),(60,'BE0026',5,'engsel tebal elbrus 3 sn','9','15667','10000','1 lsn : 188.000','7',0),(61,'BL0013',4,'semen gresik 40 kg','12','','10000','','3',0),(62,'BL0014',4,'semen tiga roda 50 kg','12','','10000','','3',0),(63,'BL0015',4,'semen SCG 50 kg','12','','10000','','3',0),(64,'CA0003',2,'kuda terbang 0,1L','5','','10000','1 lsn : 87.750','3',0),(65,'BD0014',3,'klem pipa pvc 3','9','900','10000','','3',0),(66,'BD0015',3,'thiner nd botol kratindeng','9','','10000','1 lsn : 30.000','3',0),(67,'CA0004',2,'meni besi hijau kampak 1 ltr','5','16750','10000','','3',0),(68,'BD0016',3,'air keras','9','','10000','1 lsn : 37.500','3',0),(69,'BD0017',3,'aica aibon 0,1L','5','7550','10000','','3',0),(70,'BD0018',3,'kain pell','9','','10000','1 kodi : 55.000','3',0),(71,'BD0019',3,'kaporit bubuk 0,5kg','7','14000','10000','','3',0),(72,'CA0005',2,'metrolite pail','5','830000','10000','','3',0),(73,'BD0020',3,'porstex','9','','10000','1 dus : 172.500','3',0),(74,'BD0021',3,'thiner impala gallon','3','76750','10000','','3',0),(75,'BD0022',3,'afduner','13','4750','10000','','3',0),(76,'CA0006',2,'meni kayu kampak gallon','3','53800','10000','','3',0),(77,'BD0023',3,'soda api 1/2 kg','9','4900','10000','','3',0),(78,'BD0024',3,'neorever 1/4','9','18500','10000','','3',0),(79,'BD0025',3,'fox putih 1/2 kg','13','11250','10000','','3',0),(80,'BD0026',3,'sanpolac 1 kg','5','30000','10000','','3',0),(81,'BD0027',3,'isamu 1 kg','5','49000','10000','','3',0),(82,'CA0007',2,'flinkote seiv','5','31900','10000','','3',0),(83,'CA0008',2,'seiv tembaga 1/4','5','22000','10000','','3',0),(84,'CA0009',2,'seiv mas 1/4','5','25750','10000','','3',0),(85,'BD0028',3,'fox kuning gallon','3','129000','10000','','3',0),(86,'BD0029',3,'corment','5','25000','10000','','3',0),(87,'BD0030',3,'tali rafiah','9','19250','10000','','3',0),(88,'BD0031',3,'brown mas kangguru 0,1','5','','10000','1 lsn : 115.000','3',0),(89,'BD0032',3,'klem pipa pvc 1/2','9','300','10000','','3',0),(90,'BD0033',3,'fox putih 1 kg','13','19500','10000','','3',0),(91,'BD0034',3,'pengki hijau','9','6667','10000','1 lsn : 80.000','3',0),(92,'BD0035',3,'aica aibon 1/2','5','29800','10000','','3',0),(93,'CA0010',2,'flinkote sheep','5','20000','10000','','3',0),(94,'BL0016',4,'selang flex trilliun 5/8 roll 100M','9','340000','10000','','3',0),(95,'BL0017',4,'selang flex trilliun 5/8 roll meter','2','3400','10000','','3',0),(96,'BL0018',4,'mill','12','25000','10000','','3',0),(97,'BD0036',3,'thiner ND super + dirigen','9','160000','10000','','3',0),(98,'CA0011',2,'vernis glasstone clear gloss','5','56700','10000','63.000 diskon 10%','3',0),(99,'CA0012',2,'seiv hitam doff 880M','5','49000','10000','','3',0),(100,'CA0013',2,'seiv putih doff 180M','5','49000','10000','','3',0),(101,'BD0037',3,'alcasit','7','16200','10000','','3',0),(102,'BD0038',3,'oker AGA putih','7','5100','10000','','3',0),(103,'BD0039',3,'lem intraplas tube','9','3750','10000','','3',0),(104,'BD0040',3,'lem karpet tube','9','6000','10000','','3',0),(105,'BD0041',3,'lem fiber nun kcl','13','7500','10000','','3',0),(106,'BD0042',3,'calt bond','5','41400','10000','','3',0),(107,'CA0014',2,'aquaproof 1 kg hitam','5','41800','10000','','8',0),(108,'CA0015',2,'aquaproof 1 kg biru ','5','41800','10000','','8',0),(109,'CA0016',2,'aquaproof 1 kg merah','5','41800','10000','','8',0),(110,'CA0017',2,'aquaproof 1 kg abu abu','5','41800','10000','','8',0),(111,'CA0018',2,'aquaproof 1 kg abu muda','5','41800','10000','','8',0),(112,'CA0019',2,'aquaproof 1 kg coklat','5','41800','10000','','8',0),(113,'CA0020',2,'aquaproof 1 kg putih','5','41800','10000','','8',0),(114,'CA0021',2,'aquaproof 1 kg cream','5','41800','10000','','8',0),(115,'CA0022',2,'aquaproof 1 kg transparant','5','41800','10000','','8',0),(116,'CA0023',2,'aquaproof gallon cream','3','158423','10000','','8',0),(117,'CA0024',2,'aquaproof gallon abu abu','3','158423','10000','','8',0),(118,'CA0025',2,'aquaproof gallon hitam','3','158423','10000','','8',0),(119,'CA0026',2,'aquaproof gallon putih','3','158423','10000','','8',0),(120,'CA0027',2,'aquaproof gallon coklat','3','158423','10000','','8',0),(121,'CA0028',2,'aquaproof gallon merah','3','158423','10000','','8',0),(122,'CA0029',2,'aquaproof gallon abu muda','3','158423','10000','','8',0),(123,'CA0030',2,'aquaproof gallon biru','3','158423','10000','','8',0),(124,'CA0031',2,'aquaproof gallon transparant','3','158423','10000','','8',0),(125,'BL0019',4,'star mortar M811 40kg perekat bata ringan','12','','10000','71.000 (20 extra 2)','9',0),(126,'BL0020',4,'coumpond aplus sak','12','50000','10000','','9',0),(127,'BD0043',3,'coumpond aplus 1kg','14','','10000','','9',0),(128,'BL0021',4,'semen putih tiga roda sak','12','88000','10000','','9',0),(129,'BD0044',3,'semen putih 1 kg','14','','10000','','9',0),(130,'BL0022',4,'gypsum aplus 9mm x 1200 x 2400','10','49500','10000','','9',0),(131,'BL0023',4,'MU 380 perekat bata ringan 40kg','12','','10000','','10',0),(132,'BL0024',4,'MU 420 perekat keramik 25 kg','12','70000','79000','','9',0),(133,'BL0025',4,'MU 400 perekat granit tile 25 kg','12','103000','115000','','9',0),(134,'BL0026',4,'besi slup 4 X 8','15','30000','45000','','9',0),(135,'BL0027',4,'besi slup 3 x 8','15','22500','35000','','9',0),(136,'BL0028',4,'karpet h/m 55 roll 50M','1','230000','10000','','11',0),(137,'BL0029',4,'karpet h/m 55 roll meter','2','5600','10000','','11',0),(138,'BL0030',4,'karpet h/m 90 roll 50M','1','380000','10000','','11',0),(139,'BL0031',4,'karpet h/m 90 roll meter','2','7600','10000','','11',0),(140,'BL0032',4,'ember cor jumbo hijau','9','5300','10000','','11',0),(141,'BL0033',4,'karpet h/m 110 roll 50m','1','560000','10000','','11',0),(142,'BL0034',4,'karpet h/m 110 meter','2','11200','10000','','11',0),(143,'BL0035',4,'terpal jadi 3 x 4','9','46800','10000','','11',0),(144,'BL0036',4,'terpal jadi 5 x 6','9','117000','10000','','11',0),(145,'BL0037',4,'terpal meteran orange/biru','2','7250','10000','','11',0),(146,'BL0038',4,'terpal meteran orange/biru roll 100m','1','725000','10000','','11',0),(147,'BL0039',4,'ember cor kecil hijau','9','2900','10000','','11',0),(148,'BD0045',3,'dop 4','9','3750','10000','','11',0),(149,'BL0040',4,'kawat loket 1/2 x 90 putih roll 10m','1','79000','10000','','11',0),(150,'BL0041',4,'kawat loket 1/2 x 90 putih roll meter','2','7900','10000','','11',0),(151,'CA0032',2,'catylac 1501 putih gallon ','3','102286','10000','5 kg','12',0),(152,'CA0033',2,'catylac 1501 putih pail','16','498422','10000','25 kg','12',0),(153,'CA0034',2,'dulux pentalite BW pail ','16','1012236','10000','20 L','12',0),(154,'CA0035',2,'catylac base T911A gallon','3','87930','10000','5 kg','12',0),(155,'CA0036',2,'dulux pentalite BW gallon','3','137506','10000','2,5 L','12',0),(156,'CA0037',2,'dulux wheatershield BW gallon','3','206260','10000','2,5 L','12',0),(157,'CA0038',2,'dulux v-gloss 9000 white','5','45042','50000','0,8 L','12',0),(158,'CA0039',2,'dulux v-gloss 122 black','5','45042','50000','0,8 L','12',0),(159,'CA0040',2,'dulux v-gloss 9002 white doff','5','49349','55000','0,8 L','12',0),(160,'CA0041',2,'dulux v-gloss 40710 black doff','5','49349','55000','0,8 L','12',0),(161,'CA0042',2,'dulux v-gloss 46637 1 earthland','5','45042','50000','0,8 L','12',0),(162,'CA0043',2,'dulux v-gloss 46632 2 golden brown','5','45042','50000','0,8 L','12',0),(163,'CA0044',2,'dulux v-gloss 41674 3 blue night wk','5','48900','55000','0,8 L','12',0),(164,'CA0045',2,'dulux v-gloss 40700 4 dolpin grey','5','45042','50000','0,8 L','12',0),(165,'CA0046',2,'dulux v-gloss 43631 5 papillon red','5','45042','50000','0,8 L','12',0),(166,'CA0047',2,'dulux v-gloss 47527 6 pumpkin orange wk','5','48900','55000','0,8 L','12',0),(167,'CA0048',2,'dulux v-gloss 42622 7 aspen green','5','45042','50000','0,8 L','12',0),(168,'CA0049',2,'dulux v gloss 41671 8 saphire blue wk','5','48900','55000','0,8 L','12',0),(169,'CA0050',2,'dulux v-gloss 40699 9 jade dove ','5','45042','50000','0,8 L','12',0),(170,'CA0051',2,'dulux v-gloss 43630 10 vermilion wk','5','48900','55000','0,8 L','12',0),(171,'CA0052',2,'dulux v-gloss 45586 11 lily yellow wk','5','48900','55000','0,8 L','12',0),(172,'CA0053',2,'dulux v-gloss 42621 12 victoria garden','5','45042','50000','0,8 L','12',0),(173,'CA0054',2,'dulux v-gloss 40701 13 north grey','5','45042','50000','0,8 L','12',0),(174,'CA0055',2,'dulux v-gloss 43633 14 old coral','5','45042','50000','0,8 L','12',0),(175,'CA0056',2,'dulux v-gloss 42619 15 turquoise','5','45042','50000','0,8 L','12',0),(176,'CA0057',2,'dulux v-gloss 41672 16 oriental blue wk','5','48900','55000','0,8 L','12',0),(177,'CA0058',2,'dulux v-gloss 47525 18 cinnabar orange wk','5','48900','55000','0,8 L','12',0),(178,'CA0059',2,'dulux v-gloss 45587 19 sunshine canary wk','5','48900','55000','0,8 L','12',0),(179,'CA0060',2,'dulux v-gloss 42624 20 evergreen wk','5','48900','55000','0,8 L','12',0),(180,'CA0061',2,'dulux v-gloss 43632 22 sympony pink wk','5','48900','55000','0,8 L','12',0),(181,'CA0062',2,'dulux v-gloss 42620 23 starfruit','5','45042','50000','0,8 L','12',0),(182,'CA0063',2,'dulux v-gloss 46635 24 mocha rich','5','45042','50000','0,8 L','12',0),(183,'CA0064',2,'dulux v-gloss 46631 25 brown leather','5','45042','50000','0,8 L','12',0),(184,'CA0065',2,'dulux v-gloss 46636 26 candy honey','5','45042','50000','0,8 L','12',0),(185,'CA0066',2,'dulux v-gloss 46633 27 dust brown','5','45042','50000','0,8 L','12',0),(186,'CA0067',2,'dulux v-gloss 46628 28 bamboo cream','5','45042','50000','0,8 L','12',0),(187,'CA0068',2,'dulux v-gloss 46630 29 cinnamon suede','5','45042','50000','0,8 L','12',0),(188,'CA0069',2,'dulux v-gloss 46634 30 spicy brown','5','45042','50000','0,8 L','12',0),(189,'CA0070',2,'dulux v-gloss 47526 31 sweet melon','5','45042','50000','0,8 L','12',0),(190,'CA0071',2,'dulux v-gloss 46627 32 butterfly','5','45042','50000','0,8 L','12',0),(191,'CA0072',2,'dulux v-gloss 45585 33 candlelight','5','45042','50000','0,8 L','12',0),(192,'CA0073',2,'dulux v-gloss 46626 34 papyrus iced','5','45042','50000','0,8 L','12',0),(193,'CA0074',2,'dulux v-gloss 41675 35 elize blue wk','5','48900','55000','0,8 L','12',0),(194,'CA0075',2,'dulux v-gloss 45588 36 mustard banana wk','5','48900','55000','0,8 L','12',0),(195,'CA0076',2,'dulux v-gloss 40698 37 pewter grey','5','45042','50000','0,8 L','12',0),(196,'CA0077',2,'dulux v-gloss 46629 38 adeline pearl','5','45042','50000','0,8 L','12',0),(197,'CA0078',2,'dulux v-gloss 41673 39 neptune navy','5','45042','50000','0,8 L','12',0),(198,'CA0079',2,'dulux v-gloss 42623 40 eden green','5','45042','50000','0,8 L','12',0),(199,'CA0080',2,'dulux pentalite base T922C gallon','3','94061','10000','2,5 L','12',0),(200,'CA0081',2,'dulux wheatershield base 1918B gallon','3','181965','10000','2,5 L','12',0),(201,'BL0042',4,'list profil K6 ','15','11900','10000','4 m / btg','13',0),(202,'BL0043',4,'List profil k22','15','13600','10000','4 m / btg','13',0),(203,'BL0044',4,'papan cor tebal','10','8700','10000','','14',0),(204,'BE0027',5,'kape pvc 7','9','11000','10000','','15',0),(205,'BE0028',5,'kunci laci huben 138','9','6250','10000','1 ls : 75.000','15',0),(206,'BE0029',5,'sarung tangan karet','17','8500','10000','','15',0),(207,'BE0030',5,'sarung tangan kain bintik tebal','17','6250','10000','1 ls : 75.000','15',0),(208,'BE0031',5,'mata sock roofing benz 8','9','5500','15000','27.500 / 5pcs','15',0),(209,'BE0032',5,'floordrain stenlis biasa','9','8500','10000','','15',0),(210,'BE0033',5,'engsel tipis rrt 3','17','959','10000','1 ls : 11.500','15',0),(211,'BE0034',5,'siku rak 10 x 12','17','5417','10000','1 ls : 65.000','15',0),(212,'BE0035',5,'meteran karet 5M crono','9','7500','10000','1 ls : 90.000','15',0),(213,'BL0045',4,'besi 8 mm F','15','24648','30000','f : hshi','16',0),(214,'BL0046',4,'besi 10 mm F','15','38480','10000','f : hshi','16',0),(215,'BD0046',3,'paku seri 5cm (2) dus','11','216000','10000','1 dus : 30 kg','16',0),(216,'BD0047',3,'paku seri 5cm (2) kg','6','7200','10000','','16',0),(217,'BD0048',3,'paku seri 7cm (3) dus','11','216000','10000','1 dus : 30 kg','16',0),(218,'BD0049',3,'paku seri 7cm (3) kg','6','7200','10000','','16',0),(219,'BD0050',3,'paku seri 10cm (4) dus','11','216000','10000','1 dus : 30 kg','16',0),(220,'BD0051',3,'paku seri 10cm (4) kg','6','7200','10000','','16',0),(221,'BD0052',3,'paku seri 12cm (5) dus','11','216000','10000','1 dus : 30 kg','16',0),(222,'BD0053',3,'paku seri 12cm (5) kg','6','7200','10000','','16',0),(223,'BD0054',3,'kawat bendrat rrt @25kg','1','216000','10000','','16',0),(224,'BD0055',3,'kawat bendrat rrt ikatan','18','7200','10000','1 ikat : 0,8 ons','16',0),(225,'BL0047',4,'besi 6 mm ','15','10750','17000','','16',0),(226,'BL0048',4,'besi 8 mm S','15','19750','25000','s : ssi','16',0),(227,'BL0049',4,'besi 12 mm F','15','55640','68000','f : hshi','16',0),(228,'BL0050',4,'seng plat 0,2 x 90 roll @48m','1','984000','10000','','16',0),(229,'BL0051',4,'seng plat 0,2 x 90 meter','2','20500','28000','','16',0),(230,'BL0052',4,'seng gelombang','10','35000','40000','','16',0),(231,'BL0053',4,'seng plat 0,2 x 55 roll @48m','1','576000','10000','','16',0),(232,'BL0054',4,'seng plat 0,2 x 55 meter','2','12000','18000','','16',0),(233,'BD0056',3,'paku seng 3 polos','6','','10000','','17',0),(234,'BD0057',3,'paku seng 2 polos','6','','10000','1 dus : 280.000 @?kg','17',0),(235,'CA0082',2,'matex putty plamir 4k','3','41360','10000','','18',0),(236,'CA0083',2,'matec putty plamir 1K','5','12540','10000','','18',0),(237,'CA0084',2,'vinilex 300 white 5k','3','102520','105000','','18',0),(238,'CA0085',2,'vinilex 8013 1 tulip white 5k','3','102520','105000','','18',0),(239,'CA0086',2,'vinilex 8005 2 barley white 5k','3','102520','105000','','18',0),(240,'CA0087',2,'vinilex 953A 3 pearly white 5k','3','102520','105000','','18',0),(241,'CA0088',2,'vinilex 8007 4 carnation white 5k','3','102520','105000','','18',0),(242,'CA0089',2,'vinilex 919 5 prime white 5k','3','102520','105000','','18',0),(243,'CA0090',2,'vinilex 8006 6 lily white 5k','3','102520','105000','','18',0),(244,'CA0091',2,'vinilex 921 7 marigold 5k','3','102520','105000','','18',0),(245,'CA0092',2,'vinilex 918 8  chrysan white 5k','3','102520','105000','','18',0),(246,'CA0093',2,'vinilex 978 9 wild rose 5k','3','102520','105000','','18',0),(247,'CA0094',2,'vinilex 8002 10 apple white 5k','3','102520','105000','','18',0),(248,'CA0095',2,'vinilex 926 11 light cream 5k','3','102520','105000','','18',0),(249,'CA0096',2,'vinilex 976 12 rose 5k','3','102520','105000','','18',0),(250,'CA0097',2,'vinilex 927 13 lemon ice 5k','3','102520','105000','','18',0),(251,'CA0098',2,'vinilex 912 14 honey tone 5k','3','102520','105000','','18',0),(252,'CA0099',2,'vinilex 915 15 fresh apricot 5k','3','102520','105000','','18',0),(253,'CA0100',2,'vinilex 332 16 antique white 5k','3','102520','105000','','18',0),(254,'CA0101',2,'vinilex 917 17 rosy pink 5k','3','102520','105000','','18',0),(255,'CA0102',2,'vinilex 913 19 ginger peachy 5k','3','102520','105000','','18',0),(256,'CA0103',2,'vinilex 906A 20 sun fresh 5k','3','102520','105000','','18',0),(257,'CA0104',2,'vinilex 330 21 linen white 5k','3','102520','105000','','18',0),(258,'CA0105',2,'vinilex 955A 22 lady pink 5k','3','102520','105000','','18',0),(259,'CA0106',2,'vinilex 938 23 honey yellow 5k','3','102520','105000','','18',0),(260,'CA0107',2,'vinilex 901 24 goby sands 5k','3','102520','105000','','18',0),(261,'CA0108',2,'vinilex 916 26 chery blossom 5k','3','102520','105000','','18',0),(262,'CA0109',2,'vinilex 933 27 kecapi 5k','3','102520','105000','','18',0),(263,'CA0110',2,'vinilex 982 28 tangerine 5k','3','102520','105000','','18',0),(264,'CA0111',2,'vinilex 914 29 salmon 5k','3','102520','105000','','18',0),(265,'CA0112',2,'vinilex 181 30 ivory 5k','3','102520','105000','','18',0),(266,'CA0113',2,'vinilex 934 32 sunlight 5k','3','102520','105000','','18',0),(267,'CA0114',2,'vinilex 940 33 mango crush 5k','3','102520','105000','','18',0),(268,'CA0115',2,'vinilex 983 34 sunset 5k','3','102520','105000','','18',0),(269,'CA0116',2,'vinilex 182 35 cream 5k','3','102520','105000','','18',0),(270,'CA0117',2,'vinilex 906 36 terra cotta 5k','3','102520','105000','','18',0),(271,'CA0118',2,'vinilex 939 37 yellow sunset 5k','3','102520','105000','','18',0),(272,'CA0119',2,'vinilex 945 38 musk melon 5k','3','102520','105000','','18',0),(273,'CA0120',2,'vinilex 622 39 poppy 5k','3','102520','105000','','18',0),(274,'CA0121',2,'vinilex 958A 41 smokey grey 5k','3','102520','105000','','18',0),(275,'CA0122',2,'vinilex 920 42 super white 5k','3','102520','105000','','18',0),(276,'CA0123',2,'vinilex 971 43 soft blue 5k','3','102520','105000','','18',0),(277,'CA0124',2,'vinilex 8008 44 iris white 5k','3','102520','105000','','18',0),(278,'CA0125',2,'vinilex 956A 45 sky light 5k','3','102520','105000','','18',0),(279,'CA0126',2,'vinilex 922 46 lilac white 5k','3','102520','105000','','18',0),(280,'CA0127',2,'vinilex 973 47 blue white 5k','3','102520','105000','','18',0),(281,'CA0128',2,'vinilex 8009 49 avocado white 5k','3','102520','105000','','18',0),(282,'CA0129',2,'vinilex 924 50 aqua marine 5k','3','102520','105000','','18',0),(283,'CA0130',2,'vinilex 925 51 tear drop 5k','3','102520','105000','','18',0),(284,'CA0131',2,'vinilex 957A 53 green candy 5k','3','102520','105000','','18',0),(285,'CA0132',2,'vinilex 316 54 lake blue 5k','3','102520','105000','','18',0),(286,'CA0133',2,'vinilex 931 55 cool blue 5k','3','102520','105000','','18',0),(287,'CA0134',2,'vinilex 943 57 dream land 5k','3','102520','105000','','18',0),(288,'CA0135',2,'vinilex 959A 58 lilac 5k','3','102520','105000','','18',0),(289,'CA0136',2,'vinilex 937 59 arctic blue 5k','3','102520','105000','','18',0),(290,'CA0137',2,'vinilex 954A 60 dolpin grey 5k','3','102520','105000','','18',0),(291,'CA0138',2,'vinilex 951 61 green romantic 5k','3','102520','105000','','18',0),(292,'CA0139',2,'vinilex 241 62 foliage 5k','3','102520','105000','','18',0),(293,'CA0140',2,'vinilex 941 63 magic purple 5k','3','102520','105000','','18',0),(294,'CA0141',2,'vinilex 944 64 everest blue 5k','3','102520','105000','','18',0),(295,'CA0142',2,'vinilex 950 65 pure grey 5k','3','102520','105000','','18',0),(296,'CA0143',2,'vinilex 942 66 coral spring 5k','3','102520','105000','','18',0),(297,'CA0144',2,'vinilex 243 67 fresh lime 5k','3','102520','105000','','18',0),(298,'CA0145',2,'vinilex 936 68 tiara 5k','3','102520','105000','','18',0),(299,'CA0146',2,'vinilex 952 69 wisdom blue 5k','3','102520','105000','','18',0),(300,'CA0147',2,'vinilex 948 70 yl grey 5k','3','102520','105000','','18',0),(301,'CA0148',2,'vinilex 907 71 merak hijau 5k','3','102520','105000','','18',0),(302,'CA0149',2,'vinilex 244 72 autumn green 5k','3','102520','105000','','18',0),(303,'CA0150',2,'vinilex 909 73 wira blue 5k','3','102520','105000','','18',0),(304,'CA0151',2,'vinilex 947 74 minimalis grey 5k','3','102520','105000','','18',0),(305,'CA0152',2,'vinilex 979 75 cameo white 5k','3','102520','105000','','18',0),(306,'CA0153',2,'vinilex 911 78 lilac frost 5k','3','102520','105000','','18',0),(307,'CA0154',2,'vinilex 8003 79 orchid white 5k','3','102520','105000','','18',0),(308,'CA0155',2,'vinilex wall sealer 5180 alkali resistence 20L','16','585860','10000','','18',0),(309,'CA0156',2,'qluc 1505 white pail 20k','16','199980','10000','','18',0),(310,'CA0157',2,'qluc 1505 white 5k','3','51150','10000','','18',0),(311,'CA0158',2,'vinilex 182 35 cream 25k','16','','10000','','18',0),(312,'CA0159',2,'vinilex 958A 41 smokey grey 25k','16','','10000','','18',0),(313,'CA0160',2,'vinilex 300 white 25k','16','','10000','','18',0),(314,'CA0161',2,'senilex 20 1 canvas 5k','3','42500','55000','','19',0),(315,'CA0162',2,'senilex 63 2 sky blue 5k','3','42500','55000','','19',0),(316,'CA0163',2,'senilex 66 3 jasmine 5k','3','42500','55000','','19',0),(317,'CA0164',2,'senilex 73 4 fountain blue 5k','3','42500','55000','','19',0),(318,'CA0165',2,'senilex 00 5 crystal lime 5 k','3','42500','55000','','19',0),(319,'CA0166',2,'senilex 58 6 lake blue 5k','3','42500','55000','','19',0),(320,'CA0167',2,'senilex 60 7 cream 5k','3','42500','55000','','19',0),(321,'CA0168',2,'senilex 99 8 millenium green 5k','3','42500','55000','','19',0),(322,'CA0169',2,'senilex 21 9 heaven blue 5k','3','42500','55000','','19',0),(323,'CA0170',2,'senilex 62 10 tile red 5k','3','42500','55000','','19',0),(324,'CA0171',2,'senilex 11 11 cristal blue 5k','3','42500','55000','','19',0),(325,'CA0172',2,'senilex 71 12 cherry blossom 5 k','3','42500','55000','','19',0),(326,'CA0173',2,'senilex 10 13 deep ocean 5k','3','42500','55000','','19',0),(327,'CA0174',2,'senilex 51 14 fresh green 5k','3','42500','55000','','19',0),(328,'CA0175',2,'senilex 22 15 valentine 5k','3','42500','55000','','19',0),(329,'CA0176',2,'senilex 02 16 durian 5k','3','42500','55000','','19',0),(330,'CA0177',2,'senilex 80 17 african desert 5k','3','42500','55000','','19',0),(331,'CA0178',2,'senilex 19 18 tropicana 5k','3','42500','55000','','19',0),(332,'CA0179',2,'senilex 55 19 blue haze 5k','3','42500','55000','','19',0),(333,'CA0180',2,'senilex 88 20 lemon yellow 5k','3','42500','55000','','19',0),(334,'CA0181',2,'senilex 30 21 sunrise 5k','3','42500','55000','','19',0),(335,'CA0182',2,'senilex 17 22 golden honey 5k','3','42500','55000','','19',0),(336,'CA0183',2,'senilex 08 23 minimalis grey 5k','3','42500','55000','','19',0),(337,'CA0184',2,'senilex 09 24 grey 5k','3','42500','55000','','19',0),(338,'CA0185',2,'senilex white 5k','3','42500','55000','','19',0),(339,'CA0186',2,'senilex white 23k','16','185300','230000','','19',0),(340,'CA0187',2,'romatex white 5 k','3','67050','75000','','19',0),(341,'CA0188',2,'romatex white 1k','5','20700','25000','','19',0),(342,'CA0189',2,'romatex white 23k','16','301500','10000','','19',0),(343,'CA0190',2,'wita white','5','31000','10000','','19',0),(344,'CA0191',2,'wita black','5','31000','10000','','19',0),(345,'CA0192',2,'romatex genteng black 5k','3','121500','10000','','19',0),(346,'CA0193',2,'pylox 300cc ZPR ','5','15800','10000','','20',0),(347,'CA0194',2,'pylox 400cc ZPR ','5','20800','10000','','20',0),(348,'BL0055',4,'pintu pvc kaca elasdoor yte04 + K + E stailess','19','600000','10000','uk : 70 x 195','21',0),(349,'BL0056',4,'pintu pvc urat kayu +K oval + E','19','170000','10000','uk : 70 x 196','21',0),(350,'BL0057',4,'pintu pvc abu-abu +K oval + E','19','160000','10000','uk : 70 x 197','21',0),(351,'BL0058',4,'pintu pvc putih +K oval + E','19','160000','10000','uk : 70 x 198','21',0),(352,'BL0059',4,'pintu pvc hijau +K oval + E','19','160000','10000','uk : 70 x 199','21',0),(353,'BL0060',4,'pintu pvc biru +K oval + E','19','160000','10000','uk : 70 x 200','21',0),(354,'BL0061',4,'pintu pvc pink +K oval + E','19','160000','10000','uk : 70 x 201','21',0),(355,'BL0062',4,'toren pinguin tb 32 orange','9','560880','600000','','22',0),(356,'BL0063',4,'toren pinguin tb 32 biru','9','560880','600000','','22',0),(357,'BL0064',4,'toren pinguin tb 55 orange','9','885600','945000','','22',0),(358,'BL0065',4,'toren pinguin tb 55 biru','9','885600','945000','','22',0),(359,'BL0066',4,'toren pinguin tb 70 orange','9','1003680','1070000','','22',0),(360,'BL0067',4,'toren pinguin tb 70 biru','9','1003680','1070000','','22',0),(361,'BL0068',4,'toren pinguin tb 110 orange','9','1476000','1570000','','22',0),(362,'BL0069',4,'toren pinguin tb 110 biru','9','1476000','1570000','','22',0),(363,'BL0070',4,'fiber gelombang putih 150 x 105','10','42750','57000','merk multi roof','22',0),(364,'BL0071',4,'fiber gelombang putih 180 x 105','10','51300','68500','merk multi roof','22',0),(365,'BL0072',4,'fiber gelombang putih 210 x 105','10','59850','80000','merk multi roof','22',0),(366,'BL0073',4,'fiber gelombang putih 240 x 105','10','68400','91000','merk multi roof','22',0),(367,'BL0074',4,'fiber gelombang putih 300 x 105','10','85500','114000','merk multi roof','22',0),(368,'BL0075',4,'fiber gelombang transparant 150 x 80','10','36000','52500','merk flexi plus','22',0),(369,'BL0076',4,'fiber gelombang transparant 180 x 80','10','43200','63000','merk flexi plus','22',0),(370,'BL0077',4,'fiber gelombang transparant 210 x 80','10','50400','73500','merk flexi plus','22',0),(371,'BL0078',4,'fiber gelombang transparant 240 x 80','10','57600','84000','merk flexi plus','22',0),(372,'BL0079',4,'fiber gelombang transparant 300 x 80','10','72000','105000','merk flexi plus','22',0),(373,'BL0080',4,'kayu balok 5/10 m3 ','20','3000000','10000','1m3 : 50 btg','23',0),(374,'BL0081',4,'kayu balok 5/10 batang','20','60000','10000','','23',0),(375,'BL0082',4,'kayu kaso 4/6 m3','20','2100000','10000','1 m3 : 104 btg','23',0),(376,'BL0083',4,'kayu kaso 4/6 ikat isi 6','20','121154','10000','','23',0),(377,'BL0084',4,'kayu kaso 4/6 batang','20','20193','10000','','23',0),(378,'BL0085',4,'kayu reng 3/4 m3','20','1850000','10000','1 m3 : 208 btg','23',0),(379,'BL0086',4,'kayu reng 3/4 ikat isi 10','20','89000','10000','','23',0),(380,'BL0087',4,'kayu reng 3/4 batang','20','8900','10000','','23',0),(381,'BL0088',4,'kayu balok 6/12 m3','20','','10000','1 m3 : 34,7 btg','23',0),(382,'BL0089',4,'kayu balok 6/12 batang','20','','10000','','23',0),(383,'BL0090',4,'triplek 8mm 4x8','10','87000','10000','','24',0),(384,'BL0091',4,'triplek 9mm 4x8','10','','10000','','24',0),(385,'BL0092',4,'triplek 4mm 4x8','10','49000','10000','','24',0),(386,'BL0093',4,'triplek 6mm 4x8','10','61000','10000','','24',0),(387,'BL0094',4,'triplek 12mm 4x8','10','135000','10000','','24',0),(388,'BL0095',4,'triplek 15mm 4x8','10','170000','10000','','24',0),(389,'BL0096',4,'triplek 3mm 4x8','10','40000','10000','','24',0),(390,'BL0097',4,'triplek 18mm 4x8','10','195000','10000','','24',0),(391,'BL0098',4,'pipa wavin Aw 1/2','15','15367','17000','19,030','6',0),(392,'BL0099',4,'pipa wavin Aw 3/4','15','21052','24000','26,070','6',0),(393,'BL0100',4,'pipa wavin Aw 1','15','28779','10000','35,640','25',0),(394,'BL0101',4,'pipa wavin Aw 1 1/4 ','15','43169','10000','53,460','25',0),(395,'BL0102',4,'pipa wavin Aw 1 1/2','15','49564','10000','61,380','25',0),(396,'BL0103',4,'pipa wavin Aw 2','15','63421','10000','78,540','25',0),(397,'BL0104',4,'pipa wavin Aw 2 1/2','15','92556','10000','114,620','25',0),(398,'BL0105',4,'pipa wavin Aw 3','15','124800','10000','154,550','25',0),(399,'BL0106',4,'pipa wavin Aw 4','15','206785','10000','256,080','25',0),(400,'BL0107',4,'pipa wavin Aw 5','15','342598','10000','424,270','25',0),(401,'BL0108',4,'pipa wavin Aw 6','15','480543','10000','595,100','25',0),(402,'BL0109',4,'pipa wavin D 1 1/4','15','27092','10000','33,550','25',0),(403,'BL0110',4,'pipa wavin D 1 1/2','15','30645','10000','37,950','25',0),(404,'BL0111',4,'pipa wavin D 2','15','39261','10000','48,620','25',0),(405,'BL0112',4,'pipa wavin D 2 1/2 ','15','53117','10000','65,780','25',0),(406,'BL0113',4,'pipa wavin D 3 ','15','67418','73000','83,490','25',0),(407,'BL0114',4,'pipa wavin D 4','15','106057','10000','131,340','25',0),(408,'BL0115',4,'pipa wavin D 5','15','170988','10000','211,750','25',0),(409,'BL0116',4,'pipa wavin D 6','15','225527','10000','279,290','25',0),(410,'BL0117',4,'keni 3 D grest','9','5393','10000','7.190 disc 25%','10',0),(411,'BL0118',4,'keni 2 D grest','9','3428','10000','4.570  disc 25%','10',0),(412,'BL0119',4,'tee 3/4 Aw RCK','9','2302','10000','2,850','10',0),(413,'BL0120',4,'tee 1/2 Aw RCK','9','1656','10000','2,050','10',0),(414,'BL0121',4,'keni drat dalam 1/2 Aw RCK','9','1211','10000','1,500','10',0),(415,'BL0122',4,'corong talang kotak ASV','9','3735','10000','','10',0),(416,'BL0123',4,'corong talang setengah lingkaran RG6','9','26590','10000','','10',0),(417,'BL0124',4,'talang setengah lingkaran RG6','15','28500','10000','','10',0),(418,'BL0125',4,'tutup talang setengah lingkaran RG6','9','3070','10000','','10',0),(419,'BL0126',4,'gantungan talang besi setengah lingkaran RG6','9','7000','10000','','10',0),(420,'BL0127',4,'dop 2 D','9','2095','10000','2,793','10',0),(421,'CA0195',2,'envi 1 845 brilliant white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(422,'CA0196',2,'envi 2 878 blosom white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(423,'CA0197',2,'envi 3 827 pink 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(424,'CA0198',2,'envi 4 805 crystal blue 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(425,'CA0199',2,'envi 5 825 peach 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(426,'CA0200',2,'envi 6 868 pinky 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(427,'CA0201',2,'envi 7 867 classy blue 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(428,'CA0202',2,'envi 8 869 light purple 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(429,'CA0203',2,'envi 9 828 rose velvet 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(430,'CA0204',2,'envi 10 861 elegant pink 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(431,'CA0205',2,'envi 11 881 purple gold 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(432,'CA0206',2,'envi 12 846 geranium 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(433,'CA0207',2,'envi 13 808 jazzy blue 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(434,'CA0208',2,'envi 14 852 coral grape 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(435,'CA0209',2,'envi 15 877 classic white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(436,'CA0210',2,'envi 16 843 broken white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(437,'CA0211',2,'envi 17 841 lily white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(438,'CA0212',2,'envi 18 833 off white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(439,'CA0213',2,'envi 19 817 cream 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(440,'CA0214',2,'envi 20 842 marygold 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(441,'CA0215',2,'envi 21 821 olympic yellow 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(442,'CA0216',2,'envi 22 818 ivory 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(443,'CA0217',2,'envi 23 855 monaco 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(444,'CA0218',2,'envi 24 820 primerose 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(445,'CA0219',2,'envi 25 848 canary yellow 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(446,'CA0220',2,'envi 26 819 barley white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(447,'CA0221',2,'envi 27 847 signal yellow 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(448,'CA0222',2,'envi 28 862 sunrise 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(449,'CA0223',2,'envi 29 831 brick red 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(450,'CA0224',2,'envi 30 832 terracota 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(451,'CA0225',2,'envi 31 810 teal ice 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(452,'CA0226',2,'envi 32 872 olivera 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(453,'CA0227',2,'envi 33 864 leaf green 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(454,'CA0228',2,'envi 34 806 atlantic blue 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(455,'CA0229',2,'envi 35 875 tender green 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(456,'CA0230',2,'envi 36 807 navy blue 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(457,'CA0231',2,'envi 37 849 sheva green 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(458,'CA0232',2,'envi 38 870 lime green 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(459,'CA0233',2,'envi 39 856 indigo 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(460,'CA0234',2,'envi 40 813 aqua green 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(461,'CA0235',2,'envi 41 850 paradise green 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(462,'CA0236',2,'envi 42 839 millenium 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(463,'CA0237',2,'envi 43 874 silver blue 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(464,'CA0238',2,'envi 44 854 saphire blue','3','99264','110000','110.000 disc 6% + 4%','26',0),(465,'CA0239',2,'envi 45 873 fontana 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(466,'CA0240',2,'envi 46 840 goose wing 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(467,'CA0241',2,'envi 47 880 primavera 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(468,'CA0242',2,'envi 48 835 milk grey 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(469,'CA0243',2,'envi 49 823 coffe 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(470,'CA0244',2,'envi 50 858 sahara 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(471,'CA0245',2,'envi 51 824 saddle tan 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(472,'CA0246',2,'envi 52 871 natura 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(473,'CA0247',2,'envi 53 834 alabaster 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(474,'CA0248',2,'envi 54 803 light violet 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(475,'CA0249',2,'envi 55 836 ash grey 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(476,'CA0250',2,'envi white 5k','3','99264','110000','110.000 disc 6% + 4%','26',0),(477,'CA0251',2,'envi white 25k','16','473760','520000','525.000 disc 6% + 4%','26',0),(478,'BL0128',4,'pipa top Aw 1','15','','10000','28.500 disc 20 + 5','27',0),(479,'BL0129',4,'pipa listrik top 5/8 4M','15','','10000','5.300 disc 20 + 5','27',0),(480,'BL0130',4,'toren tedmond 550L','9','724625','825000','','10',0),(481,'BL0131',4,'toren tedmond 1100L','9','1207140','1350000','','10',0),(482,'FP0007',1,'kunci besi','1',NULL,NULL,'qaaa',NULL,1),(483,'SE0001',10,'elos set','7','2400','3000','a',NULL,0),(484,'BD0058',3,'elos set 1','4','1200','1500','b',NULL,0),(485,'BD0059',3,'elos set 2','2','1200','1500','a',NULL,0),(486,'BD0060',3,'elos induk','1','80000','100000','a',NULL,0),(487,'BD0061',3,'elos anak','2','8000','10000','b',NULL,0),(488,'SE0002',10,'elos tamp','12','80001','100001','asdasdasd',NULL,0),(493,'CA0252',2,'elos tamp1','16','33333','123123123','2',NULL,0),(495,'CA0253',2,'test stok','17','111111','111111','asd',NULL,0),(496,'FP0008',1,'test stok1','16','800','1000','asdqwe',NULL,0),(497,'FP0009',1,'Coba 2','7','11111','123123','asd',NULL,0),(498,'BD0062',3,'coba ke rihga','15','1111','2222','asd',NULL,0),(499,'CA0254',2,'coba 31','17','2','111','asd',NULL,0),(500,'CA0255',2,'coba 1','16','15000','20000','',NULL,0),(501,'SE0003',10,'coba 2`','7','40000','50000','',NULL,0),(502,'SE0004',10,'coba 3','1','8000','10000','a',NULL,0);
/*!40000 ALTER TABLE `master_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_data_copy`
--

DROP TABLE IF EXISTS `master_data_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_data_copy` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(20) NOT NULL,
  `kategori` int(2) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `satuan` varchar(7) DEFAULT NULL,
  `harga_modal` varchar(12) DEFAULT NULL,
  `harga_jual` varchar(10) DEFAULT NULL,
  `keterangan` varchar(28) DEFAULT NULL,
  `distributor` varchar(28) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`kode_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_data_copy`
--

LOCK TABLES `master_data_copy` WRITE;
/*!40000 ALTER TABLE `master_data_copy` DISABLE KEYS */;
INSERT INTO `master_data_copy` VALUES (2,'FP0001',1,'cocoplas 40 x 1 x 08 putih roll','1','890,000','','40 m','1',0),(3,'FP0002',1,'cocoplas 40 x 1 x 08 putih meter','2','23,421','28000','','1',0),(4,'FP0003',1,'fancy glass 40 x 1 x 07 putih roll','1','850,000','','40 m','1',0),(5,'FP0004',1,'fancy glass 40 x1 x 07 putih meter','2','22,369','28000','','1',0),(6,'FP0005',1,'fancy glass 40 x 1 x 07 ribben roll','1','850,000','','40 m','1',0),(7,'FP0006',1,'fancy glass 40 x1 x 07 putih meter','2','22,369','28000','','1',0),(8,'CA0001',2,'Nippon vinilex white','3','102,520','105000','5 kg','2',0),(9,'BD0001',3,'isarplas tube','4','5,600','8500','','3',0),(10,'BD0002',3,'isarplas kaleng / kuas','5','31,500','40000','','3',0),(11,'BD0003',3,'karbit MDQ','6','20,900','25000','1 dus @25kg : 522.500','3',0),(12,'BD0004',3,'fox biru 350 gr','7','5,900','9000','350 gr','3',0),(13,'BD0005',3,'soda api 1 kg','7','9,800','18500','1 kg','3',0),(14,'BD0006',3,'fox kuning 1/2 ','5','20,500','30000','300 gr','3',0),(15,'BD0007',3,'thiner impala 1 ltr','5','19,000','24000','1 liter','3',0),(16,'BD0008',3,'thiner kapinis 1 ltr','5','9,750','18500','1 liter','3',0),(17,'BD0009',3,'HCL + gen','8','180,000','250000','','3',0),(18,'BL0001',4,'almunium foil single','1','300,000','425000','50 m','3',0),(19,'BL0002',4,'almunium foil single meter','2','6,250','10000','','3',0),(20,'BL0003',4,'almunium foil double','1','430,000','555000','50 m','3',0),(21,'BL0004',4,'almunium foil double meter','2','8,958','12500','','3',0),(22,'CA0002',2,'metrolite gallon','3','83,000','90000','5 kg','3',0),(23,'BL0005',4,'garpu injuk baja','9','60,000','85000','','4',0),(24,'BD0010',3,'kunci besi 6,8,10,12','9','12,500','25000','kunci besi panjang biru','4',0),(25,'BL0006',4,'loster sakura','9','2,300','6000','20 x 20','5',0),(26,'BL0007',4,'loster wajik','9','1,800','3500','10 x 20','5',0),(27,'BL0008',4,'Go green 150 x 80 Merah','10','34,200','52500','PL','6',0),(28,'BL0009',4,'Go green 180 x 80 Merah','10','41,040','63000','PL','6',0),(29,'BL0010',4,'Go green 210 x 80 Merah','10','47,880','73500','PL ','6',0),(30,'BL0011',4,'Go green 240 x 80 Merah','10','54,720','84000','PL 60.800','6',0),(31,'BL0012',4,'go green 300 x 80 Merah','10','70,200','105000','PL 78.000','6',0),(32,'BE0001',5,'kabel Ties hitam 20 cm','7','7,500','','','7',0),(33,'BE0002',5,'mata obeng gypsum bosch ph2 x 65mm','9','9,555','','mata obeng / screw driver','7',0),(34,'BE0003',5,'dynabolt 12 x 60 `','9','1,315','','1 box : 100 pcs','7',0),(35,'BD0011',3,'bak cat','9','3,125','','1 lsn : 37.500','7',0),(36,'BD0012',3,'roskam pvc hitam','9','3,750','','1 lsn : 45.000','7',0),(37,'BE0004',5,'kunci pintu bs lanvin + body komp','9','75,000','','kunci besi 1 set + body komp','7',0),(38,'BE0005',5,'pahat kayu abus 1 1/4','9','8,542','','1 lsn : 102.500','7',0),(39,'BE0006',5,'tembakan lem chrome tulang','9','12,500','','tembakan sealent','7',0),(40,'BE0007',5,'palu karet reyner 16 oz','9','13,000','','1 lsn : 156.000','7',0),(41,'BE0008',5,'palu bodem 08 lb','9','46,000','','','7',0),(42,'BE0009',5,'palu bodem 12 lb','9','69,000','','','7',0),(43,'BE0010',5,'hak angin tiptop 8 sn','9','3,334','','1 lsn : 40.000','7',0),(44,'BE0011',5,'mata serut bison bc 13/4','9','12,000','','1 lsn : 120.000','7',0),(45,'BE0012',5,'shower toilet figo pt','9','27,500','','','7',0),(46,'BE0013',5,'shower toilet rxt bm','9','27,500','','','7',0),(47,'BE0014',5,'showe toilet rxt iv','9','27,500','','','7',0),(48,'BD0013',3,'paku seng 3 ss ulir','11','130,000','','harga 1 dus','7',0),(49,'BE0015',5,'balvalve pvc hd blitz 1/2','9','7,750','','','7',0),(50,'BE0016',5,'balvalve pvc hd blitz 3/4','9','9,750','','','7',0),(51,'BE0017',5,'kuas cat 633 abus 2,5\"','9','4,688','','1 lsn : 56.250','7',0),(52,'BE0018',5,'kape gagang fiber bracio 2','9','4,667','','1 lsn : 56.000','7',0),(53,'BE0019',5,'kape gagang fiber bracio 2,5\"','9','5,084','','1 lsn : 61.000','7',0),(54,'BE0020',5,'obeng bb glorius transparant 5','9','4,792','','1 lsn : 57.500','7',0),(55,'BE0021',5,'batu asah panda 6','9','7,000','','','7',0),(56,'BE0022',5,'batu asah panda 8','9','7,500','','','7',0),(57,'BE0023',5,'tarikan laci rrt 4','9','667','','1 lsn : 8.000','7',0),(58,'BE0024',5,'grendel stainless axl bc 2','9','3,750','','1 lsn : 45.000','7',0),(59,'BE0025',5,'baut baja ringan 10 x 19','11','122,500','','1 dus : 122.500','7',0),(60,'BE0026',5,'engsel tebal elbrus 3 sn','9','15,667','','1 lsn : 188.000','7',0),(61,'BL0013',4,'semen gresik 40 kg','12','','','','3',0),(62,'BL0014',4,'semen tiga roda 50 kg','12','','','','3',0),(63,'BL0015',4,'semen SCG 50 kg','12','','','','3',0),(64,'CA0003',2,'kuda terbang 0,1L','5','','','1 lsn : 87.750','3',0),(65,'BD0014',3,'klem pipa pvc 3','9','900','','','3',0),(66,'BD0015',3,'thiner nd botol kratindeng','9','','','1 lsn : 30.000','3',0),(67,'CA0004',2,'meni besi hijau kampak 1 ltr','5','16,750','','','3',0),(68,'BD0016',3,'air keras','9','','','1 lsn : 37.500','3',0),(69,'BD0017',3,'aica aibon 0,1L','5','7,550','','','3',0),(70,'BD0018',3,'kain pell','9','','','1 kodi : 55.000','3',0),(71,'BD0019',3,'kaporit bubuk 0,5kg','7','14,000','','','3',0),(72,'CA0005',2,'metrolite pail','5','830,000','','','3',0),(73,'BD0020',3,'porstex','9','','','1 dus : 172.500','3',0),(74,'BD0021',3,'thiner impala gallon','3','76,750','','','3',0),(75,'BD0022',3,'afduner','13','4,750','','','3',0),(76,'CA0006',2,'meni kayu kampak gallon','3','53,800','','','3',0),(77,'BD0023',3,'soda api 1/2 kg','9','4,900','','','3',0),(78,'BD0024',3,'neorever 1/4','9','18,500','','','3',0),(79,'BD0025',3,'fox putih 1/2 kg','13','11,250','','','3',0),(80,'BD0026',3,'sanpolac 1 kg','5','30,000','','','3',0),(81,'BD0027',3,'isamu 1 kg','5','49,000','','','3',0),(82,'CA0007',2,'flinkote seiv','5','31,900','','','3',0),(83,'CA0008',2,'seiv tembaga 1/4','5','22,000','','','3',0),(84,'CA0009',2,'seiv mas 1/4','5','25,750','','','3',0),(85,'BD0028',3,'fox kuning gallon','3','129,000','','','3',0),(86,'BD0029',3,'corment','5','25,000','','','3',0),(87,'BD0030',3,'tali rafiah','9','19,250','','','3',0),(88,'BD0031',3,'brown mas kangguru 0,1','5','','','1 lsn : 115.000','3',0),(89,'BD0032',3,'klem pipa pvc 1/2','9','300','','','3',0),(90,'BD0033',3,'fox putih 1 kg','13','19,500','','','3',0),(91,'BD0034',3,'pengki hijau','9','6,667','','1 lsn : 80.000','3',0),(92,'BD0035',3,'aica aibon 1/2','5','29,800','','','3',0),(93,'CA0010',2,'flinkote sheep','5','20,000','','','3',0),(94,'BL0016',4,'selang flex trilliun 5/8 roll 100M','9','340,000','','','3',0),(95,'BL0017',4,'selang flex trilliun 5/8 roll meter','2','3,400','','','3',0),(96,'BL0018',4,'mill','12','25,000','','','3',0),(97,'BD0036',3,'thiner ND super + dirigen','9','160,000','','','3',0),(98,'CA0011',2,'vernis glasstone clear gloss','5','56,700','','63.000 diskon 10%','3',0),(99,'CA0012',2,'seiv hitam doff 880M','5','49,000','','','3',0),(100,'CA0013',2,'seiv putih doff 180M','5','49,000','','','3',0),(101,'BD0037',3,'alcasit','7','16,200','','','3',0),(102,'BD0038',3,'oker AGA putih','7','5,100','','','3',0),(103,'BD0039',3,'lem intraplas tube','9','3,750','','','3',0),(104,'BD0040',3,'lem karpet tube','9','6,000','','','3',0),(105,'BD0041',3,'lem fiber nun kcl','13','7,500','','','3',0),(106,'BD0042',3,'calt bond','5','41,400','','','3',0),(107,'CA0014',2,'aquaproof 1 kg hitam','5','41,800','','','8',0),(108,'CA0015',2,'aquaproof 1 kg biru ','5','41,800','','','8',0),(109,'CA0016',2,'aquaproof 1 kg merah','5','41,800','','','8',0),(110,'CA0017',2,'aquaproof 1 kg abu abu','5','41,800','','','8',0),(111,'CA0018',2,'aquaproof 1 kg abu muda','5','41,800','','','8',0),(112,'CA0019',2,'aquaproof 1 kg coklat','5','41,800','','','8',0),(113,'CA0020',2,'aquaproof 1 kg putih','5','41,800','','','8',0),(114,'CA0021',2,'aquaproof 1 kg cream','5','41,800','','','8',0),(115,'CA0022',2,'aquaproof 1 kg transparant','5','41,800','','','8',0),(116,'CA0023',2,'aquaproof gallon cream','3','158,423','','','8',0),(117,'CA0024',2,'aquaproof gallon abu abu','3','158,423','','','8',0),(118,'CA0025',2,'aquaproof gallon hitam','3','158,423','','','8',0),(119,'CA0026',2,'aquaproof gallon putih','3','158,423','','','8',0),(120,'CA0027',2,'aquaproof gallon coklat','3','158,423','','','8',0),(121,'CA0028',2,'aquaproof gallon merah','3','158,423','','','8',0),(122,'CA0029',2,'aquaproof gallon abu muda','3','158,423','','','8',0),(123,'CA0030',2,'aquaproof gallon biru','3','158,423','','','8',0),(124,'CA0031',2,'aquaproof gallon transparant','3','158,423','','','8',0),(125,'BL0019',4,'star mortar M811 40kg perekat bata ringan','12','','','71.000 (20 extra 2)','9',0),(126,'BL0020',4,'coumpond aplus sak','12','50,000','','','9',0),(127,'BD0043',3,'coumpond aplus 1kg','14','','','','9',0),(128,'BL0021',4,'semen putih tiga roda sak','12','88,000','','','9',0),(129,'BD0044',3,'semen putih 1 kg','14','','','','9',0),(130,'BL0022',4,'gypsum aplus 9mm x 1200 x 2400','10','49,500','','','9',0),(131,'BL0023',4,'MU 380 perekat bata ringan 40kg','12','','','','10',0),(132,'BL0024',4,'MU 420 perekat keramik 25 kg','12','70,000','79000','','9',0),(133,'BL0025',4,'MU 400 perekat granit tile 25 kg','12','103,000','115000','','9',0),(134,'BL0026',4,'besi slup 4 X 8','15','30,000','45000','','9',0),(135,'BL0027',4,'besi slup 3 x 8','15','22,500','35000','','9',0),(136,'BL0028',4,'karpet h/m 55 roll 50M','1','230,000','','','11',0),(137,'BL0029',4,'karpet h/m 55 roll meter','2','5,600','','','11',0),(138,'BL0030',4,'karpet h/m 90 roll 50M','1','380,000','','','11',0),(139,'BL0031',4,'karpet h/m 90 roll meter','2','7,600','','','11',0),(140,'BL0032',4,'ember cor jumbo hijau','9','5,300','','','11',0),(141,'BL0033',4,'karpet h/m 110 roll 50m','1','560,000','','','11',0),(142,'BL0034',4,'karpet h/m 110 meter','2','11,200','','','11',0),(143,'BL0035',4,'terpal jadi 3 x 4','9','46,800','','','11',0),(144,'BL0036',4,'terpal jadi 5 x 6','9','117,000','','','11',0),(145,'BL0037',4,'terpal meteran orange/biru','2','7,250','','','11',0),(146,'BL0038',4,'terpal meteran orange/biru roll 100m','1','725,000','','','11',0),(147,'BL0039',4,'ember cor kecil hijau','9','2,900','','','11',0),(148,'BD0045',3,'dop 4','9','3,750','','','11',0),(149,'BL0040',4,'kawat loket 1/2 x 90 putih roll 10m','1','79,000','','','11',0),(150,'BL0041',4,'kawat loket 1/2 x 90 putih roll meter','2','7,900','','','11',0),(151,'CA0032',2,'catylac 1501 putih gallon ','3','102,286','','5 kg','12',0),(152,'CA0033',2,'catylac 1501 putih pail','16','498,422','','25 kg','12',0),(153,'CA0034',2,'dulux pentalite BW pail ','16','1,012,236','','20 L','12',0),(154,'CA0035',2,'catylac base T911A gallon','3','87,930','','5 kg','12',0),(155,'CA0036',2,'dulux pentalite BW gallon','3','137,506','','2,5 L','12',0),(156,'CA0037',2,'dulux wheatershield BW gallon','3','206,260','','2,5 L','12',0),(157,'CA0038',2,'dulux v-gloss 9000 white','5','45,042','50000','0,8 L','12',0),(158,'CA0039',2,'dulux v-gloss 122 black','5','45,042','50000','0,8 L','12',0),(159,'CA0040',2,'dulux v-gloss 9002 white doff','5','49,349','55000','0,8 L','12',0),(160,'CA0041',2,'dulux v-gloss 40710 black doff','5','49,349','55000','0,8 L','12',0),(161,'CA0042',2,'dulux v-gloss 46637 1 earthland','5','45,042','50000','0,8 L','12',0),(162,'CA0043',2,'dulux v-gloss 46632 2 golden brown','5','45,042','50000','0,8 L','12',0),(163,'CA0044',2,'dulux v-gloss 41674 3 blue night wk','5','48,900','55000','0,8 L','12',0),(164,'CA0045',2,'dulux v-gloss 40700 4 dolpin grey','5','45,042','50000','0,8 L','12',0),(165,'CA0046',2,'dulux v-gloss 43631 5 papillon red','5','45,042','50000','0,8 L','12',0),(166,'CA0047',2,'dulux v-gloss 47527 6 pumpkin orange wk','5','48,900','55000','0,8 L','12',0),(167,'CA0048',2,'dulux v-gloss 42622 7 aspen green','5','45,042','50000','0,8 L','12',0),(168,'CA0049',2,'dulux v gloss 41671 8 saphire blue wk','5','48,900','55000','0,8 L','12',0),(169,'CA0050',2,'dulux v-gloss 40699 9 jade dove ','5','45,042','50000','0,8 L','12',0),(170,'CA0051',2,'dulux v-gloss 43630 10 vermilion wk','5','48,900','55000','0,8 L','12',0),(171,'CA0052',2,'dulux v-gloss 45586 11 lily yellow wk','5','48,900','55000','0,8 L','12',0),(172,'CA0053',2,'dulux v-gloss 42621 12 victoria garden','5','45,042','50000','0,8 L','12',0),(173,'CA0054',2,'dulux v-gloss 40701 13 north grey','5','45,042','50000','0,8 L','12',0),(174,'CA0055',2,'dulux v-gloss 43633 14 old coral','5','45,042','50000','0,8 L','12',0),(175,'CA0056',2,'dulux v-gloss 42619 15 turquoise','5','45,042','50000','0,8 L','12',0),(176,'CA0057',2,'dulux v-gloss 41672 16 oriental blue wk','5','48,900','55000','0,8 L','12',0),(177,'CA0058',2,'dulux v-gloss 47525 18 cinnabar orange wk','5','48,900','55000','0,8 L','12',0),(178,'CA0059',2,'dulux v-gloss 45587 19 sunshine canary wk','5','48,900','55000','0,8 L','12',0),(179,'CA0060',2,'dulux v-gloss 42624 20 evergreen wk','5','48,900','55000','0,8 L','12',0),(180,'CA0061',2,'dulux v-gloss 43632 22 sympony pink wk','5','48,900','55000','0,8 L','12',0),(181,'CA0062',2,'dulux v-gloss 42620 23 starfruit','5','45,042','50000','0,8 L','12',0),(182,'CA0063',2,'dulux v-gloss 46635 24 mocha rich','5','45,042','50000','0,8 L','12',0),(183,'CA0064',2,'dulux v-gloss 46631 25 brown leather','5','45,042','50000','0,8 L','12',0),(184,'CA0065',2,'dulux v-gloss 46636 26 candy honey','5','45,042','50000','0,8 L','12',0),(185,'CA0066',2,'dulux v-gloss 46633 27 dust brown','5','45,042','50000','0,8 L','12',0),(186,'CA0067',2,'dulux v-gloss 46628 28 bamboo cream','5','45,042','50000','0,8 L','12',0),(187,'CA0068',2,'dulux v-gloss 46630 29 cinnamon suede','5','45,042','50000','0,8 L','12',0),(188,'CA0069',2,'dulux v-gloss 46634 30 spicy brown','5','45,042','50000','0,8 L','12',0),(189,'CA0070',2,'dulux v-gloss 47526 31 sweet melon','5','45,042','50000','0,8 L','12',0),(190,'CA0071',2,'dulux v-gloss 46627 32 butterfly','5','45,042','50000','0,8 L','12',0),(191,'CA0072',2,'dulux v-gloss 45585 33 candlelight','5','45,042','50000','0,8 L','12',0),(192,'CA0073',2,'dulux v-gloss 46626 34 papyrus iced','5','45,042','50000','0,8 L','12',0),(193,'CA0074',2,'dulux v-gloss 41675 35 elize blue wk','5','48,900','55000','0,8 L','12',0),(194,'CA0075',2,'dulux v-gloss 45588 36 mustard banana wk','5','48,900','55000','0,8 L','12',0),(195,'CA0076',2,'dulux v-gloss 40698 37 pewter grey','5','45,042','50000','0,8 L','12',0),(196,'CA0077',2,'dulux v-gloss 46629 38 adeline pearl','5','45,042','50000','0,8 L','12',0),(197,'CA0078',2,'dulux v-gloss 41673 39 neptune navy','5','45,042','50000','0,8 L','12',0),(198,'CA0079',2,'dulux v-gloss 42623 40 eden green','5','45,042','50000','0,8 L','12',0),(199,'CA0080',2,'dulux pentalite base T922C gallon','3','94,061','','2,5 L','12',0),(200,'CA0081',2,'dulux wheatershield base 1918B gallon','3','181,965','','2,5 L','12',0),(201,'BL0042',4,'list profil K6 ','15','11,900','','4 m / btg','13',0),(202,'BL0043',4,'List profil k22','15','13,600','','4 m / btg','13',0),(203,'BL0044',4,'papan cor tebal','10','8,700','','','14',0),(204,'BE0027',5,'kape pvc 7','9','11,000','','','15',0),(205,'BE0028',5,'kunci laci huben 138','9','6,250','','1 ls : 75.000','15',0),(206,'BE0029',5,'sarung tangan karet','17','8,500','','','15',0),(207,'BE0030',5,'sarung tangan kain bintik tebal','17','6,250','','1 ls : 75.000','15',0),(208,'BE0031',5,'mata sock roofing benz 8','9','5,500','15000','27.500 / 5pcs','15',0),(209,'BE0032',5,'floordrain stenlis biasa','9','8,500','','','15',0),(210,'BE0033',5,'engsel tipis rrt 3','17','959','','1 ls : 11.500','15',0),(211,'BE0034',5,'siku rak 10 x 12','17','5,417','','1 ls : 65.000','15',0),(212,'BE0035',5,'meteran karet 5M crono','9','7,500','','1 ls : 90.000','15',0),(213,'BL0045',4,'besi 8 mm F','15','24,648','30000','f : hshi','16',0),(214,'BL0046',4,'besi 10 mm F','15','38,480','','f : hshi','16',0),(215,'BD0046',3,'paku seri 5cm (2) dus','11','216,000','','1 dus : 30 kg','16',0),(216,'BD0047',3,'paku seri 5cm (2) kg','6','7,200','','','16',0),(217,'BD0048',3,'paku seri 7cm (3) dus','11','216,000','','1 dus : 30 kg','16',0),(218,'BD0049',3,'paku seri 7cm (3) kg','6','7,200','','','16',0),(219,'BD0050',3,'paku seri 10cm (4) dus','11','216,000','','1 dus : 30 kg','16',0),(220,'BD0051',3,'paku seri 10cm (4) kg','6','7,200','','','16',0),(221,'BD0052',3,'paku seri 12cm (5) dus','11','216,000','','1 dus : 30 kg','16',0),(222,'BD0053',3,'paku seri 12cm (5) kg','6','7,200','','','16',0),(223,'BD0054',3,'kawat bendrat rrt @25kg','1','216,000','','','16',0),(224,'BD0055',3,'kawat bendrat rrt ikatan','18','7,200','','1 ikat : 0,8 ons','16',0),(225,'BL0047',4,'besi 6 mm ','15','10,750','17000','','16',0),(226,'BL0048',4,'besi 8 mm S','15','19,750','25000','s : ssi','16',0),(227,'BL0049',4,'besi 12 mm F','15','55,640','68000','f : hshi','16',0),(228,'BL0050',4,'seng plat 0,2 x 90 roll @48m','1','984,000','','','16',0),(229,'BL0051',4,'seng plat 0,2 x 90 meter','2','20,500','28000','','16',0),(230,'BL0052',4,'seng gelombang','10','35,000','40000','','16',0),(231,'BL0053',4,'seng plat 0,2 x 55 roll @48m','1','576,000','','','16',0),(232,'BL0054',4,'seng plat 0,2 x 55 meter','2','12,000','18000','','16',0),(233,'BD0056',3,'paku seng 3 polos','6','','','','17',0),(234,'BD0057',3,'paku seng 2 polos','6','','','1 dus : 280.000 @?kg','17',0),(235,'CA0082',2,'matex putty plamir 4k','3','41,360','','','18',0),(236,'CA0083',2,'matec putty plamir 1K','5','12,540','','','18',0),(237,'CA0084',2,'vinilex 300 white 5k','3','102,520','105000','','18',0),(238,'CA0085',2,'vinilex 8013 1 tulip white 5k','3','102,520','105000','','18',0),(239,'CA0086',2,'vinilex 8005 2 barley white 5k','3','102,520','105000','','18',0),(240,'CA0087',2,'vinilex 953A 3 pearly white 5k','3','102,520','105000','','18',0),(241,'CA0088',2,'vinilex 8007 4 carnation white 5k','3','102,520','105000','','18',0),(242,'CA0089',2,'vinilex 919 5 prime white 5k','3','102,520','105000','','18',0),(243,'CA0090',2,'vinilex 8006 6 lily white 5k','3','102,520','105000','','18',0),(244,'CA0091',2,'vinilex 921 7 marigold 5k','3','102,520','105000','','18',0),(245,'CA0092',2,'vinilex 918 8  chrysan white 5k','3','102,520','105000','','18',0),(246,'CA0093',2,'vinilex 978 9 wild rose 5k','3','102,520','105000','','18',0),(247,'CA0094',2,'vinilex 8002 10 apple white 5k','3','102,520','105000','','18',0),(248,'CA0095',2,'vinilex 926 11 light cream 5k','3','102,520','105000','','18',0),(249,'CA0096',2,'vinilex 976 12 rose 5k','3','102,520','105000','','18',0),(250,'CA0097',2,'vinilex 927 13 lemon ice 5k','3','102,520','105000','','18',0),(251,'CA0098',2,'vinilex 912 14 honey tone 5k','3','102,520','105000','','18',0),(252,'CA0099',2,'vinilex 915 15 fresh apricot 5k','3','102,520','105000','','18',0),(253,'CA0100',2,'vinilex 332 16 antique white 5k','3','102,520','105000','','18',0),(254,'CA0101',2,'vinilex 917 17 rosy pink 5k','3','102,520','105000','','18',0),(255,'CA0102',2,'vinilex 913 19 ginger peachy 5k','3','102,520','105000','','18',0),(256,'CA0103',2,'vinilex 906A 20 sun fresh 5k','3','102,520','105000','','18',0),(257,'CA0104',2,'vinilex 330 21 linen white 5k','3','102,520','105000','','18',0),(258,'CA0105',2,'vinilex 955A 22 lady pink 5k','3','102,520','105000','','18',0),(259,'CA0106',2,'vinilex 938 23 honey yellow 5k','3','102,520','105000','','18',0),(260,'CA0107',2,'vinilex 901 24 goby sands 5k','3','102,520','105000','','18',0),(261,'CA0108',2,'vinilex 916 26 chery blossom 5k','3','102,520','105000','','18',0),(262,'CA0109',2,'vinilex 933 27 kecapi 5k','3','102,520','105000','','18',0),(263,'CA0110',2,'vinilex 982 28 tangerine 5k','3','102,520','105000','','18',0),(264,'CA0111',2,'vinilex 914 29 salmon 5k','3','102,520','105000','','18',0),(265,'CA0112',2,'vinilex 181 30 ivory 5k','3','102,520','105000','','18',0),(266,'CA0113',2,'vinilex 934 32 sunlight 5k','3','102,520','105000','','18',0),(267,'CA0114',2,'vinilex 940 33 mango crush 5k','3','102,520','105000','','18',0),(268,'CA0115',2,'vinilex 983 34 sunset 5k','3','102,520','105000','','18',0),(269,'CA0116',2,'vinilex 182 35 cream 5k','3','102,520','105000','','18',0),(270,'CA0117',2,'vinilex 906 36 terra cotta 5k','3','102,520','105000','','18',0),(271,'CA0118',2,'vinilex 939 37 yellow sunset 5k','3','102,520','105000','','18',0),(272,'CA0119',2,'vinilex 945 38 musk melon 5k','3','102,520','105000','','18',0),(273,'CA0120',2,'vinilex 622 39 poppy 5k','3','102,520','105000','','18',0),(274,'CA0121',2,'vinilex 958A 41 smokey grey 5k','3','102,520','105000','','18',0),(275,'CA0122',2,'vinilex 920 42 super white 5k','3','102,520','105000','','18',0),(276,'CA0123',2,'vinilex 971 43 soft blue 5k','3','102,520','105000','','18',0),(277,'CA0124',2,'vinilex 8008 44 iris white 5k','3','102,520','105000','','18',0),(278,'CA0125',2,'vinilex 956A 45 sky light 5k','3','102,520','105000','','18',0),(279,'CA0126',2,'vinilex 922 46 lilac white 5k','3','102,520','105000','','18',0),(280,'CA0127',2,'vinilex 973 47 blue white 5k','3','102,520','105000','','18',0),(281,'CA0128',2,'vinilex 8009 49 avocado white 5k','3','102,520','105000','','18',0),(282,'CA0129',2,'vinilex 924 50 aqua marine 5k','3','102,520','105000','','18',0),(283,'CA0130',2,'vinilex 925 51 tear drop 5k','3','102,520','105000','','18',0),(284,'CA0131',2,'vinilex 957A 53 green candy 5k','3','102,520','105000','','18',0),(285,'CA0132',2,'vinilex 316 54 lake blue 5k','3','102,520','105000','','18',0),(286,'CA0133',2,'vinilex 931 55 cool blue 5k','3','102,520','105000','','18',0),(287,'CA0134',2,'vinilex 943 57 dream land 5k','3','102,520','105000','','18',0),(288,'CA0135',2,'vinilex 959A 58 lilac 5k','3','102,520','105000','','18',0),(289,'CA0136',2,'vinilex 937 59 arctic blue 5k','3','102,520','105000','','18',0),(290,'CA0137',2,'vinilex 954A 60 dolpin grey 5k','3','102,520','105000','','18',0),(291,'CA0138',2,'vinilex 951 61 green romantic 5k','3','102,520','105000','','18',0),(292,'CA0139',2,'vinilex 241 62 foliage 5k','3','102,520','105000','','18',0),(293,'CA0140',2,'vinilex 941 63 magic purple 5k','3','102,520','105000','','18',0),(294,'CA0141',2,'vinilex 944 64 everest blue 5k','3','102,520','105000','','18',0),(295,'CA0142',2,'vinilex 950 65 pure grey 5k','3','102,520','105000','','18',0),(296,'CA0143',2,'vinilex 942 66 coral spring 5k','3','102,520','105000','','18',0),(297,'CA0144',2,'vinilex 243 67 fresh lime 5k','3','102,520','105000','','18',0),(298,'CA0145',2,'vinilex 936 68 tiara 5k','3','102,520','105000','','18',0),(299,'CA0146',2,'vinilex 952 69 wisdom blue 5k','3','102,520','105000','','18',0),(300,'CA0147',2,'vinilex 948 70 yl grey 5k','3','102,520','105000','','18',0),(301,'CA0148',2,'vinilex 907 71 merak hijau 5k','3','102,520','105000','','18',0),(302,'CA0149',2,'vinilex 244 72 autumn green 5k','3','102,520','105000','','18',0),(303,'CA0150',2,'vinilex 909 73 wira blue 5k','3','102,520','105000','','18',0),(304,'CA0151',2,'vinilex 947 74 minimalis grey 5k','3','102,520','105000','','18',0),(305,'CA0152',2,'vinilex 979 75 cameo white 5k','3','102,520','105000','','18',0),(306,'CA0153',2,'vinilex 911 78 lilac frost 5k','3','102,520','105000','','18',0),(307,'CA0154',2,'vinilex 8003 79 orchid white 5k','3','102,520','105000','','18',0),(308,'CA0155',2,'vinilex wall sealer 5180 alkali resistence 20L','16','585,860','','','18',0),(309,'CA0156',2,'qluc 1505 white pail 20k','16','199,980','','','18',0),(310,'CA0157',2,'qluc 1505 white 5k','3','51,150','','','18',0),(311,'CA0158',2,'vinilex 182 35 cream 25k','16','','','','18',0),(312,'CA0159',2,'vinilex 958A 41 smokey grey 25k','16','','','','18',0),(313,'CA0160',2,'vinilex 300 white 25k','16','','','','18',0),(314,'CA0161',2,'senilex 20 1 canvas 5k','3','42,500','55000','','19',0),(315,'CA0162',2,'senilex 63 2 sky blue 5k','3','42,500','55000','','19',0),(316,'CA0163',2,'senilex 66 3 jasmine 5k','3','42,500','55000','','19',0),(317,'CA0164',2,'senilex 73 4 fountain blue 5k','3','42,500','55000','','19',0),(318,'CA0165',2,'senilex 00 5 crystal lime 5 k','3','42,500','55000','','19',0),(319,'CA0166',2,'senilex 58 6 lake blue 5k','3','42,500','55000','','19',0),(320,'CA0167',2,'senilex 60 7 cream 5k','3','42,500','55000','','19',0),(321,'CA0168',2,'senilex 99 8 millenium green 5k','3','42,500','55000','','19',0),(322,'CA0169',2,'senilex 21 9 heaven blue 5k','3','42,500','55000','','19',0),(323,'CA0170',2,'senilex 62 10 tile red 5k','3','42,500','55000','','19',0),(324,'CA0171',2,'senilex 11 11 cristal blue 5k','3','42,500','55000','','19',0),(325,'CA0172',2,'senilex 71 12 cherry blossom 5 k','3','42,500','55000','','19',0),(326,'CA0173',2,'senilex 10 13 deep ocean 5k','3','42,500','55000','','19',0),(327,'CA0174',2,'senilex 51 14 fresh green 5k','3','42,500','55000','','19',0),(328,'CA0175',2,'senilex 22 15 valentine 5k','3','42,500','55000','','19',0),(329,'CA0176',2,'senilex 02 16 durian 5k','3','42,500','55000','','19',0),(330,'CA0177',2,'senilex 80 17 african desert 5k','3','42,500','55000','','19',0),(331,'CA0178',2,'senilex 19 18 tropicana 5k','3','42,500','55000','','19',0),(332,'CA0179',2,'senilex 55 19 blue haze 5k','3','42,500','55000','','19',0),(333,'CA0180',2,'senilex 88 20 lemon yellow 5k','3','42,500','55000','','19',0),(334,'CA0181',2,'senilex 30 21 sunrise 5k','3','42,500','55000','','19',0),(335,'CA0182',2,'senilex 17 22 golden honey 5k','3','42,500','55000','','19',0),(336,'CA0183',2,'senilex 08 23 minimalis grey 5k','3','42,500','55000','','19',0),(337,'CA0184',2,'senilex 09 24 grey 5k','3','42,500','55000','','19',0),(338,'CA0185',2,'senilex white 5k','3','42,500','55000','','19',0),(339,'CA0186',2,'senilex white 23k','16','185,300','230000','','19',0),(340,'CA0187',2,'romatex white 5 k','3','67,050','75000','','19',0),(341,'CA0188',2,'romatex white 1k','5','20,700','25000','','19',0),(342,'CA0189',2,'romatex white 23k','16','301,500','','','19',0),(343,'CA0190',2,'wita white','5','31,000','','','19',0),(344,'CA0191',2,'wita black','5','31,000','','','19',0),(345,'CA0192',2,'romatex genteng black 5k','3','121,500','','','19',0),(346,'CA0193',2,'pylox 300cc ZPR ','5','15,800','','','20',0),(347,'CA0194',2,'pylox 400cc ZPR ','5','20,800','','','20',0),(348,'BL0055',4,'pintu pvc kaca elasdoor yte04 + K + E stailess','19','600,000','','uk : 70 x 195','21',0),(349,'BL0056',4,'pintu pvc urat kayu +K oval + E','19','170,000','','uk : 70 x 196','21',0),(350,'BL0057',4,'pintu pvc abu-abu +K oval + E','19','160,000','','uk : 70 x 197','21',0),(351,'BL0058',4,'pintu pvc putih +K oval + E','19','160,000','','uk : 70 x 198','21',0),(352,'BL0059',4,'pintu pvc hijau +K oval + E','19','160,000','','uk : 70 x 199','21',0),(353,'BL0060',4,'pintu pvc biru +K oval + E','19','160,000','','uk : 70 x 200','21',0),(354,'BL0061',4,'pintu pvc pink +K oval + E','19','160,000','','uk : 70 x 201','21',0),(355,'BL0062',4,'toren pinguin tb 32 orange','9','560,880','600000','','22',0),(356,'BL0063',4,'toren pinguin tb 32 biru','9','560,880','600000','','22',0),(357,'BL0064',4,'toren pinguin tb 55 orange','9','885,600','945000','','22',0),(358,'BL0065',4,'toren pinguin tb 55 biru','9','885,600','945000','','22',0),(359,'BL0066',4,'toren pinguin tb 70 orange','9','1,003,680','1070000','','22',0),(360,'BL0067',4,'toren pinguin tb 70 biru','9','1,003,680','1070000','','22',0),(361,'BL0068',4,'toren pinguin tb 110 orange','9','1,476,000','1570000','','22',0),(362,'BL0069',4,'toren pinguin tb 110 biru','9','1,476,000','1570000','','22',0),(363,'BL0070',4,'fiber gelombang putih 150 x 105','10','42,750','57000','merk multi roof','22',0),(364,'BL0071',4,'fiber gelombang putih 180 x 105','10','51,300','68500','merk multi roof','22',0),(365,'BL0072',4,'fiber gelombang putih 210 x 105','10','59,850','80000','merk multi roof','22',0),(366,'BL0073',4,'fiber gelombang putih 240 x 105','10','68,400','91000','merk multi roof','22',0),(367,'BL0074',4,'fiber gelombang putih 300 x 105','10','85,500','114000','merk multi roof','22',0),(368,'BL0075',4,'fiber gelombang transparant 150 x 80','10','36,000','52500','merk flexi plus','22',0),(369,'BL0076',4,'fiber gelombang transparant 180 x 80','10','43,200','63000','merk flexi plus','22',0),(370,'BL0077',4,'fiber gelombang transparant 210 x 80','10','50,400','73500','merk flexi plus','22',0),(371,'BL0078',4,'fiber gelombang transparant 240 x 80','10','57,600','84000','merk flexi plus','22',0),(372,'BL0079',4,'fiber gelombang transparant 300 x 80','10','72,000','105000','merk flexi plus','22',0),(373,'BL0080',4,'kayu balok 5/10 m3 ','20','3,000,000','','1m3 : 50 btg','23',0),(374,'BL0081',4,'kayu balok 5/10 batang','20','60,000','','','23',0),(375,'BL0082',4,'kayu kaso 4/6 m3','20','2,100,000','','1 m3 : 104 btg','23',0),(376,'BL0083',4,'kayu kaso 4/6 ikat isi 6','20','121,154','','','23',0),(377,'BL0084',4,'kayu kaso 4/6 batang','20','20,193','','','23',0),(378,'BL0085',4,'kayu reng 3/4 m3','20','1,850,000','','1 m3 : 208 btg','23',0),(379,'BL0086',4,'kayu reng 3/4 ikat isi 10','20','89,000','','','23',0),(380,'BL0087',4,'kayu reng 3/4 batang','20','8,900','','','23',0),(381,'BL0088',4,'kayu balok 6/12 m3','20','','','1 m3 : 34,7 btg','23',0),(382,'BL0089',4,'kayu balok 6/12 batang','20','','','','23',0),(383,'BL0090',4,'triplek 8mm 4x8','10','87,000','','','24',0),(384,'BL0091',4,'triplek 9mm 4x8','10','','','','24',0),(385,'BL0092',4,'triplek 4mm 4x8','10','49,000','','','24',0),(386,'BL0093',4,'triplek 6mm 4x8','10','61,000','','','24',0),(387,'BL0094',4,'triplek 12mm 4x8','10','135,000','','','24',0),(388,'BL0095',4,'triplek 15mm 4x8','10','170,000','','','24',0),(389,'BL0096',4,'triplek 3mm 4x8','10','40,000','','','24',0),(390,'BL0097',4,'triplek 18mm 4x8','10','195,000','','','24',0),(391,'BL0098',4,'pipa wavin Aw 1/2','15','15,367','17000','19,030','6',0),(392,'BL0099',4,'pipa wavin Aw 3/4','15','21,052','24000','26,070','6',0),(393,'BL0100',4,'pipa wavin Aw 1','15','28,779','','35,640','25',0),(394,'BL0101',4,'pipa wavin Aw 1 1/4 ','15','43,169','','53,460','25',0),(395,'BL0102',4,'pipa wavin Aw 1 1/2','15','49,564','','61,380','25',0),(396,'BL0103',4,'pipa wavin Aw 2','15','63,421','','78,540','25',0),(397,'BL0104',4,'pipa wavin Aw 2 1/2','15','92,556','','114,620','25',0),(398,'BL0105',4,'pipa wavin Aw 3','15','124,800','','154,550','25',0),(399,'BL0106',4,'pipa wavin Aw 4','15','206,785','','256,080','25',0),(400,'BL0107',4,'pipa wavin Aw 5','15','342,598','','424,270','25',0),(401,'BL0108',4,'pipa wavin Aw 6','15','480,543','','595,100','25',0),(402,'BL0109',4,'pipa wavin D 1 1/4','15','27,092','','33,550','25',0),(403,'BL0110',4,'pipa wavin D 1 1/2','15','30,645','','37,950','25',0),(404,'BL0111',4,'pipa wavin D 2','15','39,261','','48,620','25',0),(405,'BL0112',4,'pipa wavin D 2 1/2 ','15','53,117','','65,780','25',0),(406,'BL0113',4,'pipa wavin D 3 ','15','67,418','73000','83,490','25',0),(407,'BL0114',4,'pipa wavin D 4','15','106,057','','131,340','25',0),(408,'BL0115',4,'pipa wavin D 5','15','170,988','','211,750','25',0),(409,'BL0116',4,'pipa wavin D 6','15','225,527','','279,290','25',0),(410,'BL0117',4,'keni 3 D grest','9','5,393','','7.190 disc 25%','10',0),(411,'BL0118',4,'keni 2 D grest','9','3,428','','4.570  disc 25%','10',0),(412,'BL0119',4,'tee 3/4 Aw RCK','9','2,302','','2,850','10',0),(413,'BL0120',4,'tee 1/2 Aw RCK','9','1,656','','2,050','10',0),(414,'BL0121',4,'keni drat dalam 1/2 Aw RCK','9','1,211','','1,500','10',0),(415,'BL0122',4,'corong talang kotak ASV','9','3,735','','','10',0),(416,'BL0123',4,'corong talang setengah lingkaran RG6','9','26,590','','','10',0),(417,'BL0124',4,'talang setengah lingkaran RG6','15','28,500','','','10',0),(418,'BL0125',4,'tutup talang setengah lingkaran RG6','9','3,070','','','10',0),(419,'BL0126',4,'gantungan talang besi setengah lingkaran RG6','9','7,000','','','10',0),(420,'BL0127',4,'dop 2 D','9','2,095','','2,793','10',0),(421,'CA0195',2,'envi 1 845 brilliant white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(422,'CA0196',2,'envi 2 878 blosom white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(423,'CA0197',2,'envi 3 827 pink 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(424,'CA0198',2,'envi 4 805 crystal blue 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(425,'CA0199',2,'envi 5 825 peach 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(426,'CA0200',2,'envi 6 868 pinky 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(427,'CA0201',2,'envi 7 867 classy blue 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(428,'CA0202',2,'envi 8 869 light purple 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(429,'CA0203',2,'envi 9 828 rose velvet 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(430,'CA0204',2,'envi 10 861 elegant pink 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(431,'CA0205',2,'envi 11 881 purple gold 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(432,'CA0206',2,'envi 12 846 geranium 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(433,'CA0207',2,'envi 13 808 jazzy blue 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(434,'CA0208',2,'envi 14 852 coral grape 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(435,'CA0209',2,'envi 15 877 classic white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(436,'CA0210',2,'envi 16 843 broken white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(437,'CA0211',2,'envi 17 841 lily white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(438,'CA0212',2,'envi 18 833 off white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(439,'CA0213',2,'envi 19 817 cream 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(440,'CA0214',2,'envi 20 842 marygold 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(441,'CA0215',2,'envi 21 821 olympic yellow 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(442,'CA0216',2,'envi 22 818 ivory 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(443,'CA0217',2,'envi 23 855 monaco 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(444,'CA0218',2,'envi 24 820 primerose 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(445,'CA0219',2,'envi 25 848 canary yellow 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(446,'CA0220',2,'envi 26 819 barley white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(447,'CA0221',2,'envi 27 847 signal yellow 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(448,'CA0222',2,'envi 28 862 sunrise 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(449,'CA0223',2,'envi 29 831 brick red 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(450,'CA0224',2,'envi 30 832 terracota 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(451,'CA0225',2,'envi 31 810 teal ice 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(452,'CA0226',2,'envi 32 872 olivera 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(453,'CA0227',2,'envi 33 864 leaf green 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(454,'CA0228',2,'envi 34 806 atlantic blue 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(455,'CA0229',2,'envi 35 875 tender green 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(456,'CA0230',2,'envi 36 807 navy blue 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(457,'CA0231',2,'envi 37 849 sheva green 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(458,'CA0232',2,'envi 38 870 lime green 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(459,'CA0233',2,'envi 39 856 indigo 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(460,'CA0234',2,'envi 40 813 aqua green 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(461,'CA0235',2,'envi 41 850 paradise green 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(462,'CA0236',2,'envi 42 839 millenium 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(463,'CA0237',2,'envi 43 874 silver blue 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(464,'CA0238',2,'envi 44 854 saphire blue','3','99,264','110000','110.000 disc 6% + 4%','26',0),(465,'CA0239',2,'envi 45 873 fontana 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(466,'CA0240',2,'envi 46 840 goose wing 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(467,'CA0241',2,'envi 47 880 primavera 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(468,'CA0242',2,'envi 48 835 milk grey 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(469,'CA0243',2,'envi 49 823 coffe 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(470,'CA0244',2,'envi 50 858 sahara 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(471,'CA0245',2,'envi 51 824 saddle tan 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(472,'CA0246',2,'envi 52 871 natura 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(473,'CA0247',2,'envi 53 834 alabaster 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(474,'CA0248',2,'envi 54 803 light violet 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(475,'CA0249',2,'envi 55 836 ash grey 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(476,'CA0250',2,'envi white 5k','3','99,264','110000','110.000 disc 6% + 4%','26',0),(477,'CA0251',2,'envi white 25k','16','473,760','520000','525.000 disc 6% + 4%','26',0),(478,'BL0128',4,'pipa top Aw 1','15','','','28.500 disc 20 + 5','27',0),(479,'BL0129',4,'pipa listrik top 5/8 4M','15','','','5.300 disc 20 + 5','27',0),(480,'BL0130',4,'toren tedmond 550L','9','724,625','825000','','10',0),(481,'BL0131',4,'toren tedmond 1100L','9','1,207,140','1350000','','10',0);
/*!40000 ALTER TABLE `master_data_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_data_copy_copy`
--

DROP TABLE IF EXISTS `master_data_copy_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_data_copy_copy` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(20) DEFAULT NULL,
  `kategori` varchar(15) DEFAULT NULL,
  `nama_barang` varchar(46) DEFAULT NULL,
  `satuan` varchar(7) DEFAULT NULL,
  `harga_modal` varchar(12) DEFAULT NULL,
  `harga_jual` varchar(10) DEFAULT NULL,
  `keterangan` varchar(28) DEFAULT NULL,
  `distributor` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_data_copy_copy`
--

LOCK TABLES `master_data_copy_copy` WRITE;
/*!40000 ALTER TABLE `master_data_copy_copy` DISABLE KEYS */;
INSERT INTO `master_data_copy_copy` VALUES (2,'FP0001','fiber plat','cocoplas 40 x 1 x 08 putih roll','roll ','890,000','','40 m','Rajawali Mas'),(3,'FP0002','fiber plat','cocoplas 40 x 1 x 08 putih meter','meter','23,421','28,000','','Rajawali Mas'),(4,'FP0003','fiber plat','fancy glass 40 x 1 x 07 putih roll','roll ','850,000','','40 m','Rajawali Mas'),(5,'FP0004','fiber plat','fancy glass 40 x1 x 07 putih meter','meter','22,369','28,000','','Rajawali Mas'),(6,'FP0005','fiber plat','fancy glass 40 x 1 x 07 ribben roll','roll ','850,000','','40 m','Rajawali Mas'),(7,'FP0006','fiber plat','fancy glass 40 x1 x 07 putih meter','meter','22,369','28,000','','Rajawali Mas'),(8,'CA0001','cat','Nippon vinilex white','gallon','102,520','105,000','5 kg','nipsea paint and chemicals'),(9,'BD0001','barang dalam','isarplas tube','tube','5,600','8,500','','andika'),(10,'BD0002','barang dalam','isarplas kaleng / kuas','kaleng','31,500','40,000','','andika'),(11,'BD0003','barang dalam','karbit MDQ','kg','20,900','25,000','1 dus @25kg : 522.500','andika'),(12,'BD0004','barang dalam','fox biru 350 gr','bungkus','5,900','9,000','350 gr','andika'),(13,'BD0005','barang dalam','soda api 1 kg','bungkus','9,800','18,500','1 kg','andika'),(14,'BD0006','barang dalam','fox kuning 1/2 ','kaleng','20,500','30,000','300 gr','andika'),(15,'BD0007','barang dalam','thiner impala 1 ltr','kaleng ','19,000','24,000','1 liter','andika'),(16,'BD0008','barang dalam','thiner kapinis 1 ltr','kaleng ','9,750','18,500','1 liter','andika'),(17,'BD0009','barang dalam','HCL + gen','dirigen','180,000','250,000','','andika'),(18,'BL0001','barang luar','almunium foil single','roll ','300,000','425,000','50 m','andika'),(19,'BL0002','barang luar','almunium foil single meter','meter','6,250','10,000','','andika'),(20,'BL0003','barang luar','almunium foil double','roll ','430,000','555,000','50 m','andika'),(21,'BL0004','barang luar','almunium foil double meter','meter','8,958','12,500','','andika'),(22,'CA0002','cat','metrolite gallon','gallon','83,000','90,000','5 kg','andika'),(23,'BL0005','barang luar','garpu injuk baja','pcs','60,000','85,000','','ahui / joko'),(24,'BD0010','barang dalam','kunci besi 6,8,10,12','pcs','12,500','25,000','kunci besi panjang biru','ahui / joko'),(25,'BL0006','barang luar','loster sakura','pcs','2,300','6,000','20 x 20','canvasing'),(26,'BL0007','barang luar','loster wajik','pcs','1,800','3,500','10 x 20','canvasing'),(27,'BL0008','barang luar','Go green 150 x 80 Merah','lembar','34,200','52,500','PL','sinar cengkareng'),(28,'BL0009','barang luar','Go green 180 x 80 Merah','lembar','41,040','63,000','PL','sinar cengkareng'),(29,'BL0010','barang luar','Go green 210 x 80 Merah','lembar','47,880','73,500','PL ','sinar cengkareng'),(30,'BL0011','barang luar ','Go green 240 x 80 Merah','lembar','54,720','84,000','PL 60.800','sinar cengkareng'),(31,'BL0012','barang luar ','go green 300 x 80 Merah','lembar','70,200','105,000','PL 78.000','sinar cengkareng'),(32,'BE0001','barang etalase','kabel Ties hitam 20 cm','bungkus','7,500','','','ss joni'),(33,'BE0002','barang etalase','mata obeng gypsum bosch ph2 x 65mm','pcs','9,555','','mata obeng / screw driver','ss joni'),(34,'BE0003','barang etalase','dynabolt 12 x 60 `','pcs','1,315','','1 box : 100 pcs','ss joni'),(35,'BD0011','barang dalam','bak cat','pcs','3,125','','1 lsn : 37.500','ss joni'),(36,'BD0012','barang dalam','roskam pvc hitam','pcs','3,750','','1 lsn : 45.000','ss joni'),(37,'BE0004','barang etalase','kunci pintu bs lanvin + body komp','pcs','75,000','','kunci besi 1 set + body komp','ss joni'),(38,'BE0005','barang etalase','pahat kayu abus 1 1/4','pcs','8,542','','1 lsn : 102.500','ss joni'),(39,'BE0006','barang etalase ','tembakan lem chrome tulang','pcs','12,500','','tembakan sealent','ss joni'),(40,'BE0007','barang etalase','palu karet reyner 16 oz','pcs','13,000','','1 lsn : 156.000','ss joni'),(41,'BE0008','barang etalase','palu bodem 08 lb','pcs','46,000','','','ss joni'),(42,'BE0009','barang etalase','palu bodem 12 lb','pcs','69,000','','','ss joni'),(43,'BE0010','barang etalase','hak angin tiptop 8 sn','pcs ','3,334','','1 lsn : 40.000','ss joni'),(44,'BE0011','barang etalase','mata serut bison bc 13/4','pcs','12,000','','1 lsn : 120.000','ss joni'),(45,'BE0012','barang etalase ','shower toilet figo pt','pcs','27,500','','','ss joni'),(46,'BE0013','barang etalase','shower toilet rxt bm','pcs ','27,500','','','ss joni'),(47,'BE0014','barang etalase','showe toilet rxt iv','pcs ','27,500','','','ss joni'),(48,'BD0013','barang dalam','paku seng 3 ss ulir','dus','130,000','','harga 1 dus','ss joni'),(49,'BE0015','barang etalase','balvalve pvc hd blitz 1/2','pcs','7,750','','','ss joni'),(50,'BE0016','barang etalase','balvalve pvc hd blitz 3/4','pcs','9,750','','','ss joni'),(51,'BE0017','barang etalase','kuas cat 633 abus 2,5\"','pcs','4,688','','1 lsn : 56.250','ss joni'),(52,'BE0018','barang etalase','kape gagang fiber bracio 2','pcs','4,667','','1 lsn : 56.000','ss joni'),(53,'BE0019','barang etalase ','kape gagang fiber bracio 2,5\"','pcs','5,084','','1 lsn : 61.000','ss joni'),(54,'BE0020','barang etalase ','obeng bb glorius transparant 5','pcs','4,792','','1 lsn : 57.500','ss joni'),(55,'BE0021','barang etalase','batu asah panda 6','pcs','7,000','','','ss joni'),(56,'BE0022','barang etalase','batu asah panda 8','pcs','7,500','','','ss joni'),(57,'BE0023','barang etalase ','tarikan laci rrt 4','pcs','667','','1 lsn : 8.000','ss joni'),(58,'BE0024','barang etalase ','grendel stainless axl bc 2','pcs','3,750','','1 lsn : 45.000','ss joni'),(59,'BE0025','barang etalase','baut baja ringan 10 x 19','dus','122,500','','1 dus : 122.500','ss joni'),(60,'BE0026','barang etalase','engsel tebal elbrus 3 sn','pcs','15,667','','1 lsn : 188.000','ss joni'),(61,'BL0013','barang luar','semen gresik 40 kg','sak','','','','andika'),(62,'BL0014','barang luar','semen tiga roda 50 kg','sak','','','','andika'),(63,'BL0015','barang luar ','semen SCG 50 kg','sak','','','','andika'),(64,'CA0003','cat ','kuda terbang 0,1L','klg','','','1 lsn : 87.750','andika'),(65,'BD0014','barang dalam','klem pipa pvc 3','pcs','900','','','andika'),(66,'BD0015','barang dalam','thiner nd botol kratindeng','pcs','','','1 lsn : 30.000','andika'),(67,'CA0004','cat ','meni besi hijau kampak 1 ltr','klg','16,750','','','andika'),(68,'BD0016','barang dalam','air keras','pcs','','','1 lsn : 37.500','andika'),(69,'BD0017','barang dalam','aica aibon 0,1L','klg','7,550','','','andika'),(70,'BD0018','barang dalam','kain pell','pcs','','','1 kodi : 55.000','andika'),(71,'BD0019','barang dalam','kaporit bubuk 0,5kg','bungkus','14,000','','','andika'),(72,'CA0005','cat ','metrolite pail','klg','830,000','','','andika'),(73,'BD0020','barang dalam','porstex','pcs','','','1 dus : 172.500','andika'),(74,'BD0021','barang dalam','thiner impala gallon','gln','76,750','','','andika'),(75,'BD0022','barang dalam','afduner','btl','4,750','','','andika'),(76,'CA0006','cat ','meni kayu kampak gallon','gln','53,800','','','andika'),(77,'BD0023','barang dalam','soda api 1/2 kg','pcs','4,900','','','andika'),(78,'BD0024','barang dalam ','neorever 1/4','pcs','18,500','','','andika'),(79,'BD0025','barang dalam','fox putih 1/2 kg','btl','11,250','','','andika'),(80,'BD0026','barang dalam ','sanpolac 1 kg','klg','30,000','','','andika'),(81,'BD0027','barang dalam','isamu 1 kg','klg','49,000','','','andika'),(82,'CA0007','cat','flinkote seiv','klg','31,900','','','andika'),(83,'CA0008','cat','seiv tembaga 1/4','klg','22,000','','','andika'),(84,'CA0009','cat','seiv mas 1/4','klg','25,750','','','andika'),(85,'BD0028','barang dalam','fox kuning gallon','gln','129,000','','','andika'),(86,'BD0029','barang dalam','corment','klg','25,000','','','andika'),(87,'BD0030','barang dalam ','tali rafiah','pcs','19,250','','','andika'),(88,'BD0031','barang dalam','brown mas kangguru 0,1','klg','','','1 lsn : 115.000','andika'),(89,'BD0032','barang dalam','klem pipa pvc 1/2','pcs','300','','','andika'),(90,'BD0033','barang dalam ','fox putih 1 kg','btl','19,500','','','andika'),(91,'BD0034','barang dalam','pengki hijau','pcs','6,667','','1 lsn : 80.000','andika'),(92,'BD0035','barang dalam','aica aibon 1/2','klg','29,800','','','andika'),(93,'CA0010','cat','flinkote sheep','klg','20,000','','','andika'),(94,'BL0016','barang luar','selang flex trilliun 5/8 roll 100M','pcs','340,000','','','andika'),(95,'BL0017','barang luar','selang flex trilliun 5/8 roll meter','meter','3,400','','','andika'),(96,'BL0018','barang luar','mill','sak','25,000','','','andika'),(97,'BD0036','barang dalam','thiner ND super + dirigen','pcs','160,000','','','andika'),(98,'CA0011','cat ','vernis glasstone clear gloss','klg','56,700','','63.000 diskon 10%','andika'),(99,'CA0012','cat ','seiv hitam doff 880M','klg','49,000','','','andika'),(100,'CA0013','cat','seiv putih doff 180M','klg','49,000','','','andika'),(101,'BD0037','barang dalam','alcasit','bks','16,200','','','andika'),(102,'BD0038','barang dalam','oker AGA putih','bks','5,100','','','andika'),(103,'BD0039','barang dalam ','lem intraplas tube','pcs','3,750','','','andika'),(104,'BD0040','barang dalam','lem karpet tube','pcs','6,000','','','andika'),(105,'BD0041','barang dalam','lem fiber nun kcl','btl','7,500','','','andika'),(106,'BD0042','barang dalam','calt bond','klg','41,400','','','andika'),(107,'CA0014','cat ','aquaproof 1 kg hitam','klg','41,800','','','pt. Adhi cakra utama mulia'),(108,'CA0015','cat','aquaproof 1 kg biru ','klg','41,800','','','pt. Adhi cakra utama mulia'),(109,'CA0016','cat','aquaproof 1 kg merah','klg','41,800','','','pt. Adhi cakra utama mulia'),(110,'CA0017','cat','aquaproof 1 kg abu abu','klg','41,800','','','pt. Adhi cakra utama mulia'),(111,'CA0018','cat','aquaproof 1 kg abu muda','klg','41,800','','','pt. Adhi cakra utama mulia'),(112,'CA0019','cat','aquaproof 1 kg coklat','klg','41,800','','','pt. Adhi cakra utama mulia'),(113,'CA0020','cat','aquaproof 1 kg putih','klg','41,800','','','pt. Adhi cakra utama mulia'),(114,'CA0021','cat','aquaproof 1 kg cream','klg','41,800','','','pt. Adhi cakra utama mulia'),(115,'CA0022','cat','aquaproof 1 kg transparant','klg','41,800','','','pt. Adhi cakra utama mulia'),(116,'CA0023','cat','aquaproof gallon cream','gallon','158,423','','','pt. Adhi cakra utama mulia'),(117,'CA0024','cat','aquaproof gallon abu abu','gallon','158,423','','','pt. Adhi cakra utama mulia'),(118,'CA0025','cat','aquaproof gallon hitam','gallon','158,423','','','pt. Adhi cakra utama mulia'),(119,'CA0026','cat','aquaproof gallon putih','gallon','158,423','','','pt. Adhi cakra utama mulia'),(120,'CA0027','cat','aquaproof gallon coklat','gallon','158,423','','','pt. Adhi cakra utama mulia'),(121,'CA0028','cat','aquaproof gallon merah','gallon','158,423','','','pt. Adhi cakra utama mulia'),(122,'CA0029','cat','aquaproof gallon abu muda','gallon','158,423','','','pt. Adhi cakra utama mulia'),(123,'CA0030','cat','aquaproof gallon biru','gallon','158,423','','','pt. Adhi cakra utama mulia'),(124,'CA0031','cat','aquaproof gallon transparant','gallon','158,423','','','pt. Adhi cakra utama mulia'),(125,'BL0019','barang luar','star mortar M811 40kg perekat bata ringan','sak','','','71.000 (20 extra 2)','SBM'),(126,'BL0020','barang luar ','coumpond aplus sak','sak','50,000','','','SBM'),(127,'BD0043','barang dalam','coumpond aplus 1kg','ktg','','','','SBM'),(128,'BL0021','barang luar ','semen putih tiga roda sak','sak','88,000','','','SBM'),(129,'BD0044','barang dalam ','semen putih 1 kg','ktg','','','','SBM'),(130,'BL0022','barang luar','gypsum aplus 9mm x 1200 x 2400','lembar','49,500','','','SBM'),(131,'BL0023','barang luar','MU 380 perekat bata ringan 40kg','sak','','','','lain lain'),(132,'BL0024','barang luar','MU 420 perekat keramik 25 kg','sak','70,000','79,000','','SBM'),(133,'BL0025','barang luar','MU 400 perekat granit tile 25 kg','sak','103,000','115,000','','SBM'),(134,'BL0026','barang luar ','besi slup 4 X 8','btg','30,000','45,000','','SBM'),(135,'BL0027','barang luar ','besi slup 3 x 8','btg','22,500','35,000','','SBM'),(136,'BL0028','barang luar','karpet h/m 55 roll 50M','roll ','230,000','','','UBJ'),(137,'BL0029','barang luar','karpet h/m 55 roll meter','meter','5,600','','','UBJ'),(138,'BL0030','barang luar','karpet h/m 90 roll 50M','roll ','380,000','','','UBJ'),(139,'BL0031','barang luar','karpet h/m 90 roll meter','meter','7,600','','','UBJ'),(140,'BL0032','barang luar','ember cor jumbo hijau','pcs','5,300','','','UBJ'),(141,'BL0033','barang luar','karpet h/m 110 roll 50m','roll ','560,000','','','UBJ'),(142,'BL0034','barang luar','karpet h/m 110 meter','meter','11,200','','','UBJ'),(143,'BL0035','barang luar','terpal jadi 3 x 4','pcs','46,800','','','UBJ'),(144,'BL0036','barang luar','terpal jadi 5 x 6','pcs','117,000','','','UBJ'),(145,'BL0037','barang luar','terpal meteran orange/biru','meter','7,250','','','UBJ'),(146,'BL0038','barang luar','terpal meteran orange/biru roll 100m','roll ','725,000','','','UBJ'),(147,'BL0039','barang luar ','ember cor kecil hijau','pcs','2,900','','','UBJ'),(148,'BD0045','barang dalam','dop 4','pcs','3,750','','','UBJ'),(149,'BL0040','barang luar ','kawat loket 1/2 x 90 putih roll 10m','roll ','79,000','','','UBJ'),(150,'BL0041','barang luar ','kawat loket 1/2 x 90 putih roll meter','meter','7,900','','','UBJ'),(151,'CA0032','cat ','catylac 1501 putih gallon ','gallon','102,286','','5 kg','Catur Sentosa Adiprana'),(152,'CA0033','cat','catylac 1501 putih pail','pail','498,422','','25 kg','Catur Sentosa Adiprana'),(153,'CA0034','cat ','dulux pentalite BW pail ','pail','1,012,236','','20 L','Catur Sentosa Adiprana'),(154,'CA0035','cat','catylac base T911A gallon','gallon','87,930','','5 kg','Catur Sentosa Adiprana'),(155,'CA0036','cat','dulux pentalite BW gallon','gallon','137,506','','2,5 L','Catur Sentosa Adiprana'),(156,'CA0037','cat ','dulux wheatershield BW gallon','gallon','206,260','','2,5 L','Catur Sentosa Adiprana'),(157,'CA0038','cat ','dulux v-gloss 9000 white','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(158,'CA0039','cat ','dulux v-gloss 122 black','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(159,'CA0040','cat ','dulux v-gloss 9002 white doff','klg','49,349','55,000','0,8 L','Catur Sentosa Adiprana'),(160,'CA0041','cat ','dulux v-gloss 40710 black doff','klg','49,349','55,000','0,8 L','Catur Sentosa Adiprana'),(161,'CA0042','cat ','dulux v-gloss 46637 1 earthland','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(162,'CA0043','cat ','dulux v-gloss 46632 2 golden brown','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(163,'CA0044','cat ','dulux v-gloss 41674 3 blue night wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(164,'CA0045','cat ','dulux v-gloss 40700 4 dolpin grey','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(165,'CA0046','cat ','dulux v-gloss 43631 5 papillon red','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(166,'CA0047','cat ','dulux v-gloss 47527 6 pumpkin orange wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(167,'CA0048','cat ','dulux v-gloss 42622 7 aspen green','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(168,'CA0049','cat ','dulux v gloss 41671 8 saphire blue wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(169,'CA0050','cat ','dulux v-gloss 40699 9 jade dove ','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(170,'CA0051','cat ','dulux v-gloss 43630 10 vermilion wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(171,'CA0052','cat ','dulux v-gloss 45586 11 lily yellow wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(172,'CA0053','cat ','dulux v-gloss 42621 12 victoria garden','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(173,'CA0054','cat ','dulux v-gloss 40701 13 north grey','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(174,'CA0055','cat ','dulux v-gloss 43633 14 old coral','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(175,'CA0056','cat ','dulux v-gloss 42619 15 turquoise','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(176,'CA0057','cat ','dulux v-gloss 41672 16 oriental blue wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(177,'CA0058','cat ','dulux v-gloss 47525 18 cinnabar orange wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(178,'CA0059','cat ','dulux v-gloss 45587 19 sunshine canary wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(179,'CA0060','cat ','dulux v-gloss 42624 20 evergreen wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(180,'CA0061','cat ','dulux v-gloss 43632 22 sympony pink wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(181,'CA0062','cat ','dulux v-gloss 42620 23 starfruit','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(182,'CA0063','cat ','dulux v-gloss 46635 24 mocha rich','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(183,'CA0064','cat ','dulux v-gloss 46631 25 brown leather','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(184,'CA0065','cat ','dulux v-gloss 46636 26 candy honey','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(185,'CA0066','cat ','dulux v-gloss 46633 27 dust brown','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(186,'CA0067','cat ','dulux v-gloss 46628 28 bamboo cream','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(187,'CA0068','cat ','dulux v-gloss 46630 29 cinnamon suede','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(188,'CA0069','cat ','dulux v-gloss 46634 30 spicy brown','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(189,'CA0070','cat ','dulux v-gloss 47526 31 sweet melon','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(190,'CA0071','cat ','dulux v-gloss 46627 32 butterfly','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(191,'CA0072','cat ','dulux v-gloss 45585 33 candlelight','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(192,'CA0073','cat ','dulux v-gloss 46626 34 papyrus iced','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(193,'CA0074','cat ','dulux v-gloss 41675 35 elize blue wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(194,'CA0075','cat ','dulux v-gloss 45588 36 mustard banana wk','klg','48,900','55,000','0,8 L','Catur Sentosa Adiprana'),(195,'CA0076','cat ','dulux v-gloss 40698 37 pewter grey','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(196,'CA0077','cat ','dulux v-gloss 46629 38 adeline pearl','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(197,'CA0078','cat ','dulux v-gloss 41673 39 neptune navy','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(198,'CA0079','cat ','dulux v-gloss 42623 40 eden green','klg','45,042','50,000','0,8 L','Catur Sentosa Adiprana'),(199,'CA0080','cat ','dulux pentalite base T922C gallon','gallon','94,061','','2,5 L','Catur Sentosa Adiprana'),(200,'CA0081','cat ','dulux wheatershield base 1918B gallon','gallon','181,965','','2,5 L','Catur Sentosa Adiprana'),(201,'BL0042','barang luar','list profil K6 ','btg','11,900','','4 m / btg','Pd. Special Profil'),(202,'BL0043','barang luar','List profil k22','btg','13,600','','4 m / btg','Pd. Special Profil'),(203,'BL0044','barang luar','papan cor tebal','lembar','8,700','','','MP'),(204,'BE0027','barang etalase','kape pvc 7','pcs','11,000','','','Aneka jaya'),(205,'BE0028','barang etalase','kunci laci huben 138','pcs','6,250','','1 ls : 75.000','Aneka jaya'),(206,'BE0029','barang etalase','sarung tangan karet','psg','8,500','','','Aneka jaya'),(207,'BE0030','barang etalase ','sarung tangan kain bintik tebal','psg','6,250','','1 ls : 75.000','Aneka jaya'),(208,'BE0031','barang etalase','mata sock roofing benz 8','pcs','5,500','15,000','27.500 / 5pcs','Aneka jaya'),(209,'BE0032','barang etalase','floordrain stenlis biasa','pcs','8,500','','','Aneka jaya'),(210,'BE0033','barang etalase','engsel tipis rrt 3','psg','959','','1 ls : 11.500','Aneka jaya'),(211,'BE0034','barang etalase','siku rak 10 x 12','psg','5,417','','1 ls : 65.000','Aneka jaya'),(212,'BE0035','barang etalase','meteran karet 5M crono','pcs','7,500','','1 ls : 90.000','Aneka jaya'),(213,'BL0045','barang luar','besi 8 mm F','btg','24,648','30,000','f : hshi','sinar stell'),(214,'BL0046','barang luar ','besi 10 mm F','btg','38,480','','f : hshi','sinar stell'),(215,'BD0046','barang dalam ','paku seri 5cm (2) dus','dus','216,000','','1 dus : 30 kg','sinar stell'),(216,'BD0047','barang dalam ','paku seri 5cm (2) kg','kg','7,200','','','sinar stell'),(217,'BD0048','barang dalam ','paku seri 7cm (3) dus','dus','216,000','','1 dus : 30 kg','sinar stell'),(218,'BD0049','barang dalam ','paku seri 7cm (3) kg','kg','7,200','','','sinar stell'),(219,'BD0050','barang dalam ','paku seri 10cm (4) dus','dus','216,000','','1 dus : 30 kg','sinar stell'),(220,'BD0051','barang dalam ','paku seri 10cm (4) kg','kg','7,200','','','sinar stell'),(221,'BD0052','barang dalam ','paku seri 12cm (5) dus','dus','216,000','','1 dus : 30 kg','sinar stell'),(222,'BD0053','barang dalam','paku seri 12cm (5) kg','kg','7,200','','','sinar stell'),(223,'BD0054','barang dalam','kawat bendrat rrt @25kg','roll ','216,000','','','sinar stell'),(224,'BD0055','barang dalam','kawat bendrat rrt ikatan','ikat','7,200','','1 ikat : 0,8 ons','sinar stell'),(225,'BL0047','barang luar','besi 6 mm ','btg','10,750','17,000','','sinar stell'),(226,'BL0048','barang luar','besi 8 mm S','btg','19,750','25,000','s : ssi','sinar stell'),(227,'BL0049','barang luar','besi 12 mm F','btg','55,640','68,000','f : hshi','sinar stell'),(228,'BL0050','barang luar','seng plat 0,2 x 90 roll @48m','roll ','984,000','','','sinar stell'),(229,'BL0051','barang luar ','seng plat 0,2 x 90 meter','meter','20,500','28,000','','sinar stell'),(230,'BL0052','barang luar ','seng gelombang','lembar','35,000','40,000','','sinar stell'),(231,'BL0053','barang luar ','seng plat 0,2 x 55 roll @48m','roll ','576,000','','','sinar stell'),(232,'BL0054','barang luar','seng plat 0,2 x 55 meter','meter','12,000','18,000','','sinar stell'),(233,'BD0056','barang dalam ','paku seng 3 polos','kg','','','','Wahana / song khim'),(234,'BD0057','barang dalam','paku seng 2 polos','kg','','','1 dus : 280.000 @?kg','Wahana / song khim'),(235,'CA0082','cat ','matex putty plamir 4k','gallon','41,360','','','Pt. Nipsea Paint & Chemical'),(236,'CA0083','cat ','matec putty plamir 1K','klg','12,540','','','Pt. Nipsea Paint & Chemical'),(237,'CA0084','cat','vinilex 300 white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(238,'CA0085','cat','vinilex 8013 1 tulip white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(239,'CA0086','cat','vinilex 8005 2 barley white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(240,'CA0087','cat','vinilex 953A 3 pearly white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(241,'CA0088','cat','vinilex 8007 4 carnation white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(242,'CA0089','cat','vinilex 919 5 prime white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(243,'CA0090','cat','vinilex 8006 6 lily white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(244,'CA0091','cat','vinilex 921 7 marigold 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(245,'CA0092','cat','vinilex 918 8  chrysan white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(246,'CA0093','cat','vinilex 978 9 wild rose 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(247,'CA0094','cat','vinilex 8002 10 apple white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(248,'CA0095','cat','vinilex 926 11 light cream 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(249,'CA0096','cat','vinilex 976 12 rose 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(250,'CA0097','cat','vinilex 927 13 lemon ice 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(251,'CA0098','cat','vinilex 912 14 honey tone 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(252,'CA0099','cat','vinilex 915 15 fresh apricot 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(253,'CA0100','cat','vinilex 332 16 antique white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(254,'CA0101','cat','vinilex 917 17 rosy pink 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(255,'CA0102','cat','vinilex 913 19 ginger peachy 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(256,'CA0103','cat','vinilex 906A 20 sun fresh 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(257,'CA0104','cat','vinilex 330 21 linen white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(258,'CA0105','cat','vinilex 955A 22 lady pink 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(259,'CA0106','cat','vinilex 938 23 honey yellow 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(260,'CA0107','cat','vinilex 901 24 goby sands 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(261,'CA0108','cat','vinilex 916 26 chery blossom 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(262,'CA0109','cat','vinilex 933 27 kecapi 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(263,'CA0110','cat','vinilex 982 28 tangerine 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(264,'CA0111','cat','vinilex 914 29 salmon 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(265,'CA0112','cat','vinilex 181 30 ivory 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(266,'CA0113','cat','vinilex 934 32 sunlight 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(267,'CA0114','cat','vinilex 940 33 mango crush 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(268,'CA0115','cat','vinilex 983 34 sunset 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(269,'CA0116','cat','vinilex 182 35 cream 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(270,'CA0117','cat','vinilex 906 36 terra cotta 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(271,'CA0118','cat','vinilex 939 37 yellow sunset 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(272,'CA0119','cat','vinilex 945 38 musk melon 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(273,'CA0120','cat','vinilex 622 39 poppy 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(274,'CA0121','cat','vinilex 958A 41 smokey grey 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(275,'CA0122','cat','vinilex 920 42 super white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(276,'CA0123','cat','vinilex 971 43 soft blue 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(277,'CA0124','cat','vinilex 8008 44 iris white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(278,'CA0125','cat','vinilex 956A 45 sky light 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(279,'CA0126','cat','vinilex 922 46 lilac white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(280,'CA0127','cat','vinilex 973 47 blue white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(281,'CA0128','cat','vinilex 8009 49 avocado white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(282,'CA0129','cat','vinilex 924 50 aqua marine 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(283,'CA0130','cat','vinilex 925 51 tear drop 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(284,'CA0131','cat','vinilex 957A 53 green candy 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(285,'CA0132','cat','vinilex 316 54 lake blue 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(286,'CA0133','cat','vinilex 931 55 cool blue 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(287,'CA0134','cat','vinilex 943 57 dream land 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(288,'CA0135','cat','vinilex 959A 58 lilac 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(289,'CA0136','cat','vinilex 937 59 arctic blue 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(290,'CA0137','cat','vinilex 954A 60 dolpin grey 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(291,'CA0138','cat','vinilex 951 61 green romantic 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(292,'CA0139','cat','vinilex 241 62 foliage 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(293,'CA0140','cat','vinilex 941 63 magic purple 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(294,'CA0141','cat','vinilex 944 64 everest blue 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(295,'CA0142','cat','vinilex 950 65 pure grey 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(296,'CA0143','cat','vinilex 942 66 coral spring 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(297,'CA0144','cat','vinilex 243 67 fresh lime 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(298,'CA0145','cat','vinilex 936 68 tiara 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(299,'CA0146','cat','vinilex 952 69 wisdom blue 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(300,'CA0147','cat','vinilex 948 70 yl grey 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(301,'CA0148','cat','vinilex 907 71 merak hijau 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(302,'CA0149','cat','vinilex 244 72 autumn green 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(303,'CA0150','cat','vinilex 909 73 wira blue 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(304,'CA0151','cat','vinilex 947 74 minimalis grey 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(305,'CA0152','cat','vinilex 979 75 cameo white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(306,'CA0153','cat','vinilex 911 78 lilac frost 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(307,'CA0154','cat','vinilex 8003 79 orchid white 5k','gallon','102,520','105,000','','Pt. Nipsea Paint & Chemical'),(308,'CA0155','cat ','vinilex wall sealer 5180 alkali resistence 20L','pail','585,860','','','Pt. Nipsea Paint & Chemical'),(309,'CA0156','cat ','qluc 1505 white pail 20k','pail','199,980','','','Pt. Nipsea Paint & Chemical'),(310,'CA0157','cat','qluc 1505 white 5k','gallon','51,150','','','Pt. Nipsea Paint & Chemical'),(311,'CA0158','cat ','vinilex 182 35 cream 25k','pail','','','','Pt. Nipsea Paint & Chemical'),(312,'CA0159','cat ','vinilex 958A 41 smokey grey 25k','pail','','','','Pt. Nipsea Paint & Chemical'),(313,'CA0160','cat ','vinilex 300 white 25k','pail','','','','Pt. Nipsea Paint & Chemical'),(314,'CA0161','cat ','senilex 20 1 canvas 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(315,'CA0162','cat ','senilex 63 2 sky blue 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(316,'CA0163','cat ','senilex 66 3 jasmine 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(317,'CA0164','cat ','senilex 73 4 fountain blue 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(318,'CA0165','cat ','senilex 00 5 crystal lime 5 k','gallon','42,500','55,000','','cv. Mega indah jaya'),(319,'CA0166','cat ','senilex 58 6 lake blue 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(320,'CA0167','cat ','senilex 60 7 cream 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(321,'CA0168','cat ','senilex 99 8 millenium green 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(322,'CA0169','cat ','senilex 21 9 heaven blue 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(323,'CA0170','cat ','senilex 62 10 tile red 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(324,'CA0171','cat ','senilex 11 11 cristal blue 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(325,'CA0172','cat ','senilex 71 12 cherry blossom 5 k','gallon','42,500','55,000','','cv. Mega indah jaya'),(326,'CA0173','cat ','senilex 10 13 deep ocean 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(327,'CA0174','cat ','senilex 51 14 fresh green 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(328,'CA0175','cat ','senilex 22 15 valentine 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(329,'CA0176','cat ','senilex 02 16 durian 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(330,'CA0177','cat ','senilex 80 17 african desert 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(331,'CA0178','cat ','senilex 19 18 tropicana 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(332,'CA0179','cat ','senilex 55 19 blue haze 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(333,'CA0180','cat ','senilex 88 20 lemon yellow 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(334,'CA0181','cat ','senilex 30 21 sunrise 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(335,'CA0182','cat ','senilex 17 22 golden honey 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(336,'CA0183','cat ','senilex 08 23 minimalis grey 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(337,'CA0184','cat ','senilex 09 24 grey 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(338,'CA0185','cat','senilex white 5k','gallon','42,500','55,000','','cv. Mega indah jaya'),(339,'CA0186','cat','senilex white 23k','pail','185,300','230,000','','cv. Mega indah jaya'),(340,'CA0187','cat','romatex white 5 k','gallon','67,050','75,000','','cv. Mega indah jaya'),(341,'CA0188','cat','romatex white 1k','klg','20,700','25,000','','cv. Mega indah jaya'),(342,'CA0189','cat ','romatex white 23k','pail','301,500','','','cv. Mega indah jaya'),(343,'CA0190','cat ','wita white','klg','31,000','','','cv. Mega indah jaya'),(344,'CA0191','cat ','wita black','klg','31,000','','','cv. Mega indah jaya'),(345,'CA0192','cat ','romatex genteng black 5k','gallon','121,500','','','cv. Mega indah jaya'),(346,'CA0193','cat','pylox 300cc ZPR ','klg','15,800','','','cv. Handal inti usaha'),(347,'CA0194','cat ','pylox 400cc ZPR ','klg','20,800','','','cv. Handal inti usaha'),(348,'BL0055','barang luar','pintu pvc kaca elasdoor yte04 + K + E stailess','set','600,000','','uk : 70 x 195','Aan'),(349,'BL0056','barang luar','pintu pvc urat kayu +K oval + E','set','170,000','','uk : 70 x 196','Aan'),(350,'BL0057','barang luar','pintu pvc abu-abu +K oval + E','set','160,000','','uk : 70 x 197','Aan'),(351,'BL0058','barang luar','pintu pvc putih +K oval + E','set','160,000','','uk : 70 x 198','Aan'),(352,'BL0059','barang luar','pintu pvc hijau +K oval + E','set','160,000','','uk : 70 x 199','Aan'),(353,'BL0060','barang luar','pintu pvc biru +K oval + E','set','160,000','','uk : 70 x 200','Aan'),(354,'BL0061','barang luar','pintu pvc pink +K oval + E','set','160,000','','uk : 70 x 201','Aan'),(355,'BL0062','barang luar ','toren pinguin tb 32 orange','pcs','560,880','600,000','','ko asun'),(356,'BL0063','barang luar ','toren pinguin tb 32 biru','pcs','560,880','600,000','','ko asun'),(357,'BL0064','barang luar ','toren pinguin tb 55 orange','pcs','885,600','945,000','','ko asun'),(358,'BL0065','barang luar ','toren pinguin tb 55 biru','pcs','885,600','945,000','','ko asun'),(359,'BL0066','barang luar ','toren pinguin tb 70 orange','pcs','1,003,680','1,070,000','','ko asun'),(360,'BL0067','barang luar ','toren pinguin tb 70 biru','pcs','1,003,680','1,070,000','','ko asun'),(361,'BL0068','barang luar ','toren pinguin tb 110 orange','pcs','1,476,000','1,570,000','','ko asun'),(362,'BL0069','barang luar ','toren pinguin tb 110 biru','pcs','1,476,000','1,570,000','','ko asun'),(363,'BL0070','barang luar ','fiber gelombang putih 150 x 105','lembar','42,750','57,000','merk multi roof','ko asun'),(364,'BL0071','barang luar ','fiber gelombang putih 180 x 105','lembar','51,300','68,500','merk multi roof','ko asun'),(365,'BL0072','barang luar ','fiber gelombang putih 210 x 105','lembar','59,850','80,000','merk multi roof','ko asun'),(366,'BL0073','barang luar ','fiber gelombang putih 240 x 105','lembar','68,400','91,000','merk multi roof','ko asun'),(367,'BL0074','barang luar ','fiber gelombang putih 300 x 105','lembar','85,500','114,000','merk multi roof','ko asun'),(368,'BL0075','barang luar ','fiber gelombang transparant 150 x 80','lembar','36,000','52,500','merk flexi plus','ko asun'),(369,'BL0076','barang luar ','fiber gelombang transparant 180 x 80','lembar','43,200','63,000','merk flexi plus','ko asun'),(370,'BL0077','barang luar ','fiber gelombang transparant 210 x 80','lembar','50,400','73,500','merk flexi plus','ko asun'),(371,'BL0078','barang luar ','fiber gelombang transparant 240 x 80','lembar','57,600','84,000','merk flexi plus','ko asun'),(372,'BL0079','barang luar ','fiber gelombang transparant 300 x 80','lembar','72,000','105,000','merk flexi plus','ko asun'),(373,'BL0080','barang luar','kayu balok 5/10 m3 ','','3,000,000','','1m3 : 50 btg','ko hendrik'),(374,'BL0081','barang luar','kayu balok 5/10 batang','','60,000','','','ko hendrik'),(375,'BL0082','barang luar','kayu kaso 4/6 m3','','2,100,000','','1 m3 : 104 btg','ko hendrik'),(376,'BL0083','barang luar','kayu kaso 4/6 ikat isi 6','','121,154','','','ko hendrik'),(377,'BL0084','barang luar','kayu kaso 4/6 batang','','20,193','','','ko hendrik'),(378,'BL0085','barang luar','kayu reng 3/4 m3','','1,850,000','','1 m3 : 208 btg','ko hendrik'),(379,'BL0086','barang luar','kayu reng 3/4 ikat isi 10','','89,000','','','ko hendrik'),(380,'BL0087','barang luar','kayu reng 3/4 batang','','8,900','','','ko hendrik'),(381,'BL0088','barang luar','kayu balok 6/12 m3','','','','1 m3 : 34,7 btg','ko hendrik'),(382,'BL0089','barang luar','kayu balok 6/12 batang','','','','','ko hendrik'),(383,'BL0090','barang luar','triplek 8mm 4x8','lembar','87,000','','','teddy'),(384,'BL0091','barang luar','triplek 9mm 4x8','lembar','','','','teddy'),(385,'BL0092','barang luar','triplek 4mm 4x8','lembar','49,000','','','teddy'),(386,'BL0093','barang luar','triplek 6mm 4x8','lembar','61,000','','','teddy'),(387,'BL0094','barang luar ','triplek 12mm 4x8','lembar','135,000','','','teddy'),(388,'BL0095','barang luar ','triplek 15mm 4x8','lembar','170,000','','','teddy'),(389,'BL0096','barang luar ','triplek 3mm 4x8','lembar','40,000','','','teddy'),(390,'BL0097','barang luar','triplek 18mm 4x8','lembar','195,000','','','teddy'),(391,'BL0098','barang luar','pipa wavin Aw 1/2','btg','15,367','17,000','19,030','sinar cengkareng'),(392,'BL0099','barang luar','pipa wavin Aw 3/4','btg','21,052','24,000','26,070','sinar cengkareng'),(393,'BL0100','barang luar','pipa wavin Aw 1','btg','28,779','','35,640','Abadi jaya'),(394,'BL0101','barang luar','pipa wavin Aw 1 1/4 ','btg','43,169','','53,460','Abadi jaya'),(395,'BL0102','barang luar','pipa wavin Aw 1 1/2','btg','49,564','','61,380','Abadi jaya'),(396,'BL0103','barang luar','pipa wavin Aw 2','btg','63,421','','78,540','Abadi jaya'),(397,'BL0104','barang luar','pipa wavin Aw 2 1/2','btg','92,556','','114,620','Abadi jaya'),(398,'BL0105','barang luar','pipa wavin Aw 3','btg','124,800','','154,550','Abadi jaya'),(399,'BL0106','barang luar','pipa wavin Aw 4','btg','206,785','','256,080','Abadi jaya'),(400,'BL0107','barang luar','pipa wavin Aw 5','btg','342,598','','424,270','Abadi jaya'),(401,'BL0108','barang luar','pipa wavin Aw 6','btg','480,543','','595,100','Abadi jaya'),(402,'BL0109','barang luar','pipa wavin D 1 1/4','btg','27,092','','33,550','Abadi jaya'),(403,'BL0110','barang luar','pipa wavin D 1 1/2','btg','30,645','','37,950','Abadi jaya'),(404,'BL0111','barang luar','pipa wavin D 2','btg','39,261','','48,620','Abadi jaya'),(405,'BL0112','barang luar','pipa wavin D 2 1/2 ','btg','53,117','','65,780','Abadi jaya'),(406,'BL0113','barang luar','pipa wavin D 3 ','btg','67,418','73,000','83,490','Abadi jaya'),(407,'BL0114','barang luar','pipa wavin D 4','btg','106,057','','131,340','Abadi jaya'),(408,'BL0115','barang luar','pipa wavin D 5','btg','170,988','','211,750','Abadi jaya'),(409,'BL0116','barang luar','pipa wavin D 6','btg','225,527','','279,290','Abadi jaya'),(410,'BL0117','barang luar','keni 3 D grest','pcs','5,393','','7.190 disc 25%','lain lain'),(411,'BL0118','barang luar','keni 2 D grest','pcs','3,428','','4.570  disc 25%','lain lain'),(412,'BL0119','barang luar','tee 3/4 Aw RCK','pcs','2,302','','2,850','lain lain'),(413,'BL0120','barang luar','tee 1/2 Aw RCK','pcs','1,656','','2,050','lain lain'),(414,'BL0121','barang luar','keni drat dalam 1/2 Aw RCK','pcs','1,211','','1,500','lain lain'),(415,'BL0122','barang luar','corong talang kotak ASV','pcs','3,735','','','lain lain'),(416,'BL0123','barang luar','corong talang setengah lingkaran RG6','pcs','26,590','','','lain lain'),(417,'BL0124','barang luar','talang setengah lingkaran RG6','btg','28,500','','','lain lain'),(418,'BL0125','barang luar','tutup talang setengah lingkaran RG6','pcs','3,070','','','lain lain'),(419,'BL0126','barang luar','gantungan talang besi setengah lingkaran RG6','pcs','7,000','','','lain lain'),(420,'BL0127','barang luar','dop 2 D','pcs','2,095','','2,793','lain lain'),(421,'CA0195','cat','envi 1 845 brilliant white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(422,'CA0196','cat','envi 2 878 blosom white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(423,'CA0197','cat','envi 3 827 pink 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(424,'CA0198','cat','envi 4 805 crystal blue 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(425,'CA0199','cat','envi 5 825 peach 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(426,'CA0200','cat','envi 6 868 pinky 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(427,'CA0201','cat','envi 7 867 classy blue 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(428,'CA0202','cat','envi 8 869 light purple 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(429,'CA0203','cat','envi 9 828 rose velvet 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(430,'CA0204','cat','envi 10 861 elegant pink 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(431,'CA0205','cat','envi 11 881 purple gold 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(432,'CA0206','cat','envi 12 846 geranium 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(433,'CA0207','cat','envi 13 808 jazzy blue 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(434,'CA0208','cat','envi 14 852 coral grape 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(435,'CA0209','cat','envi 15 877 classic white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(436,'CA0210','cat','envi 16 843 broken white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(437,'CA0211','cat','envi 17 841 lily white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(438,'CA0212','cat','envi 18 833 off white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(439,'CA0213','cat','envi 19 817 cream 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(440,'CA0214','cat','envi 20 842 marygold 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(441,'CA0215','cat','envi 21 821 olympic yellow 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(442,'CA0216','cat','envi 22 818 ivory 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(443,'CA0217','cat','envi 23 855 monaco 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(444,'CA0218','cat','envi 24 820 primerose 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(445,'CA0219','cat','envi 25 848 canary yellow 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(446,'CA0220','cat','envi 26 819 barley white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(447,'CA0221','cat','envi 27 847 signal yellow 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(448,'CA0222','cat','envi 28 862 sunrise 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(449,'CA0223','cat','envi 29 831 brick red 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(450,'CA0224','cat','envi 30 832 terracota 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(451,'CA0225','cat','envi 31 810 teal ice 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(452,'CA0226','cat','envi 32 872 olivera 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(453,'CA0227','cat','envi 33 864 leaf green 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(454,'CA0228','cat','envi 34 806 atlantic blue 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(455,'CA0229','cat','envi 35 875 tender green 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(456,'CA0230','cat','envi 36 807 navy blue 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(457,'CA0231','cat','envi 37 849 sheva green 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(458,'CA0232','cat','envi 38 870 lime green 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(459,'CA0233','cat','envi 39 856 indigo 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(460,'CA0234','cat','envi 40 813 aqua green 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(461,'CA0235','cat','envi 41 850 paradise green 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(462,'CA0236','cat','envi 42 839 millenium 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(463,'CA0237','cat','envi 43 874 silver blue 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(464,'CA0238','cat','envi 44 854 saphire blue','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(465,'CA0239','cat','envi 45 873 fontana 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(466,'CA0240','cat','envi 46 840 goose wing 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(467,'CA0241','cat','envi 47 880 primavera 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(468,'CA0242','cat','envi 48 835 milk grey 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(469,'CA0243','cat','envi 49 823 coffe 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(470,'CA0244','cat','envi 50 858 sahara 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(471,'CA0245','cat','envi 51 824 saddle tan 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(472,'CA0246','cat','envi 52 871 natura 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(473,'CA0247','cat','envi 53 834 alabaster 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(474,'CA0248','cat','envi 54 803 light violet 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(475,'CA0249','cat','envi 55 836 ash grey 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(476,'CA0250','cat ','envi white 5k','gallon','99,264','110,000','110.000 disc 6% + 4%','Pt. Indaco warna dunia'),(477,'CA0251','cat','envi white 25k','pail','473,760','520,000','525.000 disc 6% + 4%','Pt. Indaco warna dunia'),(478,'BL0128','barang luar','pipa top Aw 1','btg','','','28.500 disc 20 + 5','Pt. Panen raya rejeki mantap'),(479,'BL0129','barang luar','pipa listrik top 5/8 4M','btg','','','5.300 disc 20 + 5','Pt. Panen raya rejeki mantap'),(480,'BL0130','barang luar','toren tedmond 550L','pcs','724,625','825,000','','lain lain'),(481,'BL0131','barang luar','toren tedmond 1100L','pcs','1,207,140','1,350,000','','lain lain');
/*!40000 ALTER TABLE `master_data_copy_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `parent` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `position` int(2) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `group` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Transaksi Penjualan','fa-tachometer','0','',0,1,'main_menu'),(2,'Master','fa-desktop','0','#',0,1,'main_menu'),(3,'Master Barang','fa-caret-right','2','ms_barang',1,1,'main_menu'),(4,'Master Pengguna','fa-caret-right','2','ms_admin',2,1,'main_menu'),(5,'Master Vendor','fa-caret-right','2','ms_vendor',3,1,'main_menu'),(6,'Master Kategori','fa-caret-right','2','ms_kategori',4,1,'main_menu'),(7,'Master Satuan','fa-caret-right','2','ms_satuan',5,1,'main_menu'),(8,'Master Pelanggan','fa-caret-right','2','ms_customer',6,1,'main_menu'),(9,'Master Barang Set','fa-caret-right','2','ms_set',7,1,'main_menu'),(10,'Master Konversi','fa-caret-right','2','ms_konversi',8,1,'main_menu'),(11,'Master Default','fa-caret-right','2','ms_default',9,1,'main_menu'),(12,'Transaksi','fa-pencil-square-o','0','#',0,1,'main_menu'),(13,'Penerimaan Barang','fa-caret-right','12','tr_penerimaan',1,1,'main_menu'),(14,'Pembayaran customer','fa-caret-right','12','tr_pembayaran/sub_index/2',2,1,'main_menu'),(15,'Pembayaran vendor','fa-caret-right','12','tr_pembayaran/sub_index/1',3,1,'main_menu'),(16,'Transaksi Uang','fa-caret-right','12','tr_uang',4,1,'main_menu'),(17,'Transaksi Cek Stok','fa-caret-right','12','tr_cek_stok',5,1,'main_menu'),(18,'Pembatalan Transaksi','fa-caret-right','12','tr_void/sub_index/1',6,1,'main_menu'),(19,'Laporan','fa-bar-chart','0','laporan',0,1,'main_menu'),(20,'Restore Data','fa-database','0','#\" id=\"restore_data',1,1,'admin');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_customer`
--

DROP TABLE IF EXISTS `ms_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_customer` (
  `id_customer` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Kode Pelanggan',
  `nama` varchar(50) DEFAULT NULL COMMENT 'Nama Depan',
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` int(20) NOT NULL,
  `kode_provinsi` int(3) DEFAULT NULL,
  `kode_kota` int(3) DEFAULT NULL,
  `jenis_kelamin` int(1) DEFAULT NULL COMMENT '1 = lk, 2 = pr',
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_customer`,`email`,`no_hp`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='Master Pelanggan';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_customer`
--

LOCK TABLES `ms_customer` WRITE;
/*!40000 ALTER TABLE `ms_customer` DISABLE KEYS */;
INSERT INTO `ms_customer` VALUES (1,'elos ananto update','Jalan Panglima Polim\r\nWhat Is This? a','socmed.eloz@gmail.com',222222,11,156,1,NULL,'2016-09-13 12:59:41',0),(2,'elos ananto','Jalan Panglima Polim\r\nWhat Is This?','socmed.eloz@gmail.com',2147483647,11,156,1,NULL,'2016-09-13 13:23:41',0),(4,'coba','asdasdasdasd','elos.ananto@propanraya.com',123123,NULL,NULL,NULL,NULL,NULL,0),(5,'coba tambah baru','jalan mana aja','socmed.eloz@gmail.com',2147483647,NULL,NULL,NULL,NULL,NULL,0),(6,'bibir','gondrong','socmed.eloz@gmail.com',123123,NULL,NULL,NULL,NULL,NULL,0),(7,'ali','citra','ali.sadikin@propanraya.com',234234,NULL,NULL,NULL,NULL,NULL,0),(8,'pak jo','ciputat','jo@prop.com',2147483647,NULL,NULL,NULL,NULL,NULL,0),(9,'ACCOUNTING','adsnfj','abjaya@gmail.com',123,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `ms_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_harga`
--

DROP TABLE IF EXISTS `ms_harga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_harga` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(10) NOT NULL,
  `id_barang` int(10) NOT NULL,
  `id_penerimaan` int(10) NOT NULL,
  `stok_masuk` int(10) DEFAULT NULL,
  `sisa_stok` int(10) DEFAULT NULL,
  `create_user` int(3) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `harga_masuk` decimal(11,2) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `flag` int(1) DEFAULT '0',
  PRIMARY KEY (`id`,`kode_barang`,`id_barang`,`id_penerimaan`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_harga`
--

LOCK TABLES `ms_harga` WRITE;
/*!40000 ALTER TABLE `ms_harga` DISABLE KEYS */;
INSERT INTO `ms_harga` VALUES (11,'FP0001',2,4,10,10,1,'2016-09-24 10:25:11',11000.00,'2016-09-24',1),(12,'CA0001',8,4,10,10,1,'2016-09-24 10:25:11',110000.00,'2016-09-24',1),(13,'FP0001',2,5,10,0,1,'2016-09-25 10:26:19',14000.00,'2016-09-25',1),(14,'CA0001',8,5,10,1,1,'2016-09-24 10:26:19',140000.00,'2016-09-24',0),(15,'FP0002',3,1,10,0,1,'2016-09-28 13:19:54',20000.00,'2016-09-28',1),(16,'FP0001',2,2,10,0,1,'2016-09-29 10:24:08',50000.00,'2016-09-29',1),(17,'CA0001',8,2,10,10,1,'2016-09-29 10:24:08',120000.00,'2016-09-29',0),(18,'FP0001',2,1,10,0,1,'2016-11-13 15:21:00',10000.00,'2016-11-13',1),(19,'FP0005',6,1,10,10,1,'2016-11-13 15:21:00',20000.00,'2016-11-13',0),(20,'FP0009',497,2,2,2,1,'2016-11-14 05:14:43',11111.00,'2016-11-14',0),(21,'FP0008',496,2,1,1,1,'2016-11-14 05:14:43',1111.00,'2016-11-14',0),(22,'CA0255',500,3,10,5,1,'2016-11-14 15:41:31',13000.00,'2016-11-14',0),(23,'SE0003',501,3,10,10,1,'2016-11-14 15:41:31',45000.00,'2016-11-14',0),(24,'FP0002',3,4,10,4,1,'2016-12-06 02:26:21',10000.00,'2016-12-06',0),(25,'FP0001',2,4,10,0,1,'2016-12-06 02:26:21',10000.00,'2016-12-06',1);
/*!40000 ALTER TABLE `ms_harga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_kategori`
--

DROP TABLE IF EXISTS `ms_kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_kategori` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `kode_barang` varchar(5) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_kategori`
--

LOCK TABLES `ms_kategori` WRITE;
/*!40000 ALTER TABLE `ms_kategori` DISABLE KEYS */;
INSERT INTO `ms_kategori` VALUES (1,'fiber plat','FP',0),(2,'cat','CA',0),(3,'barang dalam','BD',0),(4,'barang luar','BL',0),(5,'barang etalase','BE',0),(9,'COBA','CB',1),(10,'SET','SE',0);
/*!40000 ALTER TABLE `ms_kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_konversi`
--

DROP TABLE IF EXISTS `ms_konversi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_konversi` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `kode_barang_induk` varchar(15) NOT NULL,
  `kode_barang_anak` varchar(15) NOT NULL,
  `qty_induk` int(3) DEFAULT NULL,
  `qty_anak` int(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(2) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`kode_barang_induk`,`kode_barang_anak`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_konversi`
--

LOCK TABLES `ms_konversi` WRITE;
/*!40000 ALTER TABLE `ms_konversi` DISABLE KEYS */;
INSERT INTO `ms_konversi` VALUES (2,'BD0060','BD0061',1,10,'2016-10-30 04:18:58',1,0);
/*!40000 ALTER TABLE `ms_konversi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_kota`
--

DROP TABLE IF EXISTS `ms_kota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_kota` (
  `kode_prov` varchar(5) NOT NULL COMMENT 'Kode Provinsi',
  `kode_kota` varchar(5) NOT NULL COMMENT 'Kode Kota',
  `nama_kota` varchar(50) NOT NULL COMMENT 'Nama Kota',
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `sinkron` int(1) DEFAULT '0',
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kode_kota`),
  KEY `kode_prov` (`kode_prov`),
  CONSTRAINT `ms_kota_ibfk_1` FOREIGN KEY (`kode_prov`) REFERENCES `ms_provinsi` (`kode_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Master Kota';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_kota`
--

LOCK TABLES `ms_kota` WRITE;
/*!40000 ALTER TABLE `ms_kota` DISABLE KEYS */;
INSERT INTO `ms_kota` VALUES ('1','1','Aceh Barat','admin','2016-04-30 10:08:37',0,0),('1','10','Aceh Timur','admin','2016-04-30 10:08:37',0,0),('6','100','Solok','admin','2016-04-30 10:08:37',0,0),('6','101','Solok Selatan','admin','2016-04-30 10:08:37',0,0),('6','102','Tanah Datar','admin','2016-04-30 10:08:37',0,0),('6','103','Bukittinggi','admin','2016-04-30 10:08:37',0,0),('6','104','Padang','admin','2016-04-30 10:08:37',0,0),('6','105','Padangpanjang','admin','2016-04-30 10:08:37',0,0),('6','106','Pariaman','admin','2016-04-30 10:08:37',0,0),('6','107','Payakumbuh','admin','2016-04-30 10:08:37',0,0),('6','108','Sawahlunto','admin','2016-04-30 10:08:37',0,0),('6','109','Solok','admin','2016-04-30 10:08:37',0,0),('1','11','Aceh Utara','admin','2016-04-30 10:08:37',0,0),('7','110','Banyuasin','admin','2016-04-30 10:08:37',0,0),('7','111','Empat Lawang','admin','2016-04-30 10:08:37',0,0),('7','112','Lahat','admin','2016-04-30 10:08:37',0,0),('7','113','Muara Enim','admin','2016-04-30 10:08:37',0,0),('7','114','Musi Banyuasin','admin','2016-04-30 10:08:37',0,0),('7','115','Musi Rawas','admin','2016-04-30 10:08:37',0,0),('7','116','Ogan Ilir','admin','2016-04-30 10:08:37',0,0),('7','117','Ogan Komering Ilir','admin','2016-04-30 10:08:37',0,0),('7','118','Ogan Komering Ulu','admin','2016-04-30 10:08:37',0,0),('7','119','Ogan Kmrg Ulu Sel','admin','2016-04-30 10:08:37',0,0),('1','12','Bener Meriah','admin','2016-04-30 10:08:37',0,0),('7','120','Ogan Kom. Ulu Timur','admin','2016-04-30 10:08:37',0,0),('7','121','Lubuklinggau','admin','2016-04-30 10:08:37',0,0),('7','122','Pagar Alam','admin','2016-04-30 10:08:37',0,0),('7','123','Palembang','admin','2016-04-30 10:08:37',0,0),('7','124','Prabumulih','admin','2016-04-30 10:08:37',0,0),('8','125','Lampung Barat','admin','2016-04-30 10:08:37',0,0),('8','126','Lampung Selatan','admin','2016-04-30 10:08:37',0,0),('8','127','Lampung Tengah','admin','2016-04-30 10:08:37',0,0),('8','128','Lampung Timur','admin','2016-04-30 10:08:37',0,0),('8','129','Lampung Utara','admin','2016-04-30 10:08:37',0,0),('1','13','Bireuen','admin','2016-04-30 10:08:37',0,0),('8','130','Mesuji','admin','2016-04-30 10:08:37',0,0),('8','131','Pesawaran','admin','2016-04-30 10:08:37',0,0),('8','132','Pringsewu','admin','2016-04-30 10:08:37',0,0),('8','133','Tanggamus','admin','2016-04-30 10:08:37',0,0),('8','134','Tulang Bawang','admin','2016-04-30 10:08:37',0,0),('8','135','Tulang Bawang Barat','admin','2016-04-30 10:08:37',0,0),('8','136','Way Kanan','admin','2016-04-30 10:08:37',0,0),('8','137','Bandar Lampung','admin','2016-04-30 10:08:37',0,0),('8','138','Metro','admin','2016-04-30 10:08:37',0,0),('9','139','Bangka','admin','2016-04-30 10:08:37',0,0),('1','14','Gayo Lues','admin','2016-04-30 10:08:37',0,0),('9','140','Bangka Barat','admin','2016-04-30 10:08:37',0,0),('9','141','Bangka Selatan','admin','2016-04-30 10:08:37',0,0),('9','142','Bangka Tengah','admin','2016-04-30 10:08:37',0,0),('9','143','Belitung','admin','2016-04-30 10:08:37',0,0),('9','144','Belitung Timur','admin','2016-04-30 10:08:37',0,0),('9','145','Pangkal Pinang','admin','2016-04-30 10:08:37',0,0),('10','146','Bintan','admin','2016-04-30 10:08:37',0,0),('10','147','Karimun','admin','2016-04-30 10:08:37',0,0),('10','148','Kepulauan Anambas','admin','2016-04-30 10:08:37',0,0),('10','149','Lingga','admin','2016-04-30 10:08:37',0,0),('1','15','Nagan Raya','admin','2016-04-30 10:08:37',0,0),('10','150','Natuna','admin','2016-04-30 10:08:37',0,0),('10','151','Batam','admin','2016-04-30 10:08:37',0,0),('10','152','Tanjung Pinang','admin','2016-04-30 10:08:37',0,0),('11','153','Lebak','admin','2016-04-30 10:08:37',0,0),('11','154','Pandeglang','admin','2016-04-30 10:08:37',0,0),('11','155','Serang','admin','2016-04-30 10:08:37',0,0),('11','156','Tangerang','admin','2016-04-30 10:08:37',0,0),('11','157','Cilegon','admin','2016-04-30 10:08:37',0,0),('11','158','Serang','admin','2016-04-30 10:08:37',0,0),('11','159','Tangerang','admin','2016-04-30 10:08:37',0,0),('1','16','Pidie','admin','2016-04-30 10:08:37',0,0),('11','160','Tangerang Selatan','admin','2016-04-30 10:08:37',0,0),('12','161','Bandung','admin','2016-04-30 10:08:37',0,0),('12','162','Bandung Barat','admin','2016-04-30 10:08:37',0,0),('12','163','Bekasi','admin','2016-04-30 10:08:37',0,0),('12','164','Bogor','admin','2016-04-30 10:08:37',0,0),('12','165','Ciamis','admin','2016-04-30 10:08:37',0,0),('12','166','Cianjur','admin','2016-04-30 10:08:37',0,0),('12','167','Cirebon','admin','2016-04-30 10:08:37',0,0),('12','168','Garut','admin','2016-04-30 10:08:37',0,0),('12','169','Indramayu','admin','2016-04-30 10:08:37',0,0),('1','17','Pidie Jaya','admin','2016-04-30 10:08:37',0,0),('12','170','Karawang','admin','2016-04-30 10:08:37',0,0),('12','171','Kuningan','admin','2016-04-30 10:08:37',0,0),('12','172','Majalengka','admin','2016-04-30 10:08:37',0,0),('12','173','Purwakarta','admin','2016-04-30 10:08:37',0,0),('12','174','Subang','admin','2016-04-30 10:08:37',0,0),('12','175','Sukabumi','admin','2016-04-30 10:08:37',0,0),('12','176','Sumedang','admin','2016-04-30 10:08:37',0,0),('12','177','Tasikmalaya','admin','2016-04-30 10:08:37',0,0),('12','178','Bandung','admin','2016-04-30 10:08:37',0,0),('12','179','Banjar','admin','2016-04-30 10:08:37',0,0),('1','18','Simeulue','admin','2016-04-30 10:08:37',0,0),('12','180','Bekasi','admin','2016-04-30 10:08:37',0,0),('12','181','Bogor','admin','2016-04-30 10:08:37',0,0),('12','182','Cimahi','admin','2016-04-30 10:08:37',0,0),('12','183','Cirebon','admin','2016-04-30 10:08:37',0,0),('12','184','Depok','admin','2016-04-30 10:08:37',0,0),('12','185','Sukabumi','admin','2016-04-30 10:08:37',0,0),('12','186','Tasikmalaya','admin','2016-04-30 10:08:37',0,0),('13','187','Kepulauan Seribu','admin','2016-04-30 10:08:37',0,0),('13','188','Jakarta Barat','admin','2016-04-30 10:08:37',0,0),('13','189','Jakarta Pusat','admin','2016-04-30 10:08:37',0,0),('1','19','Banda Aceh','admin','2016-04-30 10:08:37',0,0),('13','190','Jakarta Selatan','admin','2016-04-30 10:08:37',0,0),('13','191','Jakarta Timur','admin','2016-04-30 10:08:37',0,0),('13','192','Jakarta Utara','admin','2016-04-30 10:08:37',0,0),('14','193','Banjarnegara','admin','2016-04-30 10:08:37',0,0),('14','194','Banyumas','admin','2016-04-30 10:08:37',0,0),('14','195','Batang','admin','2016-04-30 10:08:37',0,0),('14','196','Blora','admin','2016-04-30 10:08:37',0,0),('14','197','Boyolali','admin','2016-04-30 10:08:37',0,0),('14','198','Brebes','admin','2016-04-30 10:08:37',0,0),('14','199','Cilacap','admin','2016-04-30 10:08:37',0,0),('1','2','Aceh Barat Daya','admin','2016-04-30 10:08:37',0,0),('1','20','Langsa','admin','2016-04-30 10:08:37',0,0),('14','200','Demak','admin','2016-04-30 10:08:37',0,0),('14','201','Grobogan','admin','2016-04-30 10:08:37',0,0),('14','202','Jepara','admin','2016-04-30 10:08:37',0,0),('14','203','Karanganyar','admin','2016-04-30 10:08:37',0,0),('14','204','Kebumen','admin','2016-04-30 10:08:37',0,0),('14','205','Kendal','admin','2016-04-30 10:08:37',0,0),('14','206','Klaten','admin','2016-04-30 10:08:37',0,0),('14','207','Kudus','admin','2016-04-30 10:08:37',0,0),('14','208','Magelang','admin','2016-04-30 10:08:37',0,0),('14','209','Pati','admin','2016-04-30 10:08:37',0,0),('1','21','Lhokseumawe','admin','2016-04-30 10:08:37',0,0),('14','210','Pekalongan','admin','2016-04-30 10:08:37',0,0),('14','211','Pemalang','admin','2016-04-30 10:08:37',0,0),('14','212','Purbalingga','admin','2016-04-30 10:08:37',0,0),('14','213','Purworejo','admin','2016-04-30 10:08:37',0,0),('14','214','Rembang','admin','2016-04-30 10:08:37',0,0),('14','215','Semarang','admin','2016-04-30 10:08:37',0,0),('14','216','Sragen','admin','2016-04-30 10:08:37',0,0),('14','217','Sukoharjo','admin','2016-04-30 10:08:37',0,0),('14','218','Tegal','admin','2016-04-30 10:08:37',0,0),('14','219','Temanggung','admin','2016-04-30 10:08:37',0,0),('1','22','Sabang','admin','2016-04-30 10:08:37',0,0),('14','220','Wonogiri','admin','2016-04-30 10:08:37',0,0),('14','221','Wonosobo','admin','2016-04-30 10:08:37',0,0),('14','222','Magelang','admin','2016-04-30 10:08:37',0,0),('14','223','Pekalongan','admin','2016-04-30 10:08:37',0,0),('14','224','Salatiga','admin','2016-04-30 10:08:37',0,0),('14','225','Semarang','admin','2016-04-30 10:08:37',0,0),('14','226','Surakarta','admin','2016-04-30 10:08:37',0,0),('14','227','Tegal','admin','2016-04-30 10:08:37',0,0),('15','228','Bangkalan','admin','2016-04-30 10:08:37',0,0),('15','229','Banyuwangi','admin','2016-04-30 10:08:37',0,0),('1','23','Subulussalam','admin','2016-04-30 10:08:37',0,0),('15','230','Blitar','admin','2016-04-30 10:08:37',0,0),('15','231','Bojonegoro','admin','2016-04-30 10:08:37',0,0),('15','232','Bondowoso','admin','2016-04-30 10:08:37',0,0),('15','233','Gresik','admin','2016-04-30 10:08:37',0,0),('15','234','Jember','admin','2016-04-30 10:08:37',0,0),('15','235','Jombang','admin','2016-04-30 10:08:37',0,0),('15','236','Kediri','admin','2016-04-30 10:08:37',0,0),('15','237','Lamongan','admin','2016-04-30 10:08:37',0,0),('15','238','Lumajang','admin','2016-04-30 10:08:37',0,0),('15','239','Madiun','admin','2016-04-30 10:08:37',0,0),('2','24','Asahan','admin','2016-04-30 10:08:37',0,0),('15','240','Magetan','admin','2016-04-30 10:08:37',0,0),('15','241','Malang','admin','2016-04-30 10:08:37',0,0),('15','242','Mojokerto','admin','2016-04-30 10:08:37',0,0),('15','243','Nganjuk','admin','2016-04-30 10:08:37',0,0),('15','244','Ngawi','admin','2016-04-30 10:08:37',0,0),('15','245','Pacitan','admin','2016-04-30 10:08:37',0,0),('15','246','Pamekasan','admin','2016-04-30 10:08:37',0,0),('15','247','Pasuruan','admin','2016-04-30 10:08:37',0,0),('15','248','Ponorogo','admin','2016-04-30 10:08:37',0,0),('15','249','Probolinggo','admin','2016-04-30 10:08:37',0,0),('2','25','Batu Bara','admin','2016-04-30 10:08:37',0,0),('15','250','Sampang','admin','2016-04-30 10:08:37',0,0),('15','251','Sidoarjo','admin','2016-04-30 10:08:37',0,0),('15','252','Situbondo','admin','2016-04-30 10:08:37',0,0),('15','253','Sumenep','admin','2016-04-30 10:08:37',0,0),('15','254','Trenggalek','admin','2016-04-30 10:08:37',0,0),('15','255','Tuban','admin','2016-04-30 10:08:37',0,0),('15','256','Tulungagung','admin','2016-04-30 10:08:37',0,0),('15','257','Batu','admin','2016-04-30 10:08:37',0,0),('15','258','Blitar','admin','2016-04-30 10:08:37',0,0),('15','259','Kediri','admin','2016-04-30 10:08:37',0,0),('2','26','Dairi','admin','2016-04-30 10:08:37',0,0),('15','260','Madiun','admin','2016-04-30 10:08:37',0,0),('15','261','Malang','admin','2016-04-30 10:08:37',0,0),('15','262','Mojokerto','admin','2016-04-30 10:08:37',0,0),('15','263','Pasuruan','admin','2016-04-30 10:08:37',0,0),('15','264','Probolinggo','admin','2016-04-30 10:08:37',0,0),('15','265','Surabaya','admin','2016-04-30 10:08:37',0,0),('16','266','Bantul','admin','2016-04-30 10:08:37',0,0),('16','267','Gunung Kidul','admin','2016-04-30 10:08:37',0,0),('16','268','Kulon Progo','admin','2016-04-30 10:08:37',0,0),('16','269','Sleman','admin','2016-04-30 10:08:37',0,0),('2','27','Deli Serdang','admin','2016-04-30 10:08:37',0,0),('16','270','Yogyakarta','admin','2016-04-30 10:08:37',0,0),('17','271','Badung','admin','2016-04-30 10:08:37',0,0),('17','272','Bangli','admin','2016-04-30 10:08:37',0,0),('17','273','Buleleng','admin','2016-04-30 10:08:37',0,0),('17','274','Gianyar','admin','2016-04-30 10:08:37',0,0),('17','275','Jembrana','admin','2016-04-30 10:08:37',0,0),('17','276','Karangasem','admin','2016-04-30 10:08:37',0,0),('17','277','Klungkung','admin','2016-04-30 10:08:37',0,0),('17','278','Tabanan','admin','2016-04-30 10:08:37',0,0),('17','279','Denpasar','admin','2016-04-30 10:08:37',0,0),('2','28','Humbang Hasundutan','admin','2016-04-30 10:08:37',0,0),('18','280','Bima','admin','2016-04-30 10:08:37',0,0),('18','281','Dompu','admin','2016-04-30 10:08:37',0,0),('18','282','Lombok Barat','admin','2016-04-30 10:08:37',0,0),('18','283','Lombok Tengah','admin','2016-04-30 10:08:37',0,0),('18','284','Lombok Timur','admin','2016-04-30 10:08:37',0,0),('18','285','Lombok Utara','admin','2016-04-30 10:08:37',0,0),('18','286','Sumbawa','admin','2016-04-30 10:08:37',0,0),('18','287','Sumbawa Barat','admin','2016-04-30 10:08:37',0,0),('18','288','Bima','admin','2016-04-30 10:08:37',0,0),('18','289','Mataram','admin','2016-04-30 10:08:37',0,0),('2','29','Karo','admin','2016-04-30 10:08:37',0,0),('19','290','Kupang','admin','2016-04-30 10:08:37',0,0),('19','291','Timor Tengah Sel','admin','2016-04-30 10:08:37',0,0),('19','292','Timor Tengah Utara','admin','2016-04-30 10:08:37',0,0),('19','293','Belu','admin','2016-04-30 10:08:37',0,0),('19','294','Alor','admin','2016-04-30 10:08:37',0,0),('19','295','Flores Timur','admin','2016-04-30 10:08:37',0,0),('19','296','Sikka','admin','2016-04-30 10:08:37',0,0),('19','297','Ende','admin','2016-04-30 10:08:37',0,0),('19','298','Ngada','admin','2016-04-30 10:08:37',0,0),('19','299','Manggarai','admin','2016-04-30 10:08:37',0,0),('1','3','Aceh Besar','admin','2016-04-30 10:08:37',0,0),('2','30','Labuhanbatu','admin','2016-04-30 10:08:37',0,0),('19','300','Sumba Timur','admin','2016-04-30 10:08:37',0,0),('19','301','Sumba Barat','admin','2016-04-30 10:08:37',0,0),('19','302','Lembata','admin','2016-04-30 10:08:37',0,0),('19','303','Rote Ndao','admin','2016-04-30 10:08:37',0,0),('19','304','Manggarai Barat','admin','2016-04-30 10:08:37',0,0),('19','305','Nagekeo','admin','2016-04-30 10:08:37',0,0),('19','306','Sumba Tengah','admin','2016-04-30 10:08:37',0,0),('19','307','Sumba Barat Daya','admin','2016-04-30 10:08:37',0,0),('19','308','Manggarai Timur','admin','2016-04-30 10:08:37',0,0),('19','309','Sabu Raijua','admin','2016-04-30 10:08:37',0,0),('2','31','Labuhanbatu Selatan','admin','2016-04-30 10:08:37',0,0),('19','310','Kupang','admin','2016-04-30 10:08:37',0,0),('20','311','Bengkayang','admin','2016-04-30 10:08:37',0,0),('20','312','Kapuas Hulu','admin','2016-04-30 10:08:37',0,0),('20','313','Kayong Utara','admin','2016-04-30 10:08:37',0,0),('20','314','Ketapang','admin','2016-04-30 10:08:37',0,0),('20','315','Kubu Raya','admin','2016-04-30 10:08:37',0,0),('20','316','Landak','admin','2016-04-30 10:08:37',0,0),('20','317','Melawi','admin','2016-04-30 10:08:37',0,0),('20','318','Pontianak','admin','2016-04-30 10:08:37',0,0),('20','319','Sambas','admin','2016-04-30 10:08:37',0,0),('2','32','Labuhanbatu Utara','admin','2016-04-30 10:08:37',0,0),('20','320','Sanggau','admin','2016-04-30 10:08:37',0,0),('20','321','Sekadau','admin','2016-04-30 10:08:37',0,0),('20','322','Sintang','admin','2016-04-30 10:08:37',0,0),('20','323','Pontianak','admin','2016-04-30 10:08:37',0,0),('20','324','Singkawang','admin','2016-04-30 10:08:37',0,0),('21','325','Balangan','admin','2016-04-30 10:08:37',0,0),('21','326','Banjar','admin','2016-04-30 10:08:37',0,0),('21','327','Barito Kuala','admin','2016-04-30 10:08:37',0,0),('21','328','Hulu Sungai Selatan','admin','2016-04-30 10:08:37',0,0),('21','329','Hulu Sungai Tengah','admin','2016-04-30 10:08:37',0,0),('2','33','Langkat','admin','2016-04-30 10:08:37',0,0),('21','330','Hulu Sungai Utara','admin','2016-04-30 10:08:37',0,0),('21','331','Kotabaru','admin','2016-04-30 10:08:37',0,0),('21','332','Tabalong','admin','2016-04-30 10:08:37',0,0),('21','333','Tanah Bumbu','admin','2016-04-30 10:08:37',0,0),('21','334','Tanah Laut','admin','2016-04-30 10:08:37',0,0),('21','335','Tapin','admin','2016-04-30 10:08:37',0,0),('21','336','Banjarbaru','admin','2016-04-30 10:08:37',0,0),('21','337','Banjarmasin','admin','2016-04-30 10:08:37',0,0),('22','338','Barito Selatan','admin','2016-04-30 10:08:37',0,0),('22','339','Barito Timur','admin','2016-04-30 10:08:37',0,0),('2','34','Mandailing Natal','admin','2016-04-30 10:08:37',0,0),('22','340','Barito Utara','admin','2016-04-30 10:08:37',0,0),('22','341','Gunung Mas','admin','2016-04-30 10:08:37',0,0),('22','342','Kapuas','admin','2016-04-30 10:08:37',0,0),('22','343','Katingan','admin','2016-04-30 10:08:37',0,0),('22','344','Kotawaringin Barat','admin','2016-04-30 10:08:37',0,0),('22','345','Kotawaringin Timur','admin','2016-04-30 10:08:37',0,0),('22','346','Lamandau','admin','2016-04-30 10:08:37',0,0),('22','347','Murung Raya','admin','2016-04-30 10:08:37',0,0),('22','348','Pulang Pisau','admin','2016-04-30 10:08:37',0,0),('22','349','Sukamara','admin','2016-04-30 10:08:37',0,0),('2','35','Nias','admin','2016-04-30 10:08:37',0,0),('22','350','Seruyan','admin','2016-04-30 10:08:37',0,0),('22','351','Palangka Raya','admin','2016-04-30 10:08:37',0,0),('23','352','Berau','admin','2016-04-30 10:08:37',0,0),('23','353','Bulungan','admin','2016-04-30 10:08:37',0,0),('23','354','Kutai Barat','admin','2016-04-30 10:08:37',0,0),('23','355','Kutai Kartanegara','admin','2016-04-30 10:08:37',0,0),('23','356','Kutai Timur','admin','2016-04-30 10:08:37',0,0),('23','357','Malinau','admin','2016-04-30 10:08:37',0,0),('23','358','Nunukan','admin','2016-04-30 10:08:37',0,0),('23','359','Paser','admin','2016-04-30 10:08:37',0,0),('2','36','Nias Barat','admin','2016-04-30 10:08:37',0,0),('23','360','Penajam Paser Utara','admin','2016-04-30 10:08:37',0,0),('23','361','Tana Tidung','admin','2016-04-30 10:08:37',0,0),('23','362','Balikpapan','admin','2016-04-30 10:08:37',0,0),('23','363','Bontang','admin','2016-04-30 10:08:37',0,0),('23','364','Samarinda','admin','2016-04-30 10:08:37',0,0),('23','365','Tarakan','admin','2016-04-30 10:08:37',0,0),('24','366','Boalemo','admin','2016-04-30 10:08:37',0,0),('24','367','Bone Bolango','admin','2016-04-30 10:08:37',0,0),('24','368','Gorontalo','admin','2016-04-30 10:08:37',0,0),('24','369','Gorontalo Utara','admin','2016-04-30 10:08:37',0,0),('2','37','Nias Selatan','admin','2016-04-30 10:08:37',0,0),('24','370','Pohuwato','admin','2016-04-30 10:08:37',0,0),('24','371','Gorontalo','admin','2016-04-30 10:08:37',0,0),('25','372','Bantaeng','admin','2016-04-30 10:08:37',0,0),('25','373','Barru','admin','2016-04-30 10:08:37',0,0),('25','374','Bone','admin','2016-04-30 10:08:37',0,0),('25','375','Bulukumba','admin','2016-04-30 10:08:37',0,0),('25','376','Enrekang','admin','2016-04-30 10:08:37',0,0),('25','377','Gowa','admin','2016-04-30 10:08:37',0,0),('25','378','Jeneponto','admin','2016-04-30 10:08:37',0,0),('25','379','Kepulauan Selayar','admin','2016-04-30 10:08:37',0,0),('2','38','Nias Utara','admin','2016-04-30 10:08:37',0,0),('25','380','Luwu','admin','2016-04-30 10:08:37',0,0),('25','381','Luwu Timur','admin','2016-04-30 10:08:37',0,0),('25','382','Luwu Utara','admin','2016-04-30 10:08:37',0,0),('25','383','Maros','admin','2016-04-30 10:08:37',0,0),('25','384','Pangkajene & Kep','admin','2016-04-30 10:08:37',0,0),('25','385','Pinrang','admin','2016-04-30 10:08:37',0,0),('25','386','Sidenreng Rappang','admin','2016-04-30 10:08:37',0,0),('25','387','Sinjai','admin','2016-04-30 10:08:37',0,0),('25','388','Soppeng','admin','2016-04-30 10:08:37',0,0),('25','389','Takalar','admin','2016-04-30 10:08:37',0,0),('2','39','Padang Lawas','admin','2016-04-30 10:08:37',0,0),('25','390','Tana Toraja','admin','2016-04-30 10:08:37',0,0),('25','391','Toraja Utara','admin','2016-04-30 10:08:37',0,0),('25','392','Wajo','admin','2016-04-30 10:08:37',0,0),('25','393','Makassar','admin','2016-04-30 10:08:37',0,0),('25','394','Palopo','admin','2016-04-30 10:08:37',0,0),('25','395','Parepare','admin','2016-04-30 10:08:37',0,0),('26','396','Bombana','admin','2016-04-30 10:08:37',0,0),('26','397','Buton','admin','2016-04-30 10:08:37',0,0),('26','398','Buton Utara','admin','2016-04-30 10:08:37',0,0),('26','399','Kolaka','admin','2016-04-30 10:08:37',0,0),('1','4','Aceh Jaya','admin','2016-04-30 10:08:37',0,0),('2','40','Padang Lawas Utara','admin','2016-04-30 10:08:37',0,0),('26','400','Kolaka Utara','admin','2016-04-30 10:08:37',0,0),('26','401','Konawe','admin','2016-04-30 10:08:37',0,0),('26','402','Konawe Selatan','admin','2016-04-30 10:08:37',0,0),('26','403','Konawe Utara','admin','2016-04-30 10:08:37',0,0),('26','404','Muna','admin','2016-04-30 10:08:37',0,0),('26','405','Wakatobi','admin','2016-04-30 10:08:37',0,0),('26','406','Bau-Bau','admin','2016-04-30 10:08:37',0,0),('26','407','Kendari','admin','2016-04-30 10:08:37',0,0),('27','408','Banggai','admin','2016-04-30 10:08:37',0,0),('27','409','Banggai Kepulauan','admin','2016-04-30 10:08:37',0,0),('2','41','Pakpak Bharat','admin','2016-04-30 10:08:37',0,0),('27','410','Buol','admin','2016-04-30 10:08:37',0,0),('27','411','Donggala','admin','2016-04-30 10:08:37',0,0),('27','412','Morowali','admin','2016-04-30 10:08:37',0,0),('27','413','Parigi Moutong','admin','2016-04-30 10:08:37',0,0),('27','414','Poso','admin','2016-04-30 10:08:37',0,0),('27','415','Tojo Una-Una','admin','2016-04-30 10:08:37',0,0),('27','416','Toli-Toli','admin','2016-04-30 10:08:37',0,0),('27','417','Sigi','admin','2016-04-30 10:08:37',0,0),('27','418','Palu','admin','2016-04-30 10:08:37',0,0),('28','419','Bolaang Mongondow','admin','2016-04-30 10:08:37',0,0),('2','42','Samosir','admin','2016-04-30 10:08:37',0,0),('28','420','Bolaang Mngndw Sel','admin','2016-04-30 10:08:37',0,0),('28','421','Bolaang Mong. Timur','admin','2016-04-30 10:08:37',0,0),('28','422','Bolaang Mong Utara','admin','2016-04-30 10:08:37',0,0),('28','423','Kepulauan Sangihe','admin','2016-04-30 10:08:37',0,0),('28','424','Siau Tagul. Biaro','admin','2016-04-30 10:08:37',0,0),('28','425','Kepulauan Talaud','admin','2016-04-30 10:08:37',0,0),('28','426','Minahasa','admin','2016-04-30 10:08:37',0,0),('28','427','Minahasa Selatan','admin','2016-04-30 10:08:37',0,0),('28','428','Minahasa Tenggara','admin','2016-04-30 10:08:37',0,0),('28','429','Minahasa Utara','admin','2016-04-30 10:08:37',0,0),('2','43','Serdang Bedagai','admin','2016-04-30 10:08:37',0,0),('28','430','Bitung','admin','2016-04-30 10:08:37',0,0),('28','431','Kotamobagu','admin','2016-04-30 10:08:37',0,0),('28','432','Manado','admin','2016-04-30 10:08:37',0,0),('28','433','Tomohon','admin','2016-04-30 10:08:37',0,0),('29','434','Majene','admin','2016-04-30 10:08:37',0,0),('29','435','Mamasa','admin','2016-04-30 10:08:37',0,0),('29','436','Mamuju','admin','2016-04-30 10:08:37',0,0),('29','437','Mamuju Utara','admin','2016-04-30 10:08:37',0,0),('29','438','Polewali Mandar','admin','2016-04-30 10:08:37',0,0),('30','439','Buru','admin','2016-04-30 10:08:37',0,0),('2','44','Simalungun','admin','2016-04-30 10:08:37',0,0),('30','440','Buru Selatan','admin','2016-04-30 10:08:37',0,0),('30','441','Kepulauan Aru','admin','2016-04-30 10:08:37',0,0),('30','442','Maluku Barat Daya','admin','2016-04-30 10:08:37',0,0),('30','443','Maluku Tengah','admin','2016-04-30 10:08:37',0,0),('30','444','Maluku Tenggara','admin','2016-04-30 10:08:37',0,0),('30','445','Maluku Tenggr Brt','admin','2016-04-30 10:08:37',0,0),('30','446','Seram Bagian Barat','admin','2016-04-30 10:08:37',0,0),('30','447','Seram Bagian Timur','admin','2016-04-30 10:08:37',0,0),('30','448','Ambon','admin','2016-04-30 10:08:37',0,0),('30','449','Tual','admin','2016-04-30 10:08:37',0,0),('2','45','Tapanuli Selatan','admin','2016-04-30 10:08:37',0,0),('31','450','Halmahera Barat','admin','2016-04-30 10:08:37',0,0),('31','451','Halmahera Tengah','admin','2016-04-30 10:08:37',0,0),('31','452','Halmahera Utara','admin','2016-04-30 10:08:37',0,0),('31','453','Halmahera Selatan','admin','2016-04-30 10:08:37',0,0),('31','454','Kepulauan Sula','admin','2016-04-30 10:08:37',0,0),('31','455','Halmahera Timur','admin','2016-04-30 10:08:37',0,0),('31','456','Pulau Morotai','admin','2016-04-30 10:08:37',0,0),('31','457','Ternate','admin','2016-04-30 10:08:37',0,0),('31','458','Tidore Kepulauan','admin','2016-04-30 10:08:37',0,0),('32','459','Asmat','admin','2016-04-30 10:08:37',0,0),('2','46','Tapanuli Tengah','admin','2016-04-30 10:08:37',0,0),('32','460','Biak Numfor','admin','2016-04-30 10:08:37',0,0),('32','461','Boven Digoel','admin','2016-04-30 10:08:37',0,0),('32','462','Deiyai','admin','2016-04-30 10:08:37',0,0),('32','463','Dogiyai','admin','2016-04-30 10:08:37',0,0),('32','464','Intan Jaya','admin','2016-04-30 10:08:37',0,0),('32','465','Jayapura','admin','2016-04-30 10:08:37',0,0),('32','466','Jayawijaya','admin','2016-04-30 10:08:37',0,0),('32','467','Keerom','admin','2016-04-30 10:08:37',0,0),('32','468','Kepulauan Yapen','admin','2016-04-30 10:08:37',0,0),('32','469','Lanny Jaya','admin','2016-04-30 10:08:37',0,0),('2','47','Tapanuli Utara','admin','2016-04-30 10:08:37',0,0),('32','470','Mamberamo Raya','admin','2016-04-30 10:08:37',0,0),('32','471','Mamberamo Tengah','admin','2016-04-30 10:08:37',0,0),('32','472','Mappi','admin','2016-04-30 10:08:37',0,0),('32','473','Merauke','admin','2016-04-30 10:08:37',0,0),('32','474','Mimika','admin','2016-04-30 10:08:37',0,0),('32','475','Nabire','admin','2016-04-30 10:08:37',0,0),('32','476','Nduga','admin','2016-04-30 10:08:37',0,0),('32','477','Paniai','admin','2016-04-30 10:08:37',0,0),('32','478','Pegunungan Bintang','admin','2016-04-30 10:08:37',0,0),('32','479','Puncak','admin','2016-04-30 10:08:37',0,0),('2','48','Toba Samosir','admin','2016-04-30 10:08:37',0,0),('32','480','Puncak Jaya','admin','2016-04-30 10:08:37',0,0),('32','481','Sarmi','admin','2016-04-30 10:08:37',0,0),('32','482','Supiori','admin','2016-04-30 10:08:37',0,0),('32','483','Tolikara','admin','2016-04-30 10:08:37',0,0),('32','484','Waropen','admin','2016-04-30 10:08:37',0,0),('32','485','Yahukimo','admin','2016-04-30 10:08:37',0,0),('32','486','Yalimo','admin','2016-04-30 10:08:37',0,0),('32','487','Jayapura','admin','2016-04-30 10:08:37',0,0),('33','488','Fakfak','admin','2016-04-30 10:08:37',0,0),('33','489','Kaimana','admin','2016-04-30 10:08:37',0,0),('2','49','Binjai','admin','2016-04-30 10:08:37',0,0),('33','490','Manokwari','admin','2016-04-30 10:08:37',0,0),('33','491','Maybrat','admin','2016-04-30 10:08:37',0,0),('33','492','Raja Ampat','admin','2016-04-30 10:08:37',0,0),('33','493','Sorong','admin','2016-04-30 10:08:37',0,0),('33','494','Sorong Selatan','admin','2016-04-30 10:08:37',0,0),('33','495','Tambrauw','admin','2016-04-30 10:08:37',0,0),('33','496','Teluk Bintuni','admin','2016-04-30 10:08:37',0,0),('33','497','Teluk Wondama','admin','2016-04-30 10:08:37',0,0),('33','498','Sorong','admin','2016-04-30 10:08:37',0,0),('1','5','Aceh Selatan','admin','2016-04-30 10:08:37',0,0),('2','50','Gunung Sitoli','admin','2016-04-30 10:08:37',0,0),('2','51','Medan','admin','2016-04-30 10:08:37',0,0),('2','52','Padang Sidempuan','admin','2016-04-30 10:08:37',0,0),('2','53','Pematangsiantar','admin','2016-04-30 10:08:37',0,0),('2','54','Sibolga','admin','2016-04-30 10:08:37',0,0),('2','55','Tanjung Balai','admin','2016-04-30 10:08:37',0,0),('2','56','Tebing Tinggi','admin','2016-04-30 10:08:37',0,0),('3','57','Bengkulu Selatan','admin','2016-04-30 10:08:37',0,0),('3','58','Bengkulu Tengah','admin','2016-04-30 10:08:37',0,0),('3','59','Bengkulu Utara','admin','2016-04-30 10:08:37',0,0),('1','6','Aceh Singkil','admin','2016-04-30 10:08:37',0,0),('3','60','Benteng','admin','2016-04-30 10:08:37',0,0),('3','61','Kaur','admin','2016-04-30 10:08:37',0,0),('3','62','Kepahiang','admin','2016-04-30 10:08:37',0,0),('3','63','Lebong','admin','2016-04-30 10:08:37',0,0),('3','64','Mukomuko','admin','2016-04-30 10:08:37',0,0),('3','65','Rejang Lebong','admin','2016-04-30 10:08:37',0,0),('3','66','Seluma','admin','2016-04-30 10:08:37',0,0),('3','67','Bengkulu','admin','2016-04-30 10:08:37',0,0),('4','68','Batang Hari','admin','2016-04-30 10:08:37',0,0),('4','69','Bungo','admin','2016-04-30 10:08:37',0,0),('1','7','Aceh Tamiang','admin','2016-04-30 10:08:37',0,0),('4','70','Kerinci','admin','2016-04-30 10:08:37',0,0),('4','71','Merangin','admin','2016-04-30 10:08:37',0,0),('4','72','Muaro Jambi','admin','2016-04-30 10:08:37',0,0),('4','73','Sarolangun','admin','2016-04-30 10:08:37',0,0),('4','74','Tjg Jabung Barat','admin','2016-04-30 10:08:37',0,0),('4','75','Tjg Jabung Timur','admin','2016-04-30 10:08:37',0,0),('4','76','Tebo','admin','2016-04-30 10:08:37',0,0),('4','77','Jambi','admin','2016-04-30 10:08:37',0,0),('4','78','Sungai Penuh','admin','2016-04-30 10:08:37',0,0),('5','79','Bengkalis','admin','2016-04-30 10:08:37',0,0),('1','8','Aceh Tengah','admin','2016-04-30 10:08:37',0,0),('5','80','Indragiri Hilir','admin','2016-04-30 10:08:37',0,0),('5','81','Indragiri Hulu','admin','2016-04-30 10:08:37',0,0),('5','82','Kampar','admin','2016-04-30 10:08:37',0,0),('5','83','Kuantan Singingi','admin','2016-04-30 10:08:37',0,0),('5','84','Pelalawan','admin','2016-04-30 10:08:37',0,0),('5','85','Rokan Hilir','admin','2016-04-30 10:08:37',0,0),('5','86','Rokan Hulu','admin','2016-04-30 10:08:37',0,0),('5','87','Siak','admin','2016-04-30 10:08:37',0,0),('5','88','Pekanbaru','admin','2016-04-30 10:08:37',0,0),('5','89','Dumai','admin','2016-04-30 10:08:37',0,0),('1','9','Aceh Tenggara','admin','2016-04-30 10:08:37',0,0),('5','90','Kepulauan Meranti','admin','2016-04-30 10:08:37',0,0),('6','91','Agam','admin','2016-04-30 10:08:37',0,0),('6','92','Dharmasraya','admin','2016-04-30 10:08:37',0,0),('6','93','Kepulauan Mentawai','admin','2016-04-30 10:08:37',0,0),('6','94','Lima Puluh Kota','admin','2016-04-30 10:08:37',0,0),('6','95','Padang Pariaman','admin','2016-04-30 10:08:37',0,0),('6','96','Pasaman','admin','2016-04-30 10:08:37',0,0),('6','97','Pasaman Barat','admin','2016-04-30 10:08:37',0,0),('6','98','Pesisir Selatan','admin','2016-04-30 10:08:37',0,0),('6','99','Sijunjung','admin','2016-04-30 10:08:37',0,0);
/*!40000 ALTER TABLE `ms_kota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_provinsi`
--

DROP TABLE IF EXISTS `ms_provinsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_provinsi` (
  `kode_prov` varchar(5) NOT NULL COMMENT 'Kode Provinsi',
  `nama_prov` varchar(50) NOT NULL COMMENT 'Nama Provinsi',
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `sinkron` int(1) DEFAULT '0',
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kode_prov`),
  KEY `PRKODE` (`kode_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Master Provinsi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_provinsi`
--

LOCK TABLES `ms_provinsi` WRITE;
/*!40000 ALTER TABLE `ms_provinsi` DISABLE KEYS */;
INSERT INTO `ms_provinsi` VALUES ('1','Aceh','admin','2016-04-30 10:04:04',0,0),('10','Kepulauan Riau','admin','2016-04-30 10:04:04',0,0),('11','Banten','admin','2016-04-30 10:04:04',0,0),('12','Jawa Barat','admin','2016-04-30 10:04:04',0,0),('13','Jakarta Raya','admin','2016-04-30 10:04:04',0,0),('14','Jawa Tengah','admin','2016-04-30 10:04:04',0,0),('15','Jawa Timur','admin','2016-04-30 10:04:04',0,0),('16','Daerah Istimewa Yogyakarta','admin','2016-04-30 10:04:04',0,0),('17','Bali','admin','2016-04-30 10:04:04',0,0),('18','Nusa Tenggara Barat','admin','2016-04-30 10:04:04',0,0),('19','Nusa Tenggara Timur','admin','2016-04-30 10:04:04',0,0),('2','Sumatera Utara','admin','2016-04-30 10:04:04',0,0),('20','Kalimantan Barat','admin','2016-04-30 10:04:04',0,0),('21','Kalimantan Selatan','admin','2016-04-30 10:04:04',0,0),('22','Kalimantan Tengah','admin','2016-04-30 10:04:04',0,0),('23','Kalimantan Timur','admin','2016-04-30 10:04:04',0,0),('24','Gorontalo','admin','2016-04-30 10:04:04',0,0),('25','Sulawesi Selatan','admin','2016-04-30 10:04:04',0,0),('26','Sulawesi Tenggara','admin','2016-04-30 10:04:04',0,0),('27','Sulawesi Tengah','admin','2016-04-30 10:04:04',0,0),('28','Sulawesi Utara','admin','2016-04-30 10:04:04',0,0),('29','Sulawesi Barat','admin','2016-04-30 10:04:04',0,0),('3','Bengkulu','admin','2016-04-30 10:04:04',0,0),('30','Maluku','admin','2016-04-30 10:04:04',0,0),('31','Maluku Utara','admin','2016-04-30 10:04:04',0,0),('32','Papua','admin','2016-04-30 10:04:04',0,0),('33','Papua Barat','admin','2016-04-30 10:04:04',0,0),('4','Jambi','admin','2016-04-30 10:04:04',0,0),('5','Riau','admin','2016-04-30 10:04:04',0,0),('6','Sumatera Barat','admin','2016-04-30 10:04:04',0,0),('7','Sumatera Selatan','admin','2016-04-30 10:04:04',0,0),('8','Lampung','admin','2016-04-30 10:04:04',0,0),('9','Kepulauan Bangka Belitung','admin','2016-04-30 10:04:04',0,0);
/*!40000 ALTER TABLE `ms_provinsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_satuan`
--

DROP TABLE IF EXISTS `ms_satuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_satuan` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) DEFAULT NULL,
  `flag` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_satuan`
--

LOCK TABLES `ms_satuan` WRITE;
/*!40000 ALTER TABLE `ms_satuan` DISABLE KEYS */;
INSERT INTO `ms_satuan` VALUES (1,'roll ',0),(2,'meter',0),(3,'gallon',0),(4,'tube',0),(5,'kaleng',0),(6,'kg',0),(7,'bungkus',0),(8,'dirigen',0),(9,'pcs',0),(10,'lembar',0),(11,'dus',0),(12,'sak',0),(13,'btl',0),(14,'ktg',0),(15,'btg',0),(16,'pail',0),(17,'psg',0),(18,'ikat',0),(19,'set',0),(20,'lain',0),(32,'asd',1);
/*!40000 ALTER TABLE `ms_satuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_set_det`
--

DROP TABLE IF EXISTS `ms_set_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_set_det` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_barang_set` int(6) NOT NULL,
  `kode_barang_set` varchar(15) NOT NULL,
  `id_barang` int(6) NOT NULL,
  `kode_barang` varchar(15) NOT NULL,
  `qty_anak` int(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(2) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`id_barang_set`,`kode_barang_set`,`id_barang`,`kode_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_set_det`
--

LOCK TABLES `ms_set_det` WRITE;
/*!40000 ALTER TABLE `ms_set_det` DISABLE KEYS */;
INSERT INTO `ms_set_det` VALUES (1,485,'SE0001',487,'BD0059',2,'2016-10-29 19:02:59',1,1),(2,485,'SE0001',486,'BD0058',1,'2016-10-30 02:54:45',1,0),(3,485,'SE0001',487,'BD0059',1,'2016-10-30 02:54:54',1,0),(4,485,'SE0001',488,'BD0060',1,'2016-10-30 02:55:01',1,0),(5,483,'SE0001',484,'BD0058',1,'2016-10-30 04:19:41',1,0),(6,483,'SE0001',485,'BD0059',1,'2016-10-30 04:19:48',1,0),(7,502,'SE0004',77,'BD0023',1,'2016-11-30 07:32:15',1,0);
/*!40000 ALTER TABLE `ms_set_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_vendor`
--

DROP TABLE IF EXISTS `ms_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_vendor` (
  `id_vendor` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id vendor',
  `kode_vendor` varchar(20) NOT NULL COMMENT 'kode vendor',
  `nama_vendor` varchar(30) NOT NULL COMMENT 'Nama Depan',
  `alamat` varchar(255) DEFAULT NULL COMMENT 'Limit Kredit',
  `kode_provinsi` varchar(5) DEFAULT NULL,
  `kode_kota` varchar(5) DEFAULT NULL COMMENT 'Expired',
  `email` varchar(50) DEFAULT NULL,
  `telepon_1` varchar(20) DEFAULT NULL,
  `telepon_2` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_vendor`,`kode_vendor`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='Master Pelanggan';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_vendor`
--

LOCK TABLES `ms_vendor` WRITE;
/*!40000 ALTER TABLE `ms_vendor` DISABLE KEYS */;
INSERT INTO `ms_vendor` VALUES (1,'VEN0001','Rajawali Mas','cipondoh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(2,'VEN0002','nipsea paint and chemicals',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(3,'VEN0003','andika',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(4,'VEN0004','ahui / joko',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'VEN0005','canvasing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(6,'VEN0006','sinar cengkareng',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'VEN0007','ss joni',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(8,'VEN0008','pt. Adhi cakra utama mulia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(9,'VEN0009','SBM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(10,'VEN0010','lain lain',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(11,'VEN0011','UBJ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(12,'VEN0012','Catur Sentosa Adiprana',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(13,'VEN0013','Pd. Special Profil',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(14,'VEN0014','MP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(15,'VEN0015','Aneka jaya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(16,'VEN0016','sinar stell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(17,'VEN0017','Wahana / song khim',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(18,'VEN0018','Pt. Nipsea Paint & Chemical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(19,'VEN0019','cv. Mega indah jaya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(20,'VEN0020','cv. Handal inti usaha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(21,'VEN0021','Aan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(22,'VEN0022','ko asun',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(23,'VEN0023','ko hendrik',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(24,'VEN0024','teddy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(25,'VEN0025','Abadi jaya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(26,'VEN0026','Pt. Indaco warna dunia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(27,'VEN0027','Pt. Panen raya rejeki mantap',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(28,'VEN0028','elos ananto update','Jalan Panglima Polim\r\nWha update','11','156','socmed.eloz@gmail.com','821333','13816158333','82113816158333',NULL,'2016-09-13 10:05:04',1);
/*!40000 ALTER TABLE `ms_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Aceh'),(2,'Sumatera Utara'),(3,'Bengkulu'),(4,'Jambi'),(5,'Riau'),(6,'Sumatera Barat'),(7,'Sumatera Selatan'),(8,'Lampung'),(9,'Kepulauan Bangka Belitung'),(10,'Kepulauan Riau'),(11,'Banten'),(12,'Jawa Barat'),(13,'Jakarta Raya'),(14,'Jawa Tengah'),(15,'Jawa Timur'),(16,'Daerah Istimewa Yogyakarta'),(17,'Bali'),(18,'Nusa Tenggara Barat'),(19,'Nusa Tenggara Timur'),(20,'Kalimantan Barat'),(21,'Kalimantan Selatan'),(22,'Kalimantan Tengah'),(23,'Kalimantan Timur'),(24,'Gorontalo'),(25,'Sulawesi Selatan'),(26,'Sulawesi Tenggara'),(27,'Sulawesi Tengah'),(28,'Sulawesi Utara'),(29,'Sulawesi Barat'),(30,'Maluku'),(31,'Maluku Utara'),(32,'Papua'),(33,'Papua Barat');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblagama`
--

DROP TABLE IF EXISTS `tblagama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblagama` (
  `idtblagama` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblagama`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblagama`
--

LOCK TABLES `tblagama` WRITE;
/*!40000 ALTER TABLE `tblagama` DISABLE KEYS */;
INSERT INTO `tblagama` VALUES (1,'Islam','islam',0),(2,'Protestan','kristen protestan',0),(3,'Katolik','Katolik',0),(4,'Hindu','Hindu',0),(5,'Buddha ','Buddha ',0),(6,'Khonghucu','Khonghucu',0),(7,'Lainnya','Lainnya',0);
/*!40000 ALTER TABLE `tblagama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbarak`
--

DROP TABLE IF EXISTS `tblbarak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbarak` (
  `idtblbarak` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `penanggung_jawab` varchar(50) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `tampung` int(6) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `picture_name` varchar(50) DEFAULT NULL,
  `deskripsi` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblbarak`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbarak`
--

LOCK TABLES `tblbarak` WRITE;
/*!40000 ALTER TABLE `tblbarak` DISABLE KEYS */;
INSERT INTO `tblbarak` VALUES (1,'Barak 1 update','jalan mana aja update','Elos Ananto update','12345622',2001,'-7.7681319474629795','110.32125835449222','1_043_MG_2017_05_1414_19_23jpg_34967263956_l.jpg','coba keterangan','2017-09-16 17:22:19',NULL,1),(2,'elos barak','jalan slemania','elos ananto','123456',100,'-7.7466498983917855','110.32382607070315','2_217365_34801611382_l.jpg','barak coba','2017-09-16 17:24:29',NULL,1),(3,'Barak Purwobinangun','Purwobinangun Pakem','rareti','2323232323',1000,'-7.643559916764784','110.37223457900393','3_Tulips.jpg','asasasasas','2017-10-07 13:38:47',NULL,0);
/*!40000 ALTER TABLE `tblbarak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbarang`
--

DROP TABLE IF EXISTS `tblbarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbarang` (
  `idtblbarang` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `uom` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblbarang`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbarang`
--

LOCK TABLES `tblbarang` WRITE;
/*!40000 ALTER TABLE `tblbarang` DISABLE KEYS */;
INSERT INTO `tblbarang` VALUES (1,'beras','beras kiloan','kg','2017-10-12 16:27:55',0),(2,'mie instan','mie dus dusan','dus','2017-10-12 16:28:24',0),(3,'uang','uang','rupiah','2017-10-12 16:28:37',0),(4,'Asbes','Penutup Atap Gelombang','pcs','2017-11-05 15:07:10',0),(5,'Seng','Penutup Atap Gelombang','pcs','2017-11-05 15:07:29',0),(6,'Angkong','Pengangkut alat dan material','pcs','2017-11-05 15:07:49',0),(7,'Daster','Pakaian Ibu','pcs','2017-12-03 14:17:35',0),(8,'Sarung','Sarung Selimut','pcs','2017-12-03 14:17:56',0),(9,'Jarik','Jarik','pcs','2017-12-03 14:18:16',0),(10,'Tikar','Alas Tidur','pcs','2017-12-03 14:51:10',0),(11,'Selimut','Selimut Tidur','pcs','2017-12-03 14:51:37',0),(12,'Kaos','Kaos Oblong','pcs','2017-12-03 14:52:20',0);
/*!40000 ALTER TABLE `tblbarang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbencana`
--

DROP TABLE IF EXISTS `tblbencana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbencana` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  `icon` varchar(100) DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbencana`
--

LOCK TABLES `tblbencana` WRITE;
/*!40000 ALTER TABLE `tblbencana` DISABLE KEYS */;
INSERT INTO `tblbencana` VALUES (1,'ANGIN KENCANG','Angin Kencang yang menyebabkan pohon tumbang','1_007-tree.png','trial','2017-09-13 14:06:27',0),(2,'GUNUNG MERAPI','Erupsi Gunung Merapi',NULL,'trial','2017-09-13 14:07:09',1),(3,'BANJIR','banjir','3_006-flood.png',NULL,'2017-09-13 14:07:09',0),(4,'TANAH LONGSOR','Longsoran tanah berupa batuan maupun tanah','4_005-avalanche.png',NULL,NULL,0),(5,'KEBAKARAN','kebakaran Lahan Maupun Rumah','5_004-flame.png',NULL,NULL,0),(6,'GEMPA BUMI','Gempa bumi','6_002-martial-arts-couple-fight.png',NULL,NULL,1),(7,'KECELAKAAN ','kecelakaan','7_003-engine-problems.png',NULL,NULL,0),(8,'PEMERKOSAAN','pemerkosaan','8_002-femenine.png',NULL,NULL,1),(9,'PENCURIAN','pencurian','9_001-thief.png',NULL,NULL,1),(10,'NON BENCANA','Kejadian Non kebencanaan alam','10_laka_131582436003038704.ico',NULL,'2017-11-05 15:17:10',0);
/*!40000 ALTER TABLE `tblbencana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldampak`
--

DROP TABLE IF EXISTS `tbldampak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldampak` (
  `idtbldampak` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `satuan` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtbldampak`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldampak`
--

LOCK TABLES `tbldampak` WRITE;
/*!40000 ALTER TABLE `tbldampak` DISABLE KEYS */;
INSERT INTO `tbldampak` VALUES (1,'LUKA RINGAN','jiwa','2017-10-12 16:31:01',0),(2,'LUKA SEDANG','jiwa','2017-10-12 16:31:39',0),(3,'LUKA BERAT','jiwa',NULL,0),(4,'MENINGGAL','jiwa',NULL,0),(5,'POHON','Pcs',NULL,0),(6,'RUMAH RUSAK RINGAN','Pcs',NULL,0),(7,'RUMAH RUSAK SEDANG','Pcs',NULL,0),(8,'RUMAH RUSAK BERAT','Pcs',NULL,0),(9,'KANDANG','Pcs',NULL,0),(10,'TEMPAT USAHA','Pcs',NULL,0),(11,'JARINGAN LISTRIK','Pcs',NULL,0),(12,'FASILITAS UMUM','Pcs',NULL,0),(13,'FASILITAS PENDIDIKAN','Pcs',NULL,0),(14,'FASILITAS KESEHATAN','Pcs',NULL,0),(15,'FASILITAS IBADAH','Pcs',NULL,0),(16,'KOLAM','M2',NULL,0),(17,'SAWAH','M2',NULL,0),(18,'LAHAN','M2',NULL,0),(19,'HUTAN','M2',NULL,0),(20,'TALUD','M2',NULL,0),(21,'TEBING','M2',NULL,0),(22,'JEMBATAN','M2',NULL,0),(23,'JALAN','M2',NULL,0),(24,'IRIGASI','M2',NULL,0),(25,'KENDARAAN RODA 2','Pcs',NULL,0),(26,'KENDARAAN RODA 4','Pcs',NULL,0),(27,'KENDARAAN MASAL','Pcs',NULL,0),(28,'TAKSIRAN KERUSAKAN','Rp',NULL,0);
/*!40000 ALTER TABLE `tbldampak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldesa`
--

DROP TABLE IF EXISTS `tbldesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldesa` (
  `idtbldesa` int(11) NOT NULL AUTO_INCREMENT,
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
  `deskripsi` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtbldesa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldesa`
--

LOCK TABLES `tbldesa` WRITE;
/*!40000 ALTER TABLE `tbldesa` DISABLE KEYS */;
INSERT INTO `tbldesa` VALUES (1,'desa purworejo 1','jalan banyuwangi 1',13,340403,2,'gajah1','elos 1','0812231241210',60000,'-7.766380427721947','110.24520516005862','keterangan nya nih 1','2017-09-28 00:00:00','coba',0),(2,'cipondoh','jalan slemania',2,340401,5,'elos','elos','083742734',200,'-7.724537','110.3499186','asd','2017-11-05 00:00:00','coba',0),(3,'Desa Donokerto','Donokerto',74,340145,10,'dapur umum','masyukur','11111',30,'-7.649684772952081','110.37292122451174','Sister Village dengan Desa Blababababaaa',NULL,NULL,0),(4,'Desa Kadu','Jalan Gatot Subroto',1,340401,2,'Dapur','Agus','12345',2300,'-7.651684772952081','110.37202122451174',NULL,NULL,NULL,0),(5,'Desa Ija',NULL,6,340402,2,'Dapur','Ali','123984',2300,'-7.724537','110.37202122451174',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `tbldesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldusun`
--

DROP TABLE IF EXISTS `tbldusun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldusun` (
  `idtbldusun` int(11) NOT NULL AUTO_INCREMENT,
  `id_kel` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `radius_merapi` int(11) DEFAULT NULL,
  `idtblkrb` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`idtbldusun`,`id_kel`),
  KEY `tbldusun_ibfk_1` (`id_kel`),
  CONSTRAINT `tbldusun_ibfk_1` FOREIGN KEY (`id_kel`) REFERENCES `tblkelurahan` (`id_kel`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldusun`
--

LOCK TABLES `tbldusun` WRITE;
/*!40000 ALTER TABLE `tbldusun` DISABLE KEYS */;
INSERT INTO `tbldusun` VALUES (1,2,'Poris Indah',20,2,NULL),(2,2,'Poris Plawad',21,2,NULL),(3,2,'Poris Gaga Baru',24,2,NULL),(4,2,'Cipondoh Makmur',22,2,NULL),(5,2,'Alfitroh',19,2,NULL),(8,3,'Kadu Payah',32,3,NULL),(9,3,'Kadu Jaya',31,3,NULL),(10,4,'Narita',39,3,NULL),(11,4,'Sunda Kelapa',38,3,NULL),(13,55,'Plosokuning I',24,0,NULL),(14,55,'Plosokuning II',24,0,NULL),(15,55,'Plosokuning III',24,0,NULL),(16,55,'Plosokuning IV',25,0,NULL),(17,55,'Plosokuning V/ Glondong',25,0,NULL),(18,55,'Plosokuning VI/ Karangjati/ Mlandangan',25,0,NULL),(19,1,'Pasekan Kidul',0,0,NULL),(20,1,'Pasekan Lor',0,0,NULL),(21,1,'Nyamplung Kidul',0,0,NULL),(22,1,'Nyamplung Lor',0,0,NULL),(23,1,'Kluwih',0,0,NULL),(24,1,'Sumber',0,0,NULL),(25,33,'Pugeran',30,0,NULL),(26,37,'raruh',30,0,NULL),(27,80,'Pakem',15,1,NULL),(28,48,'Kaliwaru',0,0,NULL),(29,61,'Ngangkrik',0,0,NULL),(30,48,'Ngrangsan',0,0,NULL),(31,18,'Soroganten',0,0,NULL),(32,52,'Sempu',0,0,NULL),(33,18,'Beroo',0,0,NULL);
/*!40000 ALTER TABLE `tbldusun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblews`
--

DROP TABLE IF EXISTS `tblews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblews` (
  `idtblews` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_kel` varchar(4) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `picture_name` varchar(50) DEFAULT NULL,
  `deskripsi` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblews`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblews`
--

LOCK TABLES `tblews` WRITE;
/*!40000 ALTER TABLE `tblews` DISABLE KEYS */;
INSERT INTO `tblews` VALUES (1,'EWSTurgo','jalan mana aja update','80','12345622','-7.59188608825982','110.40468578369143','1_043_MG_2017_05_1414_19_23jpg_34967263956_l.jpg','EWS Banjir lahar di turgo, BOD 7','2017-11-05 15:22:52',NULL,1),(2,'EWS Kemiri','jalan slemania','1','123456','-7.7466498983917855','110.32382607070315','2_217365_34801611382_l.jpg','EWS kemiri ewa lahar hujan BOD 8','2017-11-05 15:23:44',NULL,0),(3,'EWS Pulowatu','asdsdgfdbvc q','77','12341','-7.7681379474629795','110.32128835449222','3_A_pretty_duck_34275928770_l.jpg','EWS Lahar Hujan','2017-11-05 15:24:38',NULL,1);
/*!40000 ALTER TABLE `tblews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgalery`
--

DROP TABLE IF EXISTS `tblgalery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgalery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtbl` int(11) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '1 = ssb, 2 = desa, 3 = ews',
  `picture_name` varchar(100) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgalery`
--

LOCK TABLES `tblgalery` WRITE;
/*!40000 ALTER TABLE `tblgalery` DISABLE KEYS */;
INSERT INTO `tblgalery` VALUES (2,3,1,'cat-untuk-wooden-furniture-1.jpg','242086','2017-09-28 09:21:22'),(3,3,1,'d8a86ceb9d31f6f91a6eec24facac178.jpg','93111','2017-09-28 09:21:22'),(4,3,1,'elos.png','20983','2017-09-28 09:21:22'),(5,3,1,'15337234_1729110787407996_9183303737194577920_n.jpg','95341','2017-09-28 14:11:39'),(10,1,2,'17495003_1921828098053457_1350137353343074304_n.jpg','44591','2017-09-28 16:10:58'),(11,1,2,'-brain_hd_wallpaper_mine_colorfull_wallpaper_funny_theme_background.jpg.jpg','72234','2017-09-28 16:10:58'),(12,1,2,'cat-untuk-wooden-furniture-1.jpg','242086','2017-09-28 16:10:58'),(13,1,2,'d8a86ceb9d31f6f91a6eec24facac178.jpg','93111','2017-09-28 16:10:58');
/*!40000 ALTER TABLE `tblgalery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgroup`
--

DROP TABLE IF EXISTS `tblgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgroup` (
  `idtblgroup` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblgroup`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgroup`
--

LOCK TABLES `tblgroup` WRITE;
/*!40000 ALTER TABLE `tblgroup` DISABLE KEYS */;
INSERT INTO `tblgroup` VALUES (1,'admin','Administrasi website','2017-10-17 09:53:40',0),(2,'pelaksana','pelaksana',NULL,0),(3,'Relawan','Relawan Sleman','2017-11-10 00:28:05',0),(4,'TRC','Team Reaksi Cepat BPBD Sleman','2017-11-19 22:15:11',0);
/*!40000 ALTER TABLE `tblgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgudang`
--

DROP TABLE IF EXISTS `tblgudang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgudang` (
  `idtblgudang` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `id_kel` int(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblgudang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgudang`
--

LOCK TABLES `tblgudang` WRITE;
/*!40000 ALTER TABLE `tblgudang` DISABLE KEYS */;
INSERT INTO `tblgudang` VALUES (1,'darurat merapi','gudang untuk memenuhi nasabah',6,'2017-10-12 16:31:01',0),(2,'gudang mesin','gudang untuk alat berat',10,'2017-10-12 16:31:39',0),(3,'GUDANG WUKIRHARJO','Gudang Darurat Bencana Banjir dan Tanah Longsor',40,'2017-12-03 14:13:56',0);
/*!40000 ALTER TABLE `tblgudang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinstansi`
--

DROP TABLE IF EXISTS `tblinstansi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinstansi` (
  `idtblinstansi` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblinstansi`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinstansi`
--

LOCK TABLES `tblinstansi` WRITE;
/*!40000 ALTER TABLE `tblinstansi` DISABLE KEYS */;
INSERT INTO `tblinstansi` VALUES (1,'Bayu Induk','Komplek Pemda Sleman, Jl. Prasamya Sleman','0274 869375','BPBD Sleman','2017-09-29 15:35:27',0),(2,'PUSDALOPS Sleman','Jl. Kaliurang Km17.5, Pakem','0274 2860051','BPBD Sleman','2017-09-29 15:38:25',0),(3,'DLH','Jl. KRT. Pringgodiningrat, NO.9, Beran, Tridadi, Sleman','081392125525','Bp. Karman ( Crane )','2017-11-10 00:01:53',0),(4,'TELKOM','-','0811252767','Bagus','2017-11-10 00:02:50',0),(5,'TELKOM','-','08124803321','Ibu Utami','2017-11-10 00:03:31',0),(6,'PLN Sleman','-','0274 869455','Kantor UPJ Sleman','2017-11-10 00:04:45',0),(7,'POSKO UTAMA PAKEM','Jl. Kaliurang Km17.5, Pakem','0274 898350','TRC BPBD Sleman','2017-11-10 00:05:43',0),(8,'AGNI Induk','Komplek Pemda Sleman, Jl. Prasamya Sleman','0274 868351','PEMADAM KEBAKARAN SLEMAN','2017-11-10 00:07:04',0),(9,'AGNI Godean','Jl. Godean','0274 2821346','PEMADAM KEBAKARAN SLEMAN POS GODEAN','2017-11-10 00:07:57',0),(10,'PGM Kaliurang','Kaliurang','0274 895209','POS PANTAU KALIURANG','2017-11-10 00:09:03',0),(11,'SAR KALIURANG','Kaliurang','0274 868352','Pos Sar Kaliurang','2017-11-10 00:09:56',0),(12,'PMI Sleman','-','0274 868900','Markas PMI Sleman','2017-11-10 00:10:59',0),(13,'BASARNAS','Jl. Wates','0274 6498080','Kantor BASARNAS','2017-11-10 00:12:01',0),(14,'SAR POLDA','Jl. Ringroad Utara','0851 0770 0767','-','2017-11-10 00:13:07',0),(15,'SAR POLDA','Jl. Ringroad Utara','0274 7007606','-','2017-11-10 00:13:42',0),(16,'PLN Kalasan','-','0274 496317','Kantor PLN Kalasan','2017-11-10 00:14:40',0),(17,'PLN Sedayu','-','0274 6497977','Kantor PLN Sedayu','2017-11-10 00:15:16',0),(18,'PLN Sedayu','-','0274563348','Kantor PLN Sedayu','2017-11-10 00:15:44',0),(19,'SES','Dinkes Sleman','0274 8609000','-','2017-11-10 00:16:59',0),(20,'SES','Dinkes Sleman','08112668900','-','2017-11-10 00:17:39',0),(21,'PLN Kota','-','0274 387365','Kantor PLN Kota','2017-11-10 00:19:16',0),(22,'BPPTKG','-','0274 514192','Kantor BPPTKG','2017-11-10 00:19:55',0),(23,'BMKG Iklim','-','0274 2880151','-','2017-11-10 00:20:39',0),(24,'BMKG Iklim','-','0274 2880152','-','2017-11-10 00:21:02',0),(25,'BMKG Gempa','-','0274 6498383','-','2017-11-10 00:21:34',0),(26,'PUSDALOPS DIY','Jl. Kenari, No.14A, Semaki, Umbulharjo, Yogyakarta','0274 555584','BPBD DIY','2017-11-10 00:23:44',0),(27,'PUSDALOPS DIY','Jl. Kenari, No.14A, Semaki, Umbulharjo, Yogyakarta','0274 555585','BPBD DIY','2017-11-10 00:24:17',0),(28,'PLN Sleman','-','085722260237','ANDRI/ ARDI','2017-11-11 13:29:10',0),(29,'SRIYONO','Balong, Umbulharjo, Cangkringan','085878212444','TAGANA','2017-12-03 18:09:53',0);
/*!40000 ALTER TABLE `tblinstansi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkecakapan`
--

DROP TABLE IF EXISTS `tblkecakapan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkecakapan` (
  `idtblkecakapan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblkecakapan`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkecakapan`
--

LOCK TABLES `tblkecakapan` WRITE;
/*!40000 ALTER TABLE `tblkecakapan` DISABLE KEYS */;
INSERT INTO `tblkecakapan` VALUES (1,'Perencanaan','Perencanaan',NULL,0),(2,'Pendidikan','Pendidikan',NULL,0),(3,'Sistem Informasi Geografis (GIS) dan Pemetaan','Sistem Informasi Geografis (GIS) dan Pemetaan',NULL,0),(4,'Pelatihan, Geladi dan Simulasi Bencana1','Pelatihan, Geladi dan Simulasi Bencana1','2017-10-26 13:57:07',0),(5,'Kaji Cepat Bencana','Kaji Cepat Bencana',NULL,0),(6,'Pencarian dan Penyelamatan (SAR) dan Evakuasi','Pencarian dan Penyelamatan (SAR) dan Evakuasi',NULL,0),(7,'Transportasi','Transportasi',NULL,0),(8,'Logistik','Logistik',NULL,0),(9,'Keamanan Pangan dan Nutrisi','Keamanan Pangan dan Nutrisi',NULL,0),(10,'Dapur Umum','Dapur Umum',NULL,0),(11,'Pengelolaan Lokasi Pengungsian dan Huntara','Pengelolaan Lokasi Pengungsian dan Huntara',NULL,0),(12,'Pengelolaan Posko Penanggulangan Bencana (PB)','Pengelolaan Posko Penanggulangan Bencana (PB)',NULL,0),(13,'Kesehatan/ Medis','Kesehatan/ Medis',NULL,0),(14,'Air Bersih, Sanitasi, dan Kesehatan Lingkungan','Air Bersih, Sanitasi, dan Kesehatan Lingkungan',NULL,0),(15,'Keamanan dan Perlindungan','Keamanan dan Perlindungan',NULL,0),(16,'Gender dan Kelompok Rentan','Gender dan Kelompok Rentan',NULL,0),(17,'Psikososial/ Konseling/ Penyembuhan Trauma','Psikososial/ Konseling/ Penyembuhan Trauma',NULL,0),(18,'Pertukangan dan Perekayasaan','Pertukangan dan Perekayasaan',NULL,0),(19,'Pertanian, Peternakan dan Penghidupan','Pertanian, Peternakan dan Penghidupan',NULL,0),(20,'Administrasi','Administrasi',NULL,0),(21,'Pengelolaan Keuangan','Pengelolaan Keuangan',NULL,0),(22,'Bahasa Asing','Bahasa Asing',NULL,0),(23,'Informasi dan Komunikasi','Informasi dan Komunikasi',NULL,0),(24,'Hubungan Media dan Masyarakat','Hubungan Media dan Masyarakat',NULL,0),(25,'Pantauan, Evaluasi dan Pelaporan','Pantauan, Evaluasi dan Pelaporan',NULL,0),(26,'Promosi dan Mobilisasi Relawan','Promosi dan Mobilisasi Relawan',NULL,0),(27,'programmer','elos','2017-10-26 13:57:16',1);
/*!40000 ALTER TABLE `tblkecakapan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkecamatan`
--

DROP TABLE IF EXISTS `tblkecamatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkecamatan` (
  `id_kec` char(6) NOT NULL,
  `id_kab` char(4) NOT NULL,
  `nama` tinytext NOT NULL,
  PRIMARY KEY (`id_kec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkecamatan`
--

LOCK TABLES `tblkecamatan` WRITE;
/*!40000 ALTER TABLE `tblkecamatan` DISABLE KEYS */;
INSERT INTO `tblkecamatan` VALUES ('340401','3404','Gamping'),('340402','3404','Godean'),('340403','3404','Moyudan'),('340404','3404','Minggir'),('340405','3404','Seyegan'),('340406','3404','Mlati'),('340407','3404','Depok'),('340408','3404','Berbah'),('340409','3404','Prambanan'),('340410','3404','Kalasan'),('340411','3404','Ngemplak'),('340412','3404','Ngaglik'),('340413','3404','Sleman'),('340414','3404','Tempel'),('340415','3404','Turi'),('340416','3404','Pakem'),('340417','3404','Cangkringan');
/*!40000 ALTER TABLE `tblkecamatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkelurahan`
--

DROP TABLE IF EXISTS `tblkelurahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkelurahan` (
  `id_kel` int(9) NOT NULL AUTO_INCREMENT,
  `id_kec` char(6) DEFAULT NULL,
  `nama` tinytext,
  PRIMARY KEY (`id_kel`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkelurahan`
--

LOCK TABLES `tblkelurahan` WRITE;
/*!40000 ALTER TABLE `tblkelurahan` DISABLE KEYS */;
INSERT INTO `tblkelurahan` VALUES (1,'340401','Balecatur'),(2,'340401','Ambarketawang'),(3,'340401','Banyuraden'),(4,'340401','Nogotirto'),(5,'340401','Trihanggo'),(6,'340402','Sidorejo'),(7,'340402','Sidoluhur'),(8,'340402','Sidomulyo'),(9,'340402','Sidoagung'),(10,'340402','Sidokarto'),(11,'340402','Sidoarum'),(12,'340402','Sidomoyo'),(13,'340403','Sumberahayu'),(14,'340403','Sumbersari'),(15,'340403','Sumberagung'),(16,'340403','Sumberarum'),(17,'340404','Sendangarum'),(18,'340404','Sendangmulyo'),(19,'340404','Sendangagung'),(20,'340404','Sendangsari'),(21,'340404','Sendangrejo'),(22,'340405','Margoluwih'),(23,'340405','Margodadi'),(24,'340405','Margomulyo'),(25,'340405','Margokaton'),(26,'340405','Margoagung'),(27,'340406','Sinduadi'),(28,'340406','Sendangadi'),(29,'340406','Tlogoadi'),(30,'340406','Tirtoadi'),(31,'340406','Sumberadi'),(32,'340407','Caturtunggal'),(33,'340407','Maguwoharjo'),(34,'340407','Condongcatur'),(35,'340408','Sendangtirto'),(36,'340408','Tegaltirto'),(37,'340408','Kalitirto'),(38,'340408','Jogotirto'),(39,'340409','Sumberharjo'),(40,'340409','Wukirharjo'),(41,'340409','Gayamharjo'),(42,'340409','Sambirejo'),(43,'340409','Madurejo'),(44,'340409','Bokoharjo'),(45,'340410','Purwomartani'),(46,'340410','Tirtomartani'),(47,'340410','Tamanmartani'),(48,'340410','Selomartani'),(49,'340411','Sindumartani'),(50,'340411','Bimomartani'),(51,'340411','Widodomartani'),(52,'340411','Wedomartani'),(53,'340411','Umbulmartani'),(54,'340412','Sariharjo'),(55,'340412','Minomartani'),(56,'340412','Sinduharjo'),(57,'340412','Sukoharjo'),(58,'340412','Sardonoharjo'),(59,'340412','Donoharjo'),(60,'340413','Caturharjo'),(61,'340413','Triharjo'),(62,'340413','Tridadi'),(63,'340413','Pandowoharjo'),(64,'340413','Trimulyo'),(65,'340414','Banyurejo'),(66,'340414','Tambakrejo'),(67,'340414','Sumberrejo'),(68,'340414','Pondokrejo'),(69,'340414','Mororejo'),(70,'340414','Margorejo'),(71,'340414','Lumbungrejo'),(72,'340414','Merdikorejo'),(73,'340415','Bangunkerto'),(74,'340415','Donokerto'),(75,'340415','Girikerto'),(76,'340415','Wonokerto'),(77,'340416','Purwobinangun'),(78,'340416','Candibinangun'),(79,'340416','Harjobinangun'),(80,'340416','Pakembinangun'),(81,'340416','Hargobinangun'),(82,'340417','Argomulyo'),(83,'340417','Wukirsari'),(84,'340417','Glagaharjo'),(85,'340417','Kepuharjo'),(86,'340417','Umbulharjo'),(87,NULL,'elosss'),(88,NULL,'elossss'),(89,NULL,'elos kelurahan'),(93,'340422','elos je');
/*!40000 ALTER TABLE `tblkelurahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkk`
--

DROP TABLE IF EXISTS `tblkk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkk` (
  `idtblkk` int(11) NOT NULL AUTO_INCREMENT,
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
  `disabilitas` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblkk`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkk`
--

LOCK TABLES `tblkk` WRITE;
/*!40000 ALTER TABLE `tblkk` DISABLE KEYS */;
INSERT INTO `tblkk` VALUES (1,'12345654323','Elos Ananto','124323123','banyuwangi','1992-10-08','istri','laki-laki',1,'belum_menikah','kuli coding amatiran','indonesia',3,1,'004','05','adf',0,'2017-10-06 09:06:22',0),(2,'983726555362','elos ananto','574635526','Kota Tangerang','1995-07-13','suami','laik-laki',1,'menikah','kuli','Indonesia',5,1,'03','39','asddfgf',0,'2017-10-05 14:16:02',0),(3,'234567345','Agus suryanto2','234578','banyuwangi','1991-09-11','suami','perempuan',3,'menikah','key user','f',5,2,'2','3','zxv',0,'2017-10-05 14:37:00',0),(4,'2345673451','Agus suryanto21','2345781','banyuwangi1','1989-01-26','suami','perempuan',3,'menikah','key user','f1',5,3,'21','31','zxv1',0,'2017-10-06 09:05:27',0),(5,'a213','misnan','123123','Tangerang','1933-11-16','suami','laki-laki',1,'menikah','petani','Indonesia',2,4,'2','2','asd',0,'2017-11-05 12:28:05',0),(6,'ww34567','dikau mardika','wddf','Tangerang','1963-11-01','suami','laki-laki',1,'belum_menikah','eeedfg','Indonesia',2,5,'3','1','dfs',1,'2017-11-05 12:32:19',0),(7,'1234567','anwar hadi','1234','banyuwangi','1988-11-09','suami','laki-laki',2,'menikah','programmer','indonesia',6,1,'32','3','',0,'2017-11-13 18:05:19',0),(8,'1234','alvin','1234','banyuwangi','1978-11-15','suami','laki-laki',1,'belum_menikah','kuli','indonesia',55,14,'2','1','ad',0,'2017-11-15 13:23:43',0),(9,'123','asd','2435','Kota Tangerang','2000-11-08','suami','laki-laki',1,'menikah','kuli','Indonesia',1,6,'3','4','sf',0,'2017-11-15 13:48:33',0);
/*!40000 ALTER TABLE `tblkk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkk_detail`
--

DROP TABLE IF EXISTS `tblkk_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkk_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
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
  `disabilitas` tinyint(1) DEFAULT '0' COMMENT '0 = normal, 1 = difabel',
  `deskripsi` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`idtblkk`),
  KEY `idtblkk` (`idtblkk`),
  CONSTRAINT `tblkk_detail_ibfk_1` FOREIGN KEY (`idtblkk`) REFERENCES `tblkk` (`idtblkk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkk_detail`
--

LOCK TABLES `tblkk_detail` WRITE;
/*!40000 ALTER TABLE `tblkk_detail` DISABLE KEYS */;
INSERT INTO `tblkk_detail` VALUES (4,1,1,NULL,NULL,'qwe123','elos ananto Junior','Kota Tangerang','1991-11-29','anak','perempuan',1,'belum_menikah','123','Indonesia',1,'-','2017-11-15 13:54:11',0),(6,1,2,3,2,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-10-07 09:14:41',0),(7,1,1,NULL,NULL,'asd','Obok Sutini','ads','2001-10-10','Istri','laki-laki',2,'menikah','asd','asd',1,'asd','2017-10-07 09:15:14',0),(8,5,1,NULL,NULL,'234312','elos ananto','banyuwangi','1992-09-17','anak','laki-laki',1,'belum_menikah','programmer','indonesia',1,'','2017-11-05 12:29:13',0),(9,2,1,NULL,NULL,'1234','hadi asasa','banyuwangi','1957-11-06','istri','perempuan',1,'menikah','ksadj','indonesia',1,'-','2017-11-15 01:13:15',0),(10,2,1,NULL,NULL,'123456','asd','jakarta','1998-11-12','anak','laki-laki',2,'belum_menikah','asr','indonesia',0,'','2017-11-13 17:38:18',0),(11,2,2,1,11,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 17:38:26',0),(12,2,2,2,3,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 17:38:33',0),(13,2,2,3,4,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 17:38:40',0),(15,6,1,NULL,NULL,'2134','ali sadikin','jakarta','1984-11-16','anak','laki-laki',2,'belum_menikah','asd','indonesia',1,'asd','2017-11-13 17:43:49',0),(16,6,2,2,2,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 17:43:57',0),(17,6,2,3,4,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 17:44:06',0),(18,5,1,NULL,NULL,'123','elos ananto','Kota Tangerang','1992-09-17','anak','laki-laki',1,'belum_menikah','programmer','Indonesia',0,'','2017-11-13 17:45:01',0),(19,5,2,2,4,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 17:45:08',0),(20,5,2,1,22,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 17:45:16',0),(21,7,1,NULL,NULL,'213444221','ruben','bca','2002-11-07','istri','perempuan',1,'belum_menikah','indo','indonesia',0,'','2017-11-13 18:06:01',0),(22,7,1,NULL,NULL,'948883','rian','tangerang','2017-11-01','suami','perempuan',2,'belum_menikah','indonesi','indonesia',0,'','2017-11-13 18:06:49',0),(23,7,2,1,2,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 18:06:55',0),(24,7,2,3,4,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 18:07:02',0),(25,7,2,2,1,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-13 18:07:11',0);
/*!40000 ALTER TABLE `tblkk_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkomunitas`
--

DROP TABLE IF EXISTS `tblkomunitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkomunitas` (
  `idtblkomunitas` int(11) NOT NULL AUTO_INCREMENT,
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
  `create_user` int(4) DEFAULT NULL,
  PRIMARY KEY (`idtblkomunitas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkomunitas`
--

LOCK TABLES `tblkomunitas` WRITE;
/*!40000 ALTER TABLE `tblkomunitas` DISABLE KEYS */;
INSERT INTO `tblkomunitas` VALUES (3,'nama ssb1','alamat1',15,340403,'20',40,'track, jogging, sena','elos1','081223124121','021348277121','60','-7.720411965740646','110.34669994918215','SMA','keterangan1','tsunami, gorilla1','2017-09-28 00:00:00','coba','0',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblkomunitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkrb`
--

DROP TABLE IF EXISTS `tblkrb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkrb` (
  `idtblkrb` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblkrb`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkrb`
--

LOCK TABLES `tblkrb` WRITE;
/*!40000 ALTER TABLE `tblkrb` DISABLE KEYS */;
INSERT INTO `tblkrb` VALUES (1,'Level 1','Level 1',0),(2,'Level 2','Level 2',0),(3,'Level 3','Level 3',0),(4,'Level 4','Level 4',0),(5,'Level 5','Level 5',0);
/*!40000 ALTER TABLE `tblkrb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllaporan`
--

DROP TABLE IF EXISTS `tbllaporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllaporan` (
  `idtbllaporan` int(11) NOT NULL AUTO_INCREMENT,
  `nir` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `bencana` int(11) DEFAULT NULL,
  `rt` varchar(10) DEFAULT NULL,
  `rw` varchar(10) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `flag` int(1) DEFAULT '0' COMMENT '0 = not approve, 1 = approve, 2 = hoax',
  `status` varchar(20) DEFAULT NULL COMMENT '0 = blm ditangani, 1 = proses, 2 = hold, 3 = selesai',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `dampak` text,
  `rangkuman_korban` text,
  `notelp` varchar(20) DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `flag_tracking` int(11) DEFAULT '0',
  `ditracking` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbllaporan`),
  KEY `nir` (`nir`,`nama`,`dusun`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllaporan`
--

LOCK TABLES `tbllaporan` WRITE;
/*!40000 ALTER TABLE `tbllaporan` DISABLE KEYS */;
INSERT INTO `tbllaporan` VALUES (2,'12345','asdf',2,'wd',1,'2','3','-7.800832','110.32194500000003',1,'hold','2017-09-14 09:41:18',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(3,'1234','elos ananto',2,'sd',1,'004','03','-7.7668463','110.28024299999993',1,'proses','2017-09-14 14:57:39',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(4,'123','Elos',2,'as',1,'003','02','-7.800812','110.32194500000003',1,'proses','2017-09-15 22:02:06',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(5,'123','hadi',3,'jambe',1,'2','4','-7.785490899999999','110.29364699999996',2,'selesai','2017-09-29 11:00:24',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(6,'123','Elos',4,'gusua',1,'04','05','-7.767048138404961','110.330083749707',1,'proses','2017-10-07 09:37:22',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(7,'123123','Elos Ananto',29,'df',7,'3','1','-7.732753599999999','110.34577560000002',1,'hold','2017-10-07 10:38:38',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(8,'312','Agus suryanto',53,'jamberejo',1,'2','4','-7.682389799999999','110.42918789999999',1,'proses','2017-10-07 10:39:12',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(9,'3511','Judiatin',2,'siri',9,'2','3','-7.8151385','110.44706300000007',1,'proses','2017-10-07 10:40:01',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(10,'213','Jgas',25,'sd',6,'4','2','-7.7226915','110.28917899999999',1,'proses','2017-10-07 10:41:43',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(11,'','Galih',19,'da',1,'3','4','-7.728045700000001','110.23258620000001',1,'selesai','2017-10-07 10:47:23',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(13,'','Agni 21',17,'sdsd',1,'21','21','-7.747745200000001','110.25045720000003',1,'selesai','2017-10-08 00:56:19',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(14,'kejadian','elossssss',24,'Elos',9,'3','3','-7.718800300000001','110.3159875',1,'proses','2017-10-10 13:54:26',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(15,'123','Elos Ananto 2',1,'ad',3,'2','3','-7.8122949','110.29811510000002',1,'proses','2017-11-03 13:11:49',NULL,NULL,NULL,'Ini Contoh Dampak Yang Nyata Apa Adanya','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(16,'','Suryanto',24,'cabakan',3,'12','13','-7.6929434004768975','110.30019465332032',1,'selesai','2017-11-03 23:04:33',NULL,NULL,NULL,' ssdsdsdsdsd','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(17,'','Ditta',2,'asasas',4,'23','22','-7.800812','110.32194500000003',1,'selesai','2017-11-03 23:05:45',NULL,NULL,NULL,'Pohon mahoni tumbang menimpa jaringan listrik','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(18,'','Dikau',55,'Plosokuning 2',1,'09','004','-7.73369','110.40419',1,'selesai','2017-11-07 20:39:17',NULL,NULL,NULL,'Pohon pete tumbang menimpa jaringan listrik','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(19,'','Dicuk',3,'sssss',1,'12','12','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-09 14:32:52',NULL,NULL,NULL,NULL,'korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(20,'','SR',24,'Mriyan Wetan',1,'0','0','-7.718800300000001','110.3159875',2,NULL,'2017-11-09 14:41:52',NULL,NULL,NULL,NULL,'korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(21,'0911201701','Bayu 7.08',24,'Mriyan',1,'5','22','-7.718800300000001','110.3159875',2,NULL,'2017-11-09 15:53:29',NULL,NULL,NULL,NULL,'korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(22,'','PUSDALOPS',26,'Mriyan Wetan',1,'5','22','-7.703964599999999','110.30407250000007',1,'selesai','2017-11-09 18:04:17',NULL,NULL,NULL,'Pohon kelapa tumbang menimpa rumah Bp. Nasrudin','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(23,'','PUSDALOPS',26,'Daplokan',1,'3','17','-7.703964599999999','110.30407250000007',1,'selesai','2017-11-09 18:04:59',NULL,NULL,NULL,'Pohon mlinjo tumbang menutup akses jalan','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(24,'','PUSDALOPS',26,'Mriyan',1,'0','0','-7.703964599999999','110.30407250000007',1,'selesai','2017-11-09 18:05:49',NULL,NULL,NULL,'Pohon Nangka  30cm Tumbang melintang dijalan','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(25,'','PUSDALOPS',23,'margodadi',1,'0','0','-7.7354012','110.29215769999996',1,'selesai','2017-11-09 18:06:52',NULL,NULL,NULL,'pohon rambutan tumbang menimpa rumah bapak Lurah','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(26,'','PUSDALOPS',23,'Kasuran',1,'1','27','-7.7354012','110.29215769999996',1,'selesai','2017-11-09 18:07:33',NULL,NULL,NULL,'Pohon Mindi tumbang menimpa rumah bapak Subarman','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(27,'','PUSDALOPS',23,'mranggen',1,'0','0','-7.7354012','110.29215769999996',1,'proses','2017-11-09 18:08:37',NULL,NULL,NULL,'Pohon beringin tumbang menimba bangunan di tuk Sibedug ( pemotongan akan di lakukan besok jumat 10-11-2017)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(28,'','PUSDALOPS',23,'mranggen',1,'1','21','-7.7354012','110.29215769999996',1,'selesai','2017-11-09 18:09:21',NULL,NULL,NULL,'Pohon mlinjo tumbang menimpa rumah','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(29,'','PUSDALOPS',13,'Barepan',1,'5','2','-7.7943631','110.24450019999995',1,'selesai','2017-11-09 18:11:02',NULL,NULL,NULL,'POhon kelapa tumbang menimpa rumah','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(30,'','PUSDALOPS',25,'Bantulan',1,'2','24','-7.7226915','110.28917899999999',1,'selesai','2017-11-09 18:11:59',NULL,NULL,NULL,'pohon tumbang menimpa rumah dan jaringan listrik','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(31,'','PUSDALOPS',25,'Bantulan',1,'2','24','-7.7226915','110.28917899999999',1,'selesai','2017-11-09 18:13:16',NULL,NULL,NULL,'Pohon munggur 30 cm tumbang menutup akses jalan ','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(32,'','PUSDALOPS',30,'Jembangan',1,'3','9','-7.743921500000001','110.32790260000002',1,'selesai','2017-11-09 18:32:14',NULL,NULL,NULL,'Pohon tumbang menimpa rumah Ibu Sutimah dan beberapa atap rumah terbang.','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(33,'','puq',26,'Krapyak',1,'5','8','-7.703964599999999','110.30407250000007',1,'selesai','2017-11-09 18:32:50',NULL,NULL,NULL,'Pohon tumbang menimpa rumah bapak suyono (55)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(34,'','PUSDALOPS',24,'xxx',1,'4','22','-7.718800300000001','110.3159875',1,'selesai','2017-11-09 18:34:06',NULL,NULL,NULL,'Atap rumah berterbangan milik bapak Ponidi (43)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(35,'','PUSDALOPS',23,'Pete',1,'2','25','-7.7354012','110.29215769999996',1,'selesai','2017-11-09 18:34:35',NULL,NULL,NULL,'Pohon popohan tumbang menimpa rumah bapak Kuwaji (75)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(36,'','PUSDALOPS',23,'Mranggen',1,'1','21','-7.7354012','110.29215769999996',1,'proses','2017-11-09 18:35:14',NULL,NULL,NULL,'Pohon tumbang menimpa rumah bp antok ( Penanganan di lanjut besok jumat 10-11-2017)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(37,'','PUSDALOPS',23,'Mranggen',1,'3','22','-7.7354012','110.29215769999996',1,'selesai','2017-11-09 18:36:04',NULL,NULL,NULL,'Pohon mlinjo 20 cm dan pohon jambu 15 cm tumbang menimpa rumah ibu supini (63)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(38,'','PUSDALOPS',23,'Mranggen',1,'1','21','-7.7354012','110.29215769999996',1,'selesai','2017-11-09 18:36:36',NULL,NULL,NULL,'Pohon pete 30 cm tumbang menimpa dapur rumah bapak suparno (55)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(39,'','PUSDALOPS',23,'mranggen',1,'1','21','-7.7354012','110.29215769999996',1,'selesai','2017-11-09 18:37:15',NULL,NULL,NULL,'Pohon semutan 50 cm Tumbang menimpa rumah ibu sumirah (72)','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(40,'','PUSDALOPS',25,'xxx',1,'0','0','-7.7226915','110.28917899999999',1,'selesai','2017-11-09 18:51:06',NULL,NULL,NULL,'Pohon Tumbang menutup akses jalan dan menimpa rumah','korban semua berasal dari kabupaten sleman',NULL,NULL,0,NULL),(41,'asd','haris T',2,'asd',5,'3','3','-7.800812','110.32194500000003',2,NULL,'2017-11-13 13:02:01','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(42,'','dicuk',4,'gamping tengah',1,'1','12','-7.7693443','110.33386029999997',1,'proses','2017-11-13 18:37:19','2',NULL,NULL,'Pohon tumbang menimpa jaringan Listrik','-',NULL,NULL,0,NULL),(43,'','Nurcahyo',55,'Plosokuning 5',1,'25','10','-7.734943400000001','110.40535499999999',1,'belum_di_tangani','2017-11-13 19:35:57','2',NULL,NULL,'Pohon Diameter 30 tumbang menimpa jaringan listrik dan rumah','-',NULL,NULL,0,NULL),(44,'','Aris Triyanto',55,'Gantalan',4,'2','1','-7.716232042371264','110.41840126464842',1,'selesai','2017-11-14 21:52:51','2',NULL,NULL,'Tanah longsor menimpa rumah dan jaringan listrik','-',NULL,NULL,0,NULL),(45,'','Diko',3,'Tunggul',5,'2','12','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-14 22:33:00','6',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(46,'','Fajar Angga K',55,'17',1,'25','10','-7.7356','110.4066',2,'proses','2017-11-15 12:09:30',NULL,NULL,NULL,'Pohon tumbang menimpa rumah dan jaringan listrik','-',NULL,NULL,0,NULL),(47,'3404121109910002','MBAK ATUN',55,'18',4,'12','6','-7.715551613752865','110.41668465087889',1,'SELESAI','2017-11-15 16:21:18','2','2017-11-19 13:03:12','2','tanah longsor menyebabkan rumah tertimbun da jaringan listrik putus','-','null',NULL,0,NULL),(48,'','Karina',55,'13',1,'1','2','-7.734943400000001','110.40535499999999',1,'selesai','2017-11-15 16:28:28',NULL,NULL,NULL,'Pohon Tumbang Menimpa Jaringan listrik dan rumah','Tumijo ( 70), di rujuk ke RS A',NULL,NULL,0,NULL),(49,'1234','haris Triyanto',1,'6',1,'3','4','-7.8122949','110.29811510000002',1,'proses','2017-11-16 08:55:36',NULL,NULL,NULL,'angin kencang berhembus pada mantan','korban dari sunda mengalami ',NULL,NULL,0,NULL),(50,'','',55,'15',3,'12','09','-7.734943400000001','110.40535499999999',1,'selesai','2017-11-16 21:59:40','4',NULL,NULL,'Tidak ada dampak lingkungan','Bp. Paijo ( 78) Luka ringan, Dirujuk ke RS Sumberwaras',NULL,NULL,0,NULL),(51,'','',1,'22',3,'4','3','-7.8122949','110.29811510000002',1,'proses','2017-11-18 01:22:00','2',NULL,NULL,'dampak ini mengakibatkan kerusakan fatal pada selansang harapan yang akan mati','dimas tertabrak mantan yang kzl',NULL,NULL,0,NULL),(52,'','',3,'9',4,'2','1','-7.784779500000001','110.33386029999997',1,'hold','2017-11-18 01:23:30','2',NULL,NULL,'2w','edsasd',NULL,NULL,0,NULL),(53,'','',4,'10',7,'2','1','-7.7693443','110.33386029999997',1,'proses','2017-11-18 01:24:46','2',NULL,NULL,'dampak ini mengakibatkan kerusakan fatal pada selansang harapan yang akan mati','korban dari sunda mengalami ',NULL,NULL,0,NULL),(54,'','',1,'19',3,'3','2','-7.786783901350407','110.39836534414064',1,'SELESAI','2017-11-18 01:27:19','2','2017-11-19 09:38:48',NULL,'','','null',NULL,0,NULL),(55,'','',4,'10',5,'1','1','-7.664218314876612','110.37849225800778',2,'proses','2017-11-18 01:30:11','2',NULL,NULL,'dampak ini mengakibatkan kerusakan fatal pada selansang harapan yang akan mati','ads',NULL,NULL,0,NULL),(56,'123123','test',1,'20',4,'11','11','-7.8122949','110.29811510000002',2,NULL,'2017-11-18 11:21:55','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(57,'','bb',2,'5',1,'88','88','-6.2014252','106.5298471',2,'proses','2017-11-18 12:25:21','Android',NULL,NULL,NULL,NULL,'99','869631025512122',0,NULL),(58,'g','b',2,'2',1,'55','5','-6.2016259','106.5299611',2,'proses','2017-11-18 12:33:58','Android',NULL,NULL,NULL,NULL,'55','869631025512122',0,NULL),(59,'','masykur',80,'0',1,'01','02','-7.6672491','110.4192839',1,'selesai','2017-11-18 13:16:50','Android',NULL,NULL,'Pohon Tumbang HOek\"','-','0817271794','356432053304403',0,NULL),(60,'123','VVV',2,'5',1,'5','8','-6.2014252','106.5298471',2,'BELUM DI TANGANI','2017-11-18 13:49:59','Android','2017-11-19 07:51:38',NULL,'','','9','869631025512122',0,NULL),(61,'1404150806710003','masykur\n',73,'0',1,'01','21','-7.652073','110.3521785',2,'proses','2017-11-19 11:22:59','Android',NULL,NULL,NULL,NULL,'0817271794','356432053304403',0,NULL),(62,'','FAHRI',1,'19',1,'1','1','-7.8122949','110.29811510000002',2,'BELUM DI TANGANI','2017-11-19 12:42:29','2','2017-11-19 13:05:33',NULL,'','','null',NULL,0,NULL),(63,'dasd','aaabbbb',2,'1',3,'ss','ss','-7.800812','110.32194500000003',2,NULL,'2017-11-19 13:32:11','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(64,'das','dsada',1,'19',3,'dsa','dsa','-7.8122949','110.29811510000002',2,NULL,'2017-11-19 13:33:02','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(65,'ads','das',2,'3',4,'231','312','-7.800812','110.32194500000003',2,NULL,'2017-11-19 13:33:47','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(66,'das','das',3,'8',4,'23','321','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:34:05','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(67,'','junirin',1,'19',1,'1','3','-7.7382925','110.4059522',2,'proses','2017-11-19 13:34:37','Android',NULL,NULL,NULL,NULL,'656332566','867244026404133',0,NULL),(68,'das','dsadasd',3,'9',4,'3','31','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:34:57','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(69,'das','dsadasd',3,'9',4,'3','31','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:35:11','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(70,'das','dsadasd',3,'9',4,'3','31','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:36:04','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(71,'das','dsadasd',3,'9',4,'3','31','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:36:59','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(72,'das','dsadasd',3,'9',4,'3','31','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:37:02','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(73,'das','DSADASD',3,'9',4,'3','31','-7.784779500000001','110.33386029999997',1,'SELESAI','2017-11-19 13:37:36','2','2017-11-19 13:39:33',NULL,'banjir menghanyutkan jembatan pulorejo','-','null',NULL,0,NULL),(74,'das','dsadasd',1,'19',4,'3','31','-7.8122949','110.29811510000002',2,NULL,'2017-11-19 13:38:37','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(75,'wqqe','DIKO MARDIKA',2,'3',4,'ewq','ewq','-7.800812','110.32194500000003',2,NULL,'2017-11-19 13:39:11','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(76,'dsa','dsadasd das',3,'8',4,'qe','eq','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:40:12','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(77,'dsa','dsadasd das',3,'8',4,'qe','eq','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:40:43','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(78,'dsa','dsadasd das',3,'8',4,'qe','eq','-7.784779500000001','110.33386029999997',2,NULL,'2017-11-19 13:41:07','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(79,'b','Agustin te',2,'1',3,'5','5','-6.2014252','106.5298471',2,'proses','2017-11-19 13:46:13','Android',NULL,NULL,NULL,NULL,'54649','869631025512122',0,NULL),(80,'','thanks fir',2,'5',1,'55','56','-6.2014252','106.5298471',2,'proses','2017-11-19 13:48:57','Android',NULL,NULL,NULL,NULL,'385','869631025512122',0,NULL),(81,'','THANKS FIR',2,'5',1,'55','56','-6.2014252','106.5298471',1,'proses','2017-11-19 13:49:19','Android','2017-11-20 10:07:10',NULL,'','','385','869631025512122',0,NULL),(82,'','THANKS FIR',2,'5',1,'55','56','-6.2014252','106.5298471',2,'PROSES','2017-11-19 13:49:24','Android','2017-11-20 07:58:05',NULL,'','','385','869631025512122',0,NULL),(83,'','jfa gags gsgs',2,'5',4,'','','-6.2014252','106.5298471',2,'proses','2017-11-19 13:50:35','Android',NULL,NULL,NULL,NULL,'646','869631025512122',0,0),(84,'','SALSA',2,'1',1,'1','2','-7.800812','110.32194500000003',1,'SELESAI','2017-11-19 14:33:57','2','2017-11-19 23:44:57',NULL,'','','null',NULL,0,NULL),(85,'','FAJAR ANGGA',1,'19',1,'12','11','-7.8122949','110.29811510000002',1,'SELESAI','2017-11-19 22:30:38','4','2017-11-19 23:44:12',NULL,'','','null',NULL,0,NULL),(86,'','PAK GTO',33,'25',10,'1','2','-7.766646520366883','110.43130879311525',1,'SELESAI','2017-11-19 22:46:59','4','2017-11-19 23:51:42',NULL,'','','null',NULL,0,NULL),(87,'','ANANG DIDIK',37,'26',4,'12','12','-7.8045373952294','110.44366585495607',1,'BELUM DI TANGANI','2017-11-19 23:58:52','4','2017-11-20 00:35:57',NULL,'','ngelehhh','null',NULL,0,NULL),(88,'3414150806710003','AAA',73,'0',1,'17','17','-7.6672534','110.4192737',1,'proses','2017-11-20 00:14:20','Android','2017-11-20 08:27:23',NULL,'','kurang sarapan','1234567','356432053304403',0,NULL),(89,'3414150806710003','AAAAH',73,'0',1,'','','-7.6672534','110.4192737',2,'proses','2017-11-20 00:19:34','Android','2017-11-20 00:46:15',NULL,'','klelat klelet','085123456','356432053304403',1,2),(90,'ewq','EQW',2,'1',1,'22','22','-7.800812','110.32194500000003',1,'PROSES','2017-11-20 11:24:34','2','2017-11-20 04:24:54',NULL,'','','null',NULL,0,NULL),(91,'','Sidor',1,'22',4,'1','14','-7.8122949','110.29811510000002',1,'selesai','2017-11-20 11:52:13','4','2017-11-22 13:21:58','4','-','-',NULL,NULL,0,NULL),(92,'','Anang',1,'20',1,'2','12','-7.8122949','110.29811510000002',2,NULL,'2017-11-22 13:22:36','4',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(93,'','Asep',1,'19',3,'1','3','-7.8122949','110.29811510000002',2,NULL,'2017-11-22 13:33:45','4',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(94,'1234','Elos ananto',2,'4',4,'2','2','-7.800812','110.32194500000003',1,'proses','2017-11-22 15:16:59','2','2017-11-22 15:19:15','2','setelah terjadi hujan selama 2 hari berturut turut','tidak ada korban diluar desa',NULL,NULL,0,NULL),(95,'','Atun',55,'14',1,'12','11','-7.734943400000001','110.40535499999999',1,'proses','2017-11-22 15:23:02','4','2017-11-22 15:23:58','4','-','-',NULL,NULL,0,NULL),(96,'','MUHAMMAD MASYKUR',80,'27',1,'12','22','-7.6570126','110.42322960000001',1,'SELESAI','2017-11-22 15:50:48','4','2017-11-22 09:22:51',NULL,'','','null',NULL,0,NULL),(97,'','ATUN',1,'19',4,'3','22','-7.8122949','110.29811510000002',1,'SELESAI','2017-11-22 16:01:37','4','2017-11-22 09:24:22',NULL,'','','null',NULL,1,NULL),(98,'340412114455660002','Ngatijan',1,'19',4,'23','24','-7.8122949','110.29811510000002',2,NULL,'2017-11-28 14:47:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(99,'','DIKAU',55,'18',3,'12','20','-6.9779276','110.4134661',1,'selesai','2017-12-16 15:06:40','Android','2017-12-16 22:20:23','4','xxxx','0','085643512213','867244026404133',0,0),(100,'','Sarjono  Bayu 7.24',48,'28',1,'0','0','-7.716111111111111','110.45111111111112',1,'selesai','2017-12-20 17:19:54','4','2017-12-21 09:07:30','4','Pohon sonokeling diameter 30cm, Tumbang menutup akses jalan kaliwaru -  Plataran.','0',NULL,NULL,0,NULL),(101,'','Taufiq Efendi  Bayu 7.26',61,'29',1,'06','19','-7.697777777777778','110.33916666666666',1,'selesai','2017-12-20 17:21:54','4','2017-12-20 19:09:38','4','3 pohon sengon diameter 30 cm tumbang menutup akses jalan kampung dan menimpa  kabel listrik PLN','0',NULL,NULL,0,NULL),(102,'','Sarjono  Bayu 7.24',48,'28',1,'0','0','-7.717777777777778','110.45222222222222',1,'selesai','2017-12-20 17:22:57','4','2017-12-20 18:12:25','4','1 pohon talok/kersen Ø 25 cm tumbang menutup akses jalan Kaliwaru-Jomblang','0',NULL,NULL,0,NULL),(103,'','Sarjono  Bayu 7.24',48,'30',1,'0','0','-7.728888888888889','110.45277777777778',1,'selesai','2017-12-20 17:24:38','4','2017-12-20 18:16:37','4','1 pohon waru Ø 50 cm tumbang menutup akses jalan Sidorejo-Salakan','0',NULL,NULL,0,NULL),(104,'','Sarjono  Bayu 7.24',48,'30',1,'0','0','-7.728888888888889','110.45305555555557',1,'selesai','2017-12-20 17:25:15','4','2017-12-20 18:14:43','4','7 lembar seng 0,9 x 3 meter2 beterbangan','0',NULL,NULL,0,NULL),(105,'','Taufiq Efendi  Bayu 7.26',18,'31',1,'4','12','-7.7475','110.23371',1,'selesai','2017-12-20 18:20:51','4','2017-12-21 09:08:21','4','Pohon munggur diameter 50 cm tumbang melintang di jalan kampung penghubung dua kampung','0',NULL,NULL,0,NULL),(106,'','Asep Budi S  Bayu 7.28',52,'32',4,'24','01','-7.740299','110.442760',1,'proses','2017-12-20 18:32:59','4','2017-12-20 19:31:02','4','Hujan yg begitu deras mengakibatkan arus air sangat deras dan tanah mulai  tergerus dan longsor dengan Volume Panjang  longsor: 15m,t:4, Saat ini longsoran sudah ditutup Terpal.','0',NULL,NULL,0,NULL),(107,'','Taufiq Efendi  Bayu 7.26',18,'33',10,'4','28','-7.736944444444444','110.2475',1,'selesai','2017-12-20 18:49:22','4','2017-12-20 19:24:56','4','keluarga dan warga sekitar jam -+ 14:00 wib melakukan pecarian korban di sekitar rumah di kolam ikan dan sekitar sumur . Karena korban sekitar jam -+ 11:00 korban pergi dari rumah. Untuk korban mempunyai riwayat penyakit setroke ringan dan katarak . Setelah melakukan pencarian di daerah sumur korban di ketemukan oleh warga kondisi meniggal dunia. Di mungkin kan korban saat memngambil air di sumur terpeleset dan jatuh ke dalam sumur . Kondisi sumur kedalaman 5 meter untuk jarak air dengan birir sungai 1 m. Korban meniggal sekitar 3 jam sudah terkondisi dan di evakuasi mandiri oleh warga dengan tali timba. Dan laporan ke polsek dan pukesmas setelah di lakukan visum oleh pihak puskesmas dan di kembalikan ke keluarga.','Nama :Parijo, Usia : 70 Th',NULL,NULL,0,NULL),(108,'','test',1,'19',3,'11','11','-7.8122949','110.29811510000002',0,NULL,'2017-12-21 07:43:11','2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `tbllaporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllaporan_detail`
--

DROP TABLE IF EXISTS `tbllaporan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllaporan_detail` (
  `idtbllaporan_det` int(11) NOT NULL AUTO_INCREMENT,
  `idtbllaporan` int(11) DEFAULT NULL,
  `idtbldampak` int(11) DEFAULT NULL,
  `jumlah` int(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`idtbllaporan_det`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllaporan_detail`
--

LOCK TABLES `tbllaporan_detail` WRITE;
/*!40000 ALTER TABLE `tbllaporan_detail` DISABLE KEYS */;
INSERT INTO `tbllaporan_detail` VALUES (5,4,4,1,'2017-10-28 10:19:23'),(6,4,3,1,'2017-10-28 10:19:23'),(7,4,9,2,'2017-10-28 10:19:23'),(8,4,10,3,'2017-10-28 10:19:23'),(9,4,12,1,'2017-10-28 10:19:23'),(10,4,25,2,'2017-10-28 10:19:24'),(11,4,28,200000,'2017-10-28 10:19:24'),(12,6,1,1,'2017-10-28 11:05:28'),(13,6,2,2,'2017-10-28 11:05:28'),(14,6,17,4,'2017-10-28 11:05:28'),(15,6,16,2,'2017-10-28 11:05:28'),(16,6,27,1,'2017-10-28 11:05:28'),(17,3,3,1,'2017-10-28 11:06:04'),(18,3,6,2,'2017-10-28 11:06:04'),(19,3,9,1,'2017-10-28 11:06:04'),(20,3,11,1,'2017-10-28 11:06:04'),(21,3,28,2000000,'2017-10-28 11:06:04'),(22,7,3,2,'2017-10-28 11:07:10'),(23,7,5,1,'2017-10-28 11:07:11'),(24,7,14,1,'2017-10-28 11:07:11'),(25,14,22,2,'2017-10-28 11:07:39'),(26,14,27,1,'2017-10-28 11:07:39'),(27,14,28,100000,'2017-10-28 11:07:40'),(28,11,1,1,'2017-10-28 11:08:25'),(29,11,4,1,'2017-10-28 11:08:25'),(30,11,11,2,'2017-10-28 11:08:25'),(31,11,6,2,'2017-10-28 11:08:25'),(32,11,28,200000,'2017-10-28 11:08:25'),(33,10,13,1,'2017-10-28 11:14:53'),(34,10,14,2,'2017-10-28 11:14:53'),(35,10,27,1,'2017-10-28 11:14:53'),(36,10,28,4000000,'2017-10-28 11:14:53'),(37,9,28,200000000,'2017-10-29 17:39:49'),(38,15,1,1,'2017-11-03 14:59:06'),(39,17,3,1,'2017-11-03 23:14:27'),(40,17,5,3,'2017-11-03 23:14:27'),(41,16,6,100,'2017-11-03 23:19:18'),(42,18,5,1,'2017-11-07 20:40:29'),(43,18,11,1,'2017-11-07 20:40:29'),(44,22,6,1,'2017-11-09 18:18:52'),(45,22,5,1,'2017-11-09 18:18:52'),(46,23,5,1,'2017-11-09 18:19:55'),(47,24,5,1,'2017-11-09 18:21:07'),(48,25,5,1,'2017-11-09 18:22:09'),(49,25,6,1,'2017-11-09 18:22:09'),(50,26,5,1,'2017-11-09 18:23:08'),(51,26,6,1,'2017-11-09 18:23:08'),(52,27,5,1,'2017-11-09 18:25:12'),(53,28,5,1,'2017-11-09 18:26:17'),(54,28,6,1,'2017-11-09 18:26:17'),(55,29,5,1,'2017-11-09 18:27:28'),(56,29,6,1,'2017-11-09 18:27:28'),(57,30,5,1,'2017-11-09 18:28:43'),(58,30,6,1,'2017-11-09 18:28:43'),(59,30,11,1,'2017-11-09 18:28:43'),(60,31,5,3,'2017-11-09 18:30:23'),(61,32,5,2,'2017-11-09 18:39:27'),(62,32,6,7,'2017-11-09 18:39:27'),(63,33,5,1,'2017-11-09 18:41:11'),(64,33,6,1,'2017-11-09 18:41:11'),(65,39,5,1,'2017-11-09 18:42:28'),(66,39,6,1,'2017-11-09 18:42:28'),(67,38,5,1,'2017-11-09 18:43:39'),(68,38,6,1,'2017-11-09 18:43:39'),(69,37,5,2,'2017-11-09 18:45:09'),(70,37,6,1,'2017-11-09 18:45:09'),(71,36,5,1,'2017-11-09 18:46:43'),(72,36,6,1,'2017-11-09 18:46:43'),(73,35,5,1,'2017-11-09 18:47:44'),(74,35,6,1,'2017-11-09 18:47:44'),(75,34,6,1,'2017-11-09 18:48:44'),(76,40,5,1,'2017-11-09 18:51:50'),(77,40,6,1,'2017-11-09 18:51:50'),(78,42,5,1,'2017-11-13 18:39:11'),(79,42,6,1,'2017-11-13 18:39:11'),(80,43,6,1,'2017-11-13 19:37:25'),(81,43,11,1,'2017-11-13 19:37:25'),(82,44,7,1,'2017-11-14 22:13:43'),(83,44,11,1,'2017-11-14 22:13:43'),(84,46,11,1,'2017-11-15 12:11:30'),(85,46,6,1,'2017-11-15 12:11:30'),(86,48,11,1,'2017-11-15 16:33:44'),(87,48,6,1,'2017-11-15 16:33:44'),(88,48,4,1,'2017-11-15 16:33:44'),(89,49,1,2,'2017-11-16 08:57:24'),(90,49,5,4,'2017-11-16 08:57:24'),(91,49,28,200000,'2017-11-16 08:57:24'),(92,50,1,1,'2017-11-16 21:59:40'),(93,51,1,2,'2017-11-18 01:22:00'),(94,52,3,3,'2017-11-18 01:23:30'),(95,53,3,2,'2017-11-18 01:24:46'),(98,55,1,2,'2017-11-18 01:30:11'),(99,55,26,2,'2017-11-18 01:30:11'),(100,59,5,1,'2017-11-18 14:29:12'),(107,60,1,5,'2017-11-19 07:51:39'),(108,60,7,5,'2017-11-19 07:51:39'),(109,60,2,4,'2017-11-19 07:51:39'),(110,54,4,1,'2017-11-19 09:38:49'),(111,54,14,2,'2017-11-19 09:38:49'),(112,54,10,2222,'2017-11-19 09:38:49'),(113,47,6,1,'2017-11-19 13:03:13'),(114,47,11,1,'2017-11-19 13:03:13'),(115,73,22,1,'2017-11-19 13:39:34'),(116,73,6,1,'2017-11-19 13:39:34'),(119,81,5,2,'2017-11-20 10:07:11'),(120,81,28,500000,'2017-11-20 10:07:11'),(121,91,5,1,'2017-11-22 13:19:31'),(122,94,5,4,'2017-11-22 15:17:01'),(123,94,6,2,'2017-11-22 15:17:01'),(124,94,28,100000,'2017-11-22 15:17:01'),(130,96,5,1,'2017-11-22 09:22:52'),(131,96,6,1,'2017-11-22 09:22:52'),(132,97,6,1,'2017-11-22 09:24:23'),(133,97,5,1,'2017-11-22 09:24:23'),(136,99,6,1,'2017-12-16 15:17:11'),(137,99,7,2,'2017-12-16 15:17:11'),(138,100,5,1,'2017-12-20 17:33:53'),(139,101,5,3,'2017-12-20 17:50:45'),(140,101,11,1,'2017-12-20 17:50:45'),(141,102,5,1,'2017-12-20 17:51:47'),(142,103,5,1,'2017-12-20 17:52:28'),(143,104,6,1,'2017-12-20 17:53:06'),(144,105,5,1,'2017-12-20 18:20:52'),(145,106,21,120,'2017-12-20 18:33:00'),(146,106,26,1,'2017-12-20 18:33:00'),(147,107,4,1,'2017-12-20 18:49:24');
/*!40000 ALTER TABLE `tbllaporan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllaporan_galery`
--

DROP TABLE IF EXISTS `tbllaporan_galery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllaporan_galery` (
  `idgalery` int(20) NOT NULL AUTO_INCREMENT,
  `idtbllaporan` int(11) NOT NULL,
  `picture_name` varchar(100) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1 = picture, 2 = video',
  `size` int(40) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idgalery`,`idtbllaporan`),
  KEY `idtbllaporan` (`idtbllaporan`),
  CONSTRAINT `tbllaporan_galery_ibfk_1` FOREIGN KEY (`idtbllaporan`) REFERENCES `tbllaporan` (`idtbllaporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllaporan_galery`
--

LOCK TABLES `tbllaporan_galery` WRITE;
/*!40000 ALTER TABLE `tbllaporan_galery` DISABLE KEYS */;
INSERT INTO `tbllaporan_galery` VALUES (5,2,'bencana-alam-1-638.jpg',1,124663,'2017-09-14 09:41:18'),(6,2,'bencana-alam-gempa-bumi.jpg',1,125270,'2017-09-14 09:41:19'),(7,2,'bencana-alam-tanah-longsor.jpg',1,156188,'2017-09-14 09:41:19'),(8,2,'tanah-longsor__1460024431_202_67_45_391.jpg',1,26284,'2017-09-14 09:41:19'),(9,2,'838299.mpeg',2,13547092,'2017-09-14 09:41:19'),(10,3,'bencana-alam-1-638.jpg',1,124663,'2017-09-14 14:57:40'),(11,3,'bencana-alam-gempa-bumi.jpg',1,125270,'2017-09-14 14:57:40'),(12,3,'bencana-alam-tanah-longsor.jpg',1,156188,'2017-09-14 14:57:40'),(13,3,'tanah-longsor__1460024431_202_67_45_391.jpg',1,26284,'2017-09-14 14:57:40'),(14,3,'838299.mpeg',2,13547092,'2017-09-14 14:57:40'),(15,5,'Colouring_Pencils_Macro 1_32701970175_l.jpg',1,151354,'2017-09-29 11:00:26'),(16,5,'Colouring_Pencils_Macro_2_32549453462_l.jpg',1,114790,'2017-09-29 11:00:26'),(17,5,'Contadina_thailandese_34997024345_l.jpg',1,264720,'2017-09-29 11:00:27'),(18,5,'test.mp4',2,94190101,'2017-09-29 11:00:27'),(19,13,'Desert.jpg',1,845941,'2017-10-08 00:56:19'),(20,14,'15337234_1729110787407996_9183303737194577920_n.jpg',1,95341,'2017-10-10 13:54:27'),(21,14,'17495003_1921828098053457_1350137353343074304_n.jpg',1,44591,'2017-10-10 13:54:27'),(22,14,'YDTL3365_thm.mp4',2,9739156,'2017-10-10 13:54:27'),(23,15,'cat-untuk-wooden-furniture-1.jpg',1,242086,'2017-11-03 13:11:49'),(24,15,'d8a86ceb9d31f6f91a6eec24facac178.jpg',1,93111,'2017-11-03 13:11:49'),(25,16,'Koala.jpg',1,780831,'2017-11-03 23:04:33'),(26,17,'IMG-20170424-WA0031.jpg',1,107419,'2017-11-03 23:05:45'),(27,43,'DSCN2748.JPG',1,133236,'2017-11-13 19:35:57'),(28,44,'Desert.jpg',1,845941,'2017-11-14 21:52:51'),(29,45,'1510673527705-909790308.jpg',1,463389,'2017-11-14 22:33:00'),(30,46,'Lambang_Kabupaten_Sleman.png',1,299786,'2017-11-15 12:09:30'),(31,47,'Tulips.jpg',1,620888,'2017-11-15 16:21:18'),(32,48,'151073809694711931432.jpg',1,461725,'2017-11-15 16:28:28'),(33,50,'bpbd.png',1,245198,'2017-11-16 21:59:40'),(34,51,'jakarta.png',1,1828444,'2017-11-18 01:22:00'),(35,52,'material-wallpapers-16 (1).jpg',1,49102,'2017-11-18 01:23:30'),(36,53,'sac.png',1,1666795,'2017-11-18 01:24:46'),(37,54,'pos.png',1,67233,'2017-11-18 01:27:19'),(38,55,'bencana-alam-1-638.jpg',1,124663,'2017-11-18 01:30:11'),(39,55,'bencana-alam-gempa-bumi.jpg',1,125270,'2017-11-18 01:30:11'),(40,55,'bencana-alam-tanah-longsor.jpg',1,156188,'2017-11-18 01:30:11'),(41,55,'tanah-longsor__1460024431_202.67.45.39.jpg',1,26284,'2017-11-18 01:30:11'),(42,56,'catgentengbanner.png',1,371678,'2017-11-18 11:21:55'),(43,57,'p1_1510982634528.jpg',1,NULL,'2017-11-18 12:25:22'),(44,57,'p2_1510982634528.jpg',1,NULL,'2017-11-18 12:25:22'),(45,57,'v_1510982634528.mp4',2,NULL,'2017-11-18 12:25:22'),(46,58,'p1_1510983200236.jpg',1,NULL,'2017-11-18 12:33:58'),(47,58,'p2_1510983200236.jpg',1,NULL,'2017-11-18 12:33:58'),(48,58,'v_1510983200236.mp4',2,NULL,'2017-11-18 12:33:58'),(49,59,'p1_1510985659092.jpg',1,NULL,'2017-11-18 13:16:50'),(50,60,'p1_1510984217034.jpg',1,NULL,'2017-11-18 13:50:00'),(51,61,'p1_1511064967438.jpg',1,NULL,'2017-11-19 11:23:00'),(52,67,'p1_1511073224176.jpg',1,NULL,'2017-11-19 13:34:37'),(53,67,'p2_1511073224176.jpg',1,NULL,'2017-11-19 13:34:37'),(54,88,'p1_1511111524269.jpg',1,NULL,'2017-11-20 00:14:20'),(55,88,'p2_1511111524269.jpg',1,NULL,'2017-11-20 00:14:20'),(56,89,'p1_1511111872932.jpg',1,NULL,'2017-11-20 00:19:34'),(57,91,'Desert.jpg',1,845941,'2017-11-20 11:52:14'),(58,94,'tanah-longsor__1460024431_202_67_45_39.jpg',1,26284,'2017-11-22 15:17:01'),(59,94,'bencana-alam-1-638.jpg',1,124663,'2017-11-22 15:19:15'),(60,97,'Capture.PNG',1,365120,'2017-11-22 16:01:39'),(61,98,'Penguins.jpg',1,777835,'2017-11-28 14:47:11'),(62,100,'WhatsApp Image 2017-12-20 at 2.55.21 PM.png',1,1726382,'2017-12-20 17:34:55'),(63,100,'WhatsApp Image 2017-12-20 at 3.03.00 PM.png',1,1605925,'2017-12-20 17:34:55'),(64,100,'WhatsApp Image 2017-12-20 at 2.55.21 PM.jpg',1,496236,'2017-12-20 17:45:04'),(65,100,'WhatsApp Image 2017-12-20 at 3.03.00 PM.jpg',1,397286,'2017-12-20 17:45:04'),(66,100,'WhatsApp Image 2017-12-20 at 2.55.21 PM.jpg',1,496236,'2017-12-20 17:46:38'),(67,100,'WhatsApp Image 2017-12-20 at 3.03.00 PM.jpg',1,397286,'2017-12-20 17:46:38'),(69,101,'WhatsApp Image 2017-12-20 at 11.43.09 AM.jpeg',1,222308,'2017-12-20 19:09:38'),(70,101,'WhatsApp Image 2017-12-20 at 11.43.25 AM.jpeg',1,210824,'2017-12-20 19:09:38'),(71,101,'WhatsApp Image 2017-12-20 at 11.43.34 AM.jpeg',1,199404,'2017-12-20 19:09:38'),(72,101,'WhatsApp Image 2017-12-20 at 11.43.49 AM.jpeg',1,208586,'2017-12-20 19:09:38'),(73,107,'Laka Sumur 7.26 2.jpg',1,356205,'2017-12-20 19:24:56'),(74,107,'Laka Sumut 7.26 1.jpg',1,504015,'2017-12-20 19:24:56'),(75,106,'Longsor 7.28 1.jpg',1,695302,'2017-12-20 19:31:02'),(76,106,'Longsor 7.28 2.jpg',1,617738,'2017-12-20 19:31:02'),(77,106,'Longsor 7.28 3.jpg',1,570000,'2017-12-20 19:31:02'),(78,108,'Android-Lollipop-wallpapers-Google-Now-Wallpaper-2.png',1,379387,'2017-12-21 07:43:13'),(79,105,'Soroganten 7.26 1.jpg',1,564309,'2017-12-21 09:08:21'),(80,105,'Soroganten 7.26 2.jpg',1,463319,'2017-12-21 09:08:21');
/*!40000 ALTER TABLE `tbllaporan_galery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllaporan_kk`
--

DROP TABLE IF EXISTS `tbllaporan_kk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllaporan_kk` (
  `idtbllaporan_kk` int(11) NOT NULL AUTO_INCREMENT,
  `idtbllaporan` int(11) NOT NULL,
  `idtblkk` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`idtbllaporan_kk`,`idtbllaporan`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllaporan_kk`
--

LOCK TABLES `tbllaporan_kk` WRITE;
/*!40000 ALTER TABLE `tbllaporan_kk` DISABLE KEYS */;
INSERT INTO `tbllaporan_kk` VALUES (1,15,3,'2017-11-03 14:59:07'),(2,2,1,NULL),(3,2,3,NULL),(4,2,2,NULL),(5,15,4,NULL),(6,17,4,'2017-11-03 23:14:27'),(7,16,5,'2017-11-03 23:19:18'),(8,16,1,'2017-11-03 23:19:18'),(9,16,3,'2017-11-03 23:19:18'),(10,16,3,'2017-11-03 23:19:18'),(11,44,6,'2017-11-14 22:13:43'),(12,44,4,'2017-11-14 22:13:43'),(13,46,6,'2017-11-15 12:11:30'),(14,48,6,'2017-11-15 16:33:44'),(15,49,5,'2017-11-16 08:57:24'),(16,51,3,'2017-11-18 01:22:00'),(17,52,3,'2017-11-18 01:23:30'),(18,53,5,'2017-11-18 01:24:46'),(20,55,4,'2017-11-18 01:30:11'),(27,60,3,'2017-11-19 07:51:40'),(28,60,4,'2017-11-19 07:51:40'),(29,60,1,'2017-11-19 07:51:40'),(30,54,8,'2017-11-19 09:38:50'),(31,47,6,'2017-11-19 13:03:13'),(34,81,1,'2017-11-20 10:07:11'),(35,81,3,'2017-11-20 10:07:11'),(36,94,4,'2017-11-22 15:17:01');
/*!40000 ALTER TABLE `tbllaporan_kk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmenu`
--

DROP TABLE IF EXISTS `tblmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmenu` (
  `idtblmenu` int(12) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `parent` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `position` int(2) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `group` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idtblmenu`),
  KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmenu`
--

LOCK TABLES `tblmenu` WRITE;
/*!40000 ALTER TABLE `tblmenu` DISABLE KEYS */;
INSERT INTO `tblmenu` VALUES (1,'Lapor','mdi-action-dashboard','17','main/tambah',2,0,'main_menu'),(2,'Master','mdi-action-dashboard','0','#',0,0,'main_menu'),(3,'Master Barang','','2','ms_barang',1,0,'main_menu'),(4,'Master Gudang','','2','ms_gudang',2,0,'main_menu'),(5,'Master Bencana','','2','ms_bencana',3,0,'main_menu'),(6,'Master Barak','','2','ms_barak',4,0,'main_menu'),(7,'Master Ews','','2','ms_ews',5,0,'main_menu'),(8,'Master Ssb','','2','ms_ssb',6,0,'main_menu'),(9,'Master Area','','2','ms_area',7,0,'main_menu'),(10,'Master Desa','','2','ms_desa',8,0,'main_menu'),(11,'Master Instansi','','2','ms_instansi',9,0,'main_menu'),(12,'Master Peralatan','','2','ms_peralatan',10,0,'main_menu'),(13,'Master Ternak','','2','ms_ternak',11,0,'main_menu'),(14,'Master Keluarga','','2','ms_kk',12,0,'main_menu'),(15,'Master Menu','','2','ms_menu',13,0,'main_menu'),(16,'Master User','','2','ms_user',14,0,'main_menu'),(17,'Transaksi','mdi-editor-border-all','0','#',0,0,'main_menu'),(18,'Keluar Masuk Barang','','17','tr_keluar_masuk',1,0,'main_menu'),(19,'Laporan','mdi-editor-insert-comment','0','#',0,0,'main_menu'),(20,'Peta Kejadian','','19','peta_kejadian',1,0,'admin'),(21,'Master Group',NULL,'2','ms_group',15,0,NULL),(22,'Approval Kejadian',NULL,'17','tr_approval',2,0,NULL),(23,'Master Kecakapan',NULL,'2','ms_kecakapan',15,0,NULL),(24,'Master Komunitas','a','2','ms_komunitas',16,0,NULL),(25,'Export Data',NULL,'19','lp_export',2,0,NULL),(26,'Master Relawan',NULL,'2','ms_relawan',17,0,NULL),(27,'Pelaporan Lengkap','a','17','main/tambah_manual',18,0,NULL),(28,'Peta Koordinat Relawan','a','19','lp_map',18,0,NULL);
/*!40000 ALTER TABLE `tblmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblperalatan`
--

DROP TABLE IF EXISTS `tblperalatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblperalatan` (
  `idtblperalatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblperalatan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblperalatan`
--

LOCK TABLES `tblperalatan` WRITE;
/*!40000 ALTER TABLE `tblperalatan` DISABLE KEYS */;
INSERT INTO `tblperalatan` VALUES (1,'Truk Angkut ','Truk angkut barang',NULL,0),(2,'Truk Serbaguna','Pengangkutan Evakuasi',NULL,0),(3,'Chainsaw Besar','Pemotongan Kayu','2017-10-07 13:43:49',0),(4,'Chainsaw Sedang','Pemotongan Kayu Sedang','2017-10-07 13:44:12',0);
/*!40000 ALTER TABLE `tblperalatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblperalatan_detail`
--

DROP TABLE IF EXISTS `tblperalatan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblperalatan_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtblperalatan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `qty_baik` int(10) DEFAULT NULL,
  `qty_rusak` int(10) DEFAULT NULL,
  `tlpn` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`idtblperalatan`),
  KEY `idtblperalatan` (`idtblperalatan`),
  CONSTRAINT `tblperalatan_detail_ibfk_1` FOREIGN KEY (`idtblperalatan`) REFERENCES `tblperalatan` (`idtblperalatan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblperalatan_detail`
--

LOCK TABLES `tblperalatan_detail` WRITE;
/*!40000 ALTER TABLE `tblperalatan_detail` DISABLE KEYS */;
INSERT INTO `tblperalatan_detail` VALUES (1,1,'elos1','jalan banyuwangi 11',101,21,'0821138161581','2017-09-29 11:16:58',0),(2,2,'haris triyanto','jalan perumnas 2',1,0,'921348234','2017-09-29 13:40:26',0),(3,3,'BPBD Sleman','Posko Utama Pakem',5,0,'0274 2860051','2017-10-07 13:45:44',0),(4,3,'DLH Sleman','Komplek Pemda Sleman',100,10,'0274 869375','2017-10-07 13:45:31',0);
/*!40000 ALTER TABLE `tblperalatan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblssb`
--

DROP TABLE IF EXISTS `tblssb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblssb` (
  `idtblssb` int(11) NOT NULL AUTO_INCREMENT,
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
  `deskripsi` text,
  `potensi_bencana` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblssb`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblssb`
--

LOCK TABLES `tblssb` WRITE;
/*!40000 ALTER TABLE `tblssb` DISABLE KEYS */;
INSERT INTO `tblssb` VALUES (3,'nama ssb1','alamat1',15,340403,20,40,'track, jogging, senam1','elos1','081223124121','021348277121',60,'-7.720411965740646','110.34669994918215','SMA','keterangan1','tsunami, gorilla1','2017-09-28 00:00:00','coba',0);
/*!40000 ALTER TABLE `tblssb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblternak`
--

DROP TABLE IF EXISTS `tblternak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblternak` (
  `idtblternak` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblternak`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblternak`
--

LOCK TABLES `tblternak` WRITE;
/*!40000 ALTER TABLE `tblternak` DISABLE KEYS */;
INSERT INTO `tblternak` VALUES (1,'kambing','mbeeeeeeeeee','2017-09-29 14:12:32',0),(2,'sapi','sapi jogres sama ayam','2017-09-29 14:25:22',0),(3,'kerbau','kerbau yang membebani seluruh nafas ini :(','2017-09-29 14:25:48',0);
/*!40000 ALTER TABLE `tblternak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltracking`
--

DROP TABLE IF EXISTS `tbltracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltracking` (
  `idtbltracking` int(40) NOT NULL AUTO_INCREMENT,
  `idtbluser` varchar(10) DEFAULT NULL,
  `latitude` float(10,7) NOT NULL,
  `longitude` float(10,7) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `idtbllaporan` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbltracking`),
  KEY `latitude` (`latitude`,`longitude`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltracking`
--

LOCK TABLES `tbltracking` WRITE;
/*!40000 ALTER TABLE `tbltracking` DISABLE KEYS */;
INSERT INTO `tbltracking` VALUES (1,'4',-7.6532202,110.4351578,'2017-11-18 00:32:48',NULL),(2,'4',-7.6432204,110.4251556,'2017-11-18 00:37:58',NULL),(3,'5',-7.6534200,110.4331589,'2017-11-18 00:32:48',NULL),(4,'5',-7.7394800,110.2628098,'2017-11-18 00:37:58',NULL),(5,'6',-7.6538200,110.4356613,'2017-11-18 00:32:48',NULL),(6,'6',-7.8156390,110.3177032,'2017-11-18 00:37:58',NULL),(7,'7',-7.6522222,110.4355545,'2017-11-18 00:32:48',NULL),(8,'7',-7.8353968,110.3075485,'2017-11-18 00:37:58',NULL),(9,'1',-6.2014251,106.5298462,'2017-11-19 08:44:24',NULL),(10,'1',-6.2014251,106.5298462,'2017-11-19 09:00:38',54),(11,'1',-6.2014251,106.5298462,'2017-11-19 09:01:58',54),(12,'1',-6.2014251,106.5298462,'2017-11-19 09:04:40',57),(13,'1',-6.2014251,106.5298462,'2017-11-19 09:05:25',54),(14,'1',-6.2014251,106.5298462,'2017-11-19 09:32:44',55),(15,'1',-6.2014251,106.5298462,'2017-11-19 09:39:29',52),(16,'1',-6.2014251,106.5298462,'2017-11-19 09:50:56',56),(17,'1',-6.2014251,106.5298462,'2017-11-19 10:05:34',56),(18,'1',-6.2012000,106.5298386,'2017-11-19 10:05:44',56),(19,'1',-6.2013769,106.5298843,'2017-11-19 10:06:34',56),(20,'1',-6.2018833,106.5296555,'2017-11-19 10:12:34',56),(21,'1',-6.2015185,106.5297775,'2017-11-19 10:13:24',56),(22,'1',-6.2014251,106.5298462,'2017-11-19 10:14:11',56),(23,'1',-6.2012067,106.5296478,'2017-11-19 10:14:37',56),(24,'1',-6.1917248,106.5223618,'2017-11-19 10:15:13',56),(25,'1',-6.1917248,106.5223618,'2017-11-19 10:16:28',56),(26,'1',-6.2017231,106.5295715,'2017-11-19 10:17:18',56),(27,'1',-6.2014251,106.5298462,'2017-11-19 10:19:13',56),(28,'1',-6.1881318,106.5239868,'2017-11-19 10:19:59',56),(29,'1',-6.2030215,106.5303726,'2017-11-19 10:21:08',56),(30,'1',-6.2030215,106.5303726,'2017-11-19 10:21:23',56),(31,'1',-6.1978555,106.5298691,'2017-11-19 10:22:47',56),(32,'1',-6.2014251,106.5298462,'2017-11-19 10:23:09',47),(33,'1',-6.2076635,106.5302353,'2017-11-19 10:24:19',47),(34,'1',-6.2218499,106.5240097,'2017-11-19 10:24:47',47),(35,'1',-6.2218499,106.5240097,'2017-11-19 10:27:03',54),(36,'1',-6.2014251,106.5298462,'2017-11-19 10:45:11',47),(37,'1',-6.2014251,106.5298462,'2017-11-19 10:48:25',56),(38,'4',-7.7382927,110.4059525,'2017-11-19 12:36:40',56),(39,'2',-6.2014251,106.5298462,'2017-11-19 12:41:27',56),(40,'2',-6.2014251,106.5298462,'2017-11-19 12:47:13',47),(41,'4',-7.7382927,110.4059525,'2017-11-19 12:52:03',57),(42,'4',-7.7382927,110.4059525,'2017-11-19 12:54:51',47),(43,'4',-7.7382927,110.4059525,'2017-11-19 13:40:52',67),(44,'4',-7.7360954,110.4047928,'2017-11-19 13:44:11',67),(45,'4',-7.7360954,110.4047928,'2017-11-19 13:45:33',76),(46,'4',-7.7382927,110.4059525,'2017-11-19 13:45:46',76),(47,'2',-6.1978555,106.5298691,'2017-11-19 14:01:28',81),(48,'2',-6.2014251,106.5298462,'2017-11-19 14:17:55',82),(49,'4',-7.7382927,110.4059525,'2017-11-19 14:31:15',83),(50,'4',-7.7382927,110.4059525,'2017-11-19 14:31:38',83),(51,'2',-7.7382927,110.4059525,'2017-11-19 14:31:48',82),(52,'4',-7.7366638,110.4062881,'2017-11-19 17:37:08',84),(53,'4',-7.7577276,110.5057144,'2017-11-19 19:35:59',84),(54,'4',-7.6672535,110.4192734,'2017-11-19 21:58:50',84),(55,'9',-7.6672549,110.4192734,'2017-11-19 22:21:23',83),(56,'9',-7.6673422,110.4193039,'2017-11-19 22:22:15',83),(57,'4',-7.6672535,110.4192734,'2017-11-19 22:34:57',85),(58,'10',-7.6672544,110.4192734,'2017-11-19 22:41:18',85),(59,'10',-7.6672378,110.4189453,'2017-11-19 22:42:17',85),(60,'10',-7.6672158,110.4191895,'2017-11-19 22:43:08',85),(61,'10',-7.6672149,110.4192047,'2017-11-19 22:43:58',85),(62,'10',-7.6672530,110.4192810,'2017-11-19 22:45:27',85),(63,'10',-7.6672363,110.4192886,'2017-11-19 22:46:28',85),(64,'9',-7.6672416,110.4192047,'2017-11-19 22:47:27',86),(65,'9',-7.6672535,110.4192810,'2017-11-19 22:48:21',86),(66,'10',-7.6672535,110.4192734,'2017-11-19 22:48:29',85),(67,'9',-7.6670966,110.4191132,'2017-11-19 22:49:12',86),(68,'10',-7.6672320,110.4192123,'2017-11-19 22:51:33',85),(69,'9',-7.6672449,110.4192810,'2017-11-19 22:51:58',86),(70,'10',-7.6672540,110.4192734,'2017-11-19 22:53:32',85),(71,'9',-7.6672130,110.4191055,'2017-11-19 22:54:46',86),(72,'9',-7.6671810,110.4189911,'2017-11-19 22:57:18',86),(73,'10',-7.6672444,110.4192810,'2017-11-19 22:57:35',85),(74,'9',-7.6672192,110.4191055,'2017-11-19 22:59:01',86),(75,'10',-7.6672201,110.4187775,'2017-11-19 22:59:36',85),(76,'10',-7.6671071,110.4191437,'2017-11-19 23:00:38',85),(77,'9',-7.6671538,110.4189301,'2017-11-19 23:01:02',86),(78,'10',-7.6672468,110.4192734,'2017-11-19 23:01:39',85),(79,'10',-7.6672492,110.4192810,'2017-11-19 23:02:38',85),(80,'9',-7.6679106,110.4230804,'2017-11-19 23:02:49',86),(81,'9',-7.6687579,110.4278564,'2017-11-19 23:05:08',86),(82,'9',-7.6899657,110.4328690,'2017-11-19 23:07:55',86),(83,'9',-7.7574835,110.4336853,'2017-11-19 23:19:58',86),(84,'9',-7.7583842,110.4334946,'2017-11-19 23:20:49',86),(85,'9',-7.7624111,110.4324799,'2017-11-19 23:24:22',86),(86,'9',-7.7659993,110.4313660,'2017-11-19 23:28:46',86),(87,'9',-7.7663379,110.4313507,'2017-11-19 23:29:14',86),(88,'9',-7.7664342,110.4313126,'2017-11-19 23:29:59',86),(89,'9',-7.7664199,110.4313736,'2017-11-19 23:33:38',86),(90,'9',-7.7663765,110.4314117,'2017-11-19 23:33:44',86),(91,'9',-7.7663383,110.4312668,'2017-11-19 23:34:51',86),(92,'10',-7.6672058,110.4190063,'2017-11-19 23:35:40',85),(93,'4',-7.6672435,110.4192810,'2017-11-19 23:39:36',85),(94,'4',-7.6672435,110.4192810,'2017-11-19 23:42:44',86),(95,'9',-7.7663717,110.4313812,'2017-11-19 23:45:54',86),(96,'9',-7.7665482,110.4311752,'2017-11-19 23:50:53',86),(97,'9',-7.7764578,110.4304504,'2017-11-19 23:52:00',86),(98,'9',-7.7837205,110.4471054,'2017-11-19 23:59:18',87),(99,'9',-7.7886748,110.4476242,'2017-11-19 23:59:52',87),(100,'4',-7.6672635,110.4192810,'2017-11-20 00:02:22',82),(101,'10',-7.6672411,110.4192429,'2017-11-20 00:02:48',82),(102,'10',-7.6672535,110.4192734,'2017-11-20 00:03:45',82),(103,'9',-7.8101039,110.4416656,'2017-11-20 00:27:06',87),(104,'9',-7.8084440,110.4412537,'2017-11-20 00:33:40',87),(105,'9',-7.8110499,110.4420319,'2017-11-20 08:16:12',88),(106,'9',-7.8078532,110.4419937,'2017-11-20 08:17:06',88),(107,'9',-7.8079352,110.4417572,'2017-11-20 08:17:55',88),(108,'9',-7.8079352,110.4417572,'2017-11-20 08:19:27',88),(109,'9',-7.8076687,110.4420700,'2017-11-20 08:20:08',88),(110,'9',-7.8079143,110.4418640,'2017-11-20 08:24:33',88),(111,'2',-6.2075949,106.5653000,'2017-11-20 10:04:08',83),(112,'2',-6.2076273,106.5655289,'2017-11-20 10:04:34',81),(113,'4',-7.7382913,110.4059525,'2017-11-20 04:45:03',80),(114,'4',-7.7382879,110.4058990,'2017-11-20 04:46:33',80),(115,'10',-7.7181282,110.3553009,'2017-11-20 06:39:32',91),(116,'4',-7.7181358,110.3553085,'2017-11-20 06:44:53',79),(117,'4',-7.7181358,110.3553085,'2017-11-20 06:45:37',80),(118,'10',-7.6672454,110.4192734,'2017-11-21 15:34:36',91),(119,'10',-7.6672363,110.4192276,'2017-11-21 15:36:22',91),(120,'10',-7.6670666,110.4190674,'2017-11-21 15:37:35',91),(121,'10',-7.6670690,110.4189682,'2017-11-21 15:37:36',91),(122,'10',-7.6672072,110.4191055,'2017-11-21 15:39:53',91),(123,'10',-7.6672153,110.4190292,'2017-11-21 15:39:54',91),(124,'10',-7.6672516,110.4192810,'2017-11-21 15:42:15',91),(125,'4',-7.6672516,110.4192810,'2017-11-22 06:13:19',91),(126,'4',-7.6672993,110.4190445,'2017-11-22 06:16:48',91),(127,'4',-7.6672473,110.4193268,'2017-11-22 06:19:27',91),(128,'9',-7.6672530,110.4192886,'2017-11-22 06:37:25',93),(129,'10',-7.6672144,110.4191055,'2017-11-22 08:04:03',91),(130,'10',-7.6672492,110.4192810,'2017-11-22 09:01:47',97),(131,'10',-7.6672492,110.4192810,'2017-11-22 09:02:25',97),(132,'10',-7.6672392,110.4191742,'2017-11-22 09:05:05',97),(133,'10',-7.6672554,110.4192963,'2017-11-22 09:09:20',97),(134,'10',-7.6668248,110.4188461,'2017-11-22 09:21:16',96),(135,'10',-7.6666131,110.4189758,'2017-11-22 09:23:00',97),(136,'10',-7.6520176,110.3575821,'2017-11-23 10:54:44',93),(137,'10',-7.6510539,110.3544846,'2017-11-23 10:55:00',93),(138,'10',-7.6514168,110.3549576,'2017-11-23 10:56:09',93),(139,'10',-7.6513166,110.3548508,'2017-11-23 10:56:35',93),(140,'10',-7.6510539,110.3544846,'2017-11-23 10:58:15',93),(141,'2',-6.2074375,106.5630341,'2017-11-27 11:28:30',89),(142,'2',-6.2074342,106.5630264,'2017-11-27 11:34:08',83),(143,'2',-6.2074361,106.5630341,'2017-11-27 11:35:01',83),(144,'2',-6.2074361,106.5630341,'2017-11-27 11:35:09',89),(145,'4',-6.9779329,110.4134598,'2017-12-16 15:09:01',99),(146,'10',-7.6672530,110.4192810,'2017-12-16 18:01:46',98),(147,'10',-7.6674051,110.4190445,'2017-12-16 18:02:19',98),(148,'10',-7.6672168,110.4191208,'2017-12-16 18:04:39',98),(149,'10',-7.6672530,110.4192810,'2017-12-16 18:07:30',98);
/*!40000 ALTER TABLE `tbltracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser` (
  `idtbluser` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `idtblgroup` int(11) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtbluser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
INSERT INTO `tbluser` VALUES (1,'Aris Triyanto','aris.pozol@gmail.com',1,'16da1a5386f2e40cf818853a9561c67e','2017-10-10 08:37:11',0),(2,'elos ananto','socmed.eloz@gmail.com',2,'16da1a5386f2e40cf818853a9561c67e','2017-10-10 08:50:26',0),(3,'Dicuk','dikau.mardika@gmail.com',1,'f2e54a9e83365634e3a1cf12088e443f','2017-11-05 15:05:31',0),(4,'Pusdalops','pusdalops.sleman@gmail.com',2,'827ccb0eea8a706c4c34a16891f84e7b','2017-11-10 00:30:36',0),(5,'Relawan','Relawan@mail.com',NULL,'626c9488745bc8691a99fae8f227b6ce','2017-11-10 00:32:39',0),(6,'Aris Triyanto2','aris.pozol2@gmail.com',NULL,'827ccb0eea8a706c4c34a16891f84e7b','2017-11-14 21:26:54',0),(7,'elos coba','elos.ananto@propanraya.com',NULL,'16da1a5386f2e40cf818853a9561c67e','2017-11-15 13:25:00',0),(8,'haris triyanto','haris.triyanto@propanraya.com',1,'16da1a5386f2e40cf818853a9561c67e','2017-11-15 13:27:22',0),(9,'Bayu 7.30','anangdidiks@gmail.com',4,'827ccb0eea8a706c4c34a16891f84e7b','2017-11-19 22:18:43',0),(10,'Bayu 9.01','masykurmohammed@gmail.com',1,'b0baee9d279d34fa1dfd71aadb908c3f','2017-11-19 22:30:03',0),(11,'Bayu 7.28','sasepbudis@gmail.com',4,'827ccb0eea8a706c4c34a16891f84e7b','2017-11-22 13:31:30',0);
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_bonus`
--

DROP TABLE IF EXISTS `tr_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_bonus` (
  `id_bonus` int(9) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(15) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `harga` decimal(15,2) DEFAULT NULL,
  `id_customer` int(4) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `create_user` int(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `jenis` tinyint(1) DEFAULT NULL COMMENT '1 = barang, 2 = uang',
  PRIMARY KEY (`id_bonus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_bonus`
--

LOCK TABLES `tr_bonus` WRITE;
/*!40000 ALTER TABLE `tr_bonus` DISABLE KEYS */;
INSERT INTO `tr_bonus` VALUES (3,'BE0007',1,10000.00,2,'2016-11-14',1,'2016-11-14 01:52:15',1),(4,NULL,NULL,50000.00,2,'2016-11-14',1,'2016-11-14 01:56:57',2),(5,NULL,NULL,500000.00,2,'2016-12-06',1,'2016-12-06 02:08:53',2);
/*!40000 ALTER TABLE `tr_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_cekstok_detail`
--

DROP TABLE IF EXISTS `tr_cekstok_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_cekstok_detail` (
  `id_cekstok` int(5) NOT NULL,
  `kode_barang` varchar(9) NOT NULL,
  `id_barang` int(9) NOT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `qty_komputer` int(5) DEFAULT '0',
  `qty_fisik` int(5) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_cekstok`,`kode_barang`,`id_barang`),
  KEY `id_cekstok` (`id_cekstok`),
  KEY `kode_barang` (`kode_barang`),
  CONSTRAINT `tr_cekstok_detail_ibfk_1` FOREIGN KEY (`id_cekstok`) REFERENCES `tr_cekstok_header` (`id_cekstok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_cekstok_detail`
--

LOCK TABLES `tr_cekstok_detail` WRITE;
/*!40000 ALTER TABLE `tr_cekstok_detail` DISABLE KEYS */;
INSERT INTO `tr_cekstok_detail` VALUES (4,'CA0253',495,'1','2016-11-14 09:04:08',0,30,'',0),(4,'FP0001',2,'1','2016-11-14 09:04:08',10,30,'',0),(4,'FP0002',3,'1','2016-11-14 09:04:08',18,30,'',0),(4,'FP0003',4,'1','2016-11-14 09:04:08',10,30,'',0),(4,'FP0004',5,'1','2016-11-14 09:04:08',10,30,'',0),(4,'FP0005',6,'1','2016-11-14 09:04:08',20,30,'',0),(5,'CA0253',495,'1','2016-11-14 16:41:59',0,30,'',0),(5,'FP0001',2,'1','2016-11-14 16:41:59',10,30,'',0),(5,'FP0002',3,'1','2016-11-14 16:41:59',18,30,'',0),(5,'FP0003',4,'1','2016-11-14 16:41:59',10,30,'',0),(5,'FP0004',5,'1','2016-11-14 16:41:59',10,30,'',0),(5,'FP0005',6,'1','2016-11-14 16:41:59',20,30,'',0),(5,'SE0003',501,'1','2016-11-14 16:41:59',10,30,'',0);
/*!40000 ALTER TABLE `tr_cekstok_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_cekstok_header`
--

DROP TABLE IF EXISTS `tr_cekstok_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_cekstok_header` (
  `id_cekstok` int(5) NOT NULL AUTO_INCREMENT,
  `id_cetak` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_cekstok`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_cekstok_header`
--

LOCK TABLES `tr_cekstok_header` WRITE;
/*!40000 ALTER TABLE `tr_cekstok_header` DISABLE KEYS */;
INSERT INTO `tr_cekstok_header` VALUES (4,'0001/11/2016','2016-11-14','1','2016-11-14 09:04:08',0),(5,'0002/11/2016','2016-11-14','1','2016-11-14 16:41:59',0);
/*!40000 ALTER TABLE `tr_cekstok_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_stok_detail`
--

DROP TABLE IF EXISTS `tr_stok_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_stok_detail` (
  `id_stok` int(5) NOT NULL AUTO_INCREMENT,
  `stok` decimal(12,4) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `penerima` varchar(100) DEFAULT NULL,
  KEY `id_stok` (`id_stok`),
  CONSTRAINT `tr_stok_detail_ibfk_1` FOREIGN KEY (`id_stok`) REFERENCES `tr_stok_header` (`id_stok`)
) ENGINE=InnoDB AUTO_INCREMENT=51183 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_stok_detail`
--

LOCK TABLES `tr_stok_detail` WRITE;
/*!40000 ALTER TABLE `tr_stok_detail` DISABLE KEYS */;
INSERT INTO `tr_stok_detail` VALUES (51180,200.0000,'1','coba',NULL,'2017-10-13 14:08:08',0,'elos ananto'),(51181,2.0000,'1','coba',NULL,'2017-10-13 14:08:25',0,'dikaa'),(51182,200000.0000,'1','asd',NULL,'2017-10-13 14:08:39',0,'elos ananto'),(51180,20.0000,'1','asdasdasd',NULL,'2017-10-13 14:08:53',0,'asdasdasd'),(51181,-1.0000,'2','asdasdasd',NULL,'2017-10-13 14:09:08',0,'Agus suryanto'),(51181,-20.0000,'2','asdasd',NULL,'2017-10-13 14:09:21',0,'Agus suryanto21'),(51180,23.0000,'1','adddd',NULL,'2017-10-13 14:09:38',0,'Besi berani'),(51181,21.0000,'1','bantuan kemanusiaan',NULL,'2017-10-13 14:10:20',0,'haris');
/*!40000 ALTER TABLE `tr_stok_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tr_stok_header`
--

DROP TABLE IF EXISTS `tr_stok_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tr_stok_header` (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `idtblgudang` int(5) NOT NULL,
  `idtblbarang` varchar(40) DEFAULT NULL,
  `sisa_stok` decimal(12,4) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_stok`,`idtblgudang`),
  UNIQUE KEY `kode_lokasi` (`idtblgudang`,`idtblbarang`),
  KEY `kode_outlet` (`idtblgudang`),
  KEY `kode_barang` (`idtblbarang`)
) ENGINE=InnoDB AUTO_INCREMENT=51183 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tr_stok_header`
--

LOCK TABLES `tr_stok_header` WRITE;
/*!40000 ALTER TABLE `tr_stok_header` DISABLE KEYS */;
INSERT INTO `tr_stok_header` VALUES (51180,1,'1',243.0000,NULL,'2017-10-13 14:08:08',0),(51181,1,'2',2.0000,NULL,'2017-10-13 14:08:25',0),(51182,1,'3',200000.0000,NULL,'2017-10-13 14:08:39',0);
/*!40000 ALTER TABLE `tr_stok_header` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-21  2:15:26
