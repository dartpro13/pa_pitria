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
                  <th>Nomor Surat</th>
                  <th>Nama Pelapor</th>
                  <th>Nama Orang Yang Meninggal</th>
                  <th>Hari Kematian</th>
                  <th>Tanggal Kematian</th>
                  <th>Penyebab Kematian</th>
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
                  <td><?= $row->nomor_surat;?></td>
                  <td><?= $row->pelapor_nama;?></td>
                  <td><?= $row->terlapor_nama;?></td>
                  <td><?= $row->meninggal_hari;?></td>
                  <td><?= $row->meninggal_tanggal;?></td>
                  <td><?= $row->meninggal_penyebab;?></td>
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
