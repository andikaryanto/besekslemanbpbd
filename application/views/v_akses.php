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
                          <!-- <p> -->
                    <!-- </p> -->
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_group/proses_akses" method="post">
                            <input type="text" hidden="hidden" name="id_md5" value="<?php echo $id_md5?>">
                            <table>
                              <thead>
                                  <tr>
                                      <th style="width: 10%;">Nama</th>
                                      <th style="width: 10%;">view</th>
                                      <th style="width: 10%;">Add</th>
                                      <th style="width: 10%;">Edit</th>
                                      <th style="width: 7%;">Delete</th>
                                  </tr>
                              </thead>
                              <tbody>
                              <?php $x = 1; foreach($menux as $row){ ?>
                                <tr>
                                    <td style="width: 10%;"><label for="test5"><?php echo $row->menu?></label></td>
                                    <td style="width: 10%;">
                                      <p>
                                        <input type="checkbox" name="v<?php echo $x?>" id="v<?php echo $x?>"
                                        <?php foreach($akses as $rows){ ?>
                                          <?php if($row->idtblmenu == $rows->idtblmenu && $rows->view == '1'){ ?>
                                            checked="checked"
                                          <?php } ?>
                                        <?php } ?>
                                        />
                                        <label for="v<?php echo $x?>"></label>
                                      </p>
                                    </td>
                                    <td style="width: 10%;">
                                      <input type="checkbox" name="a<?php echo $x?>" id="a<?php echo $x?>"
                                      <?php foreach($akses as $rows){ ?>
                                        <?php if($row->idtblmenu == $rows->idtblmenu && $rows->add == '1'){ ?>
                                          checked="checked"
                                        <?php } ?>
                                      <?php } ?>
                                      />
                                      <label for="a<?php echo $x?>"></label>
                                    </td>
                                    <td style="width: 10%;">
                                      <input type="checkbox" name="e<?php echo $x?>" id="e<?php echo $x?>"
                                      <?php foreach($akses as $rows){ ?>
                                        <?php if($row->idtblmenu == $rows->idtblmenu && $rows->update == '1'){ ?>
                                          checked="checked"
                                        <?php } ?>
                                      <?php } ?>
                                      />
                                      <label for="e<?php echo $x?>"></label>
                                    </td>
                                    <td style="width: 10%;">
                                      <input type="checkbox" name="d<?php echo $x?>" id="d<?php echo $x?>"
                                      <?php foreach($akses as $rows){ ?>
                                        <?php if($row->idtblmenu == $rows->idtblmenu && $rows->delete == '1'){ ?>
                                          checked="checked"
                                        <?php } ?>
                                      <?php } ?>
                                      />
                                      <label for="d<?php echo $x?>"></label>
                                    </td>
                            <?php $x++; } ?>
                            </tbody>
                          </table>
                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit">Submit
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
