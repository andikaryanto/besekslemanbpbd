<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Main design
	Version: 1
	Author: Elos
================================================================================ -->


<head>
    <?php include('inc/css.php') ?>
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
                      <div class="card-panel">
                        <h4 class="header2">Ubah Master ews</h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_ews/proses_edit" method="post">
                            <div class="row">
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="nama" value="<?php echo $data->nama?>" type="text" data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Nama ews</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="alamat" type="text" data-error=".errorTxt2" value="<?php echo $data->alamat?>">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Alamat</label>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m6 s12">
                                  <i class="mdi-action-account-circle prefix"></i>
                                  <input name="tlpn" type="text" data-error=".errorTxt4" value="<?php echo $data->tlpn?>">
                                  <div class="errorTxt4"></div>
                                  <label for="first_name">Telephone</label>
                                </div>

                              <div class="input-field col m6 s12">
                                <select name="kelurahan" id="kelurahan">
                                  <option value="" disabled selected>Pilih Desa / Kelurahan</option>
                                  <?php foreach($kelurahan as $row){ ?>
                                  <option value="<?php echo $row->id_kel?>"<?php if($data->id_kel == $row->id_kel) echo 'selected' ?>><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="lat" name="latitude" type="text" data-error=".errorTxt6" value="<?php echo $data->latitude?>">
                                <div class="errorTxt6"></div>
                                <label for="first_name" id="lbl_lat">Latitude</label>
                              </div>
                              <div class="input-field col m3 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="long" name="longitude" type="text" data-error=".errorTxt7" value="<?php echo $data->longitude?>">
                                <div class="errorTxt7"></div>
                                <label for="first_name" id="lbl_long">longitude</label>
                              </div>
                              <div class="input-field col m3 s12">
                                <a class="left btn waves-effect waves-light blue" data-latitude="<?php echo $data->latitude?>" data-longitude="<?php echo $data->longitude?>" id="map">Gunakan Map <i class="mdi-action-room right"></i></a>
                              </div>
                            </div>

                            <div class="row">
                              <div class="input-field col s12">
                                <i class="mdi-action-question-answer prefix"></i>
                                <textarea id="message3" name="keterangan" class="materialize-textarea" data-error=".errorTxt8"><?php echo $data->deskripsi?></textarea>
                                <div class="errorTxt8"></div>
                                <label for="message">Keterangan</label>
                              </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s2 m1 l1">
                                  <i class="mdi-action-question-answer prefix"></i>
                                  <label for="password" id="lbl_lat" class=""><b>Foto </b></label>
                                </div>
                                <div class="input-field col s10 m5 l5" >
                                  <input id="file-1" class="" type="file" name="foto" data-error=".errorTxt9">
                                  <div class="errorTxt9"></div>
                                </div>
                            </div>
                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
                                    <i class="mdi-content-send right"></i>
                                  </button>
                                </div>
                              </div>

                              <input name="id" value="<?php echo $data->idtblews?>" type="hidden">
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

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

    <!-- modal map-->
    <div id="modal_map" class="modal modal-fixed-footer">
      <div class="modal-content">
        <div id="mapCanvas_e">

        </div>
      </div>
      <div class="modal-footer">
        <a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Tutup</a>
      </div>
    </div>

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START FOOTER -->
    <?php include("inc/footer.php") ?>
    <!-- END FOOTER -->


    <!-- ================================================
    Scripts
    ================================================ -->
    <script src="https://maps.googleapis.com/maps/api/js?&libraries=places&key=AIzaSyBFA8EZF7jraTiiwDRyfRTiMnxD67-g0cE"></script>
    <?php include("inc/js.php") ?>
    <script>
    $("#formValidate").validate({
      rules: {
          nama: {
              required: true,
              minlength: 5
          },
          keterangan: {
              required: true,
          },
        },
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

       $(document).on('click', '.kv-file-remove', function (e) {
          $(".file-preview,.file-caption").fadeOut(700);
        });
        $(document).on('click', '.btn-file', function (e) {
          $(".file-preview,.file-caption").fadeIn(4000);
         });

       $("#file-1").fileinput({
            'allowedFileExtensions' : ['jpg', 'jpeg', 'png'],
            maxFileSize: 2000,
            maxFileCount: 1,
            showUpload: false,
            <?php if($data->picture_name != ''){?> //jika dia ada icon
            initialPreview: [
                '<img src="<?php echo base_url()?>uploads/ews/<?php echo $data->picture_name?>" class="file-preview-image">',
            ],
            initialPreviewConfig: [
                {
                  caption: "<?php echo $data->picture_name?>",
                  width: "120px",
                  url: '<?php echo base_url()?>ms_ews/delete_pict/<?php echo md5($data->idtblews).'/'.$data->picture_name?>',
                  key : <?php echo $data->idtblews?>,
                  showDelete: false,
                },
            ],

            // deleteUrl: "/site/file-delete",
            overwriteInitial: false,
            initialCaption: "<?php echo $data->picture_name.' ( Harap menekan icon `X` untuk menghapus gambar )'?>"
            <?php } ?>
        });

        $("#map").click(function(e){
          var lat = $("#lat").val();
          var lng = $("#long").val();
          elos_ganteng(lat, lng);
          $('#modal_map').openModal();
        });
    </script>

    <script>

      var map;
      function elos_ganteng(langitude = '', longitude = '') {
        $("#lbl_lat,#lbl_long").addClass("active");

        if(langitude == ''){
          langitude = '-7.724537'; longitude = '110.3499186';
        }
        document.getElementById("lat").value = langitude;
        document.getElementById("long").value = longitude;

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
          google.maps.event.addListener(marker, 'dragend', function (event) {


          document.getElementById("lat").value = event.latLng.lat();
          document.getElementById("long").value = event.latLng.lng();

        });
      }
      // google.maps.event.addDomListener(window, "load", initialize());
    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
