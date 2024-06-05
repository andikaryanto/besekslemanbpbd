<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Main design
	Version: 1
	Author: Elos
================================================================================ -->


<head>
    <?php include('inc/css.php') ?>
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/fileinput.min.css" type="text/css"/>
    <link rel="stylesheet" href="<?php echo base_url();?>assets/select2/select2.min.css" type="text/css"/>
    <style>

    .warna_error {color:red;}
    </style>
</head>

<body id="layouts-horizontal">
    <!-- Start Page Loading -->
    <?php include("inc/header.php") ?>
    <!-- END HEADER -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START MAIN -->
    <div id="main">
        <!-- START WRAPPER -->
        <div class="wrapper">
            <!-- START LEFT SIDEBAR NAV-->
            <?php include("inc/sidebar.php") ?>
            <!-- END LEFT SIDEBAR NAV-->
            <!-- START CONTENT -->
            <section id="content">
              <!--chart dashboard start-->
              <div id="padding" style="padding-top:12px;">
                <?php include("inc/info.php") ?>
              </div>
              <!--chart dashboard end-->
                <!--start container-->
                <div class="container">
                  <div class="row">
                    <div class="col s12 m12 l12">
                      <div class="card-panel" style="padding-top:1px;">
                        <h4 class="header2" style="margin-top:10px;">Pelaporan Bencana </h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data" role="form" action="<?php echo base_url()?>main/proses_tambah" method="post" >
                            <div class="row">
                              <div class="input-field col s12 m4">
                                <input id="first_name" name='nir' type="text">
                                <label for="first_name">No NIR</label>
                              </div>
                              <div class="input-field col s12 m5">
                                <input id="email5" type="text" name="nama" required data-error=".errorTxt1">
                                <div class="warna_error errorTxt1"></div>
                                <label for="email">Nama Pelapor</label>
                              </div>
                              <div class="input-field col s6 m3">
                                <input id="notelp" name="notelp" type="text">
                                <label for="notelp">No Telephone/ HP </label>
                              </div>

                            </div>
                            <div class="row">
                              <div class="input-field col s12 m6">
                                <select name="kelurahan" id="kelurahan" required class="select" data-error=".kelurahan">
                                  <option value="" disabled selected>Pilih Desa / Kelurahan</option>
                                  <?php foreach($kelurahan as $row){ ?>
                                  <option value="<?php echo $row->id_kel?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <div class="warna_error kelurahan"></div>
                                <!-- <label>Desa / Kelurahan</label> -->
                              </div>
                              <div class="input-field col m5 s12" style="padding-left:20px;">
                                <select name="dusun" id="dusun" class="select" required title="Harap Di Pilih" data-error=".errorTxt4">
                                  <option value="" disabled selected> -- Pilih Desa / Kelurahan Terlebih Dahulu -- </option>
                                </select>
                                <div class="errorTxt4"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col s12 m6">
                                <select name="bencana" class="select" required>
                                  <option value="" disabled selected>Pilih Jenis Bencana</option>
                                  <?php foreach($bencana as $row){ ?>
                                  <option value="<?php echo $row->id?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <!-- <label for="email">Bencana</label> -->
                              </div>
                              <!-- <div class="row">

                              </div> -->
                              <div class="input-field col s6 m3">
                                <input id="password6" type="text" name="rt" required data-error=".errorTxt4">
                                <div class="warna_error errorTxt4"></div>
                                <label for="password">RT</label>
                              </div>

                                <div class="input-field col s6 m3">
                                  <input id="email5" type="text" name="rw" required data-error=".errorTxt5">
                                  <div class="warna_error errorTxt5"></div>
                                  <label for="email">RW</label>
                                </div>
                            </div>
                            <div class="row">
                             <div class="input-field col s12 m6">
                                <input name="dampak" type="text" required data-error=".errorTxt4">
                                <div class="warna_error errorTxt4"></div>
                                <label for="dampak">Rangkuman Dampak/ Kronologi Kejadian</label>
                              </div>

                              <!-- <div class="input-field col s3 m3 ">
                                <input name="tgl_kejadian" type="date" class="datepicker" required data-error=".errorTxt1">
                              </div> -->

                                <div class="input-field col s6 m6">
                                  <input type="text" id="datetime" name="tgl_kejadian" required data-error=".errorTxt11"/>
                                  <div class="warna_error errorTxt11"></div>
                                  <label for="first_name">Tanggal Kejadian</label>
                                  <div id="hidden" style="display:none;">
                                      <input type="text" id="date" style="display:none;" name="date"/>
                                      <input type="text" id="time" style="display:none;" name="time"/>
                                  </div>
                                  <div id="outlet"></div>
                                </div>
                            </div>

                            <div class="row">
                              <div class="input-field col s12 m6">
                                <input id="latitude_e" type="text" name="latitude" required data-error=".errorTxt6">
                                <div class="warna_error errorTxt6"></div>
                                <label for="password" id="lbl_lat">Latitude</label>
                              </div>
                              <div class="input-field col s12 m6">
                                <input id="longitude_e" type="text" name="longitude" required data-error=".errorTxt7">
                                <div class="warna_error errorTxt7"></div>
                                <label for="email" id="lbl_long">Longitude</label>
                              </div>
                            </div>

                            <div class="row" id="map_bencana" style="display:none;">
                              <div class="input-field col s12 m6">
                                <label for="message">Lokasi Customer 1</label>
                                <div id="mapCanvas_e"></div>
                              </div>
                              <div class="input-field col s12 m6">
                                <label for="message">Lokasi Customer 2</label>
                                <div id="mapCanvas_s"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col s2 m1 l1">
                                <label for="password" id="lbl_lat" class=""><b>Foto</b></label>
                              </div>
                              <div class="input-field col s10 m5 l5">
                                <input id="file-0" class="" type="file" accept="picture/*" data-show-upload="false" data-show-remove="false" multiple name="foto[]">
                              </div>
                              <div class="input-field col s2 m1 l1">
                                <label for="password" id="lbl_long" class=""><b>Video</b></label>
                              </div>
                              <div class="input-field col s10 m5 l5">
                                <input id="file-1" class="" type="file" accept="video/*" data-show-upload="false" data-show-remove="false" name="video">
                              </div>
                            </div>
                            <div class="row" style="margin-top:30px;">
                              <hr />
                            </div>
                            <div class="row">
                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit">Proses
                                    <i class="mdi-content-send right"></i>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                    <!--card widgets end-->


                </div>
                <!--end container-->
            </section>
            <!-- END CONTENT -->

            <!-- //////////////////////////////////////////////////////////////////////////// -->

            <!-- START RIGHT SIDEBAR NAV-->
            <?php include("inc/right_slidebar.php") ?>
            <!-- LEFT RIGHT SIDEBAR NAV-->

        </div>
        <!-- END WRAPPER -->

    </div>
    <!-- END MAIN -->



    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START FOOTER -->
    <?php include("inc/footer.php") ?>
    <!-- END FOOTER -->
    <style>
    #hidden {
      position: absolute;
      top: 0;
      left: 0;
      width: 1px;
      height: 1px;
      overflow: hidden;
    }
    </style>

    <!-- ================================================
    Scripts
    ================================================ -->

    <?php include("inc/js.php") ?>
    <script src="<?php echo base_url();?>assets/js/fileinput.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<?php echo base_url();?>assets/select2/select2.full.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://maps.googleapis.com/maps/api/js?&libraries=places&key=AIzaSyBFA8EZF7jraTiiwDRyfRTiMnxD67-g0cE"></script>
    <script src="<?php echo base_url();?>assets/js/picker.time.js"></script>

    <script>
    var datepicker = $('#date').pickadate({
        container: '#outlet',
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 100,
        max: new Date(),
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        format: 'yyyy-mm-dd',
        closeOnSelect: true,
        onSet: function(item) {
            if ( 'select' in item ) setTimeout( timepicker.open, 0 )
        }
    }).pickadate('picker')

    var timepicker = $('#time').pickatime({
            container: '#outlet',
            format: 'H:i',
            onRender: function() {
                $('<button>back to date</button>').
                    on('click', function() {
                        timepicker.close()
                        datepicker.open()
                    }).prependTo( this.$root.find('.picker__box') )
            },
            onSet: function(item) {
                if ( 'select' in item ) setTimeout( function() {
                    $datetime.
                        off('focus').
                        val( datepicker.get() + '  ' + timepicker.get() ).
                        focus().
                        on('focus', datepicker.open)
                }, 0 )
            }
        }).pickatime('picker')

    var $datetime = $('#datetime').
        on('focus', datepicker.open).
        on('click', function(event) { event.stopPropagation(); datepicker.open() })

    </script>
    <script>
      $(document).ready(function() {
        $.validator.setDefaults({
               ignore: []
        });

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
          $("#file-0").fileinput({
              'allowedFileExtensions' : ['jpg', 'png','gif','jpeg'],
              maxFileSize: 2000,
              maxFileCount: 5,
              showUpload: false,
          });

          $("#file-1").fileinput({
              'allowedFileExtensions' : ['mp4'],
              maxFileCount: 1,
              showUpload: false,
              previewClass: "bg-warning"
          });

          $("#kelurahan").change(function(e){
            $.ajax({
               type: "POST",
               url: "<?php echo base_url();?>main/get_desa",
               data: "idkel="+$(this).val(),
               success: function(data){
                   $('#dusun').html("<option value=''>-- Pilih dusun --</option>");
                   var opt = data;
                   $('#dusun').append(opt);
               }
           });
              var text = $("#kelurahan option:selected").text();
              showCoordinate(text);
          });
          $('select').material_select('destroy');
          $(".select").select2();
        });
    </script>
    <script>
    function showCoordinate(desa){
      var kel = desa+" sleman";
      var geocoder;
      geocoder = new google.maps.Geocoder();
      geocoder.geocode( { 'address': kel}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          var position=results[0].geometry.location;
          document.getElementById("latitude_e").value=position.lat();
          document.getElementById("longitude_e").value=position.lng();
          elos_ganteng(position.lat(), position.lng());
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });;
    }
    </script>
    <script>

      var map;
      function elos_ganteng(langitude, longitude) {
        $("#map_bencana").show();
        $("#lbl_lat,#lbl_long").addClass("active");
        $("#show_map").attr("disabled","true");

        if(langitude == ''){
          langitude = '-7.724537'; longitude = '110.3499186';
        }
        document.getElementById("latitude_e").value = langitude;
        document.getElementById("longitude_e").value = longitude;

          var myLatlng = new google.maps.LatLng(langitude, longitude);

          var myOptions = {
              zoom: 12,
              center: myLatlng,
              mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          map = new google.maps.Map(document.getElementById("mapCanvas_e"), myOptions);

          var marker = new google.maps.Marker({
              draggable: true,
              position: myLatlng,
              map: map,
              title: "Your location"
          });

          var panorama = new google.maps.StreetViewPanorama(
              document.getElementById('mapCanvas_s'), {
                position: myLatlng,
                pov: {
                  heading: 34,
                  pitch: 10
                }
              });
          map.setStreetView(panorama);


          google.maps.event.addListener(marker, 'dragend', function (event) {


          document.getElementById("latitude_e").value = event.latLng.lat();
          document.getElementById("longitude_e").value = event.latLng.lng();

        });
      }
      // google.maps.event.addDomListener(window, "load", initialize());
    </script>
</body>

<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
