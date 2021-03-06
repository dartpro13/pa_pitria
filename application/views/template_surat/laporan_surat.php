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
                width:50%;
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
            <section class="f16 bold">KECAMATAN KEDAWUNG</section>
            <section class="f20 bold">KANTOR KUWU SUTAWINANGUN</section>
            <section class="f12"><i>Jalan Pramuka No. 13 Telp. (0231)337037 <span class="bold">Cirebon 45153</span></i></section>
        </header>
        <br>
        <br>
        <br>
        <br>
        <br>
        <hr>
        <br>
        <br>
<h2><small>Laporan Surat Desa Sutawinangun</small></h2>
Total Surat : <?=$total_skl + $total_skm + $total_skktp + $total_skkk + $total_skp?> surat<br>            
          <div class="x_content">
            <p class="text-muted font-13 m-b-30">
              <!-- DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code> -->
            </p>
              <hr>
              Surat Kelahiran : <?=$total_skl?> surat<br>  
            <table id="datatable" class="table table-striped table-bordered" border="1" style="border-spacing:none;">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Nomor Surat</th>
                  <th>Nama Pemohon</th>
                  <th>Tempat Tanggal Lahir</th>
                  <th>Jenis Kelamin</th>
                  <th>Pekerjaan</th>
                  <th>Alamat</th>
                  <th>Nama Ayah Kandung</th>
                  <th>Nama Ibu Kandung</th>
                  <th>Anak ke</th>
                  <th>Tanggal Pembuatan</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no=1;
                foreach ($skl as $row) {
                ?>
                <tr>
                  <td><?= $no++;?></td>
                  <td><?= $row->nomor_surat;?></td>
                  <td><?= $row->nama;?></td>
                  <td><?= $row->tempat_tanggal_lahir;?></td>
                  <td><?= $row->jenis_kelamin;?></td>
                  <td><?= $row->pekerjaan;?></td>
                  <td><?= $row->alamat;?></td>
                  <td><?= $row->nama_ayah_kandung;?></td>
                  <td><?= $row->nama_ibu_kandung;?></td>
                  <td><?= $row->anak_ke;?></td>
                  <td><?= $row->tanggal_pembuatan;?></td>
                  <td><?= $row->status;?></td>
                </tr>
                <?php
                }
                 ?>

              </tbody>
            </table>
              <hr>
              Surat Kematian : <?=$total_skm?> surat<br>
              <table id="datatable" class="table table-striped table-bordered" border="1" style="border-spacing:none;">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Nomor Surat</th>
                  <th>Nama Pelapor</th>
                  <th>Nama Orang Yang Meninggal</th>
                  <th>Hari Kematian</th>
                  <th>Tanggal Kematian</th>
                  <th>Penyebab Kematian</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no=1;
                foreach ($skm as $row_skm) {
                ?>
                <tr>
                  <td><?= $no++;?></td>
                  <td><?= $row_skm->nomor_surat;?></td>
                  <td><?= $row_skm->pelapor_nama;?></td>
                  <td><?= $row_skm->terlapor_nama;?></td>
                  <td><?= $row_skm->meninggal_hari;?></td>
                  <td><?= $row_skm->meninggal_tanggal;?></td>
                  <td><?= $row_skm->meninggal_penyebab;?></td>
                  <td><?= $row_skm->status;?></td>
                </tr>
                <?php
                }
                 ?>

              </tbody>
            </table>
              <hr>
              Surat Pindah: <?=$total_skp?> surat<br>
              <table id="datatable" class="table table-striped table-bordered" border="1" style="border-spacing:none;">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Nama Lengkapr</th>
                  <th>Alasan Pindah</th>
                  <th>Nama Kepala Keluarga</th>
                  <th>Alamat Sebelumnya</th>
                  <th>Pindah Ke</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no=1;
                foreach ($skp as $row_skp) {
                ?>
                <tr>
                  <td><?= $no++;?></td>
                  <td><?= $row_skp->nama_lengkap;?></td>
                  <td><?= $row_skp->alasan_pindah;?></td>
                  <td><?= $row_skp->nama_kepala_keluarga;?></td>
                  <td><?= $row_skp->alamat_asal;?> RT.<?= $row_skp->rt_asal;?> RW.<?= $row_skp->rw_asal;?></td>
                  <td><?= $row_skp->alamat_tujuan;?> RT.<?= $row_skp->rt_tujuan;?> RW.<?= $row_skp->rw_tujuan;?></td>
                  <td><?= $row_skp->status;?></td>
                </tr>
                <?php
                }
                 ?>

              </tbody>
            </table>
              <hr>
              Surat Keterangan KTP: <?=$total_skktp?> surat<br>
              <table id="datatable" class="table table-striped table-bordered" border="1" style="border-spacing:none;">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Nama Lengkapr</th>
                  <th>Jenis Kelamin</th>
                  <th>Tempat Tanggal Lahir</th>
                  <th>Bangsa / Agama</th>
                  <th>Pekerjaan</th>
                    <th>Alamat</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no=1;
                foreach ($skktp as $row_skktp) {
                ?>
                <tr>
                  <td><?= $no++;?></td>
                  <td><?= $row_skktp->nama_lengkap;?></td>
                  <td><?= $row_skktp->jenis_kelamin;?></td>
                  <td><?= $row_skktp->tempat_tanggal_lahir;?></td>
                  <td><?= $row_skktp->bangsa_agama;?></td>
                  <td><?= $row_skktp->pekerjaan;?></td>
                  <td><?= $row_skktp->alamat;?></td>
                  <td><?= $row_skktp->status;?></td>
                </tr>
                <?php
                }
                 ?>

              </tbody>
            </table>
              <hr>
              Surat Keterangan KK: <?=$total_skkk?> surat<br>
              <table id="datatable" class="table table-striped table-bordered"  border="1" style="border-spacing:none;">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Nama Lengkapr</th>
                  <th>Jenis Kelamin</th>
                  <th>Tempat Tanggal Lahir</th>
                  <th>Bangsa / Agama</th>
                  <th>Pekerjaan</th>
                    <th>Alamat</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $no=1;
                foreach ($skkk as $row_skkk) {
                ?>
                <tr>
                  <td><?= $no++;?></td>
                  <td><?= $row_skkk->nama_lengkap;?></td>
                  <td><?= $row_skkk->jenis_kelamin;?></td>
                  <td><?= $row_skkk->tempat_tanggal_lahir;?></td>
                  <td><?= $row_skkk->bangsa_agama;?></td>
                  <td><?= $row_skkk->pekerjaan;?></td>
                  <td><?= $row_skkk->alamat;?></td>
                  <td><?= $row_skkk->status;?></td>
                </tr>
                <?php
                }
                 ?>

              </tbody>
            </table>
          </div>
        </body>
</html>