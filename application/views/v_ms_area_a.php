<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Main design
	Version: 1
	Author: Elos
================================================================================ -->


<head>
    <?php include('inc/css.php') ?>
</head>

<body id="layouts-horizontal">
    <!-- Start Page Loading -->
    <?php include("inc/header.php") ?>
    <!-- END HEADER -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START MAIN -->
    <div id="main" style="margin-bottom: 306px;">
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
                        <h4 class="header2">Tambah Master <?php echo $table ?></h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_area/proses_tambah" method="post">
                            <div class="row">
                              <div class="input-field col s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="nama" type="text" data-error=".errorTxt1">
                                <input name="table" type="hidden" value="<?php echo $table ?>">
                                <input name="id" type="hidden" value="<?php echo $id ?>">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Nama Area</label>
                              </div>
                              <div class="input-field col s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="nama_pejabat" type="text" data-error=".errorTxt1">
                                <input name="table" type="hidden" value="<?php echo $table ?>">
                                <input name="id" type="hidden" value="<?php echo $id ?>">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Nama Pejabat</label>
                              </div>
                              <div class="input-field col s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="alamat" type="text" data-error=".errorTxt1">
                                <input name="table" type="hidden" value="<?php echo $table ?>">
                                <input name="id" type="hidden" value="<?php echo $id ?>">
                                <div class="errorTxt1"></div>
                                <label for="first_name">Alamat</label>
                              </div>
                              <div class="input-field col s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="notelp" type="text" data-error=".errorTxt1">
                                <input name="table" type="hidden" value="<?php echo $table ?>">
                                <input name="id" type="hidden" value="<?php echo $id ?>">
                                <div class="errorTxt1"></div>
                                <label for="first_name">No Telephone/ Hp</label>
                              </div>
                            </div>
                            <?php if($table == 'tbldusun'){ ?>
                            <div class="row">
                              <div class="input-field col s6">
                                <select name="krb" required title="Harap Di pilih" data-error=".errorTxt3">
                                  <option value="" disabled selected> -- Pilih KRB --</option>
                                  <?php if(isset($krb)){ ?>
                                  <?php foreach($krb as $row){ ?>
                                  <option value="<?php echo $row->idtblkrb?>"><?php echo $row->nama ?></option>
                                <?php } ?>
                                <option value="">Tidak</option>
                                <?php } ?>
                                </select>
                                <div class="errorTxt3"></div>
                              </div>
                              <div class="input-field col s6">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="radius_merapi" type="text" data-error=".errorTxt12">
                                <div class="errorTxt12"></div>
                                <label for="first_name">Radius Merapi (KM)</label>
                              </div>
                            </div>
                            <?php } ?>
                              <div class="row">
                                <div class="input-field col s12">
                                  <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
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
    <script>
    $("#formValidate").validate({
      rules: {
          nama: {
              required: true,
              minlength: 5
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

       $("#file-1").fileinput({
            'allowedFileExtensions' : ['ico', 'png'],
            maxFileSize: 40,
            maxFileCount: 1,
            showUpload: false,
        });
    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
