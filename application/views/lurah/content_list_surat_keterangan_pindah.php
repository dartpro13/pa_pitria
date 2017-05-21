<div class="right_col" role="main">
  <div class="">
    <div class="page-title">
      <div class="title_left">
        <h3>Surat Layanan Penduduk <small>/ List Surat Keterangan KTP</small></h3>
      </div>

      <div class="title_right">
        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
          <div class="input-group">
             <input type="text" id="myInput" class="form-control" onkeyup="myFunction()" placeholder="Search for names..">
            <span class="input-group-btn">
              <button class="btn btn-default" type="button">Go!</button>
            </span>
          </div>
        </div>
      </div>
    </div>

    <div class="clearfix"></div>

    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
          <div class="x_title">
            <h2>e-Government <small>list surat keterangan ktp</small></h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Settings 1</a>
                  </li>
                  <li><a href="#">Settings 2</a>
                  </li>
                </ul>
              </li>
              <li><a class="close-link"><i class="fa fa-close"></i></a>
              </li>
            </ul>
            <div class="clearfix"></div>
          </div>
          <div class="x_content">
            <p class="text-muted font-13 m-b-30">
              <!-- DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code> -->
            </p>
            <table id="datatable" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Nama Lengkapr</th>
                  <th>Alasan Pindah</th>
                  <th>Nama Kepala Keluarga</th>
                  <th>Alamat Sebelumnya</th>
                  <th>Pindah Ke</th>
                  <th>Status</th>
                  <th>Aksi</th>
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
                  <td>
                      <?php 
                            if($row->status=="Di Setujui"){
                                $button='target="_blank" href="';
                                $button.=base_url(). 'index.php/lurah/doprint_skp/'.$row->id_surat.'/"';
                                $approval_link=base_url(). 'index.php/action/not_approve_surat_keterangan_pindah/';
                                $approval_caption = "Batal Setuju";
                            }else{
                                $button='href=""';
                                $button.='onClick="';
                                $button.="alert('Surat belum disetujui!')";
                                $button.='"';
                                $approval_link=base_url(). 'index.php/action/approve_surat_keterangan_pindah/';
                                $approval_caption = "Setujui";
                            }
                      ?>
                    <a <?=$button;?> style="text-decoration:underline;color:blue;padding:5px;border-radius:10px;">print</a><br/><br/>
                    <a href="<?php echo $approval_link.$row->id_surat; ?>" style="color:blue;text-decoration:underline;padding:5px;border-radius:10px;"><?=$approval_caption;?></a>
                  </td>
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
<script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("datatable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>