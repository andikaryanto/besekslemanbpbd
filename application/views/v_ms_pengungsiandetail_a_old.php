<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Master pengungsian
	Version: 1
	Author: Elos
================================================================================ -->

<head>
    <?php include('inc/css.php') ?>
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
                      <h4 class="header" style="text-align : center; margin-top:0px;">Rekap Data Pengungsian <?php echo $data->nama ?>
                      </h4>
                      <div class="row">
                        <div class="col s12 m12 l12">
                          <table id="example" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                          <thead>
                              <tr>
                                  <th style="width: 10%;">Jumlah Laki - Laki</th>
                                  <th style="width: 10%;">Jumlah Perempuan</th>
                                  <th style="width: 10%;">Dewasa Laki - Laki</th>
                                  <th style="width: 10%;">Dewasa Perempuan</th>
                                  <th style="width: 10%;">Anak Laki - Laki</th>
                                  <th style="width: 10%;">Anak Perempuan</th>
                                  <th style="width: 7%;">Balita Laki - Laki</th>
                                  <th style="width: 7%;">Balita Perempuan</th>
                                  <th style="width: 7%;">Bayi Laki - Laki</th>
                                  <th style="width: 7%;">Bayi Perempuan</th>
                                  <th style="width: 7%;">Lansia Laki - Laki</th>
                                  <th style="width: 7%;">Lansia Perempuan</th>
                                  <th style="width: 7%;">Difabel Laki - Laki</th>
                                  <th style="width: 7%;">Difabel Perempuan</th>
                                  <th style="width: 7%;">Ibu Hamil</th>
                                  <th style="width: 7%;">Ibu Menyusui</th>
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

                    <div id="modal2" class="modal">
                      <div class="modal-header">
                          <h4 class="modal-title" style="text-align:center;">Tambah</h4>
                      </div>
                      <hr />
                      <div class="modal-content">
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_pengungsian_detail/proses_tambah_detail" method="post">
                            <div class="row">
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="jumlahL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Jumlah Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="JumlahP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Jumlah Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="dewasaL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Dewasa Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="dewasaP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Dewasa Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="anakL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Anak Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="anakP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Anak Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="balitaL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Balita Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="balitaP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Balita Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="bayiL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Bayi Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="bayiP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Bayi Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="lansiaL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Lansia Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="lansiaP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Lansia Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="difabelL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Difabel Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="difabelP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Difabel Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="bumil" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Ibu Hamil</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="busui" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Ibu Menyusui</label>
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
                            <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_pengungsian_detail/proses_edit_detail" method="post">
                              <div class="row">
                                <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="jumlahL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Jumlah Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="JumlahP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Jumlah Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="dewasaL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Dewasa Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="dewasaP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Dewasa Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="anakL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Anak Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="anakP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Anak Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="balitaL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Balita Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="balitaP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Balita Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="bayiL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Bayi Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="bayiP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Bayi Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="lansiaL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Lansia Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="lansiaP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Lansia Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="difabelL" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Difabel Laki - Laki</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="difabelP" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Difabel Perempuan</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="bumil" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Ibu Hamil</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="busui" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Ibu Menyusui</label>
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
                    <div class="fixed-action-btn tooltipped" style="bottom: 50px; right: 19px;" data-position="left" data-delay="50" data-tooltip="Tambah">
                        <a class="btn-floating btn-large" id="a" >
                          <i class="mdi-content-add"></i>
                        </a>
                    </div>
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
    <!-- <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/data-tables/data-tables-script.js"></script> -->
    <script>
    // $('.modal').modal();
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
          $("#lbl_jumlahL,#jumlahP,#dewasaL,dewasaP,#anakL,#anakP,#balitaL,#balitaP,#bayiL,#bayiP,#lansiaL,#lansiaP,#difabelL,#difabelP,#bumil,#busui").addClass("active");

          var jumlahlaki = $(this).attr('data-jumlahL');
          var jumlahperempuan = $(this).attr('data-jumlahP');
          var id = $(this).attr('data-id');
          var dewasalaki = $(this).attr('data-dewasaL');
          var dewasaperempuan = $(this).attr("data-dewasaP");
          var anaklaki = $(this).attr("data-anakL");
          var anakperempuan = $(this).attr("data-anakP");
          var balitalaki = $(this).attr("data-balitaL");
          var balitaperempuan = $(this).attr("data-balitaP");
          var bayilaki = $(this).attr("data-bayiL");
          var bayiperempuan = $(this).attr("data-bayiP");
          var lansialaki = $(this).attr("data-lansiaL");
          var lansiaperempuan = $(this).attr("data-lansiaP");
          var difabellaki = $(this).attr("data-difabelL");
          var difabelperempuan = $(this).attr("data-difabelP");
          var bumil = $(this).attr("data-bumil");
          var busui = $(this).attr("data-busui");

          $("#jumlahlaki").val(jumlahlaki); $("#jumlahperempuan").val(jumlahperempuan);
          $("#id_edit").val(id); $("#dewasalaki").val(dewasalaki);
          $("#balitalaki").val(balitalaki); $("#balitaperempuan").val(balitaperempuan);
          $("#bayilaki").val(bayilaki); $("#bayiperempuan").val(bayiperempuan);
          $("#lansialaki").val(lansialaki); $("#lansiaperempuan").val(lansiaperempuan);
          $("#difabellaki").val(difabellaki); $("#difabelperempuan").val(difabelperempuan);
          $("#bumil").val(bumil); $("#busui").val(busui);

          $(".jumlah-ubah").text("Yakin Data Akan diubah?");
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
           url: "<?php echo base_url()?>ms_pengungsian_detail/get_pengungsian_det/<?php echo $id_md5?>",
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
    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
