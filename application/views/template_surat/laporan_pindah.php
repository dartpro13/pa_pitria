<h2><small>Data Penduduk Desa Sutawinangun</small></h2>
Total Surat : <?=$total?> surat<br>                  
          <div class="x_content">
            <p class="text-muted font-13 m-b-30">
              <!-- DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code> -->
            </p>
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
<!--                  <th>Aksi</th>-->
                </tr>
              </thead>
              <tbody>
                <?php
                $no=1;
                foreach ($surat as $row) {
                ?>
                <tr>
                  <td><?= $no++;?></td>
                  <td><?= $row->nama_lengkap;?></td>
                  <td><?= $row->alasan_pindah;?></td>
                  <td><?= $row->nama_kepala_keluarga;?></td>
                  <td><?= $row->alamat_asal;?> RT.<?= $row->rt_asal;?> RW.<?= $row->rw_asal;?></td>
                  <td><?= $row->alamat_tujuan;?> RT.<?= $row->rt_tujuan;?> RW.<?= $row->rw_tujuan;?></td>
                  <td><?= $row->status;?></td>
<!--
                  <td>
                    <a href="<?php echo base_url(). 'index.php/admin/update_data_penduduk/'.$row->nik; ?>" style="background-color:cornflowerblue;color:white;padding:5px;border-radius:10px;">update</a><br/><br/>
                    <a href="<?php echo base_url(). 'index.php/action/hapus_data_penduduk/'.$row->nik; ?>" style="background-color:crimson;color:white;padding:5px;border-radius:10px;">delete</a>
                  </td>
-->
                </tr>
                <?php
                }
                 ?>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
