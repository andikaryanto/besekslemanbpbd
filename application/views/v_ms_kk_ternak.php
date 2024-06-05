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
    .select-dropdown {margin-left: 3rem !important;width: calc(100% - 3rem) !important;}
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
                      <div class="card-panel">
                        <h4 class="header2">Ubah Detail Ternak : <b><?php echo $nama.' ('.$data->jml_ternak.')'?></b></h4>
                        <div class="row">
                          <form class="col s12" id="formValidate2" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_kk/proses_anggota" method="post">

                            <div class="row">
                              <div class="input-field col m6 s12">
                                <select name="ternak" class="select" required  data-error=".errorTxt91">
                                  <option value="" disabled selected> -- Pilih Ternak --</option>
                                  <?php foreach ($ternak as $row) { ?>
                                    <option value="<?php echo $row->idtblternak?>"<?php if($row->idtblternak == $data->idtblternak) echo "selected"?> ><?php echo $row->nama ?></option>
                                  <?php } ?>
                                </select>
                                <div class="warna_error errorTxt91"></div>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="jml_ternak" type="number" min="1" required data-error=".errorTxt101" value="<?php echo $data->jml_ternak?>">
                                <div class="warna_error errorTxt101"></div>
                                <label for="first_name">Jumlah Ternak</label>
                              </div>

                            </div>
                            <input name="type" value="2" type="hidden">

                              <input name="id" value="<?php echo md5($data->id)?>" type="hidden">
                              <div class="row">
                                <div class="input-field col s12">
                                  <button value="tambah" class="btn cyan waves-effect waves-light left" type="submit" name="ubah">Simpan Anggota
                                    <i class="mdi-content-send right"></i>
                                  </button>
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
    <script>

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

    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
