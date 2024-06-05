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
                        <h4 class="header2">Ubah Master Bencana</h4>
                        <div class="row">
                          <form class="col s12" id="formValidate" enctype="multipart/form-data"  action="<?php echo base_url()?>ms_bencana/proses_edit" method="post">
                            <div class="row">
                              <div class="input-field col s12">
                                <i class="mdi-action-account-circle prefix"></i>
                                <input id="name3" name="nama" type="text" value="<?php echo $data->nama?>" data-error=".errorTxt1">
                                <input name="id" type="hidden" value="<?php echo $data->id?>" hidden>
                                <div class="errorTxt1"></div>
                                <label for="first_name">Nama Bencana</label>
                              </div>
                            </div>

                            <div class="row">
                              <div class="input-field col s12">
                                <i class="mdi-action-question-answer prefix"></i>
                                <textarea id="message3" name="keterangan" class="materialize-textarea" data-error=".errorTxt2"><?php echo $data->deskripsi?></textarea>
                                <div class="errorTxt2"></div>
                                <label for="message">Keterangan</label>
                              </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s2 m1 l1">
                                  <i class="mdi-action-question-answer prefix"></i>
                                  <label for="password" id="lbl_lat" class=""><b>Icon</b></label>
                                </div>
                                <div class="input-field col s10 m5 l5" >
                                  <input id="file-1" class="" type="file" name="foto" data-show-upload="false" data-show-remove="false" data-error=".errorTxt3">
                                  <div class="errorTxt3"></div>
                                </div>
                            </div>
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

       $(document).on('click', '.kv-file-remove', function (e) {
          $(".file-preview,.file-caption").fadeOut(700);
        });
        $(document).on('click', '.btn-file', function (e) {
          $(".file-preview,.file-caption").fadeIn(4000);
         });

       $("#file-1").fileinput({
            'allowedFileExtensions' : ['ico', 'png'],
            maxFileSize: 40,
            maxFileCount: 1,
            showUpload: false,
            <?php if($data->icon != ''){?> //jika dia ada icon
            initialPreview: [
                '<img src="<?php echo base_url()?>uploads/bencana/<?php echo $data->icon?>" class="file-preview-image">',
            ],
            initialPreviewConfig: [
                {
                  caption: "<?php echo $data->icon?>",
                  width: "120px",
                  url: '<?php echo base_url()?>ms_bencana/delete_pict/<?php echo md5($data->id).'/'.$data->icon?>',
                  key : <?php echo $data->id?>,
                  showDelete: false,
                },
            ],

            // deleteUrl: "/site/file-delete",
            overwriteInitial: false,
            initialCaption: "<?php echo $data->icon.' ( Harap menekan icon `X` untuk menghapus gambar )'?>"
            <?php } ?>
        });


    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
