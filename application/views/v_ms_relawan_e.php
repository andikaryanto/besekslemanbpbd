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
                        <h4 class="header2">Edit Master relawan</h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_relawan/proses_tambah/<?php echo $data['idtblrelawan'] ?>" method="post">
                            <div class="row">
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="no_induk" value="<?php echo $data['no_induk'] ?>" name="no_induk" type="text" data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="no_induk">NRR/No Induk</label>
                              </div>
                                <div class="input-field col m6 s12">
                                  <i class="mdi-action-account-circle prefix"></i>
                                  <input id="nik" name="nik" type="text" value="<?php echo $data['nik'] ?>" data-error=".errorTxt1">
                                  <div class="errorTxt1"></div>
                                  <label for="nik">NIK</label>
                                </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="nama_relawan" type="text" value="<?php echo $data['nama_relawan'] ?>" data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="nama_relawan">Nama relawan</label>
                              </div>
                                  <div class="input-field col m5 s12" style="padding-left:55px;height: 45.5px;margin-top: 30px;">
                                    <select name="jenis_kelamin" id="jenis_kelamin" class="select" required title="Harap Di pilih" data-error=".errorTxt3">
                                      <option value="" selected> -- Pilih Jenis Kelamin --</option>
                                      <option value="Pria" <?php echo ($data['jenis_kelamin'] == 'Pria') ? 'selected' : ''; ?> >Pria</option>
                                      <option value="Wanita" <?php echo ($data['jenis_kelamin'] == 'Wanita') ? 'selected' : ''; ?>>Wanita</option>
                                    </select>
                                    <div class="errorTxt3"></div>
                                    <!-- <label>Desa / Kelurahan</label> -->
                                  </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="alamat" value="<?php echo $data['alamat'] ?>" type="text" data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Alamat</label>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m3 s12" style="padding-left:55px;">
                                <select name="kecamatan" id="kecamatan" class="select" required title="Harap Di pilih" data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih Kecamatan --</option>
                                  <?php foreach($kecamatan as $row){ ?>
                                  <option value="<?php echo $row->id_kec?>" <?php echo ($data['kecamatan'] == $row->id_kec) ? 'selected' : ''; ?>><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt3"></div>
                                <!-- <label>Desa / Kelurahan</label> -->
                              </div>
                              <div class="input-field col m1"></div>

                              <div class="input-field col m3 s12" style="padding-left:55px;">
                                <select name="kelurahan" id="kelurahan" class="select" required title="Harap Di Pilih" data-error=".errorTxt4">
                                  <option value="" disabled selected> -- Pilih Kecamatan Terlebih Dahulu -- </option>
                                </select>
                                <div class="errorTxt4"></div>
                                <!-- <label for="password">Kelurahan</label> -->
                              </div>
                              <div class="input-field col m1"></div>
                              <div class="input-field col m3 s12" style="padding-left:55px;">
                                  <select name="desa" id="desa" class="select" required title="Harap Di Pilih" data-error=".errorTxt4">
                                      <option value="" disabled selected> -- Pilih Kelurahan Terlebih Dahulu -- </option>
                                  </select>
                                  <div class="errorTxt4"></div>
                              </div>
                            </div>

                            <div class="row">
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="tempat_lahir" value="<?php echo $data['tempat_lahir'] ?>" type="text" required data-error=".errorTxt10">
                                <div class="errorTxt10"></div>
                                <label for="tempat_lahir">Tempat Lahir</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="tgl_lahir" type="date" value="<?php echo date('Y-m-d' ,strtotime($data['tgl_lahir'])) ?>" class="datepicker" required data-error=".errorTxt11" value="<?php echo date(("Y-m-d"), strtotime('1990-01-01'))?>">
                                <div class="warna_error errorTxt11"></div>
                                <label for="first_name">tanggal lahir</label>
                              </div>
                              <div class="row">
                                <div class="input-field col m5 s12" style="padding-left:55px;">
                                  <select name="kecakapan" id="kecakapan" class="select" required title="Harap Di pilih" data-error=".errorTxt3">
                                    <option value="" selected> -- Pilih Kecakapan --</option>
                                    <?php foreach($kecakapan as $row){ ?>
                                    <option <?php echo ($data['kecakapan'] == $row->idtblkecakapan) ? 'selected' : ''; ?> value="<?php echo $row->idtblkecakapan?>"><?php echo $row->nama ?></option>
                                  <?php } ?>
                                  </select>
                                  <div class="errorTxt3"></div>
                                  <!-- <label>Desa / Kelurahan</label> -->
                                </div>
                                <div class="input-field col m1"></div>
                                <div class="input-field col m5 s12" style="padding-left:55px;">
                                  <select name="komunitas" id="komunitas" class="select" required title="Harap Di pilih" data-error=".errorTxt3">
                                    <option value="" selected> -- Pilih Komunitas --</option>
                                    <?php foreach($komunitas as $row){ ?>
                                    <option <?php echo ($data['komunitas'] == $row->idtblkomunitas) ? 'selected' : ''; ?> value="<?php echo $row->idtblkomunitas?>" <?php echo ($data['komunitas'] == $row->idtblkomunitas) ? 'selected' : ''; ?>><?php echo $row->nama ?></option>
                                  <?php } ?>
                                  </select>
                                  <div class="errorTxt3"></div>
                                  <!-- <label>Desa / Kelurahan</label> -->
                                </div>
                              </div>
                            </div>
                            </div>
                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit" value="tambah" name="action">Submit
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

       $("#kecamatan").change(function (e){
         // console.log($(this).val());
          e.preventDefault();
          $.ajax({
             type: "POST",
             url: "<?php echo base_url();?>ms_relawan/get_kelurahan",
             data: "idkec="+$(this).val(),
             success: function(data){
                 $('#kelurahan').html("<option value=''>-- Pilih Kelurahan --</option>");
                 var opt = data;
                 $('#kelurahan').append(opt);
             }
         });
        });

        $("#kelurahan").change(function(e) {
            // console.log($(this).val());
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "<?php echo base_url();?>tr_kegiatan/get_desa",
                data: {
                  "idkec" : $('#kecamatan').val(),
                  "idkel" : $(this).val(),
                },
                success: function(data) {
                    $('#desa').html("<option value=''>-- Pilih Desa --</option>");
                    var opt = data;
                    $('#desa').append(opt);
                }
            });
        });

       $("#file-1").fileinput({
            'allowedFileExtensions' : ['jpg', 'jpeg', 'png'],
            maxFileSize: 2000,
            maxFileCount: 5,
            showUpload: false,
        });

        $("#map").click(function(e){
          var lat = $("#lat").val();
          var lng = $("#long").val();
          elos_ganteng(lat, lng);
          $('#modal_map').openModal();
        });
    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
