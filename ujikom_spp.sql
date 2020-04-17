-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Apr 2020 pada 19.19
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujikom_spp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL,
  `kompetensi_keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(1000111, '10', 'KP A', 'Kontrol Proses'),
(1000112, '10', 'KP B', 'Kontrol Proses'),
(1000121, '10', 'KM A', 'Kontrol Mekanik'),
(1000122, '10', 'KM B', 'Kontrol Mekanik'),
(1000131, '10', 'TOI A', 'Teknik Otomasi Industri'),
(1000132, '10', 'TOI B', 'Teknik Otomasi Industri'),
(1000141, '10', 'TPTU A', 'Teknik Pendingin dan Tata Udara'),
(1000142, '10', 'TPTU B', 'Teknik Pendingin dan Tata Udara'),
(1000151, '10', 'TEK A', 'Teknik Elektronika Komunikasi'),
(1000152, '10', 'TEK B', 'Teknik Elektronika Komunikasi'),
(1000161, '10', 'TEI A', 'Teknik Elektronika Industri'),
(1000162, '10', 'TEI B', 'Teknik Elektronika Industri'),
(1000171, '10', 'TKJ A', 'Teknik Komputer dan Jaringan'),
(1000172, '10', 'TKJ B', 'Teknik Komputer dan Jaringan'),
(1000181, '10', 'RPL A', 'Rekayasa Perangkat Lunak'),
(1000182, '10', 'RPL B', 'Rekayasa Perangkat Lunak'),
(1000191, '10', 'TP4 A', 'Teknik Program Penyiaran Pertelevisian'),
(1000192, '10', 'TP4 B', 'Teknik Program Penyiaran Pertelevisian'),
(2000211, '11', 'KP A', 'Kontrol Proses'),
(2000212, '11', 'KP B', 'Kontrol Proses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `messages` text NOT NULL,
  `nisn` int(11) NOT NULL,
  `waktu` datetime NOT NULL,
  `isClicked` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `title`, `messages`, `nisn`, `waktu`, `isClicked`) VALUES
(27, 'Pembayaran SPP', 'Pembayaran SPP Bulan November tahun ajaran 2021-2022 telah dikonfirmasi', 233213, '2020-04-15 00:07:48', '0'),
(28, 'Pembayaran SPP', 'Pembayaran SPP Bulan November tahun ajaran 2021-2022 telah dikonfirmasi', 233213, '2020-04-15 00:08:13', '0'),
(29, 'Pembayaran SPP', 'Pembayaran SPP Bulan November tahun ajaran 2021-2022 telah dikonfirmasi', 233213, '2020-04-15 00:18:22', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bulan_dibayar` varchar(9) NOT NULL,
  `tahun_ajaran` varchar(9) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `id_tagihan` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_dibayar`, `tahun_ajaran`, `id_spp`, `id_tagihan`, `jumlah_bayar`) VALUES
(55, 1000000001, '233213', '2020-04-03', 'Juli', '2019-2020', 111, 46, 125000),
(56, 1000000001, '233213', '2020-04-04', 'Agustus', '2019-2020', 111, 46, 125000),
(57, 123213, '233213', '2020-04-04', 'September', '2019-2020', 111, 46, 125000),
(58, 123213, '233213', '2020-04-04', 'Oktober', '2019-2020', 111, 46, 125000),
(59, 123213, '233213', '2020-04-04', 'November', '2019-2020', 111, 46, 125000),
(60, 123213, '233213', '2020-04-04', 'Desember', '2019-2020', 111, 46, 125000),
(61, 123213, '233213', '2020-04-04', 'Januari', '2019-2020', 111, 46, 125000),
(62, 1000000001, '233213', '2020-04-04', 'Februari', '2019-2020', 111, 46, 125000),
(63, 1000000001, '233213', '2020-04-05', 'Maret', '2019-2020', 111, 46, 125000),
(64, 1000000001, '233213', '2020-04-05', 'April', '2019-2020', 111, 46, 125000),
(65, 1000000001, '233213', '2020-04-05', 'Mei', '2019-2020', 111, 46, 125000),
(66, 1000000001, '233213', '2020-04-05', 'Juni', '2019-2020', 111, 46, 125000),
(83, 1000000001, '233213', '2020-04-05', 'Juli', '2020-2021', 111, 47, 125000),
(84, 1000000001, '233213', '2020-04-05', 'Agustus', '2020-2021', 111, 47, 125000),
(85, 1000000001, '233213', '2020-04-05', 'September', '2020-2021', 111, 47, 125000),
(86, 1000000001, '233213', '2020-04-05', 'Oktober', '2020-2021', 111, 47, 125000),
(87, 1000000001, '233213', '2020-04-05', 'November', '2020-2021', 111, 47, 125000),
(88, 1000000001, '233213', '2020-04-05', 'Desember', '2020-2021', 111, 47, 125000),
(89, 1000000001, '233213', '2020-04-06', 'Januari', '2020-2021', 111, 47, 125000),
(90, 1000000001, '233213', '2020-04-06', 'Februari', '2020-2021', 111, 47, 125000),
(91, 1000000001, '233213', '2020-04-06', 'Maret', '2020-2021', 111, 47, 125000),
(92, 1000000001, '233213', '2020-04-06', 'April', '2020-2021', 111, 47, 125000),
(93, 1000000001, '233213', '2020-04-06', 'Mei', '2020-2021', 111, 47, 125000),
(94, 1000000001, '233213', '2020-04-08', 'Juni', '2020-2021', 111, 47, 125000),
(95, 1000000001, '233213', '2020-04-10', 'Juli', '2021-2022', 111, 48, 125000),
(96, 1000000001, '233213', '2020-04-10', 'Agustus', '2021-2022', 111, 48, 125000),
(97, 1000000001, '233213', '2020-04-11', 'September', '2021-2022', 111, 48, 125000),
(98, 1000000001, '233213', '2020-04-11', 'Oktober', '2021-2022', 111, 48, 125000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `salt`, `nama_petugas`, `level`) VALUES
(123213, 'coks123', 'LqRRJ48439Bgm7sUcktXQSc6085iND', 'b43f0a5817', 'Ucok Corona', 'petugas'),
(1000000001, 'admin123', 'T/QoPnbX6u6uaNUN0FC9SEc8A49mMD', 'f081c2e5ab', 'Administrator', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekolah`
--

