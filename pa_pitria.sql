-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 25 Apr 2017 pada 02.32
-- Versi Server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pa_pitria`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_kelahiran`
--

CREATE TABLE IF NOT EXISTS `surat_kelahiran` (
`id_surat` int(11) NOT NULL,
  `nomor_surat` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_tanggal_lahir` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nama_ayah_kandung` varchar(100) NOT NULL,
  `nama_ibu_kandung` varchar(100) NOT NULL,
  `anak_ke` varchar(100) NOT NULL,
  `tanggal_pembuatan` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `surat_kelahiran`
--

INSERT INTO `surat_kelahiran` (`id_surat`, `nomor_surat`, `nama`, `tempat_tanggal_lahir`, `jenis_kelamin`, `pekerjaan`, `alamat`, `nama_ayah_kandung`, `nama_ibu_kandung`, `anak_ke`, `tanggal_pembuatan`, `status`) VALUES
(1, 'SKL-001-2017', 'Benjamin Jr', 'Bandung, 10 Januari 1971', 'Laki-Laki', 'Programmer', 'Jalan Sukapura No 1, Bandung', 'Benjamin Sr', 'Elisabet', '1', '2017-04-25', 'Di Setujui');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penduduk`
--

CREATE TABLE IF NOT EXISTS `tb_penduduk` (
  `nik` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `j_kelamin` varchar(100) NOT NULL,
  `agama` varchar(100) NOT NULL,
  `tmp_lahir` varchar(100) NOT NULL,
  `tgl_lahir` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `status_perkawinan` varchar(100) NOT NULL,
  `kewarganegaraan` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_penduduk`
--

INSERT INTO `tb_penduduk` (`nik`, `nama`, `j_kelamin`, `agama`, `tmp_lahir`, `tgl_lahir`, `alamat`, `status_perkawinan`, `kewarganegaraan`, `pekerjaan`) VALUES
(123123, 'budi', 'laki-laki', 'kristen', 'boyolali', '17 Januari 1999', 'boyolali', 'belum kawin', 'indonesia', 'pembalap'),
(123456, 'Joko Widodo', 'Laki-Laki', 'Islam', 'Surakarta', '1970-07-09', 'Jalan Merdeka Barat No.1 Surakarta', 'Belum Menikah', 'Indonesia', 'Presiden');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
`id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `surat_kelahiran`
--
ALTER TABLE `surat_kelahiran`
 ADD PRIMARY KEY (`id_surat`), ADD UNIQUE KEY `nomor_surat` (`nomor_surat`);

--
-- Indexes for table `tb_penduduk`
--
ALTER TABLE `tb_penduduk`
 ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `surat_kelahiran`
--
ALTER TABLE `surat_kelahiran`
MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
