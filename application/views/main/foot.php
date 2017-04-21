<footer class="top-border">

    <div class="map">
      
      <div id="map" class="map_model" data-zoom="11"></div> 
 
        <script type="text/javascript">
              
//              menentukan koordinat titik tengah peta
              var myLatlng = new google.maps.LatLng(-6.975353,107.629601);
 
//              pengaturan zoom dan titik tengah peta
              var myOptions = {
                  zoom: 13,
                  center: myLatlng
              };
              
//              menampilkan output pada element
              var map = new google.maps.Map(document.getElementById("map"), myOptions);
              
//              menambahkan marker
              var marker = new google.maps.Marker({
                   position: myLatlng,
                   map: map,
                   title:"Monas"
              });
        </script> 
    </div>
<section class="well well2 wow fadeIn  bg1" data-wow-duration='3s' style='background-color:#333;'>
        <div class="row wow fadeIn" data-wow-duration='2s' style='margin-bottom: 0;'>
            <div class="col-md-4 col-sm-12 col-xs-12" style='margin-bottom: 0;'>
              <div class="thumbnail thumb-shadow">
                <img src="<?php echo $assets;?>images/fav.png" alt="">
                <div class="caption bg3">
                  <h3>
                    Digital Art Project
                  </h3>
                  <div class="wrap">
                    <p>
                      Jl. Sukabirus Universitas Telkom, Bojongsoang, Kab. Bandung
                    </p>
                    <p>
                        Email : client.dartpro@gmail.com
                    </p>
                  </div>  
                </div>
              </div>              
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
              <div class="thumbnail thumb-shadow">
                <img src="<?php echo base_url();?>assets/images/fav.png" alt="">
                <div class="caption bg-primary">
                  <h3>
                    Relation
                  </h3>
                  <div class="wrap">
                    <p>
                      Taretan Telkom University<br/>
                      PSI Telkom University
                    </p>
                  </div>  
                </div>
              </div>              
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
              <div class="thumbnail thumb-shadow">
                <img src="<?php echo base_url();?>assets/images/fav.png" alt="">
                <div class="caption bg2">
                  <h3>
                    OUR Team
                  </h3>
                  <div class="wrap">
                    <p>
                      Digital Art Innovation <br/>
                      Digital Art Development <br/>
                      Digital Art Creative
                    </p>
                  </div>  
                </div>
              </div>              
            </div>
          </div>
      </section>
    <section class="well1">
      <div class="container"> 
            <p class="rights">
              Engineer Incubator  &#169; <span id="copyright-year"></span>
              Digital Art Project | <a href="index-5.html">Privacy Policy</a>
              Design Support By <a rel="nofollow" href="http://www.templatemonster.com/category/business-web-templates/" target="_blank">TemplateMonster.com</a>
            </p>          
      </div> 
    </section>    
  </footer>