CREATE TABLE `sekolah` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sekolah`
--

INSERT INTO `sekolah` (`id`, `nama`, `alamat`, `logo`) VALUES
(1, 'SMK Negeri 1 Cimahi', 'Jl. Mahar Martanegara No.48, Utama, Kec. Cimahi Selatan, Kota Cimahi, Jawa Barat 40533', 'logo_sekolah.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nisn` char(10) NOT NULL,
  `nis` char(8) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `tahun_masuk` varchar(4) NOT NULL,
  `program` enum('3 tahun','4 tahun') NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `id_spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `id_kelas`, `tahun_masuk`, `program`, `alamat`, `no_telp`, `id_spp`) VALUES
('111111', '12345', 'Miftah Faridl', 1000111, '2019', '3 tahun', 'leuwigajah', '89128312', 111),
('122211', '12221', 'Cecep Rohmat', 1000111, '2020', '3 tahun', 'Lembur Sawah', '09971262523', 111),
('22222', '12345', 'Miftah Faridl', 1000111, '2019', '3 tahun', 'leuwigajah', '89128312', 111),
('233213', '23321', 'Miftah Faridl Al-Anshari', 1000181, '2019', '4 tahun', 'Kp. Hujung Kulon', '089654711175', 111);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `id_spp` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`id_spp`, `tahun`, `nominal`) VALUES
(111, 2020, 125000),
(112, 2020, 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id` int(11) NOT NULL,
  `nisn` char(10) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `tahun_ajaran` varchar(9) NOT NULL,
  `tagihan` int(11) NOT NULL,
  `status_tagihan` enum('Lunas','Belum Lunas') NOT NULL DEFAULT 'Belum Lunas'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`id`, `nisn`, `id_spp`, `tahun_ajaran`, `tagihan`, `status_tagihan`) VALUES
(46, '233213', 111, '2019-2020', 0, 'Lunas'),
(47, '233213', 111, '2020-2021', 0, 'Lunas'),
(48, '233213', 111, '2021-2022', 1000000, 'Belum Lunas'),
(49, '233213', 111, '2022-2023', 1500000, 'Belum Lunas'),
(50, '122211', 111, '2020-2021', 1500000, 'Belum Lunas'),
(51, '122211', 111, '2021-2022', 1500000, 'Belum Lunas'),
(52, '122211', 111, '2022-2023', 1500000, 'Belum Lunas'),
(77, '111111', 111, '2019-2020', 1500000, 'Belum Lunas'),
(78, '111111', 111, '2020-2021', 1500000, 'Belum Lunas'),
(79, '111111', 111, '2021-2022', 1500000, 'Belum Lunas'),
(80, '22222', 111, '2019-2020', 1500000, 'Belum Lunas'),
(81, '22222', 111, '2020-2021', 1500000, 'Belum Lunas'),
(82, '22222', 111, '2021-2022', 1500000, 'Belum Lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `nisn` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `token`
--

INSERT INTO `token` (`id`, `nisn`, `token`) VALUES
(10, 233213, 'cz23fYLJQkuaTwtGLdYoxW:APA91bHAf6QorxR--e4Uh6ArKnYRlHVKTlEZfBj23oIXQsMxS1DWb4Ua5JrPsNWpVNm6mtdlX_FKo1sikulAMu83UmlqK69Bjlzy1_E-7AoDVVkx6JZv-YCDb_WIuvmjQQEhDAA9hsQ5'),
(26, 233213, 'fkzuIt-0QH6VL4C1BDzbnE:APA91bHlvTFUgScWv9xJpK-sKg0k-3VvKjQKy48tQ8OABoNAa3T73MgLq3EMyMI-41g5L-pgG5mo9qGLpI43eRZ4oW0PAeF4po8RyUX87_xGMakJA2UZ82PebSun7K6rmmUXvUcOYKt3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_tagihan` (`id_tagihan`),
  ADD KEY `pembayaran_ibfk_1` (`nisn`),
  ADD KEY `pembayaran_ibfk_2` (`id_petugas`),
  ADD KEY `pembayaran_ibfk_3` (`id_spp`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_spp` (`id_spp`),
  ADD KEY `id_spp_2` (`id_spp`),
  ADD KEY `fk_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- Indeks untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_spp3` (`id_spp`),
  ADD KEY `nisn` (`nisn`);

--
-- Indeks untuk tabel `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT untuk tabel `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `fk_spp` FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
