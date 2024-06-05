<!DOCTYPE html>
<html lang="en">

<!--================================================================================
	Item Name: Master ssb
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
              <div id="padding">
                    <?php include("inc/info.php") ?>
              </div>
              <!--chart dashboard end-->
                <!--start container-->
                <div class="container">
                  <div class="row">
                    <!-- <div class="input-field col s4"></div> -->
                    <div class="input-field col s4">
                      <i class="mdi-action-account-circle prefix"></i>
                      <select style="" name="status" id="status" class="select" required  data-error=".errorTxt2">
                        <option value="" disabled selected> -- Pilih data Laporan --</option>
                        <option value="0"> Baru </option>
                        <option value="2"> Palsu </option>
                        <option value="1"> Nyata </option>
                        <!-- <option value="0,1,2"> Semua Data </option> -->
                      </select>
                    </div>

                    <div class="input-field col s4">
                      <div class="input-field col s12">
                        <button class="btn cyan waves-effect waves-light" type="button" id="btn">Lihat Data</button>
                      </div>
                    </div>
                  </div>
                  <div class="divider"></div>
                  <div class="row">
                    <div id="table-datatables">
                      <h4 class="header" style="text-align : center; margin-top:15px; margin-bottom:0px;">Data Laporan</h4>
                      <div class="row" style="margin-bottom:120px;">
                        <div class="col s12 m12 l12">
                          <table id="example" class="table table-condensed table-hover datatable" cellspacing="0" width="100%">
                          <thead>
                              <tr>
                                  <th style="width: 4%;">ID</th>
                                  <th style="width: 10%;">Nama Pelapor</th>
                                  <th style="width: 5%;">No Telephone</th>
                                  <th style="width: 7%;">Kelurahan</th>
                                  <th style="width: 7%;">Dusun</th>
                                  <th style="width: 7%;">RT & RW</th>
                                  <th style="width: 7%;">Bencana</th>
                                  <th style="width: 7%;">Tanggal & Waktu Kejadian</th>
                                  <th style="width: 7%;">Gallery & Map</th>
                                  <th style="width: 5%;">Status</th>
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

                    <div id="modal5" class="modal bottom-sheet" style="max-height:75%">
                      <div class="modal-content">
                        <div class="row">
                          <div class="col s12 m8 l8">
                            <h4 id="modal_title">Modal Header </h4>
                          </div>
                          <div class="col s12 m4 l4">
                            <a class="right btn waves-effect waves-light blue modal-close" type="submit" style="margin-left:5px;">Tutup <i class="mdi-content-clear right"></i></a>
                          </div>
                        </div>
                        <ul class="collection">
                          <li class="collection-item avatar">
                            <div id="mapCanvas_e">

                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>

                    <div id="modal_icon" class="modal">
                      <div class="modal-header">
                          <h4 class="modal-title" id="title_foto" style="text-align:center;"></h4>
                      </div>
                      <hr />
                      <div class="modal-content">
                        <div class="col s12 m12 l12">
                          <div class="sliders">
                            <ul class="slides">

                            </ul>
                          </div>

                        </div>
                      </div>
                      <div class="modal-footer">
                        <a class="btn waves-effect waves-light blue modal-close" type="submit" style="margin-left:5px;">Tutup <i class="mdi-content-clear right"></i></a>
                      </div>
                    </div>
                    <!--card widgets end-->

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
    <?php include("inc/footer.php") ?>
    <!-- END FOOTER -->


    <!-- ================================================
    Scripts
    ================================================ -->
    <?php include("inc/js.php") ?>
    <style>
      #mapCanvas_e {
        width: 100%;
        height: 400px;
        float: left;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?&libraries=places&key=AIzaSyBFA8EZF7jraTiiwDRyfRTiMnxD67-g0cE"></script>
    <script>

      var map;
      function elos_ganteng(latitude, longitude) {
        //console.log(latitude+'_'+longitude);
        if(latitude == ''){
          latitude = '-7.724537'; longitude = '110.3499186';
        }

          console.log(latitude+'_'+longitude);
          var myLatlng = new google.maps.LatLng(latitude, longitude);

          var myOptions = {
              zoom: 13,
              center: myLatlng,
              mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          map = new google.maps.Map(document.getElementById("mapCanvas_e"), myOptions);

          var marker = new google.maps.Marker({
              draggable: false,
              position: myLatlng,
              map: map,
              title: "Your location"
          });

      }
      // google.maps.event.addDomListener(window, "load", initialize());
    </script>
    <!-- data-tables -->
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/data-tables/js/jquery.dataTables.min.js"></script>
    <!-- <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/data-tables/data-tables-script.js"></script> -->
    <script>
    // $('.modal').modal();
    var link = "<?php echo base_url()?>";

    $("#a").click(function(a){
        $('#modal1').openModal();
    });

    $(".link_delete").click(function(a){
        a.preventDefault();
        $('#modal1').openModal();
    });

    $(document).on('click', '.aksi', function (e) {
        var link = $(this).attr('href');
        var nama = $(this).attr('data-nama');
        var status = $(this).attr("data-status");

        if (status == '1') {
          $(".nama-delete").text("Konfirmasi Konversi Laporan "+nama);
          $(".nama-delete").css("color", "green");
        }else if (status == '2') {
          $(".nama-delete").text("Konfirmasi Pemalsuan Laporan "+nama);
          $(".nama-delete").css("color", "red");
        }else{
          $(".nama-delete").text("Konfirmasi Edit Laporan "+nama);
          $(".nama-delete").css("color", "purple");
        }
         $("#button-modal-delete").attr('href',link);
         $('#modal1').openModal();
        e.preventDefault();
     });

     $(document).on('click', '.link_foto', function (e) {
          var id = $(this).attr('data-id');
          var nama = $(this).attr('data-nama');
          $('.slides').html("");
          $.ajax({
             type: "POST",
             url: "<?php echo base_url();?>tr_approval/get_image",
             data: "idtbl="+id,
             success: function(data){
                 var opt = data;
                 $('.slides').append(opt);
             }

         });
          $("#title_foto").html("Foto Laporan "+nama);
          $('#modal_icon').openModal();
         e.preventDefault();
      });

      var table = $("#example").DataTable({
        "bInfo": false,
      });
      $("#btn").click(function(e){
        table.clear().draw();
        var data = $("#status").val();

        var pilihan =
          $.ajax({
             type: "POST",
             url: "<?php echo base_url();?>tr_approval/get_data",
             dataType : 'json',
             data: "status="+data,
             success: function(data){
               var x = 0; var status = ''; var aksi = '';
               if(data.length > 0){
                 for(z=0;z<data.length;z++){
                   var obj = data[z];


                   if (obj['flag'] == '0') {
                     status = "Baru";
                     aksi = ''+
                     '<a href="'+link+'main/edit/'+MD5(obj['idtbllaporan'])+'" data-nama="'+obj["nama"]+'" data-status="3" class="green aksi btn-small btn "> <i class="mdi-editor-mode-edit"></i></a>'+
                     <?php if($akses['update'] == '1'){?>
                       '<a href="'+link+'tr_approval/proses/'+MD5(obj['idtbllaporan'])+'/1" data-nama="'+obj["nama"]+'" data-status="1" class="blue aksi btn-small btn "> <i class="mdi-action-done"></i></a>'+
                     <?php } ?>
                     <?php if($akses['delete'] == '1'){?>
                     '<a href="'+link+'tr_approval/proses/'+MD5(obj['idtbllaporan'])+'/2" data-nama="'+obj["nama"]+'" data-status="2" class="red aksi btn-small btn "> <i class="mdi-communication-dnd-on"></i></a>';
                     <?php }else{?>
                       '';
                     <?php } ?>
                   }else if (obj['flag'] == '1') {
                     status = "Nyata";
                     aksi = '<a href="'+link+'main/edit/'+MD5(obj['idtbllaporan'])+'" data-nama="'+obj["nama"]+'" data-status="3" class="green aksi btn-small btn "> <i class="mdi-editor-mode-edit"></i></a>';
                   }else{
                     status = "Palsu";
                     aksi = '<a href="'+link+'main/edit/'+MD5(obj['idtbllaporan'])+'" data-nama="'+obj["nama"]+'" data-status="3" class="green aksi btn-small btn "> <i class="mdi-editor-mode-edit"></i></a>';
                   }

                    table.row.add( [
                      '<td>'+obj['idtbllaporan']+'</td>',
                      '<td>'+obj['nama_user']+'</td>',
                      '<td>'+obj['telp']+'</td>',
                      '<td>'+obj['nama_kelurahan']+'</td>',
                      '<td>'+obj['nama_dusun']+'</td>',
                      '<td> RT '+obj['rt']+' / RW '+obj['rw']+'</td>',
                      '<td>'+obj['nama_bencana']+'</td>',
                      '<td>'+obj['tgl_kejadian']+'</td>',
                      '<td><a href="#" data-id="'+MD5(obj['idtbllaporan'])+'" data-nama="'+obj['nama_user']+'" class="btn-small btn link_foto deep-purple" ><i class="mdi-image-photo-camera"></i></a>'+
                           '<a href="#" data-latitude="'+obj['latitude']+'" data-longitude="'+obj['longitude']+'" data-nama="'+obj['nama']+'" class="btn-small btn link_map teal"><i class="mdi-action-room"></i></a></td>',
                      '<td>'+status+' & '+obj['status']+'</td>',
                      '<td>'+aksi+'</td>',
                    ] ).draw( false );
                    // console.log(obj['kode_barang']);
                 }
               }else{
                 alert("data kosong");
               }
             }
         });
      });

      var MD5 = function(s){function L(k,d){return(k<<d)|(k>>>(32-d))}function K(G,k){var I,d,F,H,x;F=(G&2147483648);H=(k&2147483648);I=(G&1073741824);d=(k&1073741824);x=(G&1073741823)+(k&1073741823);if(I&d){return(x^2147483648^F^H)}if(I|d){if(x&1073741824){return(x^3221225472^F^H)}else{return(x^1073741824^F^H)}}else{return(x^F^H)}}function r(d,F,k){return(d&F)|((~d)&k)}function q(d,F,k){return(d&k)|(F&(~k))}function p(d,F,k){return(d^F^k)}function n(d,F,k){return(F^(d|(~k)))}function u(G,F,aa,Z,k,H,I){G=K(G,K(K(r(F,aa,Z),k),I));return K(L(G,H),F)}function f(G,F,aa,Z,k,H,I){G=K(G,K(K(q(F,aa,Z),k),I));return K(L(G,H),F)}function D(G,F,aa,Z,k,H,I){G=K(G,K(K(p(F,aa,Z),k),I));return K(L(G,H),F)}function t(G,F,aa,Z,k,H,I){G=K(G,K(K(n(F,aa,Z),k),I));return K(L(G,H),F)}function e(G){var Z;var F=G.length;var x=F+8;var k=(x-(x%64))/64;var I=(k+1)*16;var aa=Array(I-1);var d=0;var H=0;while(H<F){Z=(H-(H%4))/4;d=(H%4)*8;aa[Z]=(aa[Z]| (G.charCodeAt(H)<<d));H++}Z=(H-(H%4))/4;d=(H%4)*8;aa[Z]=aa[Z]|(128<<d);aa[I-2]=F<<3;aa[I-1]=F>>>29;return aa}function B(x){var k="",F="",G,d;for(d=0;d<=3;d++){G=(x>>>(d*8))&255;F="0"+G.toString(16);k=k+F.substr(F.length-2,2)}return k}function J(k){k=k.replace(/rn/g,"n");var d="";for(var F=0;F<k.length;F++){var x=k.charCodeAt(F);if(x<128){d+=String.fromCharCode(x)}else{if((x>127)&&(x<2048)){d+=String.fromCharCode((x>>6)|192);d+=String.fromCharCode((x&63)|128)}else{d+=String.fromCharCode((x>>12)|224);d+=String.fromCharCode(((x>>6)&63)|128);d+=String.fromCharCode((x&63)|128)}}}return d}var C=Array();var P,h,E,v,g,Y,X,W,V;var S=7,Q=12,N=17,M=22;var A=5,z=9,y=14,w=20;var o=4,m=11,l=16,j=23;var U=6,T=10,R=15,O=21;s=J(s);C=e(s);Y=1732584193;X=4023233417;W=2562383102;V=271733878;for(P=0;P<C.length;P+=16){h=Y;E=X;v=W;g=V;Y=u(Y,X,W,V,C[P+0],S,3614090360);V=u(V,Y,X,W,C[P+1],Q,3905402710);W=u(W,V,Y,X,C[P+2],N,606105819);X=u(X,W,V,Y,C[P+3],M,3250441966);Y=u(Y,X,W,V,C[P+4],S,4118548399);V=u(V,Y,X,W,C[P+5],Q,1200080426);W=u(W,V,Y,X,C[P+6],N,2821735955);X=u(X,W,V,Y,C[P+7],M,4249261313);Y=u(Y,X,W,V,C[P+8],S,1770035416);V=u(V,Y,X,W,C[P+9],Q,2336552879);W=u(W,V,Y,X,C[P+10],N,4294925233);X=u(X,W,V,Y,C[P+11],M,2304563134);Y=u(Y,X,W,V,C[P+12],S,1804603682);V=u(V,Y,X,W,C[P+13],Q,4254626195);W=u(W,V,Y,X,C[P+14],N,2792965006);X=u(X,W,V,Y,C[P+15],M,1236535329);Y=f(Y,X,W,V,C[P+1],A,4129170786);V=f(V,Y,X,W,C[P+6],z,3225465664);W=f(W,V,Y,X,C[P+11],y,643717713);X=f(X,W,V,Y,C[P+0],w,3921069994);Y=f(Y,X,W,V,C[P+5],A,3593408605);V=f(V,Y,X,W,C[P+10],z,38016083);W=f(W,V,Y,X,C[P+15],y,3634488961);X=f(X,W,V,Y,C[P+4],w,3889429448);Y=f(Y,X,W,V,C[P+9],A,568446438);V=f(V,Y,X,W,C[P+14],z,3275163606);W=f(W,V,Y,X,C[P+3],y,4107603335);X=f(X,W,V,Y,C[P+8],w,1163531501);Y=f(Y,X,W,V,C[P+13],A,2850285829);V=f(V,Y,X,W,C[P+2],z,4243563512);W=f(W,V,Y,X,C[P+7],y,1735328473);X=f(X,W,V,Y,C[P+12],w,2368359562);Y=D(Y,X,W,V,C[P+5],o,4294588738);V=D(V,Y,X,W,C[P+8],m,2272392833);W=D(W,V,Y,X,C[P+11],l,1839030562);X=D(X,W,V,Y,C[P+14],j,4259657740);Y=D(Y,X,W,V,C[P+1],o,2763975236);V=D(V,Y,X,W,C[P+4],m,1272893353);W=D(W,V,Y,X,C[P+7],l,4139469664);X=D(X,W,V,Y,C[P+10],j,3200236656);Y=D(Y,X,W,V,C[P+13],o,681279174);V=D(V,Y,X,W,C[P+0],m,3936430074);W=D(W,V,Y,X,C[P+3],l,3572445317);X=D(X,W,V,Y,C[P+6],j,76029189);Y=D(Y,X,W,V,C[P+9],o,3654602809);V=D(V,Y,X,W,C[P+12],m,3873151461);W=D(W,V,Y,X,C[P+15],l,530742520);X=D(X,W,V,Y,C[P+2],j,3299628645);Y=t(Y,X,W,V,C[P+0],U,4096336452);V=t(V,Y,X,W,C[P+7],T,1126891415);W=t(W,V,Y,X,C[P+14],R,2878612391);X=t(X,W,V,Y,C[P+5],O,4237533241);Y=t(Y,X,W,V,C[P+12],U,1700485571);V=t(V,Y,X,W,C[P+3],T,2399980690);W=t(W,V,Y,X,C[P+10],R,4293915773);X=t(X,W,V,Y,C[P+1],O,2240044497);Y=t(Y,X,W,V,C[P+8],U,1873313359);V=t(V,Y,X,W,C[P+15],T,4264355552);W=t(W,V,Y,X,C[P+6],R,2734768916);X=t(X,W,V,Y,C[P+13],O,1309151649);Y=t(Y,X,W,V,C[P+4],U,4149444226);V=t(V,Y,X,W,C[P+11],T,3174756917);W=t(W,V,Y,X,C[P+2],R,718787259);X=t(X,W,V,Y,C[P+9],O,3951481745);Y=K(Y,h);X=K(X,E);W=K(W,v);V=K(V,g)}var i=B(Y)+B(X)+B(W)+B(V);return i.toLowerCase()};

     $(document).on('click', '.link_map', function (e) {
          var longitude = $(this).attr('data-longitude');
          var latitude = $(this).attr('data-latitude');
          var nama = $(this).attr('data-nama');
          $("#modal_title").text("Koordinat ssb : "+nama);
          elos_ganteng(latitude, longitude);
          // console.log(link+"_"+nama);
          // $("#data_icon").attr("src", "<?php echo base_url()?>uploads/ssb/"+icon);
          $('#modal5').openModal();
         e.preventDefault();
      });



    </script>
</body>


<!-- Mirrored from demo.geekslabs.com/materialize/v3.1/layout-horizontal-menu.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Sep 2017 01:45:31 GMT -->
</html>
