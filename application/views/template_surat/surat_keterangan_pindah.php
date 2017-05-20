<html>
    <head>
        <style>
            .center{
                text-align: center;
            }
            .f16{
                font-size: 16px;
            }
            .f20{
                font-size: 20px;
            }
            .f12{
                font-size: 12px;
            }
            .f8{
                font-size: 8px;
            }
            .justify{
                text-align: justify;
            }
            .bold{
                font-weight: bold;
            }
            section{
                margin:0;
                padding:0;
            }
            .underline{
                border-bottom: 1px solid black;
                width:40%;
                margin-left: 30%;
            }
            .paragraf{
                margin-left: 50px;
                margin-right: 50px;
            }
            .pengesahan{
                display: inline-block;
                width:33%;
                text-align: center;
            }
            .floatleft{
                float:left;
                position: relative;
            }
            .floatright{
                float:right;
                position: relative;
            }
            table{
                width:80%;
            }
            .tdleft{
                width:40%;
                padding-left: 20px;
            }
            .tdright{
                width:60%;
                padding-right: 20px;
            }
            .logo_kop{
                width:85px;
                float:left;
                position:absolute;  
/*                margin-bottom:0;*/
            }
            .right{
                position:absolute;
                float:right;
            }
            .inline-block{
                display: inline-block;
                width:90%;
                margin-left: 10%;
                
            }
        </style>
    </head>
    <body>
        <img src="<?= base_url()?>/assets/images/logo_kab.jpg" class="inline-block logo_kop"/>
        <header class="inline-block center right">
            <section class="f16">PEMERINTAH KABUPATEN CIREBON</section>
            <section class="f16 bold">DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL</section>
            <section class="f12">Komplek Perkantoran: Jl. Sunan Muria No. 04 Telp. (0231)321264</section>
            <section class="f16 bold">SUMBER</section>
        </header>
        <br>
        <br>
        <br>
        <br>
        <br>
        <hr>
        <br>
        <br>
        <section class="paragraf">
            <table>
                <tr>
                    <td class="f12 tdleft">PROVINSI</td>
                    <td class="f12 tdright">: 32 - JAWA BARAT</td>
                </tr>
                <tr>
                    <td class="f12 tdleft">KABUPATEN/KOTA</td>
                    <td class="f12 tdright">: 09 - CIREBON</td>
                </tr>
                <tr>
                    <td class="f12 tdleft">KECAMATAN</td>
                    <td class="f12 tdright">: 20 - KEDAWUNG</td>
                </tr>
                <tr>
                    <td class="f12 tdleft">DESA/KELURAHAN</td>
                    <td class="f12 tdright">: 2005 - SUTAWINANGUN</td>
                </tr>
            </table>
        </section>
        <br>
        
        <?php foreach ($surat as $row) {} 
        $array1=explode("-",$row->tanggal_pembuatan);
        $tahun=$array1[0];
        $bulan=$array1[1];
        $sisa1=$array1[2];
        $array2=explode(" ",$sisa1);
        $tanggal=$array2[0];
        $array_bulan = array(1=>"I","II","III", "IV", "V","VI","VII","VIII","IX","X", "XI","XII");
        if($bulan>10){
            $bulan = $array_bulan[$bulan];
        }else{
            $bulan = $array_bulan[$bulan[1]];
        }
             
        ?> 
        <section class="center bold f12 ">SURAT KETERANGAN PINDAH WNI</section>
        <section class="center underline f8 ">Antar Kabupaten/Kota atau Provinsi</section>
        <section class="center f12">Nomor: 142 /<?= $tanggal.$row->id_surat; ?> / <?=$bulan?> / Des / <?=$tahun?></section>
        <br>
        <section class="justify f12">
        <p class="paragraf">DATA DAERAH ASAL :</p>
        </section>
        <section class="paragraf">
            <table>
                <tr>
                    <td class="f12 tdleft">Nomor Kartu Keluarga</td>
                    <td class="f12 tdright">: <?= $row->nomor_kartu_keluarga; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Nama Kepala Keluarga</td>
                    <td class="f12 tdright">: <?= $row->nama_kepala_keluarga; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Alamat</td>
                    <td class="f12 tdright">: <?= $row->alamat_asal; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">NIK Pemohon</td>
                    <td class="f12 tdright">: <?= $row->nik_pemohon; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Nama Lengkap</td>
                    <td class="f12 tdright">: <?= $row->nama_lengkap; ?></td>
                </tr>
            </table>
        </section>
        <section class="justify f12">
        <p class="paragraf">DATA KEPINDAHAN :</p>
        </section>
        <section class="paragraf">
            <table>
                <tr>
                    <td class="f12 tdleft">Alasan Pindah</td>
                    <td class="f12 tdright">: <?= $row->alasan_pindah; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Alamat Tujuan Pindah</td>
                    <td class="f12 tdright">: <?= $row->alamat_tujuan; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Jenis Kepindahan</td>
                    <td class="f12 tdright">: <?= $row->jenis_kepindahan; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Status KK yang tidak pindah</td>
                    <td class="f12 tdright">: <?= $row->status_kk_yang_tidak_pindah; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Status KK bagi yang pindah</td>
                    <td class="f12 tdright">: <?= $row->status_kk_yang_pindah; ?></td>
                </tr>
            </table>
        </section>
        <section class="justify f12">
        <p class="paragraf">Keluarga yang pindah :</p>
        </section>
        <section class="paragraf">
            <table>
                <tr>
                    <td class="f12 tdleft">NIK</td>
                    <td class="f12 tdright">: <?= $row->nik_keluarga_yang_pindah; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Nama</td>
                    <td class="f12 tdright">: <?= $row->nama_keluarga_yang_pindah; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">Masa Berlaku KTP</td>
                    <td class="f12 tdright">: <?= $row->masa_berlaku_ktp; ?></td>
                </tr>
                <tr>
                    <td class="f12 tdleft">SHDK</td>
                    <td class="f12 tdright">: <?= $row->shdk; ?></td>
                </tr>
            </table>
        </section>
        <section class="justify f8">
            <p class="paragraf justify">
            Surat keterangan pindah (SKP) ini berlaku sebagai pengganti KTP selama KTP baru belum diterbitkan paling lama 30 hari sejak SKP diterbitkan.
            </p>
        </section>
        <section class="center f12">Sutawinangun, <?= $format = date('d F Y', strtotime($row->tanggal_pembuatan)); ?></section>
        <br>
        <section class="pengesahan f12 floatleft">
            <br>
        Pemohon,
            <br><br>
            <br><br>
            <br><br>
            <br><br>
            ( <?= $row->nama_lengkap;?> )
        </section>
        <section class="pengesahan f12 floatleft">
            Mengetahui,<br>
        Kuwu Sutawinangun,
            <br><br>
            <br><br>
            <br><br>
            <br><br>
            ( DEDI SUPARTO )
        </section>
        <section class="pengesahan f12 floatright">
            No.<br>
            Camat Kedawung,
            <br><br>
            <br><br>
            <br><br>
            <br><br>
            <span class="bold underline">(.................)</span>
        </section>
    </body>
</html>
 