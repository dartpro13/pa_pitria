<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

?>
<div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Surat Layanan Penduduk / Keterangan KK</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>e-Government <small>surat keterangan kartu keluarga</small></h2>
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
                    <br />
                    <?php
                    if($sub=="Input"){
                        $id_surat="";
                        foreach ($penduduk as $row){
                        $nama_lengkap=$row->nama;
                        $jenis_kelamin=$row->j_kelamin;
                        $tempat_tanggal_lahir=$row->tgl_lahir;
                        $bangsa_agama=$row->agama;
                        $pekerjaan=$row->pekerjaan;
                        $alamat=$row->alamat;
                        $ro="";
                     }
                        $url=base_url(). 'index.php/action/input_surat_keterangan_kk';
                    }else if($sub=="Update")
                    {foreach ($surat as $row){
                        $id_surat=$row->id_surat;
                        $nama_lengkap=$row->nama_lengkap;
                        $jenis_kelamin=$row->jenis_kelamin;
                        $tempat_tanggal_lahir=$row->tempat_tanggal_lahir;
                        $bangsa_agama=$row->bangsa_agama;
                        $pekerjaan=$row->pekerjaan;
                        $alamat=$row->alamat;
                      $ro="readonly";
                      $url=base_url(). 'index.php/action/update_surat_keterangan_kk';
                     }}?>
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" action="<?= $url?>">
                      <div class="form-group">
                        <label for="nama_lengkap" class="control-label col-md-3 col-sm-3 col-xs-12">Nama Lengkap<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="id_surat" class="form-control col-md-7 col-xs-12" required="required" type="hidden" name="id_surat" value="<?=$id_surat;?>">
                            <input id="nama_lengkap" class="form-control col-md-7 col-xs-12" required="required" type="text" name="nama_lengkap" value="<?=$nama_lengkap;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="jenis_kelamin" class="control-label col-md-3 col-sm-3 col-xs-12">Jenis Kelamin <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" id="sel1" name="jenis_kelamin">
                            <option value="Laki-Laki">Laki-Laki</option>
                            <option value="Perempuan">Perempuan</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="tempat_tanggal_lahir" class="control-label col-md-3 col-sm-3 col-xs-12">Tempat Tanggal Lahir <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="tempat_tanggal_lahir" class="form-control col-md-7 col-xs-12" required="required" type="date" name="tempat_tanggal_lahir">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="bangsa_agama" class="control-label col-md-3 col-sm-3 col-xs-12">Bangsa / Agama <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="bangsa_agama" class="form-control col-md-7 col-xs-12" required="required" type="text" name="bangsa_agama"value="<?=$bangsa_agama;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="pekerjaan" class="control-label col-md-3 col-sm-3 col-xs-12">Pekerjaan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pekerjaan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="pekerjaan"value="<?=$pekerjaan;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="alamat" class="control-label col-md-3 col-sm-3 col-xs-12">Alamat<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="alamat" class="form-control col-md-7 col-xs-12" required="required" type="text" name="alamat" value="<?=$alamat;?>">
                        </div>
                      </div>
                      <!-- <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Image <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="custom-input">
                              <span></span>
                            <span>
                                <input type="file" accept="image/*" class="form-control" required="required"><button type="button" class="btn btn-primary">Browse File</button>
                            </span>
                          </div>
                        </div>
                      </div> -->
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="button  " class="btn btn-primary">Cancel</button>
                          <button type="submit" class="btn btn-success">Add</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
<script>
    (function() {
    var input = document.getElementsByClassName('custom-input');
    for (var i = 0, len = input.length; i < len; ++i) {
        var theInput = input[i].getElementsByTagName('input')[0];
        theInput.onchange = function() {
            this.parentNode.parentNode.children[0].innerHTML = this.value;
            this.title = this.value;
        };
    }
})();
</script>
