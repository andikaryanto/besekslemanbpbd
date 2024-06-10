<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Main design
	Version: 1
	Author: Elos
================================================================================ -->


<head>
  <?php include('inc/css.php') ?>
  <style>
    .gm-style-iw {
      width: 450px !important;
      top: 15px !important;
      left: 0px !important;
      background-color: #fff;
      box-shadow: 0 1px 6px rgba(178, 178, 178, 0.6);
      border: 1px solid rgba(72, 181, 233, 0.6);
      border-radius: 2px 2px 10px 10px;
    }

    #iw-container {
      margin-bottom: 10px;
    }

    #iw-container .iw-title {
      font-family: 'Open Sans Condensed', sans-serif;
      font-size: 22px;
      font-weight: 400;
      padding: 10px;
      background-color: #48b5e9;
      color: white;
      margin: 0;
      border-radius: 2px 2px 0 0;
    }

    #iw-container .iw-content {
      font-size: 13px;
      line-height: 18px;
      font-weight: 400;
      margin-right: 1px;
      padding: 15px 5px 20px 15px;
      max-height: 140px;
      overflow-y: auto;
      overflow-x: hidden;
    }

    .iw-content img {
      float: right;
      margin: 0 5px 5px 10px;
    }

    .iw-subTitle {
      font-size: 16px;
      font-weight: 700;
      padding: 5px 0;
    }

    .iw-bottom-gradient {
      position: absolute;
      width: 326px;
      height: 25px;
      bottom: 10px;
      right: 18px;
      background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 1) 100%);
      background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 1) 100%);
      background: -moz-linear-gradient(top, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 1) 100%);
      background: -ms-linear-gradient(top, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 1) 100%);
    }

    #map-canvas {
      margin: 0;
      padding: 0;
      height: 600px;
      max-width: none;
    }

    #map-canvas img {
      max-width: none !important;
    }
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
            <div class="row">
              <div class="col s12 m8 l8">
                <div class="card-panel" style="padding-top:1px;">
                  <h4 class="header2" style="text-align:center">Laporan Peta Kejadian
                    <?php if ($range != ' - ') {
                      echo $range;
                    } else {
                      echo "Hari Ini";
                    } ?>
                  </h4>
                  <div id="map_canvas" style="width:100%; height:500px;"></div>
                </div>
              </div>

              <div class="col s12 m4 l4">
                
                <div class="card-panel" style="padding-top:1px;">
                  <h4 class="header2" style="text-align:center">Status Gunung Merapi</h4>
                  <?php
                  $color = '';
                  if (strtolower($jarak->statusaktivitas) == 'normal') {
                    $color = 'green';
                  } else if (strtolower($jarak->statusaktivitas) == 'waspada') {
                    $color = 'yellow';
                  } else if (strtolower($jarak->statusaktivitas) == 'siaga') {
                    $color = 'orange';
                  } else if (strtolower($jarak->statusaktivitas) == 'awas') {
                    $color = 'red';
                  }
                  ?>
                  <div class='<?= $color ?> ' style="padding: 5px 2px; margin:5px 0px;">
                    <h4 class="header2" style="text-align:center"><?= $jarak->statusaktivitas ?></h4>
                  </div>
                  <div>
                    <div class='header1' style="padding: 5px 2px; margin:5px 0px;">
                      Rekomendasi:
                    </div>
                    <p cas style="padding: 5px 2px; margin:5px 0px;">
                      <?= $jarak->Rekomendasi ?>
                    </p>
                  </div>
                </div>
                <div class="card-panel" style="padding-top:1px;">
                  <h4 class="header2" style="text-align:center">Informasi dan peringatan dini</h4>
                  <div style="padding: 5px 2px; margin:5px 0px;">
                    <?= $peringatandini->keterangan ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col s12 m12 l12">
            <form class="col s12" id="formValidate" action="<?php echo base_url() ?>main" method="get">
              <div class="card-panel" style="padding-top:1px;">
                <h4 class="header2">Filter Kejadian</h4>
                <div class="row" id="row_tanggal">
                  <div class="input-field col m4 s12">
                    <i class="mdi-action-account-circle prefix"></i>
                    <input name="dari" type="text" class="datepicker" required data-error=".errorTxt11">
                    <div class="warna_error errorTxt11"></div>
                    <label for="first_name">Dari</label>
                  </div>
                  <div class="input-field col m4 s12">
                    <i class="mdi-action-account-circle prefix"></i>
                    <input name="hingga" type="text" class="datepicker" required data-error=".errorTxt112">
                    <div class="warna_error errorTxt112"></div>
                    <label for="first_name">Hingga</label>
                  </div>
                  <div class="input-field col m4 s12">
                    <button class="btn cyan waves-effect waves-light left" type="submit">Proses
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
      errorElement: 'div',
      errorPlacement: function(error, element) {
        var placement = $(element).data('error');
        if (placement) {
          $(placement).append(error)
        } else {
          error.insertAfter(element);
        }
      }
    });

    

    $('.datepicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 100,
      max: new Date(),
      today: 'Today',
      clear: 'Clear',
      close: 'Ok',
      format: 'dd-mm-yyyy',
      closeOnSelect: true // Close upon selecting a date,
    });

    $('.datepicker').on('mousedown', function preventClosing(event) {
  event.preventDefault();
});

    $("#map").click(function(e) {
      var lat = $("#lat").val();
      var lng = $("#long").val();
      elos_ganteng(lat, lng);
      $('#modal_map').openModal();
    });
  </script>
  <script type="text/javascript">
    function initialize() {
      //add map, the type of map
      var mapOptions = {
        zoom: 11,
        animation: google.maps.Animation.DROP,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: new google.maps.LatLng(-7.6760857, 110.4224622)
      };
      var mapElement = document.getElementById('map_canvas');
      var map = new google.maps.Map(mapElement, mapOptions);


      var locations = [
        <?php
        foreach ($data as $row) { ?>['<div id="iw-container">' +
            '<div class="iw-title">' + '<?php echo strtoupper($row->nama_bencana) ?>' + ' DI DUSUN ' + '<?php echo strtoupper($row->nama_dusun) ?>' + ',RT ' + '<?php echo strtoupper($row->rt) ?>' + ', RW ' + '<?php echo strtoupper($row->rw) ?>' + ',DESA ' + '<?php echo strtoupper($row->nama_kelurahan) ?>' + '</div>' +
            '<div class="iw-title">' + ' ID KEJADIAN ' + '<?php echo strtoupper($row->idtbllaporan) ?>' + '</div>' +
            '<div class="iw-content">' +

            '<div class="iw-subTitle">Tanggal & Waktu Kejadian</div>' +
            '<p><?php echo strtoupper($row->tgl_kejadian) ?></p>' +

            '<div class="iw-subTitle">Status Penanganan</div>' +
            '<p><?php echo strtoupper($row->status) ?></p>' +


            '<div class="iw-subTitle">Rangkuman Dampak & korban</div>' +

            '<p><?php echo strtoupper($row->dampak) ?>. <?php echo strtoupper($row->rangkuman_korban) ?></p>' +
            '<div class="iw-subTitle">Gambar & Video</div>' +
            <?php $data_detail = $this->db->get_where("tbllaporan_galery", array("idtbllaporan" => $row->idtbllaporan))->result(); ?> <?php foreach ($data_detail as $rows) { ?> <?php if ($rows->type == '1') { ?> '<img src="<?php echo base_url() . 'uploads/kejadian/' . $rows->picture_name ?>" data-nama="<?php echo strtoupper($row->nama_bencana) ?>' + ' DI DUSUN ' + '<?php echo strtoupper($row->nama_dusun) ?>" class="img" height="120" width="100%"><br />' +
              <?php } else { ?> '<video width="100%" height="100%" src="<?php echo base_url() . 'uploads/kejadian/' . $rows->picture_name ?>" class="video" data-nama="<?php echo strtoupper($row->nama_bencana) ?>' + ' DI DUSUN ' + '<?php echo strtoupper($row->nama_dusun) ?>" controls><source src="<?php echo base_url() . 'uploads/kejadian/' . $row->idtbllaporan . '/' . $rows->picture_name ?>" type="video/mp4">Your browser does not support HTML5 video </video>' +
              <?php } ?> <?php } ?> '</div>' +
            '<div class="iw-bottom-gradient"></div>' +
            '</div>',
            <?php echo $row->latitude ?>, <?php echo $row->longitude ?>, '<?php echo base_url() . 'uploads/bencana/' . $row->icon ?>'],
        <?php } ?>
      ];
      //declare marker call it 'i'
      var marker, i;
      //declare infowindow
      var infowindow = new google.maps.InfoWindow();
      //add marker to each locations
      for (i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
          map: map,
          icon: locations[i][3]
        });
        //click function to marker, pops up infowindow
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
            infowindow.setContent(locations[i][0]);
            infowindow.open(map, marker);
          }
        })(marker, i));
      }

      google.maps.event.addListener(infowindow, 'domready', function() {

        // Reference to the DIV that wraps the bottom of infowindow
        var iwOuter = $('.gm-style-iw');

        /* Since this div is in a position prior to .gm-div style-iw.
         * We use jQuery and create a iwBackground variable,
         * and took advantage of the existing reference .gm-style-iw for the previous div with .prev().
         */
        var iwBackground = iwOuter.prev();

        // Removes background shadow DIV
        iwBackground.children(':nth-child(2)').css({
          'display': 'none'
        });

        // Removes white background DIV
        iwBackground.children(':nth-child(4)').css({
          'display': 'none'
        });

        if ($(window).width() <= 500) {
          iwOuter.parent().parent().css({
            left: '106px'
          });
        } else {
          // Moves the infowindow 163px to the right.
          iwOuter.parent().parent().css({
            left: '163px'
          });
        }
        // Moves the shadow of the arrow 76px to the left margin.
        iwBackground.children(':nth-child(1)').attr('style', function(i, s) {
          return s + 'left: 76px !important;'
        });

        // Moves the arrow 76px to the left margin.
        iwBackground.children(':nth-child(3)').attr('style', function(i, s) {
          return s + 'left: 76px !important;'
        });

        // Changes the desired tail shadow color.
        iwBackground.children(':nth-child(3)').find('div').children().css({
          'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px',
          'z-index': '1'
        });

        // Reference to the div that groups the close button elements.
        var iwCloseBtn = iwOuter.next();

        // Apply the desired effect to the close button
        iwCloseBtn.css({
          opacity: '1',
          right: '38px',
          top: '3px',
          border: '7px solid #48b5e9',
          'border-radius': '13px',
          'box-shadow': '0 0 5px #3990B9'
        });

        // If the content of infowindow not exceed the set maximum height, then the gradient is removed.
        if ($('.iw-content').height() < 140) {
          $('.iw-bottom-gradient').css({
            display: 'none'
          });
        }

        // The API automatically applies 0.7 opacity to the button after the mouseout event. This function reverses this event to the desired value.
        iwCloseBtn.mouseout(function() {
          $(this).css({
            opacity: '1'
          });
        });
      });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
  </script>

  <script>
    $(document).on('click', '.img,.video', function(e) {
      var foto = $(this).attr('src');
      var nama = $(this).attr('data-nama');
      var myClass = $(this).attr("class");
      // console.log(link+"_"+nama);
      if (myClass == 'img') {
        $("#title_foto").html("Foto Kejadian " + nama);
        $("#data_icon").attr("src", foto);
        $('#modal5').openModal();
      } else {
        // $("#title_video").html("Foto Kejadian "+nama);
        // $("#data_video").attr("src", foto);
        // var video = $('#vid').get()[0];
        // video.addEventListener('loadeddata', function() {
        //     video.play();
        // });
        // $('#modal_video').openModal();
      }
    });
  </script>

  <div id="modal5" class="modal bottom-sheet" style="max-height:75%">
    <div class="modal-content">
      <div class="row">
        <div class="col s12 m8 l8">
          <h4 id="title_foto">Modal Header </h4>
        </div>
        <div class="col s12 m4 l4">
          <a class="right btn waves-effect waves-light blue modal-close" type="submit" style="margin-left:5px;">Tutup <i class="mdi-content-clear right"></i></a>
        </div>
      </div>
      <ul class="collection">
        <li class="collection-item avatar" style="text-align:center">
          <img class="activator" id="data_icon" src="images/office.jpg" style="max-height:500px;" alt="Icon">
        </li>
      </ul>
    </div>
  </div>
  <!-- <div id="modal_video" class="modal bottom-sheet" style="max-height:75%">
    <div class="modal-content">
      <div class="row">
        <div class="col s12 m8 l8">
          <h4 id="title_video">Modal Header </h4>
        </div>
        <div class="col s12 m4 l4">
          <a class="right btn waves-effect waves-light blue modal-close" type="submit" style="margin-left:5px;">Tutup <i class="mdi-content-clear right"></i></a>
        </div>
      </div>
      <ul class="collection">
        <li class="collection-item avatar" style="text-align:center">
          <video width="100%" height="100%" id="vid" controls>
            <source id="data_video" src="" type="video/mp4">
            Your browser does not support HTML5 video.
          </video>
        </li>
      </ul>
    </div>
  </div> -->
</BODY>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->

</html>