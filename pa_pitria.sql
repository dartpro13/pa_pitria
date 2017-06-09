-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 04 Jun 2017 pada 22.56
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
-- Struktur dari tabel `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
`id` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `dari` varchar(100) NOT NULL,
  `untuk` varchar(100) NOT NULL,
  `redirect` varchar(250) NOT NULL,
  `waktu` datetime NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `notification`
--

INSERT INTO `notification` (`id`, `deskripsi`, `dari`, `untuk`, `redirect`, `waktu`, `status`) VALUES
(2, 'Telah diubah surat kelahiran atas nama  Imaduddin Haris Nasution', 'Lurah', 'Admin', 'list_surat_kelahiran', '2017-06-02 03:39:54', '0');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `surat_kelahiran`
--

INSERT INTO `surat_kelahiran` (`id_surat`, `nomor_surat`, `nama`, `tempat_tanggal_lahir`, `jenis_kelamin`, `pekerjaan`, `alamat`, `nama_ayah_kandung`, `nama_ibu_kandung`, `anak_ke`, `tanggal_pembuatan`, `status`) VALUES
(1, 'SKL-001-2017', 'Benjamin Jr', 'Bandung, 10 Januari 1971', 'Laki-Laki', 'Programmer', 'Jalan Sukapura No 1, Bandung', 'Benjamin Sr', 'Elisabet', '1', '2017-04-25', 'Di Setujui'),
(2, 'SKL-003-2017', 'Sutejo', 'Bojongsoang 10 Januari 2010', 'Laki-Laki', '-', 'Jalan Bojongsoang Bandung', 'Sukirman', 'Sukijah', '4', '2017-04-25', 'Di Setujui'),
(3, 'SKL-004-2017', 'Imaduddin Haris Nasution', 'Bandung 19 Oktober 1995', 'Laki Laki', 'Software Developer', 'Jl. Sukabirus no 1 ', '-', '-', '1', '2017-05-20', 'Di Setujuii');

--
-- Trigger `surat_kelahiran`
--
DELIMITER //
CREATE TRIGGER `notif_accept_skl` AFTER UPDATE ON `surat_kelahiran`
 FOR EACH ROW INSERT INTO notification 
values 
(NULL,CONCAT_WS(' ','Telah diubah surat kelahiran atas nama ' , NEW.nama ) ,'Lurah','Admin','list_surat_kelahiran',SYSDATE(),'0')
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `notif_surat_baru_skl` AFTER INSERT ON `surat_kelahiran`
 FOR EACH ROW INSERT INTO notification values (NULL,'Ada surat kelahiran baru' ,'Admin','Lurah','list_surat_kelahiran',SYSDATE(),'0')
//
DELIMITER ;

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

--
-- Trigger `surat_kematian`
--
DELIMITER //
CREATE TRIGGER `notif_accept_skm` AFTER UPDATE ON `surat_kematian`
 FOR EACH ROW INSERT INTO notification 
values 
(NULL,CONCAT_WS(' ','Telah diubah surat kematian atas nama terlapor ' , NEW.terlapor_nama ) ,'Lurah','Admin','list_surat_kematian',SYSDATE(),'0')
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `notif_surat_baru_skm` AFTER INSERT ON `surat_kematian`
 FOR EACH ROW INSERT INTO notification values (NULL,'Ada surat kematian baru' ,'Admin','Lurah','list_surat_kematian',SYSDATE(),'0')
//
DELIMITER ;

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

--
-- Trigger `surat_keterangan_kk`
--
DELIMITER //
CREATE TRIGGER `notif_accept_skkk` AFTER UPDATE ON `surat_keterangan_kk`
 FOR EACH ROW INSERT INTO notification 
values 
(NULL,CONCAT_WS(' ','Telah diubah surat keterangan kk atas nama ' , NEW.nama_lengkap ) ,'Lurah','Admin','list_surat_keterangan_kk',SYSDATE(),'0')
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `notif_surat_baru_skkk` AFTER INSERT ON `surat_keterangan_kk`
 FOR EACH ROW INSERT INTO notification values (NULL,'Ada surat keterangan kk baru' ,'Admin','Lurah','list_surat_keterangan_kk',SYSDATE(),'0')
//
DELIMITER ;

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

--
-- Trigger `surat_keterangan_ktp`
--
DELIMITER //
CREATE TRIGGER `notif_accept_skktp` AFTER UPDATE ON `surat_keterangan_ktp`
 FOR EACH ROW INSERT INTO notification 
values 
(NULL,CONCAT_WS(' ','Telah diubah surat keterangan ktp atas nama ' , NEW.nama_lengkap ) ,'Lurah','Admin','list_surat_keterangan_ktp',SYSDATE(),'0')
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `notif_surat_baru_skktp` AFTER INSERT ON `surat_keterangan_ktp`
 FOR EACH ROW INSERT INTO notification values (NULL,'Ada surat keterangan ktp baru' ,'Admin','Lurah','list_surat_keterangan_ktp',SYSDATE(),'0')
//
DELIMITER ;

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
(1, '', 'Misyono', 'Jl. Pramuka Pecilon Duku', '003', '001', '', '3209205708900011', 'Desi Silvyanti Agustina', 'Keluarga', '', '004', '004', 'Bojongkenyot', 'Kemlaka Gede', 'Tengah Tani', 'Cirebon', 'Jawa Barat', 'Anggota Keluarga', 'Nomor KK Tetap', 'Membuat KK Baru', '3209205708900011', 'Desi Silvyanti Agustin', '2017-08-17', '', '2017-05-21', 'Di Setujui');

--
-- Trigger `surat_keterangan_pindah`
--
DELIMITER //
CREATE TRIGGER `notif_accept_skp` AFTER UPDATE ON `surat_keterangan_pindah`
 FOR EACH ROW INSERT INTO notification 
values 
(NULL,CONCAT_WS(' ','Telah diubah surat keterangan pindah atas nama ' , NEW.nama_lengkap ) ,'Lurah','Admin','list_surat_keterangan_pindah',SYSDATE(),'0')
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `notif_surat_baru_skp` AFTER INSERT ON `surat_keterangan_pindah`
 FOR EACH ROW INSERT INTO notification values (NULL,'Ada surat keterangan pindah baru' ,'Admin','Lurah','list_surat_keterangan_pindah',SYSDATE(),'0')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penduduk`
--

