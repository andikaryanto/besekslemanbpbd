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
                      <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>Tr_approval/proses_detail" method="post">
                      <div class="card-panel" style="margin-bottom:30px;">
                        <h4 class="header2" style="text-align : center;">Transaksi Persetujuan Laporan <?php echo $kejadian->nama_bencana?></h4>
                        <!-- <h4 class="header2">Transaksi Persetujuan Laporan <?php echo $kejadian->nama_bencana?></h4> -->
                        <div class="row">

                            <div class="row" style="margin-bottom:15px;">
                              <div class="input-field col m4 s12">
                                <?php $status = array("belum_di_tangani", "proses", "hold", "selesai");?>
                                <select name="status" required  data-error=".errorTxt12">
                                  <option value="" disabled selected> -- Status Laporan --</option>
                                  <?php foreach($status as $row){ ?>
                                  <option value="<?php echo $row?>"><?php echo str_replace("_", " ", $row)?></option>
                                <?php } ?>
                                </select>
                                <div class="warna_error errorTxt12"></div>
                              </div>
                              <div class="input-field col m8 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="dampak"  type="text" value="<?php echo (!isset($kejadian->dampak) ? '' : $kejadian->dampak); ?>" name="dampak" required data-error=".errorTxt26">
                                <label for="first_name">Rangkuman Dampak</label>
                                <div class="warna_error errorTxt26"></div>
                              </div>
                            </div>
                          </div>
                        </div>

                            <div class="card-panel" style="margin-bottom:30px;">
                            <h4 class="header" style="text-align : center; margin-top:15px; margin-bottom:0px;">Dampak Kerusakan</h4>
                            <div class="row" style="margin-top:15px;">
                              <div class="input-field col m4 s12" style="padding-left:55px; width:29%;">
                                <!-- <i class="mdi-action-account-circle prefix"></i> -->
                                <select id="kerusakan" class="select"  data-error=".errorTxt1">
                                  <option value="" disabled selected> -- Pilih Dampak Kerusakan --</option>
                                  <?php foreach($dampak as $row){ ?>
                                  <option value="<?php echo $row->idtbldampak?>" data-nama="<?php echo $row->nama?>"><?php echo $row->nama. " (".$row->satuan.')'?></option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt1 warna_error"></div>
                              </div>
                              <div class="input-field col m1">
                              </div>
                              <div class="input-field col m2 s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="jumlah" type="number" data-error=".errorTxt2">
                                <div class="errorTxt2 warna_error"></div>
                                <label for="first_name">Jml Dampak</label>
                              </div>

                              <input name="idtbllaporan" value="<?php echo $kejadian->idtbllaporan?>" type="hidden">

                                <div class="input-field col m4 s12">
                                  <button class="btn waves-effect waves-light light-green darken-4" type="button" id="add">Tambah ke table Dampak
                                    <i class="mdi-editor-border-color right"></i>
                                  </button>
                                </div>
                            </div>

                              <div class="row" style="margin:20px;">
                                  <div class="row" style="margin-bottom:50px;">
                                    <div class="col s12 m12 l12">
                                      <table id="example" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                                      <thead>
                                          <tr>
                                              <th style="width: 10%;">Nama Kerusakan</th>
                                              <th style="width: 7%;">Jumlah</th>
                                              <th style="width: 7%;">Aksi</th>
                                          </tr>
                                      </thead>
                                      <tbody id="table_body">

                                      </tbody>
                                  </table>
                                    </div>
                                  </div>
                              </div>
                            </div>

                            <div class="card-panel" style="margin-bottom:30px;">

                              <h4 class="header" style="text-align : center; margin-top:15px; margin-bottom:0px;">Korban Jiwa (KK)</h4>
                              <div class="row" style="margin-top:15px;">
                                <div class="input-field col m4 s12">
                                  <i class="mdi-action-account-circle prefix"></i>
                                  <input name="rangkuman_korban" type="text" required data-error=".errorTxt16">
                                  <label for="first_name">Keterangan Korban jiwa</label>
                                  <div class="warna_error errorTxt16"></div>
                                </div>
                              </div>

                              <div class="row">
                                <div class="input-field col m4 s12" style="padding-left:55px; width:29%;">
                                  <select id="kk" class="select"  data-error=".errorTxt31">
                                    <option value="" disabled selected> -- Pilih Kepala Keluarga --</option>
                                    <?php foreach($kk as $row){ ?>
                                    <option value="<?php echo $row->idtblkk?>" data-nama="<?php echo $row->nama?>"><?php echo $row->nama?></option>
                                  <?php } ?>
                                  </select>
                                  <div class="errorTxt31 warna_error"></div>
                                </div>

                                <div class="input-field col m1 s12"> </div>
                                  <div class="input-field col m4 s12">
                                    <button class="btn waves-effect waves-light deep-purple" type="button" id="add_kk">Tambah ke table KK
                                      <i class="mdi-editor-border-color right"></i>
                                    </button>
                                  </div>
                              </div>

                                <div class="row" style="margin:20px;">
                                    <div class="row" style="margin-bottom:50px;">
                                      <div class="col s12 m12 l12">
                                        <table id="example_kk" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%;">Nama Kepala KK</th>
                                                <th style="width: 7%;">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table_body_kk">

                                        </tbody>
                                    </table>
                                      </div>
                                    </div>
                                </div>

                              <div class="row">
                                <div class="col s12 m12 l12">
                                  <div class="input-field col m4 s12">
                                    <button class="btn cyan waves-effect waves-light " id="proses" type="button">Proses
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

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START FOOTER -->
    <?php include("inc/footer.php") ?>
    <!-- END FOOTER -->

    <style>
    td{
      padding: 2px 5px;
    }
    </style>
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
       $("#add").click(function(e){
         var kerusakan = $("#kerusakan").val();
         var nama_kerusakan = $("#kerusakan").find(":selected").data("nama");

         $("#kerusakan").select2("val", "");

         var jumlah = $("#jumlah").val();
         var id = $('#example tr:last').attr('id');
         if(isNaN(id)){
           id = 0;
         }
         var count = parseInt(id) + 1;

         if(kerusakan == '' || jumlah == ''){
           alert("data tidak boleh kosong");
         }else{
           $("#table_body").append("<tr id='"+count+"'><td>"+nama_kerusakan+"</td><td><input name='jumlah[]' type='number' style='height:2rem;' value='"+jumlah+"'/> <input hidden name='kerusakan[]' value='"+kerusakan+"'/></td><td><button class='btn waves-effect red darken-4 hapus' type='button' data-class='"+count+"' >Hapus</button> </td></tr>");
           $("#kerusakan").val("");
           $("#jumlah").val("");
         }

       });

       $("#add_kk").click(function(e){
         var kk = $("#kk").val();
         var nama_kk = $("#kk").find(":selected").data("nama");

         $("#kerusakan").select2("val", "");

         var id = $('#example_kk tr:last').attr('id');
         if(isNaN(id)){
           id = 0;
         }
         var count = parseInt(id) + 1;

         if(kk == ''){
           alert("data tidak boleh kosong");
         }else{
           $("#table_body_kk").append("<tr id='kk"+count+"'><td>"+nama_kk+" <input hidden name='kk[]' value='"+kk+"'/></td><td><button class='btn waves-effect red darken-4 hapus_kk' type='button' data-class='"+count+"' >Hapus</button> </td></tr>");
         }

       });

       $(document).on('click', '.hapus', function () {
          var id_class = $(this).attr('data-class');
          $('#'+id_class).remove();
      });

      $(document).on('click', '.hapus_kk', function () {
         var id_class = $(this).attr('data-class');
         $('#kk'+id_class).remove();
     });

      $("#proses").click(function(a){
        a.preventDefault();
        var tbody = $("#example tbody");
        var tbody_kk = $("#example_kk tbody");

        if(tbody.children().length == 0){
          alert("tidak ada data kejadian");
        }else{
          // console.log($("#table_body").html());
          $("#formValidate").submit();
        }
      });
    </script>

</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
