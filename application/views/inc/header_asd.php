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
						<a href="<?php echo base_url().$row->url?>" class="cyan-text" href="#!" data-activities="<?php echo $row->idtblmenu?>">
							<i class="<?php echo $row->icon?>"></i>
							<span><?php echo $row->menu?></span>
						</a>
					</li>
				<?php } ?>
				<!-- <li>
					<a href="<?php echo base_url()?>main/tambah" class="cyan-text">
						<i class="mdi-action-dashboard"></i>
						<span>Lapor</span>
					</a>
				</li>

				<li>
					<a class="dropdown-menu cyan-text" href="#!" data-activates="Tablesdropdown">
						<i class="mdi-editor-border-all"></i>
						<span>Master<i class="mdi-navigation-arrow-drop-down right"></i></span>
					</a>
				</li>
				<li>
					<a class="dropdown-menu cyan-text" href="#!" data-activates="trdropdown">
						<i class="mdi-editor-border-all"></i>
						<span>Transaksi<i class="mdi-navigation-arrow-drop-down right"></i></span>
					</a>
				</li>
				<li>
					<a class="dropdown-menu cyan-text" href="#!" data-activates="Formsdropdown">
						<i class="mdi-editor-insert-comment"></i>
						<span>Laporan<i class="mdi-navigation-arrow-drop-down right"></i></span>
					</a>
				</li> -->
			  </ul>
			</div>
		  </nav>
			<?php $menu_detail = $this->db->get_where("tblmenu", array("parent !=" => "0" ))->result(); $x = 0; $y = 0;?>
			<!-- Tablesdropdown -->
			<?php foreach ($menu_detail as $row) {
				if($row->parent != $x){
					$x = $row->parent;
					if ($y == 0) { ?>
							<?php $y = 1; ?>
						 	<ul id="<?php echo $row->parent?>" class="dropdown-content dropdown-horizontal-list">
							<?php } ?>
							<li><a href="<?php echo base_url().$row->url?>" class="cyan-text"><?php echo $row->menu?></a></li>
			<?php	}
				}
			?>

			}
			<ul id="Tablesdropdown" class="dropdown-content dropdown-horizontal-list">
				<li><a href="<?php echo base_url()?>ms_barang" class="cyan-text">Master Barang</a></li>
				<li><a href="<?php echo base_url()?>ms_gudang" class="cyan-text">Master Gudang</a></li>
			  <li><a href="<?php echo base_url()?>ms_bencana" class="cyan-text">Master Bencana</a></li>
			  <li><a href="<?php echo base_url()?>ms_barak" class="cyan-text">Master Barak</a></li>
			  <li><a href="<?php echo base_url()?>ms_ews" class="cyan-text">Master Ews</a></li>
				<li><a href="<?php echo base_url()?>ms_instansi" class="cyan-text">Master ssb</a></li>
			  <li><a href="<?php echo base_url()?>ms_area" class="cyan-text">Master Kecamatan & Kelurahan</a></li>
			  <li><a href="<?php echo base_url()?>ms_desa" class="cyan-text">Master Desa</a></li>
			  <li><a href="<?php echo base_url()?>ms_instansi" class="cyan-text">Master Instansi</a></li>
				<li><a href="<?php echo base_url()?>ms_peralatan" class="cyan-text">Master peralatan</a></li>
				<li><a href="<?php echo base_url()?>ms_ternak" class="cyan-text">Master Ternak</a></li>
			  <li><a href="<?php echo base_url()?>ms_kk" class="cyan-text">Master Keluarga</a></li>
			  <li><a href="<?php echo base_url()?>ms_user" class="cyan-text">Master User</a></li>
			</ul>
			<ul id="trdropdown" class="dropdown-content dropdown-horizontal-list">
				<li><a href="<?php echo base_url()?>Tr_approval" class="cyan-text">Approval Kejadian</a></li>
			  <li><a href="<?php echo base_url()?>Tr_keluar_masuk" class="cyan-text">Keluar Masuk Barang</a></li>
			  <!-- <li><a href="<?php echo base_url()?>ms_barak" class="cyan-text">Master Barak</a></li>
			  <li><a href="<?php echo base_url()?>ms_barak" class="cyan-text">Master Ews</a></li>
			  <li><a href="<?php echo base_url()?>ms_barak" class="cyan-text">Master Kecamatan & Kelurahan</a></li> -->
			</ul>

			<!-- Formsdropdown -->
			<ul id="Formsdropdown" class="dropdown-content dropdown-horizontal-list">
			  <li><a href="peta_kejadian" class="cyan-text">Peta Kejadian</a></li>
				<li><a href="Laporan" class="cyan-text">Laporan Barang</a></li>
			</ul>

	</div>
	<!-- end header nav-->
</header>
