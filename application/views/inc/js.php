<!-- jQuery Library -->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-1.11.2.min.js"></script>
<!-- <script type="text/javascript" src="<?php echo base_url()?>assets/js/jquery.js"></script> -->
<!--materialize js-->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/materialize.min.js"></script>
<!--scrollbar-->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

<!--plugins.js - Some Specific JS codes for Plugin Settings-->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins.min.js"></script>
<!--custom-script.js - Add your own theme custom JS-->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/custom-script.js"></script>
<!-- Toast Notification -->
<script type="text/javascript">
// Toast Notification
// $(window).load(function() {
// 	setTimeout(function() {
// 		Materialize.toast('<span>Hiya! I am Elos Ananto.</span>', 1500);
// 	}, 1500);
// 	setTimeout(function() {
// 		Materialize.toast('<span>You can kiss me too!</span>', 3000);
// 	}, 5000);
// 	setTimeout(function() {
// 		Materialize.toast('<span>You have new order.</span><a class="btn-flat yellow-text" href="#">Read<a>', 3000);
// 	}, 15000);
// });
</script>
<!-- validationEngine -->
<script type="text/javascript" src="<?php echo base_url()?>assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>

<!-- fileinput -->
<script src="<?php echo base_url();?>assets/js/fileinput.min.js" type="text/javascript" charset="utf-8"></script>

<script>
	$(document).ready(function() {
		// (".formID").validationEngine();

		$("#disable").click(function(e){
				var data_show = $(this).attr("data-show");
				if (data_show == 'true') {
					$("#horizontal-nav").hide();
					$(this).attr("data-show", "false");
					$("#header").css("height", "1px");
				}else{
					$("#horizontal-nav").show();
					$(this).attr("data-show", "true");
					$("#header").css("height", "64px");
				}
		});
		
		
    $.validator.setDefaults({
           ignore: []
    });
	});
</script>
