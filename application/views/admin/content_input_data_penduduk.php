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
                <h3>Kependudukan / <?= $sub?> Data Penduduk</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>e-Government <small><?= $sub;?> data penduduk</small></h2>
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
                      $nik="";
                      $nama = "";
                      $j_kelamin = "";
                      $agama = "";
                      $tmp_lahir = "";
                      $tgl_lahir = "";
                      $alamat = "";
                      $kewarganegaraan = "";
                      $pekerjaan = "";
                      $status_perkawinan="";
                      $ro="";
                      $url=base_url(). 'index.php/action/input_data_penduduk';
                    }else if($sub=="Update")
                    {foreach ($penduduk as $row){
                      $nik = $row->nik;
                      $nama = $row->nama;
                      $j_kelamin = $row->j_kelamin;
                      $agama = $row->agama;
                      $tmp_lahir = $row->tmp_lahir;
                      $tgl_lahir = $row->tgl_lahir;
                      $alamat = $row->alamat;
                      $status_perkawinan = $row->status_perkawinan;
                      $kewarganegaraan = $row->kewarganegaraan;
                      $pekerjaan = $row->pekerjaan;
                      $ro="readonly";
                      $url=base_url(). 'index.php/action/update_data_penduduk';
                     }}?>
                    <form id="demo-form2" method="post" action="<?php echo $url; ?>" data-parsley-validate class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name" >NIK <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="nik" name="nik" required="required" class="form-control col-md-7 col-xs-12"value="<?= $nik ?>" <?=$ro?>>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Nama <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="nama" name="nama" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text"value="<?= $nama ?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Jenis Kelamin <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="j_kelamin" name="j_kelamin" class="form-control col-md-7 col-xs-12" required="required" type="text" name="middle-name"value="<?= $j_kelamin ?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Agama<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="agama" name="agama" class="form-control col-md-7 col-xs-12" required="required" type="text" name="middle-name" value="<?= $agama?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Tempat Lahir<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="tmp_lahir" name="tmp_lahir" class="form-control col-md-7 col-xs-12" required="required" type="text" name="middle-name"value="<?= $tmp_lahir ?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal Lahir<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="tgl_lahir" name="tgl_lahir" class="form-control col-md-7 col-xs-12" required="required" type="date" name="middle-name" value="<?= $tgl_lahir ?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Alamat <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="alamat" name="alamat" class="form-control col-md-7 col-xs-12" required="required" type="text" name="middle-name" value="<?= $alamat ?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Status Perkawinan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="status_perkawinan" name="status_perkawinan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="middle-name" value="<?=$status_perkawinan?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Kewarganegaraan <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="kewarganegaraan" name="kewarganegaraan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="middle-name" value="<?= $kewarganegaraan ?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Pekerjaan <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pekerjaan" name="pekerjaan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="middle-name" value="<?= $pekerjaan ?>">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="cancel" class="btn btn-primary">Cancel</button>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
