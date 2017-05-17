-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17 Mei 2017 pada 20.48
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
(1, 'SKL-001-2017', 'Benjamin Jr', 'Bandung, 10 Januari 1971', 'Laki-Laki', 'Programmer', 'Jalan Sukapura No 1, Bandung', 'Benjamin Sr', 'Elisabet', '1', '2017-04-25', 'Di Setujui'),
(2, 'SKL-003-2017', 'Sutejo', 'Bojongsoang 10 Januari 2010', 'Laki-Laki', '-', 'Jalan Bojongsoang Bandung', 'Sukirman', 'Sukijah', '4', '2017-04-25', 'Di Setujui');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_kematian`
--

CREATE TABLE IF NOT EXISTS `surat_kematian` (
`id_surat` int(11) NOT NULL,
  `nomor_surat` varchar(100) NOT NULL,
  `terlapor_nama` varchar(100) NOT NULL,
  `terlapor_jenis_kelamin` varchar(100) NOT NULL,
  `terlapor_tanggal_lahir` date NOT NULL,
  `terlapor_agama` varchar(100) NOT NULL,
  `terlapor_alamat` text NOT NULL,
  `meninggal_hari` varchar(100) NOT NULL,
  `meninggal_tanggal` date NOT NULL,
  `meninggal_pukul` time NOT NULL,
  `meninggal_tempat` varchar(100) NOT NULL,
  `meninggal_penyebab` varchar(100) NOT NULL,
  `pelapor_nama` varchar(100) NOT NULL,
  `pelapor_nik` varchar(100) NOT NULL,
  `pelapor_tanggal_lahir` date NOT NULL,
  `pelapor_pekerjaan` varchar(100) NOT NULL,
  `pelapor_alamat` text NOT NULL,
  `tanggal_pembuatan` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `surat_kematian`
--

INSERT INTO `surat_kematian` (`id_surat`, `nomor_surat`, `terlapor_nama`, `terlapor_jenis_kelamin`, `terlapor_tanggal_lahir`, `terlapor_agama`, `terlapor_alamat`, `meninggal_hari`, `meninggal_tanggal`, `meninggal_pukul`, `meninggal_tempat`, `meninggal_penyebab`, `pelapor_nama`, `pelapor_nik`, `pelapor_tanggal_lahir`, `pelapor_pekerjaan`, `pelapor_alamat`, `tanggal_pembuatan`, `status`) VALUES
(1, 'SKM-001-2017', 'Aziz Abdur Roziq', 'Laki-Laki', '0000-00-00', 'Islam', 'Makassar', 'Senin', '0000-00-00', '00:00:10', 'Bojongsoang', 'Kebanyakan berbohong', 'Yudi Prasetya', '123123123123', '0000-00-00', 'Ketua PSI', 'Padang', '2017-04-25', 'Di Setujui');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_kk`
--

