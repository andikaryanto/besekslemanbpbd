<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Main design
	Version: 1
	Author: Elos
================================================================================ -->


<head>
    <?php include('inc/css.php') ?>
    <link rel="stylesheet" href="<?php echo base_url();?>assets/select2/select2.min.css" type="text/css"/>
    <style>
    .select-dropdown {margin-left: 3rem !important;width: calc(100% - 3rem) !important;}
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
            <section id="content" style="margin-bottom:380px;">
              <!--chart dashboard start-->
              <div id="padding" style="padding-top:12px;">
                  <?php include("inc/info.php") ?>
              </div>
              <!--chart dashboard end-->
                <!--start container-->
                <div class="container">
                  <div class="row">
                    <div class="col s12 m12 l6">
                      <div class="card-panel">
                        <h4 class="header2">Laporan </h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data" target="_blank" action="<?php echo base_url()?>laporan/proses" method="post">
                            <div class="row">
                              <div class="input-field col s12">
                                <select name="jenis" id="jenis" required data-error=".errorTxt6">
                                  <option value="" disabled selected> -- Pilih Jenis Laporan --</option>
                                  <option value="1" > Rekap Pergerakan Stock (PDF) </option>
                                  <option value="2" > Rekap Summary Stock (PDF) </option>
                                </select>
                                <div class="errorTxt6 warna_error"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col s12">
                                <select name="gudang[]" id="gudang" multiple  data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih Gudang (Kosongkan Jika ingin melihat di semua gudang) --</option>
                                  <?php foreach($gudang as $row){ ?>
                                  <option value="<?php echo $row->idtblgudang?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt3 warna_error"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col s12">
                                <select name="barang[]" multiple id="barang" >
                                  <option value="" disabled selected> -- Pilih Barang (Kosongkan Jika ingin melihat semua barang) --</option>
                                  <?php foreach($barang as $row){ ?>
                                  <option value="<?php echo $row->idtblbarang?>"><?php echo $row->nama.' ('.$row->uom.')' ?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt4 warna_error"></div>
                              </div>
                            </div>
                            <div class="row">

                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
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
    <?php include("inc/js.php") ?>
    <script src="<?php echo base_url();?>assets/select2/select2.full.min.js" type="text/javascript" charset="utf-8"></script>
    <script>
    $('select').material_select('destroy');
    $(".select").select2();
    $.validator.setDefaults({
           ignore: []
    });

    $("#formValidate").validate({
      rules: {
          nama: {
              required: true,
              minlength: 5
          },
          keterangan: {
              required: true,
          },
          foto: {
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


    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
