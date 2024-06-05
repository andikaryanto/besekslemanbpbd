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
                        <h4 class="header2">Export Data</h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data" target="_blank"  action="<?php echo base_url()?>lp_export/proses" method="post">

                            <div class="row" >
                              <div class="input-field col m4 s12" style="padding-left:55px;">
                                <?php $data = array("bencana","Data Penduduk", "Stok Barang") ?>
                                <select name="export" id="export" class="select" required data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih Laporan --</option>
                                  <?php foreach($data as $row){ ?>
                                  <option value="<?php echo $row?>"><?php echo $row ?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt3 warna_error"></div>
                                <!-- <label>Desa / Kelurahan</label> -->
                              </div>

                              <div id="pilihan_bencana">
                                <div class="input-field col m1"></div>
                                <div class="input-field col m4 s12" style="padding-left:55px;">
                                  <?php $status = array("rekap", "detail");?>
                                  <select name="status_laporan" required class='select' data-error=".errorTxt122">
                                    <?php foreach($status as $row){ ?>
                                    <option value="<?php echo $row?>"><?php echo str_replace("_", " ", $row)?></option>
                                  <?php } ?>
                                  </select>
                                  <div class="warna_error errorTxt122"></div>
                                </div>
                              </div>
                            </div>

                            <div class="row" id="row_bencana">
                              <div class="input-field col m4 s12" style="padding-left:55px;" >
                                <?php //$data = array("Dampak") ?>
                                <select name="bencana" id="bencana" class="select" required data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih Bencana --</option>
                                  <?php foreach($bencana as $row){ ?>
                                  <option value="<?php echo $row->id?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                <option value="bencana_all">Semua Bencana (Detail)</option>
                                </select>
                                <div class="errorTxt3 warna_error"></div>
                              </div>

                              <div class="input-field col m1"></div>
                              <div class="input-field col m4 s12" style="padding-left:55px;">
                                <?php $status = array("belum_di_tangani", "proses", "selesai");?>
                                <select name="status" required class='select' data-error=".errorTxt12">
                                  <option value="" disabled selected> -- Status Laporan (Kosongkan Untuk Semua) --</option>
                                  <?php foreach($status as $row){ ?>
                                  <option value="<?php echo $row?>"><?php echo str_replace("_", " ", $row)?></option>
                                <?php } ?>
                                </select>
                                <div class="warna_error errorTxt12"></div>
                              </div>
                            </div>

                            <div class="row" id="row_kecamatan">
                              <div class="input-field col m4 s12" style="padding-left:55px;">
                                <select name="kecamatan" id="kecamatan" class="select" required title="Harap Di pilih" data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih Kecamatan (Kosongkan Untuk Semua) --</option>
                                  <?php foreach($kecamatan as $row){ ?>
                                  <option value="<?php echo $row->id_kec?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt3"></div>
                                <!-- <label>Desa / Kelurahan</label> -->
                              </div>
                              <div class="input-field col m1"></div>

                              <div class="input-field col m4 s12" style="padding-left:55px;">
                                <select name="kelurahan" id="kelurahan" class="select" required title="Harap Di Pilih" data-error=".errorTxt4">
                                  <option value="" disabled selected> -- Pilih Kecamatan Terlebih Dahulu (Kosongkan Untuk Semua) -- </option>
                                </select>
                                <div class="errorTxt4"></div>
                                <!-- <label for="password">Kelurahan</label> -->
                              </div>
                              <div class="input-field col m1"></div>
                            </div>

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
                            </div>

                            <div id="stok">
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
                            </div>

                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light left" type="submit" name="action">Submit
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

      $("#export").change(function(e){
        var tr = $(this).val();
        $("#row_bencana").fadeOut(700);
        $("#row_tanggal").fadeOut(700);
        $("#row_kecamatan").fadeOut(700);
        $("#pilihan_bencana").fadeOut(700);
        $("#stok").fadeOut(700);

        if (tr == 'bencana') {
          $("#row_bencana").fadeIn(700);
          $("#row_tanggal").fadeIn(700);
          $("#row_kecamatan").fadeIn(700);
          $("#pilihan_bencana").fadeIn(700);
        }else if (tr == 'Data Penduduk') {
          $("#row_kecamatan").fadeIn(700);
        }else if(tr == 'Stok Barang'){
          $("#stok").fadeIn(700);
        }
      });

       $("#kecamatan").change(function (e){
         // console.log($(this).val());
          e.preventDefault();
          $.ajax({
             type: "POST",
             url: "<?php echo base_url();?>ms_desa/get_kelurahan",
             data: "idkec="+$(this).val(),
             success: function(data){
                 $('#kelurahan').html("<option value=''>-- Pilih Kelurahan --</option>");
                 var opt = data;
                 $('#kelurahan').append(opt);
             }
         });
        });

      $(document).ready(function(){ //supaya css tidak rusak
        $("#row_bencana").hide();
        $("#row_tanggal").hide();
        $("#row_kecamatan").hide();
        $("#pilihan_bencana").hide();
        $("#stok").hide();
      });

    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
