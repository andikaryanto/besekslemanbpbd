<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Main design
	Version: 1
	Author: Elos
================================================================================ -->


<head>
    <?php include('inc/css.php') ?>
    <link href="<?php echo base_url()?>assets/js/plugins/data-tables/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <style>
    .select-dropdown {margin-left: 3rem !important;width: calc(100% - 3rem) !important;}
    .warna_error {color:red;}
    .collapsible-body{margin:15px;}
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
                        <h4 class="header2">Detail Master kk : <b><?php echo $data->nama.' ('.$data->nokk.')'?></b></h4>

                        <ul class="collapsible popout collapsible-accordion active" data-collapsible="accordion">
                          <li>
                            <div class="collapsible-header active teal white-text"><i class="mdi-action-face-unlock"></i>Anggota Keluarga</div>
                            <div class="collapsible-body" style="margin:15px;">

                              <div class="row">
                                <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_kk/proses_anggota" method="post">
                                  <div class="row">
                                    <div class="input-field col m4 s12">
                                      <i class="mdi-action-account-circle prefix"></i>
                                      <input name="nama" type="text" required data-error=".errorTxt1">
                                      <div class="warna_error errorTxt1"></div>
                                      <label for="first_name">Nama</label>
                                    </div>
                                    <div class="input-field col m4 s12">
                                      <i class="mdi-action-account-circle prefix"></i>
                                      <?php $sel_status = array("suami", "istri", "anak", "cucu", "keponakan", "mertua", "menantu"); ?>
                                      <select style="" name="status" class="select" required  data-error=".errorTxt2">
                                        <option value="" disabled selected> -- pilih status  --</option>
                                        <?php foreach($sel_status as $row){ ?>
                                        <option value="<?php echo $row?>"><?php echo $row?></option>
                                      <?php } ?>
                                      </select>
                                      <div class="warna_error errorTxt2"></div>
                                      <!-- <label for="first_name">Status</label> -->
                                    </div>
                                    <div class="input-field col m4 s12">
                                      <?php $sel_jk = array("laki-laki", "perempuan")?>
                                      <select name="jenis_kelamin" class="select" required  data-error=".errorTxt5">
                                        <option value="" disabled selected> -- Pilih Jenis Kelamin --</option>
                                        <?php foreach($sel_jk as $row){ ?>
                                        <option value="<?php echo $row?>"><?php echo $row?></option>
                                      <?php } ?>
                                      </select>
                                      <div class="warna_error errorTxt5"></div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="input-field col m4 s12">
                                      <i class="mdi-action-account-circle prefix"></i>
                                      <input name="ktp" type="text" required data-error=".errorTxt7" >
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
                                      <?php $sel_kawin = array("belum_menikah", "menikah");?>
                                      <select name="status_kawin" class="select" required  data-error=".errorTxt12">
                                        <option value="" disabled selected> -- Status Perkawinan --</option>
                                        <?php foreach($sel_kawin as $row){ ?>
                                        <option value="<?php echo $row?>"><?php echo str_replace("_", " ", $row)?></option>
                                      <?php } ?>
                                      </select>
                                      <div class="warna_error errorTxt12"></div>
                                    </div>
                                  </div>
                                  <div class="row">

                                    <div class="input-field col m4 s12">
                                      <i class="mdi-action-account-circle prefix"></i>
                                      <input name="kewarganegaraan" type="text" required data-error=".errorTxt15">
                                      <div class="warna_error errorTxt15"></div>
                                      <label for="first_name">Kewarganegaraan</label>
                                    </div>

                                    <div class="input-field col m4 s12">
                                      <i class="mdi-action-account-circle prefix"></i>
                                      <input name="deskripsi" type="text" placeholder="kosongkan jika tidak ada keterangan">
                                      <label for="first_name">Keterangan Tambahan</label>
                                    </div>

                                    <div class="input-field col m4 s12">
                                    <input type="checkbox" name="disabilitas" id="test5" />
                                    <label for="test5">Disabilitas</label>
                                    </div>
                                  </div>

                                    <input name="type" value="1" type="hidden">
                                    <input name="id" value="<?php echo md5($data->idtblkk)?>" type="hidden">
                                    <div class="row">
                                      <div class="input-field col s12">
                                        <button value="tambah" class="btn cyan waves-effect waves-light left" type="submit" name="action">Simpan Anggota
                                          <i class="mdi-content-send right"></i>
                                        </button>
                                      </div>
                                    </div>
                                  </form>
                                </div>

                                <div class="row" style="margin:10px;">
                                  <table id="example" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%;">Nama</th>
                                            <th style="width: 7%;">No KTP</th>
                                            <th style="width: 7%;">TTL</th>
                                            <th style="width: 7%;">Gender</th>
                                            <th style="width: 7%;">Status</th>
                                            <th style="width: 7%;">Usia</th>
                                            <th style="width: 7%;">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <?php foreach($detail as $row){
                                        if($row->type == '1'){ //jika dia detail anggota keluarga
                                        ?>
                                        <tr>
                                            <td style="width: 10%;"><?php echo $row->nama?></td>
                                            <td style="width: 7%;"><?php echo $row->ktp?></td>
                                            <td style="width: 7%;"><?php echo $row->tempat_lahir.', '.date("d-m-Y", strtotime($row->tanggal_lahir));?></td>
                                            <td style="width: 7%;"><?php echo $row->jenis_kelamin?></td>
                                            <td style="width: 7%;"><?php echo $row->status?></td>
                                            <td style="width: 7%;"><?php
                                            $lahir = new DateTime($row->tanggal_lahir);
                                            $to   = new DateTime('today');
                                            $lahir->diff($to)->y == '0' ? $x = '< 0 Tahun' : $x = $lahir->diff($to)->y.' Tahun';
                                            echo $x;
                                             ?></td>
                                            <td style="width: 7%;">
                                              <div style="" class="btn-group">
                                              <a href="<?php echo base_url()?>ms_kk/edit_detail_anggota/<?php echo md5($row->id)?>" class="blue btn btn-small"><i class="mdi-editor-border-color"></i></a>
                                              <a href="<?php echo base_url()?>ms_kk/delete_anggota/<?php echo md5($row->id)?>" data-nama="<?php echo $row->nama ?>" class="btn-small btn link_delete"><i class=" mdi-navigation-cancel"></i></a> </div>
                                            </td>
                                        </tr>
                                      <?php } //end if
                                     } ?>
                                    </tbody>
                                </table>
                                </div>

                            </div>
                          </li>
                          <li>
                            <div class="collapsible-header orange white-text"><i class="mdi-notification-adb"></i>Ternak</div>
                            <div class="collapsible-body">
                              <div class="row">
                                <form class="col s12" id="formValidate2" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_kk/proses_anggota" method="post">

                                  <div class="row">
                                    <div class="input-field col m6 s12">
                                      <select name="ternak" class="select" required  data-error=".errorTxt91">
                                        <option value="" disabled selected> -- Pilih Ternak --</option>
                                        <?php foreach ($ternak as $row) { ?>
                                          <option value="<?php echo $row->idtblternak?>"><?php echo $row->nama ?></option>
                                        <?php } ?>
                                      </select>
                                      <div class="warna_error errorTxt91"></div>
                                    </div>
                                    <div class="input-field col m6 s12">
                                      <i class="mdi-action-account-circle prefix"></i>
                                      <input name="jml_ternak" type="number" min="1" required data-error=".errorTxt101">
                                      <div class="warna_error errorTxt101"></div>
                                      <label for="first_name">Jumlah Ternak</label>
                                    </div>

                                  </div>

                                    <input name="type" value="2" type="hidden">
                                    <input name="id" value="<?php echo md5($data->idtblkk)?>" type="hidden">
                                    <div class="row">
                                      <div class="input-field col s12">
                                        <button value="tambah" class="btn cyan waves-effect waves-light left" type="submit" name="action">Simpan Anggota
                                          <i class="mdi-content-send right"></i>
                                        </button>
                                      </div>
                                    </div>
                                  </form>
                                </div>
                              <table id="tbl_ternak" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="width: 10%;">Hewan Ternak</th>
                                        <th style="width: 7%;">Jumalah Ternak</th>
                                        <th style="width: 7%;">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <?php foreach($detail as $row){
                                    if($row->type == '2'){ //jika dia detail anggota keluarga
                                    ?>
                                    <tr>
                                        <td style="width: 10%;"><?php echo $row->nama_ternak?></td>
                                        <td style="width: 7%;"><?php echo $row->jml_ternak?></td>
                                        <td style="width: 7%;">
                                          <div style="" class="btn-group">
                                          <a href="<?php echo base_url()?>ms_kk/edit_ternak/<?php echo md5($row->id)?>" class="blue btn btn-small"><i class="mdi-editor-border-color"></i></a>
                                          <a href="<?php echo base_url()?>ms_kk/delete_ternak/<?php echo md5($row->id)?>" data-nama="<?php echo $row->nama_ternak ?>" class="btn-small btn link_delete"><i class=" mdi-navigation-cancel"></i></a> </div>
                                        </td>
                                    </tr>
                                  <?php } //end if
                                 } ?>
                                </tbody>
                              </table>
                            </div>
                          </li>

                        </ul>


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
    <script>

    $.validator.setDefaults({
           ignore: []
    });
    $("#formValidate2").validate({
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

       $("#example,#tbl_ternak").dataTable({
         "bInfo": false,
       });


       $(".link_delete").click(function(e){
           var link = $(this).attr('href');
           var nama = $(this).attr('data-nama');
           $(".nama-delete").text("Konfirmasi Delete Data "+nama);
           $("#button-modal-delete").attr('href',link);
           $('#modal1').openModal();
           e.preventDefault();
          //  a.preventDefault();
          //  $('#modal1').openModal();
       });

    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
