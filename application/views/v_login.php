<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Login
	Version: 1
	Author: Elos
================================================================================ -->

<head>
  <title>Login Page | Sistem Informasi Sleman Tangguh Bencana</title>

  <!-- Favicons-->
<link rel="icon" href="<?php echo base_url()?>assets/images/favicon/logo_.png" sizes="32x32">
  <!-- Favicons-->
  <link rel="apple-touch-icon-precomposed" href="images/favicon/logo_.png">
  <!-- For iPhone -->
  <meta name="msapplication-TileColor" content="#00bcd4">
  <meta name="msapplication-TileImage" content="images/favicon/logo_.png">
  <!-- For Windows Phone -->


  <!-- CORE CSS-->

<link href="<?php echo base_url()?>assets/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection">
<link href="<?php echo base_url()?>assets/css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <!-- Custome CSS-->
    <link href="<?php echo base_url()?>assets/css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="<?php echo base_url()?>assets/css/layouts/page-center.css" type="text/css" rel="stylesheet" media="screen,projection">

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="<?php echo base_url()?>assets/js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="<?php echo base_url()?>assets/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">

</head>

<body class= "" >

  <!-- Start Page Loading -->
  <div id="loader-wrapper">
      <div id="loader"></div>
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
  </div>
  <!-- End Page Loading -->
  
  <div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">

      <div id="padding" style="padding-top:12px;">
            <?php include("inc/info.php") ?>
      </div>
      <form class="login-form" id="formValidate" action="<?php echo base_url()?>login/proses_masuk" method="post">
        <div class="row">
          <div class="input-field col s12 center">
            <img src="<?php echo base_url()?>assets/img/simantab.png" alt="" class=" responsive-img ">
            <p class="center login-form-text">SIMANTAB PAGE LOGIN</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input id="username" name="email" type="email" required data-error=".errorTxt1">
			         <div class="errorTxt1"></div>
            <label for="username" class="center-align">Email</label>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
            <input id="password" type="password" name="password" required data-error=".errorTxt2">
            <div class="errorTxt2"></div>
            <label for="password">Password</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="remember-me" />
              <label for="remember-me">Remember me</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <button class="btn waves-effect waves-light col s12" type="submit">Login</button>
          </div>
        </div>

      </form>
    </div>
  </div>



  <!-- ================================================
    Scripts
    ================================================ -->

<!-- validationEngine -->
<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/validationEngine.jquery.css">
  <!-- jQuery Library -->
  <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-1.11.2.min.js"></script>
  <!--materialize js-->
  <script type="text/javascript" src="<?php echo base_url()?>assets/js/materialize.min.js"></script>
  <!--prism-->
  <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/prism/prism.js"></script>
  <!--scrollbar-->
  <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

      <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/custom-script.js"></script>

<!-- validationEngine -->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script>

    $("#formValidate").validate({
          errorElement : 'div',
          errorPlacement: function(error, element) {
            var placement = $(element).data('error');
            if (placement) {
              $(placement).append(error)
            } else {
              error.insertAfter(element);
            }
          }
       });


    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/user-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Dec 2016 01:03:49 GMT -->
</html>
