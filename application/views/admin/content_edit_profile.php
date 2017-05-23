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
                <h3>Edit Profile</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>e-Government <small>edit profile</small> | <small>last update : <?=$last_update;?></small></h2>
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
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" action="<?=base_url()?>/index.php/action/edit_profile">

<!--
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nama_lengkap">Nama Lengkap <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="nama_lengkap" required="required" name="nama_lengkap" class="form-control col-md-7 col-xs-12" value="<?=$nama_lengkap;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="email" class="control-label col-md-3 col-sm-3 col-xs-12">Email <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="email" class="form-control col-md-7 col-xs-12" required="required" type="text" name="email" value="<?=$email;?>">
                        </div>
                      </div>
-->
                        
                      <div class="form-group">
                        <label for="username" class="control-label col-md-3 col-sm-3 col-xs-12">Username <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="username" class="form-control col-md-7 col-xs-12" required="required" type="text" name="username" value="<?=$username;?>">
                            <input id="username-old" class="form-control col-md-7 col-xs-12" required="required" type="hidden" name="username-old" value="<?=$username;?>">
                            <input id="level" class="form-control col-md-7 col-xs-12" required="required" type="hidden" name="level" value="<?=$active;?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="password" class="control-label col-md-3 col-sm-3 col-xs-12">Password <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="password" class="form-control col-md-7 col-xs-12" required="required" type="text" name="password" >
                        </div>
                      </div>
                      
<!--
                       <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Foto <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="custom-input">
                              <span></span>
                            <span>
                                <input type="file" accept="image/*" class="form-control" required="required"><button type="button" class="btn btn-primary">Browse File</button>
                            </span>
                          </div>
                        </div>
                      </div> 
-->                     
                        
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-primary">Cancel</button>
                          <button type="submit" class="btn btn-success">Add</button>
                        </div>
                      </div>
                        <small>* change username and password</small>

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
