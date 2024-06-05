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
                        <h4 class="header2">Ubah Detail Master Anggota : <b><?php echo $data->nama.' ('.$data->ktp.')'?></b></h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_kk/proses_anggota" method="post">
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="nama" type="text" required data-error=".errorTxt1" value="<?php echo $data->nama?>">
                                <div class="warna_error errorTxt1"></div>
                                <label for="first_name">Nama kepala keluarga</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <?php $sel_status = array("suami", "istri", "anak", "cucu", "keponakan", "mertua", "menantu"); ?>
                                <select style="" name="status" class="select" required  data-error=".errorTxt2">
                                  <option value="" disabled selected> -- pilih status  --</option>
                                  <?php foreach($sel_status as $row){ ?>
                                  <option value="<?php echo $row?>"<?php if($row == $data->status) echo 'selected'?>><?php echo $row?></option>
                                <?php } ?>

                                </select>
                                <div class="warna_error errorTxt2"></div>
                              </div>
                              <div class="input-field col m4 s12">
                                <?php $sel_jk = array("laki-laki", "perempuan")?>
                                <select name="jenis_kelamin" class="select" required  data-error=".errorTxt5">
                                  <option value="" disabled selected> -- Pilih Jenis Kelamin --</option>
                                  <?php foreach($sel_jk as $row){ ?>
                                  <option value="<?php echo $row?>"<?php if($row == $data->jenis_kelamin) echo 'selected'?>><?php echo $row?></option>
                                <?php } ?>
                                </select>
                                <div class="warna_error errorTxt5"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="kewarganegaraan" type="text" required data-error=".errorTxt15" value="<?php echo $data->kewarganegaraan?>">
                                <div class="warna_error errorTxt15"></div>
                                <label for="first_name">Kewarganegaraan</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="ktp" type="text" required data-error=".errorTxt7" value="<?php echo $data->ktp?>">
                                <div class="warna_error errorTxt7"></div>
                                <label for="first_name">Nomor KTP</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <select name="agama" class="select" required  data-error=".errorTxt9">
                                  <option value="" disabled selected> -- Pilih Agama --</option>
                                  <?php foreach ($agama as $row) { ?>
                                    <option value="<?php echo $row->idtblagama?>"<?php if($row->idtblagama == $data->idtblagama) echo 'selected' ?>><?php echo $row->nama ?></option>
                                  <?php } ?>
                                </select>
                                <div class="warna_error errorTxt9"></div>
                              </div>

                            </div>
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="tempat_lahir" type="text" required data-error=".errorTxt10" value="<?php echo $data->tempat_lahir?>">
                                <div class="warna_error errorTxt10"></div>
                                <label for="first_name">Tempat Lahir</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="tanggal_lahir" type="date" class="datepicker" required data-error=".errorTxt11" value="<?php echo date(("Y-m-d"), strtotime($data->tanggal_lahir))?>">
                                <div class="warna_error errorTxt11"></div>
                                <label for="first_name">tanggal lahir</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <?php $sel_kawin = array("belum_menikah", "menikah");?>
                                <select name="status_kawin" class="select" required  data-error=".errorTxt12">
                                  <option value="" disabled selected> -- Status Perkawinan --</option>
                                  <?php foreach($sel_kawin as $row){ ?>
                                  <option value="<?php echo $row?>"<?php if($row == $data->status_kawin) echo 'selected'?>><?php echo str_replace("_", " ", $row)?></option>
                                <?php } ?>
                                </select>
                                <div class="warna_error errorTxt12"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="pekerjaan" type="text" required data-error=".errorTxt8" value="<?php echo $data->pekerjaan?>">
                                <div class="warna_error errorTxt8"></div>
                                <label for="first_name">Pekerjaan</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="deskripsi" type="text" placeholder="kosongkan jika tidak ada keterangan" value="<?php echo $data->deskripsi?>">
                                <label for="first_name">Keterangan Tambahan</label>
                              </div>
                              <div class="input-field col m4 s12">
                              <input type="checkbox" name="disabilitas" id="test5" <?php if($data->disabilitas == '1') echo 'checked="checked"'?>/>
                              <label for="test5">Disabilitas</label>
                              </div>
                            </div>
                            
                            <input name="type" value="1" type="hidden">

                              <input name="id" value="<?php echo md5($data->id)?>" type="hidden">
                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit" name="action" value="ubah">Submit
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
