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
    background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
    background: -webkit-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
    background: -moz-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
    background: -ms-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
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
                    <div class="col s12 m12 l12">
                      <div class="card-panel" style="padding-top:1px;">
                        <h4 class="header2">Lokasi Koordinat Team Dan Bencana Saat ini</h4>
                           <div id="map_canvas" style="width:100%; height:600px;"></div>
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


    <!-- START FOOTER -->
    <?php include("inc/footer.php") ?>
    <!-- END FOOTER -->


    <!-- ================================================
    Scripts
    ================================================ -->
    <script src="https://maps.googleapis.com/maps/api/js?&libraries=places&key=AIzaSyBFA8EZF7jraTiiwDRyfRTiMnxD67-g0cE"></script>
     <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"> </script>
    <?php include("inc/js.php") ?>
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

        $("#map").click(function(e){
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
               center: new google.maps.LatLng(-7.6760857,110.4224622)
           };
           var mapElement = document.getElementById('map_canvas');
           var map = new google.maps.Map(mapElement, mapOptions);


             var locations = [
               <?php
                foreach ($data as $row) { ?>
                 ['<div id="iw-container" data-isi="bencana">' +
                    '<div class="iw-title">'+'<?php echo strtoupper($row->nama_bencana) ?>'+' DI DUSUN '+'<?php echo strtoupper($row->nama_dusun) ?>'+'</div>' +
                    '<div class="iw-content">' +
                      '<div class="iw-subTitle">Rangkuman Dampak & korban</div>' +

                      '<p><?php echo strtoupper($row->dampak)?>. <?php echo strtoupper($row->rangkuman_korban)?></p>' +
                      '<div class="iw-subTitle">Gambar & Video</div>' +
                      <?php $data_detail = $this->db->get_where("tbllaporan_galery", array("idtbllaporan" => $row->idtbllaporan))->result();?>
                      <?php foreach ($data_detail as $rows) { ?>
                        <?php if ($rows->type == '1') { ?>
                          '<img src="<?php echo base_url().'uploads/kejadian/'.$row->idtbllaporan.'/'.$rows->picture_name?>" data-nama="<?php echo strtoupper($row->nama_bencana) ?>'+' DI DUSUN '+'<?php echo strtoupper($row->dusun) ?>" class="img" height="120" width="100%"><br />' +
                        <?php }else{ ?>
                          '<video width="100%" height="100%" src="<?php echo base_url().'uploads/kejadian/'.$row->idtbllaporan.'/'.$rows->picture_name?>" class="video" data-nama="<?php echo strtoupper($row->nama_bencana) ?>'+' DI DUSUN '+'<?php echo strtoupper($row->dusun) ?>" controls><source src="<?php echo base_url().'uploads/kejadian/'.$row->idtbllaporan.'/'.$rows->picture_name?>" type="video/mp4">Your browser does not support HTML5 video </video>'+
                        <?php } ?>
                      <?php } ?>
                    '</div>' +
                    '<div class="iw-bottom-gradient"></div>' +
                  '</div>',
                 <?php echo $row->latitude?>,<?php echo $row->longitude?>,'<?php echo base_url().'uploads/bencana/'.$row->icon?>'],
               <?php } ?>

               <?php foreach ($team as $row) { ?>
                ['<div id="iw-container" data-isi="sales">' +
                   '<div class="iw-title"> Lokasi Team : '+'<?php echo strtoupper($row->nama) ?></div>' +
                   '<div class="iw-content">' +
                     '<div class="iw-subTitle">Lokasi Koordinat</div>' +

                     '<p><?php echo strtoupper($row->latitude)?>. <?php echo strtoupper($row->longitude)?></p>' +

                   '<div class="iw-bottom-gradient"></div>' +
                 '</div>',
                <?php echo $row->latitude?>,<?php echo $row->longitude?>,'<?php echo base_url().'assets/images/002-people.png'?>'],                
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
             // var image = {
             //    url: 'http://sfa.propanraya.com/assets/img/ico/32/002-people.png',
             //    // This marker is 20 pixels wide by 32 pixels high.
             //    size: new google.maps.Size(32, 32),
             //    // The origin for this image is (0, 0).
             //    origin: new google.maps.Point(0, 0),
             //    // The anchor for this image is the base of the flagpole at (0, 32).
             //    anchor: new google.maps.Point(0, 32)
             //  };
             //  // Shapes define the clickable region of the icon. The type defines an HTML
             //  // <area> element 'poly' which traces out a polygon as a series of X,Y points.
             //  // The final coordinate closes the poly by connecting to the first coordinate.
             //  var shape = {
             //    coords: [1, 1, 1, 20, 18, 20, 18, 1],
             //    type: 'poly'
             //  };
             //
             //  //ambil data ajax
             //  $.ajax({
             //     type: "POST",
             //     url: "<?php echo base_url();?>Lp_map/ajax_live",
             //     dataType: "json",
             //     success: function(data){
             //       //console.log(data);
             //       for (var i = 0, len = data.length; i < len; ++i) {
             //
             //         var marker = new google.maps.Marker({
             //           position: {lat: parseFloat(data[i].latitude), lng: parseFloat(data[i].longitude)},
             //           map: map,
             //           icon: image,
             //           shape: shape,
             //           title: data[i].nama+' ('+data[i].create_time+')',
             //           zIndex: i
             //         });
             //       }
             //      }
             //   });

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
          var x = iwBackground.parent().parent().find("#iw-container").attr("data-isi"); //jika dia team maka bedakan
          if (x == 'sales') {

            iwBackground.parent().parent().find("#iw-container").attr("style", "width: 448px;");
            // iwOuter.attr("style", "top: 9px; position: absolute; left: 15px; width: 350px !important;")
            // Removes background shadow DIV
            iwBackground.children(':nth-child(2)').css({'display' : 'none'});

            // Removes white background DIV
            iwBackground.children(':nth-child(4)').css({'display' : 'none'});

            if ($(window).width() <= 500){
              iwOuter.parent().parent().css({left: '50px'});
            }else{
              // Moves the infowindow 163px to the right.
              iwOuter.parent().parent().css({left: '-2px;'});
            }
            // Moves the shadow of the arrow 76px to the left margin.
            iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

            // Moves the arrow 76px to the left margin.
            iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

            // Changes the desired tail shadow color.
            iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});

            // Reference to the div that groups the close button elements.
            var iwCloseBtn = iwOuter.next();

            // Apply the desired effect to the close button
            iwCloseBtn.css({opacity: '1', right: '38px', top: '3px', border: '7px solid #48b5e9', 'border-radius': '13px', 'box-shadow': '0 0 5px #3990B9'});

            // If the content of infowindow not exceed the set maximum height, then the gradient is removed.
            if($('.iw-content').height() < 140){
              $('.iw-bottom-gradient').css({display: 'none'});
            }
          }else{

            // Removes background shadow DIV
            iwBackground.children(':nth-child(2)').css({'display' : 'none'});

            // Removes white background DIV
            iwBackground.children(':nth-child(4)').css({'display' : 'none'});

            if ($(window).width() <= 500){
              iwOuter.parent().parent().css({left: '106px'});
            }else{
              // Moves the infowindow 163px to the right.
              iwOuter.parent().parent().css({left: '163px'});
            }
            // Moves the shadow of the arrow 76px to the left margin.
            iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

            // Moves the arrow 76px to the left margin.
            iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

            // Changes the desired tail shadow color.
            iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});

            // Reference to the div that groups the close button elements.
            var iwCloseBtn = iwOuter.next();

            // Apply the desired effect to the close button
            iwCloseBtn.css({opacity: '1', right: '38px', top: '3px', border: '7px solid #48b5e9', 'border-radius': '13px', 'box-shadow': '0 0 5px #3990B9'});

            // If the content of infowindow not exceed the set maximum height, then the gradient is removed.
            if($('.iw-content').height() < 140){
              $('.iw-bottom-gradient').css({display: 'none'});
            }
          }

          // The API automatically applies 0.7 opacity to the button after the mouseout event. This function reverses this event to the desired value.
          iwCloseBtn.mouseout(function(){
            $(this).css({opacity: '1'});
          });
        });
     }
     google.maps.event.addDomListener(window, 'load', initialize);
  </script>

  <script>
    $(document).on('click', '.img,.video', function (e) {
      var foto = $(this).attr('src');
      var nama = $(this).attr('data-nama');
      var myClass = $(this).attr("class");
      // console.log(link+"_"+nama);
      if (myClass == 'img') {
        $("#title_foto").html("Foto Kejadian "+nama);
        $("#data_icon").attr("src", foto);
        $('#modal5').openModal();
      }else{

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
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
