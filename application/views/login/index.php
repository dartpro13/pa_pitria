<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * File Name    :index.php
 * Folder Name  :Login
 * Author       :Imaduddin Haris Nasution|Digital Art Developer
 */
?>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="icon" href="<?= $img;?>fav.png" type="image/x-icon">
    <title>E-Government | <?= $title; ?> </title>

    <link rel="stylesheet" href="<?= $assets;?>css/normalize.css">

    
        <link rel="stylesheet" href="<?= $assets;?>css/style.css">

      <style>
          body { 
              background-image: url('<?=$assets?>images/desa/1.jpg');
          } 
 
      </style>
    
  </head>

  <body>
    <div class="form">
        <div id="login active">   
            <center>
                <div style="width:175px;height:175px; border-radius:100%; background:#FFF; overflow:hidden; padding:10px;margin-bottom:20px;">
                    <img src="<?= base_url()?>/assets/images/logo_kab.jpg" style="width:150px;"/>
                </div>
            </center>
          <form action="login/login_process" method="post">
          
            <div class="field-wrap">
            <label>
              Username<span class="req">*</span>
            </label>
            <input name="username" type="text"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input name="password" type="password"required autocomplete="off"/>
          </div>
          
<!--          <p class="forgot"><a href="#">Forgot Password?</a></p>-->
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="<?= $assets;?>js/index.js"></script>

    
    
    
  </body>
</html>
