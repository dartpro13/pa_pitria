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
    <title>Digital Art Project | <?= $title; ?> </title>

    <link rel="stylesheet" href="<?= $assets;?>css/normalize.css">

    
        <link rel="stylesheet" href="<?= $assets;?>css/style.css">

    
    
    
  </head>

  <body>

    <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"style="width:1000px!important; text-align:center;"><a href="#login">Log In</a></li>
      </ul>
      
        <div id="login active">   
          <h1>Welcome Back!</h1>
          
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
