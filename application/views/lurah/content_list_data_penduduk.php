<div class="right_col" role="main">
  <div class="">
    <div class="page-title">
      <div class="title_left">
        <h3>Kependudukan <small>/ List Data Penduduk</small></h3> 
          
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
            <h2>e-Government <small>list data penduduk</small></h2>
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
              <div style="max-height:500px; overflow-y:scroll;">
            <table id="datatable" style="table-layout: fixed;word-wrap: break-word;" class="table table-striped table-bordered">
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
    td = tr[i].getElementsByTagName("td")[2];
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