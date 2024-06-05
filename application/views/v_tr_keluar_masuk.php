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
                    <div class="col s12 m12 l12">
                      <div class="card-panel">
                        <h4 class="header2">Transaksi Keluar Masuk Barang</h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>Tr_keluar_masuk/proses" method="post">

                            <div class="row">
                              <div class="input-field col m2 s12" style="padding-left:55px;">
                                <select name="gudang" id="gudang" class="select" required data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih Gudang --</option>
                                  <?php foreach($gudang as $row){ ?>
                                  <option value="<?php echo $row->idtblgudang?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt3 warna_error"></div>
                                <!-- <label>Desa / Kelurahan</label> -->
                              </div>
                              <div class="input-field col m1"></div>

                              <div class="input-field col m2 s12" style="padding-left:55px;">
                                <select name="barang" id="barang" class="select" required data-error=".errorTxt4">
                                  <option value="" disabled selected> -- Pilih Barang --</option>
                                  <?php foreach($barang as $row){ ?>
                                  <option value="<?php echo $row->idtblbarang?>"><?php echo $row->nama.' ('.$row->uom.')' ?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt4 warna_error"></div>
                                <!-- <label for="password">Kelurahan</label> -->
                              </div>
                              <div class="input-field col m1"></div>
                              <div class="input-field col m3 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="qty" type="number" min="0" data-error=".errorTxt5">
                                <div class="errorTxt5 warna_error"></div>
                                <label for="first_name">Quantity</label>
                              </div>
                              <div class="input-field col m3 s12">
                                <select name="jenis" class="" required data-error=".errorTxt6">
                                  <option value="" disabled selected> -- Pilih Jenis Transaksi --</option>
                                  <option value="1" > Masuk </option>
                                  <option value="2" > Keluar </option>
                                </select>
                                <div class="errorTxt6 warna_error"></div>

                              </div>
                            </div>

                            <div class="row">

                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="nama" type="text" data-error=".errorTxt1">
                                <div class="errorTxt1 warna_error"></div>
                                <label for="first_name">Nama Penerima</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="keterangan" type="text" data-error=".errorTxt2">
                                <div class="errorTxt2 warna_error"></div>
                                <label for="first_name">Keterangan</label>
                              </div>
                            </div>

                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
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
