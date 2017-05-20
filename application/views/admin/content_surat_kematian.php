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
                <h3>Surat Layanan Penduduk / Kematian</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>e-Government <small>surat kematian</small></h2>
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
                      $nomor_surat = "";
                    	$terlapor_nama = "";
                    	$terlapor_jenis_kelamin = "";
                    	$terlapor_tanggal_lahir = "";
                    	$terlapor_agama = "";
                    	$terlapor_alamat = "";
                    	$meninggal_hari = "";
                    	$meninggal_tanggal = "";
                    	$meninggal_pukul = "";
                    	$meninggal_tempat = "";
                    	$meninggal_penyebab = "";
                    	$pelapor_nama = "";
                    	$pelapor_nik = "";
                    	$pelapor_tanggal_lahir = "";
                    	$pelapor_pekerjaan = "";
                    	$pelapor_alamat = "";
                      $ro="";
                      $url=base_url(). 'index.php/action/input_surat_kematian';
                    }else if($sub=="Update")
                    {foreach ($surat as $row){
                      $nomor_surat = $row->nomor_surat;
                    	$terlapor_nama = $row->terlapor_nama;
                    	$terlapor_jenis_kelamin = $row->terlapor_jenis_kelamin;
                    	$terlapor_tanggal_lahir = $row->terlapor_tanggal_lahir;
                    	$terlapor_agama = $row->terlapor_agama;
                    	$terlapor_alamat = $row->terlapor_alamat;
                    	$meninggal_hari = $row->meninggal_hari;
                    	$meninggal_tanggal = $row->meninggal_tanggal;
                    	$meninggal_pukul = $row->meninggal_pukul;
                    	$meninggal_tempat = $row->meninggal_tempat;
                    	$meninggal_penyebab = $row->meninggal_penyebab;
                    	$pelapor_nama = $row->pelapor_nama;
                    	$pelapor_nik = $row->pelapor_nik;
                    	$pelapor_tanggal_lahir = $row->pelapor_tanggal_lahir;
                    	$pelapor_pekerjaan = $row->pelapor_pekerjaan;
                    	$pelapor_alamat = $row->pelapor_alamat;
                      $ro="readonly";
                      $url=base_url(). 'index.php/action/update_surat_kematian';
                     }}?>
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" action="<?= $url?>">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nomor_surat">Nomor Surat <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="nomor_surat" required="required" name="nomor_surat" class="form-control col-md-7 col-xs-12" value="<?=$nomor_surat;?>" <?=$ro;?>>
                        </div>
                      </div>
                      <center><h4>Yang bertanda tangan dibawah ini, menerangkan bahwa:</h4></center>
                      <div class="form-group">
                        <label for="terlapor_nama" class="control-label col-md-3 col-sm-3 col-xs-12">Nama <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="terlapor_nama" class="form-control col-md-7 col-xs-12" required="required" type="text" name="terlapor_nama" value="<?=$terlapor_nama;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="terlapor_jenis_kelamin" class="control-label col-md-3 col-sm-3 col-xs-12">Jenis Kelamin <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" id="sel1" name="terlapor_jenis_kelamin">
                            <option value="Laki-Laki">Laki-Laki</option>
                            <option value="Perempuan">Perempuan</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="terlapor_tanggal_lahir" class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal Lahir <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="terlapor_tanggal_lahir" class="form-control col-md-7 col-xs-12" required="required" type="date" name="terlapor_tanggal_lahir">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="terlapor_agama" class="control-label col-md-3 col-sm-3 col-xs-12">Agama <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="terlapor_agama" class="form-control col-md-7 col-xs-12" required="required" type="text" name="terlapor_agama"value="<?=$terlapor_agama;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="terlapor_alamat" class="control-label col-md-3 col-sm-3 col-xs-12">Alamat<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="terlapor_alamat" class="form-control col-md-7 col-xs-12" required="required" type="text" name="terlapor_alamat" value="<?=$terlapor_alamat;?>">
                        </div>
                      </div>
                      <center><h4>Telah meninggal dunia pada:</h4></center>
                      <div class="form-group">
                        <label for="meninggal_hari" class="control-label col-md-3 col-sm-3 col-xs-12">Hari<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="meninggal_hari" class="form-control col-md-7 col-xs-12" required="required" type="text" name="meninggal_hari" value="<?=$meninggal_hari;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="meninggal_tanggal" class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="meninggal_tanggal" name="meninggal_tanggal" class="form-control col-md-7 col-xs-12" required="required" type="date">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="meninggal_pukul" class="control-label col-md-3 col-sm-3 col-xs-12">Pukul <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="meninggal_pukul" name="meninggal_pukul" class="form-control col-md-7 col-xs-12" required="required" type="time">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="meninggal_tempat" class="control-label col-md-3 col-sm-3 col-xs-12">Tempat <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="meninggal_tempat" name="meninggal_tempat" class="form-control col-md-7 col-xs-12" required="required" type="text" value="<?=$meninggal_tempat;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="meninggal_penyebab" class="control-label col-md-3 col-sm-3 col-xs-12">Penyebab <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="meninggal_penyebab" name="meninggal_penyebab" class="form-control col-md-7 col-xs-12" required="required" type="text" value="<?=$meninggal_penyebab;?>">
                        </div>
                      </div>
                      <center><h4>Surat keterangan ini dibuat berdasarkan keterangan pelapor:</h4></center>
                      <div class="form-group">
                        <label for="pelapor_nama" class="control-label col-md-3 col-sm-3 col-xs-12">Nama<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pelapor_nama" name="pelapor_nama" class="form-control col-md-7 col-xs-12" required="required" type="text" value="<?=$pelapor_nama;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="pelapor_nik" class="control-label col-md-3 col-sm-3 col-xs-12">NIK<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pelapor_nik" name="pelapor_nik" class="form-control col-md-7 col-xs-12" required="required" type="text" value="<?=$pelapor_nik;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="pelapor_tanggal_lahir" class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal Lahir<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pelapor_tanggal_lahir" name="pelapor_tanggal_lahir" class="form-control col-md-7 col-xs-12" required="required" type="date">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="pelapor_pekerjaan" class="control-label col-md-3 col-sm-3 col-xs-12">Pekerjaan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pelapor_pekerjaan" name="pelapor_pekerjaan" class="form-control col-md-7 col-xs-12" required="required" type="text" value="<?=$pelapor_pekerjaan;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="pelapor_alamat" class="control-label col-md-3 col-sm-3 col-xs-12">Alamat<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pelapor_alamat" name="pelapor_alamat" class="form-control col-md-7 col-xs-12" required="required" type="text" value="<?=$pelapor_alamat;?>">
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
                          <button type="submit" class="btn btn-primary">Cancel</button>
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
