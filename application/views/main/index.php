<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="<?= $assets;?>images/fav.png" type="image/x-icon">
    <title>Digital Art Project | <?= $title; ?></title>

    <!-- Bootstrap -->
    <link href="<?= $css.'bootstrap.css';?>" rel="stylesheet">

    <!-- Links -->
    <link rel="stylesheet" href="<?= $css.'camera.css';?>">
    <link rel="stylesheet" href="<?= $css;?>search.css">
    <link rel="stylesheet" href="<?= $css;?>google-map.css">
    

    <!--JS-->
    <script type="text/javascript" src="<?= $js.'jquery.js';?>"></script>
    <script type="text/javascript" src="<?= $js;?>jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="<?= $js;?>rd-smoothscroll.min.js"></script>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

    <!--[if lt IE 9]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/..">
            <img src="<?= base_url() ?>assets/images/ie8-panel/warning_bar_0000_us.jpg" border="0" height="42" width="820"
                 alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
        </a>
    </div>
    <script src="<?= base_url() ?>assets/js/html5shiv.js"></script>
    <![endif]-->
    <script src="<?= $js;?>device.min.js"></script>
  </head>
  <body>
  <div class="page">
  <!--========================================================
                            HEADER
  =========================================================-->
    <?php echo $_head;?>
  <!--========================================================
                            SECTION 1
  =========================================================-->
    <?php echo $_section1;?>
  <!--========================================================
                            SECTION 2
  =========================================================-->    
    <?php echo $_section2;?>
 <!--========================================================
                            SECTION 3
  =========================================================-->
    <?php echo $_section3;?>
  <!--========================================================
                            SECTION 4
  =========================================================-->
    <?php echo $_section4;?>
  <!--========================================================
                            SECTION 5
  =========================================================-->
    <?php echo $_section5;?>
   
  <!--========================================================
                            FOOTER
  =========================================================-->
    <?php echo $_foot;?>
  </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo base_url();?>assets/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/tm-scripts.js"></script>     
    <!-- </script> -->


  </body>
</html>