CREATE TABLE IF NOT EXISTS `surat_keterangan_kk` (
`id_surat` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `tempat_tanggal_lahir` text NOT NULL,
  `bangsa_agama` text NOT NULL,
  `pekerjaan` text NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_ktp`
--

CREATE TABLE IF NOT EXISTS `surat_keterangan_ktp` (
`id_surat` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `tempat_tanggal_lahir` text NOT NULL,
  `bangsa_agama` text NOT NULL,
  `pekerjaan` text NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_pindah`
--

CREATE TABLE IF NOT EXISTS `surat_keterangan_pindah` (
`id_surat` int(11) NOT NULL,
  `nomor_kartu_keluarga` varchar(100) NOT NULL,
  `nama_kepala_keluarga` varchar(100) NOT NULL,
  `alamat_asal` text NOT NULL,
  `rt_asal` text NOT NULL,
  `rw_asal` text NOT NULL,
  `dusun_asal` text NOT NULL,
  `nik_pemohon` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alasan_pindah` text NOT NULL,
  `alamat_tujuan` text NOT NULL,
  `rt_tujuan` text NOT NULL,
  `rw_tujuan` text NOT NULL,
  `dusun_tujuan` text NOT NULL,
  `desa_tujuan` text NOT NULL,
  `kecamatan_tujuan` text NOT NULL,
  `kabupaten_tujuan` text NOT NULL,
  `provinsi_tujuan` text NOT NULL,
  `jenis_kepindahan` varchar(100) NOT NULL,
  `status_kk_yang_tidak_pindah` varchar(100) NOT NULL,
  `status_kk_yang_pindah` varchar(100) NOT NULL,
  `nik_keluarga_yang_pindah` varchar(100) NOT NULL,
  `nama_keluarga_yang_pindah` varchar(100) NOT NULL,
  `masa_berlaku_ktp` date NOT NULL,
  `shdk` varchar(100) NOT NULL,
  `tanggal_pembuatan` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `surat_keterangan_pindah`
--

INSERT INTO `surat_keterangan_pindah` (`id_surat`, `nomor_kartu_keluarga`, `nama_kepala_keluarga`, `alamat_asal`, `rt_asal`, `rw_asal`, `dusun_asal`, `nik_pemohon`, `nama_lengkap`, `alasan_pindah`, `alamat_tujuan`, `rt_tujuan`, `rw_tujuan`, `dusun_tujuan`, `desa_tujuan`, `kecamatan_tujuan`, `kabupaten_tujuan`, `provinsi_tujuan`, `jenis_kepindahan`, `status_kk_yang_tidak_pindah`, `status_kk_yang_pindah`, `nik_keluarga_yang_pindah`, `nama_keluarga_yang_pindah`, `masa_berlaku_ktp`, `shdk`, `tanggal_pembuatan`, `status`) VALUES
(1, '3209201208080002', 'Misyono', 'Jl. Pramuka Pecilon Duku', '003', '001', '', '3209205708900011', 'Desi Silvyanti Agustin', 'Keluarga', 'Blok Bebekan', '004', '004', '', 'Kemlaka Gede', 'Tengah Tani', 'Cirebon', 'Jawa Barat', 'Anggota Keluarga', 'Nomor KK Tetap', 'Membuat KK Baru', '3209205708900011', 'Desi Silvyanti Agustin', '2017-08-17', 'A', '2017-05-13', 'belum disetujui');

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
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` bigint(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin','lurah','camat') NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'lurah', '04960f28e4129aac5bdc9da32056560d', 'lurah'),
(3, 'camat', 'e0dc1c969db5fa159c0e3ccc290e2314', 'camat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `surat_kelahiran`
--
ALTER TABLE `surat_kelahiran`
 ADD PRIMARY KEY (`id_surat`), ADD UNIQUE KEY `nomor_surat` (`nomor_surat`);

--
-- Indexes for table `surat_kematian`
--
ALTER TABLE `surat_kematian`
 ADD PRIMARY KEY (`id_surat`), ADD UNIQUE KEY `nomor_surat` (`nomor_surat`);

--
-- Indexes for table `surat_keterangan_kk`
--
ALTER TABLE `surat_keterangan_kk`
 ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `surat_keterangan_ktp`
--
ALTER TABLE `surat_keterangan_ktp`
 ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `surat_keterangan_pindah`
--
ALTER TABLE `surat_keterangan_pindah`
 ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `tb_penduduk`
--
ALTER TABLE `tb_penduduk`
 ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `surat_kelahiran`
--
ALTER TABLE `surat_kelahiran`
MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `surat_kematian`
--
ALTER TABLE `surat_kematian`
MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `surat_keterangan_kk`
--
ALTER TABLE `surat_keterangan_kk`
MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surat_keterangan_ktp`
--
ALTER TABLE `surat_keterangan_ktp`
MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surat_keterangan_pindah`
--
ALTER TABLE `surat_keterangan_pindah`
MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
