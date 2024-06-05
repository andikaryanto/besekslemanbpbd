<div id="loader-wrapper">
	<div id="loader"></div>
	<div class="loader-section section-left"></div>
	<div class="loader-section section-right"></div>
</div>
<!-- End Page Loading -->

<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START HEADER -->
<header id="header" class="page-topbar">
	<!-- start header nav-->
	<div class="navbar-fixed">
		<nav class="navbar-color">
			<div class="nav-wrapper">
				<ul class="left">
					<!-- <li><a href="javascript:void(0);" id="disable" data-show='true' class="waves-effect waves-block waves-light"><i class="mdi-action-list"></i></a> -->
					<a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i class="mdi-navigation-menu"></i></a>
					</li>
				  <li><h5 class="logo-wrapper"><a href="<?php echo base_url()?>" class="brand-logo darken-1"><img src="<?php echo base_url()?>assets/img/logo1.png" alt="materialize logo"></a> <span class="logo-text"></span></h1></li>
				</ul>
	

				<!--<div class="header-search-wrapper hide-on-med-and-down">
					<i class="mdi-action-search"></i>
					<input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Sleman"/>
				</div> -->

			
				<ul class="right hide-on-med-and-down">
					<!-- <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light translation-button"  data-activates="translation-dropdown"><img src="<?php echo base_url()?>assets/images/flag-icons/United-States.png" alt="USA" /></a>
					</li> -->
					<!-- <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen"><i class="mdi-action-settings-overscan"></i></a>
					</li> -->

					<!-- <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light notification-button" data-activates="notifications-dropdown"><i class="mdi-social-notifications"><small class="notification-badge">5</small></i> -->

					</a>
					</li>
					<?php if($this->session->userdata("idtbluser") != ''){?> <!--jika dia orang luar-->
					<li>
						<a href="#" data-activates="chat-out" class="waves-effect waves-block waves-light chat-collapse"><i class="mdi-action-account-circle"></i></a>
						<!-- <a href="#" class="waves-effect waves-block waves-light chat-collapse"><i class="mdi-action-account-circle"></i></a> -->
					</li>
				<?php } ?>
				</ul>
				<!-- translation-button -->
				<ul id="translation-dropdown" class="dropdown-content">
				  <li>
					<a href="#!"><img src="<?php echo base_url()?>assets/images/flag-icons/United-States.png" alt="English" />  <span class="language-select">English</span></a>
				  </li>
				  <li>
					<a href="#!"><img src="<?php echo base_url()?>assets/images/flag-icons/France.png" alt="French" />  <span class="language-select">French</span></a>
				  </li>
				  <li>
					<a href="#!"><img src="<?php echo base_url()?>assets/images/flag-icons/China.png" alt="Chinese" />  <span class="language-select">Chinese</span></a>
				  </li>
				  <li>
					<a href="#!"><img src="<?php echo base_url()?>assets/images/flag-icons/Germany.png" alt="German" />  <span class="language-select">German</span></a>
				  </li>

				</ul>
				<!-- notifications-dropdown -->
				<ul id="notifications-dropdown" class="dropdown-content">
				  <li>
					<h5>NOTIFICATIONS <span class="new badge">5</span></h5>
				  </li>
				  <li class="divider"></li>
				  <li>
					<a href="#!"><i class="mdi-action-add-shopping-cart"></i> A new order has been placed!</a>
					<time class="media-meta" datetime="2015-06-12T20:50:48+08:00">2 hours ago</time>
				  </li>
				  <li>
					<a href="#!"><i class="mdi-action-stars"></i> Completed the task</a>
					<time class="media-meta" datetime="2015-06-12T20:50:48+08:00">3 days ago</time>
				  </li>
				  <li>
					<a href="#!"><i class="mdi-action-settings"></i> Settings updated</a>
					<time class="media-meta" datetime="2015-06-12T20:50:48+08:00">4 days ago</time>
				  </li>
				  <li>
					<a href="#!"><i class="mdi-editor-insert-invitation"></i> Director meeting started</a>
					<time class="media-meta" datetime="2015-06-12T20:50:48+08:00">6 days ago</time>
				  </li>
				  <li>
					<a href="#!"><i class="mdi-action-trending-up"></i> Generate monthly report</a>
					<time class="media-meta" datetime="2015-06-12T20:50:48+08:00">1 week ago</time>
				  </li>
				</ul>
			</div>
		</nav>

		<!-- HORIZONTL NAV START-->
		 <nav id="horizontal-nav" class="white hide-on-med-and-down">
			<div class="nav-wrapper">
			  <ul id="ul-horizontal-nav" class="left hide-on-med-and-down" style="margin-left:15px;">
				<?php
				$group = $this->session->userdata("group");
			  $menu = $this->db->query("SELECT a.* FROM tblmenu a
											LEFT JOIN admin_access b ON b.`idtblmenu` = a.`idtblmenu`
											WHERE b.`idtblgroup` = '$group' AND b.view = '1'"); ?>
				<?php
						foreach($menu->result() as $mn) {
							if ($mn->parent == 0) {
								$cek_child = $this->db->where('parent', $mn->idtblmenu)->get('tblmenu')->num_rows();
				?>
				<li>
					<a class="<?php echo ($cek_child == 0) ? '' : 'dropdown-menu'; ?> cyan-text"  href="<?php echo base_url() . $mn->url ?>" class="cyan-text" data-activates="drop<?php echo $mn->idtblmenu ?>">
						<i class="<?php echo $mn->icon ?>"></i>
						<span><?php echo $mn->menu ?> <?php echo ($cek_child == 0) ? '' : '<i class="mdi-navigation-arrow-drop-down right"></i>'; ?></span>
					</a>
				</li>
			<?php } } ?>

					<?php if($this->session->userdata("idtbluser") == ''){?> <!--jika dia orang luar-->
					<!-- <li style="margin-right:15px;">
						<a class="cyan-text" href="<?php echo base_url()?>main/tambah">
							<i class="mdi-action-settings-phone"></i>
							<span>Lapor </span>
						</a>
					</li> -->
					<li>
						<a class="cyan-text" href="http://37.44.244.135:8080/mapstore/" target="_blank">
							<i class="mdi-communication-location-on"></i>
							<span>Web GIS</span>
						</a>
					</li>
					<li>
						<a class="cyan-text" href="http://bpbd-sleman.online/jpegpull.htm" target="_blank">
							<i class="mdi-av-videocam"></i>
							<span>CCTV Merapi </span>
						</a>
					</li>
					<li>
						
						<a class="cyan-text" href="<?php echo base_url()?>login">
							<i class="mdi-action-get-app"></i>
							<span>Login </span>
						</a>
				
					</li>
					
					<?php } ?>
			  </ul>
			</div>
		  </nav>

			<?php
					foreach($menu->result() as $mn) {
						if ($mn->parent == 0) {
			?>
			<ul id="drop<?php echo $mn->idtblmenu ?>" class="dropdown-content dropdown-horizontal-list">
				<?php
						foreach($menu->result() as $mn_child) {
							if ($mn->idtblmenu == $mn_child->parent) {
				?>
				<li><a href="<?php echo base_url() . $mn_child->url?>" class="cyan-text" style="padding-top:1px; padding-bottom:1px;"><?php echo $mn_child->menu ?></a></li>
			<?php }} ?>
			</ul>
		<?php }} ?>


	</div>
	<!-- end header nav-->
</header>

<script>
// ! function() {
//     ! function t() {
//         try {
//             ! function c(t) {
//                 (1 !== ("" + t / t).length || t % 20 === 0) && function() {}.constructor("debugger")(), c(++t)
//             }(0)
//         } catch (n) {
//             setTimeout(t, 1e3)
//         }
//     }()
// }();
</script>
