<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

?>
<div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <?php 
//                      if($foto=='')
//                      {
                      ?>
                      <img src="<?= $foto;?>" alt=""><?=$username;?>
                      <?php
//                      }else{
                      ?>
<!--                      <img src="<?= $assets;?>images/<?=$active;?>/<?= $foto;?>" alt=""><?=$username;?>-->
                      <?php
//                      }
                      ?>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="<?php echo site_url($active.'/edit_profile/'); ?>">Edit Profile</a></li>
<!--
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
-->
<!--                    <li><a href="javascript:;">Help</a></li>-->
                    <li><a href="<?php echo site_url($active.'/logout'); ?>"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green"><?=$notif_count;?></span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <?php
                      if($notif_count!=0){
                      foreach ($notif as $not) {
                      ?>
                      <li>
                      <a href="<?php echo base_url(). 'index.php/action/hapus_notif/'.$not->id; ?>">
<!--                        <span class="image"><img src="<?= $assets;?>images/img.jpg" alt="Profile Image" /></span>-->
                        <span>
                          <span class="time"><?=$not->waktu;?></span>
                          <span>e-Government</span>
                        </span>
                        <span class="message">
                          <?=$not->deskripsi;?>
                        </span>
                      </a>
                    </li>
                      <li>
                      <div class="text-center">
                        <a>
                          <strong>Klik notif untuk menghapusnya</strong>
                        </a>
                      </div>
                    </li>
                      <?php }
                      }else{ ?>
                      <li>
                      <a>
<!--                        <span class="image"><img src="<?= $assets;?>images/img.jpg" alt="Profile Image" /></span>-->
                        <span>
                          <span>e-Government</span>
                          <span class="time">-</span>
                        </span>
                        <span class="message">
                          Tidak ada notifikasi
                        </span>
                      </a>
                    </li>
                      <?php } ?>
<!--
                    <li>
                      <a>
                        <span class="image"><img src="<?= $assets;?>images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="<?= $assets;?>images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="<?= $assets;?>images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
-->
<!--                    </li>-->
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>