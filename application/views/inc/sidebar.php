<!-- START LEFT SIDEBAR NAV-->
<aside id="left-sidebar-nav hide-on-large-only">
    <ul id="slide-out" class="side-nav leftside-navigation ">
        <li class="user-details cyan darken-2">
            <div class="row">
                <div class="col col s4 m4 l4">
                    <img src="images/avatar.jpg" alt="" class="circle responsive-img valign profile-image">
                </div>
                <div class="col col s8 m8 l8">
                    <ul id="profile-dropdown" class="dropdown-content">
                        <li><a href="#"><i class="mdi-action-face-unlock"></i> Profile</a>
                        </li>
                        <li><a href="#"><i class="mdi-action-settings"></i> Settings</a>
                        </li>
                        <li><a href="#"><i class="mdi-communication-live-help"></i> Help</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="mdi-action-lock-outline"></i> Lock</a>
                        </li>
                        <li><a href="#"><i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                        </li>
                    </ul>
                    <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown">John Doe<i class="mdi-navigation-arrow-drop-down right"></i></a>
                    <p class="user-roal">Administrator</p>
                </div>
            </div>
        </li>

        <!-- <li class="bold"><a href="app-email.html" class="waves-effect waves-cyan"><i class="mdi-communication-email"></i> Mailbox <span class="new badge">4</span></a>
        </li>
        <li class="bold"><a href="app-calendar.html" class="waves-effect waves-cyan"><i class="mdi-editor-insert-invitation"></i> Calender</a>
        </li> -->
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <!-- <li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="mdi-action-invert-colors"></i> CSS</a>
                    <div class="collapsible-body">
                        <ul>
                            <li><a href="css-typography.html">Typography</a>
                            </li>
                            <li><a href="css-icons.html">Icons</a>
                            </li>
                            <li><a href="css-shadow.html">Shadow</a>
                            </li>
                            <li><a href="css-media.html">Media</a>
                            </li>
                            <li><a href="css-sass.html">Sass</a>
                            </li>
                        </ul>
                    </div>
                </li> -->
                <?php
                $group = $this->session->userdata("group");
                $menu = $this->db->query("SELECT a.* FROM tblmenu a
                              LEFT JOIN admin_access b ON b.idtblmenu = a.`idtblmenu`
                              WHERE a.parent = '0' AND b.`idtblgroup` = '$group' AND b.view = '1' ");?>

                <?php foreach($menu->result() as $mn){ ?>
                  <?php $menu_detail = $this->db->query("SELECT * FROM tblmenu a
                    left join admin_access b on b.idtblmenu = a.idtblmenu
                     WHERE parent = '$mn->idtblmenu' and b.idtblgroup = '$group' AND b.view = '1'");?>
                  <?php if($menu_detail->result() != array()){ ?>
                    <li class="bold"><a class="collapsible-header  waves-effect waves-cyan"><i class="<?php echo $mn->icon?>"></i> <?php echo $mn->menu?></a>
                        <div class="collapsible-body">
                            <ul>
                              <?php foreach($menu_detail->result() as $mn_det){ ?>
                                <li><a href="<?php echo base_url().$mn_det->url?>?>" class="cyan-text"><?php echo $mn_det->menu?></a></li>
                              <?php } ?>
                            </ul>
                        </div>
                    </li>
                  <?php } ?>
                <?php } ?>
    </ul>
    <!-- <a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i class="mdi-navigation-menu"></i></a> -->
</aside>
<!-- END LEFT SIDEBAR NAV-->
