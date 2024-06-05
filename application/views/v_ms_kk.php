<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Master kk
	Version: 1
	Author: Elos
================================================================================ -->

<head>
    <?php include('inc/css.php') ?>
    <style>
      .modal-lg { width: 85% !important; max-height: 95% !important; }
      .select-dropdown {margin-left: 3rem !important;width: calc(100% - 3rem) !important;}
      .warna_error {color:red;}
    </style>
  <link href="<?php echo base_url()?>assets/js/plugins/data-tables/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" media="screen,projection">
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
                    <div id="table-datatables">
                      <h4 class="header" style="text-align : center; margin-top:0px;">Master Kartu Keluarga
                      </h4>
                      <div class="row">
                        <div class="col s12 m12 l12">
                          <table id="example" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                          <thead>
                              <tr>
                                  <th style="width: 10%;">Nomor KK</th>
                                  <th style="width: 10%;">Nama kepala keluarga</th>
                                  <th style="width: 10%;">Status</th>
                                  <th style="width: 7%;">Aksi</th>
                              </tr>
                          </thead>
                          <tbody>

                          </tbody>
                      </table>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- <div class="row">
                    <a class="waves-effect waves-light btn modal-trigger light-blue" href="#modal1">Modal</a>
                    <a class="waves-effect waves-light btn light-blue" id="a">Modal 2</a>
                    -->
                    <div id="modal1" class="modal">
                      <div class="modal-header">
                          <h4 class="modal-title nama-delete" style="text-align:center;">Konfirmasi Hapus</h4>
                      </div>
                      <hr />
                      <div class="modal-content">
                        <p>Apakah Anda Yakin ?</p>
                      </div>
                      <div class="modal-footer">
                        <a class="btn waves-effect waves-light blue modal-close" type="submit" style="margin-left:5px;">Batal <i class="mdi-content-clear right"></i></a>
                        <a class="btn waves-effect waves-light " type="submit" id="button-modal-delete">Proses <i class="mdi-content-send right"></i></a>
                      </div>
                    </div>

                    <div id="modal2" class="modal modal-lg">
                      <div class="modal-header">
                          <h4 class="modal-title" style="text-align:center;">Tambah Kartu Keluarga</h4>
                      </div>
                      <hr />
                      <div class="modal-content">
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_kk/proses_tambah" method="post">
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="nama" type="text" required data-error=".errorTxt1">
                                <div class="warna_error errorTxt1"></div>
                                <label for="first_name">Nama kepala keluarga</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <select style="" name="status" class="select" required  data-error=".errorTxt2">
                                  <option value="" disabled selected> -- pilih status  --</option>
                                  <option value="suami">    Suami   </option>
                                  <option value="istri">    Istri </option>
                                </select>
                                <div class="warna_error errorTxt2"></div>
                                <!-- <label for="first_name">Status</label> -->
                              </div>
                              <div class="input-field col m4 s12">
                                <select name="jenis_kelamin" class="select" required  data-error=".errorTxt5">
                                  <option value="" disabled selected> -- Pilih Jenis Kelamin --</option>
                                  <option value="laki-laki">Laki-Laki   </option>
                                  <option value="perempuan">Perempuan </option>
                                </select>
                                <div class="warna_error errorTxt5"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="nokk" type="text" required data-error=".errorTxt4">
                                <div class="warna_error errorTxt4"></div>
                                <label for="first_name">Nomor kartu keluarga</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <select name="kelurahan" id="kelurahan" class="select" required  data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih Kelurahan --</option>
                                  <?php foreach($kelurahan as $row){ ?>
                                  <option value="<?php echo $row->id_kel?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                </select>
                                <div class="warna_error errorTxt3"></div>
                              </div>
                              <div class="input-field col m4 s12">
                                <select name="desa" id="desa" class="select" data-error=".errorTxt6">
                                  <option value="" disabled selected> -- Pilih Kelurahan Terlebih dahulu --</option>
                                </select>
                                <div class="warna_error errorTxt6"></div>
                                <!-- <label for="first_name">Dusun</label> -->
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m4 s6">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="rt" type="text" required data-error=".errorTxt13">
                                <div class="warna_error errorTxt13"></div>
                                <label for="first_name">RT</label>
                              </div>
                              <div class="input-field col m4 s6">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="rw" type="text" required data-error=".errorTxt14">
                                <div class="warna_error errorTxt14"></div>
                                <label for="first_name">RW</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="kewarganegaraan" type="text" required data-error=".errorTxt15">
                                <div class="warna_error errorTxt15"></div>
                                <label for="first_name">Kewarganegaraan</label>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="ktp" type="text" required data-error=".errorTxt7">
                                <div class="warna_error errorTxt7"></div>
                                <label for="first_name">Nomor KTP</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="pekerjaan" type="text" required data-error=".errorTxt8">
                                <div class="warna_error errorTxt8"></div>
                                <label for="first_name">Pekerjaan</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <select name="agama" class="select" required  data-error=".errorTxt9">
                                  <option value="" disabled selected> -- Pilih Agama --</option>
                                  <?php foreach ($agama as $row) { ?>
                                    <option value="<?php echo $row->idtblagama?>"><?php echo $row->nama ?></option>
                                  <?php } ?>
                                </select>
                                <div class="warna_error errorTxt9"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="tempat_lahir" type="text" required data-error=".errorTxt10">
                                <div class="warna_error errorTxt10"></div>
                                <label for="first_name">Tempat Lahir</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="tanggal_lahir" type="date" class="datepicker" required data-error=".errorTxt11">
                                <div class="warna_error errorTxt11"></div>
                                <label for="first_name">tanggal lahir</label>
                              </div>
                              <div class="input-field col m4 s12">
                                <select name="status_kawin" class="select" required  data-error=".errorTxt12">
                                  <option value="" disabled selected> -- Status Perkawinan --</option>
                                  <option value="belum_menikah">Belum Menikah   </option>
                                  <option value="menikah">Menikah </option>
                                </select>
                                <div class="warna_error errorTxt12"></div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m8 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="deskripsi" type="text" placeholder="kosongkan jika tidak ada keterangan">
                                <!-- <div class="warna_error errorTxt21"></div> -->
                                <label for="first_name">Keterangan Tambahan</label>
                              </div>
                              <div class="input-field col m4 s12">
                              <input type="checkbox" name="disabilitas" id="test5" />
                              <label for="test5">Disabilitas</label>
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

                      <div id="modal_edit" class="modal">
                        <div class="modal-header">
                            <h4 class="modal-title nama-ubah" style="text-align:center;"></h4>
                        </div>
                        <hr />
                        <div class="modal-content">
                          <div class="row">
                            <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_kk/proses_edit" method="post">
                              <div class="row">
                                <div class="input-field col m6 s12">
                                  <i class="mdi-action-account-circle prefix"></i>
                                  <input id="nama" name="nama" type="text" required data-error=".errorTxt1">
                                  <div class="warna_error errorTxt1"></div>
                                  <label for="first_name" id="lbl_kk"  >Nama kk</label>
                                </div>
                                <div class="input-field col m6 s12">
                                  <i  class="mdi-action-account-circle prefix"></i>
                                  <input id="deskripsi" name="deskripsi" type="text" required data-error=".errorTxt2">
                                  <input id="id" name="id" type="hidden">
                                  <div class="warna_error errorTxt2"></div>
                                  <label id="lbl_des" for="first_name">Deskripsi</label>
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
                    <!--card widgets end-->
                    <!-- Floating Action Button -->

                    <?php if($akses['create'] == '1'){ ?>
                    <div class="fixed-action-btn tooltipped" style="bottom: 50px; right: 19px;" data-position="left" data-delay="50" data-tooltip="Tambah">
                        <a class="btn-floating btn-large" id="a">
                          <i class="mdi-content-add"></i>
                        </a>
                    </div>
                  <?php } ?>
                    <!-- Floating Action Button -->

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


    <!-- ================================================
    Scripts
    ================================================ -->

    <?php include("inc/js.php") ?>

    <!-- data-tables -->
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/data-tables/js/jquery.dataTables.min.js"></script>
    <!-- <script src="<?php echo base_url();?>assets/select2/select2.full.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="<?php echo base_url();?>assets/select2/select2.min.css" type="text/css"/> -->
    <!-- <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/data-tables/data-tables-script.js"></script> -->
    <script>

    $("#kelurahan").change(function (e){
       e.preventDefault();
       $.ajax({
          type: "POST",
          url: "<?php echo base_url();?>ms_kk/get_desa",
          data: "idkel="+$(this).val(),
          success: function(data){
            if (data != '') {
              $('#desa').html("<option value=''>-- Pilih Dusun --</option>");
              var opt = data;
              $('#desa').append(opt);
              $('#desa').material_select();
            }else{
              $('#desa').html("<option value=''>-- Tidak Ada Dusun --</option>");
              $('#desa').material_select();
            }
          }
      });
     });
    // $('select').material_select('destroy');
    // $(".select").select2();
    // $('.modal').modal();
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

    $("#a").click(function(a){
      a.preventDefault();
        $('#modal2').openModal();
    });

    $(".link_delete").click(function(a){
        a.preventDefault();
        $('#modal1').openModal();
    });

    $(document).on('click', '.link_delete', function (e) {
         var link = $(this).attr('href');
         var nama = $(this).attr('data-nama');
         var status = $(this).attr("data-status");
         if (status == 'hapus') {
           $(".nama-delete").text("Konfirmasi Delete Data "+nama);
         }else{
           $(".nama-delete").text("Konfirmasi aktivasi Data "+nama);
         }
         $("#button-modal-delete").attr('href',link);
         $('#modal1').openModal();
        e.preventDefault();
     });

     $(document).on('click', '.btn-edit', function (e) {
          $("#lbl_kk,#lbl_des").addClass("active");

          var deskripsi = $(this).attr('data-deskripsi');
          var nama = $(this).attr('data-nama');
          var id = $(this).attr('data-id');
          $("#nama").val(nama);
          $("#deskripsi").val(deskripsi);
          $("#id").val(id);

          $(".nama-ubah").text("Ubah Data "+nama);
          $('#modal_edit').openModal();
         e.preventDefault();
      });

    $("#example").dataTable({
        "bPaginate": false,
        "bLengthChange": false,
        "bFilter": true,
        "bInfo": false,
        "bAutoWidth": false,
        "scrollY": 252,
        searchDelay: 700,
        "scrollX": true,
        serverSide: true,
        ajax: {
           type: "POST",
           url: "<?php echo base_url()?>ms_kk/get_kk/",
           dataType: 'json',
            beforeSend:function()
            {
              // $("#modal-loading").modal('show');
              //  $('#modal1').modal('open');
            },

        },
        fnInitComplete: function(oSettings, json)
        {
        //  $("#modal-loading").modal('hide');$('body').removeClass('modal-open'); $('.modal-backdrop').remove();
        },
        fnDrawCallback: function( oSettings ) {
        // $("#modal-loading").modal('hide');$('body').removeClass('modal-open'); $('.modal-backdrop').remove();
        }
        });

        // var d = new Date();
        // d.setFullYear( d.getFullYear() - 100 );
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
