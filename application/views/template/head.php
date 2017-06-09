<?php
/*
 * File Name    :head.php
 * Folder Name  :Admin
 * Author       :Imaduddin Haris Nasution|Digital Art Developer
 */
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="<?= $assets;?>images/fav.png" type="image/x-icon">
    <title>E-Government | <?= $title; ?> </title>
      <script src="<?= $css.'chart/Chart.bundle.js'?>"></script>
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<?= $css.'nprogress.css';?>" rel="stylesheet">
    <!-- iCheck -->
    <link href="<?= $css.'green.css';?>" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="<?= $css.'bootstrap-progressbar-3.3.4.min.css';?>" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<?= $css.'jqvmap.min.css';?>" rel="stylesheet"/>
    <style>
        .logo-dashboard
        {
            height:50px;
        }
        .custom-input {
            display:inline-block;
            position:relative;
            min-width:250px;
            height:35px;
            font:normal normal 13px/30px Helmet,FreeSans,Sans-Serif;
            border:1px solid #BBB;
            cursor:text;
            box-shadow: inset 0 0 1px 0 #BBB;
            padding-left:5px;
        }
        .custom-input input {
        /* sembunyikan dengan `opacity:0` */
            opacity:0;
            filter:alpha(opacity=0);
        /* pastikan elemen ini selalu berada di sebelah atas */
            display:block;
            position:absolute;
            top:0;
            right:0;
            margin:0;
            padding:0;
            font-size:100%;
            z-index:4;
            cursor:pointer;

        }

        .custom-input span {
            display:block;
            position:absolute;
            top:0;
            right:0;
            bottom:0;
            left:0;
        }
        .custom-input span button {
            margin:0;
            border-radius:0;
        }

        .custom-input span + span {
            left:auto;
        }


        /* Dora the Explorer */

        .custom-input input::-ms-value {display:none}

        .custom-input input::-ms-browse {
            display:block;
            margin:0;
            padding:0;
            cursor:inherit;
        }
    </style>
    <!-- Custom Theme Style -->
    <link href="<?= $css.'custom.min.css';?>" rel="stylesheet">
  </head>

  <body class="nav-md">
