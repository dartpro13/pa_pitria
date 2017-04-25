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
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?= site_url()?>/admin/index">Dashboard</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i>Kependudukan<span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="<?= site_url()?>/admin/input_data_penduduk">Input Data Penduduk</a></li>
                            <li><a href="<?= site_url()?>/admin/import_from_excel_data_penduduk">Import Data Penduduk</a></li>
                        <li><a href="<?= site_url()?>/admin/list_data_penduduk">List Data Penduduk</a></li>
                    </ul>
                  </li>
                </br>
                  <h3>Surat Menyurat</h3>
                </br>
                  <li><a><i class="fa fa-edit"></i>Layanan Penduduk<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a>Kelahiran</a>
                        <ul class="nav child_menu">
                            <li><a href="<?= site_url()?>/admin/surat_kelahiran">Input</a></li>
                        <li><a href="<?= site_url()?>/admin/list_surat_kelahiran">View</a></li>
                        </ul>
                      </li>
                      <li><a href="<?= site_url()?>/admin/slider2">Keterangan</a></li>
                      <li><a href="<?= site_url()?>/admin/slider3">Kematian</a></li>
                      <li><a href="<?= site_url()?>/admin/premium_service">Bepergian</a></li>
                      <li><a href="<?= site_url()?>/admin/global_solution">KTP / KTP Sementara</a></li>
                      <li><a href="<?= site_url()?>/admin/expertise">Tidak Mampu</a></li>
                      <li><a href="<?= site_url()?>/admin/resources">Usaha</a></li>
                      <li><a href="<?= site_url()?>/admin/research">Keringanan Sekolah</a></li>
                      <li><a href="<?= site_url()?>/admin/research">JPS</a></li>
                      <li><a href="<?= site_url()?>/admin/research">Permohonan KTP</a></li>
                      <li><a href="<?= site_url()?>/admin/research">Pindah Tempat dll</a></li>
                      <li><a href="<?= site_url()?>/admin/research">Pendatang</a></li>
                      <li><a href="<?= site_url()?>/admin/research">Jual Beli Tanah</a></li>
                      <li><a href="<?= site_url()?>/admin/research">Ahli Waris</a></li>
                      <li><a href="<?= site_url()?>/admin/research">Kop Surat dll</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i>Pernikahan <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?= site_url()?>/admin/profile_desc">Profile Description</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Kepolisian <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?= site_url()?>/admin/service1">Service 1</a></li>
                      <li><a href="<?= site_url()?>/admin/service2">Service 2</a></li>
                      <li><a href="<?= site_url()?>/admin/service3">Service 3</a></li>
                      <li><a href="<?= site_url()?>/admin/service4">Service 4</a></li>
                      <li><a href="<?= site_url()?>/admin/image">Image</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Default Surat <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="<?= site_url()?>/admin/motivate">Motivate</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">E-commerce</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">Profile</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                      <li><a href="page_404.html">404 Error</a></li>
                      <li><a href="page_500.html">500 Error</a></li>
                      <li><a href="plain_page.html">Plain Page</a></li>
                      <li><a href="login.html">Login Page</a></li>
                      <li><a href="pricing_tables.html">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul>
              </div>

            </div>
