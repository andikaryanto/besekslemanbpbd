<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Master peralatan
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
                      <h4 class="header" style="text-align : center; margin-top:0px;">Master Data <?php echo $data->nama ?>
                      </h4>
                      <div class="row">
                        <div class="col s12 m12 l12">
                          <table id="example" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                          <thead>
                              <tr>
                                  <th style="width: 10%;">Nama</th>
                                  <th style="width: 10%;">Alamat</th>
                                  <th style="width: 10%;">Pengelola</th>
                                  <th style="width: 10%;">Telephone</th>
                                  <th style="width: 10%;">status</th>
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

                    <div id="modal2" class="modal">
                      <div class="modal-header">
                          <h4 class="modal-title" style="text-align:center;">Tambah</h4>
                      </div>
                      <hr />
                      <div class="modal-content">
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>Ms_wisata/proses_tambah_detail" method="post">
                            <div class="row">
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="nama" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Nama</label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="alamat" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name">Alamat</label>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m3 s6">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="pengelola" type="text" required data-error=".errorTxt3">
                                <div class="errorTxt3"></div>
                                <label for="first_name">Pengelola</label>
                              </div>                              
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="telp" type="text" required data-error=".errorTxt5">
                                <div class="errorTxt5"></div>
                                <label for="first_name">Telephone</label>                              
                              </div>
                            </div>
                            <div class="row">
                            <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="latitude" type="text" required data-error=".errorTxt5">
                                <div class="errorTxt5"></div>
                                <label for="first_name">Latitude</label>                              
                              </div>
                            <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="longitude" type="text" required data-error=".errorTxt5">
                                <div class="errorTxt5"></div>
                                <label for="first_name">Longitude</label>
                                <input name="id" value="<?php echo $id_md5?>" type="hidden">
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
                            <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>Ms_wisata/proses_edit_detail" method="post">
                              <div class="row">
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="nama" type="text" required data-error=".errorTxt1">
                                <div class="errorTxt1"></div>
                                <label for="first_name" id="lbl_nama">Nama </label>
                              </div>
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input name="alamat" type="text" required data-error=".errorTxt2">
                                <div class="errorTxt2"></div>
                                <label for="first_name" id="lbl_alamat">Alamat </label>
                              </div>
                            </div>
                            <div class="row">
                              <div class="input-field col m3 s6">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="pengelola" type="text" required data-error=".errorTxt3">
                                <div class="errorTxt3"></div>
                                <label for="first_name" id="lbl_pengelola">Pengelola </label>
                              </div>                              
                              <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="telp" type="text" required data-error=".errorTxt5">
                                <div class="errorTxt5"></div>
                                <label for="first_name" id="lbl_telp">Telephone/ Hp </label>                            
                              </div>
                            </div>
                            <div class="row">
                            <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="latitude" type="text" required data-error=".errorTxt5">
                                <div class="errorTxt5"></div>
                                <label for="first_name" id="lbl_latitude">Latitude </label>                             
                              </div>
                            <div class="input-field col m6 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="" name="longitude" type="text" required data-error=".errorTxt5">
                                <div class="errorTxt5"></div>
                                <label for="first_name" id="lbl_longitude">Longitude </label>
                                  <input name="id" id="id_edit" type="hidden">
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
          $("#lbl_nama,#lbl_alamat,#lbl_pengelola,#lbl_telp,#lbl_latitude,#lbl_longitude").addClass("active");

          var alamat = $(this).attr('data-alamat');
          var nama = $(this).attr('data-nama');
          var id = $(this).attr('data-id');
          var telp = $(this).attr('data-telp');
          var pengelola = $(this).attr("data-pengelola");
          var latitude = $(this).attr("data-latitude");
          var longitude = $(this).attr("data-longitude");

          $("#alamat").val(alamat); $("#nama").val(nama);
          $("#id_edit").val(id); $("#telp").val(telp);
          $("#pengelola").val(pengelola); $("#latitude").val(latitude);
          $("#longitude").val(longitude);

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
           url: "<?php echo base_url()?>ms_wisata/get_wisata/<?php echo $id_md5?>",
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
