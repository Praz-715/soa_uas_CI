-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Agu 2021 pada 15.45
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soa_tugas10`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, '12345', 1, 0, 0, '1', 1),
(2, 2, '123321', 1, 0, 0, '1', 1),
(3, 3, 'uas-soa', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:mahasiswa/index:get', 2, 1625748997, '12345'),
(2, 'api-key:12345', 2, 1625749119, '12345'),
(3, 'api-key:123321', 1, 1628428118, '123321'),
(4, 'api-key:uas-soa', 19, 1628428167, 'uas-soa'),
(5, 'uri:mahasiswa/index:get', 2, 1628428226, 'uas-soa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jalan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rtrw` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kecamatan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `periode_daftar` year(4) NOT NULL,
  `jurusan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fakultas` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jk` enum('Laki-laki','Perempuan') COLLATE utf8_unicode_ci NOT NULL,
  `kewarganegaraan` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jalan`, `rtrw`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `periode_daftar`, `jurusan`, `fakultas`, `email`, `no_hp`, `jk`, `kewarganegaraan`) VALUES
('20180801178', 'Rizki Dwi Ramadhan', 'Jl. Kapuk kebon jahe', '08/03', 'Kapuk', 'Cengkareng', 'Jakarta Barat', 'DKI Jakarta', 2018, 'Teknik Informatika', 'Ilmu Komputer', 'rizki.ramadhandwi31@gmail.com', '0851-5531-1309', 'Laki-laki', 'Indonesia'),
('20180801168', 'Aang Maulana', 'kapuk rawa gabus', '014/011', 'Kapuk', 'Cengkareng', 'Jakarta Barat', 'DKI Jakarta', 2018, 'Teknik Informatika', 'Ilmu Komputer', 'aangmaulana124081@gmail.com', '0895-3335-03283', 'Laki-laki', 'Indonesia'),
('20180801305', 'Muhammad Fadli Syukur', 'Jl H Sarimun No. 128', '07/01', 'Kembangan Selatan', 'Kembangan', 'Jakarta Barat', 'DKI Jakarta', 2018, 'Teknik Informatika', 'Ilmu Komputer', 'muhammadfadlisyukur16@gmail.com', '0858-9272-1585', 'Laki-laki', 'Indonesia'),
('20180801171', 'Muhammad Fajar', 'jl. H. Rean no. 82', '004/001', 'Benda Baru', 'Pamulang', 'Tangerang selatan', 'Banten', 2018, 'Teknik Informatika', 'Ilmu Komputer', 'fajarsds20@gmail.com', '0812-9314-4131', 'Laki-laki', 'Indonesia'),
('20180801169', 'Jefri Heryatyono Barasa', 'Jalanin Aja Dulu', '04/02', 'Tanah tinggi', 'Tangerang', 'Tangerang', 'Banten', 2018, 'Teknik Informatika', 'Ilmu Komputer', 'jebeganteng@gmail.com', '0812-8841-7913', 'Laki-laki', 'Indonesia'),
('20180801160', 'Teguh Prasetyo', 'Jl. Kebon dua ratus', '09/02', 'Kamal', 'Kalideres', 'Jakarta Barat', 'DKI Jakarta', 2018, 'Teknik Informatika', 'Ilmu Komputer', 'teguhpraz100@gmail.com', '0858-103-7808', 'Laki-laki', 'Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