CREATE TABLE IF NOT EXISTS `tb_penduduk` (
`id` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `j_kelamin` varchar(100) DEFAULT NULL,
  `agama` varchar(100) DEFAULT NULL,
  `tmp_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `status_perkawinan` varchar(100) DEFAULT NULL,
  `kewarganegaraan` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kode_kelurahan` varchar(100) DEFAULT NULL,
  `nama_kepala_keluarga` varchar(100) DEFAULT NULL,
  `hubungan` varchar(100) DEFAULT NULL,
  `usia` int(100) DEFAULT NULL,
  `gol_darah` varchar(100) DEFAULT NULL,
  `etnis_suku` varchar(100) DEFAULT NULL,
  `pendidikan` varchar(100) DEFAULT NULL,
  `rt` varchar(100) DEFAULT NULL,
  `rw` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=555 ;

--
-- Dumping data untuk tabel `tb_penduduk`
--

INSERT INTO `tb_penduduk` (`id`, `nik`, `nama`, `j_kelamin`, `agama`, `tmp_lahir`, `tgl_lahir`, `alamat`, `status_perkawinan`, `kewarganegaraan`, `pekerjaan`, `dusun`, `kode_kelurahan`, `nama_kepala_keluarga`, `hubungan`, `usia`, `gol_darah`, `etnis_suku`, `pendidikan`, `rt`, `rw`) VALUES
(1, '_3209200700640007', 'AGUS KUSWAYA', 'LAKI-LAKI', 'Islam', 'GARUT', '07/08/1964', 'Jl.Pramuka No.33 TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_3209200905080006', 'AGUS KUSWAYA', 'Kepala Keluarga', 53, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '1', '1'),
(2, '_3209204107710376', 'NENENG ELLYANA WASNADI', 'PEREMPUAN', 'Islam', 'CIREBON', '01/07/1971', 'Jl.Pramuka No.33 TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209200905080006', 'AGUS KUSWAYA', 'Ibu', 46, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '1', '1'),
(3, '_32092005506940004', 'LUSI MAHARANI DEWI', 'PEREMPUAN', 'Islam', 'CIREBON', '15/05/1994', 'Jl.Pramuka No.33 TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200905080006', 'AGUS KUSWAYA', 'Anak Kandung', 23, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '1', '1'),
(4, '_3209201609990006', 'ALVIN RAMDHANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/09/1999', 'Jl.Pramuka No.33 TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200905080006', 'AGUS KUSWAYA', 'Anak Kandung', 18, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '1', '1'),
(5, '_321216010976008', 'AGUS SOERACHMAN', 'LAKI-LAKI', 'Islam', 'COMAL', '01/08/1975', 'KOMP GRAND TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_3209202509140010', 'AGUS SOERACHMAN', 'Kepala Keluarga', 42, 'Tidak Tahu', NULL, 'Sedang S-1/sederajat', '1', '1'),
(6, '_3212166803770001', 'ERNI RAHAYU', 'PEREMPUAN', 'Islam', 'SURABAYA', '15/01/1977', 'KOMP GRAND TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202509140010', 'AGUS SOERACHMAN', 'Istri', 40, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '1', '1'),
(7, '_3212154608900002', 'ABDULRAHMAN', 'LAKI-LAKI', 'Islam', 'SURABAYA', '16/06/1990', 'KOMP GRAND TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202509140010', 'AGUS SOERACHMAN', 'Anak Kandung', 27, 'Tidak Tahu', NULL, 'Sedang SLTP/Sederajat', '1', '1'),
(8, '_321310100390001', 'ABDUL MALIKAL M', 'LAKI-LAKI', 'Islam', 'SURABAYA', '10/06/1999', 'KOMP GRAND TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202509140010', 'AGUS SOERACHMAN', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '1', '1'),
(9, '_3212190141030001', 'ABDUL AZIZ', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/11/2000', 'KOMP GRAND TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202509140010', 'AGUS SOERACHMAN', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '1', '1'),
(10, '_3212166706100003', 'AISYAH LATHIFAH', 'PEREMPUAN', 'Islam', 'CIREBON', '27/06/2010', 'KOMP GRAND TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202509140010', 'AGUS SOERACHMAN', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(11, '_7308073008790002', 'AUGUS ISKANDAR NAY', 'LAKI-LAKI', 'Islam', 'CIREBON', '30/08/1979', 'JL,PRAMUKA GRAND TUPAREV 1 NO.15', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209201709150005', 'AUGUS ISKANDAR NAY', 'Kepala Keluarga', 38, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '1'),
(12, '_7306074705850002', 'WAHIDA', 'PEREMPUAN', 'Islam', 'UJUNG PANDANG', '07/05/1985', 'JL,PRAMUKA GRAND TUPAREV 1 NO.15', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201709150005', 'AUGUS ISKANDAR NAY', 'Istri', 32, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(13, '_7306070907130001', 'ANANDA DYPTA RAM ADHAN NAY', 'LAKI-LAKI', 'Islam', 'MAKASAR', '09/07/2013', 'JL,PRAMUKA GRAND TUPAREV 1 NO.15', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201709150005', 'AUGUS ISKANDAR NAY', 'Anak Kandung', 4, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(14, '_320920530660006', 'BERTI TORASI HASIBUAN ', 'PEREMPUAN', 'Islam', 'MEDAN', '13/06/1960', 'JL.KERTASUTA NO.25', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200203090025', 'BERTI TORASI HASIBUAN', 'Kepala Keluarga', 57, 'Tidak Tahu', 'Batak', 'Tamat SLTA/sederajat', '1', '1'),
(15, '_3209200601476001', 'DIDI SUPARDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/01/1947', 'PALEM REGENCY NO.A6 JL.PRAMUKA', 'Kawin', 'Warga Negara Indonesia', 'Purnawirawan/Pensiunan', 'SUTAWINANGUN', '_3209200911110003', 'DIDI SUPARDI', 'Kepala Keluarga', 71, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '1'),
(16, '_32092005910550001', 'MIMIN MINTASARI', 'PEREMPUAN', 'Islam', 'CIREBON', '18/10/1956', 'PALEM REGENCY NO.A6 JL.PRAMUKA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200911110003', 'DIDI SUPARDI', 'Istri', 61, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(17, '_3209201104670008', 'DIKI SUTRADA', 'LAKI-LAKI', 'Kristen', 'CIREBON', '11/04/1987', 'JL PRAMUKA PERUM GRAND TUPAREV 1 NO.04', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209201104120004', 'DIKI SUTRADA', 'Kepala Keluarga', 30, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(18, '_3274024604870005', 'CRISTI PURWANTI', 'PEREMPUAN', 'Kristen', 'JAKARTA', '05/04/1987', 'JL PRAMUKA PERUM GRAND TUPAREV 1 NO.04', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209201104120004', 'DIKI SUTRADA', 'Istri', 30, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(19, '_32092001970090031', 'GERALO B ESTRADA', 'LAKI-LAKI', 'Kristen', 'CIREBON', '01/07/2006', 'JL PRAMUKA PERUM GRAND TUPAREV 1 NO.04', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201104120004', 'DIKI SUTRADA', 'Anak Kandung', 11, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(20, '_3209200911130001', 'ADRIEL B ESTRADA', 'LAKI-LAKI', 'Kristen', 'CIREBON', '05/11/2013', 'JL PRAMUKA PERUM GRAND TUPAREV 1 NO.04', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201104120004', 'DIKI SUTRADA', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(21, '_3209202005830005', 'HENDRIK SINAGA', 'LAKI-LAKI', 'Islam', 'CIREBON', '20/06/1983', 'JL,KERTASUTA NO,25', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209201105100007', 'HENDRIK SINAGA', 'Kepala Keluarga', 34, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(22, '_3209204410870003', 'LASMA SIALLAGAN', 'PEREMPUAN', 'Islam', 'SEI BELUTU', '01/10/1967', 'JL,KERTASUTA NO,25', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201105100007', 'HENDRIK SINAGA', 'Istri', 50, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(23, '_3209204205100001', 'ELSA JUNIARTHA SINAGA', 'PEREMPUAN', 'Islam', 'CIREBON', '02/06/2010', 'JL,KERTASUTA NO,25', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201105100007', 'HENDRIK SINAGA', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Sedang TK/Kelompok Bermain', '1', '1'),
(24, '_3209204219850002', 'LASMA ELEONORA SINAGA', 'PEREMPUAN', 'Islam', 'CIREBON', '02/10/1985', 'JL,KERTASUTA NO,25', 'Belum Kawin', 'Warga Negara Indonesia', 'Dokter swasta', NULL, '_3209201105100007', 'HENDRIK SINAGA', 'Nenek', 32, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(25, '_3209200108920013', 'HERMAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/01/1993', 'JL. SUTAWINANGUN', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200603170001', 'HERMAN', 'Kepala Keluarga', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(26, '_3329165404950006', 'SITI SUCI', 'PEREMPUAN', 'Islam', 'BREBES', '14/04/1995', 'JL. SUTAWINANGUN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200603170001', 'HERMAN', 'Istri', 22, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '1', '1'),
(27, '_3209200906870007', 'IRWAN GUNAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/06/1987', 'JL. SUTAWINANGUN PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Pedagang barang kelontong', NULL, '_3209201005160001', 'IRWAN GUNAWAN', 'Kepala Keluarga', 30, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(28, '_3209205010930017', 'FANI WIDYASTUTI', 'PEREMPUAN', 'Islam', 'CIREBON', '10/10/1993', 'JL. SUTAWINANGUN PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201005160001', 'IRWAN GUNAWAN', 'Istri', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(29, '_3209205401120001', 'VINA WIDYA GUNAWAN', 'PEREMPUAN', 'Islam', 'CIREBON', '14/01/2012', 'JL. SUTAWINANGUN PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201005160001', 'IRWAN GUNAWAN', 'Anak Kandung', 5, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(30, '_3209200503160002', 'NEVAN ARDIANSYAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/03/2016', 'JL. SUTAWINANGUN PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201005160001', 'IRWAN GUNAWAN', 'Anak Kandung', 1, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(31, '_3209202210720001', 'ISKANDAR SJAHROMULHADI', 'LAKI-LAKI', 'Islam', 'PEKALONGAN', '22/10/1972', 'JL. PRAMUKA PERUMAHAN PALM REGENCY NO. B.3', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201612100002', 'ISKANDAR SJAHROMULHADI', 'Kepala Keluarga', 45, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(32, '_3209205612740007', 'TRI KUSUMANINGRUM', 'PEREMPUAN', 'Islam', 'PALEMBANG', '16/12/1974', 'JL. PRAMUKA PERUMAHAN PALM REGENCY NO. B.3', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201612100002', 'ISKANDAR SJAHROMULHADI', 'Istri', 43, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(33, '_3209204211000014', 'AFIFAH AMALIA KUSUMA', 'PEREMPUAN', 'Islam', 'CIREBON', '02/11/2000', 'JL. PRAMUKA PERUMAHAN PALM REGENCY NO. B.3', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201612100002', 'ISKANDAR SJAHROMULHADI', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '1', '1'),
(34, '_3209205901050003', 'ALIYYAH AZZAHRA TAQI KUSUMA', 'PEREMPUAN', 'Islam', 'CIREBON', '19/01/2005', 'JL. PRAMUKA PERUMAHAN PALM REGENCY NO. B.3', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201612100002', 'ISKANDAR SJAHROMULHADI', 'Anak Kandung', 12, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '1', '1'),
(35, '_3209201204060004', 'MUHAMMAD SATRIA PANDYA WIRYAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/04/2006', 'JL. PRAMUKA PERUMAHAN PALM REGENCY NO. B.3', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201612100002', 'ISKANDAR SJAHROMULHADI', 'Anak Kandung', 11, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '1', '1'),
(36, '_3274038112690009', 'MUHAMAD WAHYU SUPRAPTO', 'LAKI-LAKI', 'Islam', 'KOTA CIREBON', '01/12/1969', 'JL. PRAMUKA  PERUM GRAND TUPAREV RESIDENCE 1/18', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202910150003', 'MOHAMAD WAHYU SUPRAPTO', 'Kepala Keluarga', 48, 'Tidak Tahu', NULL, 'Sedang S-1/sederajat', '1', '1'),
(37, '_3271815612760005', 'R.RINI KURNIASHI', 'PEREMPUAN', 'Islam', 'JAKARTA', '16/12/1976', 'JL. PRAMUKA  PERUM GRAND TUPAREV RESIDENCE 1/18', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202910150003', 'MOHAMAD WAHYU SUPRAPTO', 'Istri', 40, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '1', '1'),
(38, '_3209200105840016', 'NGISOMUDDIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/05/1984', 'JL. PRAMUKA PERUM PALM REGENCY NO. B8', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209203004120028', 'NGISOMUDDIN', 'Kepala Keluarga', 33, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '1', '1'),
(39, '_3209206602930001', 'LINNA ANDRIANY', 'PEREMPUAN', 'Islam', 'INDRAMAYU', '26/02/1993', 'JL. PRAMUKA PERUM PALM REGENCY NO. B8', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209203004120028', 'NGISOMUDDIN', 'Istri', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(40, '_3209207108120002', 'NILAM ALWAJHI AQILLAH', 'PEREMPUAN', 'Islam', 'CIREBON', '31/08/2012', 'JL. PRAMUKA PERUM PALM REGENCY NO. B8', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209203004120028', 'NGISOMUDDIN', 'Anak Kandung', 5, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(41, '_3209201605840005', 'RONY GUNAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/05/1984', 'BLOK PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209202306150003', 'RONY GUNAWAN ', 'Kepala Keluarga', 33, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '1', '1'),
(42, '_3212244502020001', 'A.HAMIDAH', 'PEREMPUAN', 'Islam', 'INDRAMAYU', '05/02/1985', 'BLOK PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202306150003', 'RONY GUNAWAN ', 'Istri', 32, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(43, '_3212244221020001', 'HARUN RIZKI AL KARIM', 'LAKI-LAKI', 'Islam', 'INDRAMAYU', '22/12/2002', 'BLOK PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202306150003', 'RONY GUNAWAN ', 'Anak Kandung', 14, 'Tidak Tahu', NULL, 'Sedang SD/sederajat', '1', '1'),
(44, '_3274021706890006', 'RUDI PURWANTO HARUN', 'LAKI-LAKI', 'Islam', 'KOTA CIREBON', '17/06/1988', 'JL. PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200805150005', 'RUDI PURWANTO HARUN', 'Kepala Keluarga', 29, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '1', '1'),
(45, '_3209204409880007', 'YAYI ANNISA RACHIM', 'PEREMPUAN', 'Islam', 'CIREBON', '04/09/1988', 'JL. PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200805150005', 'RUDI PURWANTO HARUN', 'Istri', 29, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '1', '1'),
(46, '_3209200404770007', 'RUSANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/04/1977', 'JL. SUTAWINANGUN GG. SIKANGKUNG', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209201409110003', 'RUSANTO', 'Kepala Keluarga', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(47, '_3209204505830021', 'AAS ASRIAH', 'PEREMPUAN', 'Islam', 'CIREBON', '05/05/1983', 'JL. SUTAWINANGUN GG. SIKANGKUNG', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201409110003', 'RUSANTO', 'Istri', 34, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '1', '1'),
(48, '_3209201707080004', 'RADO PURNOMO', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/07/2008', 'JL. SUTAWINANGUN GG. SIKANGKUNG', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201409110003', 'RUSANTO', 'Anak Kandung', 9, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '1', '1'),
(49, '_3209201510550018', 'SAKRI', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/10/1955', 'JL.SUTAWINANGUN BLOK PECILON DUKUH', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201007120006', 'SAKRI', 'Kepala Keluarga', 62, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '1', '1'),
(50, '_3209205301650007', 'KURSIYANTI', 'PEREMPUAN', 'Islam', 'CIREBON', '13/01/1965', 'JL.SUTAWINANGUN BLOK PECILON DUKUH', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201007120006', 'SAKRI', 'Istri', 52, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '1', '1'),
(51, '_3209200711830005', 'ABDULAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/11/1982', 'JL.SUTAWINANGUN BLOK PECILON DUKUH', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201007120006', 'SAKRI', 'Anak Kandung', 35, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '1', '1'),
(52, '_3209200405880008', 'MAULANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/05/1988', 'JL.SUTAWINANGUN BLOK PECILON DUKUH', 'Belum Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209201007120006', 'SAKRI', 'Anak Kandung', 29, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '1', '1'),
(53, '_3209204603910014', 'ERNA', 'PEREMPUAN', 'Islam', 'CIREBON', '07/02/1991', 'JL.SUTAWINANGUN BLOK PECILON DUKUH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201007120006', 'SAKRI', 'Anak Kandung', 26, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(54, '_3209201903920001', 'ROBUNA', 'LAKI-LAKI', 'Islam', 'CIREBON', '19/03/1992', 'JL.SUTAWINANGUN BLOK PECILON DUKUH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201007120006', 'SAKRI', 'Anak Kandung', 25, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '1', '1'),
(55, '_3209202505500002', 'SAPTARI', 'LAKI-LAKI', 'Islam', 'MAJALENGKA', '25/05/1950', 'JL. KERTASUTA NO. 17', 'Kawin', 'Warga Negara Indonesia', 'Purnawirawan/Pensiunan', NULL, '_3209202402062438', 'SAPTARI', 'Kepala Keluarga', 67, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(56, '_3209206704530001', 'AISAH', 'PEREMPUAN', 'Islam', 'CIAMIS', '27/04/1953', 'JL. KERTASUTA NO. 17', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402062438', 'SAPTARI', 'Istri', 64, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '1', '1'),
(57, '_320920080162004', 'SARJONO', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/01/1962', 'JL.SUTAWINANGUN BLOK PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200105080016', 'SARJONO', 'Kepala Keluarga', 55, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '1', '1'),
(58, '_3209205204730011', 'ARYANAH', 'PEREMPUAN', 'Islam', 'CIREBON', '12/04/1973', 'JL.SUTAWINANGUN BLOK PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200105080016', 'SARJONO', 'Istri', 44, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '1', '1'),
(59, '_3209202805910002', 'ACHMAD JAELANI', 'LAKI-LAKI', 'Islam', 'CIREBON', '28/05/1991', 'JL.SUTAWINANGUN BLOK PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200105080016', 'SARJONO', 'Anak Kandung', 26, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '1', '1'),
(60, '_320920281097008', 'INDAH PUSPITA', 'PEREMPUAN', 'Islam', 'CIREBON', '28/10/1997', 'JL.SUTAWINANGUN BLOK PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200105080016', 'SARJONO', 'Anak Kandung', 20, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '1', '1'),
(61, '_3209202004560001', 'SISWANDI KARTOMIHARDJO', 'LAKI-LAKI', 'Islam', 'PURBALINGGA', '20/04/1956', 'JL. PRAMUKA NO. 37', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209202004110006', 'SISWANDI KARTOMIHARDJO', 'Kepala Keluarga', 61, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(62, '_3209206611610006', 'SUHARSI SISWADI', 'PEREMPUAN', 'Islam', 'SUMEDANG', '26/11/1961', 'JL. PRAMUKA NO. 37', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209202004110006', 'SISWANDI KARTOMIHARDJO', 'Istri', 56, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(63, '_3209204208900006', 'PURNAMA KUSUMAASTUTI', 'PEREMPUAN', 'Islam', 'CIREBON', '02/08/1990', 'JL. PRAMUKA NO. 37', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202004110006', 'SISWANDI KARTOMIHARDJO', 'Anak Kandung', 27, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '1', '1'),
(64, '_3209205205930009', 'DHIAN KARTIKASARI', 'PEREMPUAN', 'Islam', 'CIREBON', '12/05/1993', 'JL. PRAMUKA NO. 37', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202004110006', 'SISWANDI KARTOMIHARDJO', 'Anak Kandung', 24, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '1', '1'),
(65, '_3209205406970005', 'TRI CAHYANINGRUM', 'PEREMPUAN', 'Islam', 'CIREBON', '14/06/1997', 'JL. PRAMUKA NO. 37', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202004110006', 'SISWANDI KARTOMIHARDJO', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(66, '_3209204607870008', 'SITI KHODIJAH', 'PEREMPUAN', 'Islam', 'CIREBON', '05/07/1987', 'JL SUTAWINANGUN GG SIKANGKUNG', 'Kawin', 'Warga Negara Indonesia', 'Bidan swasta', 'SUTAWINANGUN', '_3209201807120004', 'SITI KHODIJAH', 'Kepala Keluarga', 30, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '1'),
(67, '_3209201006630006', 'SUHARTO', 'LAKI-LAKI', 'Islam', 'SUMEDANG', '10/06/1963', 'JL. PRAMUKA NO. 35', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209200501090499', 'SUHARTO', 'Kepala Keluarga', 54, 'Tidak Tahu', 'Sunda', 'Tamat S-1/sederajat', '1', '1'),
(68, '_3209206701640003', 'SUTRIYATI', 'PEREMPUAN', 'Islam', 'CIREBON', '27/01/1964', 'JL. PRAMUKA NO. 35', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200501090499', 'SUHARTO', 'Istri', 53, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(69, '_3209201310920006', 'SURYA DIMAS PRABOWO', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/10/1992', 'JL. PRAMUKA NO. 35', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200501090499', 'SUHARTO', 'Anak Kandung', 25, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(70, '_3209200506940011', 'SURYA AMAR PRAYOGO', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/06/1994', 'JL. PRAMUKA NO. 35', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200501090499', 'SUHARTO', 'Anak Kandung', 23, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(71, '_3209201002040002', 'SURYA DAFA PRAMUDIA', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/02/2004', 'JL. PRAMUKA NO. 35', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200501090499', 'SUHARTO', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '1', '1'),
(72, '_3209200610610006', 'SUHERI', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/10/1961', 'JL.SUTAWINANGUN ', 'Kawin', 'Warga Negara Indonesia', 'Sopir', 'SUTAWINANGUN', '_3209202402062472', 'SUHERI', 'Kepala Keluarga', 56, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '1', '1'),
(73, '_3209206210660002', 'TITI KARYATI', 'PEREMPUAN', 'Islam', 'CIREBON', '12/10/1966', 'JL.SUTAWINANGUN ', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202402062472', 'SUHERI', 'Istri', 51, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '1', '1'),
(74, '_3209200109920013', 'HERMAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/01/1993', 'JL.SUTAWINANGUN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', 'SUTAWINANGUN', '_3209202402062472', 'SUHERI', 'Anak Kandung', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '1', '1'),
(75, '_3209201209880013', 'SURYA BAYU PRASETIA', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/08/1988', 'JL. PRAMUKA NO. 35', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201008100009', 'SURYA BAYU PRASETIA', 'Kepala Keluarga', 29, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(76, '_3209154707930003', 'TIKA VALENSA', 'PEREMPUAN', 'Islam', 'CIREBON', '07/07/1993', 'JL. PRAMUKA NO. 35', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201008100009', 'SURYA BAYU PRASETIA', 'Istri', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '1'),
(77, '_320200101610005', 'TATANG SURYANA', 'LAKI-LAKI', 'Islam', 'BANDUNG', '01/01/1961', 'JL.KERTASUTA NO.05', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202402062442', 'TATANG SURYANA', 'Kepala Keluarga', 57, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '1'),
(78, '_3209204407660004', 'DEDE HINDASAH', 'PEREMPUAN', 'Islam', 'GARUT', '04/07/1965', 'JL.KERTASUTA NO.05', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_3209202402062442', 'TATANG SURYANA', 'Ibu', 52, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '1'),
(79, '_3209201907970007', 'RIAN ADITYA', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/07/1997', 'JL.KERTASUTA NO.05', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202402062442', 'TATANG SURYANA', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '1', '1'),
(80, '_3209200709720002', 'USEP TRYSENA', 'LAKI-LAKI', 'Islam', 'CIREBON', '07/09/1972', 'GRAND TUPAREV RESIDENCE BLOK GT 1 NO.22 TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209202708080037', 'USEP TRYSENA', 'Kepala Keluarga', 45, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '1', '1'),
(81, '_3209206605790009', 'RIA SRI WULANDARI', 'PEREMPUAN', 'Islam', 'CIREBON', '26/05/1979', 'GRAND TUPAREV RESIDENCE BLOK GT 1 NO.22 TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202708080037', 'USEP TRYSENA', 'Istri', 38, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '1', '1'),
(82, '_3209204108080002', 'REENA KHAIRUNNISA ', 'PEREMPUAN', 'Islam', 'CIREBON', '01/08/2008', 'GRAND TUPAREV RESIDENCE BLOK GT 1 NO.22 TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202708080037', 'USEP TRYSENA', 'Anak Kandung', 9, 'Tidak Tahu', NULL, 'Sedang SD/sederajat', '1', '1'),
(83, '_3209201710100001', 'RAFI PARSA ADINATA', 'LAKI-LAKI', 'Islam', 'GARUT', '17/10/2010', 'GRAND TUPAREV RESIDENCE BLOK GT 1 NO.22 TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202708080037', 'USEP TRYSENA', 'Anak Kandung', 7, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(84, '_3209200211670006', 'YANTO HARYANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '02/11/1967', 'JL.SUTAWINANGUN NO.142', 'Kawin', 'Warga Negara Indonesia', 'Dosen swasta', NULL, '_3209200910090004', 'YANTO HARYANTO,SPD.SKP', 'Kepala Keluarga', 50, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(85, '_3209204410700008', 'RUSWATI', 'PEREMPUAN', 'Islam', 'CILACAP', '04/10/1970', 'JL.SUTAWINANGUN NO.142', 'Kawin', 'Warga Negara Indonesia', 'Dosen swasta', NULL, '_3209200910090004', 'YANTO HARYANTO,SPD.SKP', 'Istri', 47, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '1'),
(86, '_3209200306960010', 'GILANG PRANAJA SAKTI', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/06/1996', 'JL.SUTAWINANGUN NO.142', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200910090004', 'YANTO HARYANTO,SPD.SKP', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '1', '1'),
(87, '_3209204903980014', 'SHAFIRA AZZAHRA', 'PEREMPUAN', 'Islam', 'CIREBON', '09/03/1998', 'JL.SUTAWINANGUN NO.142', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200910090004', 'YANTO HARYANTO,SPD.SKP', 'Anak Kandung', 19, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '1', '1'),
(88, '_3209201411110001', 'noya naufal fajlurahman', 'LAKI-LAKI', 'Islam', 'CIREBON', '14/11/2011', 'JL.SUTAWINANGUN NO.142', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200910090004', 'YANTO HARYANTO,SPD.SKP', 'Anak Kandung', 5, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '1'),
(89, '_3209202104800012', 'YUDI KURNIAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '21/01/1980', 'JL. KERTASUTA NO.01', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201002100003', 'YUDI KURNIAWAN', 'Kepala Keluarga', 37, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '1', '1'),
(90, '_3209205108800008', 'LAELA FITRIANI', 'PEREMPUAN', 'Islam', 'CIREBON', '11/08/1980', 'JL. KERTASUTA NO.01', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201002100003', 'YUDI KURNIAWAN', 'Istri', 37, 'Tidak Tahu', NULL, 'Tamat D-3/sederajat', '1', '1'),
(91, '_3209202402100004', 'ALFIAN RASHA AZKAYRA', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/02/2010', 'JL. KERTASUTA NO.01', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201002100003', 'YUDI KURNIAWAN', 'Anak Kandung', 7, 'Tidak Tahu', NULL, 'Sedang TK/Kelompok Bermain', '1', '1'),
(92, '_3209210411610005', 'YUSMAN', 'LAKI-LAKI', 'Islam', 'SUNGAIPUAR', '04/11/1961', 'JL. PRAMUKA PERUM GRAND TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209200406150005', 'YUSMAN', 'Kepala Keluarga', 56, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '1', '1'),
(93, '_3209216302750006', 'FENTY LIANA SARI', 'PEREMPUAN', 'Islam', 'PANGKALAN BRANDAN', '23/02/1975', 'JL. PRAMUKA PERUM GRAND TUPAREV', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200406150005', 'YUSMAN', 'Istri', 42, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '1', '1'),
(94, '_3209211107990005', 'MOHAMMAD RIDHWAN YUSFIANDA', 'LAKI-LAKI', 'Islam', 'MEDAN', '11/07/1999', 'JL. PRAMUKA PERUM GRAND TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200406150005', 'YUSMAN', 'Anak Kandung', 18, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '1', '1'),
(95, '_3209211411017990005', 'AHMAD RAMADHAN YUSFIANDA', 'LAKI-LAKI', 'Islam', 'MEDAN', '14/11/2001', 'JL. PRAMUKA PERUM GRAND TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200406150005', 'YUSMAN', 'Anak Kandung', 15, 'Tidak Tahu', NULL, 'Sedang SLTP/Sederajat', '1', '1'),
(96, '_3209214311080002', 'NAYLA AZZAHRA YUSFIANA', 'PEREMPUAN', 'Islam', 'PALEMBANG', '03/11/2008', 'JL. PRAMUKA PERUM GRAND TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200406150005', 'YUSMAN', 'Anak Kandung', 9, 'Tidak Tahu', NULL, 'Sedang TK/Kelompok Bermain', '1', '1'),
(97, '_3209151306950002', 'AGUS SHODIKIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/08/1986', 'BLOK PECILON DUKU GG.PLAMBANGAN N0.106', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209201902140002', 'AGUS SODIKIN', 'Kepala Keluarga', 31, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(98, '_3209206608810007', 'TALIA LESTARI DWI JINGGA', 'PEREMPUAN', 'Islam', 'CIREBON', '25/08/1997', 'BLOK PECILON DUKU GG.PLAMBANGAN N0.106', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201902140002', 'AGUS SODIKIN', 'Istri', 20, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(99, '_3209208101140001', 'HILMALNI MUTIARA KUNCANA UNGU', 'PEREMPUAN', 'Islam', 'CIREBON', '21/01/2014', 'BLOK PECILON DUKU GG.PLAMBANGAN N0.106', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201902140002', 'AGUS SODIKIN', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(100, '_3209200711830007', 'ARIEF WINARDI, S.KOM', 'LAKI-LAKI', 'Islam', 'BANDUNG', '07/11/1983', 'GG. PLAMBANGAN NO. 08 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201912120006', 'ARIEF WINARDI, S.KOM', 'Kepala Keluarga', 34, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '2', '1'),
(101, '_3209204412860004', 'EVA FARIDAH', 'PEREMPUAN', 'Islam', 'CIREBON', '04/12/1986', 'GG. PLAMBANGAN NO. 08 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201912120006', 'ARIEF WINARDI, S.KOM', 'Istri', 30, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(102, '_3209202912120001', 'IHSAN FATHIR FADILLAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '29/12/2012', 'GG. PLAMBANGAN NO. 08 PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201912120006', 'ARIEF WINARDI, S.KOM', 'Anak Kandung', 4, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(103, '_3209201906750001', 'AZIZ MUSLIM', 'LAKI-LAKI', 'Islam', 'KLATEN', '19/06/1975', 'JL. PRAMUKA REGENCY BLOK A NO. 03', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209201312100007', 'AZIZ MUSLIM', 'Kepala Keluarga', 42, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '2', '1'),
(104, '_3209204510750001', 'CHUZAIMAH', 'PEREMPUAN', 'Islam', 'SEMARANG', '05/10/1975', 'JL. PRAMUKA REGENCY BLOK A NO. 03', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201312100007', 'AZIZ MUSLIM', 'Istri', 42, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '2', '1'),
(105, '_3209204307020008', 'IZZA NABILA', 'PEREMPUAN', 'Islam', 'SEMARANG', '03/07/2002', 'JL. PRAMUKA REGENCY BLOK A NO. 03', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201312100007', 'AZIZ MUSLIM', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '2', '1'),
(106, '_3209200206050003', 'AHMAD ZAYDAN ', 'LAKI-LAKI', 'Islam', 'SEMARANG', '02/06/2005', 'JL. PRAMUKA REGENCY BLOK A NO. 03', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201312100007', 'AZIZ MUSLIM', 'Anak Kandung', 12, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '1'),
(107, '_3209205101080003', 'AQILA ZAKIYA', 'PEREMPUAN', 'Islam', 'CIREBON', '11/01/2008', 'JL. PRAMUKA REGENCY BLOK A NO. 03', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201312100007', 'AZIZ MUSLIM', 'Anak Kandung', 9, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '1'),
(108, '_3209391510630002', 'BUDIYONO', 'LAKI-LAKI', 'Islam', 'SEMARANG', '18/10/1963', 'PRAMUKA REGENCY BLOCK A-5 ', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209201302140001', 'BUDIYONO', 'Kepala Keluarga', 54, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '1'),
(109, '_3209395612730001', 'PAULINA', 'PEREMPUAN', 'Islam', 'CIREBON', '16/12/1973', 'PRAMUKA REGENCY BLOCK A-5 ', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209201302140001', 'BUDIYONO', 'Istri', 44, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '2', '1'),
(110, '_3209392006970004', 'KEVIN RICO BUDIYONO', 'LAKI-LAKI', 'Islam', 'CIREBON', '20/06/1997', 'PRAMUKA REGENCY BLOCK A-5 ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201302140001', 'BUDIYONO', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(111, '_32092005906080004', 'SALSA', 'PEREMPUAN', 'Islam', 'CIREBON', '20/06/2002', 'PRAMUKA REGENCY BLOCK A-5 ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201302140001', 'BUDIYONO', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(112, '_3209200308660005', 'CASMANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/08/1966', 'GG.PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209200410070125', 'CASMANA', 'Kepala Keluarga', 51, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(113, '_3209206105710008', 'NUNUNG SUGIARTI', 'PEREMPUAN', 'Islam', 'CIREBON', '21/05/1971', 'GG.PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200410070125', 'CASMANA', 'Istri', 46, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(114, '_3209205708910012', 'DESSY PERMATASARY', 'PEREMPUAN', 'Islam', 'CIREBON', '17/08/1991', 'GG.PLAMBANGAN', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200410070125', 'CASMANA', 'Anak Kandung', 26, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(115, '_3209205204980006', 'FENNY SETIAWATI', 'PEREMPUAN', 'Islam', 'CIREBON', '12/04/1998', 'GG.PLAMBANGAN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200410070125', 'CASMANA', 'Anak Kandung', 19, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '1'),
(116, '_320921703840003', 'DARNO', 'LAKI-LAKI', 'Islam', 'SUBANG', '17/03/1964', 'KAMP PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209200905140009', 'DARNO', 'Kepala Keluarga', 53, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(117, '_3209206704740008', 'AMI', 'PEREMPUAN', 'Islam', 'CIREBON', '27/04/1974', 'KAMP PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200905140009', 'DARNO', 'Istri', 43, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(118, '_3209207609910006', 'SEPTIANI OKTAVIA', 'PEREMPUAN', 'Islam', 'CIREBON', '30/09/1991', 'KAMP PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200905140009', 'DARNO', 'Anak Kandung', 26, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(119, '_3209204510950011', 'ICA FITRIANINGSIH', 'PEREMPUAN', 'Islam', 'CIREBON', '05/10/1996', 'KAMP PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200905140009', 'DARNO', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(120, '_3209204407720004', 'DASINI', 'PEREMPUAN', 'Islam', 'CIREBON', '04/07/1972', 'JL. SUTAWINANGUN', 'Kawin', 'Warga Negara Indonesia', 'Pedagang barang kelontong', NULL, '_3209202402063552', 'DASINI', 'Kepala Keluarga', 45, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(121, '_3209206105910007', 'MELI NOVI YANTI', 'PEREMPUAN', 'Islam', 'CIREBON', '21/05/1991', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402063552', 'DASINI', 'Anak Kandung', 26, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(122, '_3209206802950011', 'YENI KUSUMAWATI', 'PEREMPUAN', 'Islam', 'CIREBON', '28/02/1995', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402063552', 'DASINI', 'Anak Kandung', 22, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(123, '_3209202603980012', 'MOHAMAD KAUTSAR DEWANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '26/03/1998', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209202402063552', 'DASINI', 'Anak Kandung', 19, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '2', '1'),
(124, '_3209200111110003', 'JUANG ABDUL RAHMAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/11/2011', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402063552', 'DASINI', 'Anak Kandung', 6, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(125, '_3209200802880011', 'DONY SAPUTRA', 'LAKI-LAKI', 'Islam', 'BEKASI', '09/02/1985', 'JL.SUTAWINANGUN GG.PLAMBANGAN PECILON DUKUH', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209200506140005', 'DONY SAPUTRA', 'Kepala Keluarga', 32, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(126, '_3209236804960004', 'AMAH', 'PEREMPUAN', 'Islam', 'CIREBON', '20/04/1995', 'JL.SUTAWINANGUN GG.PLAMBANGAN PECILON DUKUH', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200506140005', 'DONY SAPUTRA', 'Istri', 22, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(127, '_3209204502620008', 'ENI SAYONAH', 'PEREMPUAN', 'Islam', 'CIREBON', '05/02/1962', 'JL. SUTAWINANGUN GG. PLAMBANGAN ', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200311080102', 'ENI SAYONAH', 'Kepala Keluarga', 55, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(128, '_3209200301830003', 'DENI ARIANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/01/1983', 'JL. SUTAWINANGUN GG. PLAMBANGAN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200311080102', 'ENI SAYONAH', 'Anak Kandung', 34, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(129, '_3209200501950004', 'DIAN ARDIANSYAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/01/1995', 'JL. SUTAWINANGUN GG. PLAMBANGAN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209200311080102', 'ENI SAYONAH', 'Anak Kandung', 22, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(130, '_3209202412950009', 'RICARDO MONTALBAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/12/1995', 'JL. SUTAWINANGUN GG. PLAMBANGAN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200311080102', 'ENI SAYONAH', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(131, '_3209201307970001', 'MUHAMMAD RANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/07/1997', 'JL. SUTAWINANGUN GG. PLAMBANGAN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200311080102', 'ENI SAYONAH', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '1'),
(132, '_3209204101000025', 'INDAH LESTARI', 'PEREMPUAN', 'Islam', 'CIREBON', '01/01/2000', 'JL. SUTAWINANGUN GG. PLAMBANGAN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200311080102', 'ENI SAYONAH', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '1'),
(133, '_32074010609670009', 'IWAN SUSIAWAN', 'LAKI-LAKI', 'Islam', 'BANDUNG', '05/09/1967', 'PRAMUKA REGENCY B2 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_320920171110009', 'IWAN SUSIWAN', 'Kepala Keluarga', 50, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '2', '1'),
(134, '_3274615609690001', 'PIPIN SOPIAH', 'PEREMPUAN', 'Islam', 'TASIKMALAYA', '16/09/1969', 'PRAMUKA REGENCY B2 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_320920171110009', 'IWAN SUSIWAN', 'Istri', 48, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(135, '_3209192108850007', 'JUNAEDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '21/08/1985', 'JL SUTAWINANGUN GG. PLAMBANGAN NO.15', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', 'SUTAWINANGUN', '_3209203001140001', 'JUNAEDI', 'Kepala Keluarga', 32, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '2', '1'),
(136, '_3209296704870010', 'APRILIYANI', 'PEREMPUAN', 'Islam', 'CIREBON', '17/04/1967', 'JL SUTAWINANGUN GG. PLAMBANGAN NO.15', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209203001140001', 'JUNAEDI', 'Istri', 50, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '1'),
(137, '_3209200607060003', 'RIZAL PRATAMA', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/07/2009', 'JL SUTAWINANGUN GG. PLAMBANGAN NO.15', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209203001140001', 'JUNAEDI', 'Anak Kandung', 8, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(138, '_3209200704690006', 'KADINA', 'LAKI-LAKI', 'Islam', 'CIREBON', '07/04/1969', 'JL. SUTAWINANGUN GG. PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Guru swasta', NULL, '_3209200311080084', 'KADINA', 'Kepala Keluarga', 48, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '2', '1'),
(139, '_3209206907730008', 'SRIYANTI', 'PEREMPUAN', 'Islam', 'CIREBON', '29/07/1973', 'JL. SUTAWINANGUN GG. PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200311080084', 'KADINA', 'Istri', 44, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(140, '_3209202110980011', 'KHOLID MAULANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '21/10/1998', 'JL. SUTAWINANGUN GG. PLAMBANGAN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200311080084', 'KADINA', 'Anak Kandung', 19, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '1'),
(141, '_3209205806490006', 'KADINI', 'PEREMPUAN', 'Islam', 'CIREBON', '18/06/1949', 'JL,SUTAWINANGUN GG,PLAMBANGAN', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200603120010', 'KADINI', 'Kepala Keluarga', 68, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(142, '_3209201204740008', 'M.TURMUDZI', 'LAKI-LAKI', 'Islam', 'BREBES', '12/04/1974', 'JL.SUTAWINANGUN PECILON DUKUH', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209201505080008', 'M.TURMUDZI', 'Kepala Keluarga', 43, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(143, '_3209204509780011', 'FITRIYANI', 'PEREMPUAN', 'Islam', 'CIREBON', '05/09/1978', 'JL.SUTAWINANGUN PECILON DUKUH', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201505080008', 'M.TURMUDZI', 'Istri', 39, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(144, '_3209202005990005', 'RIZQI NASRULAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '20/05/1999', 'JL.SUTAWINANGUN PECILON DUKUH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201505080008', 'M.TURMUDZI', 'Anak Kandung', 18, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '2', '1'),
(145, '_3209200901020011', 'FAIDZUR RAHMAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/01/2002', 'JL.SUTAWINANGUN PECILON DUKUH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201505080008', 'M.TURMUDZI', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '2', '1'),
(146, '_3209200509070002', 'BILAL MUADZIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/09/2007', 'JL.SUTAWINANGUN PECILON DUKUH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201505080008', 'M.TURMUDZI', 'Anak Kandung', 10, 'Tidak Tahu', NULL, 'Sedang SD/sederajat', '2', '1'),
(147, '_3209201606850016', 'MOHAMAD ANWAR GHOZALI', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/09/1985', 'JL SUTAWINANGUN GG. SIKANGKUNG', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209201902140001', 'MOHAMAD ANWAR GHOZALI', 'Kepala Keluarga', 32, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(148, '_3209264308920004', 'SITI AISYAH', 'PEREMPUAN', 'Islam', 'CIREBON', '03/08/1992', 'JL SUTAWINANGUN GG. SIKANGKUNG', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209201902140001', 'MOHAMAD ANWAR GHOZALI', 'Istri', 25, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '2', '1'),
(149, '_3209206908920001', 'NURUL HIDAYAH', 'PEREMPUAN', 'Islam', 'PANDEGLANG', '29/08/1992', 'JL.SUTAWINANGUN GG.PLAMBANGAN ', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201102150014', 'NURUL HIDAYAH', 'Kepala Keluarga', 25, 'Tidak Tahu', 'Sunda', 'Tamat SLTA/sederajat', '2', '1'),
(150, '_3209202811130003', 'ELVENT NOGISTRA PRATAMA', 'LAKI-LAKI', 'Islam', 'CIREBON', '28/11/2013', 'JL.SUTAWINANGUN GG.PLAMBANGAN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201102150014', 'NURUL HIDAYAH', 'Anak Kandung', 3, 'Tidak Tahu', 'Sunda', 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(151, '_3201012801810000', 'RUSDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '28/01/1981', 'PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202110140003', 'RUSDI', 'Kepala Keluarga', 36, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '1'),
(152, '_3201016007880010', 'NURAINI', 'PEREMPUAN', 'Islam', 'BOGOR', '20/07/1988', 'PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202110140003', 'RUSDI', 'Istri', 29, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '1'),
(153, '_3201011110080012', 'WISNU PRAWIRA', 'LAKI-LAKI', 'Islam', 'BOGOR', '11/10/2008', 'PLAMBANGAN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202110140003', 'RUSDI', 'Anak Kandung', 9, 'Tidak Tahu', NULL, 'Sedang TK/Kelompok Bermain', '2', '1'),
(154, '_3209201010540005', 'SAEBA', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/10/1954', 'GG. PLAMBANGAN NO. 8 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209202402064734', 'SAEBA', 'Kepala Keluarga', 63, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(155, '_3209205001580002', 'EI KARNESIH', 'PEREMPUAN', 'Islam', 'CIREBON', '10/01/1958', 'GG. PLAMBANGAN NO. 8 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402064734', 'SAEBA', 'Istri', 59, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(156, '_3209201510810006', 'DONI PRAHARA', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/10/1981', 'GG. PLAMBANGAN NO. 8 PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402064734', 'SAEBA', 'Anak Kandung', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(157, '_3209201911840002', 'MUHAMMAD SHAIRI', 'LAKI-LAKI', 'Islam', 'CIREBON', '19/11/1984', 'GG. PLAMBANGAN NO. 8 PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402064734', 'SAEBA', 'Anak Kandung', 33, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(158, '_3209201411880010', 'NOVIANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '14/11/1988', 'GG. PLAMBANGAN NO. 8 PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402064734', 'SAEBA', 'Anak Kandung', 29, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(159, '_3209202412740006', 'SULAEMAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/12/1974', 'JL.SUTAWINANGUN GG.PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201211120007', 'SULAEMAN', 'Kepala Keluarga', 42, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(160, '_3209205904770013', 'YUDHA AYU RIANINGSIH', 'PEREMPUAN', 'Islam', 'BANDUNG', '19/04/1977', 'JL.SUTAWINANGUN GG.PLAMBANGAN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201211120007', 'SULAEMAN', 'Istri', 40, 'Tidak Tahu', 'Sunda', 'Tamat SLTA/sederajat', '2', '1'),
(161, '_3209201410120004', 'NAUFAL UWAIS KHALISH', 'LAKI-LAKI', 'Islam', 'CIREBON', '14/10/2012', 'JL.SUTAWINANGUN GG.PLAMBANGAN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201211120007', 'SULAEMAN', 'Anak Kandung', 5, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(162, '_3673020804720001', 'SUMANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/04/1972', 'JL.SUTAWINANGUN', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209201709130008', 'SUMANTO', 'Kepala Keluarga', 45, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(163, '_3604034208750056', 'NURHAYATI', 'PEREMPUAN', 'Islam', 'SERANG', '02/08/1975', 'JL.SUTAWINANGUN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201709130008', 'SUMANTO', 'Istri', 42, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '1'),
(164, '_3604031107970057', 'AYUB RUDIYANTO', 'LAKI-LAKI', 'Islam', 'SERANG', '11/07/1997', 'JL.SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', 'SUTAWINANGUN', '_3209201709130008', 'SUMANTO', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '1'),
(165, '_3604030804020068', 'AGUN GUNAWAN', 'LAKI-LAKI', 'Islam', 'SERANG', '07/08/1999', 'JL.SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', 'SUTAWINANGUN', '_3209201709130008', 'SUMANTO', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '1'),
(166, '_3504031408050007', 'ANDRIYANTO', 'LAKI-LAKI', 'Islam', 'SERANG', '14/08/2006', 'JL.SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', 'SUTAWINANGUN', '_3209201709130008', 'SUMANTO', 'Anak Kandung', 11, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '1');
INSERT INTO `tb_penduduk` (`id`, `nik`, `nama`, `j_kelamin`, `agama`, `tmp_lahir`, `tgl_lahir`, `alamat`, `status_perkawinan`, `kewarganegaraan`, `pekerjaan`, `dusun`, `kode_kelurahan`, `nama_kepala_keluarga`, `hubungan`, `usia`, `gol_darah`, `etnis_suku`, `pendidikan`, `rt`, `rw`) VALUES
(167, '_3209201612120002', 'ANDIKA', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/12/2012', 'JL.SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201709130008', 'SUMANTO', 'Anak Kandung', 4, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(168, '_3209192501840006', 'SUNEDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '23/01/1998', 'JL PRAMUKA NO. 03', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202910140008', 'SUNEDI', 'Kepala Keluarga', 19, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '1'),
(169, '_3209205011890005', 'LELINDA', 'PEREMPUAN', 'Islam', 'CIREBON', '28/11/1989', 'JL PRAMUKA NO. 03', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202910140008', 'SUNEDI', 'Istri', 28, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '1'),
(170, '_3209204216140002', 'NAURA NASYA NIGA', 'PEREMPUAN', 'Islam', 'CIREBON', '02/10/2014', 'JL PRAMUKA NO. 03', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202910140008', 'SUNEDI', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '1'),
(171, '_3209200607700003', 'BUNGA', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/07/1970', 'JL SUTAWINANGUN GG MUSLIMIN', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209202402063565', 'BUNGA', 'Kepala Keluarga', 47, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(172, '_3209206503710011', 'SUMIYATI', 'PEREMPUAN', 'Islam', 'CIREBON', '14/03/1971', 'JL SUTAWINANGUN GG MUSLIMIN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202402063565', 'BUNGA', 'Istri', 46, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(173, '_3209201607940007', 'YUSUF ', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/07/1994', 'JL SUTAWINANGUN GG MUSLIMIN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202402063565', 'BUNGA', 'Anak Kandung', 23, 'Tidak Tahu', 'Bajawa', 'Tamat SLTP/sederajat', '3', '1'),
(174, '_320920162010008', 'MUHAMMAD YUNUS', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/02/2001', 'JL SUTAWINANGUN GG MUSLIMIN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202402063565', 'BUNGA', 'Anak Kandung', 16, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '1'),
(175, '_3208110203850005', 'CARMU', 'LAKI-LAKI', 'Islam', 'KUNINGAN', '02/03/1985', 'JL SUTAWINANGUN GG. MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', 'SUTAWINANGUN', '_3209202608140006', 'CARMU', 'Kepala Keluarga', 32, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(176, '_3209202306940007', 'SANIA', 'PEREMPUAN', 'Islam', 'CIREBON', '25/08/1994', 'JL SUTAWINANGUN GG. MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202608140006', 'CARMU', 'Istri', 23, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(177, '_3209200111140001', 'AHMAD SUPIAN EPENDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/11/2014', 'JL SUTAWINANGUN GG. MUSLIM', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202608140006', 'CARMU', 'Anak Kandung', 2, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '1'),
(178, '_3209200503670005', 'DEDE ROMLI', 'LAKI-LAKI', 'Islam', 'CIAMIS', '05/03/1967', 'PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202107080060', 'DEDE ROMLI', 'Kepala Keluarga', 50, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(179, '_3209205407690006', 'ROKANAH', 'PEREMPUAN', 'Islam', 'CIREBON', '14/07/1969', 'PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202107080060', 'DEDE ROMLI', 'Istri', 48, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(180, '_3209201304900007', 'NURDIN RAHADI', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/04/1990', 'PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202107080060', 'DEDE ROMLI', 'Anak Kandung', 27, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(181, '_3209205102400004', 'SAILA', 'PEREMPUAN', 'Islam', 'CIREBON', '11/02/1940', 'PECILON DUKU', 'Janda/Duda', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202107080060', 'DEDE ROMLI', 'Ibu', 77, 'Tidak Tahu', NULL, 'Tidak tamat SD/sederajat', '3', '1'),
(182, '_3209200107600538', 'MUSDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/07/1960', 'PECILON DUKU', 'Janda/Duda', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209202107080060', 'DEDE ROMLI', 'Famili lain', 57, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(183, '_3209200104790008', 'DODY', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/04/1979', 'JL. SUTAWINANGUN', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200501090068', 'DODY', 'Kepala Keluarga', 38, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(184, '_3209206402810010', 'VERA KARTINI', 'PEREMPUAN', 'Islam', 'CIREBON', '24/02/1981', 'JL. SUTAWINANGUN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200501090068', 'DODY', 'Istri', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(185, '_3209203103000003', 'MOHAMAD SIDIK', 'LAKI-LAKI', 'Islam', 'CIREBON', '31/03/2000', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200501090068', 'DODY', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '3', '1'),
(186, '_3209201907020005', 'IMAM SETIAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '19/07/2002', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200501090068', 'DODY', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '3', '1'),
(187, '_3209202202050001', 'VERYANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/02/2005', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200501090068', 'DODY', 'Anak Kandung', 12, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '1'),
(188, '_3209201911060002', 'PATUROHMAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '19/11/2006', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200501090068', 'DODY', 'Anak Kandung', 10, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '1'),
(189, '_3209205907100003', 'PUTRI NAPSO KHODIJAH', 'PEREMPUAN', 'Islam', 'CIREBON', '19/07/2010', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200501090068', 'DODY', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Sedang TK/Kelompok Bermain', '3', '1'),
(190, '_3274050908760010', 'ERI NUGRAHA', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/08/1976', 'JL.SUTAWINANGUN 102 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209203003150001', 'ERI NUGRAHA', 'Kepala Keluarga', 41, 'Tidak Tahu', 'Batak', 'Tamat SLTA/sederajat', '3', '1'),
(191, '_3209200912650004', 'RASIMAH TUMANGGER', 'PEREMPUAN', 'Islam', 'MEDAN', '09/12/1965', 'JL.SUTAWINANGUN 102 PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209203003150001', 'ERI NUGRAHA', 'Istri', 52, 'Tidak Tahu', 'Batak', 'Tamat SLTA/sederajat', '3', '1'),
(192, '_3209201211900006', 'ALIAS RUKUN', 'LAKI-LAKI', 'Islam', 'ACEH', '12/11/1990', 'JL.SUTAWINANGUN 102 PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209203003150001', 'ERI NUGRAHA', 'Anak Kandung', 27, 'Tidak Tahu', 'Batak', 'Tamat SLTA/sederajat', '3', '1'),
(193, '_3209202011950008', 'TRI ASTUTI', 'PEREMPUAN', 'Islam', 'CIREBON', '20/11/1995', 'JL.SUTAWINANGUN 102 PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209203003150001', 'ERI NUGRAHA', 'Anak Kandung', 22, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(194, '_3209205501450003', 'HOMSAH', 'PEREMPUAN', 'Islam', 'KR.AMPEL', '15/01/1945', 'JL,SUTAWINANGUN NO, 88', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201111150018', 'HOMSAH', 'Kepala Keluarga', 73, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(195, '_320920011054007', 'MOKHAMAD THOHA', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/10/1964', 'JL,SUTAWINANGUN NO, 88', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201111150018', 'HOMSAH', 'Anak Kandung', 53, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(196, '_3209202710850001', 'MUKHAMAD MAULANA ILYAS', 'LAKI-LAKI', 'Islam', 'CIREBON', '27/10/1966', 'JL,SUTAWINANGUN NO, 88', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201111150018', 'HOMSAH', 'Anak Kandung', 51, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(197, '_3209040411840007', 'JAENUDIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/11/1994', 'PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209202907150011', 'JAENUDIN', 'Kepala Keluarga', 23, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '1'),
(198, '_3209205306930013', 'WINTA SARI', 'PEREMPUAN', 'Islam', 'CIREBON', '13/06/1993', 'PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202907150011', 'JAENUDIN', 'Istri', 24, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '1'),
(199, '_3209200112560002', 'JOHARI', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/12/1955', 'JL SUTAWINANGUN GG MUSLIMIN ', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202402063569', 'JOHARI', 'Kepala Keluarga', 62, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(200, '_3209204211600004', 'WARSINI', 'PEREMPUAN', 'Islam', 'CIREBON', '23/09/1961', 'JL SUTAWINANGUN GG MUSLIMIN ', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202402063569', 'JOHARI', 'Istri', 56, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(201, '_3209204306810008', 'SRI SUNINGSIH', 'PEREMPUAN', 'Islam', 'CIREBON', '19/06/1981', 'JL SUTAWINANGUN GG MUSLIMIN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202402063569', 'JOHARI', 'Anak Kandung', 36, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(202, '_3209203009760004', 'DWITIYA ELVIRA', 'PEREMPUAN', 'Islam', 'CIREBON', '30/09/1985', 'JL SUTAWINANGUN GG MUSLIMIN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202402063569', 'JOHARI', 'Anak Kandung', 32, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(203, '_3209200309890006', 'TRISEPTIAN CAHYA', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/09/1999', 'JL SUTAWINANGUN GG MUSLIMIN ', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202402063569', 'JOHARI', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(204, '_3209201303770007', 'KUNTORO', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/05/1977', 'PECILON DUKU GG. MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402063624', 'KUNTORO', 'Kepala Keluarga', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(205, '_3209201305770002', 'KUNTORO', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/05/1977', 'JL PECILON DUKU GG MUSLIMIN', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200501090074', 'KUNTORO', 'Kepala Keluarga', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(206, '_3209204412770002', 'MARIA HASIBAH', 'PEREMPUAN', 'Islam', 'CIREBON', '04/12/1977', 'JL PECILON DUKU GG MUSLIMIN', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200501090074', 'KUNTORO', 'Istri', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(207, '_3209204412770002', 'MARIA HASIBAH', 'PEREMPUAN', 'Islam', 'CIREBON', '04/12/1977', 'PECILON DUKU GG. MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402063624', 'KUNTORO', 'Istri', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(208, '_3209202907030002', 'MUHAMMAD RASHA', 'LAKI-LAKI', 'Islam', 'CIREBON', '26/07/2003', 'JL PECILON DUKU GG MUSLIMIN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200501090074', 'KUNTORO', 'Anak Kandung', 14, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '1'),
(209, '_3209202807030002', 'MUHAMMAD FACHA', 'LAKI-LAKI', 'Islam', 'CIREBON', '28/07/2003', 'PECILON DUKU GG. MUSLIM', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402063624', 'KUNTORO', 'Anak Kandung', 14, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '1'),
(210, '_320920200140002', 'MUHAMMAD FAGIH HADKA', 'LAKI-LAKI', 'Islam', 'CIREBON', '20/02/2014', 'PECILON DUKU GG. MUSLIM', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402063624', 'KUNTORO', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '1'),
(211, '_3209202002140002', 'MUHAMMAD FAQIH HADZKA', 'LAKI-LAKI', 'Islam', 'CIREBON', '20/02/2014', 'JL PECILON DUKU GG MUSLIMIN', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200501090074', 'KUNTORO', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '1'),
(212, '_3209200403760010', 'MOHAMAD SOBIRIN MUSTOFA', 'LAKI-LAKI', 'Islam', 'BLORA', '04/03/1979', 'JL SUTAWINANGUN GG MUSLIMIN NO.102', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209200303140003', 'MOHAMAN SOBIRIN MUSTOFA', 'Kepala Keluarga', 38, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(213, '_3209204912950011', 'WIWIK', 'PEREMPUAN', 'Islam', 'BLORA', '08/12/1985', 'JL SUTAWINANGUN GG MUSLIMIN NO.102', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209200303140003', 'MOHAMAN SOBIRIN MUSTOFA', 'Istri', 31, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(214, '_3209200204110003', 'MUHAMMAD RIZQI MUSTOFA', 'LAKI-LAKI', 'Islam', 'BLORA', '02/04/2011', 'JL SUTAWINANGUN GG MUSLIMIN NO.102', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200303140003', 'MOHAMAN SOBIRIN MUSTOFA', 'Anak Kandung', 6, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '1'),
(215, '_3209201210680010', 'MUDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/10/1968', 'JL SUTAWINANGUN GG MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200506080008', 'MUDI', 'Kepala Keluarga', 49, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(216, '_3209205205690003', 'LARMI', 'PEREMPUAN', 'Islam', 'WONOGIRI', '12/05/1969', 'JL SUTAWINANGUN GG MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200506080008', 'MUDI', 'Istri', 48, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(217, '_3209202904990008', 'RISKY DARMAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '29/04/1999', 'JL SUTAWINANGUN GG MUSLIM', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200506080008', 'MUDI', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '3', '1'),
(218, '_3209206704030003', 'RISKA DAYANTI SALSABILA', 'PEREMPUAN', 'Islam', 'CIREBON', '27/04/2003', 'JL SUTAWINANGUN GG MUSLIM', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200506080008', 'MUDI', 'Anak Kandung', 14, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '3', '1'),
(219, '_3209201711090001', 'RYAN ADI PUTRO', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/11/2009', 'JL SUTAWINANGUN GG MUSLIM', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200506080008', 'MUDI', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Sedang TK/Kelompok Bermain', '3', '1'),
(220, '_3209206007390003', 'SARI', 'PEREMPUAN', 'Islam', 'CIREBON', '20/07/1939', 'JL SUTAWINANGUN GG MUSLIM', 'Janda/Duda', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200506080008', 'MUDI', 'Ibu', 78, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '1'),
(221, '_3209205507410007', 'SAMIYEM', 'PEREMPUAN', 'Islam', 'WONOGIRI', '15/07/1941', 'JL SUTAWINANGUN GG MUSLIM', 'Janda/Duda', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200506080008', 'MUDI', 'Mertua', 76, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(222, '_2172034605820001', 'NOK ELY', 'PEREMPUAN', 'Islam', 'CIREBON', '08/05/1982', 'JL.PRAMUKA GG.MUSLIM', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202307150013', 'NOK ELY', 'Kepala Keluarga', 35, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '1'),
(223, '_3209200705873700007', 'SAEFUDIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '07/06/1987', 'JL. SUTAWINANGUN GG. MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209200511100008', 'SAEFUDIN', 'Kepala Keluarga', 30, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '1'),
(224, '_3209205302890000', 'TRIANA', 'PEREMPUAN', 'Islam', 'CIREBON', '13/02/1988', 'JL. SUTAWINANGUN GG. MUSLIM', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200511100008', 'SAEFUDIN', 'Istri', 29, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '1'),
(225, '_3209207110100001', 'KINANTI OKTAVIA', 'PEREMPUAN', 'Islam', 'CIREBON', '31/10/2010', 'JL. SUTAWINANGUN GG. MUSLIM', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200511100008', 'SAEFUDIN', 'Anak Kandung', 7, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '3', '1'),
(226, '_3209209182306610002', 'SALIM JOHAR', 'LAKI-LAKI', 'Islam', 'CIREBON', '23/06/1951', 'JL PRAMUKA GG MUSLIMIN NO.18', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202710140005', 'SALIM JOHAR', 'Kepala Keluarga', 66, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(227, '_3209205500900001', 'LUKI INDAH SARI', 'PEREMPUAN', 'Islam', 'CIREBON', '15/02/1990', 'JL PRAMUKA GG MUSLIMIN NO.18', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202710140005', 'SALIM JOHAR', 'Istri', 27, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '1'),
(228, '_3209201603650002', 'SARNEN', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/03/1955', 'JL PRAMUKA GG MUSLIM NO.16', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200212080028', 'SARNEN', 'Kepala Keluarga', 62, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(229, '_3209204704650002', 'TARESI', 'PEREMPUAN', 'Islam', 'CIREBON', '07/04/1956', 'JL PRAMUKA GG MUSLIM NO.16', 'Kawin', 'Warga Negara Indonesia', 'Pedagang barang kelontong', 'SUTAWINANGUN', '_3209200212080028', 'SARNEN', 'Istri', 61, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(230, '_3209202800970010', 'ARYONO', 'LAKI-LAKI', 'Islam', 'CIREBON', '25/05/1987', 'JL PRAMUKA GG MUSLIM NO.16', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200212080028', 'SARNEN', 'Anak Kandung', 30, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(231, '_3209132312790002', 'SUPARDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '23/12/1979', 'JL SUTAWINANGUN NO 90', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200601150001', 'SUPARDI', 'Kepala Keluarga', 37, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '3', '1'),
(232, '_3209137110640002', 'MARLIAH', 'PEREMPUAN', 'Islam', 'CIREBON', '31/10/1944', 'JL SUTAWINANGUN NO 90', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200601150001', 'SUPARDI', 'Istri', 73, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '1'),
(233, '_3209130302120001', 'AZIS GOPUR', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/02/2012', 'JL SUTAWINANGUN NO 90', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200601150001', 'SUPARDI', 'Anak Kandung', 5, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '1'),
(234, '_3209132903140001', 'MARDIANA YASMIN', 'PEREMPUAN', 'Islam', 'CIREBON', '29/03/2014', 'JL SUTAWINANGUN NO 90', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200601150001', 'SUPARDI', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '1'),
(235, '_3209151203740004', 'TARIPIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/03/1974', 'JL. PRAMUKA PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200306150002', 'TARIPIN', 'Kepala Keluarga', 43, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '1'),
(236, '_3209204300750001', 'SUNY CHRIS LIYENI', 'PEREMPUAN', 'Islam', 'CIREBON', '03/08/1978', 'JL. PRAMUKA PECILON DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200306150002', 'TARIPIN', 'Istri', 39, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '1'),
(237, '_3209201105650015', 'WAHYUDIN', 'LAKI-LAKI', 'Islam', 'INDRAMAYU', '11/05/1968', 'JL. PRAMUKA PEC. DUKU', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209200906090032', 'WAHYUDIN', 'Kepala Keluarga', 49, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '1'),
(238, '_3209201200700005', 'ANIRAH', 'PEREMPUAN', 'Islam', 'CIREBON', '02/06/1970', 'JL. PRAMUKA PEC. DUKU', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200906090032', 'WAHYUDIN', 'Istri', 47, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '1'),
(239, '_3209201611910015', 'RICKY BUDI YANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/11/1991', 'JL. PRAMUKA PEC. DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200906090032', 'WAHYUDIN', 'Anak Kandung', 26, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '1'),
(240, '_3209205905930001', 'DWI ANTIA WHYUNI', 'PEREMPUAN', 'Islam', 'CIREBON', '19/06/1993', 'JL. PRAMUKA PEC. DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200906090032', 'WAHYUDIN', 'Anak Kandung', 24, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '1'),
(241, '_3209201602650002', 'AGUS SALIM, S.Sos', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/02/1965', 'JL PERINTIS SUTAWINANGUN NO. 32', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209202402065983', 'AGUS SALIM, S.Sos', 'Kepala Keluarga', 52, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(242, '_3209205307640002', 'YANI HERYANI', 'PEREMPUAN', 'Islam', 'CIAMIS', '13/07/1964', 'JL PERINTIS SUTAWINANGUN NO. 32', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402065983', 'AGUS SALIM, S.Sos', 'Istri', 53, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(243, '_3209206707050002', 'DIANDRA KARENINA', 'PEREMPUAN', 'Islam', 'CIREBON', '27/07/2005', 'JL PERINTIS SUTAWINANGUN NO. 32', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402065983', 'AGUS SALIM, S.Sos', 'Anak Kandung', 12, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '4', '1'),
(244, '_3209201905700003', 'ASEP KURNIAWA', 'LAKI-LAKI', 'Islam', 'GARUT', '19/05/1970', 'JL PRAMUKA NO.03', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_32092003110070526', 'ASEP KURNIAWAN', 'Kepala Keluarga', 47, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(245, '_3209205506690031', 'TETTY FATIMAH', 'PEREMPUAN', 'Islam', 'SURABAYA', '19/06/1969', 'JL PRAMUKA NO.03', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_32092003110070526', 'ASEP KURNIAWAN', 'Istri', 48, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(246, '_3209202104990006', 'CHAIRY AZZADYN KURNAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '21/04/1999', 'JL PRAMUKA NO.03', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_32092003110070526', 'ASEP KURNIAWAN', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(247, '_320920160680002', 'SARU ZAHBAH KARUAN KURNIAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/06/2008', 'JL PRAMUKA NO.03', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_32092003110070526', 'ASEP KURNIAWAN', 'Anak Kandung', 9, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '1'),
(248, '_3209202008740003', 'ATOIB', 'LAKI-LAKI', 'Islam', 'JAKARTA', '20/08/1974', 'JL,SUTAWINANGUN GG,PERINTIS NO 10', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209020310070543', 'ATOIB', 'Kepala Keluarga', 43, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(249, '_3209205019740011', 'IDA', 'PEREMPUAN', 'Islam', 'CIREBON', '10/10/1974', 'JL,SUTAWINANGUN GG,PERINTIS NO 10', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209020310070543', 'ATOIB', 'Istri', 43, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(250, '_3209205602960003', 'DAMAYANTI', 'PEREMPUAN', 'Islam', 'CIREBON', '16/02/1996', 'JL,SUTAWINANGUN GG,PERINTIS NO 10', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209020310070543', 'ATOIB', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '4', '1'),
(251, '_3209204506040002', 'NURUL HAYATI', 'PEREMPUAN', 'Islam', 'CIREBON', '05/06/2004', 'JL,SUTAWINANGUN GG,PERINTIS NO 10', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209020310070543', 'ATOIB', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '4', '1'),
(252, '_3209205502230003', 'SUKARTI', 'PEREMPUAN', 'Islam', 'CIREBON', '15/02/1923', 'JL,SUTAWINANGUN GG,PERINTIS NO 10', 'Janda/Duda', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209020310070543', 'ATOIB', 'Mertua', 95, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(253, '_3209205001570005', 'ELLYTA', 'PEREMPUAN', 'Islam', 'CIREBON', '16/01/1957', 'JL.PRAMUKA NO.2', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201306140002', 'ELLYTA', 'Kepala Keluarga', 60, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(254, '_3209204208900011', 'INTAN YULIANA', 'PEREMPUAN', 'Islam', 'CIREBON', '02/09/1996', 'JL.PRAMUKA NO.2', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201306140002', 'ELLYTA', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(255, '_3209200209680001', 'ENTOH', 'LAKI-LAKI', 'Islam', 'GARUT', '02/09/1968', 'JL.PRAMUKA NO.03', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202010080150', 'ENTOH', 'Kepala Keluarga', 49, 'Tidak Tahu', 'Sunda', 'Tamat SLTA/sederajat', '4', '1'),
(256, '_3209205005720009', 'TUSRI RAHAYU', 'PEREMPUAN', 'Islam', 'MADIUN', '10/05/1972', 'JL.PRAMUKA NO.03', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202010080150', 'ENTOH', 'Istri', 45, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '1'),
(257, '_3209202709920006', 'MANAL WIDAD TAMAMI', 'LAKI-LAKI', 'Islam', 'GARUT', '27/09/1992', 'JL.PRAMUKA NO.03', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202010080150', 'ENTOH', 'Anak Kandung', 25, 'Tidak Tahu', 'Sunda', 'Tamat SLTA/sederajat', '4', '1'),
(258, '_3209205705990011', 'MUHAMMAD ALDI YANSAH', 'LAKI-LAKI', 'Islam', 'GARUT', '12/09/2003', 'JL.PRAMUKA NO.03', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202010080150', 'ENTOH', 'Anak Kandung', 14, 'Tidak Tahu', 'Sunda', 'Sedang SD/sederajat', '4', '1'),
(259, '_3209205705990010', 'ERINA RAHMATUN NAZILAH', 'PEREMPUAN', 'Islam', 'GARUT', '17/05/1999', 'JL.PRAMUKA NO.03', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202010080150', 'ENTOH', 'Anak Kandung', 18, 'Tidak Tahu', 'Sunda', 'Sedang SLTA/sederajat', '4', '1'),
(260, '_3209204605640013', 'INDAH YANI', 'PEREMPUAN', 'Islam', 'CIREBON', '05/05/1984', 'JL.SUTAWINANGUN GG.PRINTIS ', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202204140004', 'INDAH YANI', 'Kepala Keluarga', 33, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '1'),
(261, '_3209202704100004', 'RAFA APRILIYNA', 'LAKI-LAKI', 'Islam', 'CIREBON', '27/04/2010', 'JL.SUTAWINANGUN GG.PRINTIS ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202204140004', 'INDAH YANI', 'Anak Angkat', 7, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(262, '_3209201311130001', 'RAFI MAULANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/11/2013', 'JL.SUTAWINANGUN GG.PRINTIS ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202204140004', 'INDAH YANI', 'Anak Angkat', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(263, '_3209209507910015', 'INDRA YANI', 'PEREMPUAN', 'Islam', 'CIREBON', '05/07/1991', 'JL.SUTAWINANGUN GG.PERINTIS', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200407130008', 'INDRA YANI', 'Kepala Keluarga', 26, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '4', '1'),
(264, '_3209204311100003', 'ABEL MERLI ANDINI', 'PEREMPUAN', 'Islam', 'CIREBON', '03/11/2010', 'JL.SUTAWINANGUN GG.PERINTIS', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200407130008', 'INDRA YANI', 'Anak Kandung', 6, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(265, '_320920620512002', 'MAHESA ZINAR', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/05/2012', 'JL.SUTAWINANGUN GG.PERINTIS', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200407130008', 'INDRA YANI', 'Anak Kandung', 5, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(266, '_3209201567760016', 'JAJANG FAJAR SELAMET', 'LAKI-LAKI', 'Islam', 'KUNINGAN', '19/07/1978', 'JL SUTAWINANGUN NO.72', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_320920301110002', 'JAJANG FAJAR SELAMET', 'Kepala Keluarga', 39, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(267, '_3209204107770906', 'AINI LESTARI', 'PEREMPUAN', 'Islam', 'SUNGAI GERONG', '30/06/1979', 'JL SUTAWINANGUN NO.72', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_320920301110002', 'JAJANG FAJAR SELAMET', 'Istri', 38, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(268, '_3209201512390001', 'DIMAS PRASETIA ELLANG', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/12/2009', 'JL SUTAWINANGUN NO.72', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_320920301110002', 'JAJANG FAJAR SELAMET', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(269, '_3209209612130001', 'ALISHA PUTRI LESTARI', 'PEREMPUAN', 'Islam', 'CIREBON', '25/12/2014', 'JL SUTAWINANGUN NO.72', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_320920301110002', 'JAJANG FAJAR SELAMET', 'Anak Kandung', 2, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(270, '_3209201210600016', 'JUKI SUSANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/10/1960', 'JL. SUTAWINANGUN', 'Janda/Duda', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209201101160005', 'JUKI SUSANTO', 'Kepala Keluarga', 57, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '1'),
(271, '_3209205007900007', 'WULAN INDAH SARI', 'PEREMPUAN', 'Islam', 'CIREBON', '10/07/1990', 'JL. SUTAWINANGUN', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201101160005', 'JUKI SUSANTO', 'Anak Kandung', 27, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(272, '_3209200510830008', 'NUR KHASAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/10/1983', 'JL.WIDARASARI 3 TUPAREV', 'Belum Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209202011120002', 'NUR KHASAN', 'Kepala Keluarga', 34, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '4', '1'),
(273, '_3209200806690007', 'RUSKADI', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/06/1969', 'JL.PERINTIS', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209200310070575', 'RUSKADI', 'Kepala Keluarga', 48, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(274, '_3209206212760003', 'RODIYAH', 'PEREMPUAN', 'Islam', 'CIREBON', '22/12/1976', 'JL.PERINTIS', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200310070575', 'RUSKADI', 'Istri', 40, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '1'),
(275, '_3209206807990014', 'ANA MARIANA', 'PEREMPUAN', 'Islam', 'CIREBON', '28/07/1999', 'JL.PERINTIS', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200310070575', 'RUSKADI', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '4', '1'),
(276, '_3209204107560706', 'SAIMAH', 'PEREMPUAN', 'Islam', 'CIREBON', '01/07/1958', 'JL.SUTAWINANGUN GG.PRINTIS', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201512080025', 'SAIMAH', 'Kepala Keluarga', 59, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '4', '1'),
(277, '_3209200306070009', 'SANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/06/1997', 'JL.SUTAWINANGUN GG.PRINTIS', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201512080025', 'SAIMAH', 'Anak Angkat', 20, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(278, '_3209204901000005', 'FITRIA DARI', 'PEREMPUAN', 'Islam', 'CIREBON', '09/01/2000', 'JL.SUTAWINANGUN GG.PRINTIS', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201512080025', 'SAIMAH', 'Anak Angkat', 17, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '1'),
(279, '_3209200910640004', 'SARNADI', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/10/1964', 'JL. PERINTIS NO. 23', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402064726', 'SARNADI', 'Kepala Keluarga', 53, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(280, '_3209205705760008', 'TUSMINI', 'PEREMPUAN', 'Islam', 'CILACAP', '17/05/1976', 'JL. PERINTIS NO. 23', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402064726', 'SARNADI', 'Istri', 41, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '1'),
(281, '_3209201705900005', 'INDRA ARDIANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/05/1990', 'JL. PERINTIS NO. 23', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Honorer', NULL, '_3209202402064726', 'SARNADI', 'Anak Kandung', 27, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(282, '_3209205008070001', 'MAYA NURSUCI', 'PEREMPUAN', 'Islam', 'CIREBON', '10/08/2007', 'JL. PERINTIS NO. 23', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402064726', 'SARNADI', 'Anak Kandung', 10, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '4', '1'),
(283, '_3209202901110001', 'SURYO ATMOJO', 'LAKI-LAKI', 'Islam', 'CIREBON', '29/01/2011', 'JL. PERINTIS NO. 23', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402064726', 'SARNADI', 'Anak Kandung', 6, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(284, '_3209202703160001', 'SUKMA JATI', 'LAKI-LAKI', 'Islam', 'CIREBON', '27/03/2016', 'JL. PERINTIS NO. 23', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402064726', 'SARNADI', 'Anak Kandung', 1, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(285, '_3209206111410001', 'SITI SUBTIYAH', 'PEREMPUAN', 'Islam', 'INDRAMAYU', '21/11/1941', 'JL SUTAWINANGUN NO.15', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200603120001', 'SITI SUBTIYAH', 'Kepala Keluarga', 76, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '1'),
(286, '_3209200508880010', 'AGUS LEO ARDIANSYAH', 'LAKI-LAKI', 'Islam', 'YOGYAKARTA', '05/08/1988', 'JL SUTAWINANGUN NO.15', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200603120001', 'SITI SUBTIYAH', 'Anak Kandung', 29, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(287, '_3209205111650007', 'SRIYANI', 'PEREMPUAN', 'Islam', 'CIREBON', '11/11/1965', 'JL.PERINTIS PECILON DUKUH', 'Janda/Duda', 'Warga Negara Indonesia', 'Pembantu rumah tangga', NULL, '_3209202505110004', 'SRIYANI', 'Kepala Keluarga', 52, 'Tidak Tahu', 'Jawa', 'Tidak tamat SD/sederajat', '4', '1'),
(288, '_3209206705920004', 'RETNO DININGSIH', 'PEREMPUAN', 'Islam', 'CIREBON', '27/05/1992', 'JL.PERINTIS PECILON DUKUH', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202505110004', 'SRIYANI', 'Anak Kandung', 25, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(289, '_3209202205620009', 'SUMARNO', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/05/1962', 'JL. PERINTIS NO. 33', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209201412090012', 'SUMARNO', 'Kepala Keluarga', 55, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(290, '_3209204112750013', 'SURENI', 'PEREMPUAN', 'Islam', 'CIREBON', '01/12/1975', 'JL. PERINTIS PECILON DUKU', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202605160007', 'SURENI', 'Kepala Keluarga', 42, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(291, '_3209206712980010', 'KIRANA PUSPITA DEWI', 'PEREMPUAN', 'Islam', 'CIREBON', '27/12/1998', 'JL. PERINTIS PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202605160007', 'SURENI', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '4', '1'),
(292, '_3209201601080003', 'SHURA ALZIAN SYACH', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/01/2008', 'JL. PERINTIS PECILON DUKU', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202605160007', 'SURENI', 'Anak Kandung', 9, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '4', '1'),
(293, '_3209200311600013', 'SURYANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '02/11/1980', 'JL SUTAWINANGUN GG PRINTIS NO.22', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209201101110008', 'SURYANA', 'Kepala Keluarga', 37, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(294, '_3209204209870013', 'SITI JULAEHA', 'PEREMPUAN', 'Islam', 'CIREBON', '02/09/1987', 'JL SUTAWINANGUN GG PRINTIS NO.22', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201101110008', 'SURYANA', 'Istri', 30, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '1'),
(295, '_3209204101110001', 'LAYUNG M', 'PEREMPUAN', 'Islam', 'CIREBON', '01/01/2011', 'JL SUTAWINANGUN GG PRINTIS NO.22', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201101110008', 'SURYANA', 'Anak Angkat', 6, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '1'),
(296, '_3209202610730003', 'WAHYU M WALY PUTRA', 'LAKI-LAKI', 'Islam', 'DKI JAKARTA', '06/10/1973', 'JL.PRAMUKA NO.02', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_3209200210090012', 'WAHYU M WALY PUTRA', 'Kepala Keluarga', 44, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(297, '_32092054099011', 'FITA FITRIYAH', 'PEREMPUAN', 'Islam', 'CIREBON', '14/08/1980', 'JL.PRAMUKA NO.02', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_3209200210090012', 'WAHYU M WALY PUTRA', 'Istri', 37, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '4', '1'),
(298, '_320920090900061', 'ALI WAHYU WALY', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/02/2009', 'JL.PRAMUKA NO.02', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200210090012', 'WAHYU M WALY PUTRA', 'Anak Kandung', 8, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '1'),
(299, '_3209201312620004', 'EMAN SULAEMAN', 'LAKI-LAKI', 'Islam', 'CIREON', '13/12/1962', 'JL. WIDARASARI III GG. FATAHILAH NO. 34', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209202402067096', 'EMAN SULAEMAN', 'Kepala Keluarga', 55, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(300, '_3209205706690007', 'JUBAEDAH', 'PEREMPUAN', 'Islam', 'MAJALENGKA', '17/08/1969', 'JL. WIDARASARI III GG. FATAHILAH NO. 34', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402067096', 'EMAN SULAEMAN', 'Istri', 48, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '5', '1'),
(301, '_3209200108870008', 'YAYAN MOHAMAD SUBHAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/08/1987', 'JL. WIDARASARI III GG. FATAHILAH NO. 34', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402067096', 'EMAN SULAEMAN', 'Anak Kandung', 30, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(302, '_3209205701960005', 'ADE RACHMAWATI', 'PEREMPUAN', 'Islam', 'CIREBON', '17/01/1996', 'JL. WIDARASARI III GG. FATAHILAH NO. 34', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402067096', 'EMAN SULAEMAN', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(303, '_3209204210900008', 'WARTI NUR SALAMAH', 'PEREMPUAN', 'Islam', 'CIREBON', '02/10/1999', 'JL. WIDARASARI III GG. FATAHILAH NO. 34', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402067096', 'EMAN SULAEMAN', 'Anak Kandung', 18, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '5', '1'),
(304, '_3209204505540009', 'ENTIN', 'PEREMPUAN', 'Islam', 'CIREBON', '05/05/1954', 'JL.SUTAWINANGUN GG.BERKAH', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_320920230303090027', 'ENTIN', 'Kepala Keluarga', 63, 'Tidak Tahu', 'Sunda', 'Tamat SD/sederajat', '5', '1'),
(305, '_3209204505540009', 'ENTIN', 'PEREMPUAN', 'Islam', 'CIREBON', '05/05/1954', 'JL. SUTAWINANGUN GG. BERKAH', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202303090027', 'ENTIN', 'Kepala Keluarga', 63, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '5', '1'),
(306, '_3209204308740003', 'ELY', 'PEREMPUAN', 'Islam', 'CIREBON', '03/08/1974', 'JL.SUTAWINANGUN GG.BERKAH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_320920230303090027', 'ENTIN', 'Anak Kandung', 43, 'Tidak Tahu', 'Sunda', 'Tamat SLTA/sederajat', '5', '1'),
(307, '_3209204308740003', 'ELY', 'PEREMPUAN', 'Islam', ' CIREBON', '03/08/1974', 'JL. SUTAWINANGUN GG. BERKAH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202303090027', 'ENTIN', 'Anak Kandung', 43, 'Tidak Tahu', NULL, 'Sedang S-1/sederajat', '5', '1'),
(308, '_3209204604980007', 'ROSITA AYU LESTARI', 'PEREMPUAN', 'Islam', 'CIREBON', '06/04/1998', 'JL.SUTAWINANGUN GG.BERKAH', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_320920230303090027', 'ENTIN', 'Anak Kandung', 19, 'Tidak Tahu', 'Sunda', 'Sedang SLTA/sederajat', '5', '1'),
(309, '_32092024116517910', 'FIRMAN SYAFA''AT', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/11/1965', 'JL. SUTAWINANGUN NO. 68', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209201309071097', 'FIRMAN SYAFA''AT', 'Kepala Keluarga', 52, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '5', '1'),
(310, '_32092043096817910', 'NURYATI', 'PEREMPUAN', 'Islam', 'CIREBON', '03/09/1968', 'JL. SUTAWINANGUN NO. 68', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201309071097', 'FIRMAN SYAFA''AT', 'Istri', 49, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(311, '_3209200404620006', 'IMAM AKHMADI', 'LAKI-LAKI', 'Islam', 'MAGELANG', '04/04/1962', 'JL. FATAHILAH NO. 31', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402067093', 'IMAM AKHMADI', 'Kepala Keluarga', 55, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '5', '1'),
(312, '_3209206712660002', 'AAH MASIAH', 'PEREMPUAN', 'Islam', 'KUNINGAN', '27/12/1966', 'JL. FATAHILAH NO. 31', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402067093', 'IMAM AKHMADI', 'Istri', 51, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(313, '_3209206907910010', 'SHELA SOFARIANI', 'PEREMPUAN', 'Islam', 'CIREBON', '29/07/1991', 'JL. FATAHILAH NO. 31', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402067093', 'IMAM AKHMADI', 'Anak Kandung', 26, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(314, '_3209206710970007', 'AIDA CAHYAWATI', 'PEREMPUAN', 'Islam', 'CIREBON', '27/10/1997', 'JL. FATAHILAH NO. 31', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402067093', 'IMAM AKHMADI', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '5', '1'),
(315, '_3209204605000011', 'DELA NURAHMA', 'PEREMPUAN', 'Islam', 'CIREBON', '06/05/2000', 'JL. FATAHILAH NO. 31', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402067093', 'IMAM AKHMADI', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '5', '1'),
(316, '_3209202604850003', 'KHAIRIN SYAHBANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '28/04/1985', 'JL.FATAHILA NO.05', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209202904140007', 'KHAIRIN SYAHBANA', 'Kepala Keluarga', 32, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(317, '_3209200705140002', 'MUHAMMAD REVAN SYAHDANA', 'PEREMPUAN', 'Islam', 'CIREBON', '07/05/2014', 'JL.FATAHILA NO.05', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202904140007', 'KHAIRIN SYAHBANA', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '5', '1'),
(318, '_32092042118800001', 'SRI WAHYUNI', 'PEREMPUAN', 'Islam', 'CIREBON', '02/11/1988', 'JL.FATAHILA NO.05', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202904140007', 'KHAIRIN SYAHBANA', 'Istri', 29, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(319, '_3209210808650051', 'MATHUIS DRIYANTO ANDRY', 'LAKI-LAKI', 'Kristen', 'PEMALANG', '05/06/1968', 'JL.FATAHILA N0.31', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_32092000808140002', 'MATHUIS DRIYANTORO ANDRY', 'Kepala Keluarga', 49, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(320, '_3209202206720008', 'MOKHAMAD FALETEHAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/05/1972', 'JL.SUTAWINANGUN GG.FATAHILAH', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402064712', 'MOKHAMAD FALETEHAN', 'Kepala Keluarga', 45, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '5', '1'),
(321, '_3209204608790005', 'IMAS JAMILAH', 'PEREMPUAN', 'Islam', 'TASIKMALAYA', '06/08/1979', 'JL.SUTAWINANGUN GG.FATAHILAH', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402064712', 'MOKHAMAD FALETEHAN', 'Istri', 38, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '5', '1'),
(322, '_3209202208020006', 'JAMIL URROUMAN FALETEHAN', 'LAKI-LAKI', 'Islam', 'TASIKMALAYA', '22/08/2002', 'JL.SUTAWINANGUN GG.FATAHILAH', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402064712', 'MOKHAMAD FALETEHAN', 'Anak Kandung', 15, 'Tidak Tahu', NULL, 'Sedang SLTP/Sederajat', '5', '1'),
(323, '_3209202312040004', 'MUHAMAD THORIQ JAMIL', 'LAKI-LAKI', 'Islam', 'TASIKMALAYA', '23/12/2004', 'JL.SUTAWINANGUN GG.FATAHILAH', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402064712', 'MOKHAMAD FALETEHAN', 'Anak Kandung', 12, 'Tidak Tahu', NULL, 'Sedang SD/sederajat', '5', '1'),
(324, '_3209202804070002', 'NIZAR RAWWAZ NAURAL', 'LAKI-LAKI', 'Islam', 'BANDUNG', '28/04/2007', 'JL.SUTAWINANGUN GG.FATAHILAH', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402064712', 'MOKHAMAD FALETEHAN', 'Anak Kandung', 10, 'Tidak Tahu', NULL, 'Sedang SD/sederajat', '5', '1'),
(325, '_3209202211140001', 'ABDULLAH AZMI FALETEHAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/11/2014', 'JL.SUTAWINANGUN GG.FATAHILAH', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202402064712', 'MOKHAMAD FALETEHAN', 'Anak Kandung', 2, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '5', '1'),
(326, '_3209205510700013', 'SARIPAH', 'PEREMPUAN', 'Islam', 'CIREBON', '15/10/1970', 'JL, SUTAWINANGUN FATIHLAH 24', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201501160003', 'SARIPAH', 'Kepala Keluarga', 47, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '5', '1'),
(327, '_3209205706890006', 'FITRIAH', 'PEREMPUAN', 'Islam', 'CIREBON', '17/06/1989', 'JL, SUTAWINANGUN FATIHLAH 24', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201501160003', 'SARIPAH', 'Anak Kandung', 28, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '5', '1'),
(328, '_3209206401930006', 'SRU AYUNDA', 'PEREMPUAN', 'Islam', 'CIREBON', '24/01/1993', 'JL, SUTAWINANGUN FATIHLAH 24', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201501160003', 'SARIPAH', 'Anak Kandung', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '5', '1'),
(329, '_3209206006970005', 'PUSPASARI', 'PEREMPUAN', 'Islam', 'CIREBON', '20/06/1997', 'JL, SUTAWINANGUN FATIHLAH 24', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201501160003', 'SARIPAH', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '5', '1'),
(330, '_3209200805700008', 'SUYONO', 'LAKI-LAKI', 'Islam', 'PURWODADI', '08/05/1970', 'JL. WIDARASARI III GG. FATAHILLAH NO.  33', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209201109080043', 'SUYONO', 'Kepala Keluarga', 47, 'Tidak Tahu', 'Jawa', 'Tamat D-2/sederajat', '5', '1'),
(331, '_3209205001770011', 'ELI', 'PEREMPUAN', 'Islam', 'CIREBON', '10/01/1977', 'JL. WIDARASARI III GG. FATAHILLAH NO.  33', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201109080043', 'SUYONO', 'Istri', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(332, '_3274010312960003', 'SINDHU GAMANG SMARADHANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/12/1996', 'JL. WIDARASARI III GG. FATAHILLAH NO.  33', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201109080043', 'SUYONO', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '1'),
(333, '_3209201904040002', 'BRAMUNSYA DERAWAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '19/04/2004', 'JL. WIDARASARI III GG. FATAHILLAH NO.  33', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201109080043', 'SUYONO', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '5', '1'),
(334, '_3209170708850007', 'WANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '07/08/1985', 'JL.WIDASARI GG.FATAHILLA NO.30 A', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209200603140005', 'WANA', 'Kepala Keluarga', 32, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '5', '1');
INSERT INTO `tb_penduduk` (`id`, `nik`, `nama`, `j_kelamin`, `agama`, `tmp_lahir`, `tgl_lahir`, `alamat`, `status_perkawinan`, `kewarganegaraan`, `pekerjaan`, `dusun`, `kode_kelurahan`, `nama_kepala_keluarga`, `hubungan`, `usia`, `gol_darah`, `etnis_suku`, `pendidikan`, `rt`, `rw`) VALUES
(335, '_3209204311830007', 'HARTINI', 'PEREMPUAN', 'Islam', 'CIREBON', '03/11/1983', 'JL.WIDASARI GG.FATAHILLA NO.30 A', 'Belum Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', 'SUTAWINANGUN', '_3209200603140005', 'WANA', 'Istri', 34, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '5', '1'),
(336, '_3209206107040004', 'YULIANA PUTRI', 'PEREMPUAN', 'Islam', 'CIREBON', '21/07/2004', 'JL.WIDASARI GG.FATAHILLA NO.30 A', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200603140005', 'WANA', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '5', '1'),
(337, '_32092009019700002', 'ING WAHYUNADI', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/01/2007', 'JL.WIDASARI GG.FATAHILLA NO.30 A', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200603140005', 'WANA', 'Anak Kandung', 10, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '5', '1'),
(338, '_3209202707730004', 'WAWAN GUNAWAN SAPUTRA', 'LAKI-LAKI', 'Islam', 'INDRAMAYU', '27/07/1973', 'JL. SUTAWINANGUN GG. FATAHILLAH NO.68 A', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200203150002', 'WAWAN GUNAWAN SAPUTRA', 'Kepala Keluarga', 44, 'Tidak Tahu', NULL, 'Tamat D-3/sederajat', '5', '1'),
(339, '_3209206803750004', 'NURUL BAETY', 'PEREMPUAN', 'Islam', 'CIREBON', '28/03/1975', 'JL. SUTAWINANGUN GG. FATAHILLAH NO.68 A', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200203150002', 'WAWAN GUNAWAN SAPUTRA', 'Istri', 42, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '5', '1'),
(340, '_3209202211930007', 'FAHREZA PRASETYA WIBAWA', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/11/1993', 'JL. SUTAWINANGUN GG. FATAHILLAH NO.68 A', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200203150002', 'WAWAN GUNAWAN SAPUTRA', 'Anak Kandung', 24, 'Tidak Tahu', NULL, 'Sedang S-1/sederajat', '5', '1'),
(341, '_3209200102980022', 'FAHMY RAMADHAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/02/1998', 'JL. SUTAWINANGUN GG. FATAHILLAH NO.68 A', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200203150002', 'WAWAN GUNAWAN SAPUTRA', 'Anak Kandung', 19, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '5', '1'),
(342, '_3209201405120001', 'REIHAN ARSYA', 'LAKI-LAKI', 'Islam', 'CIREBON', '14/05/2012', 'JL. SUTAWINANGUN GG. FATAHILLAH NO.68 A', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200203150002', 'WAWAN GUNAWAN SAPUTRA', 'Anak Kandung', 5, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '5', '1'),
(343, '_3573022204790002', 'AHMAD FATHONI JAUHARI', 'LAKI-LAKI', 'Islam', 'MALANG', '22/04/1979', 'JL. SUTAWINANGUN GG. MAKMUR NO. 8', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209202007160009', 'AHMAD FATHONI JAUHARI', 'Kepala Keluarga', 38, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(344, '_357302204780002', 'AHMAD FATHONI JAUHARI', 'LAKI-LAKI', 'Islam', 'MALANG', '22/04/1979', 'JL SUTAWINANGIN GG.MAKMUR NO.08', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_3209200508140001', 'AHMAD FATHONI JAUHARI', 'Kepala Keluarga', 38, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(345, '_32002205710850001', 'DARLINA ', 'PEREMPUAN', 'Islam', 'CIREBON', '27/10/1986', 'JL SUTAWINANGIN GG.MAKMUR NO.08', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Honorer', 'SUTAWINANGUN', '_3209200508140001', 'AHMAD FATHONI JAUHARI', 'Istri', 31, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '2'),
(346, '_3209076710860001', 'PARLINA WICAKASIH', 'PEREMPUAN', 'Islam', 'CIREBON', '27/10/1986', 'JL. SUTAWINANGUN GG. MAKMUR NO. 8', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Honorer', NULL, '_3209202007160009', 'AHMAD FATHONI JAUHARI', 'Istri', 31, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '2'),
(347, '_3209204807140001', 'KHANZAI ', 'PEREMPUAN', 'Islam', 'CIREBON', '06/07/2014', 'JL SUTAWINANGIN GG.MAKMUR NO.08', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200508140001', 'AHMAD FATHONI JAUHARI', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '2'),
(348, '_3209204807140001', 'KHANZAFIRA RAMADHANI JAUHARI', 'PEREMPUAN', 'Islam', 'CIREBON', '08/07/2014', 'JL. SUTAWINANGUN GG. MAKMUR NO. 8', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202007160009', 'AHMAD FATHONI JAUHARI', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '2'),
(349, '_3209200104170001', 'MUHAMMAD FADHILLAH JAUHARI', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/04/2017', 'JL. SUTAWINANGUN GG. MAKMUR NO. 8', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202007160009', 'AHMAD FATHONI JAUHARI', 'Anak Kandung', 0, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '2'),
(350, '_32092013016550005', 'EDI SURYANTO, SE', 'LAKI-LAKI', 'Islam', 'MAGETAN', '13/01/1966', 'JL SUTAWINANGUN GG.SUBUR N0.29', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209202910100003', 'EDI SURYANTO, SE', 'Kepala Keluarga', 51, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '2'),
(351, '_3209204211660003', 'TANTI IHTIYATI SE', 'PEREMPUAN', 'Islam', 'TEGAL', '02/11/1967', 'JL SUTAWINANGUN GG.SUBUR N0.29', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209202910100003', 'EDI SURYANTO, SE', 'Istri', 50, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '2'),
(352, '_3209200612950015', 'M AXEL GHUARI PRATAMA', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/12/1995', 'JL SUTAWINANGUN GG.SUBUR N0.29', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202910100003', 'EDI SURYANTO, SE', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(353, '_3209205005020019', 'AURELIA PUTRI AISYA', 'PEREMPUAN', 'Islam', 'YOGYAKARTA', '10/06/2002', 'JL SUTAWINANGUN GG.SUBUR N0.29', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202910100003', 'EDI SURYANTO, SE', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '1', '2'),
(354, '_3209204202890015', 'INDAH RATNAWATI', 'PEREMPUAN', 'Islam', 'CIREBON', '02/02/1983', 'JL. WIDASARI II GG.CAMAR NO.20', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209203112130024', 'INDAH RATNAWATI', 'Kepala Keluarga', 34, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '2'),
(355, '_3209200203040004', 'MUHAMMAD D', 'LAKI-LAKI', 'Islam', 'YOGYAKARTA', '02/03/2004', 'JL. WIDASARI II GG.CAMAR NO.20', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209203112130024', 'INDAH RATNAWATI', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '1', '2'),
(356, '_3209205812460003', 'ENI R', 'PEREMPUAN', 'Islam', 'BANDUNG', '20/12/1940', 'JL. WIDASARI II GG.CAMAR NO.20', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209203112130024', 'INDAH RATNAWATI', 'Ibu', 77, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(357, '_32092015044500002', 'KUSNANDAR', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/04/1945', 'GG.MAKMUR NO.02 PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Purnawirawan/Pensiunan', 'SUTAWINANGUN', '_3209202402067139', 'KUSNANDAR', 'Kepala Keluarga', 72, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '1', '2'),
(358, '_3209202204750003', 'GATOT TRIBRATA', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/04/1976', 'GG.MAKMUR NO.02 PECILON TIMUR', 'Belum Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209202402067139', 'KUSNANDAR', 'Anak Kandung', 41, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(359, '_3209200107880040', 'R.SIGIT S. ADIPRABOWO', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/07/1988', 'JL.SUTAWINANGUN GG.MULYA NO.209', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200701110004', 'R.SIGIT S. ADIPRABOWO', 'Kepala Keluarga', 29, 'Tidak Tahu', NULL, 'Tamat D-3/sederajat', '1', '2'),
(360, '_3209206809850002', 'ANITA RAYDIA', 'PEREMPUAN', 'Islam', 'KUNINGAN', '28/09/1985', 'JL.SUTAWINANGUN GG.MULYA NO.209', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200701110004', 'R.SIGIT S. ADIPRABOWO', 'Istri', 32, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '1', '2'),
(361, '_3209206804120003', 'AZKIAJASMI PRABOWO', 'PEREMPUAN', 'Islam', 'CIREBON', '26/04/2012', 'JL.SUTAWINANGUN GG.MULYA NO.209', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200701110004', 'R.SIGIT S. ADIPRABOWO', 'Anak Kandung', 5, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '1', '2'),
(362, '_3209205101150003', 'AUDY MARISA SHANUM PRABOWO', 'PEREMPUAN', 'Islam', 'CIREBON', '11/01/2015', 'JL.SUTAWINANGUN GG.MULYA NO.209', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200701110004', 'R.SIGIT S. ADIPRABOWO', 'Anak Kandung', 2, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '1', '2'),
(363, '_3209207103690010', 'RONNY SUGIONO ARTAMA,SE', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/06/1956', 'JL SUTAWINANGUN GG MAKMUR NO.6', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_3209200602140002', 'RONNY SUGIONO ARTAMA,SE', 'Kepala Keluarga', 61, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '1', '2'),
(364, '_3209206706610014', 'TATI SUPARTINI', 'PEREMPUAN', 'Islam', 'BANDUNG', '17/06/1961', 'JL SUTAWINANGUN GG MAKMUR NO.6', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_3209200602140002', 'RONNY SUGIONO ARTAMA,SE', 'Istri', 56, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(365, '_3209206710950001', 'PARLINA VICA KASIH', 'PEREMPUAN', 'Islam', 'CIREBON', '27/10/1996', 'JL SUTAWINANGUN GG MAKMUR NO.6', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Honorer', 'SUTAWINANGUN', '_3209200602140002', 'RONNY SUGIONO ARTAMA,SE', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '2'),
(366, '_3209202606650006', 'SAMLANI', 'LAKI-LAKI', 'Islam', 'INDRAMAYU', '26/05/1965', 'JL SUTAWINANGUN GG.MULYA NO.08', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202106080006', 'SAMLANI', 'Kepala Keluarga', 52, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(367, '_3209205103640002', 'SUYATI', 'PEREMPUAN', 'Islam', 'CIREBON', '11/02/1964', 'JL SUTAWINANGUN GG.MULYA NO.08', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202106080006', 'SAMLANI', 'Istri', 53, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '1', '2'),
(368, '_3209200506910012', 'MOCH  YACHYA', 'LAKI-LAKI', 'Islam', 'CIREBON', '05/06/1991', 'JL SUTAWINANGUN GG.MULYA NO.08', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202106080006', 'SAMLANI', 'Anak Kandung', 26, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(369, '_3209200707570011', 'YAHYA SOMAWIJAYA', 'LAKI-LAKI', 'Islam', 'SUMEDANG', '07/07/1957', 'JL SUTAWINANGUN GG MULYA N0.03', 'Kawin', 'Warga Negara Indonesia', 'POLRI', 'SUTAWINANGUN', '_3209200610070182', 'YAHYA SOMAWIJAYA', 'Kepala Keluarga', 60, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(370, '_3209205007610001', 'ENOK SUHAENAH', 'PEREMPUAN', 'Islam', 'SUMEDANG', '05/08/1961', 'JL SUTAWINANGUN GG MULYA N0.03', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200610070182', 'YAHYA SOMAWIJAYA', 'Istri', 56, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '1', '2'),
(371, '_3209202701520002', 'YAYAN SUPARYAN', 'LAKI-LAKI', 'Katholik', 'BANDUNG', '27/01/1952', 'JL. SUTAWINANGUN GG. SUBUR NO. 09', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209202402067110', 'YAYAN SUPARYAN', 'Kepala Keluarga', 65, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(372, '_3209206908590004', 'GARYANI JOHANA', 'PEREMPUAN', 'Katholik', 'CIREBON', '29/08/1959', 'JL. SUTAWINANGUN GG. SUBUR NO. 09', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402067110', 'YAYAN SUPARYAN', 'Istri', 58, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(373, '_3209201503700005', 'SUTIKNO', 'LAKI-LAKI', 'Katholik', 'CIREBON', '15/03/1970', 'JL. SUTAWINANGUN GG. SUBUR NO. 09', 'Belum Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209202402067110', 'YAYAN SUPARYAN', 'Famili lain', 47, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(374, '_320920294600001', 'YUDIA ALAMSYAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/07/1979', 'JL SUTAWINANGUN GG SUBUR NO.08', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200711140001', 'YUDIA ALAMSYAH', 'Kepala Keluarga', 38, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '1', '2'),
(375, '_3274024107790098', 'YULIA  ', 'PEREMPUAN', 'Islam', 'CIREBON', '01/07/1979', 'JL SUTAWINANGUN GG SUBUR NO.08', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200711140001', 'YUDIA ALAMSYAH', 'Istri', 38, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '1', '2'),
(376, '_3209202406100002', 'REVAL ADYATMA ARDRA ALAMSYACH', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/08/2010', 'JL SUTAWINANGUN GG SUBUR NO.08', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200711140001', 'YUDIA ALAMSYAH', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '1', '2'),
(377, '_3209201612550001', 'AGUSTARI', 'LAKI-LAKI', 'Islam', 'CIREBON', '19/12/1955', 'JL PECILON INDAH NO.6', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209201105090045', 'AGUSTARI', 'Kepala Keluarga', 62, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(378, '_3209205512600004', 'RESI', 'PEREMPUAN', 'Islam', 'KUNINGAN', '15/12/1960', 'JL PECILON INDAH NO.6', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201105090045', 'AGUSTARI', 'Istri', 57, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(379, '_3209202304900012', 'DIANA APRIYA', 'PEREMPUAN', 'Islam', 'CIREBO', '23/04/1990', 'JL PECILON INDAH NO.6', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201105090045', 'AGUSTARI', 'Anak Kandung', 27, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(380, '_3209204906600001', 'AISAH', 'PEREMPUAN', 'Islam', 'CIREBON', '09/05/1960', 'JL.SUTAWINANGUN GG,BAKTI NO.14', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202502140002', 'AISAH', 'Kepala Keluarga', 57, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(381, '_3209201007810009', 'HASAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/07/1981', 'JL.SUTAWINANGUN GG,BAKTI NO.14', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202502140002', 'AISAH', 'Anak Kandung', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(382, '_3209395208860004', 'ANITA HANDAYANI', 'PEREMPUAN', 'Islam', 'CIREBON', '12/08/1986', 'GG. DARMA', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201205160008', 'ANITA HANDAYANI', 'Kepala Keluarga', 31, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '2'),
(383, '_3209201207760005', 'BAMBANG SUMIRAT', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/07/1976', 'JL.SUTAWINANGUN NO.73', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209200512080029', 'BAMBANG SUMIRAT', 'Kepala Keluarga', 41, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(384, '_3209204603860009', 'MARTINI', 'PEREMPUAN', 'Islam', 'CIREBON', '08/03/1986', 'JL.SUTAWINANGUN NO.73', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200512080029', 'BAMBANG SUMIRAT', 'Istri', 31, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(385, '_3209200611050001', 'ALDI PRATAMA YUDASMARA', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/11/2005', 'JL.SUTAWINANGUN NO.73', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200512080029', 'BAMBANG SUMIRAT', 'Anak Kandung', 12, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(386, '_3209206310100001', 'ALMIRA FERGIANA FITRIA', 'PEREMPUAN', 'Islam', 'CIREBON', '23/10/2010', 'JL.SUTAWINANGUN NO.73', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200512080029', 'BAMBANG SUMIRAT', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Sedang TK/Kelompok Bermain', '2', '2'),
(387, '_32092009610001', 'BANI SUHARI', 'LAKI-LAKI', 'Islam', 'CIREBON', '03/01/1961', 'JL SUTAWINANGUN GG DARMA', 'Kawin', 'Warga Negara Indonesia', 'Sopir', 'SUTAWINANGUN', '_3209202705110001', 'BANI SAHURI', 'Kepala Keluarga', 57, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(388, '_32092050036650001', 'TATI SRI MULYATI', 'PEREMPUAN', 'Islam', 'CIREBON', '10/03/1965', 'JL SUTAWINANGUN GG DARMA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202705110001', 'BANI SAHURI', 'Istri', 52, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '2'),
(389, '_3209205412060005', 'RIA KHARISMA NINGSIH', 'PEREMPUAN', 'Islam', 'CIREBON', '14/12/1986', 'JL SUTAWINANGUN GG DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202705110001', 'BANI SAHURI', 'Anak Kandung', 30, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(390, '_3209201901940004', 'IRFAN JANUAR TRISAHURI', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/01/1994', 'JL SUTAWINANGUN GG DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202705110001', 'BANI SAHURI', 'Anak Kandung', 23, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(391, '_3209200212080009', 'MOHAMAD DAFA SAHURI', 'LAKI-LAKI', 'Islam', 'CIREBON', '02/12/2000', 'JL SUTAWINANGUN GG DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202705110001', 'BANI SAHURI', 'Anak Kandung', 16, 'Tidak Tahu', 'Jawa', 'Tidak pernah sekolah', '2', '2'),
(392, '_3209200705580003', 'BASUNY ABDUL RACHMAN ', 'LAKI-LAKI', 'Islam', 'CIREBON', '07/05/1958', 'JL. PECILON INDAH 5 NO. 04', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202909150002', 'BASUNY ABDUL RACHMAN', 'Kepala Keluarga', 59, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '2', '2'),
(393, '_3209205103730005', 'ATIK NURITA', 'PEREMPUAN', 'Islam', 'CIREBON', '11/03/1973', 'JL. PECILON INDAH 5 NO. 04', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202909150002', 'BASUNY ABDUL RACHMAN', 'Istri', 44, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '2', '2'),
(394, '_3209205408960007', 'NAFISAH PILARAS', 'PEREMPUAN', 'Islam', 'CIREBON', '14/08/1996', 'JL. PECILON INDAH 5 NO. 04', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202909150002', 'BASUNY ABDUL RACHMAN', 'Anak Kandung', 21, 'Tidak Tahu', NULL, 'Sedang S-1/sederajat', '2', '2'),
(395, '_3204100505690001', 'BASYARUDIN', 'LAKI-LAKI', 'Islam', 'BANDUNG', '04/06/1968', 'JL. SUTAWINANGUN  GG. BAKTI', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', NULL, '_3209200402160005', 'BASYARUDIN', 'Kepala Keluarga', 49, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(396, '_3204106703690001', 'LENI FIRAWATI', 'PEREMPUAN', 'Islam', 'BANDUNG', '26/03/1969', 'JL. SUTAWINANGUN  GG. BAKTI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200402160005', 'BASYARUDIN', 'Istri', 48, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '2', '2'),
(397, '_3204102909980001', 'ANGGA CHARIL PRATAMA', 'LAKI-LAKI', 'Islam', 'BANDUNG', '28/09/1996', 'JL. SUTAWINANGUN  GG. BAKTI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200402160005', 'BASYARUDIN', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '2', '2'),
(398, '_3204100205030001', 'NAUFAL ADITYA NUGRAHA', 'LAKI-LAKI', 'Islam', 'BANDUNG', '01/05/2003', 'JL. SUTAWINANGUN  GG. BAKTI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200402160005', 'BASYARUDIN', 'Anak Kandung', 14, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(399, '_3209204406440002', 'DJAHRONI', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/05/1944', 'JL SUTAWINANGUN PECILON INDAH V NO.10', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202301140003', 'DJAHRONI', 'Kepala Keluarga', 73, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(400, '_3209200709430007', 'DJAUHARI SAMAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '07/09/1943', 'JL. SUTAWINANGUN GG. BAKTI', 'Kawin', 'Warga Negara Indonesia', 'Purnawirawan/Pensiunan', NULL, '_3209202803080003', 'DJAUHARI SAMAN', 'Kepala Keluarga', 74, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '2'),
(401, '_3209205605450001', 'ELISABETH SUMARNI', 'PEREMPUAN', 'Katholik', 'MAGELANG', '16/05/1945', 'PECILON INDAH IV NO. 03', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209203110090006', 'ELISABETH SUMARNI', 'Kepala Keluarga', 72, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(402, '_3209204705690008', 'T. ABDI SATTRININGSIH', 'PEREMPUAN', 'Katholik', 'JAKARTA', '07/05/1969', 'PECILON INDAH IV NO. 03', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209203110090006', 'ELISABETH SUMARNI', 'Anak Kandung', 48, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(403, '_3209201509720009', 'Y. D YUDIANTO', 'LAKI-LAKI', 'Katholik', 'DKI JAKARTA', '15/09/1972', 'PECILON INDAH IV NO. 03', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209203110090006', 'ELISABETH SUMARNI', 'Anak Kandung', 45, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(404, '_3209201407750007', 'MARKUS M ARDIANTO', 'LAKI-LAKI', 'Katholik', 'CIREBON', '14/07/1975', 'PECILON INDAH IV NO. 03', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209203110090006', 'ELISABETH SUMARNI', 'Anak Kandung', 42, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(405, '_3209200210930007', 'ARDIN ASLAM PRATAMA', 'LAKI-LAKI', 'Islam', 'CIREBON', '02/10/1993', 'PECILON INDAH IV NO. 03', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209203110090006', 'ELISABETH SUMARNI', 'Cucu', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(406, '_3209207107770001', 'ELY HATINY', 'PEREMPUAN', 'Islam', 'CIREBON', '31/07/1977', 'JL SUTAWINANGUN GG DARMA\n', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209201006080062', 'ELY HATINY', 'Kepala Keluarga', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(407, '_320920460890010', 'D VIRGINIA ANGGITA P', 'PEREMPUAN', 'Islam', 'CIREBON', '05/08/1996', 'JL SUTAWINANGUN GG DARMA\n', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201006080062', 'ELY HATINY', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(408, '_3209206069960006', 'MOCH HILMAN ERLANGGA', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/06/1996', 'JL SUTAWINANGUN GG DARMA\n', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201006080062', 'ELY HATINY', 'Anak Kandung', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(409, '_320920030400016', 'TANIA BERLINA', 'PEREMPUAN', 'Islam', 'CIREBON', '23/04/2000', 'JL SUTAWINANGUN GG DARMA\n', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201006080062', 'ELY HATINY', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(410, '_3209206909540001', 'TETI PARWATI', 'PEREMPUAN', 'Islam', 'BANDUNG', '05/05/1954', 'JL SUTAWINANGUN GG DARMA\n', 'Janda/Duda', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201006080062', 'ELY HATINY', 'Ibu', 63, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(411, '_3209201901360001', 'ENONG', 'LAKI-LAKI', 'Islam', 'CIREBON', '19/01/1935', 'JL. SUTAWINANGUN PECILON TIMUR', 'Janda/Duda', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200807140001', 'ENONG', 'Kepala Keluarga', 83, 'Tidak Tahu', 'Jawa', 'Tidak tamat SD/sederajat', '2', '2'),
(412, '_3209201111820011', 'JAMALUDDIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '11/11/1982', 'JL. SUTAWINANGUN GG. BAKTI NO.14', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201105150007', 'JAMALUDDIN', 'Kepala Keluarga', 35, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '2'),
(413, '_3214015803830011', 'HANAN ZAELANI', 'PEREMPUAN', 'Islam', 'PURWAKARTA', '18/03/1983', 'JL. SUTAWINANGUN GG. BAKTI NO.14', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201105150007', 'JAMALUDDIN', 'Istri', 34, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '2'),
(414, '_3209202010720008', 'JAYA SENTOSA', 'LAKI-LAKI', 'Islam', 'CIREBON', '20/10/1972', 'JL SUTAWINANGUN GG BAKTI N0.19', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_32092000112090001', 'JAYA SENTOSA', 'Kepala Keluarga', 45, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(415, '_3209208803810020', 'NAMI', 'PEREMPUAN', 'Islam', 'CIREBON', '03/03/1981', 'JL SUTAWINANGUN GG BAKTI N0.19', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_32092000112090001', 'JAYA SENTOSA', 'Istri', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '2'),
(416, '_3209202608990007', 'SUKMA AJI ', 'LAKI-LAKI', 'Islam', 'CIREBON', '26/06/1999', 'JL SUTAWINANGUN GG BAKTI N0.19', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_32092000112090001', 'JAYA SENTOSA', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '2'),
(417, '_3209201808890003', 'KRIS SAMBOJA', 'LAKI-LAKI', 'Islam', 'CIREBON', '18/08/1989', 'JL. SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202605150008', 'KRIS SAMBOJA', 'Kepala Keluarga', 28, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(418, '_3209205710890010', 'ANDAYANI', 'PEREMPUAN', 'Islam', 'CIREBON', '17/10/1989', 'JL. SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202605150008', 'KRIS SAMBOJA', 'Istri', 28, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(419, '_3209205612140001', 'AZZAHRA RISYANI', 'PEREMPUAN', 'Islam', 'CIREBON', '16/12/2014', 'JL. SUTAWINANGUN GG.DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202605150008', 'KRIS SAMBOJA', 'Anak Kandung', 2, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(420, '_3209201106760004', 'KURIJA', 'LAKI-LAKI', 'Islam', 'CIREBON', '11/05/1976', 'JL. SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202605080011', 'KURIJA', 'Kepala Keluarga', 41, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(421, '_3209204101760018', 'EKA AGUNG PRIMANTINI', 'PEREMPUAN', 'Islam', 'CIREBON', '01/01/1976', 'JL. SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202605080011', 'KURIJA', 'Istri', 41, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(422, '_3209202103090001', 'ZIDAN R', 'LAKI-LAKI', 'Islam', 'CIREBON', '21/03/2000', 'JL. SUTAWINANGUN GG.DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202605080011', 'KURIJA', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(423, '_3209200312150006', 'NARI''I', 'PEREMPUAN', 'Islam', 'CIREBON', '04/07/1952', 'SUTAWINANGUN GG. DARMA', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200312150006', 'NARI''I', 'Kepala Keluarga', 65, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(424, '_329200606570007', 'NARYO SUTEJO', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/08/1957', 'JL.SUTAWINANGUN GG.BAKTI NO.18', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_3209200309080007', 'NARYO SUTEJO', 'Kepala Keluarga', 60, 'Tidak Tahu', NULL, 'Tamat S-1/sederajat', '2', '2'),
(425, '_3209205406620007', 'ILAH MAILAH', 'PEREMPUAN', 'Islam', 'CIREBON', '14/08/1962', 'JL.SUTAWINANGUN GG.BAKTI NO.18', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_3209200309080007', 'NARYO SUTEJO', 'Istri', 55, 'Tidak Tahu', 'Jawa', 'Tamat D-3/sederajat', '2', '2'),
(426, '_3209204102710009', 'NUNUNG NURLIAH', 'PEREMPUAN', 'Islam', 'CIREBON', '01/02/1971', 'JL, SUTAWINANGUN PECILON INDAH 6', 'Janda/Duda', 'Warga Negara Indonesia', 'Guru swasta', NULL, '_3209200412140007', 'NUNUNG NURLIAH', 'Kepala Keluarga', 46, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '2', '2'),
(427, '_3209207005980001', 'DIAN NURBAYANTI GUNARA', 'PEREMPUAN', 'Islam', 'CIREBON', '30/05/1998', 'JL, SUTAWINANGUN PECILON INDAH 6', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200412140007', 'NUNUNG NURLIAH', 'Anak Kandung', 19, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '2'),
(428, '_3209201210030001', 'MOHAMMAD MAULANA PAMUNGKAS', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/10/2003', 'JL, SUTAWINANGUN PECILON INDAH 6', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200412140007', 'NUNUNG NURLIAH', 'Anak Kandung', 14, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(429, '_3209206105060001', 'SITI NURINDAH PERTIWI GUNARA', 'PEREMPUAN', 'Islam', 'CIREBON', '21/05/2006', 'JL, SUTAWINANGUN PECILON INDAH 6', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200412140007', 'NUNUNG NURLIAH', 'Anak Kandung', 11, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(430, '_3209205107650007', 'ROSYIDAH', 'PEREMPUAN', 'Islam', 'CIREBON', '11/07/1985', 'JL.SUTAWINANGUN GG.BAKTI NO.14', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200201150001', 'ROSYIDAH', 'Kepala Keluarga', 32, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(431, '_3209204602060002', 'AZZAH MOHAMMAD BARMIN', 'PEREMPUAN', 'Islam', 'CIREBON', '06/02/2006', 'JL.SUTAWINANGUN GG.BAKTI NO.14', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200201150001', 'ROSYIDAH', 'Anak Kandung', 11, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(432, '_3209200906070003', 'ABDULLAH MUHAMMAD BARMIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/06/2007', 'JL.SUTAWINANGUN GG.BAKTI NO.14', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200201150001', 'ROSYIDAH', 'Anak Kandung', 10, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(433, '_3209205604100003', 'AZKA MUHAMMAD BARMIN', 'PEREMPUAN', 'Islam', 'JAKARTA', '16/04/2010', 'JL.SUTAWINANGUN GG.BAKTI NO.14', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200201150001', 'ROSYIDAH', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(434, '_320920082710005', 'RUDI HARTONO', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/02/1971', 'JL SUTAWINANGUN GG DARMA NO.10', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202402060168', 'RUDI HARTONO', 'Kepala Keluarga', 46, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(435, '_3209205707710008', 'AISYAH', 'PEREMPUAN', 'Islam', 'CIREBON', '17/07/1971', 'JL SUTAWINANGUN GG DARMA NO.10', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202402060168', 'RUDI HARTONO', 'Istri', 46, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '2'),
(436, '_3209205209670004', 'DYNA PERMATASARI', 'PEREMPUAN', 'Islam', 'CIREBON', '12/09/1997', 'JL SUTAWINANGUN GG DARMA NO.10', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202402060168', 'RUDI HARTONO', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(437, '_3209202211690004', 'SAIDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/11/1969', 'JL.SUTAWINANGUN GG.DARMA NO.12', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201803080001', 'SAIDI', 'Kepala Keluarga', 48, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(438, '_3209204708750004', 'NURAENI', 'PEREMPUAN', 'Islam', 'CIREBON', '07/08/1975', 'JL.SUTAWINANGUN GG.DARMA NO.12', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201803080001', 'SAIDI', 'Istri', 42, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(439, '_3209201510940005', 'MUHAMAD AMAR SANU', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/10/1995', 'JL.SUTAWINANGUN GG.DARMA NO.12', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201803080001', 'SAIDI', 'Anak Kandung', 22, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(440, '_3209201306060003', 'HAFIZH IMANULLAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/06/2006', 'JL.SUTAWINANGUN GG.DARMA NO.12', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201803080001', 'SAIDI', 'Anak Kandung', 11, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(441, '_3209200401100001', 'ZIAD BARKAN', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/01/2010', 'JL.SUTAWINANGUN GG.DARMA NO.12', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201803080001', 'SAIDI', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Sedang TK/Kelompok Bermain', '2', '2'),
(442, '_3209201610790007', 'SARIP MULYANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/10/1979', 'JL.SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_320920120202150003', 'SARIP MULYANA', 'Kepala Keluarga', 38, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '2'),
(443, '_320920180750007', 'SARIP MULYANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/10/1979', 'JL. SUTAWINANGUN GG.DARMA NO.30', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209201106140005', 'SARIP MULYANA', 'Kepala Keluarga', 38, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(444, '_3209204309760001', 'MAENAH', 'PEREMPUAN', 'Islam', 'CIREBON', '02/09/1979', 'JL. SUTAWINANGUN GG.DARMA NO.30', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201106140005', 'SARIP MULYANA', 'Istri', 38, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(445, '_3209206401900011', 'RANI KHARISMA NINGRUM', 'PEREMPUAN', 'Islam', 'CIREBON', '24/01/1990', 'JL.SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_320920120202150003', 'SARIP MULYANA', 'Istri', 27, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '2'),
(446, '_3209206911140003', 'SHAFIRA AZRA KHAIRANI', 'PEREMPUAN', 'Islam', 'CIREBON', '29/11/2014', 'JL.SUTAWINANGUN GG.DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_320920120202150003', 'SARIP MULYANA', 'Anak Kandung', 2, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(447, '_3209201105090001', 'HULIYAH MULYANA PUTRA', 'LAKI-LAKI', 'Islam', 'CIREBON', '11/05/2009', 'JL. SUTAWINANGUN GG.DARMA NO.30', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201106140005', 'SARIP MULYANA', 'Anak Kandung', 8, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(448, '_3209202607880004', 'SETIANDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '11/08/1987', 'JL. SUTAWINANGUN GG. DARMA', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200111160003', 'SETIANDI', 'Kepala Keluarga', 30, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(449, '_3209206106930005', 'RACHMA AYUNISSA KURNIYADI', 'PEREMPUAN', 'Islam', 'REJANG LEBONG', '21/06/1993', 'JL. SUTAWINANGUN GG. DARMA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200111160003', 'SETIANDI', 'Istri', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(450, '_3209204107160003', 'ARSYILA NURRAYA FATIMAH', 'PEREMPUAN', 'Islam', 'CIREBON', '01/07/2016', 'JL. SUTAWINANGUN GG. DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209200111160003', 'SETIANDI', 'Anak Kandung', 1, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(451, '_3209201810500006', 'SUBANDI', 'LAKI-LAKI', 'Islam', 'TEMANGGUNG', '18/10/1950', 'JL.SUTAWINANGUN NO.89', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', NULL, '_3209202402061238', 'SUBANDI', 'Kepala Keluarga', 67, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(452, '_3209200606778584', 'SUBANDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/06/1977', 'JL.SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Sopir', NULL, '_3209200206067298', 'SUBANDI', 'Kepala Keluarga', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '2', '2'),
(453, '_3209204602768585', 'SUWARNI', 'PEREMPUAN', 'Islam', 'CIREBON', '06/02/1976', 'JL.SUTAWINANGUN GG.DARMA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200206067298', 'SUBANDI', 'Istri', 41, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(454, '_320920640360004', 'NUNING', 'PEREMPUAN', 'Islam', 'CIREBON', '24/03/1960', 'JL.SUTAWINANGUN NO.89', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402061238', 'SUBANDI', 'Istri', 57, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '2', '2'),
(455, '_3209201610920005', 'ROBI TRI ANANDA', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/10/1992', 'JL.SUTAWINANGUN NO.89', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202402061238', 'SUBANDI', 'Anak Kandung', 25, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '2', '2'),
(456, '_3209205301988586', 'LIA', 'PEREMPUAN', 'Islam', 'CIREBON', '13/01/1998', 'JL.SUTAWINANGUN GG.DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200206067298', 'SUBANDI', 'Anak Kandung', 19, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '2', '2'),
(457, '_3209200607048587', 'FAJAR ARIP ARDIYANSYAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/07/2004', 'JL.SUTAWINANGUN GG.DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200206067298', 'SUBANDI', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(458, '_3209201012630004', 'SUHAEDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/12/1963', 'PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209200905160014', 'SUHAEDI', 'Kepala Keluarga', 54, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(459, '_3209206503710002', 'MISNANI', 'PEREMPUAN', 'Islam', 'CIREBON', '25/03/1971', 'PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200905160014', 'SUHAEDI', 'Istri', 46, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '2', '2'),
(460, '_3209202907970004', 'RIYAN JULIANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '27/07/1997', 'PECILON TIMUR', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200905160014', 'SUHAEDI', 'Anak Kandung', 20, 'Tidak Tahu', NULL, 'Sedang SLTA/sederajat', '2', '2'),
(461, '_3209200808030003', 'RIO MAHARDIKA', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/08/2003', 'PECILON TIMUR', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200905160014', 'SUHAEDI', 'Anak Kandung', 14, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '2', '2'),
(462, '_320920130690004', 'TEGOEH RUCHJAT', 'LAKI-LAKI', 'Islam', 'JAKARTA', '13/01/1969', 'JL SUTAWINANGUN NO 203/81 PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Pemerintah', 'SUTAWINANGUN', '_3209202505110012', 'TEGOEH RUCHJAT', 'Kepala Keluarga', 48, 'Tidak Tahu', 'Jawa', 'Tamat S-2/sederajat', '2', '2'),
(463, '_3209205211700004', 'BETY NURBAETI', 'PEREMPUAN', 'Islam', 'CIREBON', '22/11/1970', 'JL SUTAWINANGUN NO 203/81 PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Pegawai Negeri Sipil', 'SUTAWINANGUN', '_3209202505110012', 'TEGOEH RUCHJAT', 'Istri', 47, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '2', '2'),
(464, '_3209202603080004', 'SYAFIQ ADEL REGAR KUSUMA', 'LAKI-LAKI', 'Islam', 'CIREBON', '26/03/2009', 'JL SUTAWINANGUN NO 203/81 PECILON TIMUR', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202505110012', 'TEGOEH RUCHJAT', 'Anak Kandung', 8, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(465, '_3209204101510008', 'TIMAH', 'PEREMPUAN', 'Islam', 'CIREBON', '01/01/1951', 'JL. SUTAWINANGUN NO.109/67', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200610070219', 'TIMAH', 'Kepala Keluarga', 67, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '2', '2'),
(466, '_3209204103800005', 'DARKELI', 'PEREMPUAN', 'Islam', 'CIREBON', '01/03/1980', 'JL. SUTAWINANGUN NO.109/67', 'Janda/Duda', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200610070219', 'TIMAH', 'Anak Kandung', 37, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '2', '2'),
(467, '_3209202705770005', 'ATMANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '27/05/1977', 'JL. SUTAWINANGUN NO.109/67', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200610070219', 'TIMAH', 'Anak Kandung', 40, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '2'),
(468, '_3209201007750018', 'YUNUS', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/07/1975', 'JL. SURAWINANGUN GG. DARMA', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201409110002', 'YUNUS', 'Kepala Keluarga', 42, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '2', '2'),
(469, '_3209204511830004', 'suema', 'PEREMPUAN', 'Islam', 'CIREBON', '05/11/1983', 'JL. SURAWINANGUN GG. DARMA', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201409110002', 'YUNUS', 'Istri', 34, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '2', '2'),
(470, '_3209200211080004', 'YUGI NUGGEROHO', 'LAKI-LAKI', 'Islam', 'CIREBON', '02/11/2008', 'JL. SURAWINANGUN GG. DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201409110002', 'YUNUS', 'Anak Kandung', 9, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(471, '_3209202401150003', 'RICKY JANUAR NUGROHO', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/01/2015', 'JL. SURAWINANGUN GG. DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201409110002', 'YUNUS', 'Anak Kandung', 2, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '2', '2'),
(472, '_3209200107640191', 'ACO', 'LAKI-LAKI', 'Islam', 'LABUAN MAPIN', '01/07/1964', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Nelayan', NULL, '_3209200610070298', 'ACO', 'Kepala Keluarga', 53, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '2'),
(473, '_3209205207730005', 'TARINI', 'PEREMPUAN', 'Islam', 'CIREBON', '12/07/1973', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200610070298', 'ACO', 'Istri', 44, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '2'),
(474, '_3209206102950001', 'SRI FANITA', 'PEREMPUAN', 'Islam', 'CIREBON', '21/02/1995', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200610070298', 'ACO', 'Anak Kandung', 22, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '3', '2'),
(475, '_3209201806040002', 'ARIF JUANDA SAPUTRA', 'LAKI-LAKI', 'Islam', 'LABUAN MAPIN', '18/06/2004', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200610070298', 'ACO', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(476, '_3209202009750008', 'AGUS', 'LAKI-LAKI', 'Islam', 'CIREBON', '20/09/1975', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209201602090040', 'AGUS', 'Kepala Keluarga', 42, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '2'),
(477, '_3209206601760003', 'HERLIA', 'PEREMPUAN', 'Islam', 'CIREBON', '26/01/1976', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201602090040', 'AGUS', 'Istri', 41, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '3', '2'),
(478, '_3209205607070006', 'INDRI ASSYIFA', 'PEREMPUAN', 'Islam', 'CIREBON', '16/07/2007', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201602090040', 'AGUS', 'Anak Kandung', 10, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(479, '_3209200401090002', 'DANI PRIYATNA', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/01/2009', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201602090040', 'AGUS', 'Anak Kandung', 8, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(480, '_3209201109500011', 'ANTON HARYANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '11/03/1980', 'JL SUTAWINANGUN GG MURNI ', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200610070304', 'ANTON HARYANTO', 'Kepala Keluarga', 37, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '2'),
(481, '_3209205404820009', 'INDAH PERMATASARI', 'PEREMPUAN', 'Islam', 'CIREBON', '24/04/1982', 'JL SUTAWINANGUN GG MURNI ', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200610070304', 'ANTON HARYANTO', 'Istri', 35, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '2'),
(482, '_3209201611050001', 'FARELL HARYANTO PUTRA', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/11/2005', 'JL SUTAWINANGUN GG MURNI ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200610070304', 'ANTON HARYANTO', 'Anak Kandung', 11, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(483, '_32092000401140004', 'FARID HARYANTO', 'LAKI-LAKI', 'Islam', 'CIREBON', '04/01/2014', 'JL SUTAWINANGUN GG MURNI ', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200610070304', 'ANTON HARYANTO', 'Anak Kandung', 3, 'Tidak Tahu', NULL, 'Belum masuk TK/Kelompok Bermain', '3', '2'),
(484, '_3209205212520001', 'ASWIYAH', 'PEREMPUAN', 'Islam', 'CIREBON', '12/12/1952', 'JL, SUTAWINANGUN GG, DARMA NO,08', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209203009100004', 'ASWIYAH', 'Kepala Keluarga', 65, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '2'),
(485, '_3209206111810007', 'NANING  NURTRIANA', 'PEREMPUAN', 'Islam', 'CIREBON', '21/11/1981', 'JL, SUTAWINANGUN GG, DARMA NO,08', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209203009100004', 'ASWIYAH', 'Anak Kandung', 36, 'Tidak Tahu', 'Jawa', 'Tamat S-3/sederajat', '3', '2'),
(486, '_3209202908840005', 'NANANG NURHAYUD', 'LAKI-LAKI', 'Islam', 'CIREBON', '29/08/1984', 'JL, SUTAWINANGUN GG, DARMA NO,08', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209203009100004', 'ASWIYAH', 'Anak Kandung', 33, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '2'),
(487, '_3202905806890005', 'NUNING NURVITALOKA', 'PEREMPUAN', 'Islam', 'CIREBON', '18/06/1989', 'JL, SUTAWINANGUN GG, DARMA NO,08', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209203009100004', 'ASWIYAH', 'Anak Kandung', 28, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '3', '2'),
(488, '_3209200106820014', 'DIMAS PERDANA SAPUTRA', 'LAKI-LAKI', 'Islam', 'SURABAYA', '01/06/1982', 'GG.PECILON INDAH 5', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201011110002', 'DIMAS PERDANA SAPUTRA', 'Kepala Keluarga', 35, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '3', '2'),
(489, '_3209204505870004', 'SOLIHA UTAMI', 'PEREMPUAN', 'Islam', 'CIREBON', '03/10/1987', 'GG.PECILON INDAH 5', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201011110002', 'DIMAS PERDANA SAPUTRA', 'Istri', 30, 'Tidak Tahu', 'Jawa', 'Tamat S-1/sederajat', '3', '2'),
(490, '_3209200807690013', 'HENDHI', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/07/1969', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209201602090035', 'HENDHI', 'Kepala Keluarga', 48, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '2'),
(491, '_3209204106750028', 'SUHENI', 'PEREMPUAN', 'Islam', 'CIREBON', '01/06/1975', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201602090035', 'HENDHI', 'Istri', 42, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '3', '2'),
(492, '_3209206901980006', 'YANTI NURHAENI', 'PEREMPUAN', 'Islam', 'CIREBON', '29/01/1998', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201602090035', 'HENDHI', 'Anak Kandung', 19, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '3', '2'),
(493, '_3209205511010002', 'GITA CAHAYA', 'PEREMPUAN', 'Islam', 'CIREBON', '15/11/2001', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201602090035', 'HENDHI', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '3', '2'),
(494, '_3209205711030001', 'NIA ANDIANI', 'PEREMPUAN', 'Islam', 'CIREBON', '17/11/2003', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201602090035', 'HENDHI', 'Anak Kandung', 13, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(495, '_3209200105810015', 'HENDRA', 'LAKI-LAKI', 'Islam', 'CIREBON', '01/05/1981', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', NULL, '_3209201307090018', 'HENDRA', 'Kepala Keluarga', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '3', '2'),
(496, '_3209206509840005', 'IIS ROSSANA', 'PEREMPUAN', 'Islam', 'CIREBON', '25/09/1984', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201307090018', 'HENDRA', 'Istri', 33, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '2'),
(497, '_3209203005090002', 'MUHAMMAD FALLAH ANDRIANO', 'LAKI-LAKI', 'Islam', 'CIREBON', '30/05/2009', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201307090018', 'HENDRA', 'Anak Kandung', 8, 'Tidak Tahu', 'Jawa', 'Sedang TK/Kelompok Bermain', '3', '2'),
(498, '_3209201209140004', 'REVAN INZAGI', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/09/2014', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201307090018', 'HENDRA', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '2');
INSERT INTO `tb_penduduk` (`id`, `nik`, `nama`, `j_kelamin`, `agama`, `tmp_lahir`, `tgl_lahir`, `alamat`, `status_perkawinan`, `kewarganegaraan`, `pekerjaan`, `dusun`, `kode_kelurahan`, `nama_kepala_keluarga`, `hubungan`, `usia`, `gol_darah`, `etnis_suku`, `pendidikan`, `rt`, `rw`) VALUES
(499, '_3209206611720004', 'JUBAEDAH', 'PEREMPUAN', 'Islam', 'CIREBON', '05/11/1972', 'JL SUTAWINANGUN GG DARMA', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_32209201406080034', 'JUBAEDAH', 'Kepala Keluarga', 45, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '3', '2'),
(500, '_3209206617720004', 'JUBAEDAH', 'PEREMPUAN', 'Islam', 'CIREBON', '25/11/1972', 'SUTAWINANGUN GG. DARMA', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201406080034', 'JUBAEDAH', 'Kepala Keluarga', 45, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(501, '_3209200811890005', 'PERUMAM ADIYANTORO', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/11/1989', 'SUTAWINANGUN GG. DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201406080034', 'JUBAEDAH', 'Anak Kandung', 28, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(502, '_3209200811890005', 'PERI IMAM ADIYANTORO', 'LAKI-LAKI', 'Islam', 'CIREBON', '08/11/1989', 'JL SUTAWINANGUN GG DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_32209201406080034', 'JUBAEDAH', 'Anak Kandung', 28, 'Tidak Tahu', 'Jawa', 'Tidak tamat SD/sederajat', '3', '2'),
(503, '_3209202406950003', 'TAUFIK HIDAYAT TULLAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/06/1995', 'SUTAWINANGUN GG. DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209201406080034', 'JUBAEDAH', 'Anak Kandung', 22, 'Tidak Tahu', 'Jawa', 'Sedang S-1/sederajat', '3', '2'),
(504, '_3209202406950003', 'TAUFIK HIDAYATULLAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '24/06/1996', 'JL SUTAWINANGUN GG DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_32209201406080034', 'JUBAEDAH', 'Anak Kandung', 21, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '3', '2'),
(505, '_3209206922080001', 'SUCI', 'PEREMPUAN', 'Islam', 'CIREBON', '10/02/2008', 'JL SUTAWINANGUN GG DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_32209201406080034', 'JUBAEDAH', 'Anak Kandung', 9, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '2'),
(506, '_3209206902080001', 'SUCI', 'PEREMPUAN', 'Islam', 'CIREBON', '10/02/2008', 'SUTAWINANGUN GG. DARMA', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209201406080034', 'JUBAEDAH', 'Anak Kandung', 9, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '3', '2'),
(507, '_32091682207770006', 'MIDIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '22/07/1977', 'JL SUTAWINANGUN GG MURNI', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200309140007', 'MIDIN', 'Kepala Keluarga', 40, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '2'),
(508, '_32091985608810010', 'YANI', 'PEREMPUAN', 'Islam', 'CIREBON', '16/08/1981', 'JL SUTAWINANGUN GG MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200309140007', 'MIDIN', 'Istri', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '2'),
(509, '_3209166411020003', 'NUR AISYAH', 'PEREMPUAN', 'Islam', 'CIREBON', '24/11/2002', 'JL SUTAWINANGUN GG MURNI', 'Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200309140007', 'MIDIN', 'Anak Kandung', 14, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '3', '2'),
(510, '_3209164905100004', 'LUTFIATUN NADIA', 'PEREMPUAN', 'Islam', 'CIREBON', '28/06/2010', 'JL SUTAWINANGUN GG MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200309140007', 'MIDIN', 'Anak Kandung', 7, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '2'),
(511, '_3209161310130003', 'FATHAN ADMAR', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/10/2013', 'JL SUTAWINANGUN GG MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200309140007', 'MIDIN', 'Anak Kandung', 4, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '3', '2'),
(512, '_3209201703560008', 'ROLA', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/03/1966', 'JL SUTAWINANGUN GG MURNI', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209201808100007', 'ROLA', 'Kepala Keluarga', 51, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '3', '2'),
(513, '_3209204109640003', 'RENI SETIAWATI', 'PEREMPUAN', 'Islam', 'CIREBON', '01/09/1964', 'JL SUTAWINANGUN GG MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201808100007', 'ROLA', 'Istri', 53, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '3', '2'),
(514, '_3209201511990006', 'RONI SAPUTRA', 'LAKI-LAKI', 'Islam', 'CIREBON', '15/11/1999', 'JL SUTAWINANGUN GG MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201808100007', 'ROLA', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Sedang SLTA/sederajat', '3', '2'),
(515, '_3209202806440003', 'SOEWENDA MS.', 'LAKI-LAKI', 'Islam', 'CIREBON', '28/06/1944', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200205080010', 'SOEWENDA MS.', 'Kepala Keluarga', 73, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '2'),
(516, '_3209206506510002', 'TUNAENI', 'PEREMPUAN', 'Islam', 'CIREBON', '25/06/1951', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200205080010', 'SOEWENDA MS.', 'Istri', 66, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '3', '2'),
(517, '_3209200612590005', 'ABDUL RAHIM', 'LAKI-LAKI', 'Islam', 'CIREBON', '06/12/1959', 'JL.SUTAWINANGUN GG.MURNI', 'Janda/Duda', 'Warga Negara Indonesia', 'Buruh Harian Lepas', 'SUTAWINANGUN', '_3209202302069041', 'ABDUL HARIM', 'Kepala Keluarga', 58, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(518, '_3209201205880008', 'MUHAMMAD FAQIH', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/05/1988', 'JL.SUTAWINANGUN GG.MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202302069041', 'ABDUL HARIM', 'Anak Kandung', 29, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '2'),
(519, '_3209205104950002', 'ANNIS LESTARI SOLIHAH', 'PEREMPUAN', 'Islam', 'CIREBON', '11/04/1995', 'JL.SUTAWINANGUN GG.MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202302069041', 'ABDUL HARIM', 'Anak Kandung', 22, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(520, '_3209201703960007', 'MUHAMMAD WAIS WIJAYA', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/03/1998', 'JL.SUTAWINANGUN GG.MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202302069041', 'ABDUL HARIM', 'Anak Kandung', 19, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '2'),
(521, '_3209206207700003', 'ARSINAH', 'PEREMPUAN', 'Islam', 'CIREBON', '12/07/1970', 'JL SUTAWINANGUN GG SUCI', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209201701140002', 'ARSINAH', 'Kepala Keluarga', 47, 'Tidak Tahu', 'Jawa', 'Tidak pernah sekolah', '4', '2'),
(522, '_3209204506020006', 'NUR MAULINA', 'PEREMPUAN', 'Islam', 'CIREBON', '06/06/2002', 'JL SUTAWINANGUN GG SUCI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209201701140002', 'ARSINAH', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '4', '2'),
(523, '_3209200707720005', 'ASEP SOPANDI', 'LAKI-LAKI', 'Islam', 'MAJALENGKA', '07/07/1972', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Pedagang barang kelontong', NULL, '_3209202812110001', 'ASEP SOPANDI', 'Kepala Keluarga', 45, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '2'),
(524, '_3209206506780002', 'UUM NURHIMAH', 'PEREMPUAN', 'Islam', 'MAJALENGKA', '25/06/1978', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202812110001', 'ASEP SOPANDI', 'Istri', 39, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '2'),
(525, '_3209202612010006', 'DIKRI SAMSUL AWWABIN', 'LAKI-LAKI', 'Islam', 'MAJALENGKA', '26/12/2001', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202812110001', 'ASEP SOPANDI', 'Anak Kandung', 15, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '4', '2'),
(526, '_3209205607070005', 'HALIMATU AL SA''DIYAH', 'PEREMPUAN', 'Islam', 'CIREBON', '16/07/2007', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209202812110001', 'ASEP SOPANDI', 'Anak Kandung', 10, 'Tidak Tahu', 'Jawa', 'Sedang SD/sederajat', '4', '2'),
(527, '_3209204812110001', 'HASNA JAMILAH SULUS', 'PEREMPUAN', 'Islam', 'CIREBON', '08/12/2011', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', NULL, '_3209202812110001', 'ASEP SOPANDI', 'Anak Kandung', 5, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '2'),
(528, '_3209202602570003', 'DJUNAEDI', 'LAKI-LAKI', 'Islam', 'CIREBON', '28/02/1957', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200610070323', 'DJUNAEDI', 'Kepala Keluarga', 60, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '4', '2'),
(529, '_3209205706620007', 'ENI SUKARNI', 'PEREMPUAN', 'Islam', 'KUNINGAN', '17/08/1962', 'JL. SUTAWINANGUN GG. MURNI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200610070323', 'DJUNAEDI', 'Istri', 55, 'Tidak Tahu', NULL, 'Tamat SD/sederajat', '4', '2'),
(530, '_3209201706950018', 'AUGUS SATRIO PUTRA', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/08/1995', 'JL. SUTAWINANGUN GG. MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200610070323', 'DJUNAEDI', 'Anak Kandung', 22, 'Tidak Tahu', NULL, 'Sedang S-1/sederajat', '4', '2'),
(531, '_3209362906750003', 'LUKMAN HAKIM', 'LAKI-LAKI', 'Islam', 'CIREBON', '29/05/1975', 'JL SUTAWINANGUN NO.55', 'Kawin', 'Warga Negara Indonesia', 'Wiraswasta', 'SUTAWINANGUN', '_3209200503140003', 'LUKMAN HAKIM', 'Kepala Keluarga', 42, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(532, '_3209204701810005', 'ATIK M', 'PEREMPUAN', 'Islam', 'CIREBON', '07/01/1981', 'JL SUTAWINANGUN NO.55', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209200503140003', 'LUKMAN HAKIM', 'Istri', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(533, '_32092018098600009', 'M SHOLEH', 'LAKI-LAKI', 'Islam', 'CIREBON', '16/09/1980', 'JL SUTAWINANGUN GG ABADI', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202912110011', 'M SHOLEH', 'Kepala Keluarga', 37, 'A', NULL, 'Tamat SLTA/sederajat', '4', '2'),
(534, '_3209205412850004', 'DESI SUGIANTI', 'PEREMPUAN', 'Islam', 'CIREBON', '24/12/1995', 'JL SUTAWINANGUN GG ABADI', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209202912110011', 'M SHOLEH', 'Istri', 21, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(535, '_3209204601140001', 'AENUR PUTRI ALMIRAN', 'PEREMPUAN', 'Islam', 'CIREBON', '06/01/2014', 'JL SUTAWINANGUN GG ABADI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202912110011', 'M SHOLEH', 'Anak Kandung', 3, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '2'),
(536, '_3209205608450007', 'MAEMUNAH', 'PEREMPUAN', 'Islam', 'KABUPATEN CIREBON', '16/08/1945', 'JL. SUTAWINANGUN NO. 55 ', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200107100020', 'MAEMUNAH', 'Kepala Keluarga', 72, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '2'),
(537, '_3209202108780010', 'ISKANDAR', 'LAKI-LAKI', 'Islam', 'KABUPATEN CIREBON', '21/08/1978', 'JL. SUTAWINANGUN NO. 55 ', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200107100020', 'MAEMUNAH', 'Anak Kandung', 39, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(538, '_3209204701810005', 'ATIK MAFRUHHIYATI', 'PEREMPUAN', 'Islam', 'KABUPATEN CIREBON', '07/01/1981', 'JL. SUTAWINANGUN NO. 55 ', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209200107100020', 'MAEMUNAH', 'Anak Kandung', 36, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(539, '_3209203112830009', 'MOH.SARIP TOYIB', 'LAKI-LAKI', 'Islam', 'KABUPATEN CIREBN', '31/12/1983', 'JL. SUTAWINANGUN NO. 55 ', 'Belum Kawin', 'Warga Negara Indonesia', 'Pelajar', NULL, '_3209200107100020', 'MAEMUNAH', 'Anak Kandung', 33, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '4', '2'),
(540, '_3209201807970011', 'MAULANA SUPRIYADI', 'LAKI-LAKI', 'Islam', 'CIREBON', '13/06/1967', 'JL SUTAWINANGUN GG MURNI', 'Janda/Duda', 'Warga Negara Indonesia', 'Buruh Harian Lepas', 'SUTAWINANGUN', '_3209200610070309', 'MAULANA SUPRIYADI', 'Kepala Keluarga', 50, 'Tidak Tahu', 'Jawa', 'Tamat SD/sederajat', '4', '2'),
(541, '_3209201807970001', 'JAMALUDIN', 'LAKI-LAKI', 'Islam', 'CIREBON', '18/07/1997', 'JL SUTAWINANGUN GG MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200610070309', 'MAULANA SUPRIYADI', 'Anak Kandung', 20, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(542, '_3209200702990008', 'MOCHAMAD LURIANSYAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '07/02/1999', 'JL SUTAWINANGUN GG MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200610070309', 'MAULANA SUPRIYADI', 'Anak Kandung', 18, 'Tidak Tahu', 'Jawa', 'Sedang SLTP/Sederajat', '4', '2'),
(543, '_3209201204030001', 'SAHRUL MAULANA', 'LAKI-LAKI', 'Islam', 'CIREBON', '12/04/2000', 'JL SUTAWINANGUN GG MURNI', 'Belum Kawin', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209200610070309', 'MAULANA SUPRIYADI', 'Anak Kandung', 17, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '4', '2'),
(544, '_3209205305570002', 'RHYNELDA', 'PEREMPUAN', 'Islam', 'CIREBON', '13/05/1957', 'JL. WIDARASARI II GG. CAMAR NO. 37', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209200508080047', 'RHYNELDA', 'Kepala Keluarga', 60, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(545, '_3209201710590002', 'SANENDRI S', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/10/1959', 'BLOK PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402060113', 'SANENDRI S', 'Kepala Keluarga', 58, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(546, '_3202905705600004', 'TUTI SULASTRI', 'PEREMPUAN', 'Islam', 'CIREBON', '17/05/1960', 'BLOK PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209202402060113', 'SANENDRI S', 'Istri', 57, 'Tidak Tahu', NULL, 'Tamat SLTP/sederajat', '4', '2'),
(547, '_3209201001790006', 'FEZRI YOHANSYAH', 'LAKI-LAKI', 'Islam', 'CIREBON', '10/01/1979', 'BLOK PECILON TIMUR', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209202402060113', 'SANENDRI S', 'Anak Kandung', 38, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '4', '2'),
(548, '_3209205904670007', 'SITI RUMINI', 'PEREMPUAN', 'Islam', 'SUMEDANG', '19/04/1967', 'JL. SUTAWINANGUN GG. ABADI', 'Janda/Duda', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', NULL, '_3209201507130001', 'SITI RUMINI', 'Kepala Keluarga', 50, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '4', '2'),
(549, '_3209206402950004', 'AYU PEBRIANTI', 'PEREMPUAN', 'Islam', 'CIREBON', '24/02/1995', 'JL. SUTAWINANGUN GG. ABADI', 'Belum Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', NULL, '_3209201507130001', 'SITI RUMINI', 'Anak Kandung', 22, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '4', '2'),
(550, '_3209212708730003', 'SUHERMAN BASSAE', 'LAKI-LAKI', 'Islam', 'CIREBON', '27/06/1973', 'JL SUTAWINANGUN GG ABADI N0.110', 'Kawin', 'Warga Negara Indonesia', 'Buruh Harian Lepas', 'SUTAWINANGUN', '_3209200109140003', 'SUHERMAN BASAE', 'Kepala Keluarga', 44, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '2'),
(551, '_3209204912920001', 'DEVI PERMATASSARI', 'PEREMPUAN', 'Islam', 'CIREBON', '09/12/1992', 'JL SUTAWINANGUN GG ABADI N0.110', 'Kawin', 'Warga Negara Indonesia', 'Ibu Rumah Tangga', 'SUTAWINANGUN', '_3209200109140003', 'SUHERMAN BASAE', 'Istri', 24, 'Tidak Tahu', 'Jawa', 'Tamat SLTP/sederajat', '4', '2'),
(552, '_3209201701760002', 'ANDI SANTOSO', 'LAKI-LAKI', 'Islam', 'CIREBON', '17/01/1978', 'PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202811140006', 'ANDI SANTOSO', 'Kepala Keluarga', 39, 'Tidak Tahu', 'Jawa', 'Tamat SLTA/sederajat', '5', '2'),
(553, '_3209205904600005', 'ARI AFIANI', 'PEREMPUAN', 'Islam', 'CIREBON', '19/04/1980', 'PECILON TIMUR', 'Kawin', 'Warga Negara Indonesia', 'Karyawan Perusahaan Swasta', 'SUTAWINANGUN', '_3209202811140006', 'ANDI SANTOSO', 'Istri', 37, 'Tidak Tahu', NULL, 'Tamat SLTA/sederajat', '5', '2'),
(554, '_3209200909490002', 'ENGKUN HADILI', 'LAKI-LAKI', 'Islam', 'CIREBON', '09/09/1949', 'PECILON TIMUR', 'Janda/Duda', 'Warga Negara Indonesia', 'Belum Bekerja', 'SUTAWINANGUN', '_3209202811140006', 'ANDI SANTOSO', 'Ayah', 68, 'Tidak Tahu', 'Jawa', 'Belum masuk TK/Kelompok Bermain', '5', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_profile`
--

CREATE TABLE IF NOT EXISTS `tb_profile` (
`id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` bigint(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `level` enum('admin','lurah','camat') NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `last_update`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '0000-00-00 00:00:00', 'admin'),
(2, 'lurah', '04960f28e4129aac5bdc9da32056560d', '0000-00-00 00:00:00', 'lurah'),
(3, 'camat', 'e0dc1c969db5fa159c0e3ccc290e2314', '0000-00-00 00:00:00', 'camat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`id`);

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
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_profile`
--
ALTER TABLE `tb_profile`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `surat_kelahiran`
--
ALTER TABLE `surat_kelahiran`
MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
-- AUTO_INCREMENT for table `tb_penduduk`
--
ALTER TABLE `tb_penduduk`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=555;
--
-- AUTO_INCREMENT for table `tb_profile`
--
ALTER TABLE `tb_profile`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
