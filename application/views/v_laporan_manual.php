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

    td{padding: 2px 5px;}
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
                      <form class="col s12" id="formValidate" enctype="multipart/form-data" role="form" action="<?php echo base_url()?>main/proses_manual" method="post" >
                      <div class="card-panel" style="padding-top:1px;">
                        <h4 class="header2" style="margin-top:10px;">Bencana Header</h4>
                        <div class="row">
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
                              <div class="input-field col s6">
                                <select name="kelurahan" id="kelurahan" required class="select" data-error=".kelurahan">
                                  <option value="" disabled selected>Pilih Desa / Kelurahan</option>
                                  <?php foreach($kelurahan as $row){ ?>
                                  <option value="<?php echo $row->id_kel?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <div class="warna_error kelurahan"></div>
                                <!-- <label>Desa / Kelurahan</label> -->
                              </div>
                              <div class="input-field col m5 s12" style="padding-left:55px;">
                                <select name="dusun" id="dusun" class="select" required title="Harap Di Pilih" data-error=".errorTxt4">
                                  <option value="" disabled selected> -- Pilih Desa / Kelurahan Terlebih Dahulu -- </option>
                                </select>
                                <div class="errorTxt4"></div>
                                <!-- <label for="password">Kelurahan</label> -->
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col s6">
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
                              <div class="input-field col s3">
                                <input id="password6" type="text" name="rt" required data-error=".errorTxt4">
                                <div class="warna_error errorTxt4"></div>
                                <label for="password">RT</label>
                              </div>

                                <div class="input-field col s3">
                                  <input id="email5" type="text" name="rw" required data-error=".errorTxt5">
                                  <div class="warna_error errorTxt5"></div>
                                  <label for="email">RW</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col m6 s12">
                                  <?php $status = array("belum_di_tangani", "proses", "hold", "selesai");?>
                                  <select name="status" required class="select"  data-error=".errorTxt12">
                                    <option value="" disabled selected> -- Status Laporan --</option>
                                    <?php foreach($status as $row){ ?>
                                    <option value="<?php echo $row?>"><?php echo str_replace("_", " ", $row)?></option>
                                  <?php } ?>
                                  </select>
                                  <div class="warna_error errorTxt12"></div>
                                </div>
                                <div class="input-field col m3 s6">
                                  <!-- <i class="mdi-action-account-circle prefix"></i> -->
                                  <input name="dampak" type="text" required data-error=".errorTxt26">
                                  <label for="first_name">Rangkuman Dampak</label>
                                  <div class="warna_error errorTxt26"></div>
                                </div>
                                <div class="input-field col s6 m3">
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
                              <div class="input-field col s6">
                                <input id="latitude_e" type="text" name="latitude" required data-error=".errorTxt6">
                                <div class="warna_error errorTxt6"></div>
                                <label for="password" id="lbl_lat">Latitude</label>
                              </div>
                              <div class="input-field col s6">
                                <input id="longitude_e" type="text" name="longitude" required data-error=".errorTxt7">
                                <div class="warna_error errorTxt7"></div>
                                <label for="email" id="lbl_long">Longitude</label>
                              </div>
                            </div>

                            <div class="row" id="map_bencana" style="display:none;">
                              <div class="input-field col s6">
                                <label for="message">Lokasi Customer 1</label>
                                <div id="mapCanvas_e"></div>
                              </div>
                              <div class="input-field col s6">
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

                        </div>
                      </div>

                        <div class="card-panel" style="margin-bottom:30px;">
                        <h4 class="header" style="text-align : center; margin-top:15px; margin-bottom:0px;">Dampak Kerusakan</h4>
                        <div class="row" style="margin-top:15px;">
                          <div class="input-field col m4 s12" style="padding-left:55px; width:29%;">
                            <!-- <i class="mdi-action-account-circle prefix"></i> -->
                            <select id="kerusakan" class="select"  data-error=".errorTxt1">
                              <option value="" disabled selected> -- Pilih Dampak Kerusakan --</option>
                              <?php foreach($dampak as $row){ ?>
                              <option value="<?php echo $row->idtbldampak?>" data-nama="<?php echo $row->nama?>"><?php echo $row->nama. " (".$row->satuan.')'?></option>
                            <?php } ?>
                            </select>
                            <div class="errorTxt1 warna_error"></div>
                          </div>
                          <div class="input-field col m1">
                          </div>
                          <div class="input-field col m2 s12">
                            <i class="mdi-action-account-circle prefix"></i>
                            <input id="jumlah" type="number" data-error=".errorTxt2">
                            <div class="errorTxt2 warna_error"></div>
                            <label for="first_name">Jml Dampak</label>
                          </div>

                            <div class="input-field col m4 s12">
                              <button class="btn waves-effect waves-light light-green darken-4" type="button" id="add">Tambah ke table Dampak
                                <i class="mdi-editor-border-color right"></i>
                              </button>
                            </div>
                        </div>

                          <div class="row" style="margin:20px;">
                              <div class="row" style="margin-bottom:50px;">
                                <div class="col s12 m12 l12">
                                  <table id="example" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                                  <thead>
                                      <tr>
                                          <th style="width: 10%;">Nama Kerusakan</th>
                                          <th style="width: 7%;">Jumlah</th>
                                          <th style="width: 7%;">Aksi</th>
                                      </tr>
                                  </thead>
                                  <tbody id="table_body">

                                  </tbody>
                              </table>
                                </div>
                              </div>
                          </div>
                        </div>

                          <div class="card-panel" style="margin-bottom:30px;">

                            <h4 class="header" style="text-align : center; margin-top:15px; margin-bottom:0px;">Korban Jiwa (KK)</h4>
                            <div class="row" style="margin-top:15px;">
                              <div class="input-field col m8 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="rangkuman_korban" type="text" required data-error=".errorTxt16">
                                <label for="first_name">Keterangan Korban jiwa</label>
                                <div class="warna_error errorTxt16"></div>
                              </div>
                            </div>

                            <div class="row">
                              <div class="input-field col m4 s12" style="padding-left:55px; width:29%;">
                                <select id="kk" class="select"  data-error=".errorTxt31">
                                  <option value="" disabled selected> -- Pilih Kepala Keluarga --</option>
                                  <?php foreach($kk as $row){ ?>
                                  <option value="<?php echo $row->idtblkk?>" data-nama="<?php echo $row->nama?>"><?php echo $row->nama?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt31 warna_error"></div>
                              </div>

                              <div class="input-field col m1 s12"> </div>
                                <div class="input-field col m4 s12">
                                  <button class="btn waves-effect waves-light deep-purple" type="button" id="add_kk">Tambah ke table KK
                                    <i class="mdi-editor-border-color right"></i>
                                  </button>
                                </div>
                            </div>

                          <div class="row" style="margin:20px;">
                              <div class="row" style="margin-bottom:50px;">
                                <div class="col s12 m12 l12">
                                  <table id="example_kk" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                                  <thead>
                                      <tr>
                                          <th style="width: 10%;">Nama Kepala KK</th>
                                          <th style="width: 7%;">Aksi</th>
                                      </tr>
                                  </thead>
                                  <tbody id="table_body_kk">

                                  </tbody>
                              </table>
                                </div>
                              </div>
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
                        val( datepicker.get() + '   ' + timepicker.get() ).
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
              'allowedFileExtensions' : ['jpg', 'png','JPEG','gif'],
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

        $("#add").click(function(e){
          var kerusakan = $("#kerusakan").val();
          var nama_kerusakan = $("#kerusakan").find(":selected").data("nama");

          $("#kerusakan").select2("val", "");

          var jumlah = $("#jumlah").val();
          var id = $('#example tr:last').attr('id');
          if(isNaN(id)){
            id = 0;
          }
          var count = parseInt(id) + 1;

          if(kerusakan == '' || jumlah == ''){
            alert("data tidak boleh kosong");
          }else{
            $("#table_body").append("<tr id='"+count+"'><td>"+nama_kerusakan+"</td><td><input name='jumlah[]' type='number' style='height:2rem;' value='"+jumlah+"'/> <input hidden name='kerusakan[]' value='"+kerusakan+"'/></td><td><button class='btn waves-effect red darken-4 hapus' type='button' data-class='"+count+"' >Hapus</button> </td></tr>");
            $("#kerusakan").val("");
            $("#jumlah").val("");
          }

        });

        $("#add_kk").click(function(e){
          var kk = $("#kk").val();
          var nama_kk = $("#kk").find(":selected").data("nama");

          $("#kerusakan").select2("val", "");

          var id = $('#example_kk tr:last').attr('id');
          if(isNaN(id)){
            id = 0;
          }
          var count = parseInt(id) + 1;

          if(kk == ''){
            alert("data tidak boleh kosong");
          }else{
            $("#table_body_kk").append("<tr id='kk"+count+"'><td>"+nama_kk+" <input hidden name='kk[]' value='"+kk+"'/></td><td><button class='btn waves-effect red darken-4 hapus_kk' type='button' data-class='"+count+"' >Hapus</button> </td></tr>");
          }

        });

        $(document).on('click', '.hapus', function () {
           var id_class = $(this).attr('data-class');
           $('#'+id_class).remove();
       });

       $(document).on('click', '.hapus_kk', function () {
          var id_class = $(this).attr('data-class');
          $('#kk'+id_class).remove();
      });

       $("#proses").click(function(a){
         a.preventDefault();
         var tbody = $("#example tbody");
         var tbody_kk = $("#example_kk tbody");

         if(tbody.children().length == 0){
           alert("tidak ada data kejadian");
         }else{
           // console.log($("#table_body").html());
           $("#formValidate").submit();
         }
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
