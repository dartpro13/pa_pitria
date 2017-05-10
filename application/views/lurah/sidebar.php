<?php
/*
 * Author       :Imaduddin Haris Nasution|Digital Art Developer
 */
?>
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <br/><br/><br/><br/>
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a href="<?= site_url()?>/admin/index">
                      <i class="fa fa-home"></i> Dashboard <span class="fa fa-chevron-down"></span></a>
                  </li>
                  <!-- <li><a><i class="fa fa-edit"></i>Kependudukan<span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="<?= site_url()?>/admin/input_data_penduduk">Input Data Penduduk</a></li>
                        <li><a href="<?= site_url()?>/admin/list_data_penduduk">List Data Penduduk</a></li>
                    </ul>
                  </li> -->
                </br>
                  <h3>Surat Menyurat</h3>
                </br>
                  <li><a><i class="fa fa-edit"></i>Layanan Penduduk<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a>KTP</a>
                        <ul class="nav child_menu">
<!--                            <li><a href="<?= site_url()?>/admin/surat_keterangan_ktp">Input</a></li>-->
                        <li><a href="<?= site_url()?>/lurah/list_surat_keterangan_ktp">View</a></li>
                        </ul>
                      </li>
                      <li><a>KK</a>
                        <ul class="nav child_menu">
<!--                            <li><a href="<?= site_url()?>/admin/surat_keterangan_kk">Input</a></li>-->
                        <li><a href="<?= site_url()?>/lurah/list_surat_keterangan_kk">View</a></li>
                        </ul>
                      </li>
                        <li><a>Kelahiran</a>
                        <ul class="nav child_menu">
<!--                            <li><a href="<?= site_url()?>/admin/surat_kelahiran">Input</a></li>-->
                        <li><a href="<?= site_url()?>/lurah/list_surat_kelahiran">View</a></li>
                        </ul>
                      </li>
                      <li><a>Kematian</a>
                        <ul class="nav child_menu">
<!--                            <li><a href="<?= site_url()?>/admin/surat_kematian">Input</a></li>-->
                        <li><a href="<?= site_url()?>/lurah/list_surat_kematian">View</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                </ul>
              </div>

            </div>
