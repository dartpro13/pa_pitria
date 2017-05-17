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
                <h3>Surat Layanan Penduduk / Keterangan Pindah</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>e-Government <small>surat keterangan pindah WNI</small></h2>
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
                        $nomor_kartu_keluarga="";
                        $nama_kepala_keluarga="";
                        $alamat_asal="";
                        $rt_asal="";
                        $rw_asal="";
                        $dusun_asal="";
                        $nik_pemohon="";
                        $nama_lengkap="";
                        $alasan_pindah="";
                        $alamat_tujuan="";
                        $rt_tujuan="";
                        $rw_tujuan="";
                        $dusun_tujuan="";
                        $desa_tujuan="";
                        $kecamatan_tujuan="";
                        $kabupaten_tujuan="";
                        $provinsi_tujuan="";
                        $jenis_kepindahan="";
                        $status_kk_yang_tidak_pindah="";
                        $status_kk_yang_pindah="";
                        $nik_keluarga_yang_pindah="";
                        $nama_keluarga_yang_pindah="";
                        $masa_berlaku_ktp="";
                        $shdk="";
                        $url=base_url(). 'index.php/action/input_surat_keterangan_pindah';
                    }else if($sub=="Update")
                    {foreach ($surat as $row){
                        $id_surat=$row->id_surat;
                        $nomor_kartu_keluarga=$row->nomor_kartu_keluarga;
                        $nama_kepala_keluarga=$row->nama_kepala_keluarga;
                        $alamat_asal=$row->alamat_asal;
                        $rt_asal=$row->rt_asal;
                        $rw_asal=$row->rw_asal;
                        $dusun_asal=$row->dusun_asal;
                        $nik_pemohon=$row->nik_pemohon;
                        $nama_lengkap=$row->nama_lengkap;
                        $alasan_pindah=$row->alasan_pindah;
                        $alamat_tujuan=$row->alamat_tujuan;
                        $rt_tujuan=$row->rt_tujuan;
                        $rw_tujuan=$row->rw_tujuan;
                        $dusun_tujuan=$row->dusun_tujuan;
                        $desa_tujuan=$row->desa_tujuan;
                        $kecamatan_tujuan=$row->kecamatan_tujuan;
                        $kabupaten_tujuan=$row->kabupaten_tujuan;
                        $provinsi_tujuan=$row->provinsi_tujuan;
                        $jenis_kepindahan=$row->jenis_kepindahan;
                        $status_kk_yang_tidak_pindah=$row->status_kk_yang_tidak_pindah;
                        $status_kk_yang_pindah=$row->status_kk_yang_pindah;
                        $nik_keluarga_yang_pindah=$row->nik_keluarga_yang_pindah;
                        $nama_keluarga_yang_pindah=$row->nama_keluarga_yang_pindah;
                        $masa_berlaku_ktp=$row->masa_berlaku;
                        $shdk=$row->shdk;
                      $ro="readonly";
                      $url=base_url(). 'index.php/action/update_surat_keterangan_pindah';
                     }}?>
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" action="<?= $url?>">
                      <div class="form-group">
                        <label for="nomor_kartu_keluarga" class="control-label col-md-3 col-sm-3 col-xs-12">Nomor Kartu Keluarga<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="id_surat" class="form-control col-md-7 col-xs-12" required="required" type="hidden" name="id_surat" value="<?=$id_surat;?>">
                            <input id="nomor_kartu_keluarga" class="form-control col-md-7 col-xs-12" required="required" type="text" name="nomor_kartu_keluarga" value="<?=$nomor_kartu_keluarga;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="nama_kepala_keluarga" class="control-label col-md-3 col-sm-3 col-xs-12">Nama Kepala Keluarga <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="nama_kepala_keluarga" class="form-control col-md-7 col-xs-12" required="required" type="text" name="nama_kepala_keluarga" value="<?=$nama_kepala_keluarga;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="alamat_asal" class="control-label col-md-3 col-sm-3 col-xs-12">Alamat Asal<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="alamat_asal" class="form-control col-md-7 col-xs-12" required="required" type="text" name="alamat_asal" value="<?=$alamat_asal;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="rt_asal" class="control-label col-md-3 col-sm-3 col-xs-12">RT Asal <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="rt_asal" class="form-control col-md-7 col-xs-12" required="required" type="text" name="rt_asal"value="<?=$rt_asal;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="rw_asal" class="control-label col-md-3 col-sm-3 col-xs-12">RW Asal<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="rw_asal" class="form-control col-md-7 col-xs-12" required="required" type="text" name="rw_asal"value="<?=$rw_asal;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="dusun_awal" class="control-label col-md-3 col-sm-3 col-xs-12">Dusun Asal<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="dusun_awal" class="form-control col-md-7 col-xs-12" required="required" type="text" name="dusun_awal" value="<?=$dusun_asal;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="nik_pemohon" class="control-label col-md-3 col-sm-3 col-xs-12">NIK Pemohon<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="nik_pemohon" class="form-control col-md-7 col-xs-12" required="required" type="text" name="nik_pemohon" value="<?=$nik_pemohon;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="nama_lengkap" class="control-label col-md-3 col-sm-3 col-xs-12">Nama Lengkap<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="nama_lengkap" class="form-control col-md-7 col-xs-12" required="required" type="text" name="nama_lengkap" value="<?=$nama_lengkap;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="alasan_pindah" class="control-label col-md-3 col-sm-3 col-xs-12">Alasan Pindah<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="alasan_pindah" class="form-control col-md-7 col-xs-12" required="required" type="text" name="alasan_pindah" value="<?=$alasan_pindah;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="alamat_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">Alamat Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="alamat_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="alamat_tujuan" value="<?=$alamat_tujuan;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="rt_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">RT Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="rt_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="rt_tujuan" value="<?=$rt_tujuan;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="rw_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">RW Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="rw_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="rw_tujuan" value="<?=$rw_tujuan;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="dusun_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">Dusun Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="dusun_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="dusun_tujuan"value="<?=$dusun_tujuan;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="desa_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">Desa Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="desa_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="desa_tujuan"value="<?=$desa_tujuan;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="kecamatan_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">Kecamatan Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="kecamatan_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="kecamatan_tujuan" value="<?=$kecamatan_tujuan;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="kabupaten_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">Kabupaten Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="kabupaten_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="kabupaten_tujuan" value="<?=$kabupaten_tujuan;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="provinsi_tujuan" class="control-label col-md-3 col-sm-3 col-xs-12">Provinsi Tujuan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="provinsi_tujuan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="provinsi_tujuan" value="<?=$provinsi_tujuan;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="jenis_kepindahan" class="control-label col-md-3 col-sm-3 col-xs-12">Jenis Kepindahan<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="jenis_kepindahan" class="form-control col-md-7 col-xs-12" required="required" type="text" name="jenis_kepindahan" value="<?=$jenis_kepindahan;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="status_kk_yang_tidak_pindah" class="control-label col-md-3 col-sm-3 col-xs-12">Status KK yang tidak pindah<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="status_kk_yang_tidak_pindah" class="form-control col-md-7 col-xs-12" required="required" type="text" name="status_kk_yang_tidak_pindah" value="<?=$status_kk_yang_tidak_pindah;?>">
                        </div>
                      </div>
                        
                        <div class="form-group">
                        <label for="status_kk_yang_pindah" class="control-label col-md-3 col-sm-3 col-xs-12">Status KK yang pindah<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="status_kk_yang_pindah" class="form-control col-md-7 col-xs-12" required="required" type="text" name="status_kk_yang_pindah" value="<?=$status_kk_yang_pindah;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="nik_keluarga_yang_pindah" class="control-label col-md-3 col-sm-3 col-xs-12">NIK<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="nik_keluarga_yang_pindah" class="form-control col-md-7 col-xs-12" required="required" type="text" name="nik_keluarga_yang_pindah" value="<?=$nik_keluarga_yang_pindah;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="nama_keluarga_yang_pindah" class="control-label col-md-3 col-sm-3 col-xs-12">Nama<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="nama_keluarga_yang_pindah" class="form-control col-md-7 col-xs-12" required="required" type="text" name="nama_keluarga_yang_pindah" value="<?=$nama_keluarga_yang_pindah;?>">
                        </div>
                      </div>
                        <div class="form-group">
                        <label for="masa_berlaku_ktp" class="control-label col-md-3 col-sm-3 col-xs-12">Masa Berlaku KTP<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="masa_berlaku_ktp" class="form-control col-md-7 col-xs-12" required="required" type="text" name="masa_berlaku_ktp" value="<?=$masa_berlaku_ktp;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="shdk" class="control-label col-md-3 col-sm-3 col-xs-12">SHDK<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="SHDK" class="form-control col-md-7 col-xs-12" required="required" type="text" name="SHDK" value="<?=$shdk;?>">
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
