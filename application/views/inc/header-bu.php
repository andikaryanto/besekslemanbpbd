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
				  <li><h1 class="logo-wrapper"><a href="index.html" class="brand-logo darken-1"><img src="<?php echo base_url()?>assets/img/logo.png" alt="materialize logo"></a> <span class="logo-text">Materialize</span></h1></li>
				</ul>
				<div class="header-search-wrapper hide-on-med-and-down">
					<i class="mdi-action-search"></i>
					<input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Sleman"/>
				</div>

				<ul class="right">
					<!-- <li><a href="javascript:void(0);" id="disable" data-show='true' class="waves-effect waves-block waves-light"><i class="mdi-action-list"></i></a> -->
					<a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i class="mdi-navigation-menu"></i></a>
					</li>
				  <li><h1 class="logo-wrapper"><a href="index.html" class="brand-logo darken-1"><img src="<?php echo base_url()?>assets/img/logo.png" alt="materialize logo"></a> <span class="logo-text">Materialize</span></h1></li>
				</ul>
				<ul class="right hide-on-med-and-down">
					<!-- <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light translation-button"  data-activates="translation-dropdown"><img src="<?php echo base_url()?>assets/images/flag-icons/United-States.png" alt="USA" /></a>
					</li> -->
					<!-- <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen"><i class="mdi-action-settings-overscan"></i></a>
					</li> -->

					<!-- <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light notification-button" data-activates="notifications-dropdown"><i class="mdi-social-notifications"><small class="notification-badge">5</small></i> -->

					</a>
					</li>
					<li>
						<a href="#" data-activates="chat-out" class="waves-effect waves-block waves-light chat-collapse"><i class="mdi-action-account-circle"></i></a>
						<!-- <a href="#" class="waves-effect waves-block waves-light chat-collapse"><i class="mdi-action-account-circle"></i></a> -->
					</li>
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
			  <ul id="ul-horizontal-nav" class="left hide-on-med-and-down" >
					<?php $menu_header = $this->db->get_where("tblmenu", array("parent" => "0"))->result();?>
				<?php foreach($menu_header as $row){?>
					<li>
						<a href="<?php echo $row->url == "#" ? '#!' : base_url().$row->url?>" class="dropdown-menu cyan-text" data-activities="<?php echo $row->idtblmenu?>">
							<i class="<?php echo $row->icon?>"></i>
							<span><?php echo $row->menu?></span>
						</a>
						<?php $menu_detail = $this->db->get_where("tblmenu", array("parent" => $row->idtblmenu ))->result();?>
							<?php if($menu_detail != array()){?>
							<ul id="<?php echo $row->idtblmenu?>" class="dropdown-content dropdown-horizontal-list">
								<?php foreach ($menu_detail as $rows) { ?>
									<li><a href="<?php echo base_url().$rows->url?>" class="cyan-text"><?php echo $rows->menu?></a></li>
								<?php } ?>
							</ul>
							<?php } ?>
					</li>
				<?php } ?>

			  </ul>
			</div>
		  </nav>

	</div>
	<!-- end header nav-->
</header>
