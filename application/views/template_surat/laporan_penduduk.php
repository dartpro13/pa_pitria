<h2>e-Government <small>list data penduduk </small></h2>
            
          <div class="x_content">
            <p class="text-muted font-13 m-b-30">
              <!-- DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code> -->
            </p>
            <table id="datatable" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>NIK</th>
                  <th>Nama</th>
                  <th>Jenis Kelamin</th>
                  <th>Agama</th>
                  <th>Tempat Lahir</th>
                  <th>Tanggal Lahir</th>
                  <th>Alamat</th>
                  <th>Status Perkawinan</th>
                  <th>kewarganegaraan</th>
                  <th>Pekerjaan</th>
<!--                  <th>Aksi</th>-->
                </tr>
              </thead>
              <tbody>
                <?php
                $no=1;
                foreach ($penduduk as $row) {
                ?>
                <tr>
                  <td><?= $no++;?></td>
                  <td><?= $row->nik;?></td>
                  <td><?= $row->nama;?></td>
                  <td><?= $row->j_kelamin;?></td>
                  <td><?= $row->agama;?></td>
                  <td><?= $row->tmp_lahir;?></td>
                  <td><?= $row->tgl_lahir;?></td>
                  <td><?= $row->alamat;?></td>
                  <td><?= $row->status_perkawinan;?></td>
                  <td><?= $row->kewarganegaraan;?></td>
                  <td><?= $row->pekerjaan;?></td>
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
